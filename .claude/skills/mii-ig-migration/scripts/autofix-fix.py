#!/usr/bin/env python3
"""autofix-fix -- apply ONE allowlisted, mechanical repair for ONE verification
finding, and report exactly what it changed.

This is the hands of the bounded auto-fix loop (`autofix-loop.sh`, spec section
12). It never decides WHETHER to fix: the loop selects, snapshots and reverts.
This script plans and applies a single class, refuses anything outside it, and
prints the changed files so a reviewer can audit each edit individually.

THE ALLOWLIST IS THE WHOLE DESIGN. Not a blocklist: the default is DO NOT FIX,
and a class earns its place only by satisfying all four conditions, checked here
rather than asserted in prose:

  1. MECHANICAL      -- the repair follows from the finding with no judgement.
  2. REVERSIBLE      -- the loop snapshots every path `plan` names, and `plan`
                        is required to name them all BEFORE `apply` runs.
  3. SELF-CONFIRMING -- the very check that raised the finding clears afterwards.
                        A class whose confirming check cannot be re-run in this
                        environment is NOT applied (`--requires` says so).
  4. NON-IDENTITY, NON-NARRATIVE -- see the refusals below, which are enforced,
                        not documented.

WHY THE GUARDRAILS ASSUME THE FIXER IS WRONG. Three "high-confidence" claims in
this project shipped WRONG on a single day: that IG page titles do not localize
(they do, through an IG-level `.po`); that Simplifier is not scrapeable (the
project page is not, the guide pages are); and the shape of a guide-key
attribute, measured on one module and false on two others. Confident-and-wrong
is the NORMAL case here, not the exception. So no fix is trusted because its
author was sure: it is trusted only after the check that raised the finding has
been re-run and clears. Everything else -- the snapshot, the revert, the
three-iteration ceiling, the no-progress stop -- exists to make being wrong cheap.

REFUSED, ALWAYS, whatever a caller passes:
  * identity (`sushi-config.yaml`, `package.json`, `ig.ini`, canonical,
    packageId, version, licence, publisher) -- a mechanical edit there renames,
    relicenses or re-versions a PUBLISHED module;
  * narrative content -- a page's prose is the migration's payload. The one
    class that may touch a page file (`template-example-link`) must leave the
    file's TEXT byte-identical, and refuses if it does not;
  * anything the SOURCE declares -- a defect in the source is escalated to its
    maintainers, never patched in the migration (guardrail 3, no fabrication);
  * anything requiring a judgement call -- those are the report's decision queue.

Usage:

  autofix-fix.py classes
      Print the allowlist as TSV: class, confirming check, requires, one-line
      justification. The loop reads THIS, so the allowlist has one definition.

  autofix-fix.py plan  --class C --finding ID --findings FILE [--target DIR]
      Print, one per line, every path the fix may touch: `path` for an existing
      file, `+path` for one it would create. The loop snapshots these BEFORE the
      fix runs; a path the plan does not name cannot be reverted, so `apply`
      refuses to write outside the plan.

  autofix-fix.py apply --class C --finding ID --findings FILE [--target DIR]
                       [--skill-dir DIR] [--seed FILE] [--template-src DIR]
                       [--allow-network] [--dry-run]
      Apply it. Prints run-log lines and a `changed=` list; exits 0 when it
      changed something, 3 when there was nothing to change, 1 on refusal or
      failure (nothing written).

Exit codes: 0 changed · 1 refused/failed · 2 setup error · 3 nothing to change.

stdlib only.
"""

from __future__ import annotations

import argparse
import glob
import os
import re
import shutil
import subprocess
import sys
import time
import xml.etree.ElementTree as ET

STEP = "12"
ACTION = "autofix-fix"
_LEVEL = {"INFO": "INFO ", "WARN": "WARN ", "ERROR": "ERROR"}
WRAPPED = os.environ.get("MIGRATION_LOG_WRAPPED") == "1"

# Paths no fix may write to, ever. Enforced in `_guard`, not just documented:
# the loop is the thing most likely to be running unattended.
FORBIDDEN = (
    "sushi-config.yaml", "package.json", "ig.ini", "ig.json",
    "LICENSE", "LICENSE.md", "NOTICE",
)

