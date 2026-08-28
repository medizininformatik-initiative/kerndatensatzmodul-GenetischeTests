#!/usr/bin/env python3
"""page-structure-advice.py - the MEASUREMENT behind the spec 9d/9e routing decision.

WHAT IT IS FOR
--------------
Spec 9d/9e asks the migration to route every source page to one of four
destinations BEFORE any target text is written:

  1  input/intro-notes/<Type>-<id>-intro.md   (content about ONE artefact)
  2  an h3/h4 section on an artefact index page that already exists in the menu
  3  merge into an agreed page that already owns the concern
  4  its own page  -> 4a HUB or merged prose, 4b menu entry or pages:-nested

Left to judgement, that choice drifts from page to page. This script turns it
into arithmetic: it measures the SOURCE page tree, the TARGET page sizes and
the TARGET menu budget, and then prints, per source page, the branch the
measurements support and the number that forced it.

IT PROPOSES AND NEVER EDITS A MODULE.
It opens the source repository and the target repository read-only and writes
at most two files: the report named by --out (stdout when --out is omitted)
and the page-map v2 TSV named by --map - THE PRIMARY OUTPUT, the contract of
the whole narrative migration (step 3 generates and validates it, step 5
consumes only it, step 8 checks against it; the Markdown report is its
rendering). It refuses to write into the source or into the target's content;
only the target's migration-log/ is accepted. Nothing in it applies a
decision; a human (or the skill, at step 5) does that.

USAGE
-----
  python3 page-structure-advice.py --source <source-repo> \
                                  [--target <migrated-repo>] \
                                  [--out <file.md>] \
                                  [--map <page-map.tsv>] \
                                  [--routing-table <routing-table.tsv>] \
                                  [--harvest-tsv <guide-harvest.tsv>] \
                                  [--harvest-dir <pagecontent-dir>]

  --source  the ORIGINAL module repository. The page tree comes from the FIRST
            of four inputs that yields pages:
              (a) the `pages:` block of sushi-config.yaml
              (b) the AUTHORITATIVE Simplifier guide tree under
                  implementation-guides/ (spec 5.1a), walked from its toc.yaml
              (c) a flat count of input/pagecontent/*.md
              (d) the step-2c harvest manifest (spec 5.1d - the shape whose
                  narrative exists only on the rendered Simplifier guide;
                  auto-discovered from <target>/migration-log/)
            fsh-generated/resources or input/fsh give the artefact index used
            by branch 1.
  --target  the MIGRATED repository (input/includes/menu.xml for the menu
            budget, input/pagecontent/*.md for the size gate, input/intro-notes
            for artefact-anchor evidence).  Omit it before the target exists:
            the source half of the report still works, and every
            budget-dependent decision is reported as "unknown (no --target)"
            instead of being guessed.
  --guide-tree
            HUMAN OVERRIDE of the authoritative-guide-tree choice: the
            directory name under implementation-guides/. Without it the script
            picks per spec 5.1a and reports every tree, the choice and the
            reason.
  --map     write the page-map v2 TSV (header: `# source_page<TAB>target<TAB>
            reason<TAB>branch<TAB>measure`): one row per page of the SOURCE
            PAGE UNIVERSE - the authoritative guide tree UNION
            input/pagecontent UNION on-disk pages no toc lists UNION the
            step-2c harvest manifest - plus one RETIRED summary row
            (`<tree>/**`) per non-authoritative guide tree. The COVERAGE
            VALIDATION then re-derives the universe from disk and checks
            every page has a row with a non-empty target and every RETIRED
            row carries a reason; a harvest-SKIPPED page is in the universe
            with no routable content and fails coverage until re-harvested or
            deliberately retired; exit 1 when it fails, 0 when covered.
  --harvest-tsv
            the step-2c guide-harvest manifest (default: the target's
            migration-log/guide-harvest.tsv when present). Harvested pages
            are routed like every other source page; a harvested twin of a
            primary-tree page (compacted-slug match) keeps a visible row
            bound to the primary's target.
  --harvest-dir
            the harvested pagecontent directory (default:
            guide-harvest/pagecontent beside the manifest), used to count
            each harvested page's words.
  --routing-table
            the semantic routing table (default: the references/
            routing-table.tsv sibling of this script). Pattern rows route a
            source page whose compacted slug or title CONTAINS the pattern to
            a named agreed-page home - checked after the exact agreed-page
            match, before artefact-anchor matching.

Where <target>/migration-log/preflight-analysis.json exists (Gate 0), its
artefact census backs the anchor matching and the M9/other-bucket proposal;
without it the script scans fsh-generated as before and the report says
"run Gate 0 first".

Python 3 standard library only.
"""

from __future__ import annotations

import argparse
import datetime
import json
import os
import re
import sys
from collections import Counter, OrderedDict

SCRIPT_VERSION = "1.3.0"

# --------------------------------------------------------------------------
# Contract limits (spec 9e).  Changing these changes the advice, so they are
# named once, here, and printed in the report.
# --------------------------------------------------------------------------
LIMIT_MENU_TOTAL = 33          # total clickable menu entries
LIMIT_DROPDOWN_CHILDREN = 10   # children of any one dropdown
LIMIT_TOP_LEVEL = 8            # top-level menu entries
LIMIT_MENU_DEPTH = 2           # the template supports ONE sub-menu level
GATE_WORDS = 2500              # size gate: more than this many words
GATE_MERGED_SOURCES = 4        # size gate: more than this many merged sources
HUB_CHILDREN = 3               # 4a: this many children or more -> hub

# Artefact types, most-anchoring first.  A source page that names an instrument
# usually maps onto several artefacts (the questionnaire, its profile, its
# score definitions, its value sets); the anchor is the one the intro note
# hangs off.
TYPE_PRIORITY = [
    "Questionnaire",
    "StructureDefinition",
    "ObservationDefinition",
    "ValueSet",
    "CodeSystem",
    "CapabilityStatement",
    "OperationDefinition",
    "SearchParameter",
    "ConceptMap",
]
# Instance-ish types are examples, never the anchor of a narrative page.
EXAMPLE_TYPES = {
    "Bundle", "Observation", "QuestionnaireResponse", "Patient",
    "Practitioner", "PractitionerRole", "Encounter", "Organization",
    "Condition", "Procedure", "Medication", "MedicationAdministration",
    "MedicationStatement", "MedicationRequest", "Consent", "Specimen",
    "DiagnosticReport", "ServiceRequest", "ImplementationGuide",
}

# Which artefact index page hosts a branch-2 family overview, per artefact
# type.  Only used when the page actually exists in the target's agreed menu;
# otherwise the report says so instead of inventing a host.
TYPE_INDEX_PAGE = {
    "StructureDefinition": "profiles",
    "Questionnaire": "profiles",
    "ObservationDefinition": "profiles",
    "ValueSet": "value-sets",
    "CodeSystem": "code-systems",
    "CapabilityStatement": "capability-statements",
    "SearchParameter": "search-parameters",
    "OperationDefinition": "artifacts",
    "ConceptMap": "artifacts",
}

# Fallback list of pages the TF-KDS menu agrees on, used only when --target is
# absent.  With --target the agreed set is READ from the target instead.
FALLBACK_AGREED_PAGES = [
    "index", "changes", "downloads", "uml-diagrams", "logical-models",
    "security-and-privacy", "translationinfo", "version-history",
    "artifacts", "profiles", "extensions", "examples",
]

# The seven OPTIONAL (0..1) template pages of the M9 decision (spec 9a), and
# the Gate-0 census key that measures each.  None = no artefact count decides
# it (source narrative does), so the proposal stays a human decision.
OPTIONAL_PAGE_COUNT_KEY = OrderedDict([
    ("extensions", "extensions"),
    ("search-parameters", "searchparameters"),
    ("operations", "operations"),
    ("value-sets", "valuesets"),
    ("code-systems", "codesystems"),
    ("researcher-guidance", None),
    ("metadata", None),
])

# How a Gate-0 `artifacts_detail` category maps onto the FHIR type the anchor
# matching reasons in.  `examples` entries stay in the census but are flagged
# so they never anchor a narrative page - same effect as EXAMPLE_TYPES has on
# the fsh-generated census.
DETAIL_CATEGORY_TYPE = {
    "profiles": "StructureDefinition",
    "extensions": "StructureDefinition",
    "logicals": "StructureDefinition",
    "valuesets": "ValueSet",
    "codesystems": "CodeSystem",
    "capabilitystatements": "CapabilityStatement",
    "questionnaires": "Questionnaire",
    "searchparameters": "SearchParameter",
    "operations": "OperationDefinition",
}


# ==========================================================================
# small helpers
# ==========================================================================

def read_text(path):
    try:
        with open(path, "r", encoding="utf-8", errors="replace") as handle:
            return handle.read()
    except OSError:
        return ""


def compact(name):
    """'eq-5d-5l' -> 'eq5d5l'.  Lowercase, alphanumerics only."""
    return re.sub(r"[^a-z0-9]", "", name.lower())


def tokens(name):
    """'bdi-ii' -> ['bdi', 'ii'].  Split on every non-alphanumeric run."""
    return [t for t in re.split(r"[^a-z0-9]+", name.lower()) if t]


def strip_html_comments(text):
    return re.sub(r"<!--.*?-->", "", text, flags=re.S)


def strip_code_fences(text):
    """Drop fenced blocks - used for HEADING detection only, so that a '#'
    inside a shell example is not counted as a heading."""
    out = []
    in_fence = False
    for line in text.split("\n"):
        if line.lstrip().startswith("```") or line.lstrip().startswith("~~~"):
            in_fence = not in_fence
            continue
        if not in_fence:
            out.append(line)
    return "\n".join(out)


# ==========================================================================
# word count
# ==========================================================================
# Definition, stated so the number is reproducible and arguable:
#   words = whitespace-separated tokens of the page after
#     (a) removing HTML comments          - they are not rendered
#     (b) removing table separator rows    - '|---|:--:|' renders as a rule
#     (c) removing leading blockquote '>'  - markup, not a word
#     (d) turning '|' into a space         - cell separators, not words
#     (e) removing '*', '_' and '`'        - emphasis/code markup, not words
# Everything else counts: headings, list items, table cells and fenced code
# all cost the reader scrolling, and the size gate measures exactly that.

_TABLE_SEPARATOR = re.compile(r"^\s*\|?[\s:\-\|]+\|?\s*$")


def count_words(text):
    text = strip_html_comments(text)
    kept = [ln for ln in text.split("\n")
            if not ("|" in ln and _TABLE_SEPARATOR.match(ln))]
    text = "\n".join(kept)
    text = re.sub(r"^\s*>\s?", "", text, flags=re.M)
    text = text.replace("|", " ")
    text = re.sub(r"[*_`]", "", text)
    return len(text.split())


# ==========================================================================
# headings and anchors
# ==========================================================================

_HEADING = re.compile(r"^\s{0,3}(#{1,6})\s+(.*?)\s*#*\s*$")


def anchor_slug(title):
    """Approximate the publisher's anchor: lowercase, punctuation dropped,
    spaces to hyphens."""
    slug = title.strip().lower()
    slug = re.sub(r"[`*_\[\]\(\)]", "", slug)
    slug = re.sub(r"[^a-z0-9\s\-]", "", slug)
    slug = re.sub(r"\s+", "-", slug).strip("-")
    return slug


def analyse_headings(text):
    body = strip_code_fences(strip_html_comments(text))
    heads = []
    for line in body.split("\n"):
        match = _HEADING.match(line)
        if match:
            heads.append((len(match.group(1)), match.group(2).strip()))
    by_level = Counter(level for level, _ in heads)
    titles = Counter(title for _, title in heads)       # case-SENSITIVE
    repeated = OrderedDict()
    for _, title in heads:
        if titles[title] > 1 and title not in repeated:
            repeated[title] = titles[title]
    collisions = []
    seen = Counter()
    for _, title in heads:
        base = anchor_slug(title)
        seen[base] += 1
        if seen[base] > 1:
            collisions.append("%s-%d" % (base, seen[base]))
    return {
        "headings": heads,
        "by_level": by_level,
        "repeated": repeated,
        "collisions": collisions,
    }


_SOURCE_MARKER = re.compile(r"<!--\s*source:\s*([^\s>]+)", re.I)


def merged_sources(text):
    """Distinct `<!-- source: X.md -->` section markers - the migration's own
    record of how many SOURCE PAGES were merged into this page.

    Only values naming a page file count. The page-header form
    `<!-- Source: <template-repo> input/pagecontent/<page>.md ... -->` names the
    template the page was derived from, not a merged module page, and its first
    token is a repository name; requiring a `.md` value drops it without a
    case-sensitivity trick."""
    found = []
    for value in _SOURCE_MARKER.findall(text):
        value = value.strip().rstrip("-").strip()
        if not value.lower().endswith(".md"):
            continue
        if value not in found:
            found.append(value)
    return found


# ==========================================================================
# the semantic routing table (references/routing-table.tsv)
# ==========================================================================
# Mechanizes the spec-9 SEMANTIC page mapping: pattern -> agreed-page home.
# A pattern is a lowercase compacted token; a source page whose compacted slug
# OR compacted title CONTAINS the pattern (>= 3 chars) routes branch 3 to the
# named home - checked AFTER the exact agreed-page match and BEFORE
# artefact-anchor matching.  The table is a per-module-family artefact a human
# extends; this script only reads it.

