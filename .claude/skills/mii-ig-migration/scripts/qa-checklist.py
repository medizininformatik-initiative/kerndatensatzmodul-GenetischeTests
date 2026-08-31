#!/usr/bin/env python3
"""qa-checklist -- render the migration's open obligations as a per-gate
GitHub task-list (checkboxes), generated from the machine ledgers.

WHY THIS EXISTS. The migration report already names every open item, who
decides it and what happens if nobody acts -- but it names them in prose
blocks spread over a long document, and a reviewer working a sign-off wants
one list they can tick. This script is that list's GENERATOR: it reads the
same ledgers the report reads (never the report itself, so the two cannot
drift apart by retyping) and emits one `- [ ]` item per open obligation,
grouped by the human gate that owns it. Pasted into the report's *Sign-off*
section -- which is delivered as a pull-request body -- the items render as
real, clickable checkboxes and the PR shows tick progress.

WHAT BECOMES A CHECKBOX, and from which ledger:

  * verification-findings.tsv -- every row whose verdict is DIVERGIERT
    ("fix it, or accept it with a named reason") or NICHT PRUEFBAR ("do the
    named action so the check can run"; NOT a pass). IDENTISCH rows owe
    nobody anything and are only counted.
  * identity-claims.tsv -- every identity field for which two sources claim
    DIFFERENT values (the L3 class, rendered per field so each is decidable
    on its own). When this file is present, L3 rows from the findings are
    skipped -- the per-field items replace the one-line summary.
  * derived-content.tsv -- migration-written content, grouped per page and
    language ("review N block(s) on <page>"), under the gate the marker
    itself names.
  * page-map.tsv -- every RETIRED row ("confirm the retirement") and every
    harvested-twin row ("confirm the twin binding").
  * plus the FIXED release items every migration owes Gate D: the pre/post
    delta clean or explained, CI green, gates A-C signed, and the
    publication decision itself.

Items the ledgers cannot know -- the report-authored DEC-n / REV-n / QA-n
blocks -- get a clearly marked placeholder the report author fills in; the
generator cannot enumerate judgement, only measurements.

Usage:

  qa-checklist.py [--log-dir migration-log] [--out FILE]
                  [--findings FILE] [--claims FILE] [--derived FILE]
                  [--map FILE]

    --log-dir DIR    where the ledgers live (default: migration-log)
    --findings FILE  verification-findings.tsv override
    --claims FILE    identity-claims.tsv override
    --derived FILE   derived-content.tsv override
    --map FILE       page-map.tsv override
    --out FILE       write the Markdown here (default: stdout)

A missing ledger never crashes the run: its section says so, loudly --
"cannot enumerate" is a finding a reviewer must see, not an empty list that
reads as "nothing to do".

Exit codes: 0 always when the render succeeded (the checklist is a
rendering; the exit-1 verdicts belong to the verifier and the delta), 2 on
setup errors.

stdlib only, like the rest of the catalog's scripts.
"""

from __future__ import annotations

import argparse
import os
import sys
from collections import OrderedDict

# Which human gate owns which verification check. Mirrors codes.md: Gate A
# decides identity, B the narrative, C the language, D release governance
# and the protocol an auditor reads. L3 sits with A because an identity
# contradiction is an identity decision, not a log defect.
GATE_OF_CHECK = {
    "F1": "A", "F2": "A", "F3": "A", "F4": "A", "L3": "A", "C1": "A",
    "C2": "B", "C3": "B", "C4": "B", "C5": "B", "C6": "B",
    "R1": "B", "R2": "B", "R4": "B",
    "C7": "C", "R3": "C", "R5": "C",
    "P1": "D", "P2": "D", "P3": "D", "P4": "D", "P5": "D",
    "L0": "D", "L1": "D", "L2": "D", "L4": "D",
}

GATE_TITLES = OrderedDict((
    ("A", "Gate A — identity (module maintainer, with TF-KDS)"),
    ("B", "Gate B — narrative (the module's clinical and technical authors)"),
    ("C", "Gate C — language (a reviewer competent in both languages)"),
    ("D", "Gate D — release (TF-KDS / AG IOP / NSG; merging is what publishes)"),
))

# One short plain-language gloss per check id, so a checkbox is readable
# without the codes file open. Kept consistent with references/codes.md.
CHECK_GLOSS = {
    "C1": "every source artefact still exists",
    "C2": "every artefact reachable from the Artifacts page",
    "C3": "every source page migrated or explicitly retired",
    "C4": "the source's narrative text present somewhere",
    "C5": "menus lead somewhere; every page is in a menu",
    "C6": "text landed on the page the map promised",
    "C7": "migration-written content is marked as such",
    "F1": "module identity unchanged",
    "F2": "dependency pins identical to the source's",
    "F3": "licence asserted from evidence",
    "F4": "no mechanical FSH conversion residue",
    "P1": "rendered site reports its template package",
    "P2": "vendored template ref matches the log",
    "P3": "IG Publisher version matches the workflow pin",
    "P4": "source guide pinned to a published version",
    "P5": "ig.ini points at the IG resource the build writes",
    "R1": "tables, tabs and images render with content",
    "R2": "page header/footer metadata render correctly",
    "R3": "a translated page really differs from the default",
    "R4": "no links to deleted template examples",
    "R5": "every page has a title unit in the translation catalogue",
    "L0": "a run log exists",
    "L1": "every partial-success warning acted on",
    "L2": "every expected step wrote a log line",
    "L3": "no identity contradiction still open",
    "L4": "the log's counts agree with the tree",
}