# class -> (confirming check, requires, justification)
ALLOWLIST = {
    "gofsh-residue": (
        "F4",
        "-",
        "Two shapes goFSH leaves behind that SUSHI cannot parse; repaired by the "
        "skill's own postprocess-gofsh.py, which classifies every occurrence before "
        "writing anything, refuses a shape it does not model, and is idempotent."),
    "template-example-link": (
        "R4",
        "-",
        "A link to the TEMPLATE's example artefacts, which step 3 deletes. It cannot "
        "be the module's own narrative: the module's text predates the template and "
        "cannot reference its examples. The fix removes the link, never the text, and "
        "refuses unless the file's text is byte-identical afterwards."),
    "po-missing-unit": (
        "R5",
        "-",
        "A page-title unit missing for a page that EXISTS in the pages tree. The unit "
        "is added with an EMPTY msgstr -- a missing translation is made visible, never "
        "invented (guardrail 3)."),
    "revendor-template": (
        "P1/P2",
        "rebuild",
        "A stale vendored template, re-vendored at the ref the run RECORDED. Only "
        "auto-fixable where a rebuild can run: the confirming check reads the RENDERED "
        "output, so without a rebuild nothing can confirm it and the fix is not applied."),
}


def log(level, detail, cont=()):
    stream = sys.stderr if level == "ERROR" else sys.stdout
    ts = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
    print("%s  %s  %s  %s  %s" % (ts, _LEVEL[level], STEP, ACTION, detail),
          file=stream, flush=True)
    for c in cont:
        print("    %s" % c, file=stream, flush=True)


def read_findings(path):
    try:
        with open(path, encoding="utf-8") as fh:
            lines = fh.read().splitlines()
    except OSError:
        return None
    if not lines:
        return []
    header = lines[0].split("\t")
    return [dict(zip(header, ln.split("\t"))) for ln in lines[1:] if ln.strip()]


def _guard(target, paths):
    """Refuse the forbidden paths. Returns a reason, or None when the set is clean."""
    for p in paths:
        rel = os.path.relpath(os.path.abspath(p), target)
        if rel.startswith(".."):
            return "outside the target tree: %s" % rel
        if os.path.basename(rel) in FORBIDDEN:
            return "identity file: %s" % rel
    return None


def read_template_artifact_tokens(path):
    """The template-example tokens, from references/template-artifacts.tsv.

    THE SAME FILE `verify-migration.py` READS FOR R4. The token used to be a bare
    inline literal in both programs, so a template that renamed its example would
    have left the check and the fixer disagreeing about what a template example
    is -- and this fixer would have gone on stripping links the check no longer
    raises. Returns None when the manifest cannot be read; the caller then
    REFUSES rather than falling back to a hard-coded guess.
    """
    try:
        with open(path, encoding="utf-8") as fh:
            lines = fh.read().splitlines()
    except OSError:
        return None
    out = []
    for line in lines:
        if not line.strip() or line.startswith("#"):
            continue
        cols = [c.strip() for c in line.split("\t")]
        if len(cols) < 4 or cols[0] == "token":
            continue
        out.append(cols[0])
    return out or None


def _text_only(md):
    """The prose of a Markdown/HTML file with link TARGETS removed.

    The invariant the one page-touching class must preserve: remove the target,
    keep every character of the text. Comparing this before and after is what
    turns "I only removed a link" from a claim into a check.
    """
    out = re.sub(r"!?\[([^\[\]]*)\]\([^()]*\)", r"\1", md)
    out = re.sub(r"<a\b[^>]*>(.*?)</a>", r"\1", out, flags=re.S | re.I)
    out = re.sub(r'href="[^"]*"', "", out)
    return re.sub(r"\s+", " ", out).strip()


# --- the classes ------------------------------------------------------------

def paths_gofsh_residue(target, finding):
    return sorted(glob.glob(os.path.join(target, "input", "fsh", "**", "*.fsh"),
                            recursive=True))


