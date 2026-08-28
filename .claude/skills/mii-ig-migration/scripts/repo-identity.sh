#!/usr/bin/env bash
# repo-identity -- recover a module's identity from its SOURCE REPOSITORY, and
# probe the rendered guide honestly enough to say what it can and cannot give
# (spec §2.1, tiers R and H).
#
# WHY THIS EXISTS. `package-identity.sh` reads the published package and gets
# most of a module's identity back -- but a FHIR package manifest has no field
# for `title`, `license` or `publisher`, so those three survive as Gate-A items.
# Two of them are not actually unknown:
#
#   * the repository's LICENSE file is REAL LICENCE EVIDENCE. Its SPDX id is the
#     licence the module is published under, and `license` is the one identity
#     value a migration must never let default: the module template ships
#     `license: CC-BY-4.0` as a LITERAL, so no placeholder check flags it, and
#     MII modules commonly declare `CC0-1.0`. Silent relicensing of published
#     content is the failure this tier exists to prevent (spec §2.2).
#   * the README's first heading is a TITLE CANDIDATE -- a human confirms it,
#     but it is evidence, not a blank.
#
# Measured on `medizininformatik-initiative/kerndatensatzmodul-consent`
# (2026-08-06, read-only): LICENSE is the CC-BY-4.0 text (GitHub's own
# `license.spdx_id` agrees), the README's first heading is "Medizininformatik
# Initiative - Modul Consent", the repository description is "Kerndatensatzmodul
# Consent", and the newest release tag is `2026.0.0` -- the same version the
# published package declares, which is what pins the release to the commit.
#
# WHAT IT REFUSES TO DO
#
#   * `publisher` is NOT recovered from the GitHub owner. An organisation
#     account that hosts a repository is not the publishing organisation of a
#     conformance artefact, exactly as the registry `author` is not (§2.1.1).
#     The script names it as absent and says why.
#   * A LICENSE whose text it does not recognize yields NO spdx id. It WARNs
#     `license-text-unrecognized:` and leaves the field to a human -- guessing a
#     licence is the worst possible place to be approximately right.
#   * No rendered page is scraped for IDENTITY, by either of them. Reading a
#     number out of a rendering nobody can re-derive tomorrow would be
#     fabrication with a URL attached (guardrail 3). What this script does is
#     MEASURE the page (bytes, script markers, whether any identity marker is in
#     the DOM at all) and report it as a HUMAN reference for the fields no
#     machine source carries.
#
#     SIMPLIFIER HAS TWO URL SPACES AND THEY ANSWER DIFFERENTLY (§2.1.3). The
#     PROJECT page `simplifier.net/<Project>/` is a client-rendered application
#     shell -- measured 2026-08-06: HTTP 200, ~56 KB, 52 script markers, no
#     identity metadata in the DOM -- and is reported as `client-rendered-page:`.
#     The GUIDE pages `simplifier.net/guide/<key>/<Root>[/<Page>]?version=<v>`
#     are SERVER-RENDERED and carry the module's NARRATIVE (measured: root 24509
#     bytes with the whole page tree, leaf 20481 bytes with the real German
#     text), so a `/guide/` URL is reported as `server-rendered-guide:` and
#     pointed at `guide-harvest.sh`, which harvests it (spec §5.1d).
#
#     Do NOT carry a finding from one of those URL spaces to the other. That
#     over-generalisation is what shipped a migration with the template's
#     starter pages in place of the module's narrative.
#   * Nothing is written into the module. Every recovered value goes to the
#     run log and the identity ledger as Gate-A evidence (§2.1, "Recovered is
#     not applied"), and a value that CONTRADICTS another source raises a WARN
#     instead of being reconciled -- `migration-log.sh claim` does that part.
#
# USAGE
#
#   repo-identity.sh [--dir PATH] [--repo OWNER/NAME] [--rendered URL]
#                    [--step S] [--action A]
#
#     --dir PATH      a local clone or checkout of the source repository. The
#                     offline path, and the one that reads the licence TEXT.
#     --repo OWNER/NAME
#                     read the same repository through the GitHub API: its
#                     description, its detected `license.spdx_id`, its tags.
#                     Rate-limited without a token; a 403 is reported, never
#                     silently treated as "no evidence".
#     --rendered URL  a rendered Simplifier page -- project OR guide -- probed
#                     and CLASSIFIED as described above. Optional.
#     --step S        run-log STEP field   (default 2.1)
#     --action A      run-log ACTION field (default repo-identity)
#
#   At least one of --dir / --repo / --rendered is required.
#
# Call it DIRECTLY, not through `migration-log.sh run --emits-runlog`: it emits
# its lines through the helper as a library, like `package-identity.sh`.
#
# Exit codes: 0 = at least one identity field recovered; 1 = the sources were
# readable but yielded no identity field (a Gate-A item, and a usable CI gate);
# 2 = setup error (bad arguments, missing curl/python3, unreadable --dir).
#
# Bash 3.2 compatible; python3 for JSON only.