def default_routing_table_path():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(os.path.dirname(script_dir), "references",
                        "routing-table.tsv")


def load_routing_table(path):
    """Returns (rows, skipped).  A row is {'pattern','target','note'}; skipped
    lists (line_number, why) for malformed lines - reported, never silently
    dropped."""
    rows, skipped = [], []
    text = read_text(path)
    for number, raw in enumerate(text.split("\n"), 1):
        line = raw.rstrip("\n")
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        cols = line.split("\t")
        pattern = compact(cols[0]) if cols else ""
        target = cols[1].strip() if len(cols) > 1 else ""
        note = cols[2].strip() if len(cols) > 2 else ""
        if not target:
            skipped.append((number, "no target column"))
            continue
        if len(pattern) < 3:
            skipped.append((number, "pattern %r shorter than 3 characters "
                                    "after compaction" % cols[0].strip()))
            continue
        rows.append({"pattern": pattern, "target": target, "note": note})
    return rows, skipped


def semantic_route(node, table):
    """The routing-table match for one page: the LONGEST pattern contained in
    the page's compacted slug or compacted title (earlier row wins a length
    tie), or None."""
    slug_compact = compact(node.slug)
    title_compact = compact(node.title) if node.title else ""
    best = None
    for row in table:
        pattern = row["pattern"]
        if pattern in slug_compact or (title_compact and pattern in title_compact):
            if best is None or len(pattern) > len(best["pattern"]):
                best = row
    return best


# ==========================================================================
# Gate 0: migration-log/preflight-analysis.json
# ==========================================================================

def load_preflight(target_root):
    """Returns (data_or_None, path, note).  A missing file is normal (run Gate
    0 first); an unparsable one is reported, never silently ignored."""
    if not target_root:
        return None, "", "no --target given"
    path = os.path.join(target_root, "migration-log", "preflight-analysis.json")
    if not os.path.isfile(path):
        return None, path, "not found"
    try:
        with open(path, "r", encoding="utf-8") as handle:
            return json.load(handle), path, ""
    except (OSError, ValueError) as error:
        return None, path, "unreadable: %s" % error


def collect_artefacts_from_detail(detail):
    """The Gate-0 `artifacts_detail` census as the same (id -> {type, intro})
    shape `collect_artefacts` builds.  Rulesets, invariants and mappings are
    FSH bookkeeping, not artefacts; `examples` (and `other` instances) keep an
    `example` flag so they never anchor a narrative page."""
    artefacts = OrderedDict()
    for entry in detail or []:
        name = (entry.get("name") or "").strip()
        category = entry.get("category") or ""
        instance_of = (entry.get("instanceOf") or "").strip()
        if not name or category in ("rulesets", "invariants", "mappings"):
            continue
        if category == "examples":
            artefacts.setdefault(name, {"type": instance_of or "Bundle",
                                        "intro": False, "example": True})
            continue
        if category == "other":
            artefacts.setdefault(name, {"type": instance_of or "Basic",
                                        "intro": False})
            continue
        rtype = DETAIL_CATEGORY_TYPE.get(category)
        if rtype is None:
            continue
        artefacts.setdefault(name, {"type": rtype, "intro": False})
    return artefacts


# ==========================================================================
# SOURCE: the sushi-config.yaml `pages:` tree
# ==========================================================================

_PAGE_KEY = re.compile(r"^(\s*)([A-Za-z0-9][A-Za-z0-9._\- ]*\.(?:md|xml|html)):\s*(?:#.*)?$")


class PageNode(object):
    def __init__(self, filename, level, parent, slug=None):
        # `filename` is what a human types to find the page: the bare file name
        # for a `pages:` entry, the guide-root-relative PATH for a Simplifier
        # guide page (a guide ships dozens of `Index.page.md`, so the bare name
        # would not identify one).  `slug` is the matching key - always the base
        # name without its extension.
        self.filename = filename
        self.slug = slug if slug is not None else re.sub(r"\.(md|xml|html)$", "", filename)
        self.level = level
        self.parent = parent
        self.children = []
        self.title = ""
        self.words = 0
        # filled in later
        self.branch = ""
        self.destination = ""
        self.measurement = ""
        self.anchor = None
        self.anchor_candidates = 0
        self.anchor_how = ""
        self.is_family = False
        self.notes = []
        # a harvested twin of a primary-tree page: its map row binds to the
        # primary's target instead of being routed independently
        self.mirror_of = None


def parse_pages_block(config_text):
    """Indentation-based, line-oriented parse of the `pages:` block.

    Returns (roots, all_nodes, found).  `found` is False when the config has no
    `pages:` block at all - the caller then falls back to counting files and
    says the tree is flat/unknown rather than inventing one.
    """
    lines = config_text.split("\n")
    start = None
    for index, line in enumerate(lines):
        if re.match(r"^pages:\s*(?:#.*)?$", line):
            start = index + 1
            break
    if start is None:
        return [], [], False

    entries = []            # (indent, filename, line_number)
    titles = {}             # line_number of the page it belongs to -> title
    last_page_line = None
    for index in range(start, len(lines)):
        line = lines[index]
        if not line.strip():
            continue
        if re.match(r"^\S", line):          # dedented to column 0 -> block over
            break
        match = _PAGE_KEY.match(line)
        if match:
            entries.append((len(match.group(1)), match.group(2), index + 1))
            last_page_line = index + 1
            continue
        title_match = re.match(r"^\s*title:\s*(.+?)\s*$", line)
        if title_match and last_page_line is not None:
            titles.setdefault(last_page_line, title_match.group(1).strip().strip('"\''))

    if not entries:
        return [], [], False

    indents = sorted({indent for indent, _, _ in entries})
    level_of = {indent: position + 1 for position, indent in enumerate(indents)}

    roots = []
    all_nodes = []
    stack = []              # (level, node)
    for indent, filename, line_number in entries:
        level = level_of[indent]
        while stack and stack[-1][0] >= level:
            stack.pop()
        parent = stack[-1][1] if stack else None
        node = PageNode(filename, level, parent)
        node.title = titles.get(line_number, "")
        if parent is None:
            roots.append(node)
        else:
            parent.children.append(node)
        stack.append((level, node))
        all_nodes.append(node)
    return roots, all_nodes, True


# ==========================================================================
# SOURCE: the Simplifier guide trees under implementation-guides/
# ==========================================================================
# The normal MII shape: the narrative does NOT live in input/pagecontent, it
# lives in one or more Simplifier guide trees, and input/pagecontent holds a
# single stub.  Measured on kerndatensatzmodul-onkologie v2026.0.3: three trees
# (2025.x-DE, 2025.x-EN, 2026.x-DE) and ONE file in input/pagecontent.
#
# Structure of a tree, verified:
#   <tree>/guide.yaml        title:, description:, version:, style-*
#   <tree>/toc.yaml          a list of {name:, filename:} entries
#   a `filename` ending in `.page.md` is a PAGE;
#   any other `filename` is a SUB-DIRECTORY holding its own toc.yaml.  Recurse.
#
# Parsed line by line with the standard library, like the rest of this script.

GUIDE_DIR_NAME = "implementation-guides"
PAGE_SUFFIX = ".page.md"
INDEX_PAGE = "index" + PAGE_SUFFIX          # compared case-insensitively

_TOC_ITEM_START = re.compile(r"^\s*-\s*(.*)$")
_TOC_FIELD = re.compile(r"^\s*([A-Za-z_][A-Za-z0-9_\-]*)\s*:\s*(.*)$")
_VERSION_TOKEN = re.compile(r"v?(\d+(?:\.[0-9xX]+)*)")
_LANG_SUFFIX = re.compile(r"[-_ ]([A-Za-z]{2})$")
_LANG_TAG = re.compile(r"^\s*\[([A-Za-z]{2})\]")


def _unquote(value):
    value = value.strip()
    if len(value) >= 2 and value[0] == value[-1] and value[0] in ("'", '"'):
        inner = value[1:-1]
        return inner.replace("''", "'") if value[0] == "'" else inner
    return value


def parse_toc_file(path):
    """Return the toc.yaml entries as [(name, filename), ...] in document order.

    Line-oriented: a `- ` starts an entry, `name:`/`filename:` fill it, and both
    values may be quoted (measured: the Onkologie 2026 tree quotes them in
    `Organspezifische-Module/toc.yaml` and nowhere else)."""
    entries = []
    current = None
    for raw in read_text(path).split("\n"):
        if not raw.strip() or raw.lstrip().startswith("#"):
            continue
        start = _TOC_ITEM_START.match(raw)
        if start:
            if current and current.get("filename"):
                entries.append(current)
            current = {}
            rest = start.group(1)
            field = _TOC_FIELD.match(rest) if rest else None
            if field:
                current[field.group(1).lower()] = _unquote(field.group(2))
            continue
        field = _TOC_FIELD.match(raw)
        if field and current is not None:
            key = field.group(1).lower()
            current.setdefault(key, _unquote(field.group(2)))
    if current and current.get("filename"):
        entries.append(current)
    return [(entry.get("name", ""), entry["filename"]) for entry in entries]


def parse_guide_yaml(path):
    """`title:`, `description:`, `version:` from a guide.yaml - flat, top level."""
    fields = {}
    for raw in read_text(path).split("\n"):
        if raw.startswith((" ", "\t")) or not raw.strip():
            continue
        field = _TOC_FIELD.match(raw)
        if field:
            fields.setdefault(field.group(1).lower(), _unquote(field.group(2)))
    return fields


def version_from_name(name):
    """The longest version-looking substring of a directory name.
    'ImplementationGuide-2026.x-DE' -> '2026.x'; 'MII-PRO-v2026-DE' -> '2026';
    'Common' -> ''."""
    best = ""
    for match in _VERSION_TOKEN.finditer(name):
        if len(match.group(1)) > len(best):
            best = match.group(1)
    return best


def version_key(text):
    """Sort key for a dotted version. Numeric parts compare numerically; an
    'x' placeholder ('2026.x') sorts BELOW any explicit number in the same
    position, so an explicit 2026.0.3 outranks a bare 2026.x. Stated because it
    decides which tree is authoritative."""
    if not text:
        return ()
    parts = []
    for part in re.split(r"[.\-_]", text):
        parts.append((1, int(part)) if part.isdigit() else (0, 0))
    return tuple(parts)


def language_of(dir_name, fields):
    """Two-letter language of a guide tree, uppercased.  The description tag
    (`'[DE] Modul ...'`) is authoritative; the directory-name suffix is the
    fallback; a tree with neither (a shared-asset tree like `Common`) has none."""
    tag = _LANG_TAG.match(fields.get("description", "") or "")
    if tag:
        return tag.group(1).upper()
    suffix = _LANG_SUFFIX.search(dir_name)
    if suffix:
        return suffix.group(1).upper()
    return ""


def source_language(config_text):
    """The module's own narrative language from sushi-config `language:`
    ('de-DE' -> 'DE'). Empty when the config does not state one."""
    match = re.search(r"^language:\s*(.+?)\s*$", config_text, re.M)
    if not match:
        return ""
    value = _unquote(match.group(1))
    return value.split("-")[0].upper() if value else ""


def _dir_has_pages(path):
    for _dirpath, _dirnames, filenames in os.walk(path):
        if any(name.endswith(PAGE_SUFFIX) for name in filenames):
            return True
    return False


def discover_guide_trees(source_root):
    """Every directory under implementation-guides/, with its metadata and its
    on-disk page count.  Nothing is filtered away here: the report lists them
    all, including the ones that are not guide trees at all (spec 5.1a #4)."""
    guide_root = os.path.join(source_root, GUIDE_DIR_NAME)
    if not os.path.isdir(guide_root):
        return []
    trees = []
    for name in sorted(os.listdir(guide_root)):
        path = os.path.join(guide_root, name)
        if not os.path.isdir(path):
            continue
        fields = parse_guide_yaml(os.path.join(path, "guide.yaml"))
        page_files = 0
        for _dirpath, _dirnames, filenames in os.walk(path):
            page_files += sum(1 for f in filenames if f.endswith(PAGE_SUFFIX))
        trees.append({
            "name": name,
            "path": path,
            "title": fields.get("title", ""),
            "description": fields.get("description", ""),
            "version_yaml": fields.get("version", ""),
            "version_name": version_from_name(name),
            "language": language_of(name, fields),
            "has_guide_yaml": os.path.isfile(os.path.join(path, "guide.yaml")),
            "has_toc": os.path.isfile(os.path.join(path, "toc.yaml")),
            "page_files": page_files,
            "disposition": "",
        })
    return trees