def fix_gofsh_residue(target, finding, args):
    """Delegate to the skill's own repairer. It is the tool the finding names,
    it has been measured (41 -> 5 SUSHI errors on the reference module), and
    re-implementing its classification here would be a second, unmeasured
    implementation of the same rules."""
    script = os.path.join(args.skill_dir, "scripts", "postprocess-gofsh.py")
    if not os.path.isfile(script):
        return None, "postprocess-gofsh.py not found at %s" % script
    fshdir = os.path.join(target, "input", "fsh")
    cmd = [sys.executable, script, fshdir]
    gofsh_log = os.path.join(target, "migration-log", "gofsh.log")
    if os.path.isfile(gofsh_log):
        cmd += ["--gofsh-log", gofsh_log]
    if args.dry_run:
        cmd += ["--dry-run"]
    before = {p: _read(p) for p in paths_gofsh_residue(target, finding)}
    proc = subprocess.run(cmd, capture_output=True, text=True)
    for line in (proc.stdout or "").splitlines():
        print("    %s" % line, flush=True)
    if proc.returncode != 0:
        return None, "postprocess-gofsh.py exited %d (it refuses rather than guessing " \
                     "on a shape it does not model)" % proc.returncode
    changed = [os.path.relpath(p, target) for p, txt in before.items() if _read(p) != txt]
    return changed, None


def paths_template_example_link(target, finding):
    subject = finding.get("subject", "")
    rel = subject.split(" -> ")[0].strip()
    p = os.path.join(target, rel)
    return [p] if os.path.isfile(p) else []


def fix_template_example_link(target, finding, args):
    paths = paths_template_example_link(target, finding)
    if not paths:
        return None, "the file named by the finding does not exist: %s" % finding.get("subject")
    path = paths[0]
    src = _read(path)
    if src is None:
        return None, "cannot read %s" % path
    tokens = read_template_artifact_tokens(args.template_artifacts)
    if not tokens:
        return None, ("REFUSED: no template-artifacts manifest at %s. The tokens that define "
                      "a template example live in ONE file shared with the R4 check; without "
                      "it this fixer would be guessing" % args.template_artifacts)
    if path.endswith(".xml"):
        out, err = _strip_menu_entry(src, tokens)
        if err:
            return None, err
    else:
        # Markdown/HTML: unwrap the anchor, keep every character of its text.
        out = src
        for token in tokens:
            tok = re.escape(token)
            out = re.sub(r"\[([^\[\]]*)\]\(([^()]*%s[^()]*)\)" % tok, r"\1", out)
            out = re.sub(r'<a\b[^>]*href="[^"]*%s[^"]*"[^>]*>(.*?)</a>' % tok,
                         r"\1", out, flags=re.S | re.I)
    if out == src:
        return [], None
    if not path.endswith(".xml") and _text_only(src) != _text_only(out):
        return None, ("REFUSED: the edit would change the page's text, not only its link "
                      "targets. That is narrative content and is never auto-fixed")
    if not args.dry_run:
        _write(path, out)
    return [os.path.relpath(path, target)], None


def _strip_menu_entry(src, tokens):
    """Drop the menu <li> whose link targets a deleted template example.

    A menu entry pointing at a page that does not exist is a dead entry, and
    leaving its label behind without a target would be worse than removing it.
    The postcondition is that the result still parses as XML -- a menu the
    publisher cannot read fails the build, which is not an improvement.

    `tokens` comes from references/template-artifacts.tsv, never from a literal
    here: see `read_template_artifact_tokens`.
    """
    out = src
    for token in tokens:
        out = re.sub(r"(?is)[ \t]*<li>(?:(?!</li>).)*%s(?:(?!</li>).)*</li>[ \t]*\r?\n?"
                     % re.escape(token), "", out)
    if out == src:
        return src, None
    try:
        ET.fromstring(out)
    except ET.ParseError as exc:
        return src, "REFUSED: removing the entry leaves unparseable XML (%s)" % exc
    return out, None


def paths_po_missing_unit(target, finding):
    subject = finding.get("subject", "")
    rel = subject.split(" [")[0].strip()
    p = os.path.join(target, rel)
    return [p] if os.path.isfile(p) else ["+" + p]


