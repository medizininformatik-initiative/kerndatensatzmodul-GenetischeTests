#!/usr/bin/env python3
"""derived-scan -- find every DERIVED marker in a migrated module tree, write the
machine artefact `migration-log/derived-content.tsv`, and FAIL when a marker is
malformed, invisible in the rendered page, or missing from its language twin.

WHY THIS EXISTS. A migration does two different things to text and the rendered
IG shows no difference between them. Most of it is CARRIED -- the same sentences,
moved or split into a new page, and a reviewer who trusts them is trusting the
source. Some of it is WRITTEN: a family overview condensed out of four source
passages, a bridge sentence joining two merged sections, a CapabilityStatement
SUGGESTED where the source had none (spec 9b), an approval date invented because
nobody could find one. That text has no source to check it against, and it
renders in exactly the same black on exactly the same white as the text that
does.

The failure mode this guards is therefore not "the migration wrote something" --
it is SUPPOSED to write those things. It is that the writing becomes INVISIBLE
the moment it is on the page. Nobody at Gate B can tell the summary paragraph
from the carried paragraph by reading; the migration report lists it in a queue
that is read once, in a different window, next to the artefact it describes;
and the module ships with an invented approval date rendering as fact. Marking
puts the claim where the claim is: the reviewer meets it IN PLACE, at the moment
they are reading the page it is on.

So the marker is the contract, and this script is the part of the contract that
cannot be talked around:

    <!-- DERIVED:<kind> source=<source-page|none> gate=<A|B|C> -->
    > **Written during migration - review before release.** <the text>
    {: .ig-highlight .ig-highlight-blue}

The HTML comment is machine-readable and renders as nothing; the blockquote plus
the kramdown attribute line render the visible box (`.ig-highlight` and
`.ig-highlight-blue` already exist in the MII IG template -- this invents no CSS).
A marker without its box is the whole defect back again in a form that PASSES a
grep, which is why "comment present, box absent" is a finding here and not a
nicety.

THE KINDS ARE A CLOSED SET, and each one names a different thing a reviewer has
to do about it:

    summary    condensed or reworded from one or more source passages
    bridge     connective/intro text written to join merged sections
    suggestion content proposed where the source had none (e.g. spec 9b)
    stand-in   an invented value pending confirmation (approval date, contact, code)
    no-source  a default-language page produced where the source ships no counterpart

WHAT IS NEVER MARKED, and why the exclusion matters more than the inclusion:
verbatim carry-over, MOVED content, SPLIT content (same words, new location) and
the routine per-language mirror carry no marker. The temptation is to mark
everything the migration touched, and it is the one change that would destroy
the mechanism: a page of boxes is a page with no boxes, because the reader stops
seeing them. The marker means "these words did not exist before" -- nothing else.

THE BILINGUAL RULE. A marker exists in BOTH language mirrors of the same page,
same kind, same source -- identical in shape to the template's M11 rule for the
ILLUSTRATIVE-EXAMPLE scaffold, which likewise fails while present in only one
language. A German reader who meets an unmarked box that the English reader met
marked is being told, by the page, that the text is sourced. It is not. That
class of defect is invisible to every check that reads one language at a time,
so the twin comparison below reads them together.

PUBLICATION IS A HUMAN DECISION. A marker is an open review item, not a defect,
and this script never refuses anything on account of one: whether markers may
remain at publication is decided by a human at Gate D and recorded in the report.
What this script owns is the narrower, checkable question -- "are the markers
that exist well-formed, visible, and mirrored".

WHAT IT REPORTS AS A FINDING (each one exits non-zero -- a check that cannot fail
is decoration):

  MALFORMED    a DERIVED comment that does not parse, carries a kind outside the
               closed set, or is missing `source=` or `gate=`. Such a marker is
               excluded from the TSV rather than written through with a junk
               value: a downstream consumer reading `kind=frobnicate` is worse off
               than one reading a row that is not there and a finding that is.
  NO BOX       a marker with no blockquote and no `{: .ig-highlight }` line in the
               following 10 lines. The comment renders as nothing, so this is
               derived content that is marked for the machine and unmarked for
               every human who reads the page.
  TWIN MISSING a marker present in one language mirror of a page and absent from
               another mirror OF THE SAME PAGE that exists in the tree. Compared
               by page + kind + source, exactly as the contract states -- NOT by
               count, because a legitimately merged pair of boxes in one language
               would make a count comparison cry wolf, and a verification phase
               that cries wolf gets skipped.

DELIBERATELY NOT CHECKED, so the findings stay trustworthy: whether `source=`
names a real row in `page-map.tsv` (the map is generated by the 5.4c advice
run and human-reviewed, and may legitimately lag), whether `source=none` is used only by `suggestion`/`stand-in`,
and whether the text INSIDE the box is any good. The first two are report-queue
questions; the third is what the human gate is for. Markers inside fenced code
blocks are skipped -- documentation that SHOWS the marker shape is not itself
derived content.

Usage:

  derived-scan.py --target DIR [--out FILE] [--markdown]

    --target DIR   the migrated module repository (default: `.`)
    --out FILE     the machine artefact
                   (default: <target>/migration-log/derived-content.tsv)
    --markdown     additionally print the report block: a Markdown table grouped
                   by gate, ready to paste as report queue 2
    -h, --help     print this text and exit 0

Scanned: `input/pagecontent/*.md` and `input/intro-notes/*.md` (language
`default`), plus `input/translations/<lang>/pagecontent/*.md` and
`input/translations/<lang>/intro-notes/*.md` (language `<lang>`).

Written: the TSV, with exactly the contract header

    page  lang  kind  source  gate  line  excerpt

one row per VALID marker, `excerpt` the first 120 characters of the marked block
with whitespace collapsed.

STREAMS. stdout carries the one-line summary and, with `--markdown`, the report
block. The opening line and every finding go to stderr -- so
`derived-scan.py --markdown > queue2.md` stays pasteable and the findings still
reach a human and the raw log.

Exit codes:
    0  markers scanned, no finding -- well-formed, visible, mirrored
    1  at least one finding (the TSV is still written; it is the artefact, not
       the verdict)
    2  usage/setup error, nothing written

Run-log lines (spec section 10.2) follow the catalog convention, so this script
is wrapped as
`bash "$ML" run 11 derived-scan --emits-runlog -- python3 .../derived-scan.py …`.

stdlib only, like the rest of the catalog's scripts.
"""