def choose_guide_tree(trees, module_language, override):
    """Spec 5.1a #1: the AUTHORITATIVE tree is the highest-version guide in the
    module's own narrative language.

    Returns (chosen, reason, notes).  It never chooses silently: the caller
    prints every tree, the choice, the reason and the override switch."""
    notes = []
    usable = [t for t in trees if t["page_files"] > 0]
    if not usable:
        return None, "no directory under %s/ contains a *%s file" % (
            GUIDE_DIR_NAME, PAGE_SUFFIX), notes

    if override:
        wanted = override.strip().strip("/")
        for tree in usable:
            if tree["name"].lower() == wanted.lower():
                return tree, ("HUMAN OVERRIDE: --guide-tree %s (the spec 5.1a "
                              "ranking below was not applied)" % tree["name"]), notes
        notes.append("--guide-tree %s does not name a guide tree that holds pages; "
                     "falling back to the spec 5.1a ranking." % override)

    versioned = [t for t in usable if t["version_name"]]
    if not versioned:
        notes.append("no directory name under %s/ carries a version substring; "
                     "ranked by name instead." % GUIDE_DIR_NAME)
        versioned = usable

    same_language = [t for t in versioned
                     if module_language and t["language"] == module_language]
    if same_language:
        pool, why = same_language, ("highest version among the trees in the module's own "
                                    "narrative language %s (sushi-config `language:`)"
                                    % module_language)
    else:
        pool = versioned
        if module_language:
            why = ("highest version overall - NO tree matches the module's narrative "
                   "language %s, so the language criterion of spec 5.1a #1 could not be "
                   "applied" % module_language)
            notes.append("the module's narrative language (%s) matches none of the guide "
                         "trees; confirm the choice by hand." % module_language)
        else:
            why = ("highest version overall - sushi-config states no `language:`, so the "
                   "language criterion of spec 5.1a #1 could not be applied")
            notes.append("sushi-config states no `language:`; the narrative language could "
                         "not be determined, so only the version decided.")

    chosen = max(pool, key=lambda t: (version_key(t["version_name"]),
                                      version_key(t["version_yaml"]),
                                      t["name"]))
    reason = "%s: %s (directory version %s, guide.yaml version %s)" % (
        why, chosen["name"], chosen["version_name"] or "-", chosen["version_yaml"] or "-")
    return chosen, reason, notes


def label_dispositions(trees, chosen):
    """Spec 5.1a's four dispositions, recorded for EVERY tree."""
    for tree in trees:
        if chosen is not None and tree is chosen:
            tree["disposition"] = "**AUTHORITATIVE** - steps 5.4/5.5 operate on this tree"
        elif tree["page_files"] == 0 and not tree["has_guide_yaml"]:
            tree["disposition"] = ("unrecognized directory - needs a retain/retire "
                                   "proposal (5.1a #4)")
        elif not tree["version_name"] and not tree["language"]:
            tree["disposition"] = "shared assets - retain unchanged (5.1a #3)"
        elif (chosen is not None and tree["language"] and chosen["language"]
                and tree["language"] != chosen["language"]):
            text = ("parallel-language tree - harvest seed for the translation skill, "
                    "not a machine translation (5.1a #2)")
            if version_key(tree["version_name"]) < version_key(chosen["version_name"]):
                text += ("; **STALE** (%s vs %s) - every harvested page needs a per-page "
                         "`TODO:REVIEW` naming both versions"
                         % (tree["version_name"] or "-", chosen["version_name"] or "-"))
            tree["disposition"] = text
        else:
            tree["disposition"] = ("historical version tree - retain unchanged, Gate-D "
                                   "retirement set (5.1a #3)")


class GuideWalk(object):
    """Walks one guide tree's toc.yaml hierarchy into the SAME PageNode tree
    `parse_pages_block` builds, so the depth histogram and the whole routing
    pass work unchanged.

    Two modelling decisions the shape forces, both stated in the report:

    * A sub-directory is a LEVEL, not a page.  Every page inside one directory
      therefore shares one level - which is how Simplifier renders a folder's
      contents - and the levels are shifted so the shallowest page sits at
      level 1 (a guide root whose toc holds nothing but one folder entry adds
      no page level).
    * Routing still needs a page PARENT, so a directory is represented by its
      `Index.page.md` (the folder's landing page); the directory's other pages
      and the representatives of its sub-directories become that page's
      children.  A parent may therefore sit at the same level as its children.
    """

    def __init__(self, root):
        self.root = root
        self.roots = []
        self.nodes = []
        self.dirs_without_toc = []      # rel dir -> hierarchy from directory nesting
        self.dirs_unreached = []        # rel dir -> holds pages, no toc.yaml links to it
        self.dangling = []              # (rel toc, filename, why)
        self.unreferenced = []          # (rel page, why)
        self.seen_pages = set()
        self.seen_dirs = set()
        self.dir_info = {}              # realpath(dir) -> (level, representative)

    # -- helpers ----------------------------------------------------------
    def rel(self, path):
        return os.path.relpath(path, self.root).replace(os.sep, "/")

    def listing(self, directory):
        try:
            return sorted(os.listdir(directory))
        except OSError:
            return []

    def make_node(self, directory, filename, level, title):
        path = os.path.join(directory, filename)
        node = PageNode(self.rel(path), level, None, slug=filename[:-len(PAGE_SUFFIX)])
        node.title = title
        node.words = count_words(read_text(path))
        self.seen_pages.add(os.path.realpath(path))
        return node

    def synthesise(self, directory):
        """No toc.yaml: fall back to directory nesting - pages first, then the
        sub-directories that actually hold pages."""
        entries = [("", name) for name in self.listing(directory)
                   if name.endswith(PAGE_SUFFIX)]
        for name in self.listing(directory):
            path = os.path.join(directory, name)
            if (os.path.isdir(path) and not name.startswith(".")
                    and _dir_has_pages(path)):
                entries.append(("", name))
        return entries

    # -- the walk ---------------------------------------------------------
    def visit(self, directory, level, inherited_parent):
        real = os.path.realpath(directory)
        if real in self.seen_dirs:
            return
        self.seen_dirs.add(real)

        toc_path = os.path.join(directory, "toc.yaml")
        has_toc = os.path.isfile(toc_path)
        if has_toc:
            entries = parse_toc_file(toc_path)
        else:
            entries = self.synthesise(directory)
            self.dirs_without_toc.append(self.rel(directory))

        pages = []
        subdirs = []
        listed = set()
        for title, filename in entries:
            path = os.path.join(directory, filename)
            if filename.endswith(PAGE_SUFFIX):
                listed.add(filename)
                if not os.path.isfile(path):
                    self.dangling.append((self.rel(toc_path), filename,
                                          "page file does not exist"))
                    continue
                pages.append(self.make_node(directory, filename, level, title))
            else:
                if not os.path.isdir(path):
                    self.dangling.append((self.rel(toc_path), filename,
                                          "sub-directory does not exist"))
                    continue
                subdirs.append(path)

        # Pages on disk that this directory's toc.yaml never mentions.  They are
        # real pages, so they join the tree - flagged, never dropped silently.
        if has_toc:
            for filename in self.listing(directory):
                if not filename.endswith(PAGE_SUFFIX) or filename in listed:
                    continue
                node = self.make_node(directory, filename, level, "")
                node.notes.append("on disk but not listed in %s" % self.rel(toc_path))
                self.unreferenced.append((node.filename,
                                          "not listed in %s" % self.rel(toc_path)))
                pages.append(node)

        representative = None
        for node in pages:
            if os.path.basename(node.filename).lower() == INDEX_PAGE:
                representative = node
                break
        if representative is None and pages:
            representative = pages[0]

        for node in pages:
            node.parent = inherited_parent if node is representative else representative
            if node.parent is None:
                self.roots.append(node)
            else:
                node.parent.children.append(node)
            self.nodes.append(node)

        next_parent = representative if representative is not None else inherited_parent
        self.dir_info[real] = (level, next_parent)
        for path in subdirs:
            self.visit(path, level + 1, next_parent)

    def sweep_unvisited(self):
        """Pages under a directory no toc.yaml ever reaches.  Placed by
        directory nesting, relative to the nearest directory the walk did
        reach, and reported."""
        for dirpath, dirnames, filenames in os.walk(self.root):
            dirnames[:] = [d for d in dirnames if not d.startswith(".")]
            extra = sorted(f for f in filenames
                           if f.endswith(PAGE_SUFFIX)
                           and os.path.realpath(os.path.join(dirpath, f)) not in self.seen_pages)
            if not extra:
                continue
            level, parent, steps = 1, None, 0
            probe = os.path.realpath(dirpath)
            while probe and probe.startswith(os.path.realpath(self.root)):
                if probe in self.dir_info:
                    level, parent = self.dir_info[probe]
                    level += steps
                    break
                parent_dir = os.path.dirname(probe)
                if parent_dir == probe:
                    break
                probe, steps = parent_dir, steps + 1
            self.dirs_unreached.append(self.rel(dirpath))
            for filename in extra:
                node = self.make_node(dirpath, filename, level, "")
                node.notes.append("directory is reached by no toc.yaml - placed by "
                                  "directory nesting")
                node.parent = parent
                if parent is None:
                    self.roots.append(node)
                else:
                    parent.children.append(node)
                self.nodes.append(node)
                self.unreferenced.append((node.filename,
                                          "in a directory no toc.yaml reaches"))

    def normalise_levels(self):
        if not self.nodes:
            return 0
        shift = min(node.level for node in self.nodes) - 1
        if shift:
            for node in self.nodes:
                node.level -= shift
        return shift


def walk_guide_tree(tree_path):
    """Returns (roots, nodes, walk).  `walk` carries everything the report has
    to disclose: directories with no toc.yaml, dangling toc references, and
    pages no toc.yaml mentions."""
    walk = GuideWalk(tree_path)
    walk.visit(tree_path, 1, None)
    walk.sweep_unvisited()
    walk.normalise_levels()
    return walk.roots, walk.nodes, walk


# ==========================================================================
# SOURCE (d): the harvested Simplifier guide (spec 5.1d - the Consent shape,
# whose narrative exists ONLY on the rendered guide and reaches disk through
# the step-2c harvest)
# ==========================================================================

HARVEST_TSV_NAME = "guide-harvest.tsv"


def default_harvest_tsv(target_root):
    """Step 2c writes the manifest into the target's migration-log; picked up
    without a flag, mirroring load_preflight - the chain, not the operator,
    carries the intermediate forward."""
    if not target_root:
        return None
    path = os.path.join(target_root, "migration-log", HARVEST_TSV_NAME)
    return path if os.path.isfile(path) else None


def _harvest_level(url):
    """Page depth from the guide URL (/guide/<key>/<Root>[/<page>...]): the
    root page is level 1, one more per path segment below it - the same
    shallowest-at-1 convention the guide-tree walker normalises to."""
    path = url.split("?", 1)[0].split("#", 1)[0]
    parts = [p for p in path.split("/") if p]
    try:
        index = parts.index("guide")
    except ValueError:
        return 1
    return max(1, len(parts) - index - 2)


def load_harvest(tsv_path, harvest_dir):
    """The step-2c harvest manifest as routable PageNodes.

    Returns (nodes, universe, skipped, notes).  `universe` maps page name ->
    origin for the coverage validation.  A row the harvest SKIPPED enters the
    universe WITHOUT a node - it is a discovered source page with no routable
    content, so the coverage validation fails loudly until the harvest is
    clean or a human retires the page in the reviewed map.  Columns per
    guide-harvest.sh: url, status, kind, reason, file, src_text_chars,
    md_text_chars, missing_runs, title.
    """
    nodes, universe, skipped, notes = [], OrderedDict(), [], []
    text = read_text(tsv_path)
    if not text.strip():
        return nodes, universe, skipped, [
            "harvest manifest unreadable or empty: %s" % tsv_path]
    tsv_dir = os.path.dirname(os.path.abspath(tsv_path))
    stack = []          # (level, node): parent linkage in discovery order
    for line in text.splitlines():
        if not line.strip() or line.startswith("url\t"):
            continue
        cols = line.split("\t")
        if len(cols) < 2:
            continue
        url, status = cols[0].strip(), cols[1].strip()
        kind = cols[2].strip() if len(cols) > 2 else ""
        reason = cols[3].strip() if len(cols) > 3 else ""
        file_field = cols[4].strip() if len(cols) > 4 else ""
        # the title is the LAST column precisely because titles contain
        # anything; if one carried a tab, its fragments are re-joined here
        title = " ".join(c.strip() for c in cols[8:]).strip() \
            if len(cols) > 8 else ""
        if status != "harvested":
            skipped.append((url, reason or status))
            continue
        name = os.path.basename(file_field)
        if not name:
            skipped.append((url, "harvested row carries no file column"))
            continue
        if name in universe:
            # two URLs flattened onto ONE file name: the harvester overwrote
            # the first page's content with the second's - a loss the loader
            # must surface, never model as two routable pages sharing a file
            notes.append("harvest manifest names `%s` TWICE (second url: %s) "
                         "- the harvester overwrote the first page's content; "
                         "re-harvest with distinct names before routing"
                         % (name, url))
            continue
        level = _harvest_level(url)
        while stack and stack[-1][0] >= level:
            stack.pop()
        parent = stack[-1][1] if stack else None
        # The matching key is the page's OWN name. The harvest flattens the
        # parent path into the file name, and a parent segment must not
        # outvote the page's own (measured on Consent:
        # `anwendungsfaelle...-uml.md` routed to logical-models via the longer
        # parent pattern instead of `uml` -> uml-diagrams; the tree walker
        # keys by basename for the same reason). So when the file stem
        # demonstrably carries flattened parents - it ENDS with the URL's
        # last segment but is longer - the segment is the key; otherwise the
        # stem is (the root page's file is `index.md`, and `index` must keep
        # its exact agreed-page match rather than adopt the guide's name).
        tail = [p for p in url.split("?", 1)[0].split("#", 1)[0].split("/") if p]
        own_name = tail[-1] if tail else ""
        stem = re.sub(r"\.md$", "", name)
        slug = stem
        if own_name:
            c_stem, c_own = compact(stem), compact(own_name)
            if c_own and c_stem != c_own and c_stem.endswith(c_own):
                slug = own_name
        node = PageNode(name, level, parent, slug=slug)
        if parent is not None:
            parent.children.append(node)
        stack.append((level, node))
        node.title = title
        for candidate in (file_field,
                          os.path.join(tsv_dir, file_field),
                          os.path.join(harvest_dir, name) if harvest_dir else ""):
            if candidate and os.path.isfile(candidate):
                node.words = count_words(read_text(candidate))
                break
        else:
            node.notes.append("harvested file not found on disk - 0 words "
                              "routed; pass --harvest-dir")
        page_note = "harvested guide page (kind=%s)" % (kind or "unknown")
        if kind == "artefact-view":
            page_note += (" - a RENDERING of artefacts, not narrative; it "
                          "regenerates from the artefacts themselves")
        node.notes.append(page_note)
        universe.setdefault(name, "guide harvest %s"
                            % os.path.basename(tsv_path))
        nodes.append(node)
    for url, reason in skipped:
        tail = [p for p in
                url.split("?", 1)[0].split("#", 1)[0].split("/") if p]
        key = "%s.md" % tail[-1] if tail else url
        if key in universe:
            key = url
        universe[key] = ("guide harvest SKIPPED (%s) - re-harvest, or retire "
                         "it deliberately in the reviewed map"
                         % (reason or "no reason recorded"))
    return nodes, universe, skipped, notes


