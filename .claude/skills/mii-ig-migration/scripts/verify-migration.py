#!/usr/bin/env python3
"""verify-migration -- the migration's VERIFICATION PHASE: four mechanical layers
plus the run log as a second oracle, one verdict per check, and an exit status.

WHY THIS EXISTS. Until now `SKILL.md`'s *Verification* section was a list of
sentences a human was asked to perform: "every placeholder accounted for", "the
German pages render", "every step appears in the log". Four real migrations
(Dokument, Person, Consent, Labor) shipped with a GREEN build and a signed-off
prose checklist, and every one of the following defects survived it -- because a
passing build does not surface any of them and a human reading a checklist does
not either:

  * UNREACHABLE CONTENT. An artefact page a rendered variant's `artifacts.html`
    does not list. The artifact SET comparison passes: the artefacts are all
    present. Reachable from the index is a different property and was checked by
    nothing. (Measured 2026-08-07: none of the four migrations exhibits it --
    every per-language index lists every generated artefact, Consent's six
    SearchParameters included. C2's negative control fires when one link is
    removed. See `variant_dirs`: reading the multi-language build's ROOT as a
    variant produced the opposite conclusion on all four, as a BLOCKER.)
  * STALE PROVENANCE. A rendered IG whose header reports one template version
    while the tree carries another -- the same class as a published `demo/v0.5.1`
    directory whose pages read "Preview v0.5.0". Nothing compared the RENDERED
    output against the tree it was supposedly built from.
  * A RENDERED METADATA DEFECT. Dokument renders `Unknown region code '276'` in
    its page header (measured 2026-08-06 on the published preview,
    `<div id="ig-status">`). qa.txt reports zero errors for it.
  * SILENT TRUNCATION. An FSH parse error stopped SUSHI reading a file while it
    still EXPORTED the instance: nested provisions 1/1/1 before repair, 6/27/3
    after, zero errors reported for those files.
  * SILENT PARTIAL CONVERSION. goFSH exits 0 reporting "0 Errors" having
    converted 1 of 20 inputs when `-t json-and-xml` is omitted.
  * A WRONG DEPENDENCY PIN. A run resolved a parent from `dist-tags.latest`
    (2.0.3) where the source package pinned 2.0.2.
  * SILENT RELICENSING. The template ships `license: CC-BY-4.0` as a LITERAL
    that no placeholder check flags, while the module is CC0-1.0.

Each of those is mechanically detectable. So this script detects them, reports
each as a finding with its evidence, and EXITS NON-ZERO. A verification step that
cannot fail is decoration.

THE THREE VERDICTS. Two would be a lie. A check that genuinely cannot be
mechanised here must not be silently written as a pass:

  IDENTISCH      the check ran and the target matches its reference.
  DIVERGIERT     the check ran and found a divergence, NAMED, with evidence.
  NICHT PRUEFBAR the check could not run -- an input is absent, or the property
                 is a human judgement. It carries the exact reason and the exact
                 human action, and it is NOT a pass: the exit status distinguishes
                 it (3) from a clean run (0).

TWO ORACLES, AND WHY. The run log records what each step INTENDED AND MEASURED;
the target tree records the OUTCOME. Defects live in the gap between them, and
neither source reveals them alone: a log saying "converted 20 of 20" beside a
tree holding 19 resources is a finding that the log alone (all green) and the
tree alone (19 files, no reference point) both miss. So the layers below read the
source-versus-target comparison AND `migration-log/run.log`, and cross-check the
two -- conversion counts, page counts, artifact counts.

THE LAYERS

  1 CONSERVATION -- every source artefact present AND REACHABLE from the artifact
    index; every source guide page migrated (naming the target page), retired
    (with a reason) or MISSING (a failure); every source narrative text run
    present somewhere in the target; every menu entry leading somewhere and every
    narrative page IN a menu; every target page traceable to a source page or to
    the template; for text that survived, WHICH page it landed on; and, for text
    the migration WROTE rather than carried, that the guide SAYS SO where it
    stands (the DERIVED markers, spec section 9d).
  2 FIDELITY -- identity IDENTISCH; dependency pins identical to the source's;
    `license` explicitly asserted from a source tier, never silently defaulted.
  3 PROVENANCE -- the template package+version READ OUT OF THE RENDERED OUTPUT
    against the tree it was built from and against the latest release; the IG
    Publisher version; the pinned source-guide version.
  4 RENDERING INTEGRITY -- tables, structure views, tabs and images non-empty in
    the target where non-empty in the source; header/footer metadata sane;
    language parity (the translated variant actually translated, not a
    default-language fallback).
  L THE RUN LOG AS A SECOND ORACLE -- an emitted-and-never-actioned
    `silent-partial-success:` WARN; a step that emitted NO line at all (a step
    that did not run is invisible otherwise); an `identity-contradiction:` still
    open; and the log-versus-artefact cross-checks.

ONE MEASURED TRAP, ENCODED (spec section 11.3). The ig-template PACKAGE version
and the module-template REPO release are DIFFERENT NUMBERS. Measured 2026-08-06:
repo tag `v0.6.0` vendors `ig-template/package/package.json` version `0.5.1`, and
repo tag `v0.5.1` vendors `0.3.0`. A check that compares the rendered
`Templates: de.medizininformatikinitiative.template#0.5.1` against the repo's
latest release `v0.6.0` therefore reports a confident, WRONG finding. P1 compares
the rendered value against the VENDORED PACKAGE (like with like) and P2 compares
the vendored REPO REF against the latest release -- two checks, two references.

FALSE POSITIVES ARE WORSE THAN NO CHECK, because a verification phase that cries
wolf gets skipped. Where a property could plausibly be legitimate, this script
reports NICHT PRUEFBAR or an INFO note rather than a divergence, and every
finding carries the evidence needed to dismiss it in one look.

Usage:

  verify-migration.py --target DIR [options]

    --target DIR          the migrated module repository (default: `.`)
    --source DIR          the UNMIGRATED source tree. Without it the checks that
                          need a reference report NICHT PRUEFBAR, never a pass.
    --rendered DIR        the built site (default: <target>/output). Its per-
                          language variant directories are discovered by looking
                          for `artifacts.html`.
    --log FILE            the run log (default: <target>/migration-log/run.log)
    --harvest-tsv FILE    guide-harvest manifest (default: migration-log/guide-harvest.tsv)
    --harvest-dir DIR     harvested Markdown (default: migration-log/guide-harvest/pagecontent)
    --source-html DIR     harvested source HTML, for the comparative render checks
                          (default: migration-log/guide-harvest/html)
    --page-map FILE       source page -> target page contract, TSV, GENERATED by
                          page-structure-advice.py --map (run-log 5.4c) and
                          human-reviewed - never hand-written
                          (default: migration-log/page-map.tsv). Columns read:
                          source_page, target_page (or RETIRED), reason.
    --derived-tsv FILE    the DERIVED-marker ledger, TSV, written by
                          `scripts/derived-scan.py` (default:
                          migration-log/derived-content.tsv). Columns:
                          page, lang, kind, source, gate, line, excerpt. C7 READS
                          it; this script never scans the pages itself, so one
                          scanner defines what a marker is.
    --source-lang LANG    the language the source narrative is written in
                          (default: de) -- the text-run check compares against
                          the target pages in THAT language, because the other
                          language is a translation and would never match.
    --source-guide-tree D directory name under <source>/implementation-guides/
                          to treat as the AUTHORITATIVE guide tree. Without it
                          the tree is chosen by the same rule the advice script
                          applies: highest version substring in the directory
                          name among the trees in the source language,
                          guide.yaml `version:` as the tiebreak. The source
                          page set for the conservation checks is the UNION of
                          the harvested Markdown, the source's own
                          input/pagecontent, and that tree -- one stub page
                          must never suppress a 149-page guide tree.
    --template-latest V   the module template's latest RELEASE tag, e.g. v0.10.3.
                          Absent -> P2 is NICHT PRUEFBAR, never a pass.
    --publisher-pin V     the IG Publisher version pinned in the target's build
                          workflow. Absent -> read from the workflow if findable.
    --expected-steps FILE the step manifest (default: the skill's
                          references/expected-steps.tsv)
    --template-pages FILE the template's OWN narrative pages, so C5 can tell a
                          template scaffold from a page invented during the
                          migration (default: the skill's
                          references/template-pages.tsv)
    --shape A|B           source shape; inferred from the log when omitted.
    --layers LIST         comma-separated subset of
                          conservation,fidelity,provenance,rendering,log
    --findings FILE       findings TSV  (default: migration-log/verification-findings.tsv)
    --markdown FILE       report block  (default: migration-log/verification.md)
    --max-list N          how many subjects a WARN names inline (default 3)
    -h, --help            print this text and exit 0

Exit codes:
    0  every check IDENTISCH
    1  at least one DIVERGIERT
    2  setup error (nothing written)
    3  no divergence, but at least one NICHT PRUEFBAR -- verification INCOMPLETE,
       which is not the same as passed and must not be reported as one

Run-log lines (spec section 10.2) go to stdout, so this script is wrapped as
`bash "$ML" run 11 verify-migration --emits-runlog -- python3 .../verify-migration.py …`.

stdlib only, like the rest of the catalog's scripts.
"""

from __future__ import annotations

import argparse
import glob
import hashlib
import json
import os
import re
import sys
import time

# --- run-log convention (spec section 10) -----------------------------------
STEP = "11"          # SKILL.md step 7b
ACTION = "verify-migration"
_LEVEL = {"INFO": "INFO ", "WARN": "WARN ", "ERROR": "ERROR"}

# `migration-log.sh run` exports this; wrapped, our own opening/closing lines
# become `params`/`result` so one execution yields one `start` and one `done`.
WRAPPED = os.environ.get("MIGRATION_LOG_WRAPPED") == "1"
OPEN_WORD = "params" if WRAPPED else "start"
CLOSE_WORD = "result" if WRAPPED else "done"

IDENT = "IDENTISCH"
DIVERG = "DIVERGIERT"
UNMECH = "NICHT PRUEFBAR"   # ASCII in the machine-readable column; the report
                            # template prints it as "NICHT PRÜFBAR".

LAYERS = ("conservation", "fidelity", "provenance", "rendering", "log")

# What each check asks, in words a first-time IG author can act on. The codes
# alone are unreadable to the people who have to WORK the findings: the
# generated table printed "C4 | 10 | 28 | 0" and a reviewer had no way to learn
# that C4 is about narrative text (measured on the PROs try-run review). Kept
# here, beside the layer list, so the emitter and the report cannot drift.
CHECK_TITLES = {
    "C1": "every source artefact still exists in the migrated module",
    "C2": "every artefact is reachable from the rendered Artifacts page",
    "C3": "every source guide page was migrated or explicitly retired",
    "C4": "the source's narrative text is present somewhere in the target",
    "C5": "menus lead somewhere, and every page is in a menu",
    "C6": "each text passage landed on the page the page map promised",
    "C7": "content the migration wrote is marked as such in the guide",
    "F1": "module identity is unchanged (id, canonical, version, licence, ...)",
    "F2": "dependency versions are pinned exactly as the source pinned them",
    "F3": "the licence is asserted from evidence, never defaulted",
    "F4": "no mechanical FSH conversion residue is left",
    "P1": "the rendered site reports the template package it was built with",
    "P2": "the vendored template ref matches what the run log recorded",
    "P3": "the IG Publisher version matches the workflow pin",
    "P4": "the source guide was pinned to a published version, not 'current'",
    "P5": "ig.ini points at the IG resource the build actually writes",
    "R1": "tables, tabs and images render with content, not empty",
    "R2": "page header and footer metadata render correctly",
    "R3": "a translated page really differs from the default language",
    "R4": "no links point at template example artefacts that were deleted",
    "R5": "every page has a title unit in the translation catalogue",
    "L0": "a run log exists at all",
    "L1": "every partial-success warning was acted on",
    "L2": "every expected step actually wrote a log line",
    "L3": "no identity contradiction is still open",
    "L4": "the log's counts agree with what the tree holds",
}


def log(level, detail, cont=(), step=STEP, action=ACTION):
    """One run-log line plus indented continuations, flushed immediately.

    The flush is not a nicety: stdout is block-buffered when it is a pipe while
    stderr is not, so without it an ERROR written last surfaces FIRST in the
    captured log (measured on this skill's other scripts).
    """
    stream = sys.stderr if level == "ERROR" else sys.stdout
    ts = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
    print("%s  %s  %s  %s  %s" % (ts, _LEVEL[level], step, action, detail),
          file=stream, flush=True)
    for c in cont:
        print("    %s" % c, file=stream, flush=True)


# --- findings ---------------------------------------------------------------

class Findings:
    """The findings table. One row per CHECKED SUBJECT, never one per opinion.

    `id` is a hash of (check, subject) and therefore STABLE ACROSS RUNS. The
    auto-fix loop needs exactly that: "did the finding this fix targeted clear?"
    is only answerable when the finding keeps its identity between two runs of
    this script. A sequence number would silently renumber on the next run and
    the loop would revert the wrong fix.
    """

    COLUMNS = ("id", "layer", "check", "verdict", "subject", "evidence",
               "autofix", "action")

    def __init__(self):
        self.rows = []

    def add(self, layer, check, verdict, subject, evidence, autofix="-", action="-"):
        fid = "%s-%s" % (check, hashlib.sha1(
            ("%s\t%s" % (check, subject)).encode("utf-8")).hexdigest()[:6])
        # Two rows sharing an id would make "did the finding this fix targeted
        # clear?" unanswerable, so a second row on the same subject is
        # disambiguated by its evidence -- still deterministic, still stable
        # across runs as long as the evidence is.
        if any(r["id"] == fid and r["evidence"] == _clean(evidence) for r in self.rows):
            return fid                        # the same finding twice is one finding
        if any(r["id"] == fid for r in self.rows):
            fid = "%s-%s" % (check, hashlib.sha1(
                ("%s\t%s\t%s" % (check, subject, evidence)).encode("utf-8")).hexdigest()[:6])
        self.rows.append({
            "id": fid, "layer": layer, "check": check, "verdict": verdict,
            "subject": _clean(subject), "evidence": _clean(evidence),
            "autofix": autofix, "action": _clean(action)})
        return fid

    def ok(self, layer, check, subject, evidence):
        return self.add(layer, check, IDENT, subject, evidence)

    def diverges(self, layer, check, subject, evidence, autofix="-", action="-"):
        return self.add(layer, check, DIVERG, subject, evidence, autofix, action)

    def unmechanisable(self, layer, check, subject, reason, action):
        return self.add(layer, check, UNMECH, subject, reason, "-", action)

    def by_verdict(self, verdict):
        return [r for r in self.rows if r["verdict"] == verdict]

    def checks(self):
        seen = []
        for r in self.rows:
            if r["check"] not in seen:
                seen.append(r["check"])
        return seen


def _clean(s):
    """TSV-safe: tabs and newlines are the only characters the format cannot
    carry, so they are folded rather than allowed to corrupt a row silently."""
    return re.sub(r"[\t\r\n]+", " ", str(s)).strip()


# --- small readers ----------------------------------------------------------

def read_text(path):
    try:
        with open(path, encoding="utf-8", errors="replace") as fh:
            return fh.read()
    except OSError:
        return None


def read_json(path):
    txt = read_text(path)
    if txt is None:
        return None
    try:
        return json.loads(txt)
    except ValueError:
        return None


def yaml_scalar(text, key):
    """A top-level `key: value` out of a sushi-config. Deliberately NOT a YAML parser.

    The catalog's scripts are stdlib-only and PyYAML is not stdlib. Every value
    this script reads out of a sushi-config is a top-level scalar written on one
    line, which this handles exactly; anything nested (`publisher:` as a block)
    is read by its own regex below. A value that cannot be read this way returns
    None and the check reports NICHT PRUEFBAR rather than guessing.
    """
    if not text:
        return None
    m = re.search(r"^%s:[ \t]*(?:#.*)?$" % re.escape(key), text, re.M)
    if m:                                   # key with a nested block, no scalar
        return None
    m = re.search(r"^%s:[ \t]*(.+?)[ \t]*(?:#.*)?$" % re.escape(key), text, re.M)
    if not m:
        return None
    val = m.group(1).strip().strip('"').strip("'")
    return val or None


def yaml_dependencies(text):
    """The `dependencies:` block as {package: version} -- or None when the
    config has NO such block at all.

    None vs {} is load-bearing: {} means the block EXISTS but yielded no
    parseable entry, which is a parser finding, never evidence of a
    dependency-free source (F2 must not storm ABSENT divergences off it --
    the silent-mangle class confirmed on the PROs module, 2026-08-20).

    Two shapes occur in real MII configs and both are handled:
        dependencies:
          de.basisprofil.r4: 1.5.0
        dependencies:
          hl7.fhir.uv.extensions.r4:
            id: ext
            version: 5.2.0
    Only a nested `version:` is a pin; `id:`/`uri:`/`reason:` sub-keys are not
    packages. Entry indentation is taken from the FIRST entry seen, not
    hard-coded at two spaces -- a three-space config previously lost every
    entry without a line of protest. A trailing comment on the block key
    (`dependencies: # note`) is valid YAML and must not hide the block.
    """
    if not text:
        return None
    m = re.search(r"^dependencies:[ \t]*(?:#.*)?$", text, re.M)
    if not m:
        return None
    out, cur, entry_indent = {}, None, None
    for line in text[m.end():].splitlines():
        if re.match(r"^\S", line):
            break
        if not line.strip() or line.strip().startswith("#"):
            continue
        m2 = re.match(r"^([ \t]+)([A-Za-z0-9._-]+):[ \t]*([^#\n]*?)[ \t]*(?:#.*)?$", line)
        if not m2:
            continue
        ind = len(m2.group(1).expandtabs(2))
        key, val = m2.group(2), m2.group(3).strip().strip('"').strip("'")
        if entry_indent is None:
            entry_indent = ind
        if ind <= entry_indent:
            cur = key
            if val:
                out[cur] = val
        elif key == "version" and cur:
            out[cur] = val
    return out


def yaml_publisher(text):
    if not text:
        return None
    m = re.search(r"^publisher:\s*(?:#.*)?\n\s+name:\s*\"?([^\"#\n]+)", text, re.M)
    if m:
        return m.group(1).strip()
    return yaml_scalar(text, "publisher")


# --- HTML helpers -----------------------------------------------------------

TAGS = re.compile(r"(?s)<[^>]+>")
SCRIPTS = re.compile(r"(?s)<(script|style)\b.*?</\1>")
ALNUM = re.compile(r"[^0-9A-Za-zÀ-ÿ]+")


def html_text(html):
    return re.sub(r"\s+", " ", TAGS.sub(" ", SCRIPTS.sub(" ", html))).strip()


def reduce_text(s):
    """Letters and digits only, lowercased.

    The SAME normalisation `guide-page-to-md.py` uses for its `missing_runs=`
    count, so the two numbers are comparable: that script measures what the
    harvest lost, this one measures what the MIGRATION lost, and a reader
    comparing them must not be comparing two different definitions.
    """
    return ALNUM.sub("", s).lower()


def div_region_span(html, marker):
    """(start, end) of the <div> whose opening tag carries `marker`, or None.

    Found by DEPTH-SCANNING div tags: a regex to the next `</div>` truncates at
    the first NESTED one -- the defect `guide-harvest.sh` documents for the
    Simplifier content region -- and a truncated header region is exactly where a
    header defect hides.
    """
    i = html.find(marker)
    if i < 0:
        return None
    start = html.rfind("<div", 0, i)
    if start < 0:
        return None
    depth = 0
    for m in re.finditer(r"<div\b|</div>", html[start:]):
        depth += 1 if m.group(0).startswith("<div") else -1
        if depth == 0:
            return start, start + m.end()
    return start, len(html)