def read_tsv(path):
    """Rows of a tab-separated file, or None when the file is absent.  The
    caller renders absence loudly; this function only reports it."""
    if not path or not os.path.isfile(path):
        return None
    rows = []
    with open(path, encoding="utf-8") as handle:
        for line in handle:
            line = line.rstrip("\n")
            if line.strip():
                rows.append(line.split("\t"))
    return rows


def clip(text, limit=300):
    text = " ".join(str(text).split())
    return text if len(text) <= limit else text[: limit - 1] + "…"


def findings_items(rows, skip_l3):
    """(gate, line) per finding that owes someone an action.  Findings of the
    SAME check with the SAME action collapse into one checkbox carrying every
    id - six identical boxes are five opportunities to stop reading, one box
    with six ids is one decision applied six times."""
    counted = {"IDENTISCH": 0}
    if rows is None:
        return None, counted
    grouped = OrderedDict()
    for row in rows[1:] if rows and rows[0][:1] == ["id"] else rows:
        if len(row) < 4:
            counted["malformed"] = counted.get("malformed", 0) + 1
            continue
        fid, _layer, check, verdict = row[0], row[1], row[2], row[3]
        subject = row[4] if len(row) > 4 else ""
        action = row[7] if len(row) > 7 else ""
        if verdict == "IDENTISCH":
            counted["IDENTISCH"] += 1
            continue
        if check == "L3" and skip_l3:
            continue
        # collapse across the two accepted spellings of the not-checkable
        # verdict, so identical obligations merge into one box
        verdict_class = "DIVERGIERT" if verdict == "DIVERGIERT" else "NP"
        detail = clip(action if action not in ("", "-") else subject)
        grouped.setdefault((check, verdict_class, detail), []).append(fid)
    items = []
    for (check, verdict_class, detail), fids in grouped.items():
        gate = GATE_OF_CHECK.get(check, "D")
        gloss = CHECK_GLOSS.get(check, "")
        if verdict_class == "DIVERGIERT":
            ask = "fix it, or accept it with a named reason in the report"
        else:
            ask = "do the named action so the check can run - this is not a pass"
        label = fids[0] if len(fids) == 1 else "%s ×%d" % (check, len(fids))
        tail = "" if len(fids) == 1 else "  <sub>ids: %s</sub>" % ", ".join(fids)
        items.append((gate, "- [ ] **%s** (%s - %s): %s — *%s*%s"
                      % (label, check, gloss, detail, ask, tail)))
    return items, counted


def claims_items(rows):
    """One Gate-A item per identity field with CONTRADICTING claims.
    Columns per migration-log.sh claim: timestamp, field, tier, source,
    value, spec-ref, action."""
    if rows is None:
        return None
    by_field = OrderedDict()
    for row in rows:
        if len(row) < 5:
            continue
        field, source, value = row[1], row[3], row[4]
        normalized = " ".join(str(value).split())
        by_field.setdefault(field, OrderedDict()).setdefault(normalized, source)
    items = []
    for field, values in by_field.items():
        if len(values) < 2:
            continue
        listed = " vs ".join("`%s` (%s)" % (clip(v, 60), s)
                             for v, s in values.items())
        items.append(("A", "- [ ] **identity `%s`** claims %d different "
                          "values: %s — *choose one and record why*"
                      % (field, len(values), listed)))
    return items


def derived_items(rows):
    """One item per (gate, page): review the migration-written blocks."""
    if rows is None:
        return None
    grouped = OrderedDict()
    header_skipped = False
    for row in rows:
        if not header_skipped and row[:1] == ["page"]:
            header_skipped = True
            continue
        if len(row) < 5:
            continue
        page, lang, kind, gate = row[0], row[1], row[2], row[4]
        key = (gate if gate in GATE_TITLES else "C", page)
        entry = grouped.setdefault(key, {"count": 0, "kinds": OrderedDict(),
                                         "langs": OrderedDict()})
        entry["count"] += 1
        entry["kinds"][kind] = True
        entry["langs"][lang] = True
    items = []
    for (gate, page), entry in grouped.items():
        items.append((gate, "- [ ] **`%s`**: review %d migration-written "
                            "block(s) (%s; %s) — *keep, correct, or delete "
                            "each one*"
                      % (page, entry["count"],
                         ", ".join(entry["kinds"]),
                         "/".join(entry["langs"]))))
    return items