from __future__ import annotations

import argparse
import os
import re
import sys
import time

# --- run-log convention (spec section 10) -----------------------------------
STEP = "11"
ACTION = "derived-scan"
_LEVEL = {"INFO": "INFO ", "WARN": "WARN ", "ERROR": "ERROR"}

# `migration-log.sh run` exports this; wrapped, our own opening/closing lines
# become `params`/`result` so one execution yields one `start` and one `done`.
WRAPPED = os.environ.get("MIGRATION_LOG_WRAPPED") == "1"
OPEN_WORD = "params" if WRAPPED else "start"
CLOSE_WORD = "result" if WRAPPED else "done"

# --- the contract, as data --------------------------------------------------

# The closed set. A kind outside it is malformed, not a new kind: the whole point
# of a closed set is that a reviewer learns five meanings once.
KINDS = {
    "summary":    "condensed or reworded from one or more source passages",
    "bridge":     "connective/intro text written to join merged sections",
    "suggestion": "content proposed where the source had none",
    "stand-in":   "an invented value pending confirmation",
    "no-source":  "a default-language page produced where the source ships none",
}

GATES = ("A", "B", "C")
GATE_TITLES = {
    "A": "identity and values",
    "B": "narrative",
    "C": "language",
}

# What the human does about each kind. Verbatim from the contract -- these
# strings are the queue-2 action column and are not paraphrased at the call site.
ACTIONS = {
    "summary":    "review the box on {page} and delete the marker and box, or correct the text",
    "bridge":     "review the box on {page} and delete the marker and box, or correct the text",
    "no-source":  "review the box on {page} and delete the marker and box, or correct the text",
    "stand-in":   "confirm or replace the value, then delete the marker and box",
    "suggestion": "adopt, replace or delete the suggested content, then delete the marker and box",
}