def div_region(html, marker):
    """The text of that <div>."""
    span = div_region_span(html, marker)
    return html[span[0]:span[1]] if span else None


# --- artefact collection ----------------------------------------------------

FHIR_XML_NS = "http://hl7.org/fhir"


# The IG resource is the guide, not one of its artefacts: it is regenerated on
# every build with the id the template decides, it has no artifacts.html row and
# the publisher renders no `ImplementationGuide-<id>.html` page for it. Counting
# it produced a guaranteed false finding in both C1 and C2 -- measured on the
# fixture built from a real rendered site.
NON_ARTEFACT_TYPES = ("ImplementationGuide",)


def collect_generated(root):
    """{Type/id: url} from `fsh-generated/resources/*.json`, artefacts only."""
    out = {}
    for path in sorted(glob.glob(os.path.join(root, "fsh-generated", "resources", "*.json"))):
        data = read_json(path)
        if not isinstance(data, dict):
            continue
        rt, rid = data.get("resourceType"), data.get("id")
        if rt and rid and rt not in NON_ARTEFACT_TYPES:
            out["%s/%s" % (rt, rid)] = data.get("url") or ""
    return out


def collect_source_artifacts(root):
    """{Type/id: url} for a source of EITHER shape, detected BY CONTENT.

    Shape A has `fsh-generated/` or FSH; shape B is a Forge repository of raw
    XML/JSON in hand-named (often German) directories, so no conventional-name
    glob finds them -- the skill's own rule, applied here as well.
    """
    gen = collect_generated(root)
    if gen:
        return gen, "fsh-generated/resources"
    out = {}
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = [d for d in dirnames if d not in
                       (".git", "node_modules", "output", "temp", "template",
                        "input-cache", "migration-log", ".ai-log")]
        for name in filenames:
            path = os.path.join(dirpath, name)
            # Keyed by `Type/id` where there is an id, by the canonical url where
            # there is not -- see `artefact_key`. Requiring an id here dropped
            # every id-less SearchParameter on the floor, which is the same
            # defect the inventory reader carried.
            if name.endswith(".json"):
                data = read_json(path)
                if isinstance(data, dict) and data.get("resourceType") \
                        and data["resourceType"] not in NON_ARTEFACT_TYPES:
                    key = artefact_key(data["resourceType"], data.get("id"),
                                       data.get("url") or "")
                    if key:
                        out[key] = data.get("url") or ""
            elif name.endswith(".xml"):
                txt = read_text(path) or ""
                if FHIR_XML_NS not in txt:
                    continue
                mt = re.search(r"<([A-Za-z]+)\s[^>]*xmlns=\"%s\"" % re.escape(FHIR_XML_NS), txt)
                mi = re.search(r"<id\s+value=\"([^\"]+)\"", txt)
                mu = re.search(r"<url\s+value=\"([^\"]+)\"", txt)
                if mt and mt.group(1) not in NON_ARTEFACT_TYPES:
                    key = artefact_key(mt.group(1), mi.group(1) if mi else None,
                                       mu.group(1) if mu else "")
                    if key:
                        out[key] = mu.group(1) if mu else ""
    return out, "source tree, by content (resourceType / FHIR xmlns)"


def artefact_key(rtype, rid, url):
    """The key an artefact is NAMED by, which is not always `Type/id`.

    A canonical resource does not need an `id` element at all: six of Consent's
    SearchParameters carry only a `url`, and the migration legitimately gives the
    generated resource a NEW id (`mii-sp-consent-policyuri` -> the FSH-derived
    `MII-SP-Consent-PolicyUri`). Keying such an artefact by `Type/id` is
    impossible on the source side and WRONG on the target side, so where there is
    no id the canonical url is the name -- and it is the url the two sides are
    then matched on.
    """
    if rid:
        return "%s/%s" % (rtype, rid)
    if url:
        return "%s (canonical %s)" % (rtype, url)
    return None


def load_source_inventory(path):
    """(`{key: url}`, unkeyable entries, total entries) from step 1's inventory.

    Its shape is not fixed by the specification and two real migrations wrote two
    different ones, so this accepts a list of objects, or a dict with an
    `artifacts`/`resources`/`items` key.

    IT KEEPS EVERY ARTEFACT ENTRY, and reports the ones it could not key rather
    than dropping them. The previous version required BOTH a resourceType and an
    id, which silently discarded Consent's six SearchParameters (they have no
    id) and left C1 checking 14 of 20 entries while reporting a clean pass --
    proven by a negative control in which DELETING a real artefact did not make
    C1 fire. A check that narrows its own subject and calls the remainder a pass
    is worse than no check, so what cannot be read is now counted and returned.

    Returns `(None, 0, 0)` for a shape it cannot read at all.
    """
    data = read_json(path)
    if data is None:
        return None, 0, 0
    candidates = []
    if isinstance(data, list):
        candidates = [data]
    elif isinstance(data, dict):
        # Every list a real migration has used for this, in preference order.
        # `artefacts` (the -ae- spelling) is Labor's; `generated_resources` is
        # Dokument's, and it holds bare FILE NAMES rather than objects. The first
        # list that yields an artefact wins, so a module whose `artefacts` key
        # holds FSH ENTITIES (aliases, rule sets -- Dokument again) falls through
        # to the one that holds resources instead of reporting zero.
        for key in ("resources", "artifacts", "artefacts", "generated_resources",
                    "items", "inventory"):
            if isinstance(data.get(key), list) and data[key]:
                candidates.append(data[key])
    for items in candidates:
        out, unkeyable, total = {}, [], 0
        for it in items:
            if isinstance(it, str):
                # `<Type>-<id>.json`, the fsh-generated naming convention -- the
                # same one `collect_generated` keys the target by.
                stem = it[:-5] if it.endswith(".json") else it
                stem = os.path.basename(stem)
                if "-" not in stem:
                    continue
                rt, rid = stem.split("-", 1)
                if not rt[:1].isupper() or rt in NON_ARTEFACT_TYPES:
                    continue
                total += 1
                out["%s/%s" % (rt, rid)] = ""
                continue
            if not isinstance(it, dict):
                continue
            rt = it.get("resourceType") or it.get("type")
            if not rt or rt in NON_ARTEFACT_TYPES:
                continue
            total += 1
            rid = it.get("id")
            url = it.get("url") or it.get("canonical") or ""
            key = artefact_key(rt, rid, url)
            if key is None:
                unkeyable.append(it.get("path") or it.get("file") or it.get("name") or rt)
                continue
            out[key] = url
        if out or unkeyable:
            return out, unkeyable, total
    return None, 0, 0


# --- layer 1: conservation --------------------------------------------------

# A multi-language build writes a REDIRECT STUB at the site root for every page:
# a ~520-byte document that declares `langs=[…]` and hands over to
# `assets/js/lang-redirects.js`, which sends the browser into `en/` or `de/`.
# The stub is not a rendering of anything -- its `artifacts.html` lists no
# artefact because there is no artefact list to render, and every real page sits
# one directory down.
#
# Reading the root as a variant is how this tool produced its own worst false
# finding: "every module renders an artifacts.html that lists NO artefact at
# all", reported as a BLOCKER on all four real migrations, while the per-language
# indexes were fully populated (measured 2026-08-07: dokument en/de 15 artefact
# links each, person 12, consent 15 including all 6 SearchParameters). A variant
# is a directory that ACTUALLY RENDERS PAGES; the redirect stub renders none.
LANG_REDIRECT_MARKS = ("lang-redirects.js", "langRedirect", "langs=[")


def is_lang_redirect_stub(path):
    """True where `path` is a language-redirect stub rather than a rendered page.

    Both conditions are required, so a real page that merely LINKS to the
    redirect script is not mistaken for one: it carries a redirect marker AND it
    links to no page at all.
    """
    txt = read_text(path)
    if txt is None:
        return False
    if not any(m in txt for m in LANG_REDIRECT_MARKS):
        return False
    return not re.search(r'href="[^"]+\.html"', txt)


def variant_dirs(rendered):
    """(rendered variants, redirect stubs skipped).

    A variant is a directory whose `artifacts.html` is a RENDERED index, not a
    language-redirect stub. The stubs are returned alongside so a caller can say
    WHY the root was skipped instead of silently dropping it.
    """
    out, stubs = [], []
    if not rendered or not os.path.isdir(rendered):
        return out, stubs
    candidates = [rendered] + [os.path.join(rendered, n) for n in sorted(os.listdir(rendered))]
    for cand in candidates:
        if not os.path.isdir(cand):
            continue
        index = os.path.join(cand, "artifacts.html")
        if not os.path.isfile(index):
            continue
        (stubs if is_lang_redirect_stub(index) else out).append(cand)
    return out, stubs


# FHIR R4 canonical (conformance/terminology) resource types. A rendered page
# `<Type>-<id>.html` is an ARTEFACT page when Type is one of these, or a type the
# module itself generates (examples: Consent, Patient, Provenance …), which is
# read from fsh-generated rather than listed here. Deriving the set from the
# filename alone is not possible -- `security-and-privacy.html` splits to
# "security" and would be read as a type.
CANONICAL_TYPES = (
    "StructureDefinition", "ValueSet", "CodeSystem", "ConceptMap", "SearchParameter",
    "CapabilityStatement", "OperationDefinition", "NamingSystem", "StructureMap",
    "ExampleScenario", "GraphDefinition", "MessageDefinition", "CompartmentDefinition",
    "TerminologyCapabilities", "Questionnaire",
)

# The publisher renders several VIEWS of one artefact. Only the bare page counts
# as the artefact; the views are reachable from it, not from the index.
VIEW_SUFFIXES = ("-testing", "-mappings", "-examples", "-definitions", "-changes",
                 "-diff", "-json", "-xml", "-ttl")


def _stub_note(ctx):
    """A parenthetical naming the redirect stubs that were NOT read as variants."""
    stubs = ctx.get("redirect_stubs") or []
    if not stubs:
        return ""
    return (" (%d language-redirect stub(s) skipped: %s -- a stub lists no artefact "
            "because it renders none)"
            % (len(stubs), ", ".join(label_path(s, ctx["target"]) or "." for s in stubs)))


def label_path(path, target):
    """A path as a finding should NAME it.

    Relative to the target where it sits inside it -- an absolute scratch path in
    a report is useless on another machine. But `os.path.relpath` of a rendered
    site that sits OUTSIDE the target produces `../../../../tmp/...`, which is
    worse than the absolute path it was avoiding (measured on the Labor run,
    whose preview was built outside the tree). So: relative when inside,
    absolute when not.
    """
    path, target = os.path.abspath(path), os.path.abspath(target)
    return os.path.relpath(path, target) if path.startswith(target + os.sep) \
        or path == target else path


def rendered_artifact_pages(vdir, generated):
    """Bare `<Type>-<id>.html` artefact pages actually rendered into `vdir`."""
    types = set(CANONICAL_TYPES) | set(k.split("/", 1)[0] for k in generated)
    out = set()
    for path in glob.glob(os.path.join(vdir, "*.html")):
        name = os.path.basename(path)
        stem = name[:-5]
        if "." in stem or "-" not in stem:
            continue                              # .change.history, index, qa …
        if stem.split("-", 1)[0] not in types:
            continue
        if stem.endswith(VIEW_SUFFIXES):
            continue
        out.add(name)
    return out


def layer_conservation(f, a, ctx):
    tgt = ctx["target"]

    # C1 -- every source artefact present in the target.
    src_arts, src_src = (None, None)
    unkeyable, total_entries = [], 0
    if a.source:
        src_arts, src_src = collect_source_artifacts(a.source)
        total_entries = len(src_arts or {})
    if not src_arts:
        inv, unkeyable, total_entries = load_source_inventory(
            os.path.join(ctx["logdir"], "source-inventory.json"))
        if inv:
            src_arts, src_src = inv, "migration-log/source-inventory.json"
    tgt_arts = ctx["generated"]
    # The target side of the match. An artefact whose SOURCE has no id is matched
    # on its canonical url, because the migration legitimately assigns a new id
    # (measured on Consent: `mii-sp-consent-policyuri` -> `MII-SP-Consent-PolicyUri`).
    tgt_urls = set(u for u in tgt_arts.values() if u)
    if not src_arts:
        f.unmechanisable("conservation", "C1", "source artefact set",
                         "no source tree (--source) and no readable source-inventory.json",
                         "re-run with --source <unmigrated source>, or write step 1's inventory")
    elif not tgt_arts:
        f.unmechanisable("conservation", "C1", "target artefact set",
                         "target carries no fsh-generated/resources -- SUSHI has not run",
                         "run SUSHI (step 3/7), then re-run verification")
    else:
        missing = [k for k, url in sorted(src_arts.items())
                   if k not in tgt_arts and not (url and url in tgt_urls)]
        for key in missing:
            f.diverges("conservation", "C1", key,
                       "in the source (%s), absent from the target's fsh-generated "
                       "by both id and canonical url" % src_src,
                       action="transfer the artefact (step 4) or record it as deliberately retired")
        if not missing:
            f.ok("conservation", "C1", "%d source artefacts" % len(src_arts),
                 "all present in fsh-generated, matched by id or canonical url "
                 "(source: %s)" % src_src)
    # What the reader could NOT key is named, counted and NOT counted as passed.
    # Silently narrowing the subject and reporting the remainder green is the
    # exact failure the negative control caught.
    if unkeyable:
        f.unmechanisable("conservation", "C1", "%d of %d inventory entries"
                         % (len(unkeyable), total_entries),
                         "the entry carries neither an id nor a canonical url, so it cannot "
                         "be matched against the target at all (%s)"
                         % ", ".join(str(u) for u in unkeyable[:4]),
                         "add the id or the canonical url to migration-log/source-inventory.json "
                         "(step 1) and re-run -- until then C1 covers %d of %d entries, "
                         "not all of them" % (total_entries - len(unkeyable), total_entries))

    # C2 -- every artefact REACHABLE from the artifact index. THE consent defect:
    # present is not the same property as listed, and the set comparison of the
    # sibling skill only proves the first.
    variants = ctx["variants"]
    if not variants:
        f.unmechanisable("conservation", "C2", "artifact index",
                         "no rendered output with an artifacts.html under %s%s"
                         % (ctx["rendered_label"], _stub_note(ctx)),
                         "build the IG (step 7), then re-run verification")
    elif not tgt_arts:
        f.unmechanisable("conservation", "C2", "artifact index",
                         "no fsh-generated/resources to check reachability for",
                         "run SUSHI, then re-run verification")
    else:
        for vdir in variants:
            index = read_text(os.path.join(vdir, "artifacts.html")) or ""
            linked = set(os.path.basename(h) for h in
                         re.findall(r'href="([^"]+\.html)"', index))
            rel = label_path(vdir, ctx["target"])
            unreachable, unrendered = [], []
            for key in sorted(tgt_arts):
                rtype, rid = key.split("/", 1)
                page = "%s-%s.html" % (rtype, rid)
                if not os.path.isfile(os.path.join(vdir, page)):
                    unrendered.append(page)
                elif page not in linked:
                    unreachable.append(page)

            # The REVERSE direction. The loop above can only ask about artefacts
            # SUSHI generated; an artefact supplied ready-made under
            # `input/resources/` is rendered by the publisher and is invisible to
            # it. Measured on Consent: `Parameters-mii-param-consent-manifest`
            # renders, is listed nowhere, and the forward pass cannot see it.
            #
            # Only ONE page per artefact is considered. The publisher writes
            # several views of the same artefact (`-testing`, `.change.history`,
            # `-mappings`); counting those would turn 6 unreachable
            # SearchParameters into 30 rows of the same defect and bury
            # everything else.
            for page in sorted(rendered_artifact_pages(vdir, tgt_arts)):
                stem = page[:-5]
                rtype, rid = stem.split("-", 1)
                if "%s/%s" % (rtype, rid) in tgt_arts:
                    continue                       # already judged above
                if page not in linked:
                    f.diverges("conservation", "C2", "%s/%s" % (rel, page),
                               "artefact page rendered from OUTSIDE fsh-generated (an "
                               "input/resources artefact) and NOT listed in %s/artifacts.html"
                               % rel,
                               action="unreachable content: add it to the IG resource's "
                                      "`definition.resource`, or to sushi-config's `resources:`")

            # An index that lists NOTHING is one defect, not N. Reported as one
            # row with the shape of what is missing, because 84 rows of "not
            # listed" is a report nobody reads -- and the per-artefact rows are
            # then redundant with it.
            if unreachable and not any(
                    h.startswith(tuple(t + "-" for t in
                                       set(k.split("/", 1)[0] for k in tgt_arts)))
                    for h in linked):
                by_type = {}
                for page in unreachable:
                    by_type.setdefault(page.split("-", 1)[0], 0)
                    by_type[page.split("-", 1)[0]] += 1
                f.diverges("conservation", "C2", "%s/artifacts.html" % rel,
                           "the artifact index lists NO artefact at all: %d rendered artefacts "
                           "are unreachable from it (%s)"
                           % (len(unreachable),
                              ", ".join("%dx %s" % (n, t) for t, n in sorted(by_type.items()))),
                           action="unreachable content -- the whole index is empty, so this is "
                                  "one defect in the IG resource's `definition.resource` list "
                                  "(or the template's artifacts page), not %d separate ones"
                                  % len(unreachable))
            else:
                for page in unreachable:
                    f.diverges("conservation", "C2", "%s/%s" % (rel, page),
                               "page rendered but NOT listed in %s/artifacts.html" % rel,
                               action="unreachable content: check the IG resource's "
                                      "`definition.resource` entry for this artefact")
            for page in unrendered:
                f.diverges("conservation", "C2", "%s/%s" % (rel, page),
                           "generated resource has no rendered page in %s" % rel,
                           action="check the build log for this resource")
            if not unreachable and not unrendered:
                f.ok("conservation", "C2", "%s (%d artefacts)" % (rel, len(tgt_arts)),
                     "every generated resource is rendered and listed in artifacts.html")

    # C3 -- every source guide page accounted for.
    pages, pages_src = ctx["source_pages"]
    page_map = ctx["page_map"]
    if not pages:
        f.unmechanisable("conservation", "C3", "source guide pages",
                         "no harvest manifest and no source pagecontent to enumerate",
                         "supply --harvest-tsv or --source; a migration whose source page "
                         "set is unknown cannot claim conservation")
    elif page_map is None:
        f.unmechanisable("conservation", "C3", "%d source pages" % len(pages),
                         "no page map at %s" % a.page_map,
                         "generate the map: page-structure-advice.py --map (run-log 5.4c), review it - never hand-write it")
    else:
        for entry_page in pages:
            page = entry_page["key"]
            entry = _map_lookup(page_map, entry_page)
            if entry is None:
                f.diverges("conservation", "C3", page,
                           "source page (%s) appears in no row of %s" % (pages_src, a.page_map),
                           action="MISSING: map it to a target page or record it retired with a reason")
                continue
            target_page, reason = entry
            if target_page.upper() == "RETIRED":
                if reason:
                    f.ok("conservation", "C3", page, "retired: %s" % reason)
                else:
                    f.diverges("conservation", "C3", page,
                               "retired with NO reason in %s" % a.page_map,
                               action="a retirement without a reason is indistinguishable "
                                      "from a forgotten page -- name the reason")
            else:
                where = _page_exists(ctx["target"], target_page)
                if where:
                    f.ok("conservation", "C3", page, "migrated -> %s (%s)" % (target_page, where))
                else:
                    f.diverges("conservation", "C3", page,
                               "mapped to %s, which does not exist in the target" % target_page,
                               action="fix the map or create the target page")

    # C4 -- every source narrative text run present somewhere in the target.
    #
    # C7 REUSES this computation rather than repeating it: "which source pages
    # lost prose" is exactly where "did the migration WRITE something in its
    # place" has to start, and two independent implementations of the same
    # measurement would eventually disagree and make both findings unusable. The
    # dict below is the handover; it records what C4 measured, never a verdict.
    c4_state = {"ran": False, "lost": {}, "unjudged": []}
    ctx["c4_state"] = c4_state
    corpus = ctx["target_corpus"]
    runs = ctx["source_runs"]
    if runs is None:
        f.unmechanisable("conservation", "C4", "narrative text runs",
                         "no harvested source narrative (%s) and no source pagecontent"
                         % a.harvest_dir,
                         "supply --harvest-dir or --source; without a source text there is "
                         "nothing to conserve against")
    elif not corpus:
        f.unmechanisable("conservation", "C4", "narrative text runs",
                         "the target carries no %s pagecontent to search" % a.source_lang,
                         "check --source-lang: the source narrative is compared against the "
                         "target pages in the SAME language, never against the translation")
    else:
        c4_state["ran"] = True
        hay = reduce_text(corpus)
        for page, page_runs in sorted(runs.items()):
            missing = [r for r in page_runs if reduce_text(r) not in hay]
            rows = ctx["source_tabular"].get(page, 0)
            marks = ctx["source_element_trees"].get(page, 0)
            note = ("; %d generated table row(s) excluded -- migration replaces that "
                    "view with the artefact page (R1 checks THAT)" % rows) if rows else ""
            if marks:
                # A page that embeds a profile view: its "text" is mostly the
                # rendered element tree, which migration replaces with the
                # publisher's own artefact page BY DESIGN. Reported as a lost
                # text run it produced ~11 000 phantom losses across Consent and
                # Labor and buried the real prose findings on the same pages.
                # NOT downgraded to a pass -- the prose on such a page is
                # genuinely unchecked, which is what NICHT PRUEFBAR means.
                f.unmechanisable("conservation", "C4", page,
                                 "the source page embeds an element-tree rendering (%d "
                                 "occurrences of the renderer's marker); %d of %d runs are "
                                 "in no target page, but prose and rendered view cannot be "
                                 "told apart in it" % (marks, len(missing), len(page_runs)),
                                 "read the page against its target: migration replaces the "
                                 "VIEW with the artefact page (R1), so only its prose has to "
                                 "be conserved -- and only a human can say which is which here")
                c4_state["unjudged"].append(page)
                continue
            if missing:
                c4_state["lost"][page] = (len(missing), len(page_runs))
                f.diverges("conservation", "C4", page,
                           "%d of %d PROSE runs of the source page are in no target page "
                           "(first: %s)%s"
                           % (len(missing), len(page_runs), _snip(missing[0]), note),
                           action="map the missing text to a target page section, or record "
                                  "the loss in the report's content map")
            elif page_runs:
                f.ok("conservation", "C4", page,
                     "all %d prose runs present in the target's %s corpus%s"
                     % (len(page_runs), a.source_lang, note))
            else:
                # A page of pure generated view has no prose to conserve. Saying
                # "all 0 runs present" would be a pass nobody earned.
                f.unmechanisable("conservation", "C4", page,
                                 "the source page carries NO prose -- %d generated table "
                                 "row(s) only" % rows,
                                 "conservation of a generated view is not a text question; "
                                 "confirm the artefact page replaces it (R1)")

    check_menu(f, a, ctx)          # C5
    check_placement(f, a, ctx)     # C6
    check_derived(f, a, ctx)       # C7