def map_items(rows):
    """Gate-B items from the page map: retirements and harvested twins."""
    if rows is None:
        return None
    items = []
    for row in rows:
        if not row or row[0].startswith("#") or len(row) < 3:
            continue
        source, target, reason = row[0], row[1], row[2]
        if target == "RETIRED":
            items.append(("B", "- [ ] **`%s` RETIRED**: %s — *confirm nothing "
                               "in it is needed*" % (source, clip(reason))))
        elif reason.startswith("harvested twin"):
            items.append(("B", "- [ ] **`%s`**: %s — *confirm it IS the same "
                               "page as its primary*" % (source, clip(reason))))
    return items


FIXED_D = (
    "- [ ] **pre/post delta**: `prepost-delta.md` shows no REGRESSION row, or "
    "every regression is explained in the report — *never merged unexplained*",
    "- [ ] **CI**: the module's own checks are green on the migration branch",
    "- [ ] **gates A–C**: signed by the named reviewers above",
    "- [ ] **publication decision**: recorded with name and date — "
    "*merging is what publishes*",
)

AUTHOR_BLOCK = (
    "<!-- REPORT-AUTHORED ITEMS - the generator cannot enumerate judgement.",
    "     Add ONE checkbox per DEC-n / REV-n / QA-n block of this report,",
    "     under the gate that owns it, in the form:",
    "     - [ ] **DEC-1** <its one-line what> - *<its next action>*  -->",
)


def main(argv=None):
    parser = argparse.ArgumentParser(
        description="Render the migration's open obligations as a per-gate "
                    "task list, generated from the ledgers.")
    parser.add_argument("--log-dir", default="migration-log")
    parser.add_argument("--findings")
    parser.add_argument("--claims")
    parser.add_argument("--derived")
    parser.add_argument("--map", dest="map")
    parser.add_argument("--out")
    args = parser.parse_args(argv)

    def ledger(override, name):
        return override or os.path.join(args.log_dir, name)

    paths = {
        "findings": ledger(args.findings, "verification-findings.tsv"),
        "claims": ledger(args.claims, "identity-claims.tsv"),
        "derived": ledger(args.derived, "derived-content.tsv"),
        "map": ledger(args.map, "page-map.tsv"),
    }
    tables = {key: read_tsv(path) for key, path in paths.items()}

    f_items, counted = findings_items(tables["findings"],
                                      skip_l3=tables["claims"] is not None)
    sources = [
        ("verification findings", paths["findings"], f_items),
        ("identity claims", paths["claims"], claims_items(tables["claims"])),
        ("derived content", paths["derived"], derived_items(tables["derived"])),
        ("page map", paths["map"], map_items(tables["map"])),
    ]

    per_gate = OrderedDict((gate, []) for gate in GATE_TITLES)
    missing = []
    for label, path, items in sources:
        if items is None:
            missing.append((label, path))
            continue
        for gate, line in items:
            per_gate.setdefault(gate, []).append(line)

    out = []
    out.append("### QA checklist (GENERATED by qa-checklist.py — do not "
               "retype; regenerate instead)")
    out.append("")
    out.append("One checkbox per open obligation, from the machine ledgers. "
               "Ticking a box asserts the *named person* did the *named "
               "thing*. This list belongs inside "
               "`migration-log/migration-report.md` (section *Sign-off*): "
               "the detail behind every item id, the glossary for every "
               "code, term, gate owner and source shape, and the *How to "
               "re-run* commands all live there (and in the skill's "
               "`references/codes.md`). Pages named bare live in "
               "`input/pagecontent/`; names ending in `-intro` live in "
               "`input/intro-notes/`. %d finding(s) verdicted IDENTISCH owe "
               "nobody anything and are not listed."
               % counted.get("IDENTISCH", 0))
    out.append("")
    if counted.get("malformed"):
        out.append("> ⚠ **%d finding row(s) were malformed** (fewer than 4 "
                   "columns) and could not become checkboxes — regenerate "
                   "`verification-findings.tsv` before signing anything."
                   % counted["malformed"])
        out.append("")
    for label, path in missing:
        out.append("> ⚠ **%s ledger not found** (`%s`) — its items CANNOT be "
                   "enumerated. That is itself a finding: run the step that "
                   "writes it, then regenerate this checklist." % (label, path))
        out.append("")
    for gate, title in GATE_TITLES.items():
        out.append("#### %s" % title)
        out.append("")
        items = per_gate.get(gate, [])
        if gate == "D":
            items = items + list(FIXED_D)
        if items:
            out.extend(items)
        else:
            out.append("*(no open items from the ledgers)*")
        out.append("")
    out.extend(AUTHOR_BLOCK)
    out.append("")

    text = "\n".join(out)
    if args.out:
        directory = os.path.dirname(os.path.abspath(args.out))
        if directory and not os.path.isdir(directory):
            os.makedirs(directory)
        with open(args.out, "w", encoding="utf-8") as handle:
            handle.write(text)
        total = sum(len(v) for v in per_gate.values()) + len(FIXED_D)
        sys.stderr.write("qa-checklist: %d checkbox(es) across %d gates%s "
                         "-> %s\n"
                         % (total, len(GATE_TITLES),
                            ", %d ledger(s) MISSING" % len(missing)
                            if missing else "", args.out))
    else:
        sys.stdout.write(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
