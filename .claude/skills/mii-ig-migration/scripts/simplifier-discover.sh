#!/usr/bin/env bash
# simplifier-discover -- go from a MODULE NAME to the exact guide pages of a
# PINNED, PUBLISHED version of its Simplifier guide, without anybody having to
# be told a key (spec §5.1c).
#
# WHY THIS EXISTS. `repo-identity.sh` measures that a Simplifier PROJECT page is
# client-rendered and reports it as a human reference (§2.1.3). That measurement
# is correct and stands -- and it was once over-generalized into "Simplifier is
# not scrapeable", which is false. The PROJECT page is the app shell; the
# PACKAGE page, the project's guide listing, the version listing and the GUIDE
# pages are all SERVER-RENDERED and yield their content to `curl`. Conflating
# the two is what produced that earlier false negative, and the general rule it
# violated is the catalog's own: a negative capability finding is measured on
# THE EXACT ARTEFACT it is claimed about, never on a neighbouring one.
#
# THE CHAIN, five hops, each one measured (2026-08-06, anonymous, no login):
#
#   1. org project list   /organization/<org-key>/~projects
#                         -> the authoritative package-id list, via /packages/<id>/ hrefs
#   2. package -> project /packages/<packageId>/latest        -> the project slug
#   3. project -> keys    /<project-slug>/filterprojectguides -> the guide keys
#                         NO TILDE. `~filterprojectguides` and `~guides` return
#                         200 and yield NOTHING; the project page itself yields
#                         nothing either, because it is the app shell.
#   4. keys -> versions   /published-guide/<guide-key>/versions
#                         -> published, READ-ONLY versions, and separately the
#                            "Current preview" = the LIVE EDITABLE project
#   5. version -> pages   /guide/<key>?version=<v>  -> the page tree, from which
#                         the GuideRoot and every leaf slug are READ
#
# WHAT IT REFUSES TO DO
#
#   * It never CONSTRUCTS a guide key or a page slug. Keys do not follow from
#     the project name -- measured: `miiigmodulconsent` exists, the analogously
#     built `miiigmodulperson` 404s -- and page slugs are de-punctuated by the
#     renderer (`Anwendungsfälle / Informationsmodell` becomes
#     `AnwendungsflleInformationsmodell`). Both are READ from hop 3 and hop 5.
#   * It never pins `?version=current`. That is the live editable project, so
#     two runs of the same migration could silently differ; a migration pins a
#     PUBLISHED, READ-ONLY version and records it exactly as it records a source
#     commit SHA. When a guide has only a preview, this script says so and
#     refuses to pin (`no-published-version:`).
#   * It never records the guide's version as the MODULE's version. They are
#     different sequences: measured, guide `mii-ig-modul-consent-2025` version
#     2025.0.1 carries package version 2025.0.0. Writing it into the identity
#     ledger would manufacture a contradiction out of two correct numbers, so
#     the package pin a version row names is REPORTED and nothing is claimed.
#   * It never logs in. The project download `<project>/$actions/downloading`
#     requires a Simplifier account -- measured, all four query variants
#     redirect to /login -- and stays an OPT-IN HUMAN step, never a credential
#     mechanism this script invents.
#   * It never guesses at an empty hop. Every hop that yields nothing emits a
#     WARN naming the hop, the URL and what a human should check.
#
# USAGE
#
#   simplifier-discover.sh [--org KEY] [--module SLUG] [--package ID]
#                          [--project SLUG] [--guide KEY] [--version V]
#                          [--out DIR] [--base URL] [--step S] [--action A]
#
#     --org KEY       organization key for hop 1 (MII: koordinationsstellemii)
#     --module SLUG   module slug to select from hop 1's list, e.g. `consent`
#     --package ID    skip hops 1-2's selection and name the package outright
#     --project SLUG  skip hops 1-3 and name the project slug outright
#     --guide KEY     restrict hops 4-5 to one already-known guide key
#     --version V     pin this version instead of the proposed one. It must
#                     appear as PUBLISHED in hop 4, or the run WARNs and stops.
#     --out DIR       where the TSVs go (default $MIGRATION_LOG_DIR, else
#                     migration-log)
#     --base URL      Simplifier base (default https://simplifier.net)
#     --step S        run-log STEP field   (default 5.1c)
#     --action A      run-log ACTION field (default simplifier-discover)
#
#   One of --org, --package, --project or --guide is required.
#
# OUTPUTS
#
#   <out>/simplifier-guides.tsv                    key, version, flags, date, package pin
#   <out>/simplifier-pages-<key>-<version>.tsv     depth, slug path, URL
#
# Call it DIRECTLY, not through `migration-log.sh run --emits-runlog`: it emits
# its lines through the helper as a library, like `repo-identity.sh`.
#
# Exit codes: 0 = at least one guide key resolved to a pinned published version
# with a non-empty page list; 1 = the sources were readable but a hop yielded
# nothing (every one of them WARNed -- a Gate-B item, and a usable CI gate);
# 2 = setup error (bad arguments, missing curl/python3).
#
# Bash 3.2 compatible; python3 for HTML parsing only.

