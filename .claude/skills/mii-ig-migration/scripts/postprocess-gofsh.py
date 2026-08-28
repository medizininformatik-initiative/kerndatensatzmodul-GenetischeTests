#!/usr/bin/env python3
"""postprocess-gofsh -- repair the two MECHANICAL defects goFSH leaves behind when
it converts a raw FHIR resource repository (Forge/Simplifier, XML+JSON) into FSH.

Path B of the migration (SKILL.md step 2b, spec §5.1b) starts from a repository
that has no SUSHI scaffolding at all and derives the FSH from the conformance
resources themselves. goFSH does that conversion well, but two artefacts of the
XML sources survive into the FSH and make SUSHI fail. Both are mechanical, both
are safe to repair, and neither is a modelling decision:

  1. `fhir_comments` RULES. XML comments in the source are carried into the FSH as
     assignment rules on a `.fhir_comments` element. `fhir_comments` is an
     XML-serialization construct, not a FHIR element, so SUSHI rejects every one of
     them: "The element or path you referenced does not exist: <path>.fhir_comments".
     MEASURED on the MII KDS Consent module (20 source resources, goFSH 2.6.1,
     SUSHI 3.20.0): 53 occurrences in 4 instance files, 30 SUSHI errors.
     By default the rule is turned into an FSH `//` comment rather than deleted --
     the text is authored source content (in the Consent module, German annotations
     explaining each provision) and a migration does not silently discard it. Pass
     `--drop-comments` to remove the lines outright.

  2. BARE SYSTEM NAMES CONTAINING WHITESPACE in code references. When a CodeSystem's
     `name` contains spaces, goFSH normalizes it for the FSH entity declaration and
     says so -- "has name with whitespace (MII CS Consent Policy). Converting
     whitespace to underscores (MII_CS_Consent_Policy)" -- but still emits the
     UN-normalized name in the code references to it:
         * provision.provision[=].code = MII CS Consent Policy#2.16...5.3.6 "MDAT erheben"
     which is not parseable FSH. SUSHI reports "extraneous input 'CS'" and "Cannot
     find definition for Instance: MII", and the parse error stops it reading the
     rest of that file. MEASURED on the same module: 39 references in 3 files,
     6 SUSHI errors. The repair uses the normalized name goFSH itself reports, and
     is applied only after the normalized name has been confirmed to exist as a
     declared FSH entity in the same tree.

  NOT touched: the CodeSystem's own `* ^name = "MII CS Consent Policy"` caret rule.
  That is a real element value of a published resource -- guardrail 1 -- and SUSHI
  only warns about it ("may not be suitable for machine processing applications").
  Rewriting it would change published content to silence a warning.

CONSERVATIVE BY CONSTRUCTION, AND WHERE THAT STOPS. Classification is
all-or-nothing: every occurrence in every file is classified BEFORE anything is
written, and if one of them belongs to a target family but does not have the
shape this script models, NOTHING is written at all, the line is named, and the
run exits 1. An unrecognized pattern is a signal to look, never a licence to
guess (SKILL.md guardrail 3).

The WRITE phase is NOT all-or-nothing, and the docstring used to claim
otherwise. Files are written one at a time, so an OS-level write failure part
way through leaves the tree PARTIALLY repaired. That case exits 2 and reports how
many files were already written; restore the tree from the goFSH output and
re-run. A re-run over a partly repaired tree is safe in any case -- the script is
idempotent (repaired lines no longer match either pattern).

It does not make the build clean. Genuinely unresolvable parents -- above all a
foreign IG package that ships no snapshots -- are architectural and remain after
this script has run; they are a Gate-A escalation, not a post-processing task.
On the Consent module the measured effect was 41 SUSHI errors before, 5 after
(3 missing snapshots plus the 2 InstanceOf errors consequent on them).

Usage:

  postprocess-gofsh.py FSH_DIR [--gofsh-log FILE] [--dry-run] [--drop-comments]

    FSH_DIR         the goFSH output root, or its `input/fsh` directory. Searched
                    RECURSIVELY for *.fsh. An empty target set is a setup error,
                    never a pass. Do NOT narrow it to a single sub-directory:
                    a repair is only applied once the normalized name has been
                    confirmed against the entity declarations, and those live in
                    sibling directories.
    --gofsh-log     the goFSH run's log. Its "Converting whitespace to
                    underscores" lines are read as the AUTHORITATIVE name mapping.
                    Without it the normalization is recomputed (whitespace runs ->
                    `_`) and then verified against the declared entities, which is
                    the same check the log-supplied names get.
    --dry-run       report what would change; write nothing.
    --drop-comments delete `fhir_comments` rules instead of preserving their text
                    as FSH `//` comments.
    -h, --help      print this text on stdout and exit 0.

Exit codes: 0 = classified and written (or nothing to repair, or --dry-run with
everything classified); 1 = at least one occurrence could not be classified --
NOTHING was written, the lines are listed, repair them by hand or extend this
script; 2 = setup error, nothing written: bad arguments, unreadable FSH_DIR,
unreadable log, or no *.fsh files found.

OUTPUT FORMAT. Every line follows the migration run-log convention (spec §10):

  <UTC-ISO-8601>  <LEVEL>  <STEP>  <ACTION>  <detail>

with LEVEL one of `INFO `/`WARN `/`ERROR`, STEP the spec section this script
implements (5.1b.3) and ACTION its slug. Two spaces separate the fields;
continuation lines are indented four spaces and belong to the line above.
INFO and WARN go to stdout, ERROR to stderr, both flushed per line so the merged
stream is chronological. Capture them through the run-log helper:

  bash "$SKILL_DIR/scripts/migration-log.sh" run 5.1b.3 postprocess-gofsh \\
    --emits-runlog -- python3 "$SKILL_DIR/scripts/postprocess-gofsh.py" …

NOT `… 2>&1 | tee -a migration-log/run.log`. A pipeline's status is `tee`'s, so
that form reports 0 for the exit-1 refusal this script uses to say "nothing was
written" -- and this script's exit code IS its acceptance criterion. The helper
preserves and returns it.

stdlib only, to match the rest of the catalog's scripts.
"""
import os
import re
import sys
import time