DEFAULT_LANG = "default"
AREAS = ("pagecontent", "intro-notes")

EXCERPT_CHARS = 120      # the artefact's excerpt width, fixed by the contract
CELL_CHARS = 90          # the report table's quote width, ours to choose
BOX_WINDOW = 10          # lines after the marker searched for a visible box

# A DERIVED comment that PARSES. Kind and attributes are captured loosely and
# validated below, so "unknown kind" reports as its own reason rather than as
# "unparseable" -- the two need different fixes.
STRICT_RE = re.compile(r"<!--\s*DERIVED:\s*(?P<kind>[A-Za-z0-9_-]+)\s*(?P<attrs>[^>]*?)\s*-->")
# Anything that LOOKS like one. Without this a marker with a typo'd or unclosed
# comment is silently not-a-marker, which is the defect wearing a disguise.
LOOSE_RE = re.compile(r"<!--\s*DERIVED\b")
ATTR_PAIR_RE = re.compile(r"([A-Za-z_][A-Za-z0-9_-]*)\s*=\s*(\S+)")

BLOCKQUOTE_RE = re.compile(r"^[ \t]{0,3}>")
# The kramdown attribute list that carries the highlight classes. `.ig-highlight`
# is the required class; the colour modifier is free.
HIGHLIGHT_RE = re.compile(r"\{:[^}]*\.ig-highlight")
ATTR_LINE_RE = re.compile(r"^[ \t]{0,3}\{:.*\}\s*$")
FENCE_RE = re.compile(r"^[ \t]{0,3}(`{3,}|~{3,})")

# The boilerplate sentence every box opens with, in whatever language the mirror
# is written in. Stripped from the queue-2 table only: repeating it in every row
# fills the column with the one thing that is identical everywhere, and the TSV
# excerpt keeps it because the contract says "first 120 chars of the block".
LEAD_BOLD_RE = re.compile(r"^\*\*[^*]{0,200}?\*\*[ \t]*")


def log(level, detail, cont=(), step=STEP, action=ACTION):
    """One run-log line plus indented continuations, flushed immediately.

    Everything except the closing summary goes to stderr: stdout is the
    machine-readable surface (the summary line, then the `--markdown` block) and
    a finding printed into the middle of a Markdown table would be pasted into
    the report along with it.
    """
    stream = sys.stdout if level == "SUMMARY" else sys.stderr
    ts = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
    print("%s  %s  %s  %s  %s"
          % (ts, _LEVEL.get(level, _LEVEL["INFO"]), step, action, detail),
          file=stream, flush=True)
    for c in cont:
        print("    %s" % c, file=stream, flush=True)


def clean(s):
    """TSV-safe and single-line: tabs and newlines are the only characters the
    format cannot carry, so they are folded rather than allowed to corrupt a row
    silently. Runs of any whitespace collapse to one space."""
    return re.sub(r"\s+", " ", str(s)).strip()


# --- what we found ----------------------------------------------------------

class Finding:
    """One defect, with the file:line a human opens to fix it.

    `code` is the greppable class (`malformed`, `no-box`, `twin-missing`); every
    finding names the exact action, because a finding whose remedy is left as an
    exercise gets rediscussed on every run.
    """

    def __init__(self, code, path, line, subject, reason, action):
        self.code = code
        self.path = path
        self.line = line
        self.subject = clean(subject)
        self.reason = clean(reason)
        self.action = clean(action)

    def where(self):
        return "%s:%d" % (self.path, self.line) if self.line else self.path


