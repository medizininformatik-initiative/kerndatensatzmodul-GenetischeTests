#!/usr/bin/env python3
"""comparison-table -- render the page map as a side-by-side comparison
table: one row per source page with CLICKABLE links to the rendered source
page and the rendered target page, plus the provenance of every target page
that has NO source counterpart.

WHY THIS EXISTS. The provenance of the migrated guide is recorded and
machine-checked (page-map.tsv, template-pages.tsv, derived-content.tsv, and
the verifier's C3/C5/C6/C7 on top of them) -- but a human who wants to
COMPARE the two guides manually had to construct every URL by hand and knew
only implicitly which pages exist because the template mandates them. This
script closes that presentation gap. It renders, it never decides: the map
stays the contract, this is the contract made walkable.

TWO TABLES:

  1. *Where every source page went* -- one row per page-map row: the source
     page (linked to the rendered Simplifier page when the step-2c harvest
     manifest carries its URL, or constructed from --source-guide-url for
     guide-tree paths, marked "constructed" because Simplifier's real slugs
     are only authoritative in the harvest), the target page (linked into
     the rendered preview via --preview-url; an intro-note target links to
     the ARTEFACT page that renders it), what moved (the routing branch in
     words), and how many migration-written blocks sit on that target.
  2. *The template's own pages* -- every page of
     references/template-pages.tsv (the template puts these in EVERY module,
     so their EXISTENCE needs no source page): per row whether its CONTENT
     stayed template-default or also receives source content (then table 1
     has its rows), so "where does this page come from?" has a visible
     answer for EVERY page of the target.

Usage:

  comparison-table.py [--log-dir migration-log] [--out FILE]
                      [--map FILE] [--harvest-tsv FILE] [--derived FILE]
                      [--template-pages FILE]
                      [--preview-url URL] [--source-guide-url URL]
                      [--source-repo-url URL]

    --log-dir DIR         where the ledgers live (default: migration-log)
    --map FILE            page-map.tsv override
    --harvest-tsv FILE    guide-harvest.tsv override (source-page URLs)
    --derived FILE        derived-content.tsv override
    --template-pages FILE the template's own page list (default: the
                          references/template-pages.tsv sibling of this
                          script)
    --preview-url URL     base URL of the rendered target preview; without
                          it target pages are named but not linked (the
                          table says so)
    --source-guide-url URL
                          the pinned Simplifier guide root; used to
                          CONSTRUCT source links for guide-tree paths not in
                          the harvest -- constructed links are marked
    --source-repo-url URL the source REPOSITORY's file-view base (e.g. a
                          GitHub .../blob/main URL); links source pages that
                          have no rendered home (the pagecontent shape) to
                          their repo files -- marked "repo file, not
                          rendered"
    --out FILE            write the Markdown here (default: stdout)

Exit codes: 0 render succeeded, 2 setup error (no readable page map -- a
comparison without the contract would be an invention).

stdlib only, like the rest of the catalog's scripts.
"""

from __future__ import annotations

import argparse
import os
import re
import sys
from collections import OrderedDict

BRANCH_WORDS = {
    "1": "into an artefact's intro note",
    "2": "a section on a family index page",
    "3": "merged into an agreed page",
    "4": "its own page",
    "5": "RETIRED (not migrated)",
}


def read_tsv(path):
    if not path or not os.path.isfile(path):
        return None
    rows = []
    with open(path, encoding="utf-8") as handle:
        for line in handle:
            line = line.rstrip("\n")
            if line.strip():
                rows.append(line.split("\t"))
    return rows


def md(text):
    return str(text).replace("|", "\\|")


def url_safe(url):
    """A URL inserted into a markdown table cell: the characters that would
    end the link or split the cell are percent-encoded, everything else is
    left exactly as the manifest recorded it."""
    return (str(url).replace("|", "%7C").replace(" ", "%20")
            .replace(")", "%29").replace("(", "%28"))


def harvest_urls(rows):
    """harvested file basename -> source URL, verbatim from the manifest."""
    urls = {}
    for row in rows or []:
        if len(row) < 5 or row[1] != "harvested" or row[0] == "url":
            continue
        name = os.path.basename(row[4].strip())
        if name:
            urls.setdefault(name, row[0].strip())
    return urls


def derived_counts(rows):
    """ledger page name -> number of migration-written blocks on EXACTLY that
    page.  No stem merging: `x` and `x-intro` are two different pages in the
    ledger, and merging them attributed every block to every row sharing the
    stem (measured: 5 real blocks rendered as 15 apparent ones)."""
    counts = {}
    for row in rows or []:
        if row[:1] == ["page"] or len(row) < 3:
            continue
        counts[row[0]] = counts.get(row[0], 0) + 1
    return counts


