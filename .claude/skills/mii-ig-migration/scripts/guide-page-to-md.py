#!/usr/bin/env python3
"""guide-page-to-md -- read ONE server-rendered Simplifier guide page and either
list the guide pages it links to, or convert its content region to Markdown.

WHY THIS EXISTS. A module authored in Forge and published on Simplifier keeps its
narrative on the Simplifier platform, not in git (spec §5.1b.1). The migration
therefore has to get the narrative back out of the rendering. This script is the
half of that job that has to parse HTML; `guide-harvest.sh` is the driver that
fetches, logs and verifies.

WHAT IS MEASURED, AND WHERE THE URL SPACES DIFFER (2026-08-06, MII KDS Consent):

  * PROJECT page `https://simplifier.net/MedizininformatikInitiative-ModulConsent/`
    is a client-rendered application shell -- HTTP 200, ~56 KB, 52 `<script`
    markers, no identity metadata in the DOM. Nothing to parse. That measurement
    stands, FOR THAT URL.
  * GUIDE pages `https://simplifier.net/guide/<key>/<Root>[/<Page>]?version=<v>`
    are a DIFFERENT URL space and are SERVER-RENDERED. The guide root returns
    24509 bytes carrying the complete page tree; a leaf page returns 20481 bytes
    carrying `<h1 id="page-title">` and the real German narrative. Both parse
    with an HTML parser and no browser.

  Do not carry a finding from one of those URL spaces to the other. That
  over-generalisation is what made a migration ship the template's starter pages
  instead of the module's narrative.

THE CONTENT REGION. The narrative sits in `<div id="preview-content" ...>` and is
isolated by scanning forward from that tag counting `<div`/`</div>` until the
depth returns to zero -- NOT by a regex to the next `</div>`, which stops at the
first nested one. Everything outside that region is chrome: the guide tree panel,
the header, the footer, the version picker. If the region is absent the page is
REPORTED AS UNHARVESTED (exit 1) and never approximated from the whole body --
a page whose chrome was converted along with its content is worse than a page
recorded as missing, because nothing downstream can tell the two apart.

THE CONVERSION IS CHECKED, NOT TRUSTED. A hand-rolled HTML-to-Markdown converter
drops content silently. So every text run of >= `--run-length` characters in the
source region is looked for in the produced Markdown; the count that did not
survive is reported as `missing_runs=`, and the driver raises the mandatory
`silent-partial-success:` WARN on it. `src_text_chars` and `md_text_chars` are
reported beside it so the loss is a number, not a feeling.

  The comparison is made on the LETTERS AND DIGITS ALONE, after link targets are
  removed (`[text](url)` -> `text`). Both reductions are there because the first
  version of this check reported losses that had not happened: Markdown moves a
  link's URL in between two words that are adjacent in the rendering, and
  `</a>.` renders as `… .` while Markdown writes `….`, so a whitespace-only
  normalisation called four intact German sentences missing. A check that cries
  wolf is worse than no check, because the run log's WARNs are read.

NOT EVERY GUIDE PAGE IS NARRATIVE. A guide's page tree also contains Simplifier's
RENDERED ARTEFACT VIEWS -- a StructureDefinition's element tree, its JSON, its
constraint table. Measured on Consent: the `FHIRProfile/Consent` page carries
239875 characters of visible text and 14 tables against a narrative page's ~1400.
Those are a RENDERING of a resource the target IG already ships, and the IG
Publisher regenerates them; pasting them into `pagecontent` would duplicate a
generated artefact as hand-maintained prose. They are counted (`artefact_markers=`),
classified (`kind=artefact-view`) and still harvested -- the prose ABOVE the tree
is real narrative -- but the driver logs their conversion losses under a separate
`generated-view-lossy:` token so they cannot drown the `silent-partial-success:`
signal that guards the narrative pages.

SUBCOMMANDS

  links   --html FILE --base-url URL
      Print one absolute guide-page URL per line, in document order, deduped,
      the guide root first. SLUGS ARE DISCOVERED, NEVER CONSTRUCTED: Simplifier
      de-punctuates page titles into slugs ("Anwendungsfälle / Informationsmodell"
      -> `AnwendungsflleInformationsmodell`), so a slug guessed from a title is
      wrong in a way that returns a plausible 404 page rather than an error.
      Page links are told from asset links by SHAPE, measured: a page is
      `/guide/<key>/<Root>...`, an asset is `/guide/<key>/<version>/files/...`.
      The `?version=` of `--base-url` is carried onto every emitted URL, so a
      harvest is pinned to one guide version instead of drifting to `current`.

  extract --html FILE --url URL --out FILE.md [--region-id ID] [--run-length N]
          [--assets FILE.tsv]
      Convert the content region to Markdown, write it with a provenance header,
      and print one line of `key=value` measurements for the driver to log:
      `region=`, `kind=`, `src_text_chars=`, `md_text_chars=`, `missing_runs=`,
      `internal_links=`, `images=`, `artefact_markers=`, `title=` (last, because
      a title contains spaces).

      Internal `/guide/...` links and image sources are made ABSOLUTE rather than
      rewritten to IG page names: retargeting them is step 5's mapping decision
      (spec §9), and a link silently pointed at a page that does not exist yet is
      a broken build. Their counts are reported so the mapping has a work list,
      and image URLs go to `--assets` because the assets still have to be
      transferred.

  NO LIQUID IS EMITTED. The provenance header is a plain HTML comment: Jekyll
  evaluates `{% ... %}` and `{{ ... }}` inside comments too (guardrail 8), so
  neither ever appears in what this script writes. A source page that CONTAINS
  such a literal is left as it is and counted -- it is a step-5 finding, and
  `fql-scan.sh` is what reports it.

Exit codes: 0 = done; 1 = the content region was absent (the page is unharvested,
and the driver records it as skipped with that reason); 2 = setup error (bad
arguments, unreadable input, unwritable output).

Python 3 standard library only, matching the rest of the catalog's scripts.
"""