# ==========================================================================
# artefact index (branch-1 evidence)
# ==========================================================================

_FSH_DECL = re.compile(r"^(Profile|Extension|Instance|ValueSet|CodeSystem|Logical|Resource|Mapping):\s*(\S+)")
_FSH_ID = re.compile(r"^Id:\s*(\S+)")
_FSH_INSTANCEOF = re.compile(r"^InstanceOf:\s*(\S+)")


def collect_artefacts(source_root, target_root, preflight_detail=None):
    """(type, id) pairs plus a label naming the census used.  Nothing is
    invented: every entry comes from a file that exists.

    Census order: (1) fsh-generated/resources - the GENERATED resourceType/id
    census, which Gate 0's own `generated_crosscheck` names as its source of
    record, and the only census that knows the ids intro notes are named by;
    (2) where the generated tree is gone, Gate 0's `artifacts_detail`
    (preflight-analysis.json) - its FSH-declaration census replaces the
    input/fsh re-scan; (3) an input/fsh scan when neither exists.  The
    target's intro notes fold in last in every case."""
    artefacts = OrderedDict()          # id -> {"type":..., "intro": bool}
    census = ""

    generated = os.path.join(source_root, "fsh-generated", "resources")
    if os.path.isdir(generated):
        for name in sorted(os.listdir(generated)):
            if not name.endswith(".json"):
                continue
            stem = name[:-5]
            if "-" not in stem:
                continue
            rtype, rid = stem.split("-", 1)
            artefacts.setdefault(rid, {"type": rtype, "intro": False})
    if artefacts:
        census = "fsh-generated/resources (%d resources%s)" % (
            len(artefacts),
            "; cross-checked by Gate 0's generated_crosscheck"
            if preflight_detail else "")

    if not artefacts and preflight_detail:
        artefacts = collect_artefacts_from_detail(preflight_detail)
        if artefacts:
            census = ("Gate 0 preflight artifacts_detail (%d declarations; "
                      "no fsh-generated tree)" % len(artefacts))

    if not artefacts:
        fsh_root = os.path.join(source_root, "input", "fsh")
        for dirpath, _dirnames, filenames in os.walk(fsh_root):
            for name in sorted(filenames):
                if not name.endswith(".fsh"):
                    continue
                current_type = None
                current_name = None
                for line in read_text(os.path.join(dirpath, name)).split("\n"):
                    decl = _FSH_DECL.match(line)
                    if decl:
                        keyword, value = decl.group(1), decl.group(2)
                        current_type = {
                            "Profile": "StructureDefinition",
                            "Extension": "StructureDefinition",
                            "Logical": "StructureDefinition",
                            "Resource": "StructureDefinition",
                            "ValueSet": "ValueSet",
                            "CodeSystem": "CodeSystem",
                            "Instance": None,
                            "Mapping": None,
                        }.get(keyword)
                        current_name = value
                        if current_type and current_name:
                            artefacts.setdefault(current_name, {"type": current_type, "intro": False})
                        continue
                    instance_of = _FSH_INSTANCEOF.match(line)
                    if instance_of and current_name:
                        current_type = instance_of.group(1)
                        artefacts.setdefault(current_name, {"type": current_type, "intro": False})
                        continue
                    ident = _FSH_ID.match(line)
                    if ident and current_type:
                        artefacts.setdefault(ident.group(1), {"type": current_type, "intro": False})
        if artefacts:
            census = "input/fsh scan (%d declarations)" % len(artefacts)

    if not census:
        census = "empty (no fsh-generated, no preflight census, no input/fsh)"

    if target_root:
        intro_dir = os.path.join(target_root, "input", "intro-notes")
        if os.path.isdir(intro_dir):
            for name in sorted(os.listdir(intro_dir)):
                match = re.match(r"^([A-Za-z]+)-(.+)-intro\.md$", name)
                if not match:
                    continue
                rtype, rid = match.group(1), match.group(2)
                entry = artefacts.setdefault(rid, {"type": rtype, "intro": False})
                entry["intro"] = True
    return artefacts, census


def build_token_frequency(artefacts):
    frequency = Counter()
    for rid in artefacts:
        for token in set(tokens(rid)):
            frequency[token] += 1
    return frequency


def match_artefact(page_slug, artefacts, frequency):
    """Return (best, candidate_count, how).  `how` is 'compact' when the page
    name appears verbatim inside an artefact id, 'tokens' when a majority of
    the page's distinctive name tokens do, and '' when nothing matched."""
    total = max(1, len(artefacts))
    page_compact = compact(page_slug)
    distinctive = [t for t in tokens(page_slug)
                   if len(t) >= 3 and frequency.get(t, 0) < 0.5 * total]

    candidates = []
    for rid, meta in artefacts.items():
        rtype = meta["type"]
        if meta.get("example") or rtype in EXAMPLE_TYPES or "-exa-" in rid:
            continue
        strong = len(page_compact) >= 4 and page_compact in compact(rid)
        ratio = 0.0
        if distinctive:
            id_tokens = set(tokens(rid))
            hit = sum(1 for t in distinctive if t in id_tokens)
            ratio = hit / float(len(distinctive))
        if not strong and ratio < 0.5:
            continue
        priority = TYPE_PRIORITY.index(rtype) if rtype in TYPE_PRIORITY else len(TYPE_PRIORITY)
        candidates.append((
            0 if meta["intro"] else 1,
            0 if strong else 1,
            -ratio,
            priority,
            len(rid),
            rid,
            rtype,
            "compact" if strong else "tokens",
        ))
    if not candidates:
        return None, 0, ""
    candidates.sort()
    best = candidates[0]
    return {"id": best[5], "type": best[6], "intro": artefacts[best[5]]["intro"]}, len(candidates), best[7]


# ==========================================================================
# TARGET: menu budget
# ==========================================================================

def parse_menu(menu_path):
    text = strip_html_comments(read_text(menu_path))
    if not text.strip():
        return None

    open_ul = [m.start() for m in re.finditer(r"<\s*ul\b", text, re.I)]
    close_ul = [m.start() for m in re.finditer(r"<\s*/\s*ul\s*>", text, re.I)]

    def depth_at(position):
        return (sum(1 for p in open_ul if p < position)
                - sum(1 for p in close_ul if p < position))

    anchors = []
    for match in re.finditer(r"<a\b([^>]*)>(.*?)</a>", text, re.S | re.I):
        attrs, inner = match.group(1), match.group(2)
        label = re.sub(r"<[^>]*>", "", inner)
        label = re.sub(r"\s+", " ", label).strip()
        href = ""
        href_match = re.search(r'href\s*=\s*"([^"]*)"', attrs)
        if href_match:
            href = href_match.group(1)
        toggle = "dropdown-toggle" in attrs
        anchors.append({
            "label": label,
            "href": href,
            "toggle": toggle,
            "depth": depth_at(match.start()),
        })
    if not anchors:
        return None

    top_level = [a for a in anchors if a["depth"] <= 1]
    clickable = [a for a in anchors if not a["toggle"]]
    max_depth = max(a["depth"] for a in anchors)

    dropdowns = OrderedDict()
    current = None
    for anchor in anchors:
        if anchor["depth"] <= 1:
            current = anchor["label"] if anchor["toggle"] else None
            if current:
                dropdowns.setdefault(current, [])
        elif current:
            dropdowns[current].append(anchor)

    return {
        "anchors": anchors,
        "clickable": clickable,
        "top_level": top_level,
        "max_depth": max_depth,
        "dropdowns": dropdowns,
    }


class MenuBudget(object):
    """The running budget while branch-4 pages are proposed for the menu."""

    def __init__(self, menu):
        self.known = menu is not None
        self.total = len(menu["clickable"]) if menu else 0
        self.top_level = len(menu["top_level"]) if menu else 0
        self.depth = menu["max_depth"] if menu else 0
        self.dropdowns = OrderedDict(
            (name, len(children)) for name, children in menu["dropdowns"].items()
        ) if menu else OrderedDict()

    def freest_dropdown(self):
        if not self.dropdowns:
            return None, 0
        name = min(self.dropdowns, key=lambda k: self.dropdowns[k])
        return name, LIMIT_DROPDOWN_CHILDREN - self.dropdowns[name]

    def can_add_top_level(self, extra_children):
        """A new top-level entry costs 1 clickable; if it has children it
        becomes a dropdown, and this template's convention repeats the parent
        as its own first child, so that costs 1 more plus one per child."""
        cost = 1 + (1 + extra_children if extra_children else 0)
        if self.total + cost > LIMIT_MENU_TOTAL:
            return False, "total %d + %d > %d" % (self.total, cost, LIMIT_MENU_TOTAL)
        if self.top_level + 1 > LIMIT_TOP_LEVEL:
            return False, "top level %d + 1 > %d" % (self.top_level, LIMIT_TOP_LEVEL)
        if extra_children and 1 + extra_children > LIMIT_DROPDOWN_CHILDREN:
            return False, "dropdown children %d > %d" % (1 + extra_children, LIMIT_DROPDOWN_CHILDREN)
        if extra_children and LIMIT_MENU_DEPTH < 2:
            return False, "children would need depth 2 > %d" % LIMIT_MENU_DEPTH
        return True, "total %d->%d, top level %d->%d" % (
            self.total, self.total + cost, self.top_level, self.top_level + 1)

    def add_top_level(self, extra_children):
        cost = 1 + (1 + extra_children if extra_children else 0)
        self.total += cost
        self.top_level += 1
        if extra_children:
            self.depth = max(self.depth, 2)
        return cost

    def headroom_text(self):
        name, free = self.freest_dropdown()
        return "total %d free, top level %d free, freest dropdown %s (%d free)" % (
            LIMIT_MENU_TOTAL - self.total,
            LIMIT_TOP_LEVEL - self.top_level,
            name if name else "-", free)


# ==========================================================================
# TARGET: page measurements
# ==========================================================================

def measure_target_pages(target_root):
    page_dir = os.path.join(target_root, "input", "pagecontent")
    if not os.path.isdir(page_dir):
        return OrderedDict()
    pages = OrderedDict()
    for name in sorted(os.listdir(page_dir)):
        if not name.endswith(".md"):
            continue
        text = read_text(os.path.join(page_dir, name))
        heads = analyse_headings(text)
        sources = merged_sources(text)
        words = count_words(text)
        reasons = []
        if words > GATE_WORDS:
            reasons.append("%d words > %d" % (words, GATE_WORDS))
        if len(sources) > GATE_MERGED_SOURCES:
            reasons.append("%d merged sources > %d" % (len(sources), GATE_MERGED_SOURCES))
        if heads["repeated"]:
            reasons.append("%d repeated heading title(s)" % len(heads["repeated"]))
        pages[name[:-3]] = {
            "file": name,
            "words": words,
            "by_level": heads["by_level"],
            "repeated": heads["repeated"],
            "collisions": heads["collisions"],
            "sources": sources,
            "gate_reasons": reasons,
        }
    return pages


# ==========================================================================
# routing
# ==========================================================================

def agreed_pages(target_root, menu, target_pages):
    """The agreed page set, READ from the target: every local page the menu
    links to, plus every file in input/pagecontent.  Titles are kept so a
    source page can match a link-only menu entry by its label (the way
    "Datasets and Descriptions" points at logical-models.html)."""
    by_slug = OrderedDict()
    by_title = OrderedDict()
    if target_pages:
        for slug in target_pages:
            by_slug[slug] = slug
    if menu:
        for anchor in menu["clickable"]:
            href = anchor["href"]
            if not href or "://" in href or href.startswith("#"):
                continue
            slug = re.sub(r"\.html?$", "", href.split("/")[-1])
            if not slug:
                continue
            by_slug.setdefault(slug, slug)
            label = anchor["label"]
            label = re.sub(r"\s*\((optional|opt\.)\)\s*$", "", label, flags=re.I).strip()
            if label:
                by_title.setdefault(compact(label), slug)
    if not by_slug and not target_root:
        for slug in FALLBACK_AGREED_PAGES:
            by_slug[slug] = slug
    # Case-insensitive aliases.  Target page files are lower case; Simplifier
    # guide pages are CamelCase (`Index.page.md`, `Downloads.page.md`), so
    # without the alias the exact-name match never fires on a guide tree.  For a
    # `pages:` source, whose names are already lower case, this adds nothing.
    for slug in list(by_slug):
        by_slug.setdefault(slug.lower(), by_slug[slug])
    return by_slug, by_title


