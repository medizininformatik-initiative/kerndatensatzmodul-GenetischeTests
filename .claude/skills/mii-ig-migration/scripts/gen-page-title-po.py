#!/usr/bin/env python3
"""gen-page-title-po -- emit an ImplementationGuide-<id>.po holding the page-title
translation units the IG Publisher needs to localize breadcrumbs, the table of
contents and page <title> tags.

The publisher DOES localize `pages:`-tree titles, and this file is how you reach
them. OBSERVED on our own build (IG Publisher 2.2.11, migrated MII KDS Dokument
guide, 23 page.title units, no breadcrumb override): the /de/ breadcrumbs render
German down to the root label "Inhaltsverzeichnis", the table-of-contents page
body renders German, and the browser <title> tag renders German. The reading of
the publisher source that explains it -- an `ImplementationGuide-<id>.po` found
under a `translation-sources` folder is imported into the IG resource at load
time (PublisherIGLoader -> importFromTranslations), a different code path from
the *resource* supplements whose type list (StructureDefinition, CodeSystem,
Questionnaire) therefore does not constrain it -- is source-derived, not
build-proven; the observable outcome above is what was verified. NOT verified on
2.2.11: the left-hand navigation menu, and the IG's own title/description/
publisher/name. Without such a file the default-language title is copied into
every language.

The authoritative set of titles is the SUSHI-generated ImplementationGuide
resource -- not the menus. It carries the whole `pages:` tree including the root
toc.html page, and it includes pages that are not menu entries (Table of
Contents, Downloads, Translation Information, Metadata Overview in the KDS
template). The menus are only a translation SEED: a title the seed does not
cover is emitted with an empty msgstr, which gettext treats as untranslated and
the publisher falls back to the default language for that one entry. Every such
title is named in the run summary and needs a human translation before the
German rendering is complete.

REGENERATION IS NON-DESTRUCTIVE. The same catalogue is also the carrier for
units this generator does not own (the IG's own title/description/publisher, the
gettext header entry, per-artifact units). When OUT_PO already exists, those
units are parsed and written back verbatim, and an existing non-empty msgstr on
a page-title unit WINS over the seed -- so a hand translation survives a
regeneration and the seed only fills gaps. To change a translation, edit the
.po (or empty its msgstr) rather than the seed. Two things are deliberately not
preserved: a page-title unit whose title has left the `pages:` tree (it is
reported as dropped), and free-standing comment blocks not attached to a unit --
the generator owns the file header. Everything preserved or dropped is counted
in the run summary.

Usage:

  gen-page-title-po.py IG_JSON SEED_FILE LANG OUT_PO

    IG_JSON    fsh-generated/resources/ImplementationGuide-<id>.json -- run SUSHI
               (`npx --yes fsh-sushi@3.20.0 .`) first
    SEED_FILE  translation seed. FORMAT: one `English Title => Deutscher Titel`
               per line -- the separator is a space, two greater-than signs and a
               space, and the FIRST occurrence splits the line. Blank lines and
               lines starting with `#` are skipped; a line without the separator
               is reported as malformed and ignored. Conventionally
               migration-log/menu-titles-de.txt; the recipe for producing it from
               the two menu.xml files is in the skill's spec §5.5 (pair the link
               labels POSITIONALLY -- a dropdown parent and its first child share
               an href, so pairing on href yields a cross-product).
               `-` means "no seed" (all units untranslated, except those carried
               over from an existing OUT_PO). A path that cannot be read is a
               setup error, NOT a silent "no seed". A module generated from
               template v0.5.0 -- the one release that shipped the retired
               breadcrumb override -- can seed from its
               input/includes/breadcrumb-titles-de.txt, which is already in this
               format.
    LANG       target language code, e.g. de -- must also appear in an
               `i18n-lang` AND a `translation-sources` parameter, otherwise the
               publisher silently ignores the file
    OUT_PO     output path, conventionally
               input/translations/<LANG>/ImplementationGuide-<id>.po
    -h, --help print this text on stdout and exit 0.

Exit codes: 0 = written, every title translated; 1 = written, but titles are
left untranslated (they are listed -- treat as a review queue, and as a CI gate
when the module claims a complete translation); 2 = setup error, nothing
written: bad arguments, unreadable IG JSON, unreadable SEED_FILE, or NO PAGES in
the IG resource -- an empty catalogue is never a pass.

OUTPUT FORMAT. Every line follows the migration run-log convention (spec §10):

  <UTC-ISO-8601>  <LEVEL>  <STEP>  <ACTION>  <detail>

with LEVEL one of `INFO `/`WARN `/`ERROR`, STEP the spec section this script
implements (5.5) and ACTION its slug. Two spaces separate the fields;
continuation lines are indented four spaces and belong to the line above.
INFO and WARN go to stdout, ERROR to stderr, both flushed per line so the merged
stream is chronological. Capture them through the run-log helper:

  bash "$SKILL_DIR/scripts/migration-log.sh" run 5.5 gen-page-title-po \\
    --emits-runlog -- python3 "$SKILL_DIR/scripts/gen-page-title-po.py" …

NOT `… 2>&1 | tee -a migration-log/run.log`. A pipeline's status is `tee`'s, so
that form reports 0 for the exit-1 "written, but titles are untranslated" case
this script uses as a CI gate. The helper preserves and returns it.

stdlib only, to match the rest of the catalog's scripts.
"""
import json
import os
import re
import sys
import time