# --- C5: the menu, and the reverse page question ----------------------------

MENU_HREF = re.compile(r'<a\b[^>]*href="([^"]+)"[^>]*>(.*?)</a>', re.S)


def read_menus(target):
    """{relative path: [(href, label)]} for every menu.xml in the tree.

    Both the default `input/includes/menu.xml` and each
    `input/translations/<lang>/includes/menu.xml`. The template's own comment
    says a per-language copy is the ONLY way to get a translated menu, so a
    module with one menu and two languages is a real finding, not a layout
    variant.
    """
    out = {}
    for path in sorted(glob.glob(os.path.join(target, "input", "**", "menu.xml"),
                                 recursive=True)):
        entries = []
        for m in MENU_HREF.finditer(read_text(path) or ""):
            label = re.sub(r"\s+", " ", TAGS.sub("", m.group(2))).strip()
            entries.append((m.group(1).strip(), label))
        out[os.path.relpath(path, target)] = entries
    return out


def read_template_pages(path):
    """references/template-pages.tsv -> ({page: role}, manifest_tag).

    (None, None) when unreadable. The tag is the module-template tag the
    manifest was MEASURED at (third column); C5c compares it against the tag
    the module actually vendors -- the file's own header warns that a stale
    list produces confident, wrong findings in both directions, and that
    warning is now a tripwire instead of a comment.
    """
    txt = read_text(path)
    if txt is None:
        return None, None
    out, tags = {}, set()
    for line in txt.splitlines():
        if not line.strip() or line.startswith("#"):
            continue
        cols = line.split("\t")
        if len(cols) >= 2 and cols[0] != "page":
            out[cols[0].strip()] = cols[1].strip()
            if len(cols) >= 3 and cols[2].strip():
                tags.add(cols[2].strip())
    return (out or None), (sorted(tags)[-1] if tags else None)


def manifest_stale(ctx, tag_key):
    """(manifest_tag, vendored_ref) when both are known and differ, else None.

    The vendored ref is the run log's `5.2 skeleton-vendored ... ref=` value --
    the SAME line P2 verifies. Unknown-on-either-side is NOT stale: those cases
    keep their own NICHT PRUEFBAR paths (P2 for the log, the manifest readers
    for the files).
    """
    mtag = ctx.get(tag_key)
    ref = ((ctx.get("log_values") or {}).get("skeleton-vendored") or {}).get("ref")
    if mtag and ref and mtag != ref:
        return mtag, ref
    return None


def check_menu(f, a, ctx):
    """C5 -- menu entries, and target pages that no source page explains.

    Three questions a file-set comparison cannot answer, in ascending order of
    how badly a reader is misled when nobody asks them:

      a  does every menu entry LEAD somewhere? A menu is the only navigation the
         rendered site has; an entry pointing at a page that does not exist is a
         dead end no build step reports.
      b  is every narrative page IN the menu? A page that renders and is in no
         menu is reachable only by typing its URL -- the same class as the
         Consent artifact index, one level up.
      c  which target pages have NO source counterpart and are not the
         template's? Those are pages that appeared during migration. Usually
         legitimate (a template scaffold the module filled), occasionally a page
         invented to hold text that belonged elsewhere -- so this reports, and
         does not fail, unless the page is the template's DEMO page, which step 3
         is supposed to delete.
    """
    target = ctx["target"]
    menus = ctx["menus"]
    narrative = ctx["narrative_page_names"]

    # C5a -- every menu entry resolves.
    if not menus:
        f.unmechanisable("conservation", "C5", "menu",
                         "no input/**/menu.xml in the target",
                         "the template renders navigation from menu.xml; a module without one "
                         "has whatever navigation sushi-config's `menu:` generated -- confirm "
                         "by hand which it is")
    else:
        for rel, entries in sorted(menus.items()):
            dead = []
            for href, label in entries:
                page = href.split("#")[0].split("?")[0]
                if not page or page.startswith(("http://", "https://", "mailto:")):
                    continue
                if not page.endswith(".html"):
                    continue
                stem = os.path.basename(page)[:-5]
                if stem in narrative or stem in ctx["generated_page_stems"]:
                    continue
                # Publisher-generated index pages have no .md and no resource.
                if stem in PUBLISHER_PAGES:
                    continue
                if any(os.path.isfile(os.path.join(v, os.path.basename(page)))
                       for v in ctx["variants"]):
                    continue
                dead.append((label or stem, page))
            for label, page in dead:
                f.diverges("conservation", "C5", "%s -> %s" % (rel, page),
                           "menu entry %r points at a page that exists in neither "
                           "input/pagecontent nor the rendered output" % label,
                           action="dead navigation: remove the entry or create the page "
                                  "(a menu is the site's only navigation -- nothing else "
                                  "reports this)")
            if not dead:
                f.ok("conservation", "C5", rel,
                     "all %d menu entries resolve to a real page" % len(entries))

        # The menu is per language, and a missing translated menu renders the
        # DEFAULT-language navigation over translated pages.
        langs = ctx["translation_langs"]
        for lang in sorted(langs):
            want = os.path.join("input", "translations", lang, "includes", "menu.xml")
            if want not in menus:
                f.diverges("conservation", "C5", want,
                           "the module ships translated pages for %r but no translated menu -- "
                           "the %s pages render with the DEFAULT-language navigation" % (lang, lang),
                           action="copy input/includes/menu.xml to %s and translate the labels, "
                                  "keeping the href targets identical" % want)

    # C5b -- every narrative page reachable from a menu.
    if menus and narrative:
        linked = set()
        for entries in menus.values():
            for href, _ in entries:
                base = os.path.basename(href.split("#")[0])
                if base.endswith(".html"):
                    linked.add(base[:-5])
        # translationinfo is the template's ONE deliberately menu-less page: the
        # base template's translation banner links translationinfo.html on every
        # translated page, so it is reachable without a menu entry (measured on
        # the module-template's own rendering; its pages tree carries the page,
        # its menus do not). Flagging it produced a false DIVERGIERT on every
        # migrated module -- found on the 2026-08-15 Dokument re-migration try-run.
        # The IG-resource intro page (ImplementationGuide-mii-ig-<slug>.md,
        # module-template >= v0.11.0) is the template's SECOND deliberately
        # menu-less page: linked from the Home page's Contents list and the
        # ToC, never from the menu (the TF-KDS menu is a fixed structure).
        # Its name carries the module slug, so it is matched by prefix, not
        # listed in template-pages.tsv. Flagging it produced two false
        # DIVERGIERT on the 2026-08-19 Studie try-run.
        orphan = sorted(p for p in narrative
                        if p not in linked and p != "translationinfo"
                        and not p.startswith("ImplementationGuide-mii-ig-"))
        for page in orphan:
            f.diverges("conservation", "C5", "input/pagecontent/%s.md" % page,
                       "narrative page in NO menu entry -- rendered, but reachable only "
                       "by typing its URL",
                       action="add it to input/includes/menu.xml (and the per-language "
                              "copies), or retire the page")
        if not orphan:
            f.ok("conservation", "C5", "%d narrative pages" % len(narrative),
                 "every one is reachable from a menu entry")

    # C5c -- target pages with no source counterpart.
    tpl = ctx["template_pages"]
    pmap = ctx["page_map"]
    # Manifest-currency tripwire: template-pages.tsv measured at one template
    # tag, module vendored at another -> every C5c verdict would be built on
    # the WRONG page set (measured: two false DIVERGIERT on the Studie try-run,
    # manifest v0.10.3 vs vendored v0.11.0). Downgrade, never guess.
    stale = manifest_stale(ctx, "template_pages_tag")
    if stale:
        f.unmechanisable("conservation", "C5", "target pages without a source counterpart",
                         "references/template-pages.tsv is measured at module-template %s, but "
                         "this module vendors %s -- a stale manifest produces confident wrong "
                         "findings in both directions" % stale,
                         "re-measure template-pages.tsv at the vendored tag (record the tag in "
                         "the third column), then re-run")
    elif tpl is None:
        f.unmechanisable("conservation", "C5", "target pages without a source counterpart",
                         "references/template-pages.tsv is unreadable, so a template page "
                         "cannot be told from an invented one",
                         "supply the list, read from the template tag this module was "
                         "scaffolded from")
    elif pmap is None:
        # Without a page map every non-template page looks unexplained. Naming
        # them is still useful; calling them divergences would not be.
        unexplained = sorted(p for p in narrative if p not in tpl)
        f.unmechanisable("conservation", "C5",
                         "target pages without a source counterpart",
                         "no page map at %s; %d target page(s) are not the template's (%s)"
                         % (a.page_map, len(unexplained),
                            ", ".join(unexplained[:5]) or "none"),
                         "generate the map: page-structure-advice.py --map (run-log 5.4c), review it - never hand-write it; then re-run: only the map says which target page "
                         "each source page became")
    else:
        mapped = set()
        for tgt_page, _reason in pmap.values():
            if tgt_page and tgt_page.upper() != "RETIRED":
                stem = os.path.basename(tgt_page)
                mapped.add(stem[:-3] if stem.endswith(".md") else
                           (stem[:-5] if stem.endswith(".html") else stem))
        # ImplementationGuide-mii-ig-<slug> is template-owned from v0.11.0 on
        # (slug-bearing name -- matched by prefix, not via template-pages.tsv).
        unexplained = sorted(p for p in narrative if p not in tpl and p not in mapped
                             and not p.startswith("ImplementationGuide-mii-ig-"))
        for page in unexplained:
            f.diverges("conservation", "C5", "input/pagecontent/%s.md" % page,
                       "target page is neither a template page nor the target of any "
                       "page-map row -- it appeared during migration",
                       action="name its provenance in the page map, or remove it; a page "
                              "nobody can trace to a source is content a reviewer cannot check")
        if not unexplained:
            f.ok("conservation", "C5", "target page set",
                 "every narrative page is either the template's or a page-map target")

    # The template's DEMO page must not survive migration (spec step 3).
    if tpl and not stale:
        for page in sorted(p for p, role in tpl.items()
                           if role == "demo" and p in narrative):
            f.diverges("conservation", "C5", "input/pagecontent/%s.md" % page,
                       "the template's DEMO page is still present in the migrated module",
                       action="delete it and its menu entry and `pages:` row (spec step 3)")


PUBLISHER_PAGES = frozenset((
    "artifacts", "toc", "qa", "downloads", "searchform", "history", "index"))


# --- C6: content placement --------------------------------------------------

def check_placement(f, a, ctx):
    """C6 -- text that survived, but on WHICH page.

    C4 asks whether a source text run exists ANYWHERE in the target. That is the
    conservation question and it is the right one to ask first, but it passes
    identically for a paragraph that landed on the page the migration intended
    and for one that was swept into `index.md` because nothing else fitted. The
    routing decision (spec section 9) is the part a reviewer actually has to
    judge, and it is invisible in a C4 pass.

    So: for each source page, the target pages its runs landed on, ranked. With a
    page map, the dominant landing page is compared against the mapped target and
    a mismatch is a divergence. WITHOUT a page map there is no declared intent to
    compare against -- the distribution is reported as NICHT PRUEFBAR with the
    evidence a human needs, never as a pass.
    """
    runs = ctx["source_runs"]
    per_page = ctx["target_page_texts"]
    pmap = ctx["page_map"]
    pages, _src = ctx["source_pages"]

    if not runs:
        f.unmechanisable("conservation", "C6", "content placement",
                         "no harvested source narrative to place",
                         "supply --harvest-dir or --source")
        return
    if not per_page:
        f.unmechanisable("conservation", "C6", "content placement",
                         "the target carries no %s pagecontent to attribute text to"
                         % a.source_lang,
                         "check --source-lang, or build the %s variant" % a.source_lang)
        return

    reduced = {name: reduce_text(text) for name, text in per_page.items()}
    alias = {}
    for p in pages:
        for key in p["aliases"]:
            alias.setdefault(key, p)

    for src_page in sorted(runs):
        landing = {}
        placed = 0
        for run in runs[src_page]:
            needle = reduce_text(run)
            if not needle:
                continue
            hits = [name for name, text in reduced.items() if needle in text]
            if not hits:
                continue                      # C4 already reports the loss
            placed += 1
            for name in hits:
                landing[name] = landing.get(name, 0) + 1
        if not placed:
            continue
        ranked = sorted(landing.items(), key=lambda kv: (-kv[1], kv[0]))
        shown = ", ".join("%s (%d)" % (n, c) for n, c in ranked[:3])
        entry = _map_lookup(pmap, alias[src_page]) if (pmap and src_page in alias) else None
        if entry is None or entry[0].upper() == "RETIRED":
            f.unmechanisable("conservation", "C6", src_page,
                             "%d of %d runs placed; landed on %s"
                             % (placed, len(runs[src_page]), shown),
                             "no page-map row declares where this page's text was MEANT to go, "
                             "so 'right page' has no mechanical meaning -- read the landing "
                             "distribution and confirm the routing (spec section 9)")
            continue
        want = os.path.basename(entry[0])
        want = want[:-3] if want.endswith(".md") else (
            want[:-5] if want.endswith(".html") else want)
        top = ranked[0][0]
        if top == want:
            f.ok("conservation", "C6", src_page,
                 "%d of %d runs placed, most on %s -- the mapped target"
                 % (placed, len(runs[src_page]), want))
        elif want in landing:
            f.unmechanisable("conservation", "C6", src_page,
                             "mapped to %s, which holds %d run(s), but MOST landed on %s"
                             % (want, landing[want], shown),
                             "a split is legitimate when the source page was deliberately "
                             "divided; confirm the routing or correct the page map")
        else:
            f.diverges("conservation", "C6", src_page,
                       "mapped to %s, but NONE of its %d placed runs are on that page -- "
                       "they are on %s" % (want, placed, shown),
                       action="the text survived on a DIFFERENT page than the migration "
                              "declares. Correct the page map, or move the content")


def _map_lookup(page_map, entry_page):
    """The page map keyed tolerantly.

    Step 5 writes the ledger by hand, and the three names a page has -- the
    harvested Markdown file, the guide's page title, the URL slug -- are all
    reasonable keys to have typed. Accepting any of them is cheap; reporting a
    page as MISSING because the operator wrote the title where the script
    expected the filename would be a defect in the check.
    """
    for key in entry_page["aliases"]:
        if key in page_map:
            return page_map[key]
    return None


def _page_exists(target, page):
    """Is `page` a real target page? Accepts a bare name, a path, or a .md/.html."""
    stem = os.path.basename(page)
    for ext in ("", ".md", ".html"):
        for base in ("input/pagecontent", "input/intro-notes", "input/translations",
                     "output", ""):
            cand = os.path.join(target, base, stem + ext)
            if os.path.isfile(cand):
                return os.path.relpath(cand, target)
    # The recursive fallback appended ".md" to a stem that ALREADY carried it,
    # so it searched for "<name>.md.md" and found nothing: every page-map row
    # written as a PATH (which spec §9's intro-note rows are) came back
    # "does not exist in the target" while the file sat right there -- measured
    # on the PROs try-run, 13 false DIVERGIERT. Try the stem as given first.
    for pattern in (stem, stem + ".md"):
        hits = glob.glob(os.path.join(target, "input", "**", pattern), recursive=True)
        if hits:
            return os.path.relpath(hits[0], target)
    return None


def _snip(s, n=60):
    s = re.sub(r"\s+", " ", s).strip()
    return s[:n] + ("…" if len(s) > n else "")


# --- C7: content the migration WROTE, marked as such ------------------------

# The mirror a page has when it is NOT under `input/translations/<lang>/`. The
# default language's label is nowhere in the tree -- the pages simply sit in
# `input/pagecontent` -- so the mirrors are compared by SLOT, never by guessing
# which language code the default pages are written in. A guess there produced
# the whole bilingual rule firing on a monolingual module in the first sketch.
DEFAULT_SLOT = "*default*"

# `page lang kind source gate line excerpt`, spec section 9d. Positional, so a
# ledger written without its header row still reads.
DERIVED_COLUMNS = ("page", "lang", "kind", "source", "gate", "line", "excerpt")


def _derived_page_key(page):
    """The identity a page's two language mirrors share: its bare stem.

    `input/pagecontent/ueberblick.md` and
    `input/translations/de/pagecontent/ueberblick.md` are the same PAGE in two
    mirrors, and the bilingual rule is about exactly that pair.
    """
    stem = os.path.basename((page or "").strip().replace("\\", "/"))
    for ext in (".md", ".html"):
        if stem.endswith(ext):
            stem = stem[:-len(ext)]
    return stem