set -u

_here() { cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd; }
# shellcheck source=./migration-log.sh
. "$(_here)/migration-log.sh"

STEP=5.1c
ACTION=simplifier-discover
BASE="https://simplifier.net"
ORG=""
MODULE=""
PACKAGE=""
PROJECT=""
GUIDE=""
PIN=""
OUT="${MIGRATION_LOG_DIR:-migration-log}"

while [ $# -gt 0 ]; do
  case "$1" in
    --org)     ORG="${2:-}";     shift 2 || true ;;
    --module)  MODULE="${2:-}";  shift 2 || true ;;
    --package) PACKAGE="${2:-}"; shift 2 || true ;;
    --project) PROJECT="${2:-}"; shift 2 || true ;;
    --guide)   GUIDE="${2:-}";   shift 2 || true ;;
    --version) PIN="${2:-}";     shift 2 || true ;;
    --out)     OUT="${2:-}";     shift 2 || true ;;
    --base)    BASE="${2:-}";    shift 2 || true ;;
    --step)    STEP="${2:-}";    shift 2 || true ;;
    --action)  ACTION="${2:-}";  shift 2 || true ;;
    -h|--help)
      sed -n '2,/^set -u/p' "${BASH_SOURCE[0]}" | sed '$d' | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *) printf 'simplifier-discover: unknown option %s  exit=2\n' "$1" >&2; exit 2 ;;
  esac
done

if [ -z "$ORG" ] && [ -z "$PACKAGE" ] && [ -z "$PROJECT" ] && [ -z "$GUIDE" ]; then
  printf 'simplifier-discover: one of --org, --package, --project or --guide is required  exit=2\n' >&2
  exit 2
fi
for t in curl python3; do
  command -v "$t" >/dev/null 2>&1 || {
    printf 'simplifier-discover: %s is required and not on PATH  exit=2\n' "$t" >&2; exit 2; }
done
mkdir -p "$OUT" 2>/dev/null || {
  printf 'simplifier-discover: cannot create --out directory  dir=%s  exit=2\n' "$OUT" >&2; exit 2; }

BASE="${BASE%/}"
WARNED=0
PAGES_TOTAL=0
GUIDES_TSV="$OUT/simplifier-guides.tsv"
: >"$GUIDES_TSV"
printf 'guide_key\tversion\tflags\tdate\tpackage_pin\n' >>"$GUIDES_TSV"

# fetch URL FILE -> echoes the HTTP status; the body lands in FILE.
fetch() {
  curl -sL -o "$2" -w '%{http_code}' "$1" 2>/dev/null
}

log_info "$STEP" "$ACTION" \
  "params  base=$BASE org=${ORG:-<none>} module=${MODULE:-<none>} package=${PACKAGE:-<none>} project=${PROJECT:-<none>} guide=${GUIDE:-<none>} pin=${PIN:-<propose>} out=$OUT" \
  "Discovery only: nothing in the module repository is written, and no value is" \
  "claimed into the identity ledger -- a guide's version is not the module's" \
  "version (spec §5.1c)."