class Marker:
    """One VALID marker: a row of the machine artefact, plus the bookkeeping the
    twin comparison needs (`area`, `path`) and the artefact does not carry."""

    def __init__(self, page, lang, kind, source, gate, line, block, area, path):
        self.page = page
        self.lang = lang
        self.kind = kind
        self.source = source
        self.gate = gate
        self.line = line
        # `block` is the whole marked block, cleaned; `excerpt` is the artefact's
        # contractual first 120 characters of it. The report table quotes the
        # BLOCK and does its own shortening -- deriving the cell from the already
        # cut excerpt inherits a cut made for a different width and prints a cell
        # ending mid-word with nothing saying it was cut.
        self.block = block
        self.excerpt = block[:EXCERPT_CHARS]
        self.area = area
        self.path = path

    def where_line(self):
        return "%s:%d" % (self.path, self.line)

    def key(self):
        """Twin identity: the contract's page + kind + source, with the area kept
        out of the artefact but IN the key -- `foo.md` under pagecontent and
        `foo.md` under intro-notes are two pages that happen to share a basename,
        and pairing them would invent a twin that does not exist."""
        return (self.area, self.page, self.kind, self.source)

    def row(self):
        return (self.page, self.lang, self.kind, self.source, self.gate,
                str(self.line), self.excerpt)


COLUMNS = ("page", "lang", "kind", "source", "gate", "line", "excerpt")


# --- discovery --------------------------------------------------------------

def md_files(directory):
    try:
        names = os.listdir(directory)
    except OSError:
        return []
    return sorted(n for n in names
                  if n.endswith(".md") and os.path.isfile(os.path.join(directory, n)))


def scan_targets(target):
    """Every (lang, area, directory) the contract puts markers in.

    The default tree and the translation trees are the SAME shape deliberately:
    the twin comparison is only meaningful when a page's mirrors are found by one
    rule, and a special case for the default language is how one mirror ends up
    unscanned.
    """
    out = []
    root = os.path.join(target, "input")
    for area in AREAS:
        out.append((DEFAULT_LANG, area, os.path.join(root, area)))
    tdir = os.path.join(root, "translations")
    try:
        langs = sorted(n for n in os.listdir(tdir)
                       if os.path.isdir(os.path.join(tdir, n)))
    except OSError:
        langs = []
    for lang in langs:
        for area in AREAS:
            out.append((lang, area, os.path.join(tdir, lang, area)))
    return out


def lang_sort_key(lang):
    """`default` first, then alphabetical -- the default language is the one the
    other mirrors are mirrors OF, so it reads first in every listing."""
    return (0, "") if lang == DEFAULT_LANG else (1, lang)


# --- parsing ----------------------------------------------------------------

def read_lines(path):
    try:
        with open(path, encoding="utf-8", errors="replace") as fh:
            return fh.read().splitlines()
    except OSError as exc:
        return exc


def parse_attrs(attrs):
    pairs = {}
    for key, value in ATTR_PAIR_RE.findall(attrs):
        pairs.setdefault(key, value)
    return pairs


def collect_block(lines, i):
    """The marked block that follows the marker on line `i` (0-based).

    Returns (block_text, has_blockquote, has_highlight). The block is the
    contiguous run of blockquote lines, plus the kramdown attribute line when it
    directly follows; the two booleans answer the VISIBILITY question over the
    whole `BOX_WINDOW`, which is the wider question -- a box whose blockquote is
    four blank lines away still renders, so reporting it as invisible would be a
    false positive.
    """
    window = lines[i + 1:i + 1 + BOX_WINDOW]
    has_bq = any(BLOCKQUOTE_RE.match(l) for l in window)
    has_hl = any(HIGHLIGHT_RE.search(l) for l in window)

    j = i + 1
    limit = min(len(lines), i + 1 + BOX_WINDOW)
    while j < limit and not lines[j].strip():
        j += 1
    block = []
    while j < len(lines) and BLOCKQUOTE_RE.match(lines[j]):
        block.append(re.sub(r"^[ \t]{0,3}>[ \t]?", "", lines[j]))
        j += 1
    if not block:
        # No blockquote: fall back to the first non-blank line in the window so
        # the excerpt still points a human at something readable. The finding for
        # the missing box is raised by the caller from `has_bq`/`has_hl`.
        for l in window:
            if l.strip() and not ATTR_LINE_RE.match(l):
                block = [l]
                break
    return " ".join(block), has_bq, has_hl