def fix_po_missing_unit(target, finding, args):
    """Regenerate the catalogue with the skill's generator, which is
    non-destructive: existing units and their translations are carried over and
    a missing one arrives with an EMPTY msgstr."""
    script = os.path.join(args.skill_dir, "scripts", "gen-page-title-po.py")
    if not os.path.isfile(script):
        return None, "gen-page-title-po.py not found at %s" % script
    rel = finding.get("subject", "").split(" [")[0].strip()
    po = os.path.join(target, rel)
    lang = os.path.basename(os.path.dirname(po))
    ig = sorted(glob.glob(os.path.join(target, "fsh-generated", "resources",
                                       "ImplementationGuide-*.json")))
    if not ig:
        return None, "no generated ImplementationGuide resource to read titles from"
    seed = args.seed or os.path.join(target, "migration-log", "menu-titles-%s.txt" % lang)
    seed_arg = seed if os.path.isfile(seed) else "-"
    before = _read(po)
    if args.dry_run:
        log("INFO", "dry-run: would run %s %s %s %s %s"
            % (os.path.basename(script), ig[0], seed_arg, lang, po))
        return [], None
    proc = subprocess.run([sys.executable, script, ig[0], seed_arg, lang, po],
                          capture_output=True, text=True)
    for line in (proc.stdout or "").splitlines():
        print("    %s" % line, flush=True)
    # ITS EXIT 1 IS "WRITTEN, WITH UNTRANSLATED UNITS" -- the documented, expected
    # outcome of adding a unit nobody has translated yet, and precisely what this
    # class is for. Reading it as a failure reverted a correct fix on the first
    # real run of this loop. Only 2 (setup error, nothing written) is a failure.
    if proc.returncode == 2:
        return None, "gen-page-title-po.py exited 2 (setup error; nothing written)"
    if proc.returncode not in (0, 1):
        return None, "gen-page-title-po.py exited %d" % proc.returncode
    return ([os.path.relpath(po, target)] if _read(po) != before else []), None


def paths_revendor_template(target, finding):
    d = os.path.join(target, "ig-template")
    return [d] if os.path.isdir(d) else ["+" + d]


def fix_revendor_template(target, finding, args):
    """Re-vendor at the ref the RUN RECORDED -- never at a floating branch.

    The ref comes from the run log's `skeleton-vendored … ref=` line, which is
    the same value the provenance check reads. Taking it from anywhere else
    would make the fix and its confirming check disagree about what "the
    template" means.
    """
    ref = args.ref
    if not ref:
        return None, "no template ref recorded; nothing to re-vendor AT (P2 says so too)"
    dest = os.path.join(target, "ig-template")
    if args.template_src:
        src = os.path.join(args.template_src, "ig-template")
        if not os.path.isdir(src):
            return None, "--template-src has no ig-template/ directory"
    elif args.allow_network:
        tmp = os.path.join(target, "migration-log", "autofix", "template-%s" % ref)
        shutil.rmtree(tmp, ignore_errors=True)
        proc = subprocess.run(
            ["git", "clone", "--depth", "1", "--single-branch", "--branch", ref,
             args.template_repo, tmp], capture_output=True, text=True)
        if proc.returncode != 0:
            return None, "git clone at %s failed: %s" % (ref, (proc.stderr or "").strip()[:200])
        src = os.path.join(tmp, "ig-template")
    else:
        return None, ("no --template-src and no --allow-network: this fix would have to "
                      "fetch, and fetching on the loop's initiative is not a default")
    if args.dry_run:
        return [], None
    shutil.rmtree(dest, ignore_errors=True)
    shutil.copytree(src, dest)
    return ["ig-template/"], None


CLASSES = {
    "gofsh-residue": (paths_gofsh_residue, fix_gofsh_residue),
    "template-example-link": (paths_template_example_link, fix_template_example_link),
    "po-missing-unit": (paths_po_missing_unit, fix_po_missing_unit),
    "revendor-template": (paths_revendor_template, fix_revendor_template),
}


def _read(path):
    try:
        with open(path, encoding="utf-8") as fh:
            return fh.read()
    except OSError:
        return None


def _write(path, text):
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(text)


# --- CLI --------------------------------------------------------------------