# --- run-log convention (spec §10) ------------------------------------------
STEP = "5.1b.3"      # SKILL.md step 2b
ACTION = "postprocess-gofsh"
_LEVEL = {"INFO": "INFO ", "WARN": "WARN ", "ERROR": "ERROR"}

# `migration-log.sh run` sets MIGRATION_LOG_WRAPPED=1 in the wrapped command's
# environment. It has already logged a `start` line carrying the command ACTUALLY
# executed, and will log the matching `done`; this script emitting its own pair on
# top of that gave ONE execution two `start` lines, two `done` lines and two
# different `cmd=` values, which a reader has no way to reconcile. Wrapped, this
# script drops its own `cmd=` and calls its two lines what they really are: the
# parameters it resolved, and the result it measured. Unwrapped -- running it
# directly is still supported -- nothing changes.
WRAPPED = os.environ.get("MIGRATION_LOG_WRAPPED") == "1"
OPEN_WORD = "params" if WRAPPED else "start"
CLOSE_WORD = "result" if WRAPPED else "done"


def log(level, detail, cont=()):
    """Emit one run-log line, plus indented continuation lines.

    ERROR goes to stderr so that a caller redirecting only stdout still sees it.

    EVERY line is flushed immediately, and that is not a nicety. stdout is
    block-buffered when it is a pipe while stderr is not, so without the flush
    the two streams merged by `2>&1 |` come out in the WRONG ORDER: measured,
    an ERROR written last appeared FIRST in the captured log, ahead of INFO
    lines emitted seconds earlier. The run log claims to read as one
    chronological stream (spec §10.5); flushing is what makes that true.
    """
    stream = sys.stderr if level == "ERROR" else sys.stdout
    print("%s  %s  %s  %s  %s"
          % (time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
             _LEVEL[level], STEP, ACTION, detail), file=stream, flush=True)
    for line in cont:
        print("    %s" % line, file=stream, flush=True)


# A `fhir_comments` assignment rule, complete on one line, with a well-formed FSH
# string value. Anything wearing the name `fhir_comments` and NOT matching this is
# reported as unclassified rather than touched.
COMMENT_RULE = re.compile(
    r'^(?P<indent>\s*)\*\s+(?P<path>(?:[A-Za-z0-9_.\[\]=+\-]+\.)?fhir_comments)'
    r'\s*=\s*(?P<value>"(?:[^"\\]|\\.)*")\s*$'
)