def route(nodes, artefacts, frequency, agreed_slug, agreed_title,
          target_pages, budget, folder_landing_pages=False,
          routing_table=()):
    """Fill node.branch / .destination / .measurement for every source page.

    Evaluation order (the branch NUMBER reported is always the spec's):
      0  an EXACT agreed-page name or menu-label match decides rule 3 first -
         a page the humans already agreed on is a stronger signal than a
         name-similarity match against an artefact id;
      0b the SEMANTIC routing table (references/routing-table.tsv) -> rule 3:
         checked after the exact agreed-page match and before artefact-anchor
         matching, so the spec-9 semantic mapping outranks name similarity;
      1  artefact anchor  -> rule 1;
      2  family overview  -> rule 2;
      3  fuzzy agreed-page match -> rule 3;
      4  everything else  -> rule 4 (+ 4a presentation, 4b visibility).

    `folder_landing_pages` is set for a Simplifier guide tree, where every
    folder ships an `Index.page.md`.  Only the one at level 1 is the guide's
    index; the deeper ones are FOLDER landing pages and must not all be merged
    into the target's `index.md` - and their slug is the meaningless `index`,
    so matching it against artefact ids ('...-eq5d5l-index') would anchor a
    folder hub to one arbitrary artefact.  Name match, semantic match and
    artefact anchor are all suppressed for them; they are routed by their
    children like any other overview.
    """
    def is_folder_landing(node):
        return (folder_landing_pages and node.level > 1
                and node.slug.lower() == "index")

    # -- pass 1: artefact anchors -----------------------------------------
    for node in nodes:
        if is_folder_landing(node):
            node.anchor, node.anchor_candidates, node.anchor_how = None, 0, ""
            continue
        anchor, count, how = match_artefact(node.slug, artefacts, frequency)
        node.anchor = anchor
        node.anchor_candidates = count
        node.anchor_how = how

    # -- pass 2: branches 0-3 ---------------------------------------------
    for node in nodes:
        exact = agreed_slug.get(node.slug) or agreed_slug.get(node.slug.lower())
        by_label = agreed_title.get(compact(node.title)) if node.title else None
        semantic = semantic_route(node, routing_table) if routing_table else None
        if is_folder_landing(node):
            exact = by_label = semantic = None
            node.notes.append("folder landing page - NOT matched against the target's "
                              "index.md or an artefact id; routed by its own children")
        distinct_children = {c.anchor["id"] for c in node.children if c.anchor}
        node.is_family = len(node.children) >= 2 and len(distinct_children) >= 2

        if exact:
            node.branch = "3"
            node.destination = "%s.md" % exact
            node.measurement = "agreed page named '%s' exists in the target" % exact
        elif semantic:
            node.branch = "3"
            node.destination = "%s.md" % semantic["target"]
            node.measurement = "semantic match '%s' -> %s (routing-table)" % (
                semantic["pattern"], semantic["target"])
            if target_pages and semantic["target"] not in target_pages:
                node.notes.append("routing-table home '%s' is not a page in this "
                                  "target - confirm the home" % semantic["target"])
        elif node.anchor and not node.is_family:
            node.branch = "1"
            node.destination = "input/intro-notes/%s-%s-intro.md" % (
                node.anchor["type"], node.anchor["id"])
            node.measurement = "%s match on %s (%d candidate artefact%s%s)" % (
                node.anchor_how, node.anchor["id"], node.anchor_candidates,
                "" if node.anchor_candidates == 1 else "s",
                "; intro note already present" if node.anchor["intro"] else "")
        elif node.is_family:
            node.branch = "2"
            types = Counter(c.anchor["type"] for c in node.children if c.anchor)
            dominant = types.most_common(1)[0][0]
            host = TYPE_INDEX_PAGE.get(dominant, "artifacts")
            if target_pages and host not in target_pages:
                node.notes.append("host '%s' is not an agreed page in this target - confirm the host" % host)
            node.destination = "h3/h4 section on %s.md" % host
            node.measurement = "%d children, %d anchoring distinct artefacts (%s)" % (
                len(node.children), len(distinct_children), dominant)
        elif by_label:
            node.branch = "3"
            node.destination = "%s.md" % by_label
            node.measurement = "menu label '%s' points at %s.html" % (node.title, by_label)
        else:
            node.branch = ""          # decided in pass 3

    # -- pass 3: inherited routing ----------------------------------------
    # A child of a single-artefact page belongs in the SAME intro note; a child
    # of a family overview without its own anchor is a subsection of that same
    # overview.  Both are measurements about the source tree, not judgements.
    for node in nodes:
        if node.branch or node.parent is None:
            continue
        parent = node.parent
        if parent.branch == "1" and not node.anchor:
            node.branch = "1"
            node.destination = parent.destination
            node.measurement = "child of single-artefact page %s (no anchor of its own)" % parent.filename
        elif parent.branch == "2" and not node.anchor:
            node.branch = "2"
            node.destination = parent.destination
            node.measurement = "child of family overview %s (no anchor of its own)" % parent.filename

    # -- pass 4: branch 4, presentation and visibility ---------------------
    queue1 = []
    for node in nodes:
        if node.branch:
            # rule 5, size gate on the SOURCE page being merged: a page that
            # already exceeds the gate on its own puts the host over it.
            if node.branch in ("2", "3") and node.words > GATE_WORDS:
                node.notes.append("source page is %d words > %d - merging it trips the "
                                  "host's size gate on its own (rule 5)"
                                  % (node.words, GATE_WORDS))
            # rule 5, size gate on the HOST of a branch-2 / branch-3 merge
            if node.branch in ("2", "3") and target_pages:
                host_slug = re.sub(r"\.md$", "", node.destination.split()[-1])
                host = target_pages.get(host_slug)
                if host and host["gate_reasons"]:
                    node.notes.append("host %s.md already trips the size gate (%s) - rule 5"
                                      % (host_slug, "; ".join(host["gate_reasons"])))
            continue

        node.branch = "4"
        child_count = len(node.children)
        presentation = "HUB" if child_count >= HUB_CHILDREN else "merged page"
        measure_bits = ["no artefact anchor", "no agreed page", "%d child page(s)" % child_count]

        if not budget.known:
            visibility = "menu decision UNKNOWN (no --target)"
            node.destination = "own page (%s), %s" % (presentation, visibility)
            node.measurement = "; ".join(measure_bits)
            continue

        if node.level == 1:
            extra = sum(1 for c in node.children if c.branch == "4") if child_count else 0
            ok, why = budget.can_add_top_level(extra)
            if ok:
                budget.add_top_level(extra)
                visibility = "MENU entry (top level); %s; remaining after: %s" % (
                    why, budget.headroom_text())
            else:
                name, free = budget.freest_dropdown()
                visibility = "pages:-NESTED under its host (menu budget: %s)" % why
                queue1.append(
                    "%s - proposed as its own page but the menu budget is full (%s); "
                    "nested in pages:/ToC instead. Remaining capacity is inside a dropdown "
                    "(%s: %d free) - the human may spend the budget differently."
                    % (node.filename, why, name if name else "-", free))
        else:
            parent_in_menu = (node.parent is not None
                              and node.parent.branch == "4"
                              and "MENU entry" in (node.parent.destination or ""))
            if parent_in_menu:
                visibility = "MENU entry (child of %s); depth 2 <= %d" % (
                    node.parent.filename, LIMIT_MENU_DEPTH)
            else:
                visibility = "pages:-NESTED under %s (its host has no menu entry)" % (
                    node.parent.filename if node.parent else "its host")
                queue1.append(
                    "%s - nested under %s because that host got no menu entry of its own; "
                    "giving this page one directly would put it at menu depth %d > %d, so it "
                    "only becomes visible if the human buys the host a top-level entry first."
                    % (node.filename,
                       node.parent.filename if node.parent else "-",
                       LIMIT_MENU_DEPTH + 1, LIMIT_MENU_DEPTH))
        node.destination = "own page (%s), %s" % (presentation, visibility)
        node.measurement = "; ".join(measure_bits)

    return queue1


# ==========================================================================
# the page map (v2) - THE PRIMARY OUTPUT
# ==========================================================================
# One row per page of the SOURCE PAGE UNIVERSE (authoritative guide tree UNION
# input/pagecontent UNION on-disk pages no toc lists UNION the step-2c harvest
# manifest), plus one RETIRED summary row per non-authoritative guide tree.
# Columns:
#   source_page  path relative to the narrative source root (guide tree or
#                input/pagecontent)
#   target       repo-relative target path (input/pagecontent/x.md,
#                input/intro-notes/<Type>-<id>-intro.md) or RETIRED
#   reason       one human clause
#   branch       1|2|3|4 per spec 9e; 5 = RETIRED (not migrated)
#   measure      the measurement that forced the branch
# The verifier reads columns 0-2 and ignores the rest (v1-compatible).

PAGE_MAP_HEADER = "# source_page\ttarget\treason\tbranch\tmeasure"


def target_slug(text):
    slug = re.sub(r"[^A-Za-z0-9]+", "-", text.strip()).strip("-").lower()
    return slug or "page"


def map_target_for(node, used_targets):
    """The machine target path of one routed page.  Branch 1 already names a
    path; branches 2/3 name their host page; branch 4 derives a NEW page name
    from the source slug (a folder landing page takes its FOLDER's name - a
    guide ships dozens of Index pages and they must not all become index.md),
    deduplicated against the other branch-4 rows of this map."""
    if node.branch == "1":
        return node.destination
    if node.branch in ("2", "3"):
        host = re.sub(r"\.md$", "", node.destination.split()[-1])
        return "input/pagecontent/%s.md" % host
    base = node.slug
    folder = os.path.basename(os.path.dirname(node.filename))
    if base.lower() == "index" and folder:
        base = folder
    candidate = target_slug(base)
    if candidate in used_targets and folder:
        prefixed = target_slug("%s-%s" % (folder, base))
        if prefixed != candidate and prefixed not in used_targets:
            candidate = prefixed
    stem, suffix = candidate, 2
    while candidate in used_targets:
        candidate = "%s-%d" % (stem, suffix)
        suffix += 1
    used_targets.add(candidate)
    return "input/pagecontent/%s.md" % candidate


def map_reason_for(node):
    """One human clause per row - the WHY; the measure column keeps the number
    that forced it."""
    measurement = node.measurement
    if node.branch == "1":
        if measurement.startswith("child of") and node.parent is not None:
            return "child of %s - same intro note" % node.parent.filename
        return "content about one artefact - its intro note"
    if node.branch == "2":
        if measurement.startswith("child of") and node.parent is not None:
            return "subsection of the family overview %s" % node.parent.filename
        return "family overview - h3/h4 section on an artefact index page"
    if node.branch == "3":
        if measurement.startswith("semantic match"):
            return "semantic home per references/routing-table.tsv"
        if measurement.startswith("menu label"):
            return "menu label points at the agreed page"
        return "an agreed page already owns the concern"
    presentation = "hub" if "(HUB)" in node.destination else "merged prose"
    visibility = "menu entry" if "MENU entry" in node.destination else "pages:-nested"
    return "cross-cutting narrative - own page (%s, %s)" % (presentation, visibility)


def build_map_rows(routed_nodes, trees, chosen):
    """The page-map rows: one per routed page (primary tree + union extras, in
    document order), then one RETIRED summary row per non-authoritative guide
    tree (`<tree>/**`), reason = its spec-5.1a disposition.  A node marked
    `mirror_of` (a harvested twin of a primary page) binds to the SAME target
    the primary's row got - visible, never silently dropped, and never routed
    into a second target file for the same content."""
    rows = []
    used_targets = set()
    target_of = {}
    mirrors = [n for n in routed_nodes if n.mirror_of is not None]
    for node in routed_nodes:
        if node.mirror_of is not None:
            continue
        target = map_target_for(node, used_targets)
        target_of[id(node)] = (target, node.branch or "4")
        rows.append({
            "source": node.filename,
            "target": target,
            "reason": map_reason_for(node),
            "branch": node.branch or "4",
            "measure": node.measurement,
        })
    for node in mirrors:
        bound = target_of.get(id(node.mirror_of))
        target, branch = bound if bound else (
            map_target_for(node.mirror_of, used_targets),
            node.mirror_of.branch or "4")
        rows.append({
            "source": node.filename,
            "target": target,
            "reason": "harvested twin of `%s` (slug match) - one page, two "
                      "sources; confirm at map review" % node.mirror_of.filename,
            "branch": branch,
            "measure": "slug '%s' matches the primary page" % node.slug,
        })
    for tree in trees or []:
        if chosen is not None and tree is chosen:
            continue
        reason = re.sub(r"\*+", "", tree["disposition"]).strip() \
            or "non-authoritative guide tree"
        measure = ("dir version %s, guide.yaml version %s, lang %s, %d page "
                   "file(s); authoritative: %s") % (
            tree["version_name"] or "-", tree["version_yaml"] or "-",
            tree["language"] or "-", tree["page_files"],
            chosen["name"] if chosen else "none")
        rows.append({
            "source": "%s/**" % tree["name"],
            "target": "RETIRED",
            "reason": reason,
            "branch": "5",
            "measure": measure,
        })
    return rows


