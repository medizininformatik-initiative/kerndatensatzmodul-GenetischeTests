#!/usr/bin/env bash
# guide-harvest -- harvest a module's NARRATIVE out of its server-rendered
# Simplifier guide, page by page, into Markdown -- and prove that it got all of
# it (spec §5.1d).
#
# WHY THIS EXISTS. A module authored in Forge and published on Simplifier keeps
# NO narrative in its repository (spec §5.1b.1): the pages live on the platform.
# A migration that cannot read them ships the TEMPLATE'S STARTER PAGES under the
# module's name -- which is exactly what happened to the KDS Consent migration,
# because this skill carried a measurement from the PROJECT page and applied it
# to the GUIDE pages. Two different URL spaces, two different answers:
#
#   PROJECT page  https://simplifier.net/MedizininformatikInitiative-ModulConsent/
#                 client-rendered application shell. HTTP 200, ~56 KB, 52 script
#                 markers, no identity metadata in the DOM. Nothing to parse.
#                 Measured 2026-08-06 -- and TRUE, for that URL only.
#   GUIDE  pages  https://simplifier.net/guide/<key>/<Root>[/<Page>]?version=<v>
#                 SERVER-RENDERED. Measured 2026-08-06 on MII KDS Consent
#                 2026.0.0: the root returns 24509 bytes carrying the complete
#                 page tree (18 page links among 23 hrefs); the leaf page
#                 `Beschreibung-Modul-Consent` returns 20481 bytes carrying
#                 `<h1 id="page-title">` and the real German narrative. Both are
#                 harvestable with curl and an HTML parser, no browser.
#
# WHERE IT SITS IN THE ORDER OF SOURCES. Most trustworthy first:
#
#   1. The AUTHENTICATED PROJECT DOWNLOAD -- `.../$actions/downloading` -- which
#      yields the project INCLUDING the narrative markdown as the author wrote
#      it. It requires a Simplifier login (measured: anonymous access redirects
#      to `/login?ReturnUrl=...`), so a human supplies the archive; this script
#      is not it. Spec §5.1d.1.
#   2. THIS HARVEST -- anonymous, verified, and a RENDERING: what it returns is
#      the guide's HTML, not the author's source. Directives have already been
#      expanded, and `{{tree}}`/`{{render}}` blocks arrive as their output.
#   3. Nothing. Which is what shipping the template's starter pages amounts to.
#
#   The REGISTRY PACKAGE stays what it always was: the source for resources and
#   identity (`package-identity.sh`, spec §2.1.1), and the list the harvested
#   page set is VERIFIED against -- it carries no narrative.
#
# WHAT IT GUARANTEES. Every page the guide root links to is either harvested or
# recorded as SKIPPED WITH A REASON, in `<log-dir>/guide-harvest.tsv`, and the
# two counts are reconciled through `migration-log.sh ratio` -- so a partial
# harvest raises the mandatory `silent-partial-success:` WARN instead of looking
# like a short guide. Per page it also reports how much of the source text
# survived the Markdown conversion (`missing_runs=`), because a hand-rolled
# converter drops content quietly.
#
# WHAT IT DOES NOT GUESS
#
#   * SLUGS ARE DISCOVERED, NEVER CONSTRUCTED. Simplifier de-punctuates a page
#     title into its slug -- "Anwendungsfälle / Informationsmodell" becomes
#     `AnwendungsflleInformationsmodell` -- so a slug derived from a title is
#     wrong, and wrong in the worst way: it returns a plausible page rather than
#     a 404. Every URL this script fetches came out of an `href` on a page it
#     already fetched.
#   * THE CONTENT REGION IS ISOLATED, NEVER APPROXIMATED. `<div id=
#     "preview-content">` holds the narrative; the tree panel, header, footer and
#     version picker are outside it. A page without that region is recorded as
#     unharvested rather than converted whole -- chrome silently mixed into the
#     narrative is undetectable downstream.
#   * THE VERSION. `?version=` is taken from the URL you pass and carried onto
#     every page URL. Without it the harvest reads whatever `current` is today,
#     and re-running it next month silently harvests a different guide, so an
#     omitted version is a WARN.
#   * WHERE THE PAGES BELONG. It writes to `--out`, which has NO DEFAULT. The
#     harvested tree is INPUT to the page-map contract, not the template's page
#     set: the `5.4c page-routing` advice run reads this manifest and GENERATES
#     the harvested pages' map rows, and step 5 consumes only the reviewed map
#     (spec §9/§9f) — the template has a fixed page set and an extra page is an
#     orphan the menu cannot reach. A German guide's pages are the TRANSLATION
#     under the English default (SKILL.md *Language*), which is also a step-5
#     decision and not this script's.
#
# IT NEVER WRITES INTO THE SOURCE. Its only writes are `--out`, the log
# directory, and the scratch HTML it removes again. Nothing is ever sent to
# simplifier.net or to the `medizininformatik-initiative` organisation but GETs.
#
# USAGE
#
#   guide-harvest.sh --guide-url URL --out DIR [--region-id ID] [--max N]
#                    [--keep-html DIR] [--sleep SECONDS] [--step S] [--action A]
#
#     --guide-url URL  the guide ROOT, e.g. https://simplifier.net/guide/
#                      miiigmodulconsent/MIIIGModulConsent?version=2026.0.0
#                      A leaf page works too -- the page tree is on every page --
#                      but pass the root, so the run is reproducible.
#     --out DIR        where the .md files go. REQUIRED, no default (see above).
#     --region-id ID   the content region's id (default preview-content)
#     --max N          stop after N pages -- for a smoke run. A capped run is
#                      reported as capped and never as complete.
#     --keep-html DIR  keep the fetched HTML there instead of in a scratch
#                      directory that is removed. Evidence for a disputed page.
#     --sleep SECONDS  pause between fetches (default 1). Be a polite client.
#     --step S         run-log STEP field   (default 5.1d)
#     --action A       run-log ACTION field (default guide-harvest)
#
# Call it DIRECTLY, not through `migration-log.sh run --emits-runlog`: it emits
# its lines through the helper as a library, so a wrapper that also folds stdout
# into the run log duplicates every line. Like `package-identity.sh`.
#
# Exit codes: 0 = every discovered page harvested; 1 = at least one page skipped
# or short of its source text -- a real result, recorded per page, and a usable
# CI gate; 2 = setup error (bad arguments, missing curl/python3, guide root
# unreachable, no page links found) -- nothing is harvested, and an unreachable
# guide is never recorded as an empty one.
#
# Bash 3.2 compatible; python3 does the HTML (`guide-page-to-md.py`), matching
# the rest of the skill's scripts (`Bash(python3:*)` is in `allowed-tools`).