def ledger_key(target):
    """The derived-content ledger's page name for a map target: the bare stem
    for a pagecontent page, the stem WITH `-intro` for an intro note."""
    match = re.match(r"input/pagecontent/(.+)\.md$", target)
    if match:
        return match.group(1)
    match = re.match(r"input/intro-notes/(.+)\.md$", target)
    if match:
        return match.group(1)
    return ""


def source_link(source, urls, guide_url, repo_url):
    """A markdown link for the source page: harvest URL verbatim when known;
    constructed (and SAID so) from the guide root for guide-tree paths; the
    source REPOSITORY's file view for everything else when --source-repo-url
    is given; the bare name only when no URL can be derived at all."""
    name = md(source)
    url = urls.get(os.path.basename(source))
    if url:
        return "[`%s`](%s)" % (name, url_safe(url))
    if guide_url and source.endswith(".page.md"):
        segments = source[: -len(".page.md")].split("/")
        if segments and segments[-1] == "Index":
            segments = segments[:-1]
        constructed = guide_url.rstrip("/") + "".join(
            "/" + s for s in segments if s)
        return "[`%s`](%s) *(constructed)*" % (name, url_safe(constructed))
    if repo_url:
        constructed = "%s/input/pagecontent/%s" % (repo_url.rstrip("/"),
                                                   source) \
            if "/" not in source else "%s/%s" % (repo_url.rstrip("/"), source)
        return "[`%s`](%s) *(repo file, not rendered)*" % (
            name, url_safe(constructed))
    return "`%s`" % name


def target_link(target, preview):
    """A markdown link into the rendered preview.  An intro-note target
    renders INSIDE its artefact's page, so the link goes there."""
    name = md(target)
    if target == "RETIRED":
        return "—"
    if not preview:
        return "`%s`" % name
    base = preview.rstrip("/")
    match = re.match(r"input/pagecontent/(.+)\.md$", target)
    if match:
        return "[`%s`](%s/%s.html)" % (name, url_safe(base), match.group(1))
    match = re.match(r"input/intro-notes/(.+)-intro\.md$", target)
    if match:
        return "[`%s`](%s/%s.html) *(renders inside the artefact page)*" % (
            name, url_safe(base), match.group(1))
    return "`%s`" % name


def page_stem(target):
    match = re.match(r"input/(?:pagecontent|intro-notes)/(.+?)(?:-intro)?\.md$",
                     target)
    return match.group(1) if match else ""