import argparse
import html
import os
import re
import sys
from datetime import datetime, timezone
from html.parser import HTMLParser
from urllib.parse import urljoin, urlsplit, urlunsplit, parse_qs

BLOCK = {
    "p", "div", "h1", "h2", "h3", "h4", "h5", "h6", "ul", "ol", "li", "pre",
    "blockquote", "table", "thead", "tbody", "tr", "th", "td", "hr", "br",
    "section", "article", "figure", "figcaption",
}
VOID = {"br", "hr", "img", "meta", "link", "input", "source", "col"}
DROP = {"script", "style", "noscript", "svg", "iframe", "button", "form"}


# --------------------------------------------------------------------------- #
# A minimal DOM. `html.parser` is a stream parser; rendering Markdown needs the
# nesting (a list inside a list, a link inside a heading), so the events are
# collected into nodes first. Text nodes are plain strings.
# --------------------------------------------------------------------------- #
class Node:
    __slots__ = ("tag", "attrs", "kids")

    def __init__(self, tag, attrs=None):
        self.tag = tag
        self.attrs = dict(attrs or {})
        self.kids = []


class DomBuilder(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.root = Node("#root")
        self.stack = [self.root]
        self.dropping = 0

    def handle_starttag(self, tag, attrs):
        if tag in DROP:
            self.dropping += 1
            return
        if self.dropping:
            return
        node = Node(tag, attrs)
        self.stack[-1].kids.append(node)
        if tag not in VOID:
            self.stack.append(node)

    def handle_startendtag(self, tag, attrs):
        if self.dropping or tag in DROP:
            return
        self.stack[-1].kids.append(Node(tag, attrs))

    def handle_endtag(self, tag):
        if tag in DROP:
            self.dropping = max(0, self.dropping - 1)
            return
        if self.dropping or tag in VOID:
            return
        for i in range(len(self.stack) - 1, 0, -1):
            if self.stack[i].tag == tag:
                del self.stack[i:]
                return
        # An unmatched close tag is ignored rather than unwinding the stack:
        # real pages carry them, and unwinding loses the rest of the document.

    def handle_data(self, data):
        if not self.dropping:
            self.stack[-1].kids.append(data)


# --------------------------------------------------------------------------- #
# Region isolation
# --------------------------------------------------------------------------- #
def content_region(page, region_id):
    """Return the inner HTML of <div id="REGION_ID" ...> ... </div>, or None.

    Depth-scanned over `<div`/`</div>` because the region nests divs; a regex to
    the next `</div>` truncates at the first inner one, which reads as a page
    with a short narrative instead of as a parse failure.
    """
    m = re.search(r'<div\b[^>]*\bid="%s"[^>]*>' % re.escape(region_id), page)
    if not m:
        return None
    start = m.end()
    depth = 1
    pos = start
    tag = re.compile(r"</?div\b", re.I)
    while depth > 0:
        t = tag.search(page, pos)
        if not t:
            return page[start:]  # unbalanced document: keep what there is
        depth += 1 if t.group(0)[1] != "/" else -1
        pos = t.end()
    return page[start:pos - len("</div")]


def visible_text(fragment):
    """The region's text as a reader sees it -- INCLUDING image alt text.

    Alt text is kept because the Markdown side keeps it: dropping it here made
    the retention check report a loss every time a paragraph sat next to an
    image, since the two sides then disagreed about a string neither had lost.
    """
    txt = re.sub(r"(?is)<(script|style)\b.*?</\1>", " ", fragment)
    txt = re.sub(r'(?is)<img\b[^>]*\balt="([^"]*)"[^>]*>', r" \1 ", txt)
    txt = re.sub(r"<[^>]+>", " ", txt)
    return re.sub(r"\s+", " ", html.unescape(txt)).strip()


# --------------------------------------------------------------------------- #
# Link discovery
# --------------------------------------------------------------------------- #
def guide_prefix(base_url):
    """('/guide/<key>/<Root>', version) from the guide URL the operator gave."""
    parts = urlsplit(base_url)
    seg = [s for s in parts.path.split("/") if s]
    if len(seg) < 3 or seg[0] != "guide":
        return None, None
    version = (parse_qs(parts.query).get("version") or [""])[0]
    return "/%s/%s/%s" % (seg[0], seg[1], seg[2]), version


def discover(page, base_url):
    prefix, version = guide_prefix(base_url)
    if prefix is None:
        return []
    out = []
    for href in re.findall(r'href="(/guide/[^"]+)"', page):
        path = href.split("?")[0].split("#")[0]
        if "/files/static/" in path or re.search(r"\.(css|js|ico|png|jpe?g|svg|gif|woff2?)$", path, re.I):
            continue
        if not (path == prefix or path.startswith(prefix + "/")):
            continue  # another guide, or an asset path carrying the version
        url = urlunsplit(("https", urlsplit(base_url).netloc, path,
                          "version=%s" % version if version else "", ""))
        if url not in out:
            out.append(url)
    root = urlunsplit(("https", urlsplit(base_url).netloc, prefix,
                       "version=%s" % version if version else "", ""))
    if root in out:
        out.remove(root)
    out.insert(0, root)
    return out


# --------------------------------------------------------------------------- #
# Markdown rendering
# --------------------------------------------------------------------------- #
class Renderer:
    def __init__(self, url):
        self.url = url
        self.internal_links = 0
        self.images = []
        self.title = ""
        self.first_heading = ""

    def esc(self, text):
        text = re.sub(r"\s+", " ", text)
        return re.sub(r"([\\`*_\[\]])", r"\\\1", text)

    def abs_url(self, href):
        if href.startswith("/guide/"):
            self.internal_links += 1
        return urljoin(self.url, href)

    def inline(self, node):
        if isinstance(node, str):
            return self.esc(node)
        t = node.tag
        inner = "".join(self.inline(k) for k in node.kids)
        if t == "a":
            href = node.attrs.get("href", "").strip()
            if not href:
                return inner
            return "[%s](%s)" % (inner.strip() or href, self.abs_url(href))
        if t in ("strong", "b"):
            return "**%s**" % inner.strip() if inner.strip() else ""
        if t in ("em", "i"):
            return "*%s*" % inner.strip() if inner.strip() else ""
        if t == "code":
            return "`%s`" % inner.strip()
        if t == "img":
            src = node.attrs.get("src", "").strip()
            if src:
                self.images.append(urljoin(self.url, src))
            return "![%s](%s)" % (self.esc(node.attrs.get("alt", "")), urljoin(self.url, src))
        if t == "br":
            return "  \n"
        return inner

    def cells(self, row):
        return [" ".join(self.inline(c) for c in cell.kids).strip()
                for cell in row.kids
                if not isinstance(cell, str) and cell.tag in ("td", "th")]

    def table(self, node):
        rows = []
        for tr in self.walk_tag(node, "tr"):
            cells = self.cells(tr)
            if cells:
                rows.append(cells)
        if not rows:
            return []
        width = max(len(r) for r in rows)
        rows = [r + [""] * (width - len(r)) for r in rows]
        out = ["| " + " | ".join(rows[0]) + " |",
               "| " + " | ".join(["---"] * width) + " |"]
        for r in rows[1:]:
            out.append("| " + " | ".join(r) + " |")
        return out

    def walk_tag(self, node, tag):
        for k in node.kids:
            if isinstance(k, str):
                continue
            if k.tag == tag:
                yield k
            else:
                yield from self.walk_tag(k, tag)

    def block(self, node, out, depth=0, marker=None):
        if isinstance(node, str):
            if node.strip():
                out.append(self.esc(node).strip())
            return
        t = node.tag
        if t in ("h1", "h2", "h3", "h4", "h5", "h6"):
            text = "".join(self.inline(k) for k in node.kids).strip()
            # The page title is marked by its ID, not by its level: measured, the
            # Consent guide writes `<h1 id="page-title">` on one page and
            # `<h2 id="page-title">` on the next, and its guide ROOT carries a
            # plain `<h2>` with no id at all. So: the `page-title` element wins,
            # otherwise the first heading of any level, and a page with no
            # heading reports `(none)` rather than borrowing one.
            plain = re.sub(r"\\(.)", r"\1", text)
            if node.attrs.get("id") == "page-title":
                self.title = plain
            elif not self.first_heading:
                self.first_heading = plain
            out.append("%s %s" % ("#" * int(t[1]), text))
            return
        if t == "p":
            text = "".join(self.inline(k) for k in node.kids).strip()
            if text:
                out.append(text)
            return
        if t in ("ul", "ol"):
            n = 0
            for li in node.kids:
                if isinstance(li, str) or li.tag != "li":
                    continue
                n += 1
                bullet = "- " if t == "ul" else "%d. " % n
                sub = []
                for k in li.kids:
                    self.block(k, sub, depth + 1)
                text = " ".join(s for s in sub if s).strip()
                if text:
                    out.append("  " * depth + bullet + text)
            return
        if t == "pre":
            out.append("```\n%s\n```" % visible_text_node(node).strip())
            return
        if t == "blockquote":
            sub = []
            for k in node.kids:
                self.block(k, sub, depth)
            out.extend("> " + s for s in sub if s)
            return
        if t == "table":
            out.extend(self.table(node))
            return
        if t == "hr":
            out.append("---")
            return
        if t in ("br",):
            return
        if t in BLOCK or t == "#root":
            for k in node.kids:
                self.block(k, out, depth)
            return
        text = self.inline(node).strip()
        if text:
            out.append(text)


def visible_text_node(node):
    if isinstance(node, str):
        return node
    return "".join(visible_text_node(k) for k in node.kids)


def to_markdown(fragment, url):
    dom = DomBuilder()
    dom.feed(fragment)
    dom.close()
    r = Renderer(url)
    lines = []
    r.block(dom.root, lines)
    body = "\n\n".join(l for l in lines if l.strip())
    return re.sub(r"\n{3,}", "\n\n", body).strip() + "\n", r


# --------------------------------------------------------------------------- #
# The retention check
# --------------------------------------------------------------------------- #
ALNUM = re.compile(r"[^0-9a-zà-öø-ÿ]+", re.I)


def reduce_text(s):
    """Letters and digits only, lowercased -- see the module docstring."""
    return ALNUM.sub("", s).lower()


def strip_link_targets(md_text):
    """`[text](url)` -> `text`, innermost first, so a linked image collapses too.

    The URL pattern allows ONE level of balanced parentheses, because real MII
    references carry them: the AG Einwilligungsmanagement wiki link ends
    `...title=Einwilligungsmanagement_(Projekt)`, and a `[^()]*` URL pattern left
    half of it behind as text -- which the retention check then read as a
    sentence that had gone missing. The trailing sweep of bare `http(s)://…`
    tokens covers whatever shape the first pass still cannot see.
    """
    prev = None
    out = md_text
    while out != prev:
        prev = out
        out = re.sub(r"!?\[([^\[\]]*)\]\((?:[^()]|\([^()]*\))*\)", r"\1", out)
    return re.sub(r"https?://\S+", " ", out)


def missing_runs(src_text, md_text, run_length):
    """How many long text runs of the source did NOT survive the conversion.

    BOTH sides get the bare-URL sweep. They have to: a guide page whose link
    TEXT is the URL itself (the Consent guide's issue tracker and its release
    diffs) puts that URL in the rendering's visible text as well, so sweeping it
    from the Markdown alone reported five intact sentences as lost. An asymmetric
    normalisation is a bug in the check, not a finding about the page.
    """
    hay = reduce_text(strip_link_targets(md_text))
    missing = 0
    for run in re.split(r"(?<=[.!?:;])\s+", src_text):
        if len(run.strip()) < run_length:
            continue
        needle = reduce_text(re.sub(r"https?://\S+", " ", run))
        if len(needle) < run_length // 2:
            continue
        if needle not in hay:
            missing += 1
    return missing


# The markers Simplifier's rendered artefact views carry in bulk; a narrative
# page carries none of them. Counted, not guessed at from the page's size -- a
# long page can be long prose, and a short one can be a small ValueSet.
# Two families, both measured on the Consent guide: the StructureDefinition
# element tree (`element`, `profile`, `constraints`, `mustsupport`, `invariant`)
# on the three FHIRProfile pages, and the CodeSystem/ValueSet rendering
# (`rendered-resource`) on Terminologien -- which the first version of this list
# missed, and which is just as generated.
#
# Counted INSIDE the content region only. The guide's tree panel carries
# `treenode`/`baseIcon` markers of its own on every page including pure prose;
# they are chrome, they are outside the region, and listing them would have
# classified the whole guide as generated.
#
# The measured distribution over the Consent guide's 18 pages is bimodal with
# nothing in between -- fifteen narrative pages at 0 markers, then 5, 359, 397
# and 2171 -- so the default threshold of 3 is not a tuned number, and the page
# it separates least well (Terminologien, 5) is a CodeSystem rendering and does
# belong on the generated side.
ARTEFACT_MARKERS = re.compile(
    r'class="(?:element|profile|constraints|mustsupport|invariant|hierarchy'
    r'|rendered-resource)\b', re.I)


def classify(region, markers, threshold):
    return ("artefact-view", markers) if markers >= threshold else ("narrative", markers)


# --------------------------------------------------------------------------- #
def cmd_links(args):
    page = read(args.html)
    urls = discover(page, args.base_url)
    if not urls:
        sys.stderr.write("guide-page-to-md: no guide page links found; is --base-url a "
                         "/guide/<key>/<Root> URL?\n")
    for u in urls:
        print(u)
    return 0


def cmd_extract(args):
    page = read(args.html)
    region = content_region(page, args.region_id)
    if region is None:
        print("region=absent kind=none src_text_chars=0 md_text_chars=0 missing_runs=0 "
              "internal_links=0 images=0 artefact_markers=0 title=")
        return 1
    src_text = visible_text(region)
    kind, markers = classify(region, len(ARTEFACT_MARKERS.findall(region)),
                             args.artefact_threshold)
    md, r = to_markdown(region, args.url)
    stamp = datetime.now(timezone.utc).strftime("%Y-%m-%d")
    header = (
        "<!-- Harvested from %s on %s by scripts/guide-harvest.sh (spec 5.1d). -->\n"
        "<!-- Source of record: the Simplifier-rendered guide. Links and images are "
        "still absolute to simplifier.net and the page is not yet mapped onto the "
        "template page set (spec 9). TODO:REVIEW -->\n\n" % (args.url, stamp)
    )
    try:
        os.makedirs(os.path.dirname(os.path.abspath(args.out)), exist_ok=True)
        with open(args.out, "w", encoding="utf-8") as fh:
            fh.write(header + md)
    except OSError as exc:
        sys.stderr.write("guide-page-to-md: cannot write %s: %s\n" % (args.out, exc))
        return 2
    if args.assets and r.images:
        try:
            with open(args.assets, "a", encoding="utf-8") as fh:
                for img in r.images:
                    fh.write("%s\t%s\n" % (args.url, img))
        except OSError as exc:
            sys.stderr.write("guide-page-to-md: cannot append %s: %s\n" % (args.assets, exc))
            return 2
    print("region=found kind=%s src_text_chars=%d md_text_chars=%d missing_runs=%d "
          "internal_links=%d images=%d artefact_markers=%d title=%s"
          % (kind, len(src_text), len(re.sub(r"\s+", " ", md).strip()),
             missing_runs(src_text, md, args.run_length),
             r.internal_links, len(r.images), markers,
             r.title or r.first_heading or "(none)"))
    return 0


def read(path):
    try:
        with open(path, encoding="utf-8", errors="replace") as fh:
            return fh.read()
    except OSError as exc:
        sys.stderr.write("guide-page-to-md: cannot read %s: %s\n" % (path, exc))
        sys.exit(2)


def main(argv):
    ap = argparse.ArgumentParser(add_help=True, description=__doc__.splitlines()[0])
    sub = ap.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("links")
    p.add_argument("--html", required=True)
    p.add_argument("--base-url", required=True)
    p.set_defaults(fn=cmd_links)

    p = sub.add_parser("extract")
    p.add_argument("--html", required=True)
    p.add_argument("--url", required=True)
    p.add_argument("--out", required=True)
    p.add_argument("--region-id", default="preview-content")
    p.add_argument("--run-length", type=int, default=40)
    p.add_argument("--artefact-threshold", type=int, default=3)
    p.add_argument("--assets", default="")
    p.set_defaults(fn=cmd_extract)

    args = ap.parse_args(argv)
    return args.fn(args)


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