def compute_universe(source_root, chosen):
    """The source page universe, re-derived FROM DISK (independently of the
    walkers, so a page a walker lost is a finding, not a silent hole):
    input/pagecontent/*.md plus every *.page.md under the authoritative guide
    tree."""
    universe = OrderedDict()
    page_dir = os.path.join(source_root, "input", "pagecontent")
    if os.path.isdir(page_dir):
        for name in sorted(os.listdir(page_dir)):
            if name.endswith(".md"):
                universe.setdefault(name, "input/pagecontent")
    if chosen:
        root = chosen["path"]
        for dirpath, dirnames, filenames in os.walk(root):
            dirnames[:] = sorted(d for d in dirnames if not d.startswith("."))
            for name in sorted(filenames):
                if name.endswith(PAGE_SUFFIX):
                    rel = os.path.relpath(os.path.join(dirpath, name),
                                          root).replace(os.sep, "/")
                    universe.setdefault(rel, "guide tree %s" % chosen["name"])
    return universe


def validate_coverage(rows, universe):
    """The COVERAGE VALIDATION of the contract: every universe page has a row
    with a non-empty target; every RETIRED row carries a reason.  Returns the
    findings; an empty list is the pass."""
    findings = []
    covered = set()
    for row in rows:
        if row["target"].strip():
            covered.add(row["source"])
        if row["target"].strip() == "RETIRED" and not row["reason"].strip():
            findings.append("RETIRED row `%s` carries NO reason - every "
                            "retirement must say why" % row["source"])
    for page, origin in universe.items():
        if page not in covered:
            findings.append("`%s` (%s) has NO page-map row with a target - "
                            "the source page universe is not covered"
                            % (page, origin))
    return findings


def _tsv_field(value):
    return re.sub(r"[\t\r\n]+", " ", value).strip()


def write_page_map(path, rows):
    lines = [
        PAGE_MAP_HEADER,
        "# page-map v2 - GENERATED by page-structure-advice.py v%s; the "
        "Markdown report is its rendering." % SCRIPT_VERSION,
        "# branch: spec 9e routing branch 1-4; 5 = RETIRED "
        "(non-authoritative guide tree, not migrated).",
    ]
    for row in rows:
        lines.append("\t".join(_tsv_field(row[key]) for key in
                               ("source", "target", "reason", "branch", "measure")))
    directory = os.path.dirname(os.path.abspath(path))
    if directory and not os.path.isdir(directory):
        os.makedirs(directory)
    with open(path, "w", encoding="utf-8") as handle:
        handle.write("\n".join(lines) + "\n")


# ==========================================================================
# report
# ==========================================================================

def md_escape(text):
    return text.replace("|", "\\|")


def render_tree(nodes, roots, lines, prefix=""):
    for index, node in enumerate(roots):
        last = index == len(roots) - 1
        lines.append("%s%s %s  `%s`" % (prefix, "`-" if last else "|-",
                                        node.title or node.slug, node.filename))
        if node.children:
            render_tree(nodes, node.children,
                        lines, prefix + ("   " if last else "|  "))


def build_report(args, source_info, target_info, nodes, roots, queue1, budget,
                 map_info):
    out = []
    now = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    routing = map_info["routing"]
    preflight_info = map_info["preflight"]
    out.append("# Page-structure advice")
    out.append("")
    out.append("**This report PROPOSES and never edits a module.** It reads the source and "
               "target repositories read-only; its only writes are this report and the "
               "page-map v2 TSV (`--map`) - the map is the PRIMARY output and the contract "
               "step 5 consumes, this report is its rendering. Every routing row below is "
               "the branch the MEASUREMENTS support - a human (or the skill at step 5) "
               "decides and applies it.")
    out.append("")
    out.append("| Input | Value |")
    out.append("| --- | --- |")
    out.append("| source repo | `%s` |" % md_escape(args.source))
    out.append("| target repo | `%s` |" % md_escape(args.target or "(not given)"))
    out.append("| routing table | `%s` (%d pattern%s) |" % (
        md_escape(routing["path"]), routing["count"],
        "" if routing["count"] == 1 else "s"))
    harvest = map_info.get("harvest") or {}
    if harvest.get("tsv"):
        out.append("| harvest manifest | `%s`%s (%d page%s, %d skipped) |" % (
            md_escape(harvest["tsv"]),
            " (auto-discovered)" if harvest.get("auto") else "",
            harvest["pages"], "" if harvest["pages"] == 1 else "s",
            harvest["skipped"]))
    out.append("| Gate 0 preflight | %s |" % md_escape(
        "`%s`" % preflight_info["path"] if preflight_info["data"] is not None
        else "%s (%s)" % (preflight_info["path"] or "-",
                          preflight_info["note"] or "absent")))
    out.append("| artefact census | %s |" % md_escape(preflight_info["census"]))
    out.append("| page map | %s |" % md_escape(
        "`%s`" % map_info["path"] if map_info["path"]
        else "(not written - re-run with --map)"))
    out.append("| generated | %s |" % now)
    out.append("| script | `page-structure-advice.py` v%s |" % SCRIPT_VERSION)
    out.append("")
    for line_number, why in routing["skipped"]:
        out.append("- routing-table line %d skipped: %s." % (line_number, why))
    if routing["skipped"]:
        out.append("")
    out.append("Contract limits in force: menu total <= %d, dropdown children <= %d, "
               "top level <= %d, menu depth <= %d; size gate at > %d words, > %d merged "
               "sources, or ANY repeated heading title; hub at >= %d children."
               % (LIMIT_MENU_TOTAL, LIMIT_DROPDOWN_CHILDREN, LIMIT_TOP_LEVEL,
                  LIMIT_MENU_DEPTH, GATE_WORDS, GATE_MERGED_SOURCES, HUB_CHILDREN))
    out.append("")

    # ---- 1. source ------------------------------------------------------
    out.append("## 1. Source page tree")
    out.append("")
    out.append("The tree is taken from the FIRST of four inputs that yields pages: "
               "**(a)** the `pages:` block of the source `sushi-config.yaml`, **(b)** the "
               "authoritative Simplifier guide tree under `%s/` (spec 5.1a), "
               "**(c)** a flat count of `input/pagecontent/*.md`." % GUIDE_DIR_NAME)
    out.append("")
    out.append("**Input used: %s.**" % source_info["origin_label"])
    out.append("")

    guide = source_info.get("guide") or {}
    trees = guide.get("trees") or []
    if trees:
        out.append("### 1.0 Simplifier guide trees found")
        out.append("")
        out.append("Every tree under `%s/` is listed - the choice is never made silently. "
                   "Dispositions follow spec 5.1a: #1 authoritative, #2 parallel-language "
                   "harvest seed, #3 historical/shared retained, #4 unrecognized."
                   % GUIDE_DIR_NAME)
        out.append("")
        out.append("| Guide tree | Title | Version (dir name) | Version (guide.yaml) | Lang | "
                   "`*.page.md` on disk | Disposition |")
        out.append("| --- | --- | --- | --- | --- | ---: | --- |")
        for tree in trees:
            out.append("| `%s` | %s | %s | %s | %s | %d | %s |" % (
                tree["name"], md_escape(tree["title"] or "-"),
                tree["version_name"] or "-", tree["version_yaml"] or "-",
                tree["language"] or "-", tree["page_files"],
                md_escape(tree["disposition"])))
        out.append("")
        if guide.get("chosen"):
            out.append("**Chosen: `%s`** - %s." % (guide["chosen"]["name"],
                                                   md_escape(guide["reason"])))
        else:
            out.append("**No tree chosen** - %s." % md_escape(guide["reason"]))
        out.append("")
        out.append("The module's narrative language read from `sushi-config.yaml` "
                   "`language:` is **%s**." % (guide.get("module_language") or "not stated"))
        out.append("")
        for note in guide.get("notes") or []:
            out.append("- %s" % note)
        if guide.get("notes"):
            out.append("")
        out.append("**A human can override this choice**: re-run with "
                   "`--guide-tree <directory name>`. The ranking above is evidence, not a "
                   "verdict - confirm it against the rendered IG and record it in the "
                   "inventory (Gate B reviews it).")
        out.append("")
        if source_info["origin"] != "guide-tree":
            out.append("_These trees were NOT used: the `pages:` block already yielded a page "
                       "tree, and input (a) wins. They still need a disposition in the "
                       "inventory._")
            out.append("")

    if not nodes:
        out.append("### 1.1 No page tree could be built")
        out.append("")
        out.append("`sushi-config.yaml` has no usable `pages:` block and no guide tree under "
                   "`%s/` yielded pages, so the source page tree is **flat/unknown** - it is "
                   "not reconstructed here. Counted instead: **%d** files in "
                   "`input/pagecontent/`." % (GUIDE_DIR_NAME, source_info["file_count"]))
        out.append("")
        out.append("Every routing row below therefore carries no depth evidence; treat the "
                   "parent/child measurements as absent, not as zero.")
        out.append("")
    else:
        out.append("### 1.1 Depth histogram")
        out.append("")
        out.append(source_info["tree_note"])
        out.append("")
        out.append("| Level | Pages | Share |")
        out.append("| --- | ---: | ---: |")
        total = len(nodes)
        for level in sorted(source_info["histogram"]):
            count = source_info["histogram"][level]
            out.append("| %d | %d | %.0f%% |" % (level, count, 100.0 * count / total))
        out.append("| **total** | **%d** | 100%% |" % total)
        out.append("")
        out.append("Maximum depth used: **%d**. Total words across the %d source pages: "
                   "**%d**. Pages in `input/pagecontent/`: **%d**."
                   % (max(source_info["histogram"]), total,
                      sum(node.words for node in nodes), source_info["file_count"]))
        out.append("")
        if source_info["findings"]:
            out.append("### 1.1a Structural findings in the source tree")
            out.append("")
            out.append("Reported, never silently absorbed - each one is a page the migration "
                       "would otherwise lose or invent.")
            out.append("")
            for finding in source_info["findings"]:
                out.append("- %s" % finding)
            out.append("")
        out.append("### 1.2 Parent-child tree")
        out.append("")
        out.append("```")
        tree_lines = []
        render_tree(nodes, roots, tree_lines)
        out.extend(tree_lines)
        out.append("```")
        out.append("")

    # ---- 2. target pages ------------------------------------------------
    out.append("## 2. Target page measurements")
    out.append("")
    if not target_info["pages"]:
        out.append("_No target given (or `input/pagecontent/` is empty) - size gate not measured._")
        out.append("")
    else:
        out.append("Words = whitespace tokens after removing HTML comments, table separator "
                   "rows and the markup characters `>`, `|`, `*`, `_`, `` ` ``. Headings, list "
                   "items, table cells and fenced code all count: the gate measures what the "
                   "reader has to traverse. Repeated titles are compared case-sensitively; each "
                   "repeat costs one publisher-appended anchor (`-2`, `-3`, ...). Merged "
                   "sources are the distinct `<!-- source: X.md -->` section markers the "
                   "migration itself left behind.")
        out.append("")
        out.append("| Page | Words | h2 | h3 | h4 | other h | Repeated titles | Anchor collisions | Merged sources | Size gate |")
        out.append("| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |")
        for slug, page in target_info["pages"].items():
            levels = page["by_level"]
            other = sum(count for level, count in levels.items() if level not in (2, 3, 4))
            gate = "**TRIPS** - " + "; ".join(page["gate_reasons"]) if page["gate_reasons"] else "ok"
            out.append("| `%s.md` | %d | %d | %d | %d | %d | %d | %d | %d | %s |" % (
                slug, page["words"], levels.get(2, 0), levels.get(3, 0), levels.get(4, 0),
                other, len(page["repeated"]), len(page["collisions"]),
                len(page["sources"]), md_escape(gate)))
        out.append("")
        tripped = [(s, p) for s, p in target_info["pages"].items() if p["gate_reasons"]]
        if tripped:
            out.append("### 2.1 Pages that trip the size gate")
            out.append("")
            for slug, page in tripped:
                out.append("- **`%s.md`** - %s." % (slug, "; ".join(page["gate_reasons"])))
                if page["repeated"]:
                    out.append("  - repeated titles: %s" % ", ".join(
                        '"%s" (x%d)' % (title, count) for title, count in page["repeated"].items()))
                if page["collisions"]:
                    out.append("  - collided anchors: %s" % ", ".join(
                        "`#%s`" % anchor for anchor in page["collisions"]))
                if len(page["sources"]) > GATE_MERGED_SOURCES:
                    out.append("  - merged sources: %s" % ", ".join(
                        "`%s`" % source for source in page["sources"]))
                out.append("  - rule 5: re-run routing preferring branches 1 and 2, or split.")
            out.append("")

    # ---- 3. menu budget -------------------------------------------------
    out.append("## 3. Menu budget")
    out.append("")
    menu = target_info["menu"]
    if not menu:
        out.append("_No `input/includes/menu.xml` (or no `--target`) - the menu budget is "
                   "UNKNOWN and no visibility decision is proposed below._")
        out.append("")
    else:
        clickable = len(menu["clickable"])
        top_level = len(menu["top_level"])
        widest = max(menu["dropdowns"].items(), key=lambda kv: len(kv[1])) if menu["dropdowns"] else ("-", [])
        out.append("Clickable entries are the menu's real destinations: every `<li><a>` except "
                   "the dropdown toggles, which only repeat their first child's href.")
        out.append("")
        out.append("| Metric | Measured | Contract limit | Headroom |")
        out.append("| --- | ---: | ---: | ---: |")
        out.append("| total clickable entries | %d | %d | %d |" % (
            clickable, LIMIT_MENU_TOTAL, LIMIT_MENU_TOTAL - clickable))
        out.append("| widest dropdown (%s) | %d | %d | %d |" % (
            widest[0], len(widest[1]), LIMIT_DROPDOWN_CHILDREN,
            LIMIT_DROPDOWN_CHILDREN - len(widest[1])))
        out.append("| top-level entries | %d | %d | %d |" % (
            top_level, LIMIT_TOP_LEVEL, LIMIT_TOP_LEVEL - top_level))
        out.append("| menu depth used | %d | %d | %d |" % (
            menu["max_depth"], LIMIT_MENU_DEPTH, LIMIT_MENU_DEPTH - menu["max_depth"]))
        out.append("")
        out.append("| Dropdown | Children | Free (of %d) |" % LIMIT_DROPDOWN_CHILDREN)
        out.append("| --- | ---: | ---: |")
        for name, children in menu["dropdowns"].items():
            out.append("| %s | %d | %d |" % (md_escape(name), len(children),
                                             LIMIT_DROPDOWN_CHILDREN - len(children)))
        out.append("")
        out.append("After the proposals in section 4: %s." % budget.headroom_text())
        out.append("")

    # ---- 4. routing proposal -------------------------------------------
    out.append("## 4. Routing proposal (spec 9d/9e)")
    out.append("")
    if not nodes:
        out.append("_No source page tree could be built (no `pages:` block and no guide tree "
                   "with pages) - no per-source-page routing is proposed. Route the %d files "
                   "in `input/pagecontent/` by hand, or add the block._"
                   % source_info["file_count"])
        out.append("")
    else:
        out.append("One row per source page. The branch number is the spec's; the measurement "
                   "column is the number that forced it. Branch-4 rows state the presentation "
                   "(4a) and the visibility (4b), and, where a menu entry fits, the remaining "
                   "budget after it. `Words` is the source page's own size, counted the same "
                   "way as the target pages in section 2.")
        out.append("")
        out.append("| # | Source page | Lvl | Children | Words | Branch | Proposed destination | Measurement |")
        out.append("| ---: | --- | ---: | ---: | ---: | --- | --- | --- |")
        branch_label = {
            "1": "1 intro-note",
            "2": "2 section on index page",
            "3": "3 merge into agreed page",
            "4": "4 own page",
        }
        for index, node in enumerate(nodes, 1):
            destination = node.destination
            if node.notes:
                destination += " <br>_(%s)_" % "; ".join(node.notes)
            out.append("| %d | `%s` | %d | %d | %d | %s | %s | %s |" % (
                index, node.filename, node.level, len(node.children), node.words,
                branch_label.get(node.branch, node.branch),
                md_escape(destination), md_escape(node.measurement)))
        out.append("")
        counts = Counter(node.branch for node in nodes)
        out.append("Branch totals: " + ", ".join(
            "%s = %d" % (branch_label.get(b, b), counts[b]) for b in sorted(counts)) + ".")
        out.append("")

    # ---- 5. queue 1 -----------------------------------------------------
    out.append("## 5. Report queue 1 items")
    out.append("")
    if queue1:
        out.append("The menu budget forced a ToC-nesting where a menu entry was otherwise "
                   "warranted. Allocation below is first-come-first-served in source document "
                   "order; the human may spend the budget differently.")
        out.append("")
        for item in queue1:
            out.append("- %s" % item)
        out.append("")
    else:
        out.append("_None from the menu budget._")
        out.append("")
    gate_items = [(s, p) for s, p in target_info["pages"].items() if p["gate_reasons"]] \
        if target_info["pages"] else []
    if gate_items:
        out.append("Size-gate trips (rule 5) needing a routing re-run or a split:")
        out.append("")
        for slug, page in gate_items:
            out.append("- `%s.md` - %s." % (slug, "; ".join(page["gate_reasons"])))
        out.append("")

    # ---- 6. run-log lines ----------------------------------------------
    logged_nodes = list(nodes) + list(map_info["extra_nodes"])
    if logged_nodes:
        out.append("## 6. Suggested `5.4c page-routing` run-log lines")
        out.append("")
        out.append("One per source page (union pages included), ready for the migration run "
                   "log. The `5.4c page-routing` step IS the advice run that GENERATES the "
                   "page map (`--map`) - the map is machine-written, never hand-written; "
                   "these lines are only its run-log form.")
        out.append("")
        out.append("```")
        for node in logged_nodes:
            out.append("5.4c page-routing\t%s\tbranch=%s\t%s\t%s" % (
                node.filename, node.branch,
                node.destination.replace("\t", " "),
                node.measurement.replace("\t", " ")))
        out.append("5.4c page-routing\tmap rows=%d retired=%d coverage=%s\tmap=%s" % (
            len(map_info["rows"]), map_info["retired_count"],
            "FAILED" if map_info["findings"] else "ok",
            map_info["path"] or "(not written)"))
        out.append("```")
        out.append("")

    # ---- 7. page map ----------------------------------------------------
    out.append("## 7. Page map (v2) and coverage")
    out.append("")
    out.append("The page map is the CONTRACT of the narrative migration: this run generates "
               "and validates it, step 5 consumes ONLY it, step 8 checks against it. "
               "Columns: `source_page`, `target` (repo-relative path or `RETIRED`), "
               "`reason`, `branch` (spec 9e 1-4; 5 = RETIRED), `measure`. One row per page "
               "of the source page universe - the authoritative guide tree UNION "
               "`input/pagecontent` UNION on-disk pages no toc lists.")
    out.append("")
    out.append("Rows: **%d** total - %d routed source pages (%d from the primary tree, "
               "%d union pages outside it) and %d RETIRED guide-tree summary row(s)."
               % (len(map_info["rows"]),
                  len(map_info["rows"]) - map_info["retired_count"],
                  len(nodes), len(map_info["extra_nodes"]),
                  map_info["retired_count"]))
    out.append("")
    if map_info["extra_nodes"]:
        out.append("### 7.1 Union pages outside the primary tree")
        out.append("")
        out.append("Pages of the universe the primary page tree does not list - routed by "
                   "the same passes, after it (menu budget included).")
        out.append("")
        out.append("| Source page | Branch | Target | Measurement |")
        out.append("| --- | --- | --- | --- |")
        target_of = {row["source"]: row["target"] for row in map_info["rows"]}
        for node in map_info["extra_nodes"]:
            row_notes = " <br>_(%s)_" % "; ".join(node.notes) if node.notes else ""
            out.append("| `%s` | %s | `%s` | %s%s |" % (
                node.filename, node.branch,
                md_escape(target_of.get(node.filename, node.destination)),
                md_escape(node.measurement), md_escape(row_notes)))
        out.append("")
    if map_info["retired_count"]:
        out.append("### 7.2 RETIRED guide trees")
        out.append("")
        out.append("| Tree | Reason |")
        out.append("| --- | --- |")
        for row in map_info["rows"]:
            if row["target"] == "RETIRED":
                out.append("| `%s` | %s |" % (row["source"], md_escape(row["reason"])))
        out.append("")
    out.append("### 7.3 Coverage validation")
    out.append("")
    out.append("Universe re-derived from disk: **%d** page(s). Every one needs a row with "
               "a non-empty target; every RETIRED row needs a reason. The exit code "
               "reports the result (0 covered, 1 not)."
               % len(map_info["universe"]))
    out.append("")
    if map_info["findings"]:
        out.append("**COVERAGE FAILED:**")
        out.append("")
        for finding in map_info["findings"]:
            out.append("- %s" % finding)
    else:
        out.append("**Covered.** All %d universe pages have a target row; every RETIRED "
                   "row carries a reason." % len(map_info["universe"]))
    out.append("")

    # ---- 8. M9 / other-bucket proposal ----------------------------------
    out.extend(build_m9_section(preflight_info))

    return "\n".join(out) + "\n"