def _mirror_slot(page, lang, mirror_langs):
    """Which mirror a marker row sits in: a language code, or DEFAULT_SLOT.

    Read from the PATH first, because the path is where the answer actually is;
    the `lang` column is used only when the path carries no `translations/<lang>/`
    segment and the column names a mirror the tree really has.
    """
    m = re.search(r"(?:^|/)translations/([^/]+)/", (page or "").replace("\\", "/"))
    if m:
        return m.group(1)
    lang = (lang or "").strip()
    if lang and lang in mirror_langs:
        return lang
    return DEFAULT_SLOT


def _mirror_page(target, stem, slot):
    """The file that IS this page's mirror in `slot`, or None when there is none.

    A page nobody mirrored cannot be missing a marker in a mirror that does not
    exist. Without this the rule would fire on every untranslated page and the
    boxes would stop being read -- the exact failure spec section 9d's "NEVER
    marked" list exists to prevent.
    """
    if slot == DEFAULT_SLOT:
        bases = (os.path.join("input", "pagecontent"),
                 os.path.join("input", "intro-notes"))
    else:
        bases = (os.path.join("input", "translations", slot, "pagecontent"),
                 os.path.join("input", "translations", slot, "intro-notes"))
    for base in bases:
        cand = os.path.join(target, base, stem + ".md")
        if os.path.isfile(cand):
            return os.path.relpath(cand, target)
    return None


def _slot_label(slot):
    return "default-language" if slot == DEFAULT_SLOT else slot


def check_derived(f, a, ctx):
    """C7 -- content the migration WROTE is visible AS SUCH in the guide.

    A migration does not only carry text; it writes some. A family overview that
    condenses four source passages, a hub's one-line summaries, a bridge sentence
    joining two merged sections, a CapabilityStatement nobody in the source ever
    wrote, an approval date invented so the build passes -- all of that reads,
    on the rendered page, exactly like text the module's own authors wrote and
    signed off. It is indistinguishable from carried content by every other check
    in this file: C4 finds no LOSS (nothing went missing), C6 finds no
    MISPLACEMENT (nothing moved), the build is green, and the reviewer at Gate B
    reads a paragraph they never approved as if they had.

    So the migration marks it where it stands (spec section 9d): an HTML comment
    the machine reads, a blockquote the human reads. This check is the second
    half of that contract, and it asks three questions the marker convention only
    makes ANSWERABLE:

      a  does every marker's `source=` name a page that exists in the ledger of
         source pages -- or the literal `none`, which is what a `suggestion` or a
         `stand-in` legitimately has? A marker citing a page nobody harvested
         cites nothing.
      b  does each marker exist in BOTH language mirrors? A box that appears in
         the German page and not the English one hides the same paragraph from
         half the reviewers (the same rule the module template enforces for
         ILLUSTRATIVE-EXAMPLE, M11).
      c  the one that matters most: is there UNMARKED derived content? Where C4
         reports that a source page's prose did not survive into the target, the
         target page in its place was, by definition, rewritten -- and if it
         carries no marker at all, the rewrite is invisible. That is the defect
         the whole convention exists for.

    This check READS `migration-log/derived-content.tsv` and never scans the
    pages itself: `scripts/derived-scan.py` is the single definition of what a
    marker is, and a second implementation here would drift from it.
    """
    tgt = ctx["target"]
    rows = ctx["derived_rows"]
    tsv = label_path(a.derived_tsv, tgt)
    pmap_label = label_path(a.page_map, tgt)

    if rows is None:
        f.unmechanisable("conservation", "C7", "derived-content markers",
                         "no marker ledger at %s" % tsv,
                         "run its producer -- `python3 scripts/derived-scan.py --target .` "
                         "writes %s from the DERIVED markers in the tree; the verifier reads "
                         "that ledger and deliberately does not re-scan the pages, so without "
                         "it nothing can be said about derived content either way" % tsv)
        return

    diverged = 0

    # a -- every `source=` resolves to a source page, or to the literal `none`.
    page_map = ctx["page_map"]
    if page_map is None:
        f.unmechanisable("conservation", "C7", "marker source= values",
                         "%d marker(s) to resolve, but no page map at %s to resolve them "
                         "against" % (len(rows), pmap_label),
                         "generate the map: page-structure-advice.py --map (run-log 5.4c), review it - never hand-write it; until the map exists, a marker's source= names a page nothing "
                         "can confirm")
    else:
        known = set()
        for key in page_map:
            known.add(key)
            known.add(_derived_page_key(key))
        for r in rows:
            src = (r["source"] or "").strip()
            if src.lower() == "none":
                continue                       # suggestion / stand-in: no source, by contract
            if src and (src in known or _derived_page_key(src) in known):
                continue
            f.diverges("conservation", "C7",
                       "%s:%s (%s)" % (r["page"] or "?", r["line"] or "?", r["kind"] or "?"),
                       "the marker's source=%s is in no row of %s and is not the literal "
                       "`none`" % (src or "<empty>", pmap_label),
                       action="spell the source page exactly as %s's source column spells it, "
                              "or write `none` -- which is what a suggestion or a stand-in "
                              "carries, because it had no source" % pmap_label)
            diverged += 1

    # b -- both language mirrors, or neither.
    mirror_langs = set(ctx["mirror_langs"])
    bilingual = bool(mirror_langs)
    if bilingual:
        slots = {DEFAULT_SLOT} | mirror_langs
        groups = {}
        for r in rows:
            key = (_derived_page_key(r["page"]), (r["kind"] or "").strip(),
                   (r["source"] or "").strip())
            groups.setdefault(key, {})[_mirror_slot(r["page"], r["lang"], mirror_langs)] = r
        for (stem, kind, src), present in sorted(groups.items()):
            for slot in sorted(slots - set(present)):
                twin = _mirror_page(tgt, stem, slot)
                if twin is None:
                    continue                   # that mirror of the page does not exist at all
                have = ", ".join(_slot_label(s) for s in sorted(present))
                f.diverges("conservation", "C7", "%s (%s, source=%s) in %s"
                           % (stem, kind or "?", src or "?", _slot_label(slot)),
                           "marked in the %s mirror, but %s carries no %s marker for this page"
                           % (have, twin, kind or "DERIVED"),
                           action="add the SAME marker (same kind, same source=) to %s -- a "
                                  "marker in one language only hides the passage from the "
                                  "reviewers of the other" % twin)
                diverged += 1

    # c -- unmarked derived content: prose the source had, the target does not,
    #      and no marker anywhere on the page that replaced it.
    c4 = ctx.get("c4_state") or {}
    marked = set(_derived_page_key(r["page"]) for r in rows)
    if not c4.get("ran"):
        f.unmechanisable("conservation", "C7", "unmarked derived content",
                         "C4 (%s) could not run, so the pages whose source prose did NOT "
                         "survive -- the pages where the migration most likely wrote something "
                         "in its place -- cannot be named" % CHECK_TITLES["C4"],
                         "supply --harvest-dir or --source so C4 runs, then re-run "
                         "verification; until then C7 covers the markers that ARE there and "
                         "says nothing about the ones that should be")
    elif page_map is None:
        f.unmechanisable("conservation", "C7", "unmarked derived content",
                         "%d source page(s) lost prose (C4), but no page map at %s says which "
                         "target page replaced them" % (len(c4.get("lost") or {}), pmap_label),
                         "generate the map: page-structure-advice.py --map (run-log 5.4c), review it - never hand-write it; then re-run: without the map the page that would "
                         "have to carry the marker is unknown")
    else:
        pages, _src = ctx["source_pages"]
        alias = {}
        for p in pages:
            for key in p["aliases"]:
                alias.setdefault(key, p)
        unmapped = []
        for src_page, counts in sorted((c4.get("lost") or {}).items()):
            n_missing, n_total = counts
            entry = _map_lookup(page_map, alias[src_page]) if src_page in alias else None
            if entry is None:
                unmapped.append(src_page)
                continue
            if entry[0].upper() == "RETIRED":
                continue                       # no target page -- C3 owns the retirement
            stem = _derived_page_key(entry[0])
            if stem in marked:
                continue
            f.diverges("conservation", "C7", stem,
                       "%d of %d prose runs of the source page %s are in no target page (C4), "
                       "and %s carries no DERIVED marker at all -- text was rewritten and the "
                       "guide does not say so" % (n_missing, n_total, src_page, stem),
                       action="mark the passage per spec section 9d (the DERIVED comment plus "
                              "the visible box, in BOTH language mirrors), or restore the "
                              "source wording; if the text was deliberately dropped, record "
                              "that in %s instead" % pmap_label)
            diverged += 1
        if unmapped:
            # One row, not N: a missing page-map row is already a C3 DIVERGIERT
            # per page, and repeating it here per page would bury C7's own rows.
            f.unmechanisable("conservation", "C7", "%d source page(s) with lost prose and no "
                             "page-map row" % len(unmapped),
                             "no row of %s declares which target page replaced %s%s, so the "
                             "page that would have to carry the marker is unknown"
                             % (pmap_label, ", ".join(unmapped[:3]),
                                " …" if len(unmapped) > 3 else ""),
                             "map those pages (C3 reports the same rows), then re-run")
        for src_page in c4.get("unjudged") or []:
            f.unmechanisable("conservation", "C7", src_page,
                             "C4 could not tell this page's prose from its embedded element-tree "
                             "rendering, so whether anything was rewritten here is not measured",
                             "read the page against its target (the same human action C4 asks "
                             "for) and mark whatever the migration wrote per spec section 9d")

    # clean -- one row, naming what was actually verified.
    if not diverged:
        checked = ["source= resolves to a page-map row or the literal `none`"] \
            if page_map is not None else []
        if bilingual:
            checked.append("both language mirrors carry it (%s)"
                           % ", ".join(sorted(_slot_label(s) for s in
                                              {DEFAULT_SLOT} | mirror_langs)))
        if c4.get("ran") and page_map is not None:
            checked.append("every target page that replaced lost source prose carries one")
        f.ok("conservation", "C7", "%d derived-content marker(s)" % len(rows),
             "%s (%s). The markers are review items, not defects: they are queue 2 rows, and "
             "whether any may remain at publication is a Gate-D decision (spec section 9d)."
             % ("; ".join(checked) if checked else "read from the ledger", tsv))


GENERATED_ROW = re.compile(r"^\s*\|")

# The signature of an INLINE StructureDefinition element-tree rendering. This
# exact sentence is emitted by the element-table renderer per unconstrained
# element and by nothing else. Measured over the Consent and Labor harvests: 0
# occurrences on every one of the 21 prose pages, 20-174 on every one of the 7
# pages that embed a profile view. That separation is why a single occurrence is
# enough -- it is a marker, not a threshold.
ELEMENT_TREE_MARK = "There are no (further) constraints on this element"


def strip_generated_rows(text):
    """(prose, generated-row count). Markdown table rows are NOT prose.

    Measured on Labor: the harvested
    `technischeimplementierung-fhir-profile-observation.md` is 242429 lines, and
    4687 of its 4692 "text runs" are rows of the Simplifier-rendered element
    tree. Migration replaces that view with the publisher's own profile page ON
    PURPOSE, so counting the rows as lost narrative reported ~11 000 missing runs
    across Consent and Labor -- three orders of magnitude more than the real
    prose losses on the same pages, which it buried.

    The rows are not ignored: the caller reports them separately, because a
    generated view that vanished with no replacement is still a finding -- it is
    just a DIFFERENT finding, and R1's source-versus-target comparison is what
    detects that one.
    """
    keep, dropped = [], 0
    for line in text.splitlines():
        if GENERATED_ROW.match(line):
            dropped += 1
            continue
        keep.append(line)
    return "\n".join(keep), dropped


def split_runs(text, run_length=40):
    """Text runs, split exactly as `guide-page-to-md.py` splits them.

    HTML comments are stripped FIRST. Measured on Consent: every harvested page
    opens with `<!-- Harvested from <url> on <date> by scripts/guide-harvest.sh -->`,
    which is long enough to pass the run-length filter, is a provenance stamp
    rather than narrative, and can never appear in the target -- so it reported
    as a lost text run on all 18 harvested pages and was the FIRST example named
    in each finding. A check whose headline evidence is its own tooling's
    footprint teaches a reader to ignore it.
    """
    text = re.sub(r"(?s)<!--.*?-->", " ", text)
    text, tabular = strip_generated_rows(text)
    out = []
    for run in re.split(r"(?<=[.!?:;])\s+", text):
        run = run.strip()
        if len(run) < run_length:
            continue
        needle = re.sub(r"https?://\S+", " ", run)
        if len(reduce_text(needle)) < run_length // 2:
            continue
        out.append(needle)
    return out, tabular


# Raw Simplifier `*.page.md` machinery that is NOT narrative and never survives
# a migration verbatim -- the harvested Markdown never carries any of it,
# because guide-page-to-md.py works from the RENDERED page; only files read RAW
# from a guide tree need this. Measured on Onkologie (2026-08-23), where
# leaving it in reported ALL 150 tree pages as lost narrative:
#   * the YAML front matter (parent:/topic:/subject:) and `{{page-title}}`-
#     style render placeholders, glued into the first text run of every page;
#   * @```…``` render directives (FQL queries the renderer executes in place)
#     and fenced code blocks -- a rendered view and code samples, not prose
#     (the same distinction strip_generated_rows draws for table rows);
#   * <tabs>/<tab> markup, the container of the embedded profile view;
#   * the per-search-parameter boilerplate sentence the Simplifier profile
#     template repeats with only the element name varying (6x per profile
#     page, 193x across the tree) -- migration condenses it into the
#     publisher-rendered search-parameter list BY DESIGN, and a conservation
#     check on template boilerplate would measure the template, not the page.
# Two further classes are structure, not prose, and go with them: heading
# lines (the template re-heads routed content BY DESIGN, and a heading carries
# no sentence punctuation, so the splitter glues it to the page's first
# sentence -- the sentence then reports as lost when only the HEADING moved)
# and inline HTML tags (<img>/<div>/<br> rendering markup).
_PAGE_FRONT_MATTER = re.compile(r"\A\s*---[ \t]*\n.*?\n---[ \t]*\n?", re.S)
_PAGE_RENDER_FENCE = re.compile(r"@?```.*?```", re.S)
_PAGE_PLACEHOLDER = re.compile(r"\{\{[^{}]*\}\}")
_PAGE_TAB_MARKUP = re.compile(r"</?tabs?\b[^>]*>")
_PAGE_HEADING_LINE = re.compile(r"^#{1,6}[^\n]*$", re.M)
_PAGE_HTML_TAG = re.compile(r"<[^<>\n]{0,200}>")
_PAGE_SEARCH_BOILERPLATE = re.compile(
    r"Weitere Informationen zur Suche nach [^\n]{0,120}?FHIR-Basisspezifikation[^\n]*")
# The intentionally-blank stub is a PLACEHOLDER, not narrative (Onkologie
# repeats it on 22 chapter-Index pages). Stripping it routes such pages into
# C4's existing "the source page carries NO prose" branch -- which is the
# truth of them -- instead of reporting the stub sentence as lost narrative
# 22 times; a page that says only "nothing here" conserves nothing.
_PAGE_BLANK_STUB = re.compile(
    r"Diese Seite wurde absichtlich leer gelassen\.?|"
    r"This page (?:was |is )?intentionally left (?:blank|empty)\.?", re.I)

# The raw form of the EMBEDDED PROFILE VIEW. A harvested profile page carries
# the rendered element tree and C4 sends it to the "prose and rendered view
# cannot be told apart" branch via ELEMENT_TREE_MARK; the same page read RAW
# from the tree carries the <tabs>/<tab> container that renders into exactly
# that view. One page class, one verdict class -- otherwise the union would
# change a page's verdict merely by which FORM of it was read.
_PAGE_TAB_OPEN = re.compile(r"<tab\b")


def _strip_simplifier_page(text):
    text = _PAGE_FRONT_MATTER.sub(" ", text)
    text = _PAGE_RENDER_FENCE.sub(" ", text)
    text = _PAGE_TAB_MARKUP.sub(" ", text)
    text = _PAGE_HEADING_LINE.sub(" ", text)
    text = _PAGE_HTML_TAG.sub(" ", text)
    text = _PAGE_SEARCH_BOILERPLATE.sub(" ", text)
    text = _PAGE_BLANK_STUB.sub(" ", text)
    return _PAGE_PLACEHOLDER.sub(" ", text)


# --- layer 2: fidelity ------------------------------------------------------

IDENTITY_FIELDS = ("id", "packageId", "canonical", "version", "status", "title",
                   "license", "publisher", "fhirVersion")


def read_identity(root):
    sushi = read_text(os.path.join(root, "sushi-config.yaml"))
    pkg = read_json(os.path.join(root, "package.json")) or {}
    ident = {
        "id": yaml_scalar(sushi, "id"),
        "packageId": yaml_scalar(sushi, "packageId") or pkg.get("name"),
        "canonical": yaml_scalar(sushi, "canonical") or pkg.get("canonical"),
        "version": yaml_scalar(sushi, "version") or pkg.get("version"),
        "status": yaml_scalar(sushi, "status"),
        "title": yaml_scalar(sushi, "title") or pkg.get("title"),
        "license": yaml_scalar(sushi, "license") or pkg.get("license"),
        "publisher": yaml_publisher(sushi),
        "fhirVersion": yaml_scalar(sushi, "fhirVersion")
        or (pkg.get("fhirVersions") or [None])[0],
    }
    # None / {} / dict tristate from yaml_dependencies, preserved for F2:
    # only a config with NO block at all falls back to package.json; a block
    # that parsed to zero entries stays {} (parser finding, not absence).
    deps = yaml_dependencies(sushi)
    if deps is None:
        deps = pkg.get("dependencies") if pkg.get("dependencies") else None
    return ident, deps


def read_claims(path):
    """migration-log/identity-claims.tsv -> {field: [(tier, source, value)]}."""
    txt = read_text(path)
    if txt is None:
        return None
    out = {}
    for line in txt.splitlines():
        cols = line.split("\t")
        if len(cols) < 5:
            continue
        out.setdefault(cols[1], []).append((cols[2], cols[3], cols[4]))
    return out or None


def source_deps_from_claims(claims):
    """({name: version}, {name: [contested versions]}, evidence label).

    THE SOURCE'S PINS WITHOUT `--source`. F2 originally read them only from an
    unmigrated source tree, and no real migration ever supplied one -- so the
    wrong-pin class was NICHT PRUEFBAR on all four, i.e. a check that had never
    returned a verdict. But step 2 already records the source pins in the claims
    ledger, one row per dependency (`dependency:<name>`, tier P, source
    "package/package.json (source pin)"), and some runs additionally write an
    aggregate `dependencies` row as `name@version,name@version`. Both are read
    here, so F2 runs on every migration that did step 2.

    Contradicting readings of one pin are NOT resolved by precedence: an
    adopted-by-machine pin is exactly the defect F2 exists to catch.
    """
    pins, contested = {}, {}
    if not claims:
        return pins, contested, None
    tiers = set()

    def _record(name, value, tier):
        name, value = name.strip(), value.strip()
        if not name or not value:
            return
        tiers.add(tier)
        prev = pins.get(name)
        if prev is not None and prev != value:
            contested.setdefault(name, sorted({prev, value}))
        else:
            pins[name] = value

    for field, rows in sorted(claims.items()):
        if field.startswith("dependency:"):
            for tier, _src, value in rows:
                _record(field.split(":", 1)[1], value, tier)
        elif field == "dependencies":
            for tier, _src, value in rows:
                for token in value.split(","):
                    if "@" in token:
                        name, _sep, ver = token.rpartition("@")
                        _record(name, ver, tier)
    for name in contested:
        pins.pop(name, None)
    if not pins and not contested:
        return pins, contested, None
    return pins, contested, ("migration-log/identity-claims.tsv, tier(s) %s"
                             % "/".join(sorted(tiers)))