# An FSH rule, split at its FIRST ` = `. The path is NOT matched with `[^=]+`:
# soft indexing writes `[=]` and `[+]` INSIDE the path, and a class that stops at
# the first `=` cuts the line in the middle of `^property[=].uri`, turning a
# perfectly good rule into a bogus finding.
RULE = re.compile(r'^(?P<pre>\s*\*\s+.*? = )(?P<value>.*)$')

# An unquoted FSH entity name that whitespace has broken into words -- the shape
# goFSH emits when it does not apply its own normalization. Anything else that
# carries whitespace ahead of a `#` in an unquoted value is reported, not guessed.
SPACED_NAME = re.compile(r'^[A-Za-z][A-Za-z0-9_-]*(?:\s+[A-Za-z0-9_-]+)+$')

# goFSH's own report of the normalization it applied but did not use consistently.
GOFSH_RENAME = re.compile(
    r'has name with whitespace \((?P<raw>[^)]+)\)\.\s*'
    r'Converting whitespace to underscores \((?P<normalized>[^)]+)\)'
)

# FSH entity declarations, used to confirm that a repaired name resolves to
# something that actually exists in this tree.
ENTITY_DECL = re.compile(
    r'^(?:Alias:\s*(?P<alias>\S+)\s*(?:=.*)?|'
    r'(?:Profile|Extension|Instance|Invariant|ValueSet|CodeSystem|RuleSet|Mapping|'
    r'Logical|Resource):\s*(?P<name>\S+))\s*$'
)

TOO_NARROW = (
    "Commonest cause: FSH_DIR is too narrow. Point it at the goFSH output root "
    "or its input/fsh so the declarations live in scope, and re-run."
)


def find_fsh(root):
    """Every *.fsh under root, sorted, so the report reads the same on every run."""
    if os.path.isfile(root):
        return [root] if root.endswith(".fsh") else []
    found = []
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = sorted(d for d in dirnames if not d.startswith("."))
        for name in sorted(filenames):
            if name.endswith(".fsh"):
                found.append(os.path.join(dirpath, name))
    return found


def read_rename_map(path):
    """Parse goFSH's whitespace-normalization warnings. Raises OSError if unreadable."""
    mapping = {}
    with open(path, encoding="utf-8", errors="replace") as fh:
        for line in fh:
            hit = GOFSH_RENAME.search(line)
            if hit:
                mapping[hit.group("raw").strip()] = hit.group("normalized").strip()
    return mapping


def declared_entities(files, texts):
    """The set of entity names declared anywhere in the tree."""
    names = set()
    for path in files:
        for line in texts[path]:
            hit = ENTITY_DECL.match(line)
            if hit:
                names.add(hit.group("alias") or hit.group("name"))
    return names


def scan(path, lines, unclassified):
    """Per-line findings for one file: (lineno, kind, payload dict).

    Appends to `unclassified` instead of repairing whenever an occurrence belongs
    to one of the two target families but does not have the shape this script
    models. The caller refuses the whole run when that list is non-empty.
    """
    findings = []
    for no, line in enumerate(lines, 1):
        if line.lstrip().startswith("//"):
            continue  # a comment, including one this script wrote on an earlier run
        if "fhir_comments" in line:
            hit = COMMENT_RULE.match(line)
            if hit:
                findings.append((no, "comment", hit.groupdict()))
            else:
                unclassified.append(
                    (path, no, line,
                     "mentions fhir_comments but is not a single-line assignment "
                     "rule on a path ending in `.fhir_comments` with a quoted value")
                )
            continue
        rule = RULE.match(line)
        if not rule:
            continue
        value = rule.group("value")
        if not value or value[0] in '"#$' or "#" not in value:
            continue  # a string, a bare code, an alias reference, or not a code at all
        system, _, rest = value.partition("#")
        if not re.search(r"\s", system.strip()) or not rest:
            continue
        if SPACED_NAME.match(system.strip()):
            findings.append((no, "code", {"pre": rule.group("pre"),
                                          "sys": system.strip(), "rest": rest}))
        else:
            unclassified.append(
                (path, no, line,
                 "unquoted value carries whitespace before a `#`, but %r is not an "
                 "entity name broken by whitespace -- this script will not rewrite "
                 "what it cannot name" % system.strip())
            )
    return findings