set -u

_here() { cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd; }
# shellcheck source=./migration-log.sh
. "$(_here)/migration-log.sh"
PY="$(_here)/guide-page-to-md.py"

STEP=5.1d
ACTION=guide-harvest
GUIDE_URL=""
OUT=""
REGION_ID="preview-content"
MAX=0
KEEP_HTML=""
SLEEP=1

while [ $# -gt 0 ]; do
  case "$1" in
    --guide-url) GUIDE_URL="${2:-}"; shift 2 || true ;;
    --out)       OUT="${2:-}";       shift 2 || true ;;
    --region-id) REGION_ID="${2:-}"; shift 2 || true ;;
    --max)       MAX="${2:-0}";      shift 2 || true ;;
    --keep-html) KEEP_HTML="${2:-}"; shift 2 || true ;;
    --sleep)     SLEEP="${2:-1}";    shift 2 || true ;;
    --step)      STEP="${2:-}";      shift 2 || true ;;
    --action)    ACTION="${2:-}";    shift 2 || true ;;
    -h|--help)
      sed -n '2,/^set -u/p' "${BASH_SOURCE[0]}" | sed '$d' | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *) printf 'guide-harvest: unknown option %s  exit=2\n' "$1" >&2; exit 2 ;;
  esac
done

[ -n "$GUIDE_URL" ] || { printf 'guide-harvest: --guide-url URL is required  exit=2\n' >&2; exit 2; }
[ -n "$OUT" ] || {
  printf 'guide-harvest: --out DIR is required and has no default.  exit=2\n' >&2
  printf '  The harvested tree is INPUT to the page-map contract (the 5.4c advice\n' >&2
  printf '  run routes it; step 5 consumes only the reviewed map, spec 9/9f): the\n' >&2
  printf '  template page set is fixed and an extra page is an unreachable orphan.\n' >&2
  printf '  Name the directory deliberately, e.g.\n' >&2
  printf '  migration-log/guide-harvest/pagecontent.\n' >&2
  exit 2; }