def layer_fidelity(f, a, ctx):
    tgt_ident, tgt_deps = ctx["identity"]
    src_ident, src_deps = ctx["source_identity"]
    claims = ctx["claims"]

    # F1 -- identity, field by field.
    for field in IDENTITY_FIELDS:
        tv = tgt_ident.get(field)
        sv = src_ident.get(field) if src_ident else None
        contested = None
        if sv is None and claims:
            vals = {v for (_t, _s, v) in claims.get(field, [])}
            if len(vals) == 1:
                sv = sorted(vals)[0]
            elif len(vals) > 1:
                # An unresolved contradiction is not a source value. Saying so
                # here rather than picking one is the same rule `log_claim`
                # applies: adopting a value mechanically would rename, relicense
                # or re-version a published module with nobody seeing it.
                contested = sorted(vals)
        if contested:
            f.unmechanisable("fidelity", "F1", field,
                             "the claims ledger holds %d contradicting readings (%s)"
                             % (len(contested), ", ".join(_snip(v, 40) for v in contested[:3])),
                             "decide the field at Gate A (check L3), then re-run verification")
            continue
        if field == "version":
            # The ONLY identity value the specification makes a human decision
            # (MII CalVer, defaulting to the source's), so an inequality here is
            # reported as a decision to confirm rather than as a defect.
            if tv and sv and tv != sv:
                f.unmechanisable("fidelity", "F1", "version",
                                 "target %s vs source %s -- the target version is a human "
                                 "decision (spec 2.1)" % (tv, sv),
                                 "confirm the target version at Gate A and record it")
                continue
        if sv is None:
            f.unmechanisable("fidelity", "F1", field,
                             "no source value (neither the source tree nor the claims ledger "
                             "yields one%s)" % ("" if claims else "; no ledger"),
                             "supply it at Gate A -- an identity field nobody can compare is "
                             "not a field that matches")
        elif tv is None:
            f.diverges("fidelity", "F1", field,
                       "source has %s, the target declares nothing" % _snip(sv),
                       action="carry the source value over unchanged (guardrail 1)")
        elif field == "publisher" and tv == "NUM-DIZ":
            # Template >= v1.1 CHROME, not module identity: the template sets
            # publisher NUM-DIZ (TF-KDS: NUM-DIZ takes over IG maintenance from
            # the MII), and spec 2.2/9a say a migration does NOT carry a source
            # publisher over it. A target that says NUM-DIZ against any source
            # value is therefore the documented state, not a divergence --
            # found as a false DIVERGIERT on the 2026-08-15 Dokument re-migration.
            f.ok("fidelity", "F1", field,
                 "target NUM-DIZ (template >= v1.1 publisher chrome, spec 2.2); "
                 "source declared %s -- deliberately not carried" % _snip(sv))
        elif tv != sv:
            f.diverges("fidelity", "F1", field,
                       "target %s  vs  source %s" % (_snip(tv), _snip(sv)),
                       action="the SOURCE wins (spec 2.2); restore it or record the divergence "
                              "as a Gate-A decision -- never normalise silently")
        else:
            f.ok("fidelity", "F1", field, "%s (identical to the source)" % _snip(tv))

    # F2 -- dependency pins. A wrong pin is invisible in a green build: measured,
    # a run resolved a parent from dist-tags.latest 2.0.3 where the source pinned
    # 2.0.2, and everything built.
    #
    # Tristate guards FIRST: a target whose dependency block exists but parsed
    # to nothing ({}) or is absent entirely (None) must not be compared -- every
    # source pin would read as "ABSENT from the target", a storm of confident
    # false divergences (the PROs silent-mangle class). NICHT PRUEFBAR names
    # the parser, not the module.
    f2_blocked = False
    if tgt_deps is None or tgt_deps == {}:
        f.unmechanisable("fidelity", "F2", "dependency pins",
                         "the TARGET sushi-config yields no readable dependency entries "
                         "(%s)" % ("no `dependencies:` block found" if tgt_deps is None else
                                   "block present, zero entries parsed -- a parser/format "
                                   "finding, not evidence of a dependency-free target"),
                         "inspect the target's sushi-config dependencies block by eye; if it "
                         "uses a form this parser does not model, fix the parser -- never "
                         "read the empty parse as absence")
        f2_blocked = True
    dep_src = "the source tree (--source)"
    contested_deps = {}
    if not f2_blocked and src_deps == {}:
        f.unmechanisable("fidelity", "F2", "dependency pins",
                         "the SOURCE sushi-config has a dependencies block, but zero entries "
                         "parsed from it -- a parser/format finding, not a dependency-free source",
                         "inspect the source block by eye and extend the parser; comparing "
                         "against an empty parse would confirm every wrong pin")
        f2_blocked = True
    if f2_blocked:
        src_deps, contested_deps, tgt_deps = {}, {"__f2_blocked__": None}, {}
    if not src_deps and not contested_deps:
        src_deps, contested_deps, dep_src = source_deps_from_claims(claims)
    for name, vals in sorted(x for x in contested_deps.items() if x[0] != "__f2_blocked__"):
        f.unmechanisable("fidelity", "F2", name,
                         "the claims ledger holds contradicting pins for it (%s)"
                         % ", ".join(vals),
                         "decide the pin at Gate A -- adopting one mechanically is the "
                         "wrong-pin defect F2 exists to catch")
    if not src_deps and not contested_deps:
        f.unmechanisable("fidelity", "F2", "dependency pins",
                         "no source dependency block: no --source, and no `dependency:<name>` "
                         "or `dependencies` claim in migration-log/identity-claims.tsv",
                         "record the source's pins at step 2 (repo-identity/package-identity "
                         "write them), or re-run with --source; until then the wrong-pin class "
                         "is unchecked")
    elif src_deps:
        for name, sver in sorted(src_deps.items()):
            tver = tgt_deps.get(name)
            if tver is None:
                # hl7.fhir.r4.core is the FHIR version itself: SUSHI takes it
                # from `fhirVersion` and it is never a sushi-config dependency.
                # F1 already compares fhirVersion, so a row here would be a
                # guaranteed false positive on every module.
                if name == "hl7.fhir.r4.core":
                    f.ok("fidelity", "F2", name,
                         "declared through `fhirVersion` (%s), not as a dependency -- F1 "
                         "compares it" % (tgt_ident.get("fhirVersion") or "?"))
                    continue
                f.diverges("fidelity", "F2", name,
                           "pinned %s in the source (%s), ABSENT from the target"
                           % (sver, dep_src),
                           action="carry the dependency over")
            elif tver != sver:
                f.diverges("fidelity", "F2", name,
                           "target %s  vs  source pin %s (%s)" % (tver, sver, dep_src),
                           action="the source pin is the evidence; a registry dist-tag is not. "
                                  "Restore the pin or make the bump a Gate-A decision")
            else:
                f.ok("fidelity", "F2", name,
                     "pinned %s, identical to the source pin (%s)" % (sver, dep_src))
        for name, tver in sorted(tgt_deps.items()):
            if name not in src_deps:
                # Legitimate: the template's CRMI meta.profile claims REQUIRE
                # hl7.fhir.uv.crmi. Named, not failed -- but never silent.
                f.unmechanisable("fidelity", "F2", name,
                                 "target-only dependency %s (not in the source)" % tver,
                                 "confirm at Gate A that this is template machinery "
                                 "(hl7.fhir.uv.crmi is) and not an accidental addition")

    # F3 -- licence, explicitly asserted. The template ships `license: CC-BY-4.0`
    # as a LITERAL: no placeholder check flags it, and MII modules commonly
    # declare CC0-1.0. Relicensing by default is the quietest defect in this list.
    tlic = tgt_ident.get("license")
    if not tlic:
        f.diverges("fidelity", "F3", "license",
                   "the target declares no licence at all",
                   action="declare the source's licence; a missing licence is not a default")
    else:
        tiers = [(t, s, v) for (t, s, v) in (claims or {}).get("license", [])]
        asserted = [(t, s, v) for (t, s, v) in tiers if v == tlic and t.upper() != "T"]
        if asserted:
            t, s, _v = asserted[0]
            f.ok("fidelity", "F3", "license",
                 "%s asserted from tier %s (%s)" % (tlic, t, _snip(s)))
        elif tiers:
            f.diverges("fidelity", "F3", "license",
                       "target declares %s; the evidence tiers say %s"
                       % (tlic, ", ".join("%s=%s" % (t, v) for (t, _s, v) in tiers)),
                       action="a licence the source does not assert is a RELICENSING. "
                              "Gate A decides; never default")
        else:
            f.unmechanisable("fidelity", "F3", "license",
                             "target declares %s with NO tier evidence behind it "
                             "(no claim in identity-claims.tsv)" % tlic,
                             "read the source's LICENSE (repo-identity.sh) and claim it, or "
                             "confirm the value at Gate A. The template's literal CC-BY-4.0 "
                             "reaches here unflagged otherwise")

    # F3, the LICENSE FILE. The scalar comparison above cannot see the second
    # copy of the licence every repo carries: the template ships a full
    # CC-BY-4.0 LICENSE file, and a module that correctly asserts CC0-1.0 in
    # sushi-config still hands every visitor the WRONG licence text -- measured
    # on both try-run targets (declared CC0-1.0, file "Attribution 4.0
    # International"). The file's first lines name the licence in a fixed,
    # recognizable header, so the two copies are reconciled mechanically.
    lic_text = read_text(os.path.join(ctx["target"], "LICENSE"))
    if lic_text is None:
        f.ok("fidelity", "F3", "LICENSE file",
             "no LICENSE file in the target -- nothing contradicts the declared "
             "scalar (%s)" % (tlic or "none"))
    else:
        head = " ".join(lic_text.splitlines()[:5]).lower()
        recognized = matched = None
        for marker, spdx in (("attribution 4.0 international", "CC-BY-4.0"),
                             ("cc0 1.0 universal", "CC0-1.0"),
                             ("creative commons zero", "CC0-1.0"),
                             ("apache license", "Apache-2.0"),
                             ("mit license", "MIT")):
            if marker in head:
                recognized, matched = spdx, marker
                break
        if recognized is None:
            f.unmechanisable("fidelity", "F3", "LICENSE file",
                             "the file exists but its first lines match no known licence "
                             "header (%s)" % _snip(" ".join(lic_text.splitlines()[:5])),
                             "read LICENSE and compare it to the declared %s by hand"
                             % (tlic or "none"))
        elif tlic and recognized == tlic:
            f.ok("fidelity", "F3", "LICENSE file",
                 "the file text is %s (header: %r), matching the declared scalar"
                 % (recognized, matched))
        else:
            f.diverges("fidelity", "F3", "LICENSE file",
                       "the file text is %s (header: %r) while the module declares %s -- "
                       "two licences in one repository" % (recognized, matched,
                                                           tlic or "NO licence"),
                       action="align them: keep the licence the SOURCE asserts and replace "
                              "the other copy (the template's CC-BY-4.0 LICENSE file "
                              "surviving next to a CC0-1.0 module is the measured case). "
                              "Gate A decides; never default")

    # F4 -- the two MECHANICAL goFSH residues, which are also the auto-fix
    # loop's only FSH-touching class.
    fsh_files = sorted(glob.glob(os.path.join(ctx["target"], "input", "fsh", "**", "*.fsh"),
                                 recursive=True))
    if not fsh_files:
        f.unmechanisable("fidelity", "F4", "FSH residue",
                         "no input/fsh/**/*.fsh in the target",
                         "check the transfer step (4) -- a migration with no FSH moved nothing")
    else:
        comments, unquoted = [], []
        for path in fsh_files:
            txt = read_text(path) or ""
            rel = os.path.relpath(path, ctx["target"])
            if re.search(r"^\s*\*\s.*\.fhir_comments\b", txt, re.M):
                comments.append(rel)
            if re.search(r"^\s*\*\s.*=\s*[A-Za-z][A-Za-z0-9_]*(?: [A-Za-z0-9_]+)+#", txt, re.M):
                unquoted.append(rel)
        for rel in comments:
            f.diverges("fidelity", "F4", rel,
                       "carries `.fhir_comments` assignment rules (an XML-serialization "
                       "construct SUSHI rejects)",
                       autofix="gofsh-residue",
                       action="postprocess-gofsh.py turns each into an FSH `//` comment")
        for rel in unquoted:
            f.diverges("fidelity", "F4", rel,
                       "carries a code reference whose system name contains whitespace "
                       "(unparseable FSH; the parse error TRUNCATES the rest of the file)",
                       autofix="gofsh-residue",
                       action="postprocess-gofsh.py rewrites it to the normalized name goFSH "
                              "itself reports, after confirming that entity exists")
        if not comments and not unquoted:
            f.ok("fidelity", "F4", "%d FSH files" % len(fsh_files),
                 "no fhir_comments rules, no whitespace-bearing code references")


# --- layer 3: provenance ----------------------------------------------------

def layer_provenance(f, a, ctx):
    qa_html = ctx["qa_html"]
    qa_txt = ctx["qa_txt"]

    # P1 -- the template package+version READ OUT OF THE RENDERED OUTPUT, against
    # the template the tree actually carries. Like with like: see the module
    # docstring's measured trap.
    vendored = read_json(os.path.join(ctx["target"], "ig-template", "package", "package.json"))
    vname = (vendored or {}).get("name")
    vver = (vendored or {}).get("version")
    rendered_tpl = None
    if qa_html:
        m = re.search(r"Templates:\s*([^<]+)", qa_html)
        if m:
            rendered_tpl = m.group(1).strip().split("-&gt;")[0].split("->")[0].strip()
    if rendered_tpl is None:
        f.unmechanisable("provenance", "P1", "rendered template version",
                         "no `Templates:` line in the rendered qa.html (%s)"
                         % (ctx["qa_html_path"] or "qa.html not found"),
                         "build the IG (step 7); the rendered output is the only place this "
                         "value can be READ rather than assumed")
    elif not vver:
        f.unmechanisable("provenance", "P1", "vendored template version",
                         "rendered output says %s; the tree carries no "
                         "ig-template/package/package.json" % rendered_tpl,
                         "confirm which template this site was built from")
    else:
        expect = "%s#%s" % (vname, vver)
        if rendered_tpl == expect:
            f.ok("provenance", "P1", "template", "rendered %s == vendored %s" % (rendered_tpl, expect))
        else:
            f.diverges("provenance", "P1", "template",
                       "rendered output was built from %s, the tree carries %s"
                       % (rendered_tpl, expect),
                       action="STALE RENDER: rebuild, then re-run verification. A published "
                              "site whose header names another version than its tree is the "
                              "'preview v0.5.0 under v0.5.1' class")

    # P2 -- the vendored REPO REF against the latest release. A different number
    # from P1's, on purpose.
    ref = ctx["log_values"].get("skeleton-vendored", {}).get("ref")
    if not ref:
        f.unmechanisable("provenance", "P2", "vendored template ref",
                         "no `5.2 skeleton-vendored … ref=` line in the run log",
                         "emit it when vendoring: "
                         "`bash \"$ML\" info 5.2 skeleton-vendored \"… ref=<tag> commit=<sha>\"`")
    elif not a.template_latest:
        f.unmechanisable("provenance", "P2", "vendored template ref",
                         "vendored at %s; the latest release was not supplied" % ref,
                         "re-run with --template-latest <tag> (it needs the network, which "
                         "this script deliberately does not use)")
    elif ref.lstrip("v") == a.template_latest.lstrip("v"):
        f.ok("provenance", "P2", "vendored template ref",
             "%s == latest release %s" % (ref, a.template_latest))
    else:
        f.diverges("provenance", "P2", "vendored template ref",
                   "vendored %s, latest release %s" % (ref, a.template_latest),
                   autofix="revendor-template",
                   action="re-vendor at the pinned ref and REBUILD -- the render check (P1) "
                          "is what confirms it, so without a rebuild command this is not "
                          "auto-fixable")

    # P3 -- the IG Publisher version, from the rendered output against the pin.
    pub = None
    for text in (qa_txt, qa_html):
        if not text:
            continue
        m = re.search(r"IG Publisher Version:\s*v?([0-9][0-9.]*)", text)
        if m:
            pub = m.group(1)
            break
    pin = a.publisher_pin or ctx["workflow_publisher_pin"]
    if pub is None:
        f.unmechanisable("provenance", "P3", "IG Publisher version",
                         "no `IG Publisher Version:` in the rendered qa output",
                         "build the IG (step 7)")
    elif not pin:
        f.unmechanisable("provenance", "P3", "IG Publisher version",
                         "rendered by %s; no pin found in the target's build workflow" % pub,
                         "supply --publisher-pin, or pin the publisher in the workflow's env: "
                         "block (spec 5.6)")
    elif pub.lstrip("v") == pin.lstrip("v"):
        f.ok("provenance", "P3", "IG Publisher version", "%s == the workflow pin" % pub)
    else:
        f.diverges("provenance", "P3", "IG Publisher version",
                   "rendered by %s, the workflow pins %s" % (pub, pin),
                   action="the site was not built by the toolchain the repository declares; "
                          "rebuild with the pin or correct the pin")
    if qa_txt and "Out of date" in (qa_txt or ""):
        m = re.search(r"IG Publisher Version:[^\n]*current version is ([0-9.]+)", qa_txt)
        if m:
            f.unmechanisable("provenance", "P3", "IG Publisher currency",
                             "the publisher reports itself out of date (current %s)" % m.group(1),
                             "upgrading the publisher is a target-repository decision, not a "
                             "migration one -- record it, do not act on it here")

    # P4 -- the pinned source-guide version. `?version=current` is the LIVE
    # EDITABLE project: a guide harvested from it is not reproducible.
    pin_ver, pin_src = ctx["guide_pin"]
    if pin_ver is None:
        f.unmechanisable("provenance", "P4", "source guide version",
                         "no `?version=` recorded in the run log or the harvest manifest",
                         "record the pinned, PUBLISHED guide version like the source commit SHA "
                         "(spec 5.1c.3)")
    elif pin_ver.lower() in ("current", "latest", "draft"):
        f.diverges("provenance", "P4", "source guide version",
                   "the recorded guide URL carries ?version=%s (%s) -- the live, editable "
                   "project, not a published version" % (pin_ver, pin_src),
                   action="re-harvest from a PUBLISHED version; `current` is not reproducible. "
                          "Where the guide has no published version at all, that is the finding "
                          "-- record it as such rather than leaving the pin unstated")
    else:
        f.ok("provenance", "P4", "source guide version",
             "pinned %s (%s)" % (pin_ver, pin_src))

    # P5 -- ig.ini points at the IG resource the build actually writes. SUSHI
    # derives its output file name from sushi-config `id`
    # (fsh-generated/resources/ImplementationGuide-<id>.json); an ig.ini written
    # from the repo SLUG instead (the id-vs-slug failure class) names a file
    # SUSHI never writes, and the publisher dies with "unable to find the IG"
    # after a green SUSHI run. Evidence order: the file ON DISK first; where
    # SUSHI has not run in this checkout (no fsh-generated/resources at all),
    # the name SUSHI will derive from `id` is the remaining reference.
    ini_text = read_text(os.path.join(ctx["target"], "ig.ini"))
    ini_match = re.search(r"^\s*ig\s*=\s*(\S+)", ini_text, re.M) if ini_text else None
    tgt_id = (ctx["identity"][0] or {}).get("id")
    if ini_text is None:
        f.unmechanisable("provenance", "P5", "ig.ini",
                         "no readable ig.ini in the target",
                         "the publisher cannot run without one -- create it (spec 5.2) "
                         "and point `ig =` at fsh-generated/resources/"
                         "ImplementationGuide-<id>.json")
    elif ini_match is None:
        f.unmechanisable("provenance", "P5", "ig.ini",
                         "ig.ini carries no `ig =` line",
                         "add `ig = fsh-generated/resources/ImplementationGuide-<id>.json`")
    else:
        ig_rel = ini_match.group(1)
        ig_path = os.path.join(ctx["target"], ig_rel)
        expected = "ImplementationGuide-%s.json" % tgt_id if tgt_id else None
        if os.path.isfile(ig_path):
            f.ok("provenance", "P5", "ig.ini",
                 "`ig = %s` exists in the target" % ig_rel)
        elif os.path.isdir(os.path.dirname(ig_path)):
            siblings = sorted(os.path.basename(x) for x in glob.glob(
                os.path.join(os.path.dirname(ig_path), "ImplementationGuide-*.json")))
            f.diverges("provenance", "P5", "ig.ini",
                       "`ig = %s` does not exist; the build wrote %s"
                       % (ig_rel, ", ".join(siblings) or "NO ImplementationGuide-*.json"),
                       action="the id-vs-slug class: point ig.ini at ImplementationGuide-"
                              "<sushi-config id>.json (%s), never at a name derived from "
                              "the repo slug" % (expected or "id unreadable"))
        elif expected and os.path.basename(ig_rel) == expected:
            f.ok("provenance", "P5", "ig.ini",
                 "`ig = %s` names the file SUSHI derives from sushi-config id `%s`; "
                 "not built in this checkout (no fsh-generated/resources), so the "
                 "id-derived name is the reference" % (ig_rel, tgt_id))
        elif expected:
            f.diverges("provenance", "P5", "ig.ini",
                       "`ig = %s`, but SUSHI writes %s (from sushi-config id `%s`) -- "
                       "the file will never exist" % (ig_rel, expected, tgt_id),
                       action="the id-vs-slug class: point ig.ini at the id-derived name")
        else:
            f.unmechanisable("provenance", "P5", "ig.ini",
                             "`ig = %s` does not exist, SUSHI has not run in this checkout, "
                             "and sushi-config declares no `id` to derive the name from"
                             % ig_rel,
                             "run SUSHI (or declare `id`) and re-run verification")