# --- hop 1: the organization's project list -> the package-id list ------------
PKGLIST=""
if [ -n "$ORG" ] && [ -z "$PROJECT" ] && [ -z "$GUIDE" ]; then
  URL="$BASE/organization/$ORG/~projects"
  BODY=$(mktemp); CODE=$(fetch "$URL" "$BODY")
  BYTES=$(wc -c <"$BODY" 2>/dev/null | tr -d ' ')
  if [ "$CODE" = "200" ]; then
    PKGLIST=$(grep -o '/packages/[A-Za-z0-9._-]*/' "$BODY" 2>/dev/null \
      | sed 's|^/packages/||; s|/$||' | sort -u)
    N=$(printf '%s\n' "$PKGLIST" | grep -c . | tr -d ' ')
    if [ "${N:-0}" -gt 0 ]; then
      log_info "$STEP" "$ACTION" \
        "hop 1 org project list  cmd=\`curl -sL $URL\`  http=$CODE bytes=${BYTES:-0} packages=$N" \
        "This listing is the AUTHORITATIVE package-id set for the organization." \
        "It does NOT expose project slugs or guide keys -- those are hops 2 and 3."
    else
      log_warn "$STEP" "$ACTION" \
        "org-project-list-empty: no package ids on the organization's project list  http=$CODE bytes=${BYTES:-0} url=$URL" \
        "Check the org key by hand before concluding anything: this listing is the" \
        "only authoritative source for the package ids, and an empty result is far" \
        "more likely a wrong key than an organization with no projects."
      WARNED=1
    fi
  else
    log_warn "$STEP" "$ACTION" \
      "org-project-list-unreachable: hop 1 read nothing  http=$CODE url=$URL" \
      "Reported as unread, never as empty."
    WARNED=1
  fi
  rm -f "$BODY"
fi

# --- hop 1b: select the package ----------------------------------------------
if [ -z "$PACKAGE" ] && [ -n "$MODULE" ] && [ -n "$PKGLIST" ]; then
  # Prefer an exact final segment; fall back to a substring, and NEVER pick one
  # of several. Two candidates is a real condition (a module whose name is a
  # prefix of another's), and choosing silently migrates the wrong module.
  HITS=$(printf '%s\n' "$PKGLIST" | grep -E "\.${MODULE}$" || true)
  [ -z "$HITS" ] && HITS=$(printf '%s\n' "$PKGLIST" | grep -F "$MODULE" || true)
  NHIT=$(printf '%s\n' "$HITS" | grep -c . | tr -d ' ')
  if [ "${NHIT:-0}" -eq 1 ]; then
    PACKAGE="$HITS"
    log_info "$STEP" "$ACTION" "hop 1b module resolved  module=$MODULE package=$PACKAGE"
  elif [ "${NHIT:-0}" -eq 0 ]; then
    log_warn "$STEP" "$ACTION" \
      "module-not-in-org-list: no package id matches the module  module=$MODULE candidates=0" \
      "The organization's list is authoritative, so the module name is wrong, the" \
      "module is published elsewhere, or it is not published at all. Read the list" \
      "and name the package with --package; nothing is guessed here."
    WARNED=1
  else
    log_warn "$STEP" "$ACTION" \
      "module-ambiguous: several package ids match  module=$MODULE candidates=$NHIT" \
      "$(printf '%s' "$HITS" | tr '\n' ' ')" \
      "Not resolved by preferring the shortest or the first: picking one silently" \
      "would migrate a different module. Name it with --package."
    WARNED=1
  fi
fi