def main(argv):
    root, log_path, dry_run, drop = None, None, False, False
    rest = list(argv)
    while rest:
        arg = rest.pop(0)
        if arg in ("-h", "--help"):
            # Help is a successful request for help, not a setup error: stdout,
            # exit 0. (It used to print to stderr and exit 2, which made every
            # `--help` in a `set -e` script look like a failed run.)
            sys.stdout.write(__doc__)
            return 0
        if arg == "--dry-run":
            dry_run = True
        elif arg == "--drop-comments":
            drop = True
        elif arg == "--gofsh-log":
            if not rest:
                log("ERROR", "setup: --gofsh-log needs a file argument  exit=2")
                return 2
            log_path = rest.pop(0)
        elif arg.startswith("-"):
            log("ERROR", "setup: unknown option %r  exit=2" % arg,
                ["run with --help for the usage text"])
            return 2
        elif root is None:
            root = arg
        else:
            log("ERROR", "setup: more than one FSH_DIR given (%r and %r)  exit=2"
                % (root, arg))
            return 2

    if root is None:
        log("ERROR", "setup: FSH_DIR is required  exit=2",
            ["run with --help for the usage text"])
        return 2
    if not os.path.exists(root):
        log("ERROR", "setup: no such file or directory %r  exit=2" % root)
        return 2

    log("INFO", "%s%s  fsh_dir=%s dry_run=%s drop_comments=%s"
        % (OPEN_WORD,
           "" if WRAPPED else "  cmd=`postprocess-gofsh.py %s`" % " ".join(argv),
           root, dry_run, drop))

    files = find_fsh(root)
    if not files:
        log("ERROR", "setup: no *.fsh files under %s  files=0  exit=2" % root,
            ["An empty target set is never a pass. Point the script at the goFSH",
             "output root or its input/fsh directory, and check that goFSH ran with",
             "`-t json-and-xml` -- in json-only mode (the DEFAULT) it converts only",
             "the JSON resources and still exits 0."])
        return 2

    renames = {}
    if log_path is not None:
        try:
            renames = read_rename_map(log_path)
        except OSError as exc:
            log("ERROR", "setup: cannot read the goFSH log %r  exit=2" % log_path,
                ["%s" % exc,
                 "A log path that does not resolve is a SETUP ERROR, not an absent",
                 "log: continuing would recompute names that the log was supposed to",
                 "supply authoritatively. Fix the path, or omit --gofsh-log.",
                 "Nothing was written."])
            return 2

    texts = {}
    for path in files:
        try:
            with open(path, encoding="utf-8") as fh:
                texts[path] = fh.read().split("\n")
        except OSError as exc:
            log("ERROR", "setup: cannot read %s  exit=2" % path, ["%s" % exc])
            return 2

    entities = declared_entities(files, texts)
    log("INFO", "scan  files=%d entities_declared=%d gofsh_log=%s renames_reported=%d"
        % (len(files), len(entities), log_path or "(none -- names recomputed)",
           len(renames)),
        ["goFSH reported: %r -> %r" % (raw, norm)
         for raw, norm in sorted(renames.items())])

    # -- classify (writes nothing) ------------------------------------------
    unclassified, per_file = [], {}
    for path in files:
        found = scan(path, texts[path], unclassified)
        if found:
            per_file[path] = found

    # Resolve every whitespace-bearing system name before any of them is applied.
    resolved, sources = {}, {}
    for path, found in sorted(per_file.items()):
        for no, kind, hit in found:
            if kind != "code":
                continue
            system = hit["sys"]
            if system in resolved:
                continue
            if system in renames:
                candidate, source = renames[system], "goFSH log"
            else:
                candidate, source = re.sub(r"\s+", "_", system), "recomputed"
            if candidate in entities:
                resolved[system] = candidate
                sources[system] = source
            else:
                unclassified.append(
                    (path, no, texts[path][no - 1].rstrip("\n"),
                     "code reference to %r; the normalized name %r (%s) is not "
                     "declared in the SCANNED FSH tree. %s If the whole tree really "
                     "is in scope, the reference is genuinely unresolvable and must "
                     "be repaired by hand -- this script will not guess a name."
                     % (system, candidate, source, TOO_NARROW))
                )

    if unclassified:
        log("ERROR", "refused  unclassified=%d files_written=0  exit=1"
            % len(unclassified))
        for path, no, line, why in unclassified:
            log("ERROR", "unclassified  at=%s:%d" % (path, no),
                ["found:  %s" % line.strip()[:100], "reason: %s" % why])
        log("ERROR", "refused  nothing was written",
            ["Repair these by hand, or extend this script -- do not work around them",
             "by loosening a pattern. Then re-run; the script is idempotent."])
        return 1

    n_findings = sum(len(v) for v in per_file.values())
    n_code_findings = sum(1 for v in per_file.values() for f in v if f[1] == "code")

    # Silent-partial-success guard (spec §10): goFSH said it normalized a name,
    # yet no reference to it was found. Either the tree was already repaired --
    # in which case the normalized name IS declared here -- or the scan did not
    # cover the files that carry the references.
    if renames and n_code_findings == 0:
        missing = sorted(n for n in renames.values() if n not in entities)
        if missing:
            log("WARN", "silent-partial-success: goFSH reported %d whitespace "
                        "rename(s) but 0 of them were found as code references in "
                        "%d scanned file(s)" % (len(renames), len(files)),
                ["not declared in the scanned tree: %s" % ", ".join(missing),
                 TOO_NARROW])
        else:
            log("INFO", "renames_reported=%d code_references_found=0 -- the "
                        "normalized names are all declared here, so the tree was "
                        "already repaired (idempotent re-run)" % len(renames))

    # -- apply ---------------------------------------------------------------
    n_comments, n_codes, changed_files = 0, 0, 0
    for path in sorted(per_file):
        lines = texts[path]
        file_changes = []
        for no, kind, hit in per_file[path]:
            if kind == "comment":
                if drop:
                    lines[no - 1] = None
                    file_changes.append((no, "dropped fhir_comments rule on %s"
                                         % hit["path"]))
                else:
                    lines[no - 1] = "%s// fhir_comments (source XML comment on %s): %s" % (
                        hit["indent"], hit["path"], hit["value"]
                    )
                    file_changes.append((no, "fhir_comments rule on %s -> FSH comment"
                                         % hit["path"]))
                n_comments += 1
            else:
                system = hit["sys"]
                lines[no - 1] = "%s%s#%s" % (hit["pre"], resolved[system], hit["rest"])
                file_changes.append((no, "code reference %r -> %r"
                                     % (system, resolved[system])))
                n_codes += 1
        if not file_changes:
            continue
        changed_files += 1
        log("INFO", "%s  changes=%d%s"
            % (path, len(file_changes), "  (dry-run, not written)" if dry_run else ""),
            ["line %d: %s" % (no, what) for no, what in file_changes])
        if dry_run:
            continue
        try:
            with open(path, "w", encoding="utf-8") as fh:
                fh.write("\n".join(l for l in lines if l is not None))
        except OSError as exc:
            log("ERROR", "write failed at %s  files_written=%d  exit=2"
                % (path, changed_files - 1),
                ["%s" % exc,
                 "Classification is all-or-nothing; WRITING is per file, so the tree",
                 "is now PARTIALLY repaired. Restore it from the goFSH output and",
                 "re-run (the script is idempotent, so re-running over the partly",
                 "repaired tree is safe too)."])
            return 2

    if not (n_comments or n_codes):
        log("INFO", "%s  findings=%d files=%d changed=0  exit=0  "
                    "nothing to repair" % (CLOSE_WORD, n_findings, len(files)))
        return 0

    log("INFO", CLOSE_WORD + "%s  fhir_comments=%d (%s) code_references=%d changed=%d "
                "of %d file(s)  exit=0"
        % ("  DRY RUN -- nothing written" if dry_run else "",
           n_comments, "dropped" if drop else "preserved as FSH comments",
           n_codes, changed_files, len(files)))
    if dry_run:
        log("INFO", "next: nothing was repaired, so do NOT read a SUSHI run now as "
                    "evidence about the repair",
            ["Re-run without --dry-run, then run SUSHI (`npx --yes fsh-sushi@3.20.0 .`)."])
        return 0
    log("INFO", "next: run `npx --yes fsh-sushi@3.20.0 .`; remaining errors are NOT "
                "mechanical",
        ["A foreign parent IG that ships no snapshots cannot be imported at all,",
         "and that is a Gate-A escalation (obtain a snapshot-bearing package build,",
         "or record the affected profiles as blocked). Never invent a parent."])
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