def build_m9_section(preflight_info):
    """Spec 9a M9: the seven optional (0..1) pages are DECIDED from the built
    package's per-type counts, and every `artifacts.other` type needs a NAMED
    placement.  Counts come from Gate 0's census; where generated resources
    exist their resourceType counts are the authoritative ones
    (`generated_crosscheck` - FSH declarations only know InstanceOf names)."""
    out = ["## 8. M9 optional-page / other-bucket proposal (Gate 0 census)", ""]
    data = preflight_info["data"]
    if data is None:
        out.append("_No Gate 0 preflight at `%s` (%s) - run Gate 0 first; the M9 and "
                   "other-bucket proposals need its census._"
                   % (preflight_info["path"] or "-",
                      preflight_info["note"] or "absent"))
        out.append("")
        return out
    artifacts = data.get("artifacts") or {}
    crosscheck = artifacts.get("generated_crosscheck") or {}
    counts = crosscheck.get("counts") or {}
    other = crosscheck.get("other")
    counts_label = "generated_crosscheck.counts (%s)" % (
        crosscheck.get("source") or "fsh-generated/resources")
    if not counts:
        counts = {key: value for key, value in artifacts.items()
                  if isinstance(value, int)}
        other = None
        counts_label = "FSH-declaration counts (no generated cross-check!)"
    if other is None:
        other = artifacts.get("other") or {}
    out.append("Counts: %s. Rule (spec 9a): count 0 -> REMOVE the optional page, "
               "count > 0 -> KEEP and fill it; artefacts are never deleted to force "
               "a removal. Each proposal is a `5.4a` run-log line and a HUMAN "
               "decision - this table only measures." % counts_label)
    out.append("")
    out.append("| Optional page | Census key | Count | Proposal |")
    out.append("| --- | --- | ---: | --- |")
    for page, key in OPTIONAL_PAGE_COUNT_KEY.items():
        if key is None:
            out.append("| `%s.md` | - | - | no artefact count decides it - source "
                       "narrative does (human decision) |" % page)
            continue
        count = counts.get(key)
        if count is None:
            out.append("| `%s.md` | `%s` | ? | census has no `%s` count - decide "
                       "by hand |" % (page, key, key))
        elif count > 0:
            out.append("| `%s.md` | `%s` | %d | **KEEP** (fill it, delete the "
                       "banner + OPTIONAL-PAGE marker in both languages) |"
                       % (page, key, count))
        else:
            out.append("| `%s.md` | `%s` | 0 | **REMOVE** per the template's "
                       "docs/optional-pages.md procedure |" % (page, key))
    out.append("")
    if other:
        out.append("Artefact types in the census's OTHER bucket - each has NO template "
                   "page and needs its own named placement (its own `5.4a` line; a "
                   "type nobody placed is a queue-1 item):")
        out.append("")
        out.append("| `artifacts.other` type | Count | Proposed placement |")
        out.append("| --- | ---: | --- |")
        for rtype in sorted(other):
            host = TYPE_INDEX_PAGE.get(rtype, "artifacts")
            out.append("| %s | %s | h3/h4 section on `%s.md` |" % (
                rtype, other[rtype], host))
        out.append("")
    else:
        out.append("_The census reports no `other`-bucket artefact types._")
        out.append("")
    mismatches = crosscheck.get("mismatches") or {}
    if mismatches:
        out.append("Declared-vs-generated mismatches Gate 0 reports (%d) - the GENERATED "
                   "counts above are the authoritative ones: %s."
                   % (len(mismatches),
                      ", ".join("`%s` %s->%s" % (key,
                                                 value.get("declared", "?"),
                                                 value.get("generated", "?"))
                                for key, value in sorted(mismatches.items()))))
        out.append("")
    return out


# ==========================================================================
# main
# ==========================================================================