[ -f "$PY" ] || { printf 'guide-harvest: %s is missing  exit=2\n' "$PY" >&2; exit 2; }
for t in curl python3; do
  command -v "$t" >/dev/null 2>&1 || {
    printf 'guide-harvest: %s is required and not on PATH  exit=2\n' "$t" >&2; exit 2; }
done
case "$GUIDE_URL" in
  *"?version="*|*"&version="*) ;;
  *) log_warn "$STEP" "$ACTION" \
       "unpinned-guide-version: the URL carries no ?version=  url=$GUIDE_URL" \
       "The harvest then reads whatever 'current' is today, and a re-run next" \
       "month harvests a different guide with no diff to show for it. Pass the" \
       "version the migration is against." ;;
esac

MANIFEST="$MIGRATION_LOG_DIR/guide-harvest.tsv"
ASSETS="$MIGRATION_LOG_DIR/guide-harvest-assets.tsv"
_ml_ensure_dir || exit 2
mkdir -p "$OUT" 2>/dev/null || { printf 'guide-harvest: cannot create %s  exit=2\n' "$OUT" >&2; exit 2; }
printf 'url\tstatus\tkind\treason\tfile\tsrc_text_chars\tmd_text_chars\tmissing_runs\ttitle\n' >"$MANIFEST"
: >"$ASSETS"

if [ -n "$KEEP_HTML" ]; then
  mkdir -p "$KEEP_HTML" 2>/dev/null || { printf 'guide-harvest: cannot create %s  exit=2\n' "$KEEP_HTML" >&2; exit 2; }
  HTMLDIR="$KEEP_HTML"; KEEP=1
else
  HTMLDIR=$(mktemp -d 2>/dev/null) || { printf 'guide-harvest: cannot create a scratch dir  exit=2\n' >&2; exit 2; }
  KEEP=0
fi
_cleanup() { [ "$KEEP" -eq 1 ] || rm -rf "$HTMLDIR"; }
trap _cleanup EXIT

# A stable, collision-free file name for a page URL: the path BELOW the guide
# root, lowercased, slashes to hyphens. The slug itself is never re-derived from
# a title -- it is whatever Simplifier put in the href.
_name_for() {
  printf '%s' "$1" | sed -e 's/[?#].*$//' -e 's#^https\{0,1\}://[^/]*##' \
    | awk -F/ '{ s=""; for (i=5; i<=NF; i++) s = s (s=="" ? "" : "-") $i; print (s=="" ? "index" : s) }' \
    | tr '[:upper:]' '[:lower:]' | sed -e 's/[^a-z0-9._-]/-/g' -e 's/--*/-/g' -e 's/^-//' -e 's/-$//'
}

_fetch() { # _fetch URL FILE -> prints the HTTP status
  curl -sL --max-time 60 -o "$2" -w '%{http_code}' "$1" 2>/dev/null
}

# --- discover ----------------------------------------------------------------
ROOT_HTML="$HTMLDIR/000-root.html"
CODE=$(_fetch "$GUIDE_URL" "$ROOT_HTML")
BYTES=$(wc -c <"$ROOT_HTML" 2>/dev/null | tr -d ' ')
log_info "$STEP" "$ACTION" \
  "guide root fetched  cmd=\`curl -sL $GUIDE_URL\`  http=$CODE bytes=${BYTES:-0}"
if [ "$CODE" != "200" ]; then
  log_error "$STEP" "$ACTION" \
    "guide-root-unreachable: nothing harvested  http=$CODE url=$GUIDE_URL" \
    "Reported as unread, never as 'the guide has no pages'."
  exit 2