# --- hop 2: package -> project slug ------------------------------------------
if [ -z "$PROJECT" ] && [ -z "$GUIDE" ] && [ -n "$PACKAGE" ]; then
  URL="$BASE/packages/$PACKAGE/latest"
  BODY=$(mktemp); CODE=$(fetch "$URL" "$BODY")
  if [ "$CODE" = "200" ]; then
    PROJECT=$(python3 - "$BODY" <<'PY'
import re
import sys

# The package page carries an "additional-info" block whose folder item reads
#   Project <a href="/<project-slug>">Display Name</a>
# Anchored on the literal word so that a nav link cannot be mistaken for it.
html = open(sys.argv[1], encoding="utf-8", errors="replace").read()
m = re.search(r'Project\s*<a\s+href="/([^"/?#]+)"', html)
print(m.group(1) if m else "")
PY
)
    if [ -n "$PROJECT" ]; then
      log_info "$STEP" "$ACTION" \
        "hop 2 package -> project  cmd=\`curl -sL $URL\`  http=$CODE package=$PACKAGE project=$PROJECT"
    else
      log_warn "$STEP" "$ACTION" \
        "package-project-link-absent: hop 2 found no project link  http=$CODE url=$URL" \
        "A package published outside a project has none, and a renamed anchor" \
        "breaks the match. Read the page and pass --project; do not assemble a" \
        "slug from the package id -- they are unrelated strings."
      WARNED=1
    fi
  else
    log_warn "$STEP" "$ACTION" \
      "package-page-unreachable: hop 2 read nothing  http=$CODE url=$URL"
    WARNED=1
  fi
  rm -f "$BODY"
fi

# --- hop 3: project -> guide keys --------------------------------------------
KEYS=""
if [ -n "$GUIDE" ]; then
  KEYS="$GUIDE"
  log_info "$STEP" "$ACTION" "hop 3 skipped  guide_key_supplied=$GUIDE"
elif [ -n "$PROJECT" ]; then
  URL="$BASE/$PROJECT/filterprojectguides"
  BODY=$(mktemp); CODE=$(fetch "$URL" "$BODY")
  BYTES=$(wc -c <"$BODY" 2>/dev/null | tr -d ' ')
  if [ "$CODE" = "200" ]; then
    # The attribute is NOT always `data-url="/guide/<key>"`. Simplifier appends a
    # query for preview/archived guides: `data-url="/guide/<key>?version=current"`.
    # An anchored `"` therefore drops those keys SILENTLY. Measured across modules:
    # consent 3 of 3 (every key bare -- which is why a consent-only test passed),
    # mikrobiologie 2 of 3, person 0 of 3. Stop at `?`, `#` or `"`, whichever comes
    # first, and count the raw occurrences separately so a drop cannot pass unseen.
    KEYS=$(grep -o 'data-url="/guide/[^"?#]*' "$BODY" 2>/dev/null \
      | sed 's|^data-url="/guide/||' | grep . | sort -u)
    N=$(printf '%s\n' "$KEYS" | grep -c . | tr -d ' ')
    RAW=$(grep -o 'data-url="/guide/' "$BODY" 2>/dev/null | grep -c . | tr -d ' ')
    if [ "${N:-0}" -gt 0 ]; then
      log_info "$STEP" "$ACTION" \
        "hop 3 project -> guide keys  cmd=\`curl -sL $URL\`  http=$CODE bytes=${BYTES:-0} keys=$N" \
        "keys: $(printf '%s' "$KEYS" | tr '\n' ' ')" \
        "NO TILDE in the path. \`~filterprojectguides\` and \`~guides\` return 200 and" \
        "yield nothing, and the project page itself is the client-rendered app" \
        "shell -- this endpoint is the one that answers (spec §5.1c)."
      # Silent-loss guard: distinct keys must account for every occurrence. A
      # mismatch means the markup carries a shape this extractor does not model,
      # and a quietly short list is the failure mode that reaches a report unnoticed.
      if [ "${RAW:-0}" -gt 0 ] && [ "$N" -lt "$RAW" ]; then
        log_warn "$STEP" "$ACTION" \
          "silent-partial-success: extracted $N of $RAW guide-key occurrences  url=$URL" \
          "Occurrences that did not yield a key carry an attribute shape this" \
          "extractor does not model. Do NOT proceed on the short list -- inspect" \
          "the markup and extend the extractor (spec §5.1c.1)."
        WARNED=1
      fi
    else
      log_warn "$STEP" "$ACTION" \
        "project-guides-empty: hop 3 yielded no guide key  http=$CODE bytes=${BYTES:-0} url=$URL" \
        "The commonest cause is NOT the tilde: it is a project that registers no" \
        "guide at all, which is normal. Confirm by opening the URL. Only then" \
        "check the path has no tilde and that the slug came from hop 2. Never" \
        "fall back to the project page -- it is the client-rendered app shell and" \
        "yields nothing, the false negative this chain exists to prevent."
      WARNED=1
    fi
  else
    log_warn "$STEP" "$ACTION" \
      "project-guides-unreachable: hop 3 read nothing  http=$CODE url=$URL"
    WARNED=1
  fi
  rm -f "$BODY"