def main(argv=None):
    parser = argparse.ArgumentParser(
        description="Measure the evidence behind the spec 9d/9e page-routing decision. "
                    "Proposes only; never edits a repository.")
    parser.add_argument("--source", required=True, help="the ORIGINAL module repository")
    parser.add_argument("--target", help="the MIGRATED repository (optional)")
    parser.add_argument("--out", help="write the Markdown report here (default: stdout)")
    parser.add_argument("--map", dest="map",
                        help="write the page-map v2 TSV here - the PRIMARY "
                             "output; the report is its rendering")
    parser.add_argument("--routing-table", dest="routing_table",
                        help="the semantic routing table (default: the "
                             "references/routing-table.tsv sibling of this script)")
    parser.add_argument("--guide-tree", dest="guide_tree",
                        help="HUMAN OVERRIDE: the directory name under "
                             "implementation-guides/ to treat as authoritative")
    parser.add_argument("--harvest-tsv", dest="harvest_tsv",
                        help="the step-2c guide-harvest manifest - source (d), "
                             "for a module whose narrative exists only on the "
                             "rendered Simplifier guide (default: "
                             "<target>/migration-log/guide-harvest.tsv when "
                             "present)")
    parser.add_argument("--harvest-dir", dest="harvest_dir",
                        help="the harvested pagecontent directory (default: "
                             "guide-harvest/pagecontent beside the manifest)")
    args = parser.parse_args(argv)

    source_root = os.path.abspath(args.source)
    target_root = os.path.abspath(args.target) if args.target else None
    if not os.path.isdir(source_root):
        parser.error("--source is not a directory: %s" % source_root)
    if target_root and not os.path.isdir(target_root):
        parser.error("--target is not a directory: %s" % target_root)

    # The rule this guard exists for is "never change a module": not the
    # source (read-only by definition) and no CONTENT of the target. The
    # target's `migration-log/` is the migration's own workspace, where
    # every other artefact of the run already lives and is committed with
    # the branch -- refusing it sent the report to /tmp, away from the
    # evidence it belongs beside (measured on the Onkologie try-run, where
    # the natural invocation failed outright).  It guards EVERY file this
    # script writes: the report (--out) and the page map (--map) alike.
    def guard_write(path_argument):
        path = os.path.abspath(path_argument)
        if source_root and (path == source_root
                            or path.startswith(source_root + os.sep)):
            parser.error("refusing to write inside the --source repository: %s "
                         "(the source is read-only)" % path)
        if target_root and (path == target_root
                            or path.startswith(target_root + os.sep)):
            log_dir = os.path.join(target_root, "migration-log") + os.sep
            if not path.startswith(log_dir):
                parser.error("refusing to write into the target's CONTENT: %s "
                             "(this script never edits a module; write to "
                             "%smigration-log/ instead)" % (path, target_root + os.sep))
        return path

    if args.out:
        guard_write(args.out)
    if args.map:
        guard_write(args.map)

    # ---- source ---------------------------------------------------------
    # Fallback order, spec 9d/9e: (a) the sushi-config `pages:` block, (b) the
    # authoritative Simplifier guide tree, (c) a flat file count, (d) the
    # step-2c harvest manifest.  A module that authors its narrative on
    # Simplifier - the normal MII shape - has no usable `pages:` block, and
    # reporting "0 source pages" for it made the routing rule unusable exactly
    # where it matters most; the Consent shape (raw Forge XML, narrative only
    # on the RENDERED guide) has no tree on disk either, and its pages reach
    # this script only through the harvest.
    config_path = os.path.join(source_root, "sushi-config.yaml")
    if not os.path.isfile(config_path):
        config_path = os.path.join(source_root, "sushi-config.yml")
    config_text = read_text(config_path)
    config_rel = os.path.relpath(config_path, source_root)

    page_dir = os.path.join(source_root, "input", "pagecontent")
    file_count = len([n for n in os.listdir(page_dir) if n.endswith(".md")]) \
        if os.path.isdir(page_dir) else 0

    roots, nodes, found = parse_pages_block(config_text)
    for node in nodes:
        path = os.path.join(page_dir, node.filename)
        if os.path.isfile(path):
            node.words = count_words(read_text(path))

    module_language = source_language(config_text)
    trees = discover_guide_trees(source_root)
    guide_info = {
        "trees": trees,
        "chosen": None,
        "reason": "",
        "notes": [],
        "module_language": module_language,
    }
    findings = []
    origin = "pages-block" if found else "flat"
    if found:
        for node in nodes:
            if not os.path.isfile(os.path.join(page_dir, node.filename)):
                findings.append("`pages:` lists `%s` but `input/pagecontent/%s` "
                                "does not exist - the toc entry is **dangling** "
                                "and has no words to route." % (node.filename,
                                                                node.filename))
    origin_label = ("(a) the `pages:` block of `%s`" % config_rel) if found else \
                   ("(c) a flat count of `input/pagecontent/*.md` - "
                    "no page tree available")
    tree_note = "Parsed from `%s`, indentation-based." % config_rel
    folder_landing_pages = False

    if trees:
        chosen, reason, notes = choose_guide_tree(
            trees, module_language, None if found else args.guide_tree)
        if found and args.guide_tree:
            notes.append("`--guide-tree` was given but the `pages:` block already yielded a "
                         "page tree, and input (a) wins - the override had no effect.")
        guide_info.update({"chosen": chosen, "reason": reason, "notes": notes})
        label_dispositions(trees, chosen)

        if not found and chosen is not None:
            guide_roots, guide_nodes, walk = walk_guide_tree(chosen["path"])
            if guide_nodes:
                roots, nodes = guide_roots, guide_nodes
                origin = "guide-tree"
                origin_label = ("(b) the Simplifier guide tree `%s/%s`, walked from its "
                                "`toc.yaml`" % (GUIDE_DIR_NAME, chosen["name"]))
                folder_landing_pages = True
                tree_note = (
                    "Walked from `%s/%s/toc.yaml`: an entry whose `filename` ends in "
                    "`%s` is a page, any other `filename` is a sub-directory holding its "
                    "own `toc.yaml`. A sub-directory is a LEVEL, not a page, so every page "
                    "of one directory shares one level (that is how Simplifier renders a "
                    "folder), and the levels are shifted so the shallowest page sits at "
                    "level 1 - this guide's root `toc.yaml` lists only a folder, which adds "
                    "no page level. Routing still needs a page parent, so each directory is "
                    "represented by its `Index.page.md` and its remaining pages plus its "
                    "sub-folders' representatives become that page's children; a parent may "
                    "therefore share its children's level."
                    % (GUIDE_DIR_NAME, chosen["name"], PAGE_SUFFIX))
                for rel_dir in walk.dirs_without_toc:
                    findings.append("`%s/` has **no `toc.yaml`** - the hierarchy of that "
                                    "subtree is derived from DIRECTORY NESTING, not from a "
                                    "table of contents. Order and titles are the file "
                                    "system's, not the author's." % rel_dir)
                for rel_dir in walk.dirs_unreached:
                    findings.append("`%s/` holds pages but **no `toc.yaml` links to it** - "
                                    "its pages are placed by directory nesting and are "
                                    "invisible in the rendered guide's navigation."
                                    % rel_dir)
                for rel_toc, filename, why in walk.dangling:
                    findings.append("`%s` lists `%s`, but the **%s** - the entry is dangling "
                                    "and produced no page." % (rel_toc, filename, why))
                for rel_page, why in walk.unreferenced:
                    findings.append("`%s` exists on disk but is **%s** - it is in the tree "
                                    "below, flagged, so the migration cannot lose it."
                                    % (rel_page, why))
            else:
                guide_info["notes"].append(
                    "guide tree `%s` yielded no pages when walked; fell back to the flat "
                    "file count." % chosen["name"])

    # ---- source (d): the harvested Simplifier guide ----------------------
    harvest_tsv = args.harvest_tsv or default_harvest_tsv(target_root)
    harvest_dir = args.harvest_dir or (
        os.path.join(os.path.dirname(os.path.abspath(harvest_tsv)),
                     "guide-harvest", "pagecontent") if harvest_tsv else None)
    harvest_nodes, harvest_universe, harvest_skipped, harvest_notes = \
        load_harvest(harvest_tsv, harvest_dir) if harvest_tsv \
        else ([], OrderedDict(), [], [])
    harvest_info = {
        "tsv": harvest_tsv,
        "auto": bool(harvest_tsv) and not args.harvest_tsv,
        "pages": len(harvest_nodes),
        "skipped": len(harvest_skipped),
        "notes": harvest_notes,
    }
    if harvest_nodes and not nodes:
        nodes = harvest_nodes
        roots = [n for n in harvest_nodes if n.parent is None]
        origin = "guide-harvest"
        origin_label = ("(d) the step-2c harvest manifest `%s` - the narrative "
                        "exists only on the rendered Simplifier guide (spec "
                        "5.1d)" % harvest_tsv)
        tree_note = ("Parsed from the harvest manifest in discovery order; "
                     "levels derive from the guide URL depth, shallowest at 1.")
    for url, reason in harvest_skipped:
        findings.append("the harvest SKIPPED `%s` (%s) - a discovered source "
                        "page with NO routable content. The coverage "
                        "validation below fails until the harvest is clean or "
                        "a human retires the page in the reviewed map."
                        % (url, reason))
    findings.extend(harvest_notes)

    source_info = {
        "found": found,
        "origin": origin,
        "origin_label": origin_label,
        "tree_note": tree_note,
        "guide": guide_info,
        "findings": findings,
        "file_count": file_count,
        "histogram": Counter(node.level for node in nodes),
        "config_rel": config_rel,
    }

    # ---- target ---------------------------------------------------------
    target_pages = measure_target_pages(target_root) if target_root else OrderedDict()
    menu = parse_menu(os.path.join(target_root, "input", "includes", "menu.xml")) \
        if target_root else None
    target_info = {"pages": target_pages, "menu": menu}

    # ---- routing --------------------------------------------------------
    routing_path = os.path.abspath(args.routing_table) if args.routing_table \
        else default_routing_table_path()
    routing_rows, routing_skipped = load_routing_table(routing_path)
    if not routing_rows and not os.path.isfile(routing_path):
        routing_skipped = list(routing_skipped) + [
            (0, "file not found - semantic routing DISABLED")]

    preflight, preflight_path, preflight_note = load_preflight(target_root)
    preflight_detail = (preflight or {}).get("artifacts_detail")
    artefacts, census_label = collect_artefacts(source_root, target_root,
                                                preflight_detail)
    frequency = build_token_frequency(artefacts)
    slug_index, title_index = agreed_pages(target_root, menu, target_pages)
    budget = MenuBudget(menu)
    queue1 = route(nodes, artefacts, frequency, slug_index, title_index,
                   target_pages, budget, folder_landing_pages,
                   routing_rows) if nodes else []

    # ---- union extras: universe pages the primary tree does not list -----
    chosen = guide_info["chosen"]
    extra_nodes = []
    routed_names = {node.filename for node in nodes}
    pagecontent_extras = []
    if os.path.isdir(page_dir):
        for name in sorted(os.listdir(page_dir)):
            if name.endswith(".md") and name not in routed_names:
                extra = PageNode(name, 1, None)
                extra.words = count_words(read_text(os.path.join(page_dir, name)))
                extra.notes.append("union page: in input/pagecontent but not in "
                                   "the primary page tree")
                pagecontent_extras.append(extra)
    if pagecontent_extras:
        queue1 += route(pagecontent_extras, artefacts, frequency, slug_index,
                        title_index, target_pages, budget, False, routing_rows)
        extra_nodes.extend(pagecontent_extras)
    if chosen is not None and origin != "guide-tree":
        _guide_roots, guide_extras, _guide_walk = walk_guide_tree(chosen["path"])
        for node in guide_extras:
            node.notes.append("union page: the authoritative guide tree `%s` was "
                              "not the primary input" % chosen["name"])
        if guide_extras:
            queue1 += route(guide_extras, artefacts, frequency, slug_index,
                            title_index, target_pages, budget, True, routing_rows)
            extra_nodes.extend(guide_extras)
    if harvest_nodes and origin != "guide-harvest":
        # A page harvested to disk AND sitting in the primary tree is ONE
        # page.  Matching is by COMPACTED slug (case-insensitive - Simplifier
        # URL segments are TitleCase, tree basenames often are not), and a
        # match is never silently dropped: the harvested twin keeps a visible
        # map row BOUND to the primary page's target, so wrong twin-detection
        # is a reviewable row, not an erased page.
        primary_by_compact = {}
        for n in list(nodes) + extra_nodes:
            primary_by_compact.setdefault(compact(n.slug), n)
        harvest_fresh = []
        for n in harvest_nodes:
            match = primary_by_compact.get(compact(n.slug))
            if match is None:
                n.notes.append("union page: harvested from the rendered guide "
                               "but absent from the primary page tree")
                harvest_fresh.append(n)
            else:
                n.mirror_of = match
                n.notes.append("harvested twin of primary page `%s` (slug "
                               "match) - its map row binds to the same target"
                               % match.filename)
        if harvest_fresh:
            queue1 += route(harvest_fresh, artefacts, frequency, slug_index,
                            title_index, target_pages, budget, False,
                            routing_rows)
        extra_nodes.extend(harvest_nodes)

    # ---- the page map and its coverage validation ------------------------
    map_rows = build_map_rows(list(nodes) + extra_nodes, trees, chosen)
    universe = compute_universe(source_root, chosen)
    for page, page_origin in harvest_universe.items():
        # every harvested page keeps its universe entry: routed, twin-bound
        # or SKIPPED, each has a map row or a loud coverage finding
        universe.setdefault(page, page_origin)
    coverage_findings = validate_coverage(map_rows, universe)
    map_info = {
        "rows": map_rows,
        "retired_count": sum(1 for row in map_rows if row["target"] == "RETIRED"),
        "extra_nodes": extra_nodes,
        "findings": coverage_findings,
        "universe": universe,
        "path": args.map,
        "routing": {"path": routing_path, "count": len(routing_rows),
                    "skipped": routing_skipped},
        "preflight": {"data": preflight, "path": preflight_path,
                      "note": preflight_note, "census": census_label},
        "harvest": harvest_info,
    }
    if args.map:
        write_page_map(args.map, map_rows)

    report = build_report(args, source_info, target_info, nodes, roots, queue1,
                          budget, map_info)

    if args.out:
        directory = os.path.dirname(os.path.abspath(args.out))
        if directory and not os.path.isdir(directory):
            os.makedirs(directory)
        with open(args.out, "w", encoding="utf-8") as handle:
            handle.write(report)
        sys.stderr.write(
            "page-structure-advice: %d source pages (from %s) + %d union, "
            "%d target pages, %d artefacts; map %d rows (%d retired) %s-> %s\n"
            % (len(nodes), source_info["origin"], len(extra_nodes),
               len(target_pages), len(artefacts), len(map_rows),
               map_info["retired_count"],
               "-> %s " % args.map if args.map else "(--map not given) ",
               args.out))
    else:
        sys.stdout.write(report)
    for finding in coverage_findings:
        sys.stderr.write("COVERAGE: %s\n" % re.sub(r"[`*]", "", finding))
    return 1 if coverage_findings else 0


if __name__ == "__main__":
    sys.exit(main())