def main(argv):
    here = os.path.dirname(os.path.abspath(__file__))
    p = argparse.ArgumentParser(add_help=False)
    p.add_argument("subcommand", nargs="?", choices=("classes", "plan", "apply"))
    p.add_argument("--class", dest="klass")
    p.add_argument("--finding")
    p.add_argument("--findings")
    p.add_argument("--target", default=".")
    p.add_argument("--skill-dir", dest="skill_dir", default=os.path.dirname(here))
    p.add_argument("--seed")
    p.add_argument("--ref")
    p.add_argument("--template-src", dest="template_src")
    p.add_argument("--template-artifacts", dest="template_artifacts",
                   default=os.path.join(os.path.dirname(here), "references",
                                        "template-artifacts.tsv"))
    p.add_argument("--template-repo", dest="template_repo",
                   default="https://github.com/forschungsgruppe-digital-health/"
                           "mii-kds-module-template.git")
    p.add_argument("--allow-network", dest="allow_network", action="store_true")
    p.add_argument("--dry-run", dest="dry_run", action="store_true")
    p.add_argument("-h", "--help", action="store_true")
    a = p.parse_args(argv)
    if a.help or not a.subcommand:
        print(__doc__)
        return 0 if a.help else 2

    if a.subcommand == "classes":
        print("class\tconfirming_check\trequires\tjustification")
        for name in sorted(ALLOWLIST):
            check, requires, why = ALLOWLIST[name]
            print("%s\t%s\t%s\t%s" % (name, check, requires, why))
        return 0

    target = os.path.abspath(a.target)
    if a.klass not in CLASSES:
        log("ERROR", "setup: --class must be one of %s  got=%s exit=2"
            % (",".join(sorted(CLASSES)), a.klass))
        return 2
    if not a.findings or not a.finding:
        log("ERROR", "setup: --findings FILE and --finding ID are both required  exit=2")
        return 2
    rows = read_findings(a.findings)
    if rows is None:
        log("ERROR", "setup: cannot read %s  exit=2" % a.findings)
        return 2
    match = [r for r in rows if r.get("id") == a.finding]
    if not match:
        log("ERROR", "setup: no finding %s in %s  exit=2" % (a.finding, a.findings))
        return 2
    finding = match[0]
    if finding.get("autofix") != a.klass:
        log("ERROR", "REFUSED: finding %s is class %s, not %s  exit=1"
            % (a.finding, finding.get("autofix"), a.klass))
        return 1

    planner, fixer = CLASSES[a.klass]
    planned = planner(target, finding)

    if a.subcommand == "plan":
        for path in planned:
            bare = path[1:] if path.startswith("+") else path
            print("%s%s" % ("+" if path.startswith("+") else "",
                            os.path.relpath(bare, target)))
        return 0

    reason = _guard(target, [p[1:] if p.startswith("+") else p for p in planned])
    if reason:
        log("ERROR", "REFUSED: %s  class=%s finding=%s exit=1" % (reason, a.klass, a.finding),
            ["The allowlist bounds WHAT may be fixed; this bounds WHERE. Both have to",
             "hold, because a class is only as safe as the paths it actually writes."])
        return 1

    log("INFO", "%s  class=%s finding=%s check=%s planned_paths=%d dry_run=%s"
        % ("params" if WRAPPED else "start", a.klass, a.finding,
           ALLOWLIST[a.klass][0], len(planned), a.dry_run))
    changed, err = fixer(target, finding, a)
    if err:
        log("ERROR", "autofix-refused: %s  class=%s finding=%s exit=1"
            % (err, a.klass, a.finding),
            ["Nothing was written. The finding goes to the report's decision queue."])
        return 1
    if not changed:
        log("INFO", "%s  class=%s finding=%s changed=0 exit=3"
            % ("result" if WRAPPED else "done", a.klass, a.finding),
            ["Nothing to change -- the finding does not describe this tree any more.",
             "Re-run verification before concluding anything from that."])
        return 3
    log("INFO", "%s  class=%s finding=%s changed=%d files=%s exit=0"
        % ("result" if WRAPPED else "done", a.klass, a.finding, len(changed),
           ",".join(changed[:10]) + (" …" if len(changed) > 10 else "")),
        ["Why this class is auto-fixable: %s" % ALLOWLIST[a.klass][2],
         "It counts as fixed only if check %s clears on the next verification run;"
         % ALLOWLIST[a.klass][0],
         "if it does not, the loop REVERTS this change and escalates the finding."])
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