# --- layer 4: rendering integrity -------------------------------------------

# Deliberately short and specific. A broad marker list (`null`, `error`) fires on
# legitimate FHIR prose; each of these has been seen in a rendered MII header.
HEADER_MARKERS = (
    "Unknown region code",      # measured: Dokument, <div id="ig-status">, 2026-08-06
    "Unknown code",
    "{{",                       # an unexpanded Liquid/placeholder expression
    "{%",
    "[object Object]",
    "#ERROR",
)
HEADER_REGIONS = ('id="ig-status"', 'id="publish-box"', 'id="segment-header"',
                  'id="segment-footer"')


def _render_features(html):
    """Counted rendering features of one page: tables WITH rows, tab strips, images.

    Counted inside the whole page rather than a content region, because the two
    sides are rendered by different engines (Simplifier's guide renderer and the
    IG Publisher) and no region id is common to both. That makes the count noisy
    in absolute terms, which is why only the ZERO/NON-ZERO transition is reported
    -- a page that had tables and now has none -- and never a difference in size.
    """
    tables = sum(1 for t in re.findall(r"(?s)<table\b.*?</table>", html) if "<tr" in t)
    tabs = len(re.findall(r'class="[^"]*nav-tabs', html))
    images = len(re.findall(r"<img\b", html))
    return {"tables": tables, "tabs": tabs, "images": images}


def layer_rendering(f, a, ctx):
    variants = ctx["variants"]
    if not variants:
        for check in ("R1", "R2", "R3"):
            f.unmechanisable("rendering", check, "rendered output",
                             "no built site under %s%s"
                             % (ctx["rendered_label"], _stub_note(ctx)),
                             "build the IG (step 7); rendering integrity is not a property of "
                             "the sources")
    else:
        narrative_pages = ctx["narrative_page_names"]
        for vdir in variants:
            rel = label_path(vdir, ctx["target"])
            empty_tables, missing_images, empty_tabs = [], [], []
            for path in sorted(glob.glob(os.path.join(vdir, "*.html"))):
                name = os.path.basename(path)
                if name in ("qa.html", "qa-dep.html", "qa-tx.html"):
                    continue
                html = read_text(path) or ""
                for tbl in re.findall(r"(?s)<table\b.*?</table>", html):
                    if "<tr" not in tbl:
                        empty_tables.append(name)
                        break
                for src in re.findall(r'<img[^>]+src="([^"]+)"', html):
                    if src.startswith(("http://", "https://", "data:")):
                        continue
                    rel_src = src.split("#")[0].split("?")[0]
                    # Resolved against the variant directory AND the site root:
                    # the publisher writes `assets/` once at the root in some
                    # layouts, and resolving only against the variant reported
                    # every chrome icon of every page as missing (measured on a
                    # partial copy of a real site -- 60 rows for 4 real assets).
                    if any(os.path.isfile(os.path.join(base, rel_src))
                           for base in (vdir, ctx["rendered_root"])):
                        continue
                    missing_images.append((rel_src, name))
                for tabs in re.findall(r'(?s)<ul[^>]+class="[^"]*nav-tabs[^"]*".*?</ul>', html):
                    if "<li" not in tabs:
                        empty_tabs.append(name)
                        break
            # R1
            for name in sorted(set(empty_tables)):
                f.diverges("rendering", "R1", "%s/%s" % (rel, name),
                           "a <table> renders with no rows at all",
                           action="an empty table is a rendering failure of a view that had "
                                  "content in the source; check the artefact it renders")
            # One row per MISSING ASSET, not per page referencing it: a chrome
            # image absent from a build is one defect on N pages, and N rows for
            # it buries every other finding in the table.
            by_asset = {}
            for asset, page in missing_images:
                by_asset.setdefault(asset, []).append(page)
            for asset in sorted(by_asset):
                pages_ = sorted(set(by_asset[asset]))
                f.diverges("rendering", "R1", "%s image %s" % (rel, asset),
                           "referenced by %d page(s) (e.g. %s), present in neither %s nor the "
                           "site root" % (len(pages_), pages_[0], rel),
                           action="copy the asset into input/images/ (harvested assets are "
                                  "listed in guide-harvest-assets.tsv), or check that the build "
                                  "output being verified is complete")
            for name in sorted(set(empty_tabs)):
                f.diverges("rendering", "R1", "%s/%s" % (rel, name),
                           "a tab strip renders with no tabs",
                           action="check the artefact view's generation")
            if not (empty_tables or missing_images or empty_tabs):
                f.ok("rendering", "R1", rel,
                     "tables, tabs and images all non-empty and resolvable")
            # R2
            hits = []
            for path in sorted(glob.glob(os.path.join(vdir, "*.html"))):
                html = read_text(path) or ""
                spans = []
                for region_id in HEADER_REGIONS:
                    span = div_region_span(html, region_id)
                    if span:
                        spans.append((region_id, span[0], span[1]))
                for marker in HEADER_MARKERS:
                    for m in re.finditer(re.escape(marker), html):
                        # ONE defect, attributed to ONE region. The header
                        # regions NEST -- `#segment-header` contains `#ig-status`
                        # -- so a marker inside the inner one is inside the outer
                        # one too, and reporting both produced two rows and two
                        # queue items for a single `Unknown region code '276'`
                        # (measured on Dokument, 119 pages, twice per language).
                        # The INNERMOST containing region is the one that renders
                        # it, so that is the one named.
                        inner = None
                        for region_id, s, e in spans:
                            if s <= m.start() < e and (inner is None or s > inner[1]):
                                inner = (region_id, s, e)
                        if inner is None:
                            continue
                        # The snippet is cut from the region's TEXT, not from its
                        # markup: slicing raw HTML around the marker lands
                        # mid-tag and quotes a fragment of a style attribute.
                        rtext = html_text(html[inner[1]:inner[2]])
                        at = rtext.find(marker)
                        window = rtext[max(0, at - 40):] if at >= 0 else rtext
                        hits.append((os.path.basename(path), inner[0], marker,
                                     _snip(window, 90)))
                        break                  # one hit per marker per page
            seen_marker = set()
            for name, region_id, marker, snippet in hits:
                key = (region_id, marker)
                if key in seen_marker:      # one row per defect, not per page
                    continue
                seen_marker.add(key)
                count = sum(1 for h in hits if (h[1], h[2]) == key)
                f.diverges("rendering", "R2", "%s %s [%s]" % (rel, region_id, marker),
                           "on %d page(s), e.g. %s: %s" % (count, name, snippet),
                           action="rendered header/footer metadata defect -- qa.txt does not "
                                  "report it. Fix the metadata it renders (a jurisdiction code "
                                  "the template cannot resolve is the measured case)")
            if not hits:
                f.ok("rendering", "R2", rel, "header/footer regions carry no defect marker")

        # R1, comparative -- what was non-empty in the SOURCE rendering must be
        # non-empty in the target's. The per-variant pass above catches an empty
        # table; this catches a table, tab strip or image that is simply gone,
        # which an absolute check cannot see (nothing renders, so nothing is
        # empty). It runs only where the harvest kept the source HTML.
        src_pages, _src_label = ctx["source_pages"]
        pmap = ctx["page_map"]
        src_html_dir = a.source_html
        if not (src_pages and pmap and os.path.isdir(src_html_dir)):
            f.unmechanisable("rendering", "R1", "source-versus-target rendering",
                             "no harvested source HTML (%s) and/or no page map" % src_html_dir,
                             "harvest with --keep-html and write the page map; without a source "
                             "rendering, 'non-empty where non-empty in the source' has no "
                             "reference")
        else:
            compared, lost_pages = 0, 0
            for sp in src_pages:
                hits = sorted(glob.glob(os.path.join(src_html_dir, "*%s.html" % sp["stem"])))
                entry = _map_lookup(pmap, sp)
                if not hits or not entry or entry[0].upper() == "RETIRED":
                    continue
                tpage = os.path.basename(entry[0])
                tpage = tpage[:-3] + ".html" if tpage.endswith(".md") else \
                    (tpage if tpage.endswith(".html") else tpage + ".html")
                tpath = None
                for vdir in ([d for d in variants if os.path.basename(d) == a.source_lang]
                             + variants):
                    cand = os.path.join(vdir, tpage)
                    if os.path.isfile(cand):
                        tpath = cand
                        break
                if not tpath:
                    continue
                s = _render_features(read_text(hits[0]) or "")
                t = _render_features(read_text(tpath) or "")
                compared += 1
                lost = [k for k in ("tables", "tabs", "images") if s[k] > 0 and t[k] == 0]
                if lost:
                    lost_pages += 1
                    f.diverges("rendering", "R1", "%s -> %s" % (sp["key"], tpage),
                               "source rendering had %s; the target page has none"
                               % ", ".join("%d %s" % (s[k], k) for k in lost),
                               action="a live table or figure that vanished in migration is a "
                                      "CONTENT loss the build cannot see -- restore it or record "
                                      "the substitution in the report's content map")
            # THE SUMMARY MUST COUNT WHAT WAS COMPARED, and never claim a page it
            # just reported as divergent. The first version emitted one blanket
            # IDENTISCH whenever `compared > 0` -- including alongside its own
            # DIVERGIERT rows -- and emitted NOTHING when the harvest and the map
            # were both present but no page pair matched, which reads in the
            # findings table exactly like a check that passed.
            if compared - lost_pages > 0:
                f.ok("rendering", "R1",
                     "%d of %d source pages compared to their target pages"
                     % (compared - lost_pages, compared),
                     "tables, tabs and images non-empty in the target wherever they were "
                     "non-empty in the source")
            if compared == 0:
                f.unmechanisable("rendering", "R1", "source-versus-target rendering",
                                 "the harvest and the page map are both present, but NO source "
                                 "page resolved to a rendered target page -- nothing was "
                                 "compared",
                                 "check that --source-html holds the harvested HTML and that "
                                 "the page map's target column names pages the build renders; "
                                 "a comparison over zero pages is not a pass")

        # R3 -- language parity, on the NARRATIVE pages only. Artefact pages are
        # generated and legitimately near-identical across languages (measured:
        # consent en/artifacts.html 29608 B vs de/ 29644 B), so checking them
        # would drown the real finding in noise.
        default_dir, trans_dirs = ctx["language_dirs"]
        if not default_dir or not trans_dirs:
            f.unmechanisable("rendering", "R3", "language parity",
                             "could not identify a default and a translated variant under %s"
                             % ctx["rendered_label"],
                             "build both language variants (step 6/7)")
        elif not narrative_pages:
            f.unmechanisable("rendering", "R3", "language parity",
                             "no input/pagecontent/*.md to identify the narrative pages",
                             "narrative pages are what a translation must differ on; "
                             "artefact pages are generated")
        else:
            for tdir in trans_dirs:
                rel = label_path(tdir, ctx["target"])
                same, missing = [], []
                for stem in sorted(narrative_pages):
                    dpath = os.path.join(default_dir, stem + ".html")
                    tpath = os.path.join(tdir, stem + ".html")
                    if not os.path.isfile(dpath):
                        continue
                    if not os.path.isfile(tpath):
                        missing.append(stem)
                        continue
                    dtext = reduce_text(html_text(read_text(dpath) or ""))
                    ttext = reduce_text(html_text(read_text(tpath) or ""))
                    if dtext and dtext == ttext:
                        same.append(stem)
                for stem in missing:
                    f.diverges("rendering", "R3", "%s/%s.html" % (rel, stem),
                               "the default language renders this page, the translation does not",
                               action="add the translated page under input/translations/<lang>/")
                for stem in same:
                    f.diverges("rendering", "R3", "%s/%s.html" % (rel, stem),
                               "byte-for-byte the same text as the default language -- a "
                               "DEFAULT-LANGUAGE FALLBACK, not a translation",
                               action="the page renders, so nothing fails; supply the "
                                      "translation or record the gap")
                if not same and not missing:
                    f.ok("rendering", "R3", rel,
                         "all %d narrative pages differ from the default language"
                         % len(narrative_pages))

    # R4 -- links to the template's example artefacts, which step 3 DELETES.
    # Such a link can only have come from the template: the module's own
    # narrative predates the template and cannot reference its examples. That
    # provenance argument is what makes this class auto-fixable at all.
    #
    # The tokens come from references/template-artifacts.tsv -- the SAME file
    # `autofix-fix.py` reads -- so the check and its fixer cannot drift apart.
    tpl_arts = ctx["template_artifacts"]
    stale_arts = manifest_stale(ctx, "template_artifacts_tag")
    if stale_arts:
        f.unmechanisable("rendering", "R4", "template example links",
                         "references/template-artifacts.tsv is verified at module-template %s, "
                         "but this module vendors %s -- a stale token list looks for the wrong "
                         "scaffolding in both directions" % stale_arts,
                         "re-verify the token list at the vendored tag (update the "
                         "`# template_tag:` header), then re-run")
    elif tpl_arts is None:
        f.unmechanisable("rendering", "R4", "template example links",
                         "no template-artifacts manifest at %s" % a.template_artifacts,
                         "supply --template-artifacts; without the manifest there is no "
                         "definition of a template example to look for, and 'found none' "
                         "would mean 'looked for nothing'")
    else:
        dangling = []
        for path in sorted(glob.glob(os.path.join(ctx["target"], "input", "**", "*.md"),
                                     recursive=True)) + \
                sorted(glob.glob(os.path.join(ctx["target"], "input", "**", "menu.xml"),
                                 recursive=True)):
            txt = read_text(path) or ""
            rel = os.path.relpath(path, ctx["target"])
            for token, _ver, _on, _why in tpl_arts:
                for m in re.finditer(r"(?:\]\(|href=\")([^\")\s]*%s[^\")\s]*)"
                                     % re.escape(token), txt):
                    dangling.append((rel, m.group(1), token))
        for rel, href, token in dangling:
            f.diverges("rendering", "R4", "%s -> %s" % (rel, href),
                       "link to a TEMPLATE example artefact (`%s`) that step 3 deletes" % token,
                       autofix="template-example-link",
                       action="remove the link, keep its text -- the fixer refuses unless the "
                              "file's text is byte-identical afterwards")
        if not dangling:
            f.ok("rendering", "R4", "template example links",
                 "none, over %d token(s) from %s (verified against template package %s)"
                 % (len(tpl_arts), os.path.basename(a.template_artifacts),
                    "/".join(sorted(set(r[1] for r in tpl_arts)))))

    # R5 -- a page-title unit per page. Missing unit -> the title renders in the
    # default language; empty msgstr -> untranslated, which no machine can fix.
    ig_json = ctx["ig_resource"]
    po_path = ctx["po_path"]
    if not ig_json:
        f.unmechanisable("rendering", "R5", "page-title catalogue",
                         "no fsh-generated ImplementationGuide resource to read titles from",
                         "run SUSHI (step 3), then re-run")
    elif not po_path:
        f.unmechanisable("rendering", "R5", "page-title catalogue",
                         "no input/translations/<lang>/ImplementationGuide-<id>.po",
                         "generate it with gen-page-title-po.py (step 6)")
    elif not ctx["page_titles"]:
        # A catalogue with nothing to compare against passes trivially, which is
        # the shape of a false pass: report it as unreadable instead.
        f.unmechanisable("rendering", "R5", "page-title catalogue",
                         "the generated ImplementationGuide carries no titled pages",
                         "check the `pages:` tree in sushi-config -- a page set nobody can "
                         "enumerate cannot be checked for translation")
    else:
        titles = ctx["page_titles"]
        units = ctx["po_units"]
        rel = os.path.relpath(po_path, ctx["target"])
        missing = [t for t in titles if t not in units]
        empty = [t for t in titles if t in units and not units[t]]
        for t in missing:
            f.diverges("rendering", "R5", "%s [%s]" % (rel, _snip(t, 40)),
                       "page title in the IG's pages tree has NO unit in the catalogue",
                       autofix="po-missing-unit",
                       action="regenerate the catalogue; the unit is added with an EMPTY "
                              "msgstr -- never an invented translation")
        for t in empty:
            f.unmechanisable("rendering", "R5", "%s [%s]" % (rel, _snip(t, 40)),
                             "unit present, msgstr EMPTY (untranslated)",
                             "a translation is a human act -- queue it for Gate C")
        if not missing and not empty:
            f.ok("rendering", "R5", rel, "a translated unit for every one of the %d page titles"
                 % len(titles))


# --- the run log as a second oracle -----------------------------------------

LOG_LINE = re.compile(
    r"^(?P<ts>\d{4}-\d\d-\d\dT\d\d:\d\d:\d\dZ)  (?P<level>INFO |WARN |ERROR)  "
    r"(?P<step>\S+)  (?P<action>\S+)  (?P<detail>.*)$")


def parse_log(path):
    txt = read_text(path)
    if txt is None:
        return None
    out = []
    for line in txt.splitlines():
        m = LOG_LINE.match(line)
        if m:
            d = m.groupdict()
            d["level"] = d["level"].strip()
            out.append(d)
    return out


def read_template_artifacts(path):
    """references/template-artifacts.tsv -> ([(token, template_version, verified_on, why)], tag).

    The ONE definition of "a link into template scaffolding", shared with
    `autofix-fix.py`. Returns (None, None) when the file cannot be read, which
    R4 reports as NICHT PRUEFBAR -- a detector whose subject list is missing has
    not passed. The tag comes from a `# template_tag: <tag>` header line (the
    module-template tag the tokens were verified at); R4 compares it against
    the tag the module vendors, so a stale token list downgrades instead of
    producing confident wrong findings.
    """
    txt = read_text(path)
    if txt is None:
        return None, None
    rows, tag = [], None
    for line in txt.splitlines():
        if line.startswith("#"):
            m = re.match(r"#\s*template_tag:\s*(\S+)", line)
            if m:
                tag = m.group(1)
            continue
        if not line.strip():
            continue
        cols = [c.strip() for c in line.split("\t")]
        if len(cols) < 4 or cols[0] == "token":
            continue
        rows.append(tuple(cols[:4]))
    return (rows or None), tag