def main(argv=None):
    parser = argparse.ArgumentParser(
        description="Render the page map as a walkable source<->target "
                    "comparison table. Renders only; never decides.")
    parser.add_argument("--log-dir", default="migration-log")
    parser.add_argument("--map", dest="map")
    parser.add_argument("--harvest-tsv", dest="harvest_tsv")
    parser.add_argument("--derived")
    parser.add_argument("--template-pages", dest="template_pages")
    parser.add_argument("--preview-url", dest="preview_url")
    parser.add_argument("--source-guide-url", dest="source_guide_url")
    parser.add_argument("--source-repo-url", dest="source_repo_url")
    parser.add_argument("--out")
    args = parser.parse_args(argv)

    map_path = args.map or os.path.join(args.log_dir, "page-map.tsv")
    map_rows = read_tsv(map_path)
    if map_rows is None:
        sys.stderr.write("comparison-table: no page map at %s - the map is "
                         "the contract, and a comparison without it would be "
                         "an invention. Generate it first "
                         "(page-structure-advice.py --map).  exit=2\n"
                         % map_path)
        return 2

    harvest_path = args.harvest_tsv \
        or os.path.join(args.log_dir, "guide-harvest.tsv")
    urls = harvest_urls(read_tsv(harvest_path))
    derived_path = args.derived \
        or os.path.join(args.log_dir, "derived-content.tsv")
    derived = derived_counts(read_tsv(derived_path))
    template_path = args.template_pages or os.path.join(
        os.path.dirname(os.path.abspath(__file__)), "..", "references",
        "template-pages.tsv")
    template_rows = read_tsv(template_path)

    out = []
    out.append("### Comparison table (GENERATED by comparison-table.py — do "
               "not retype; regenerate instead)")
    out.append("")
    out.append("This table belongs inside `migration-log/migration-report.md` "
               "(section *Content map*), whose glossary explains every term "
               "used here; `references/codes.md` of the skill is the "
               "backstop. \"Agreed page\" = a page of the template's fixed "
               "menu; \"migration-written blocks\" = passages the migration "
               "WROTE rather than carried, marked in the rendered guide and "
               "listed per page in `derived-content.tsv`. Found a "
               "discrepancy while comparing? Record it as a report item "
               "(REV-n) — never fix a page ad hoc.")
    out.append("")
    notes = []
    if not args.preview_url:
        notes.append("no `--preview-url` was given, so target pages are "
                     "named but NOT linked")
    if not urls and not args.source_guide_url and not args.source_repo_url:
        notes.append("no harvest manifest, no `--source-guide-url` and no "
                     "`--source-repo-url`, so source pages are named but "
                     "NOT linked")
    if notes:
        out.append("> ⚠ " + "; ".join(notes) + " — regenerate with the URLs "
                   "to make every row clickable.")
        out.append("")

    out.append("**Where every source page went** — one row per page-map row; "
               "open both links side by side to compare manually. "
               "*(constructed)* marks a source link derived from the guide "
               "root rather than read from the harvest manifest.")
    out.append("")
    out.append("| Rendered source page | Rendered target page | What moved | "
               "Migration-written blocks on the target |")
    out.append("|---|---|---|---|")
    rows_rendered, source_links = 0, 0
    for row in map_rows:
        if not row or row[0].startswith("#") or len(row) < 3:
            continue
        source, target = row[0], row[1]
        branch = row[3] if len(row) > 3 else ""
        reason = row[2]
        moved = BRANCH_WORDS.get(branch, reason or "-")
        if reason.startswith("harvested twin"):
            moved = "same page, two sources (twin)"
        blocks = derived.get(ledger_key(target), 0)
        rendered_source = source_link(source, urls, args.source_guide_url,
                                      args.source_repo_url)
        if rendered_source.startswith("["):
            source_links += 1
        out.append("| %s | %s | %s | %s |" % (
            rendered_source,
            target_link(target, args.preview_url),
            md(moved),
            str(blocks) if blocks else "—"))
        rows_rendered += 1
    out.append("")
    if rows_rendered and not source_links:
        out.append("> ⚠ **no source-page cell above is a link** — the "
                   "side-by-side purpose of this table is defeated. These "
                   "source pages have no rendered home this run knows; "
                   "regenerate with `--source-repo-url` (the source "
                   "repository's file view) or `--source-guide-url` to make "
                   "the source half clickable.")
        out.append("")

    out.append("**The template's own pages** — the template puts these "
               "pages in EVERY module, so their EXISTENCE needs no source "
               "page; per row whether their CONTENT stayed template-default "
               "or also receives source content. Class: `scaffold` = the "
               "template ships it and every module keeps it · `optional` = "
               "kept only while artefacts of its type exist (check M9) · "
               "`demo` = must be gone on a release branch (check M8).")
    out.append("")
    if template_rows is None:
        out.append("> ⚠ **template page list not found** (`%s`) — the "
                   "template-mandated pages cannot be enumerated; that is "
                   "itself a finding." % template_path)
        out.append("")
    else:
        mapped_stems = set()
        for row in map_rows:
            if row and not row[0].startswith("#") and len(row) > 1:
                stem = page_stem(row[1])
                if stem:
                    mapped_stems.add(stem)
        out.append("| Template page | Class | Receives source content? | "
                   "Migration-written blocks |")
        out.append("|---|---|---|---|")
        for row in template_rows:
            if not row or row[0].startswith("#") or len(row) < 2:
                continue
            name, cls = row[0], row[1]
            receives = ("yes — see its rows above"
                        if name in mapped_stems else "no — template content")
            blocks = derived.get(name, 0)
            link = target_link("input/pagecontent/%s.md" % name,
                               args.preview_url)
            out.append("| %s | %s | %s | %s |" % (
                link, md(cls), receives, str(blocks) if blocks else "—"))
        out.append("")

    text = "\n".join(out)
    if args.out:
        directory = os.path.dirname(os.path.abspath(args.out))
        if directory and not os.path.isdir(directory):
            os.makedirs(directory)
        with open(args.out, "w", encoding="utf-8") as handle:
            handle.write(text)
        sys.stderr.write("comparison-table: %d map row(s) rendered, %d "
                         "source link(s) from the harvest -> %s\n"
                         % (rows_rendered, len(urls), args.out))
    else:
        sys.stdout.write(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