# --- run-log convention (spec §10) ------------------------------------------
STEP = "5.5"         # SKILL.md step 6
ACTION = "gen-page-title-po"
_LEVEL = {"INFO": "INFO ", "WARN": "WARN ", "ERROR": "ERROR"}

# `migration-log.sh run` sets MIGRATION_LOG_WRAPPED=1 in the wrapped command's
# environment. It has already logged a `start` line carrying the command ACTUALLY
# executed, and will log the matching `done`; emitting a second pair here gave ONE
# execution two `start` lines, two `done` lines and two different `cmd=` values.
# Wrapped, this script drops its own `cmd=` and calls its two lines what they are:
# the parameters it resolved, and the result it measured. Run directly -- still
# supported -- nothing changes.
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

PAGE_TITLE_REF = "#: ImplementationGuide.definition.page.title"

# Banner introducing the units this generator does not own. Emitted by us, so it
# is recognised again on the next run instead of being reported as lost.
PRESERVED_BANNER = [
    "# --- preserved: units NOT owned by gen-page-title-po -----------------------",
    "# They are not generated from the pages: tree; they were found in this file",
    "# and are written back verbatim on every regeneration.",
]

ESCAPES = [
    ("\\", "\\\\"),
    ('"', '\\"'),
    ("\n", "\\n"),
    ("\r", "\\r"),
    ("\t", "\\t"),
]


def walk(page):
    """Yield (page id, title) for a page and every descendant, depth first."""
    title = page.get("title")
    if title:
        name = page.get("nameUrl") or page.get("name") or "(unnamed page)"
        if isinstance(name, dict):
            name = name.get("reference") or "(unnamed page)"
        yield name, title
    for child in page.get("page") or []:
        yield from walk(child)


def read_seed(path):
    """Parse `English => Deutsch` lines. Blank lines and `#` comments are skipped.

    Returns (mapping, stats). Raises OSError when the file cannot be read -- a
    mistyped seed path must never masquerade as "no seed".
    """
    mapping = {}
    stats = {"lines": 0, "entries": 0, "malformed": []}
    with open(path, encoding="utf-8") as fh:
        for no, line in enumerate(fh, 1):
            stats["lines"] += 1
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            if " => " not in line:
                stats["malformed"].append((no, line))
                continue
            src, dst = line.split(" => ", 1)
            mapping[src.strip()] = dst.strip()
        stats["entries"] = len(mapping)
    return mapping, stats


def default_lang(ig):
    for param in (ig.get("definition") or {}).get("parameter") or []:
        code = param.get("code")
        code = code.get("code") if isinstance(code, dict) else code
        if code == "i18n-default-lang":
            return param.get("value") or "en"
    return "en"


def po_escape(text):
    for raw, esc in ESCAPES:
        text = text.replace(raw, esc)
    return text


def po_unescape(text):
    return re.sub(
        r'\\(.)',
        lambda m: {"n": "\n", "r": "\r", "t": "\t", '"': '"', "\\": "\\"}.get(
            m.group(1), m.group(1)
        ),
        text,
    )


def _unquote(fragment):
    fragment = fragment.strip()
    if fragment.startswith('"') and fragment.endswith('"') and len(fragment) >= 2:
        return po_unescape(fragment[1:-1])
    return po_unescape(fragment.strip('"'))