def read_expected_steps(path):
    """references/expected-steps.tsv -> [(step, action, applies, condition, why)]."""
    txt = read_text(path)
    if txt is None:
        return None
    rows = []
    for line in txt.splitlines():
        if not line.strip() or line.startswith("#"):
            continue
        cols = line.split("\t")
        if len(cols) < 5 or cols[0] == "step":
            continue
        rows.append(tuple(c.strip() for c in cols[:5]))
    return rows or None


def layer_log(f, a, ctx):
    entries = ctx["log"]
    # A MISSING LOG MUST NOT DELETE THE CHECKS THAT READ IT. The first version
    # emitted L0 DIVERGIERT and RETURNED, so on the two real migrations that
    # shipped without a run.log, L1-L4 produced no row at all -- not NICHT
    # PRUEFBAR, simply absent from the findings table and the report. That is
    # precisely the silent-gap failure this phase exists to prevent, committed by
    # the phase itself. So every log-dependent check below emits an explicit
    # NICHT PRUEFBAR row NAMING the missing input, and the checks that do not
    # need the log (the identity ledger, the artifact count) still run.
    have_log = entries is not None
    no_log_reason = "there is no run log at %s" % a.log
    no_log_action = ("write the log as the migration runs (spec 10.1); until it exists this "
                     "check has no second oracle to read and is NOT passed")
    if not have_log:
        entries = []
        f.diverges("log", "L0", a.log,
                   "there is NO run log -- the migration's primary record is absent",
                   action="a report written from recollection cannot be audited (spec 10.6). "
                          "Two of the four real migrations shipped without one; this is that "
                          "finding, made loud")
    else:
        f.ok("log", "L0", a.log, "%d parsed lines, %d runs" % (
            len(entries), sum(1 for e in entries if e["action"] == "run-boundary")))

    # L1 -- a silent-partial-success WARN that was emitted and never acted on.
    if not have_log:
        f.unmechanisable("log", "L1", "silent-partial-success WARNs", no_log_reason,
                         no_log_action)
    seen_l1 = False
    for i, e in enumerate(entries):
        if e["level"] != "WARN" or not e["detail"].startswith("silent-partial-success:"):
            continue
        later = entries[i + 1:]
        resolved = any(
            l["action"] == e["action"] and (
                l["detail"].startswith("resolved:")
                or re.search(r"\bexpected=(\d+) actual=\1\b", l["detail"]))
            for l in later)
        seen_l1 = True
        if resolved:
            f.ok("log", "L1", "%s/%s @ %s" % (e["step"], e["action"], e["ts"]),
                 "silent-partial-success WARN, later resolved in the log")
        else:
            f.diverges("log", "L1", "%s/%s @ %s" % (e["step"], e["action"], e["ts"]),
                       _snip(e["detail"], 120),
                       action="the WARN this whole convention exists for was emitted and "
                              "NOTHING acted on it. Re-run the step, or record the resolution "
                              "with a `resolved:` line naming this action")
    if have_log and not seen_l1:
        # A scan that ran and found nothing is a RESULT. Emitting no row for it
        # is indistinguishable in the findings table from a check that never ran.
        f.ok("log", "L1", "silent-partial-success WARNs",
             "the log carries none across %d lines" % len(entries))

    # L2 -- a step that emitted NO line. A step that did not run is invisible
    # otherwise: nothing else in the tree records its absence.
    expected = ctx["expected_steps"]
    if not have_log:
        f.unmechanisable("log", "L2", "step coverage", no_log_reason,
                         "%s -- with no log, EVERY step is unrecorded, which is one finding "
                         "(L0), not one per step" % no_log_action)
    elif expected is None:
        f.unmechanisable("log", "L2", "step coverage",
                         "no expected-steps manifest at %s" % a.expected_steps,
                         "supply --expected-steps; without the manifest a missing step cannot "
                         "be distinguished from a step that legitimately did not apply")
    else:
        seen = set((e["step"], e["action"]) for e in entries)
        seen_actions = set(e["action"] for e in entries)
        shape = ctx["shape"]
        for step, action, applies, condition, why in expected:
            if (step, action) in seen or action in seen_actions:
                f.ok("log", "L2", "%s %s" % (step, action), "present in the log")
                continue
            if applies in ("A", "B") and shape and applies != shape:
                continue                    # not applicable to this source shape
            if action == ACTION:
                # This run IS that step. Reporting its own absence as a
                # divergence would be theatre; reporting it as present would
                # hide the real defect, which is a verification whose result
                # never reaches the log. So: name the wrapper that fixes it.
                f.unmechanisable("log", "L2", "%s %s" % (step, action),
                                 "no line in the log — this very run is emitting one",
                                 "invoke it through the helper so the result is recorded: "
                                 "`bash \"$ML\" run 11 verify-migration --emits-runlog -- …`")
                continue
            if condition and condition != "always":
                f.unmechanisable("log", "L2", "%s %s" % (step, action),
                                 "no line in the log; the step is conditional (%s)" % condition,
                                 "confirm the condition did not hold -- %s" % why)
            elif applies in ("A", "B") and not shape:
                f.unmechanisable("log", "L2", "%s %s" % (step, action),
                                 "no line in the log; required only for source shape %s, "
                                 "which the log does not state" % applies,
                                 "record the shape (pre.2 classify-source-shape) -- %s" % why)
            else:
                f.diverges("log", "L2", "%s %s" % (step, action),
                           "the step emitted NO run-log line",
                           action="a step that did not run is invisible in the target: %s. "
                                  "Run it, or record why it was skipped" % why)

    # L3 -- an identity contradiction still open at verification time. ONE row
    # per FIELD, not per WARN: a field read from five tiers emits four WARNs and
    # is still one decision, and a queue with four rows for it invites three of
    # them to be closed as duplicates.
    contradictions = {}
    if not have_log:
        f.unmechanisable("log", "L3", "open identity contradictions", no_log_reason,
                         no_log_action)
    for e in entries:
        if e["level"] == "WARN" and e["detail"].startswith("identity-contradiction:"):
            m = re.search(r"field=(\S+)", e["detail"])
            contradictions.setdefault(m.group(1) if m else "?", []).append(e)
    if have_log and not contradictions:
        f.ok("log", "L3", "open identity contradictions",
             "the log records no `identity-contradiction:` WARN")
    for fname, evs in sorted(contradictions.items()):
        decided = any(
            l["detail"].startswith("decision:") and fname in l["detail"] for l in entries)
        if decided:
            f.ok("log", "L3", "identity field %s" % fname,
                 "%d contradicting readings, decided in the log" % len(evs))
        else:
            f.diverges("log", "L3", "identity field %s" % fname,
                       "%d unresolved contradiction WARN(s), first at %s: %s"
                       % (len(evs), evs[0]["ts"], _snip(evs[0]["detail"], 110)),
                       action="unresolved at verification time. It is a Gate-A decision, "
                              "never a precedence puzzle to settle mechanically -- record "
                              "it with a `decision:` line naming the field")
    # Independent of the log: the ledger either exists or it does not.
    claims_path = os.path.join(ctx["logdir"], "identity-claims.tsv")
    if not os.path.isfile(claims_path):
        f.unmechanisable("log", "L3", "identity ledger",
                         "no %s" % os.path.relpath(claims_path, ctx["target"]),
                         "run the identity recovery (step 2) -- without the ledger a "
                         "contradiction has nowhere to be seen")
    else:
        f.ok("log", "L3", "identity ledger",
             "%s present, %d claim(s)"
             % (os.path.relpath(claims_path, ctx["target"]),
                sum(len(v) for v in (ctx["claims"] or {}).values())))

    # L4 -- the cross-checks. THE point of two oracles: the log says N, the
    # target holds M, and neither number is wrong on its own.
    conv = ctx["log_values"].get("gofsh-convert", {})
    if not have_log:
        f.unmechanisable("log", "L4", "conversion count", no_log_reason, no_log_action)
        f.unmechanisable("log", "L4", "page count", no_log_reason, no_log_action)
    elif conv.get("actual") is not None:
        n = int(conv["actual"])
        m = len(ctx["generated"])
        if m == 0:
            f.unmechanisable("log", "L4", "conversion count",
                             "log says %d resources converted; the target has no "
                             "fsh-generated to count" % n,
                             "run SUSHI, then re-run verification")
        elif m < n:
            f.diverges("log", "L4", "conversion count",
                       "the log measured %d converted, the target holds %d generated "
                       "resources" % (n, m),
                       action="resources went missing between conversion and build -- "
                              "reconcile against step 1's inventory")
        else:
            f.ok("log", "L4", "conversion count",
                 "log %d converted <= %d generated (SUSHI adds the IG resource itself)" % (n, m))
    else:
        f.unmechanisable("log", "L4", "conversion count",
                         "no `gofsh-convert … actual=` line in the log",
                         "shape B only; for shape A there is nothing to convert")

    harv = ctx["log_values"].get("guide-harvest", {})
    tsv_rows = ctx["harvest_rows"]
    if not have_log:
        pass                                  # already reported above, once
    elif harv.get("actual") is not None and tsv_rows is not None:
        n = int(harv["actual"])
        m = sum(1 for r in tsv_rows if r.get("status") == "harvested")
        if n != m:
            f.diverges("log", "L4", "page count",
                       "the log says %d pages harvested, the manifest holds %d harvested rows"
                       % (n, m),
                       action="two records of one number disagree -- believe neither until "
                              "the harvest is re-run")
        else:
            f.ok("log", "L4", "page count", "log and manifest agree: %d harvested" % n)
    else:
        f.unmechanisable("log", "L4", "page count",
                         "no harvested count in the log and/or no harvest manifest",
                         "harvest the guide (step 2c) where the narrative is not in the repo")

    listed = ctx["indexed_artifact_count"]
    if listed is None:
        f.unmechanisable("log", "L4", "artifact count",
                         "no rendered artifacts.html to count",
                         "build the IG (step 7)")
    else:
        m = len(ctx["generated"])
        if listed < m:
            f.diverges("log", "L4", "artifact count",
                       "artifacts.html lists %d artefacts, fsh-generated holds %d"
                       % (listed, m),
                       action="the index is short of the tree -- the same class C2 names "
                              "page by page")
        else:
            f.ok("log", "L4", "artifact count",
                 "artifacts.html lists %d for %d generated resources" % (listed, m))


# --- the authoritative guide tree ------------------------------------------
# The SAME selection rule page-structure-advice.py applies (spec 5.1a #1), so
# the verifier measures conservation against the tree the advice step actually
# routed: the highest version substring in the directory name among
# implementation-guides/*/ whose language matches the source language, with
# guide.yaml `version:` as the tiebreak, overridable via --source-guide-tree.
# Two scripts choosing by two rules would verify a migration against a source
# set the migration never saw.

def _tree_version(name):
    """The longest version-looking substring of a directory name
    ('ImplementationGuide-2026.x-DE' -> '2026.x'; 'Common' -> '')."""
    best = ""
    for m in re.finditer(r"v?(\d+(?:\.[0-9xX]+)*)", name):
        if len(m.group(1)) > len(best):
            best = m.group(1)
    return best


def _tree_version_key(text):
    """Sort key for a dotted version; an 'x' placeholder sorts below any
    explicit number in the same position (2026.0.3 outranks 2026.x)."""
    parts = []
    for part in re.split(r"[.\-_]", text or ""):
        if part:
            parts.append((1, int(part)) if part.isdigit() else (0, 0))
    return tuple(parts)


def _choose_source_guide_tree(source, source_lang, override):
    """(path, dirname) of the authoritative guide tree, or (None, None).

    Only directories that HOLD `*.page.md` files compete: a styles/asset
    directory outranking a 149-page tree on its name would be absurd. The
    tree's language is read from guide.yaml's description tag ('[DE] ...')
    first, the directory-name suffix ('...-DE') second -- the same order the
    advice script uses.
    """
    if not source:
        return None, None
    root = os.path.join(source, "implementation-guides")
    if not os.path.isdir(root):
        return None, None
    lang = (source_lang or "").split("-")[0].upper()
    trees = []
    for name in sorted(os.listdir(root)):
        path = os.path.join(root, name)
        if not os.path.isdir(path):
            continue
        pages = 0
        for _dirpath, _dirnames, filenames in os.walk(path):
            pages += sum(1 for x in filenames if x.endswith(".page.md"))
        if not pages:
            continue
        fields = {}
        for raw in (read_text(os.path.join(path, "guide.yaml")) or "").splitlines():
            m = re.match(r"^(description|version)\s*:\s*(.+?)\s*$", raw)
            if m:
                value = m.group(2).strip()
                if len(value) >= 2 and value[0] == value[-1] and value[0] in "'\"":
                    value = value[1:-1]
                fields.setdefault(m.group(1), value)
        tag = re.match(r"^\s*\[([A-Za-z]{2})\]", fields.get("description", ""))
        suffix = re.search(r"[-_ ]([A-Za-z]{2})$", name)
        trees.append({"name": name, "path": path,
                      "lang": (tag.group(1) if tag else
                               (suffix.group(1) if suffix else "")).upper(),
                      "vname": _tree_version(name),
                      "vyaml": fields.get("version", "")})
    if not trees:
        return None, None
    if override:
        wanted = override.strip().strip("/")
        for t in trees:
            if t["name"].lower() == wanted.lower():
                return t["path"], t["name"]
        # An override naming no page-holding tree falls through to the ranking
        # (the advice script does the same), rather than silently picking it.
    pool = [t for t in trees if lang and t["lang"] == lang] or trees
    best = max(pool, key=lambda t: (_tree_version_key(t["vname"]),
                                    _tree_version_key(t["vyaml"]), t["name"]))
    return best["path"], best["name"]


# --- context assembly -------------------------------------------------------

def build_context(a):
    target = os.path.abspath(a.target)
    logdir = os.path.dirname(os.path.abspath(a.log)) or os.path.join(target, "migration-log")
    ctx = {"target": target, "logdir": logdir}

    ctx["identity"] = read_identity(target)
    # None, not {}: under the F2 tristate, {} means "block present but
    # unparseable" -- an absent --source must read as ABSENT so F2 falls back
    # to the claims ledger instead of blaming a parser that never ran.
    ctx["source_identity"] = read_identity(a.source) if a.source else (None, None)
    ctx["claims"] = read_claims(os.path.join(logdir, "identity-claims.tsv"))
    ctx["generated"] = collect_generated(target)

    rendered = os.path.abspath(a.rendered) if a.rendered else os.path.join(target, "output")
    a.rendered = rendered
    # Every message that names a path names it relative to the target where it
    # sits inside it: an absolute scratch path in a finding is unreadable in a
    # report and useless on another machine.
    ctx["rendered_label"] = label_path(rendered, target)
    ctx["rendered_root"] = rendered
    ctx["variants"], ctx["redirect_stubs"] = variant_dirs(rendered)

    # qa output: at the site root, or in any variant directory.
    ctx["qa_html"] = ctx["qa_txt"] = None
    ctx["qa_html_path"] = None
    for base in [rendered] + ctx["variants"]:
        if ctx["qa_html"] is None:
            p = os.path.join(base, "qa.html")
            if os.path.isfile(p):
                ctx["qa_html"] = read_text(p)
                ctx["qa_html_path"] = label_path(p, target)
        if ctx["qa_txt"] is None:
            p = os.path.join(base, "qa.txt")
            if os.path.isfile(p):
                ctx["qa_txt"] = read_text(p)

    # The IG resource, its page titles, and the translation catalogue.
    ig_files = sorted(glob.glob(os.path.join(target, "fsh-generated", "resources",
                                             "ImplementationGuide-*.json")))
    ctx["ig_resource"] = read_json(ig_files[0]) if ig_files else None
    ctx["page_titles"] = _page_titles(ctx["ig_resource"])
    po = sorted(glob.glob(os.path.join(target, "input", "translations", "*",
                                       "ImplementationGuide-*.po")))
    ctx["po_path"] = po[0] if po else None
    ctx["po_units"] = _po_units(read_text(ctx["po_path"])) if po else {}

    # Narrative pages, and the target text corpus in the SOURCE's language.
    pc = sorted(glob.glob(os.path.join(target, "input", "pagecontent", "*.md")))
    ctx["narrative_page_names"] = set(os.path.basename(p)[:-3] for p in pc)
    lang_pc = sorted(glob.glob(os.path.join(target, "input", "translations", a.source_lang,
                                            "pagecontent", "*.md")))
    corpus_files = lang_pc or []
    if not corpus_files:
        # A German-only source whose text became the DEFAULT pages (the inverted
        # direction the skill's *Language* section describes) still has to be
        # searchable, so fall back to the default pages rather than reporting an
        # empty corpus.
        corpus_files = pc
    # `input/intro-notes/` IS narrative: spec §9 ROUTES the per-profile text
    # there whenever a module has more than two profiles, and those notes render
    # atop the artifact pages. Leaving them out of the corpus made C3/C4/C6
    # report the whole routed set as lost -- measured on the PROs try-run
    # (2026-08-21): 13 false C3 rows and the bulk of 32 false C4 rows, on
    # content that was present all along. The per-language mirror counts too.
    corpus_files = corpus_files + sorted(
        glob.glob(os.path.join(target, "input", "intro-notes", "*.md"))
        + glob.glob(os.path.join(target, "input", "translations", a.source_lang,
                                 "intro-notes", "*.md")))
    # HTML comments are stripped from the corpus EXACTLY as split_runs strips
    # them from the source side: the migration writes `<!-- source: … -->`
    # provenance stamps between a heading and its paragraph, and a source run
    # that spans that boundary (headings carry no sentence punctuation, so the
    # splitter glues them to the next sentence) then never matches -- measured
    # on Onkologie 2026-08-23: the stamp alone turned ~90 conserved pages into
    # C4 divergences. Comments are invisible in the rendered page; comparing
    # against them compares against nothing a reader sees.
    ctx["target_corpus"] = "\n".join(
        re.sub(r"(?s)<!--.*?-->", " ", read_text(p) or "") for p in corpus_files)
    # The SAME corpus, kept per page. C6 needs to know which page a text run
    # landed on; C4 only needs to know that it landed somewhere, and a single
    # concatenated string cannot answer the first question.
    ctx["target_page_texts"] = {
        os.path.basename(p)[:-3]: re.sub(r"(?s)<!--.*?-->", " ", read_text(p) or "")
        for p in corpus_files}

    # Menus, the template's own page set, and the languages that have pages.
    ctx["menus"] = read_menus(target)
    ctx["template_pages"], ctx["template_pages_tag"] = read_template_pages(a.template_pages)
    ctx["template_artifacts"], ctx["template_artifacts_tag"] = \
        read_template_artifacts(a.template_artifacts)
    ctx["translation_langs"] = set(
        os.path.basename(os.path.dirname(d))
        for d in glob.glob(os.path.join(target, "input", "translations", "*", "pagecontent")))
    ctx["generated_page_stems"] = set(k.replace("/", "-") for k in ctx["generated"])

    # Source pages + their text runs. The page set is the UNION of every
    # narrative home the source has -- the harvested Markdown, the source's own
    # input/pagecontent, and the AUTHORITATIVE guide tree -- never a fallback
    # chain: the old elif let ONE SUSHI stub in input/pagecontent suppress a
    # 149-page guide tree, and the whole C layer then verified conservation of
    # nothing (measured on Onkologie, 2026-08-23: a 1-page source set beside a
    # 149-page tree). De-duplicated by basename ACROSS the homes -- a page
    # harvested to disk and sitting in the tree is ONE page -- while same-named
    # pages WITHIN the tree (Onkologie holds 25 Index.page.md) stay distinct,
    # keyed by their parent directory. Non-authoritative trees (parallel
    # languages, historical versions) are NOT in the union: their content is
    # translation seed / retained history, not conservation reference (5.1a).
    ctx["harvest_rows"] = _harvest_rows(a.harvest_tsv)
    pages, pages_src, runs = [], None, None
    if ctx["harvest_rows"]:
        for r in ctx["harvest_rows"]:
            if r.get("status") != "harvested":
                continue
            fname = os.path.basename(r.get("file") or "")
            stem = fname[:-3] if fname.endswith(".md") else fname
            title = (r.get("title") or "").strip()
            slug = os.path.basename((r.get("url") or "").split("?")[0].rstrip("/"))
            key = stem or title or slug
            pages.append({"key": key,
                          "aliases": [x for x in (key, fname, stem, title, slug) if x],
                          "stem": stem or slug, "url": r.get("url", "")})
        pages_src = os.path.relpath(a.harvest_tsv, target) \
            if a.harvest_tsv.startswith(target) else a.harvest_tsv

    harvest_files = sorted(glob.glob(os.path.join(a.harvest_dir, "*.md"))) \
        if a.harvest_dir else []
    pagecontent_files, tree_files = [], []
    tree_root = getattr(a, "guide_tree_path", None)
    if a.source:
        pagecontent_files = sorted(glob.glob(
            os.path.join(a.source, "input", "pagecontent", "*.md")))
        if tree_root:
            tree_files = sorted(glob.glob(os.path.join(tree_root, "**", "*.page.md"),
                                          recursive=True))
        elif not harvest_files and not pagecontent_files:
            # No authoritative tree and no other home: exactly the old last
            # resort, so a source without guide trees behaves as before.
            tree_root = os.path.join(a.source, "implementation-guides")
            tree_files = sorted(glob.glob(os.path.join(tree_root, "**", "*.md"),
                                          recursive=True))

    entries, seen = [], set()          # (key, path, aliases, stem)
    for p in harvest_files + pagecontent_files:
        base = os.path.basename(p)
        if base in seen:
            continue                   # the harvested copy stands for both
        seen.add(base)
        entries.append((base, p, [base, base[:-3]], base[:-3]))
    tree_kept = [p for p in tree_files if os.path.basename(p) not in seen]
    base_count = {}
    for p in tree_kept:
        base_count[os.path.basename(p)] = base_count.get(os.path.basename(p), 0) + 1
    used_keys = set(k for (k, _p, _al, _st) in entries)
    for p in tree_kept:
        base = os.path.basename(p)
        rel = os.path.relpath(p, tree_root).replace(os.sep, "/")
        qualified = "/".join(rel.split("/")[-2:])
        key = base if base_count[base] == 1 else qualified
        if key in used_keys:
            key = rel                  # two same-named parents: the full path
        used_keys.add(key)
        stem = base[:-len(".page.md")] if base.endswith(".page.md") else base[:-3]
        aliases = []
        for x in (key, base, base[:-3], stem, qualified, rel):
            if x and x not in aliases:
                aliases.append(x)
        entries.append((key, p, aliases, stem))

    src_md = [p for (_k, p, _al, _st) in entries]
    if entries:
        runs, tabular, etrees = {}, {}, {}
        for key, p, _aliases, _stem in entries:
            raw = read_text(p) or ""
            marks = raw.count(ELEMENT_TREE_MARK)
            if p.endswith(".page.md"):
                # The raw form of the embedded profile view counts into the
                # SAME marker channel the harvested form uses -- see
                # _PAGE_TAB_OPEN: one page class, one C4 verdict class.
                marks += len(_PAGE_TAB_OPEN.findall(raw))
                raw = _strip_simplifier_page(raw)
            prose, rows = split_runs(raw)
            runs[key] = prose
            tabular[key] = rows
            etrees[key] = marks
        ctx_tabular, ctx_etrees = tabular, etrees
        known = set()
        for pg in pages:
            known.update(pg["aliases"])
        for key, _p, aliases, stem in entries:
            if any(x in known for x in aliases):
                continue               # the manifest's entry stands for it
            pages.append({"key": key, "aliases": aliases, "stem": stem, "url": ""})
        homes = []
        if harvest_files:
            homes.append(label_path(a.harvest_dir, target))
        if pagecontent_files:
            homes.append("source input/pagecontent")
        if tree_files:
            homes.append("guide tree %s"
                         % (getattr(a, "guide_tree_name", None) or "implementation-guides"))
        union_label = " + ".join(homes)
        pages_src = "%s + %s" % (pages_src, union_label) if pages_src else union_label
    ctx["source_pages"] = (pages, pages_src)
    ctx["source_runs"] = runs
    ctx["source_tabular"] = locals().get("ctx_tabular") or {}
    ctx["source_element_trees"] = locals().get("ctx_etrees") or {}

    ctx["page_map"] = _page_map(a.page_map)

    # The DERIVED-marker ledger, and the language mirrors a marker has to appear
    # in. The mirrors are read from the TREE (`input/translations/<lang>/`), never
    # from a language code guessed for the default pages -- see DEFAULT_SLOT.
    ctx["derived_rows"] = _derived_rows(a.derived_tsv)
    ctx["mirror_langs"] = set(
        os.path.basename(d)
        for d in glob.glob(os.path.join(target, "input", "translations", "*"))
        if os.path.isdir(d))

    # The log, and the values other layers read out of it.
    ctx["log"] = parse_log(a.log)
    ctx["log_values"] = _log_values(ctx["log"])
    ctx["expected_steps"] = read_expected_steps(a.expected_steps)
    ctx["shape"] = a.shape or _shape_from_log(ctx["log"])

    # The guide pin: the log's cmd= tokens first, the manifest second.
    ctx["guide_pin"] = _guide_pin(ctx["log"], ctx["harvest_rows"])

    # The publisher pin declared by the target's own build workflow.
    ctx["workflow_publisher_pin"] = _workflow_pin(target)

    # Language variant directories.
    ctx["language_dirs"] = _language_dirs(ctx["variants"], rendered)

    # How many artefacts the rendered index lists.
    ctx["indexed_artifact_count"] = None
    if ctx["variants"]:
        index = read_text(os.path.join(ctx["variants"][0], "artifacts.html")) or ""
        hrefs = set(os.path.basename(h) for h in re.findall(r'href="([^"]+\.html)"', index))
        types = set(k.split("/", 1)[0] for k in ctx["generated"]) or {"StructureDefinition"}
        ctx["indexed_artifact_count"] = sum(
            1 for h in hrefs if any(h.startswith(t + "-") for t in types))
    return ctx