set -u

_here() { cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd; }
# shellcheck source=./migration-log.sh
. "$(_here)/migration-log.sh"

STEP=2.1
ACTION=repo-identity
DIR=""
REPO=""
RENDERED=""

while [ $# -gt 0 ]; do
  case "$1" in
    --dir)      DIR="${2:-}";      shift 2 || true ;;
    --repo)     REPO="${2:-}";     shift 2 || true ;;
    --rendered) RENDERED="${2:-}"; shift 2 || true ;;
    --step)     STEP="${2:-}";     shift 2 || true ;;
    --action)   ACTION="${2:-}";   shift 2 || true ;;
    -h|--help)
      sed -n '2,/^set -u/p' "${BASH_SOURCE[0]}" | sed '$d' | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *) printf 'repo-identity: unknown option %s  exit=2\n' "$1" >&2; exit 2 ;;
  esac
done

if [ -z "$DIR" ] && [ -z "$REPO" ] && [ -z "$RENDERED" ]; then
  printf 'repo-identity: one of --dir, --repo or --rendered is required  exit=2\n' >&2
  exit 2
fi
for t in curl python3; do
  command -v "$t" >/dev/null 2>&1 || {
    printf 'repo-identity: %s is required and not on PATH  exit=2\n' "$t" >&2; exit 2; }
done
if [ -n "$DIR" ] && [ ! -d "$DIR" ]; then
  printf 'repo-identity: --dir is not a directory  dir=%s  exit=2\n' "$DIR" >&2
  exit 2
fi

RECOVERED=0
log_info "$STEP" "$ACTION" \
  "params  dir=${DIR:-<none>} repo=${REPO:-<none>} rendered=${RENDERED:-<none>}" \
  "Tier R (the source repository) and tier H (the rendered guide), spec §2.1." \
  "Reporting only: no file in the module repository is written by this script."

# --- tier R, from a local checkout -------------------------------------------
if [ -n "$DIR" ]; then
  # The first heading of the README, at any level. KDS READMEs routinely open at
  # `##`, so a `^# ` grep finds nothing and would report "no title" on a file
  # whose first line is the title.
  README=$(find "$DIR" -maxdepth 1 -iname 'README*' -type f | sort | head -1)
  if [ -n "$README" ]; then
    HEAD1=$(grep -m1 -E '^#{1,3} +\S' "$README" 2>/dev/null | sed -E 's/^#+ +//; s/ +$//')
    if [ -n "$HEAD1" ]; then
      log_claim "$STEP" "$ACTION" title "$HEAD1" R "$(basename "$README") first heading" \
        "A CANDIDATE, confirmed at Gate A -- a README heading is written for human" \
        "readers, and a module's \`title\` is a conformance-artefact field."
      RECOVERED=$((RECOVERED + 1))
    else
      log_info "$STEP" "$ACTION" "no heading in $(basename "$README")  file=$README"
    fi
  else
    log_info "$STEP" "$ACTION" "no README in the repository root  dir=$DIR"
  fi

  LIC=$(find "$DIR" -maxdepth 1 \( -iname 'LICENSE*' -o -iname 'COPYING*' \) -type f | sort | head -1)
  if [ -n "$LIC" ]; then
    SPDX=$(python3 - "$LIC" <<'PY'
import re
import sys

# Conservative text matching, most specific first. A licence this table does not
# know yields NOTHING -- see the WARN below. Guessing an SPDX id is worse than
# reporting the field as unread: it is wrong in a field nobody re-checks.
text = open(sys.argv[1], encoding="utf-8", errors="replace").read()
flat = re.sub(r"\s+", " ", text).strip().lower()
TABLE = [
    ("cc0 1.0 universal", "CC0-1.0"),
    ("attribution-sharealike 4.0 international", "CC-BY-SA-4.0"),
    ("attribution-noncommercial", "CC-BY-NC-4.0"),
    ("attribution 4.0 international", "CC-BY-4.0"),
    ("creative commons attribution 4.0", "CC-BY-4.0"),
    ("gnu affero general public license version 3", "AGPL-3.0-only"),
    ("gnu general public license version 3", "GPL-3.0-only"),
    ("gnu general public license version 2", "GPL-2.0-only"),
    ("gnu lesser general public license version 3", "LGPL-3.0-only"),
    ("apache license version 2.0", "Apache-2.0"),
    ("mozilla public license version 2.0", "MPL-2.0"),
    ("redistribution and use in source and binary forms", "BSD-3-Clause"),
    ("permission is hereby granted, free of charge", "MIT"),
]
for needle, spdx in TABLE:
    if needle in flat:
        print(spdx)
        break
PY
)
    if [ -n "$SPDX" ]; then
      log_claim "$STEP" "$ACTION" license "$SPDX" R "$(basename "$LIC") (text matched)" \
        "REAL licence evidence, and the field a migration must never let default:" \
        "the template ships \`license: CC-BY-4.0\` as a literal that no placeholder" \
        "check flags, and MII modules commonly declare CC0-1.0 (spec §2.2)."
      RECOVERED=$((RECOVERED + 1))
    else
      log_warn "$STEP" "$ACTION" \
        "license-text-unrecognized: the LICENSE text matches no known SPDX id  file=$LIC" \
        "No id is emitted. A guessed licence is the worst kind of plausible wrong" \
        "value -- it is legally meaningful and nobody re-reads it. Gate A."
    fi
  else
    log_info "$STEP" "$ACTION" "no LICENSE file in the repository root  dir=$DIR"
  fi

  if [ -d "$DIR/.git" ] && command -v git >/dev/null 2>&1; then
    TAGS=$(git -C "$DIR" tag 2>/dev/null | sort -V | tail -5 | tr '\n' ' ')
    [ -n "$TAGS" ] && log_info "$STEP" "$ACTION" \
      "release tags in the local checkout (newest last)  tags=${TAGS% }" \
      "Tags are evidence for WHICH RELEASE a commit corresponds to; the module's" \
      "version still comes from the published package (§2.1.1)."
  fi