def parse_po(path):
    """Minimal .po reader: return (entries, dropped_comment_blocks).

    An entry is {'raw': [lines as written], 'ref': str|None, 'msgid': str,
    'msgstr': str}. Only the comment block directly above a `msgid` (no blank
    line in between) belongs to it; anything else is a free-standing block and is
    reported, not preserved.
    """
    entries, dropped = [], []
    with open(path, encoding="utf-8") as fh:
        lines = fh.read().split("\n")

    pending, pending_at, cur, mode = [], 0, None, None

    def close():
        nonlocal cur, mode
        if cur is not None:
            cur["msgid"] = "".join(cur["id_parts"])
            cur["msgstr"] = "".join(cur["str_parts"])
            entries.append(cur)
        cur, mode = None, None

    def drop_pending():
        nonlocal pending
        if pending:
            dropped.append((pending_at, list(pending)))
        pending = []

    for no, line in enumerate(lines, 1):
        stripped = line.strip()
        if not stripped:
            close()
            drop_pending()
            continue
        if stripped.startswith("#"):
            close()
            if not pending:
                pending_at = no
            pending.append(line)
            continue
        if stripped.startswith("msgid"):
            close()
            ref = None
            for comment in pending:
                if comment.strip().startswith("#:"):
                    ref = comment.strip()
            cur = {
                "raw": list(pending) + [line],
                "ref": ref,
                "id_parts": [_unquote(stripped[len("msgid"):])],
                "str_parts": [],
            }
            pending = []
            mode = "id"
        elif stripped.startswith("msgstr"):
            if cur is None:
                drop_pending()
                continue
            cur["raw"].append(line)
            cur["str_parts"].append(_unquote(stripped[len("msgstr"):]))
            mode = "str"
        elif stripped.startswith('"') and cur is not None:
            cur["raw"].append(line)
            cur["id_parts" if mode == "id" else "str_parts"].append(_unquote(stripped))
        else:
            # Something this reader does not model (msgctxt, plural forms, ...).
            # Keep it attached to the current unit so it survives verbatim.
            if cur is not None:
                cur["raw"].append(line)
            else:
                drop_pending()
    close()
    drop_pending()
    return entries, dropped