def _page_titles(ig):
    out = []
    if not isinstance(ig, dict):
        return out

    def walk(page):
        if not isinstance(page, dict):
            return
        title = page.get("title")
        if title and title not in out:
            out.append(title)
        for sub in page.get("page", []) or []:
            walk(sub)
    walk(((ig.get("definition") or {}).get("page")) or {})
    return out


def _po_units(text):
    """{msgid: msgstr}. An empty msgstr is a real value here, not an absence."""
    out = {}
    if not text:
        return out
    msgid = None
    for line in text.splitlines():
        m = re.match(r'^msgid\s+"(.*)"$', line)
        if m:
            msgid = m.group(1)
            continue
        m = re.match(r'^msgstr\s+"(.*)"$', line)
        if m and msgid is not None:
            out[msgid] = m.group(1)
            msgid = None
    out.pop("", None)
    return out


def _harvest_rows(path):
    txt = read_text(path)
    if txt is None:
        return None
    lines = txt.splitlines()
    if not lines:
        return []
    header = lines[0].split("\t")
    rows = []
    for line in lines[1:]:
        cols = line.split("\t")
        rows.append(dict(zip(header, cols)))
    return rows


def _page_map(path):
    txt = read_text(path)
    if txt is None:
        return None
    out = {}
    for line in txt.splitlines():
        if not line.strip() or line.startswith("#"):
            continue
        cols = line.split("\t")
        if cols[0] in ("source_page", "source"):
            continue
        src = cols[0].strip()
        tgt = cols[1].strip() if len(cols) > 1 else ""
        reason = cols[2].strip() if len(cols) > 2 else ""
        out[src] = (tgt, reason)
    return out


def _derived_rows(path):
    """migration-log/derived-content.tsv -> [{page, lang, kind, source, gate, line,
    excerpt}], or None when the ledger does not exist.

    None and [] are different answers and C7 treats them as such: no ledger means
    "nobody scanned", which is NICHT PRUEFBAR; an empty ledger means "scanned, no
    marker found", which is a measurement.
    """
    txt = read_text(path)
    if txt is None:
        return None
    rows = []
    for line in txt.splitlines():
        if not line.strip() or line.startswith("#"):
            continue
        cols = [c.strip() for c in line.split("\t")]
        if cols[0] in ("page", "source_page"):
            continue                          # the header row, written or not
        row = dict(zip(DERIVED_COLUMNS, cols))
        for col in DERIVED_COLUMNS:
            row.setdefault(col, "")
        rows.append(row)
    return rows


def _log_values(entries):
    """Per ACTION, the last `key=value` tokens the log recorded for it."""
    out = {}
    for e in entries or []:
        d = out.setdefault(e["action"], {})
        for k, v in re.findall(r"\b([a-z_]+)=([^\s]+)", e["detail"]):
            d[k] = v
    return out


def _shape_from_log(entries):
    for e in entries or []:
        if e["action"] == "classify-source-shape":
            m = re.search(r"shape=([AB])", e["detail"])
            if m:
                return m.group(1)
    return None


def _guide_pin(entries, rows):
    """The guide version the run actually used, and where that was read.

    The manifest is preferred over the log: it records the URL each page was
    FETCHED from, while a log line may be a discovery hop, a warning about an
    unpinnable guide, or an example. Both are reported with their source so a
    reader can tell which one they are looking at.
    """
    for r in rows or []:
        m = re.search(r"[?&]version=([^\s&]+)", r.get("url", ""))
        if m:
            return m.group(1), "guide-harvest.tsv (the URL pages were fetched from)"
    for e in entries or []:
        m = re.search(r"[?&]version=([^\s&\"'`]+)", e["detail"])
        if m:
            return m.group(1), "run.log, action %s" % e["action"]
    return None, None


def _workflow_pin(target):
    for path in sorted(glob.glob(os.path.join(target, ".github", "workflows", "*.y*ml"))):
        txt = read_text(path) or ""
        m = re.search(r"^\s*(?:IG_)?PUBLISHER_VERSION:\s*['\"]?v?([0-9][0-9.]*)",
                      txt, re.M | re.I)
        if m:
            return m.group(1)
    return None


def _language_dirs(variants, rendered):
    """(default variant, [translated variants]).

    The IG Publisher writes each language into its own directory; which one is
    the default is not in the directory name, so it is read from the site root's
    redirect where there is one, and otherwise from the sushi default (`en`).
    """
    if not variants:
        return None, []
    named = {os.path.basename(v): v for v in variants}
    default = named.get("en") or (variants[0] if len(variants) == 1 else None)
    if default is None:
        return None, []
    others = [v for v in variants if v != default and os.path.basename(v) != os.path.basename(rendered)]
    return default, others


# --- output -----------------------------------------------------------------

def write_findings(path, findings):
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    with open(path, "w", encoding="utf-8") as fh:
        fh.write("\t".join(Findings.COLUMNS) + "\n")
        for r in findings.rows:
            fh.write("\t".join(str(r[c]) for c in Findings.COLUMNS) + "\n")


def write_markdown(path, findings, ctx, a):
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    div = findings.by_verdict(DIVERG)
    unm = findings.by_verdict(UNMECH)
    with open(path, "w", encoding="utf-8") as fh:
        fh.write("## Verification (generated — do not retype)\n\n")
        fh.write("Produced by `verify-migration.py` from the target tree AND "
                 "`migration-log/run.log`, the two oracles. "
                 "**%d IDENTISCH · %d DIVERGIERT · %d NICHT PRÜFBAR.**\n\n"
                 % (len(findings.by_verdict(IDENT)), len(div), len(unm)))
        fh.write("Verdicts: **IDENTISCH** = matches the source · **DIVERGIERT** = differs, named "
                 "below · **NICHT PRÜFBAR** = could not be checked, which is **not** a pass and "
                 "owes a named human an action.\n\n")
        fh.write("| Layer | Check | What it asks | IDENTISCH | DIVERGIERT | NICHT PRÜFBAR |\n")
        fh.write("|---|---|---|---|---|---|\n")
        for check in findings.checks():
            rows = [r for r in findings.rows if r["check"] == check]
            fh.write("| %s | %s | %s | %d | %d | %d |\n" % (
                rows[0]["layer"], check, CHECK_TITLES.get(check, "—"),
                sum(1 for r in rows if r["verdict"] == IDENT),
                sum(1 for r in rows if r["verdict"] == DIVERG),
                sum(1 for r in rows if r["verdict"] == UNMECH)))
        fh.write("\n### DIVERGIERT — each one a stop or a recorded decision\n\n")
        if not div:
            fh.write("none\n")
        else:
            fh.write("| id | Check | What it asks | Subject | Evidence | Next action | Auto-fixable |\n")
            fh.write("|---|---|---|---|---|---|---|\n")
            for r in div:
                fh.write("| `%s` | %s | %s | %s | %s | %s | %s |\n" % (
                    r["id"], r["check"], CHECK_TITLES.get(r["check"], "—"),
                    r["subject"], r["evidence"], r["action"],
                    "yes — `%s`" % r["autofix"] if r["autofix"] != "-" else "no"))
        fh.write("\n### NICHT PRÜFBAR — not a pass; each needs a human\n\n")
        if not unm:
            fh.write("none\n")
        else:
            fh.write("| id | Check | What it asks | Subject | Why not mechanisable | Who does what |\n")
            fh.write("|---|---|---|---|---|---|\n")
            for r in unm:
                fh.write("| `%s` | %s | %s | %s | %s | %s |\n" % (
                    r["id"], r["check"], CHECK_TITLES.get(r["check"], "—"),
                    r["subject"], r["evidence"], r["action"]))
        fh.write("\n**Inputs:** target `%s` · source `%s` · rendered `%s` · log `%s`\n"
                 % (a.target, a.source or "— (not supplied)", a.rendered, a.log))


# --- main -------------------------------------------------------------------

def main(argv):
    here = os.path.dirname(os.path.abspath(__file__))
    p = argparse.ArgumentParser(add_help=False)
    p.add_argument("--target", default=".")
    p.add_argument("--source")
    p.add_argument("--rendered")
    p.add_argument("--log")
    p.add_argument("--harvest-tsv", dest="harvest_tsv")
    p.add_argument("--harvest-dir", dest="harvest_dir")
    p.add_argument("--source-html", dest="source_html")
    p.add_argument("--page-map", dest="page_map")
    p.add_argument("--derived-tsv", dest="derived_tsv")
    p.add_argument("--source-lang", dest="source_lang", default="de")
    p.add_argument("--source-guide-tree", dest="source_guide_tree",
                   help="directory name under <source>/implementation-guides/ to "
                        "treat as the authoritative guide tree (overrides the "
                        "highest-version-in-source-language ranking)")
    p.add_argument("--template-latest", dest="template_latest")
    p.add_argument("--publisher-pin", dest="publisher_pin")
    p.add_argument("--expected-steps", dest="expected_steps",
                   default=os.path.join(here, "..", "references", "expected-steps.tsv"))
    p.add_argument("--template-pages", dest="template_pages",
                   default=os.path.join(here, "..", "references", "template-pages.tsv"))
    p.add_argument("--template-artifacts", dest="template_artifacts",
                   default=os.path.join(here, "..", "references", "template-artifacts.tsv"))
    p.add_argument("--shape", choices=("A", "B"))
    p.add_argument("--layers", default=",".join(LAYERS))
    p.add_argument("--findings")
    p.add_argument("--markdown")
    p.add_argument("--max-list", dest="max_list", type=int, default=3)
    p.add_argument("-h", "--help", action="store_true")
    a = p.parse_args(argv)
    if a.help:
        print(__doc__)
        return 0

    if not os.path.isdir(a.target):
        log("ERROR", "setup: --target is not a directory  target=%s exit=2" % a.target)
        return 2
    logdir = os.path.join(a.target, "migration-log")
    a.log = a.log or os.path.join(logdir, "run.log")
    a.harvest_tsv = a.harvest_tsv or os.path.join(logdir, "guide-harvest.tsv")
    a.harvest_dir = a.harvest_dir or os.path.join(logdir, "guide-harvest", "pagecontent")
    a.source_html = a.source_html or os.path.join(logdir, "guide-harvest", "html")
    a.page_map = a.page_map or os.path.join(logdir, "page-map.tsv")
    a.derived_tsv = a.derived_tsv or os.path.join(logdir, "derived-content.tsv")
    a.findings = a.findings or os.path.join(logdir, "verification-findings.tsv")
    a.markdown = a.markdown or os.path.join(logdir, "verification.md")

    selected = [x.strip() for x in a.layers.split(",") if x.strip()]
    unknown = [x for x in selected if x not in LAYERS]
    if unknown:
        log("ERROR", "setup: unknown layer(s) %s  known=%s exit=2"
            % (",".join(unknown), ",".join(LAYERS)))
        return 2

    # The authoritative guide tree, chosen by the SAME rule as the advice
    # script and named in the start line: the union source set is only
    # reviewable when the run says which tree it measured against.
    a.guide_tree_path, a.guide_tree_name = _choose_source_guide_tree(
        a.source, a.source_lang, a.source_guide_tree)

    log("INFO", "%s  target=%s source=%s guide_tree=%s rendered=%s log=%s layers=%s"
        % (OPEN_WORD, a.target, a.source or "-", a.guide_tree_name or "-",
           a.rendered or "<target>/output", a.log, ",".join(selected)))

    ctx = build_context(a)
    f = Findings()
    runners = {"conservation": layer_conservation, "fidelity": layer_fidelity,
               "provenance": layer_provenance, "rendering": layer_rendering,
               "log": layer_log}
    for name in selected:
        runners[name](f, a, ctx)

    # One line per check, then one WARN per check that diverged or could not run.
    for check in f.checks():
        rows = [r for r in f.rows if r["check"] == check]
        layer = rows[0]["layer"]
        nd = sum(1 for r in rows if r["verdict"] == DIVERG)
        nu = sum(1 for r in rows if r["verdict"] == UNMECH)
        ni = len(rows) - nd - nu
        log("INFO", "%s %s  identisch=%d divergiert=%d nicht_pruefbar=%d"
            % (layer, check, ni, nd, nu))
        if nd:
            subjects = [r["subject"] for r in rows if r["verdict"] == DIVERG]
            log("WARN", "verification-divergence: %s %s  count=%d subjects=%s%s"
                % (layer, check, nd, ", ".join(subjects[:a.max_list]),
                   " …" if nd > a.max_list else ""),
                ["Each is a row in %s with its evidence and its next action."
                 % os.path.relpath(a.findings, a.target)])
        if nu:
            subjects = [r["subject"] for r in rows if r["verdict"] == UNMECH]
            log("WARN", "not-mechanisable: %s %s  count=%d subjects=%s%s"
                % (layer, check, nu, ", ".join(subjects[:a.max_list]),
                   " …" if nu > a.max_list else ""),
                ["NOT a pass. Each names the human action it needs; they belong in the",
                 "report's decision queue, and the exit status distinguishes them (3)."])

    write_findings(a.findings, f)
    write_markdown(a.markdown, f, ctx, a)

    nd = len(f.by_verdict(DIVERG))
    nu = len(f.by_verdict(UNMECH))
    ni = len(f.by_verdict(IDENT))
    status = 1 if nd else (3 if nu else 0)
    log("INFO" if status == 0 else "WARN",
        "%s  identisch=%d divergiert=%d nicht_pruefbar=%d findings=%s markdown=%s exit=%d"
        % (CLOSE_WORD, ni, nd, nu, a.findings, a.markdown, status),
        [] if status == 0 else
        ["exit 1 = at least one DIVERGIERT; exit 3 = none, but verification is INCOMPLETE",
         "because a check could not be mechanised. Neither is a pass."])
    return status


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