def parse_file(path, page, lang, area, relpath):
    """Every marker in one file, valid ones as Markers and the rest as Findings."""
    markers, findings = [], []
    lines = read_lines(path)
    if isinstance(lines, OSError):
        findings.append(Finding(
            "malformed", relpath, 0, page,
            "file could not be read: %s" % lines,
            "check the file's permissions and encoding, then re-run"))
        return markers, findings

    fence = None
    for i, line in enumerate(lines):
        m_fence = FENCE_RE.match(line)
        if m_fence:
            token = m_fence.group(1)
            if fence is None:
                fence = token[0] * 3
                continue
            if token[0] * 3 == fence:
                fence = None
                continue
        if fence is not None:
            continue                      # a marker SHOWN in a code block is not one

        pos = 0
        while True:
            loose = LOOSE_RE.search(line, pos)
            if not loose:
                break
            pos = loose.end()
            lineno = i + 1
            strict = STRICT_RE.match(line, loose.start())
            if not strict:
                findings.append(Finding(
                    "malformed", relpath, lineno, page,
                    "marker does not parse: %s" % clean(line.strip()[:120]),
                    "rewrite it as <!-- DERIVED:<kind> source=<page|none> gate=<A|B|C> -->"))
                continue
            pos = max(pos, strict.end())

            kind = strict.group("kind")
            attrs = parse_attrs(strict.group("attrs"))
            reasons = []
            if kind not in KINDS:
                reasons.append("unknown kind '%s' (allowed: %s)"
                               % (kind, ", ".join(sorted(KINDS))))
            if "source" not in attrs:
                reasons.append("missing source=")
            if "gate" not in attrs:
                reasons.append("missing gate=")
            elif attrs["gate"] not in GATES:
                reasons.append("gate='%s' is not one of %s"
                               % (attrs["gate"], ", ".join(GATES)))
            if reasons:
                findings.append(Finding(
                    "malformed", relpath, lineno, page, "; ".join(reasons),
                    "fix the marker: <!-- DERIVED:<kind> source=<page|none> gate=<A|B|C> -->"))
                continue

            block, has_bq, has_hl = collect_block(lines, i)
            if not has_bq and not has_hl:
                findings.append(Finding(
                    "no-box", relpath, lineno, page,
                    "no blockquote and no {: .ig-highlight } line within %d lines "
                    "of the marker -- the comment renders as nothing" % BOX_WINDOW,
                    "add the visible box: a '> **Written during migration - review "
                    "before release.** …' blockquote followed by "
                    "'{: .ig-highlight .ig-highlight-blue}'"))

            markers.append(Marker(
                page=page, lang=lang, kind=kind, source=attrs["source"],
                gate=attrs["gate"], line=lineno,
                block=clean(block), area=area, path=relpath))
    return markers, findings


# --- the bilingual rule -----------------------------------------------------