def main(argv):
    if argv and argv[0] in ("-h", "--help"):
        # Help is a successful request for help, not a setup error.
        sys.stdout.write(__doc__)
        return 0
    if len(argv) != 4:
        log("ERROR", "setup: expected 4 arguments, got %d  exit=2" % len(argv),
            ["usage: gen-page-title-po.py IG_JSON SEED_FILE LANG OUT_PO",
             "run with --help for the full usage text"])
        return 2
    ig_path, seed_path, lang, out_path = argv

    log("INFO", "%s%s  ig=%s seed=%s lang=%s out=%s"
        % (OPEN_WORD,
           "" if WRAPPED else "  cmd=`gen-page-title-po.py %s`" % " ".join(argv),
           ig_path, seed_path, lang, out_path))

    try:
        with open(ig_path, encoding="utf-8") as fh:
            ig = json.load(fh)
    except (OSError, ValueError) as exc:
        log("ERROR", "setup: cannot read the ImplementationGuide resource %r  exit=2"
            % ig_path,
            ["%s" % exc,
             "Expected fsh-generated/resources/ImplementationGuide-<id>.json --",
             "run `npx --yes fsh-sushi@3.20.0 .` before generating the catalogue."])
        return 2

    root = (ig.get("definition") or {}).get("page") or {}
    pages = list(walk(root))
    if not pages:
        log("ERROR", "setup: no pages found  ig=%s pages=0  exit=2" % ig_path,
            ["An empty catalogue is never a pass. Check that sushi-config.yaml",
             "declares a `pages:` tree and that the SUSHI run regenerated it."])
        return 2

    # -- seed ---------------------------------------------------------------
    if seed_path == "-":
        seed, seed_stats, seed_label = {}, None, "(none -- `-` given)"
    else:
        try:
            seed, seed_stats = read_seed(seed_path)
        except OSError as exc:
            log("ERROR", "setup: cannot read the seed file %r  exit=2" % seed_path,
                ["%s" % exc,
                 "A seed path that does not resolve is a SETUP ERROR, not an empty",
                 "seed: continuing would emit a catalogue in which every title is",
                 "silently untranslated. Fix the path, or pass `-` to say",
                 "deliberately that there is no seed. Nothing was written."])
            return 2
        seed_label = seed_path

    # -- existing catalogue (never clobbered) -------------------------------
    carried, foreign, header_entry, dropped_blocks = {}, [], None, []
    if os.path.isfile(out_path):
        try:
            entries, dropped_blocks = parse_po(out_path)
        except OSError as exc:
            log("ERROR", "setup: %s exists but cannot be read  exit=2" % out_path,
                ["%s" % exc,
                 "Refusing to overwrite a catalogue whose content is unknown."])
            return 2
        for entry in entries:
            if entry["ref"] == PAGE_TITLE_REF and entry["msgid"]:
                if entry["msgstr"]:
                    carried[entry["msgid"]] = entry["msgstr"]
            elif entry["msgid"] == "" and header_entry is None:
                header_entry = entry
            else:
                foreign.append(entry)

    # -- units --------------------------------------------------------------
    order, occurrences = [], {}
    for name, title in pages:
        if title not in occurrences:
            occurrences[title] = []
            order.append(title)
        occurrences[title].append(name)

    units, from_existing = [], 0
    for title in order:
        if title in carried:
            units.append((title, carried[title]))
            from_existing += 1
        else:
            units.append((title, seed.get(title, "")))

    obsolete = sorted(set(carried) - set(order))
    collisions = [(t, occurrences[t]) for t in order if len(occurrences[t]) > 1]
    matched_seed = sorted(t for t in order if t in seed)
    applied_seed = sorted(t for t in matched_seed if t not in carried)
    unused_seed = sorted(set(seed) - set(order))

    src_lang = default_lang(ig)
    lines = [
        "# %s -> %s" % (src_lang, lang),
        "#",
        "# GENERATED by the mii-ig-migration skill (scripts/gen-page-title-po.py) from the",
        "# pages: tree of %s." % os.path.basename(ig_path),
        "# Page titles reach breadcrumbs, the table of contents and the page <title> only",
        "# through these units -- the publisher copies the default-language title into",
        "# every language when no unit exists. (The left-hand navigation menu is NOT known",
        "# to be driven by them; it has its own per-language file",
        "# input/translations/<lang>/includes/menu.xml.) An empty msgstr means",
        "# UNTRANSLATED: that entry falls back to %s." % src_lang,
        "#",
        "# Regenerating is non-destructive: units this generator does not own (the IG's own",
        "# title/description/publisher, per-artifact units, a gettext header entry) are kept",
        "# verbatim, and a non-empty msgstr below survives and wins over the seed. Edit the",
        "# msgstr here to change a translation. Regenerate after changing the pages: tree.",
        "#",
        "# Requires %r in BOTH an i18n-lang and a translation-sources parameter of" % lang,
        "# sushi-config.yaml -- a language missing from translation-sources has its .po",
        "# files silently ignored.",
        "",
    ]
    if header_entry is not None:
        lines += header_entry["raw"] + [""]
    for src, dst in units:
        lines += [
            "# A short title used to represent this page in navigational structures such",
            "# as table of contents, bread crumbs, etc.",
            PAGE_TITLE_REF,
            'msgid "%s"' % po_escape(src),
            'msgstr "%s"' % po_escape(dst),
            "",
        ]
    if foreign:
        lines += PRESERVED_BANNER + [""]
        for entry in foreign:
            lines += entry["raw"] + [""]

    out_dir = os.path.dirname(os.path.abspath(out_path))
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines))

    # -- summary ------------------------------------------------------------
    untranslated = [src for src, dst in units if not dst]
    log("INFO", "seed  path=%s%s"
        % (seed_label,
           "" if seed_stats is None else
           "  lines=%d entries=%d matched=%d applied=%d unused=%d"
           % (seed_stats["lines"], seed_stats["entries"], len(matched_seed),
              len(applied_seed), len(unused_seed))))
    if seed_stats is not None:
        for no, line in seed_stats["malformed"]:
            log("WARN", "seed line %d ignored (no ' => ' separator)  text=%s" % (no, line))
        for title in unused_seed:
            log("WARN", "seed entry unused (no such page title)  title=%r" % title)
    log("INFO", "written  out=%s pages=%d units=%d translated=%d untranslated=%d "
                "carried_over=%d preserved_foreign=%d header_preserved=%s"
        % (out_path, len(pages), len(units), len(units) - len(untranslated),
           len(untranslated), from_existing, len(foreign),
           header_entry is not None))
    for title in obsolete:
        log("WARN", "unit dropped (no longer in the pages: tree)  title=%r" % title)
    for at, block in dropped_blocks:
        if at == 1 or block == PRESERVED_BANNER:
            continue  # this generator's own header/banner, rewritten on every run
        log("WARN", "free-standing comment block NOT preserved (the generator owns "
                    "the header)  at_line=%d  first=%s" % (at, block[0].strip()))
    for title, names in collisions:
        log("WARN", "title collision  title=%r pages=%d (%s)"
            % (title, len(names), ", ".join(names)),
            ["gettext keys by msgid, so pages sharing a title share ONE unit and",
             "cannot be translated differently. Give them distinct titles in",
             "sushi-config.yaml if they need distinct translations."])
    if untranslated:
        # Silent-partial-success guard (spec §10): the file was written and the
        # exit code is not 2, but the catalogue localizes less than the pages:
        # tree implies -- every empty msgstr silently falls back to src_lang.
        log("WARN", "silent-partial-success: %d of %d page-title unit(s) have an "
                    "empty msgstr and fall back to %s"
            % (len(untranslated), len(units), src_lang),
            ["UNTRANSLATED: %s" % src for src in untranslated]
            + ["Translate these msgstr by hand -- they are pages the seed did not",
               "cover (typically pages that are not menu entries), and they belong",
               "in the report's ② review queue."])
        log("INFO", "%s  exit=1  written with %d untranslated unit(s)"
            % (CLOSE_WORD, len(untranslated)))
        return 1
    log("INFO", "%s  exit=0  every page title translated" % CLOSE_WORD)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