fi

PAGES="$HTMLDIR/pages.txt"
python3 "$PY" links --html "$ROOT_HTML" --base-url "$GUIDE_URL" >"$PAGES" 2>"$HTMLDIR/links.err"
N_DISC=$(grep -c . "$PAGES" 2>/dev/null | tr -d ' ')
if [ "${N_DISC:-0}" -eq 0 ]; then
  log_error "$STEP" "$ACTION" \
    "no-page-links: the page returned 200 but carries no guide page links  url=$GUIDE_URL" \
    "Either --guide-url is a PROJECT page (client-rendered: that URL space really" \
    "does deliver an application shell) rather than a /guide/<key>/<Root> URL," \
    "or the guide renders differently than measured. Do NOT conclude that the" \
    "module has no narrative -- see the authenticated project download, spec 5.1d.1."
  exit 2
fi
log_info "$STEP" "$ACTION" \
  "page tree discovered from the root's own hrefs  discovered=$N_DISC region_id=$REGION_ID" \
  "Slugs are read from href values, never constructed from page titles."

if [ "${MAX:-0}" -gt 0 ] && [ "$N_DISC" -gt "$MAX" ]; then
  log_warn "$STEP" "$ACTION" \
    "capped-run: only the first $MAX of $N_DISC discovered pages will be fetched  max=$MAX" \
    "A capped run is a smoke test, not a harvest. Do not report it as complete."
fi