def twin_findings(markers, pages):
    """A marker in one mirror and not in another mirror of the SAME page.

    `pages` maps (area, page) -> {lang: relpath}: the languages the page EXISTS
    in. A page that ships in one language only has no twin to be missing from,
    and reporting one would be reporting the absence of a file this check was
    never given -- so the comparison runs only over mirrors that are there.
    """
    seen = {}
    for m in markers:
        seen.setdefault(m.key(), {})[m.lang] = m
    findings = []
    for key in sorted(seen, key=lambda k: (k[0], k[1], k[2], k[3])):
        area, page, kind, source = key
        present = seen[key]
        mirrors = pages.get((area, page), {})
        for lang in sorted(set(mirrors) - set(present), key=lang_sort_key):
            witness = present[sorted(present, key=lang_sort_key)[0]]
            findings.append(Finding(
                "twin-missing", mirrors[lang], 0,
                "%s [%s source=%s]" % (page, kind, source),
                "marker present in lang=%s (%s) and absent from lang=%s -- the "
                "mirror renders the same text WITHOUT the box, telling that "
                "reader it is sourced"
                % (witness.lang, witness.where_line(), lang),
                "add the same marker and box to %s, same kind and same source"
                % mirrors[lang]))
    return findings


# --- outputs ----------------------------------------------------------------

def write_tsv(path, markers):
    directory = os.path.dirname(path)
    if directory:
        os.makedirs(directory, exist_ok=True)
    ordered = sorted(markers, key=lambda m: (m.area, m.page,
                                             lang_sort_key(m.lang), m.line))
    with open(path, "w", encoding="utf-8") as fh:
        fh.write("\t".join(COLUMNS) + "\n")
        for m in ordered:
            fh.write("\t".join(m.row()) + "\n")
    return len(ordered)


def rendered_page(area, page):
    """The page a reviewer actually opens.

    An intro note is not a page: `<Type>-<id>-intro.md` renders ATOP the artefact
    page `<Type>-<id>.html`, so an action saying "review the box on
    StructureDefinition-x-intro.html" sends the reviewer to a URL that does not
    exist.
    """
    if area == "intro-notes" and page.endswith("-intro"):
        return page[:-len("-intro")] + ".html"
    return page + ".html"


def md_cell(text):
    return str(text).replace("|", "\\|")


def markdown_block(markers, findings):
    """Report queue 2: one row per marker PAIR, grouped by the gate that owns it.

    Rows collapse the language mirrors (`page + kind + source`) into one line,
    because the reviewer's action is one action: the box says the same thing in
    both mirrors and both get deleted together. Splitting them would double a
    queue whose length is the number of decisions, not the number of files.
    """
    out = []
    out.append("## Queue ② — derived content written during the migration")
    out.append("")
    out.append("Text the migration WROTE, not carried. Each row renders as a highlighted "
               "box on the page named. Clearing a row means deleting the marker and its box; "
               "**whether any may remain at publication is a Gate-D decision**, recorded in "
               "the report — nothing here blocks a release by itself.")
    out.append("")
    if findings:
        out.append("> **%d marker finding(s) are open** (malformed, missing box, or missing "
                   "language twin). They are listed in this run's stderr output; the table "
                   "below covers only the markers that parsed."
                   % len(findings))
        out.append("")

    grouped = {}
    for m in markers:
        grouped.setdefault(m.key(), []).append(m)

    any_rows = False
    for gate in GATES:
        keys = [k for k in grouped
                if grouped[k][0].gate == gate]
        if not keys:
            continue
        any_rows = True
        out.append("### Gate %s — %s" % (gate, GATE_TITLES[gate]))
        out.append("")
        out.append("| Where | What was written | Derived from | Gate | Action |")
        out.append("|---|---|---|---|---|")
        for key in sorted(keys, key=lambda k: (k[0], k[1], k[2], k[3])):
            group = sorted(grouped[key], key=lambda m: lang_sort_key(m.lang))
            first = group[0]
            page_html = rendered_page(first.area, first.page)
            langs = ", ".join(m.lang for m in group)
            excerpt = LEAD_BOLD_RE.sub("", first.block).strip() or first.block
            if len(excerpt) > CELL_CHARS:
                excerpt = excerpt[:CELL_CHARS - 1].rstrip() + "…"
            out.append("| `%s` (%s) | %s _(%s)_ | %s | %s | %s |" % (
                md_cell(page_html), md_cell(langs), md_cell(excerpt),
                md_cell(first.kind), md_cell("`%s`" % first.source),
                gate, md_cell(ACTIONS[first.kind].format(page=page_html))))
        out.append("")
    if not any_rows:
        out.append("none — no derived content is marked in this module.")
        out.append("")
    return "\n".join(out)