fi

# --- hops 4 and 5, per guide key ---------------------------------------------
for KEY in $KEYS; do
  [ -n "$KEY" ] || continue

  # hop 4: the version listing.
  URL="$BASE/published-guide/$KEY/versions"
  BODY=$(mktemp); CODE=$(fetch "$URL" "$BODY")
  if [ "$CODE" = "404" ]; then
    log_warn "$STEP" "$ACTION" \
      "guide-key-not-published: hop 4 has no such guide  http=404 key=$KEY url=$URL" \
      "A guide key is DISCOVERED at hop 3, never constructed: measured," \
      "\`miiigmodulconsent\` exists while the analogously built \`miiigmodulperson\`" \
      "404s. If this key came from a pattern rather than from hop 3, that is the" \
      "defect."
    WARNED=1; rm -f "$BODY"; continue
  elif [ "$CODE" != "200" ]; then
    log_warn "$STEP" "$ACTION" \
      "guide-versions-unreachable: hop 4 read nothing  http=$CODE key=$KEY url=$URL"
    WARNED=1; rm -f "$BODY"; continue
  fi

  ROWS=$(python3 - "$BODY" <<'PY'
import html
import re
import sys

# One line per version row: VERSION \t FLAGS \t DATE \t PACKAGE_PIN.
# The version is taken from the row's own `?version=` link rather than from its
# text, because that is the value the page itself would navigate to. The LIVE
# EDITABLE project links `?version=current` and is emitted as `current` so the
# caller can refuse it explicitly instead of it silently ranking as a version.
doc = open(sys.argv[1], encoding="utf-8", errors="replace").read()
for tr in re.findall(r"<tr[^>]*>(.*?)</tr>", doc, re.S):
    m = re.search(r'href="[^"]*[?&]version=([^"&]+)"', tr)
    if not m:
        continue
    version = html.unescape(m.group(1))
    text = html.unescape(re.sub(r"<[^>]+>", " ", tr))
    text = re.sub(r"\s+", " ", text).strip()
    flags = ",".join(f for f in ("Default", "Read-only", "Public", "Private")
                     if re.search(r"\b%s\b" % re.escape(f), text))
    date = re.search(r"\d{4}-\d{2}-\d{2}(?: \d{2}:\d{2})?", text)
    pin = re.search(r"Package\s+(\S+)\s+(\d[\w.\-]*)", text)
    print("\t".join([version, flags or "-", date.group(0) if date else "-",
                     "%s@%s" % pin.groups() if pin else "-"]))
PY
)
  rm -f "$BODY"

  PUBLISHED=$(printf '%s\n' "$ROWS" | grep -v '^current	' | grep . || true)
  NPUB=$(printf '%s\n' "$PUBLISHED" | grep -c . | tr -d ' ')
  HASPREVIEW=$(printf '%s\n' "$ROWS" | grep -c '^current	' | tr -d ' ')
  if [ "${NPUB:-0}" -eq 0 ]; then
    log_warn "$STEP" "$ACTION" \
      "no-published-version: hop 4 lists only a preview  key=$KEY preview=${HASPREVIEW:-0} url=$URL" \
      "\`?version=current\` is the LIVE EDITABLE project, so harvesting it makes the" \
      "migration unreproducible -- two runs could silently differ. Nothing is" \
      "pinned here; a human decides whether to publish a version first."
    WARNED=1; continue
  fi
  log_info "$STEP" "$ACTION" \
    "hop 4 guide versions  cmd=\`curl -sL $URL\`  http=200 key=$KEY published=$NPUB preview=${HASPREVIEW:-0}" \
    "$(printf '%s' "$PUBLISHED" | tr '\t' ' ' | tr '\n' ';')" \
    "The preview row is reported and never pinned. A version row naming a package" \
    "pin is REPORTED, not claimed: a guide's version and its module's version are" \
    "different sequences (measured: guide 2025.0.1 carries package 2025.0.0)."

  # Pin: the caller's, verified against the listing -- or the newest published
  # row flagged Default, else the newest by date. Never `current`.
  if [ -n "$PIN" ]; then
    if printf '%s\n' "$PUBLISHED" | cut -f1 | grep -qxF "$PIN"; then
      VERSION="$PIN"
    else
      log_warn "$STEP" "$ACTION" \
        "pinned-version-not-published: --version is not in hop 4's listing  key=$KEY version=$PIN" \
        "Not silently replaced with the newest: a pin names the version whose pages" \
        "a report will cite, and substituting another changes what was harvested."
      WARNED=1; continue
    fi
  else
    VERSION=$(printf '%s\n' "$PUBLISHED" | grep 'Default' | sort -t"$(printf '\t')" -k3,3r \
      | head -1 | cut -f1)
    if [ -n "$VERSION" ]; then
      WHY="flagged Default"
    else
      VERSION=$(printf '%s\n' "$PUBLISHED" | sort -t"$(printf '\t')" -k3,3r | head -1 | cut -f1)
      WHY="newest by date, no row flagged Default"
    fi
    log_info "$STEP" "$ACTION" \
      "hop 4 proposed pin  key=$KEY version=$VERSION reason=$WHY" \
      "PROPOSED, and a Gate-B confirmation: record this version in the migration" \
      "report exactly as the source commit SHA is recorded (spec §5.1c)."
  fi

  ROW=$(printf '%s\n' "$PUBLISHED" | awk -F"\t" -v v="$VERSION" '$1==v {print; exit}')
  printf '%s\t%s\n' "$KEY" "$ROW" >>"$GUIDES_TSV"

  # hop 5: the guide root -> the page tree.
  URL="$BASE/guide/$KEY?version=$VERSION"
  BODY=$(mktemp); CODE=$(fetch "$URL" "$BODY")
  BYTES=$(wc -c <"$BODY" 2>/dev/null | tr -d ' ')
  if [ "$CODE" != "200" ]; then
    log_warn "$STEP" "$ACTION" \
      "guide-root-unreachable: hop 5 read nothing  http=$CODE key=$KEY version=$VERSION url=$URL"
    WARNED=1; rm -f "$BODY"; continue
  fi

  PAGES_TSV="$OUT/simplifier-pages-$KEY-$VERSION.tsv"
  ROOTS=$(python3 - "$BODY" "$KEY" "$VERSION" "$PAGES_TSV" "$BASE" <<'PY'
import html
import re
import sys

# The guide entry URL is SERVER-RENDERED and carries the whole page tree. Every
# narrative link has the shape /guide/<key>/<GuideRoot>/<Page>/<Sub>?version=<v>.
# Static assets sit under /guide/<key>/<version>/files/... and are excluded by
# that shape, never by an extension list.
body, key, version, out, base = (open(sys.argv[1], encoding="utf-8",
                                      errors="replace").read(), *sys.argv[2:6])
seen, roots = [], set()
for href in re.findall(r'href="(/guide/%s/[^"]+)"' % re.escape(key), body):
    href = html.unescape(href)
    path, _, query = href.partition("?")
    segs = [s for s in path.split("/")[3:] if s]
    if not segs or segs[0] == version or "files" in segs[:2]:
        continue
    roots.add(segs[0])
    if href not in [h for _, _, h in seen]:
        seen.append((len(segs), "/".join(segs), href))
seen.sort(key=lambda r: (r[0], r[1]))
with open(out, "w", encoding="utf-8") as fh:
    fh.write("depth\tslug_path\turl\n")
    for depth, slug, href in seen:
        fh.write("%d\t%s\t%s%s\n" % (depth, slug, base, href))
print("\n".join(sorted(roots)))
print("PAGES=%d" % len(seen))
PY
)
  rm -f "$BODY"
  NPAGES=$(printf '%s\n' "$ROOTS" | sed -n 's/^PAGES=//p')
  ROOTNAMES=$(printf '%s\n' "$ROOTS" | grep -v '^PAGES=' | grep . || true)
  NROOTS=$(printf '%s\n' "$ROOTNAMES" | grep -c . | tr -d ' ')

  if [ "${NPAGES:-0}" -eq 0 ]; then
    log_warn "$STEP" "$ACTION" \
      "guide-pages-empty: hop 5 yielded no page link  http=$CODE bytes=${BYTES:-0} key=$KEY version=$VERSION url=$URL" \
      "Do not fall back to constructing slugs. The renderer de-punctuates them" \
      "(\`Anwendungsfälle / Informationsmodell\` becomes" \
      "\`AnwendungsflleInformationsmodell\`), so a constructed path is a 404 at best" \
      "and the wrong page at worst. Read the root by hand and report the hop."
    WARNED=1; continue
  fi
  if [ "${NROOTS:-0}" -gt 1 ]; then
    log_warn "$STEP" "$ACTION" \
      "guide-root-not-unanimous: hop 5 saw several roots  key=$KEY roots=$(printf '%s' "$ROOTNAMES" | tr '\n' ' ')" \
      "Reported rather than reduced to the commonest: several roots under one" \
      "guide key is a real shape (spec §5.1a's multi-tree case), and choosing one" \
      "here would silently drop the others' pages."
    WARNED=1
  fi
  PAGES_TOTAL=$((PAGES_TOTAL + NPAGES))
  log_info "$STEP" "$ACTION" \
    "hop 5 guide pages  cmd=\`curl -sL '$URL'\`  http=$CODE bytes=${BYTES:-0} key=$KEY version=$VERSION root=$(printf '%s' "$ROOTNAMES" | tr '\n' ',') pages=$NPAGES out=$PAGES_TSV" \
    "The GuideRoot and every slug were READ from this page, not constructed." \
    "Leaf pages carry the real narrative; the root carries the tree."
done

# --- result -------------------------------------------------------------------
if [ "$PAGES_TOTAL" -gt 0 ] && [ "$WARNED" -eq 0 ]; then
  log_info "$STEP" "$ACTION" \
    "done  pages=$PAGES_TOTAL guides=$GUIDES_TSV exit=0" \
    "Every pinned version is PUBLISHED and READ-ONLY. Record it in the migration" \
    "report beside the source commit SHA -- a harvest of \`current\` would not be" \
    "reproducible (spec §5.1c)."
  exit 0
fi
if [ "$PAGES_TOTAL" -gt 0 ]; then
  log_warn "$STEP" "$ACTION" \
    "partial-discovery: some hops yielded nothing  pages=$PAGES_TOTAL guides=$GUIDES_TSV exit=1" \
    "What was discovered is above and in the TSVs; what was not is named by its" \
    "own WARN. Nothing was filled in for the gaps."
  exit 1
fi
log_warn "$STEP" "$ACTION" \
  "no-discovery: the chain yielded no guide page  pages=0 exit=1" \
  "Read the WARNs above for the hop that stopped it. An empty result is a" \
  "finding for a human, never a licence to construct a key, a slug or a version."
exit 1