# --- harvest -----------------------------------------------------------------
N_OK=0; N_SKIP=0; N_SHORT=0; N_ART=0; I=0
while IFS= read -r URL; do
  [ -n "$URL" ] || continue
  I=$((I + 1))
  if [ "${MAX:-0}" -gt 0 ] && [ "$I" -gt "$MAX" ]; then
    printf '%s\tskipped\t\tcapped-run (--max %s)\t\t\t\t\n' "$URL" "$MAX" >>"$MANIFEST"
    N_SKIP=$((N_SKIP + 1)); continue
  fi
  NAME=$(_name_for "$URL")
  PAGE="$HTMLDIR/$(printf '%03d' "$I")-$NAME.html"
  CODE=$(_fetch "$URL" "$PAGE")
  if [ "$CODE" != "200" ]; then
    printf '%s\tskipped\t\thttp %s\t\t\t\t\n' "$URL" "$CODE" >>"$MANIFEST"
    log_warn "$STEP" "$ACTION" "page-unreachable: skipped  http=$CODE url=$URL"
    N_SKIP=$((N_SKIP + 1)); sleep "$SLEEP"; continue
  fi
  MD="$OUT/$NAME.md"
  RES=$(python3 "$PY" extract --html "$PAGE" --url "$URL" --out "$MD" \
          --region-id "$REGION_ID" --assets "$ASSETS" 2>&1)
  RC=$?
  case "$RES" in *"region=absent"*)
    printf '%s\tskipped\t\tno content region id=%s\t\t\t\t\n' "$URL" "$REGION_ID" >>"$MANIFEST"
    log_warn "$STEP" "$ACTION" \
      "content-region-absent: skipped rather than converting the whole page  url=$URL" \
      "Converting a page without its region mixes the guide chrome into the" \
      "narrative, and nothing downstream can tell that apart from content."
    N_SKIP=$((N_SKIP + 1)); sleep "$SLEEP"; continue ;;
  esac
  if [ "$RC" -ne 0 ]; then
    printf '%s\tskipped\t\textractor exit %s\t\t\t\t\n' "$URL" "$RC" >>"$MANIFEST"
    log_error "$STEP" "$ACTION" "page-extract-failed: skipped  exit=$RC url=$URL  $RES"
    N_SKIP=$((N_SKIP + 1)); sleep "$SLEEP"; continue
  fi
  # RES is one line of key=value tokens; read the ones the manifest records.
  # `title=` is last precisely because a title contains spaces.
  KIND=$(printf '%s' "$RES" | sed -n 's/.*kind=\([a-z-]*\).*/\1/p')
  SRC=$(printf '%s' "$RES" | sed -n 's/.*src_text_chars=\([0-9]*\).*/\1/p')
  MDC=$(printf '%s' "$RES" | sed -n 's/.*md_text_chars=\([0-9]*\).*/\1/p')
  MISS=$(printf '%s' "$RES" | sed -n 's/.*missing_runs=\([0-9]*\).*/\1/p')
  TITLE=$(printf '%s' "$RES" | sed -n 's/.*title=//p')
  printf '%s\tharvested\t%s\t\t%s\t%s\t%s\t%s\t%s\n' \
    "$URL" "${KIND:-unknown}" "$MD" "${SRC:-0}" "${MDC:-0}" "${MISS:-0}" "$TITLE" >>"$MANIFEST"
  log_info "$STEP" "$ACTION" "page harvested  url=$URL  file=$MD  $RES"
  if [ "${KIND:-}" = "artefact-view" ]; then
    N_ART=$((N_ART + 1))
    log_info "$STEP" "$ACTION" \
      "rendered-artefact-view: this page is a RENDERING of a conformance resource, not narrative  url=$URL file=$MD src_text_chars=${SRC:-0}" \
      "The IG Publisher regenerates the element tree from the module's own" \
      "StructureDefinition. Take the prose above the tree; do not paste the tree" \
      "into pagecontent as hand-maintained content (spec 9)."
  fi
  if [ "${MISS:-0}" -gt 0 ]; then
    if [ "${KIND:-}" = "artefact-view" ]; then
      # Deliberately NOT the `silent-partial-success:` token: a generated tree
      # table converts lossily by nature, and letting those hits into the token
      # the skill greps for would bury the narrative losses that matter.
      log_warn "$STEP" "$ACTION" \
        "generated-view-lossy: ${MISS} text run(s) of a RENDERED ARTEFACT VIEW did not survive the conversion  url=$URL file=$MD src_text_chars=${SRC:-0} md_text_chars=${MDC:-0}" \
        "Not counted as a narrative loss, because the tree is regenerated from" \
        "the resource. It is still in the manifest and still reviewed at Gate B."
    else
      N_SHORT=$((N_SHORT + 1))
      log_warn "$STEP" "$ACTION" \
        "silent-partial-success: ${MISS} source text run(s) did not survive the Markdown conversion  url=$URL file=$MD src_text_chars=${SRC:-0} md_text_chars=${MDC:-0}" \
        "The page WAS written, so nothing downstream fails -- which is why this is" \
        "a WARN and not a silence. Diff the page against the rendering at Gate B."
    fi
  fi
  N_OK=$((N_OK + 1))
  sleep "$SLEEP"
done <"$PAGES"

# --- reconcile ---------------------------------------------------------------
# The one number this script exists to produce: discovered vs harvested. `ratio`
# raises the mandatory silent-partial-success WARN when the second is smaller.
log_ratio "$STEP" "$ACTION" harvested pages "$N_DISC" "$N_OK" \
  "Every discovered page is in $MANIFEST as 'harvested' or as 'skipped' with a reason." \
  "assets referenced by the harvested pages: $ASSETS  short_pages=$N_SHORT"

N_ASSETS=$(grep -c . "$ASSETS" 2>/dev/null | tr -d ' ')
log_info "$STEP" "$ACTION" \
  "harvest complete  discovered=$N_DISC harvested=$N_OK skipped=$N_SKIP short=$N_SHORT artefact_views=$N_ART assets=${N_ASSETS:-0} out=$OUT" \
  "Next: verify the harvested set against the published package's artefact list" \
  "(package-identity.sh, spec 2.1.1), then let the 5.4c advice run GENERATE the" \
  "map rows from this manifest (page-structure-advice.py --map; step 5 consumes" \
  "only the reviewed map, spec 9/9f) -- never one new page per harvested page." \
  "Links and images are still absolute to simplifier.net: retargeting them is" \
  "part of that mapping, and the assets in $ASSETS still have to be transferred."

[ "$N_SKIP" -eq 0 ] && [ "$N_SHORT" -eq 0 ] && exit 0
exit 1