# --- main -------------------------------------------------------------------

def main(argv):
    p = argparse.ArgumentParser(add_help=False)
    p.add_argument("--target", default=".")
    p.add_argument("--out")
    p.add_argument("--markdown", action="store_true")
    p.add_argument("-h", "--help", action="store_true")
    try:
        a = p.parse_args(argv)
    except SystemExit:
        return 2
    if a.help:
        print(__doc__)
        return 0

    if not os.path.isdir(a.target):
        log("ERROR", "setup: --target is not a directory  target=%s exit=2" % a.target)
        return 2
    out = a.out or os.path.join(a.target, "migration-log", "derived-content.tsv")
    if not os.path.isdir(os.path.join(a.target, "input")):
        log("ERROR", "setup: no input/ under --target  target=%s exit=2" % a.target,
            ["Point --target at the migrated MODULE repository (the directory holding",
             "input/pagecontent, input/intro-notes and input/translations)."])
        return 2

    log("INFO", "%s  target=%s out=%s markdown=%s"
        % (OPEN_WORD, a.target, out, "yes" if a.markdown else "no"))

    markers, findings = [], []
    pages = {}                       # (area, page) -> {lang: relpath}
    scanned_files = 0
    for lang, area, directory in scan_targets(a.target):
        for name in md_files(directory):
            path = os.path.join(directory, name)
            relpath = os.path.relpath(path, a.target)
            page = name[:-3]
            pages.setdefault((area, page), {})[lang] = relpath
            scanned_files += 1
            found, bad = parse_file(path, page, lang, area, relpath)
            markers.extend(found)
            findings.extend(bad)

    findings.extend(twin_findings(markers, pages))

    written = write_tsv(out, markers)

    # One line per finding, on stderr, each greppable by its class.
    for f in sorted(findings, key=lambda f: (f.code, f.path, f.line)):
        log("ERROR", "derived-marker-%s: %s  subject=%s  %s"
            % (f.code, f.where(), f.subject, f.reason),
            ["action: %s" % f.action])

    gate_counts = ",".join("%s:%d" % (g, sum(1 for m in markers if m.gate == g))
                           for g in GATES)
    kind_counts = ",".join("%s:%d" % (k, sum(1 for m in markers if m.kind == k))
                           for k in sorted(KINDS) if any(m.kind == k for m in markers))
    langs = sorted({m.lang for m in markers}, key=lang_sort_key)
    by_code = {}
    for f in findings:
        by_code[f.code] = by_code.get(f.code, 0) + 1
    status = 1 if findings else 0

    log("SUMMARY", "%s  files=%d markers=%d gates=%s kinds=%s langs=%s "
        "findings=%d (%s) out=%s exit=%d"
        % (CLOSE_WORD, scanned_files, written, gate_counts, kind_counts or "-",
           ",".join(langs) or "-", len(findings),
           ",".join("%s=%d" % (c, by_code[c]) for c in sorted(by_code)) or "none",
           out, status))
    if findings:
        log("WARN", "derived-scan: %d finding(s) -- a marker that does not parse, "
                    "renders no box, or is missing from a language mirror is derived "
                    "content that is NOT marked where it counts." % len(findings),
            ["Every finding above names its file:line and its exact action.",
             "The TSV was still written: it is the artefact, not the verdict."])

    if a.markdown:
        print()
        print(markdown_block(markers, findings))
    return status


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