fi

# --- tier R, through the GitHub API ------------------------------------------
if [ -n "$REPO" ]; then
  API="https://api.github.com/repos/$REPO"
  BODY=$(mktemp); CODE=$(curl -sL -o "$BODY" -w '%{http_code}' "$API" 2>/dev/null)
  if [ "$CODE" = "200" ]; then
    # The assignments are written to a file and sourced. bash 3.2 -- which macOS
    # still ships, and which this catalog's scripts target -- cannot parse a
    # here-document nested inside `"$( … )"`, so `eval "$(python3 <<PY …)"`
    # is a syntax error at load time rather than at the line it stands on.
    GHVARS="$BODY.sh"
    python3 - "$BODY" >"$GHVARS" <<'PY'
import json
import shlex
import sys

d = json.load(open(sys.argv[1], encoding="utf-8"))
lic = (d.get("license") or {}).get("spdx_id") or ""
if lic in ("NOASSERTION", "NONE"):
    # GitHub's detector says "there is a file, I cannot classify it". That is
    # not an SPDX id and must not be recorded as one.
    lic = ""
print("GH_DESC=%s" % shlex.quote((d.get("description") or "").strip()))
print("GH_LICENSE=%s" % shlex.quote(lic))
print("GH_OWNER=%s" % shlex.quote(((d.get("owner") or {}).get("login") or "")))
PY
    # shellcheck disable=SC1090
    . "$GHVARS"; rm -f "$GHVARS"
    if [ -n "${GH_DESC:-}" ]; then
      log_claim "$STEP" "$ACTION" description "$GH_DESC" R "GitHub repository description" \
        "A repository blurb, not the module's \`description\`; it is a candidate."
      RECOVERED=$((RECOVERED + 1))
    fi
    if [ -n "${GH_LICENSE:-}" ]; then
      log_claim "$STEP" "$ACTION" license "$GH_LICENSE" R "GitHub license.spdx_id" \
        "GitHub's own detection of the same LICENSE file. Recorded separately so" \
        "that a disagreement with the text match becomes a visible contradiction."
      RECOVERED=$((RECOVERED + 1))
    fi
    log_warn "$STEP" "$ACTION" \
      "not-recoverable-from-a-repository: publisher  owner=${GH_OWNER:-<unknown>}" \
      "The GitHub owner is an ACCOUNT that hosts the repository, not the" \
      "publishing organisation of a conformance artefact -- the same reason the" \
      "registry \`author\` is not a publisher (§2.1.1). \`publisher\` stays a Gate-A" \
      "field: a human names the organisation."
    TAGS=$(curl -sfL "$API/tags" 2>/dev/null | python3 -c \
      'import json,sys
try: d=json.load(sys.stdin)
except Exception: d=[]
print(" ".join(t.get("name","") for t in d[:8]))' 2>/dev/null)
    if [ -n "${TAGS// /}" ]; then
      log_info "$STEP" "$ACTION" "release tags on GitHub (newest first)  tags=$TAGS" \
        "Cross-check: the tag matching the published package's version is what" \
        "ties that RELEASE to the commit being migrated (§2.1.1, which version)."
    fi
  elif [ "$CODE" = "403" ] || [ "$CODE" = "429" ]; then
    log_warn "$STEP" "$ACTION" \
      "github-api-rate-limited: no tier-R evidence was read from the API  http=$CODE repo=$REPO" \
      "This is NOT 'the repository carries no identity'. Re-run with --dir against" \
      "a local checkout, or with an authenticated client, before concluding anything."
  else
    log_warn "$STEP" "$ACTION" \
      "github-api-unreadable: the repository could not be read  http=$CODE repo=$REPO" \
      "Reported as unread, never as empty."
  fi
  rm -f "$BODY"
fi

# --- tier H, the rendered page -----------------------------------------------
# The honest part: measure what the page actually delivers, say plainly that it
# is not an identity source -- and say WHICH URL SPACE it is, because the two
# answer differently and conflating them is what this section got wrong once.
if [ -n "$RENDERED" ]; then
  PAGE=$(mktemp)
  CODE=$(curl -sL -o "$PAGE" -w '%{http_code}' "$RENDERED" 2>/dev/null)
  BYTES=$(wc -c <"$PAGE" 2>/dev/null | tr -d ' ')
  SCRIPTS=$(grep -o -i '<script' "$PAGE" 2>/dev/null | wc -l | tr -d ' ')
  MARKERS=$(grep -c -i -E 'og:title|"packageId"|canonical"|application/fhir\+json' "$PAGE" 2>/dev/null | tr -d ' ')
  # Guide page links are what tells the server-rendered guide from the project
  # shell, and it is MEASURED per run rather than assumed from the URL alone.
  GUIDE_LINKS=$(grep -o 'href="/guide/[^"]*"' "$PAGE" 2>/dev/null \
                | grep -v '/files/static/' | sort -u | grep -c . | tr -d ' ')
  log_info "$STEP" "$ACTION" \
    "rendered page probed  cmd=\`curl -sL $RENDERED\`  http=$CODE bytes=${BYTES:-0} script_markers=${SCRIPTS:-0} identity_markers=${MARKERS:-0} guide_page_links=${GUIDE_LINKS:-0}"
  if [ "$CODE" = "200" ] && [ "${GUIDE_LINKS:-0}" -gt 0 ]; then
    log_info "$STEP" "$ACTION" \
      "server-rendered-guide: this URL space DOES deliver content  http=$CODE bytes=${BYTES:-0} guide_page_links=${GUIDE_LINKS:-0} url=$RENDERED" \
      "It still yields no IDENTITY -- that stays a Gate-A read by a human. What it" \
      "yields is the NARRATIVE: harvest it with scripts/guide-harvest.sh (spec 5.1d)," \
      "or supply the authenticated project download, which is the better source." \
      "Do NOT read the project page's client-rendered finding onto this one."
  elif [ "$CODE" = "200" ] && [ "${MARKERS:-0}" -eq 0 ]; then
    log_warn "$STEP" "$ACTION" \
      "client-rendered-page: this page is a HUMAN reference, not a scrape target  http=$CODE bytes=${BYTES:-0} script_markers=${SCRIPTS:-0} identity_markers=0 guide_page_links=0" \
      "The delivered HTML carries the application, not the metadata: the identity" \
      "is fetched by scripts after load. Nothing is extracted from it here." \
      "Its legitimate use is the opposite direction -- a HUMAN reads the rendered" \
      "page at Gate A for the fields no machine source carries (title, publisher)" \
      "and records what they read. An agent inventing a value 'from the guide'" \
      "would be fabricating with a URL attached (guardrail 3)." \
      "THIS FINDING IS ABOUT THIS URL ONLY. The /guide/<key>/<Root> space is" \
      "server-rendered and IS harvestable -- pass that URL to see it measured."
  elif [ "$CODE" != "200" ]; then
    log_warn "$STEP" "$ACTION" \
      "rendered-guide-unreachable: no tier-H reference was probed  http=$CODE url=$RENDERED"
  else
    log_info "$STEP" "$ACTION" \
      "the rendered page DOES carry identity markers  identity_markers=$MARKERS url=$RENDERED" \
      "Read them by hand and record them at Gate A with the URL as the evidence;" \
      "this script still extracts nothing, because a page that renders differently" \
      "tomorrow leaves no way to re-derive what was read today."
  fi
  rm -f "$PAGE"
fi

# --- result -------------------------------------------------------------------
if [ "$RECOVERED" -gt 0 ]; then
  log_info "$STEP" "$ACTION" \
    "done  fields_recovered=$RECOVERED exit=0" \
    "Recovered, not applied: every value above is Gate-A evidence, recorded in" \
    "the identity ledger beside the other tiers' readings (spec §2.1)."
  exit 0
fi
log_info "$STEP" "$ACTION" \
  "done  fields_recovered=0 exit=1" \
  "The sources named were read and yielded no identity field. That is a Gate-A" \
  "item, not a licence to fall back on the template's literals (spec §2.2)."
exit 1
