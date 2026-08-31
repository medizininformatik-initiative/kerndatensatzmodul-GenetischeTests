#!/usr/bin/env bash
# gofsh-results -- read goFSH's OWN results table back out of its raw log and
# turn it into run-log lines: one labelled INFO naming every cell, and the
# converted-vs-input reconciliation that decides whether the conversion was
# complete (spec §5.1b.2 (c)+(d), §10.4).
#
# WHY THIS IS A SCRIPT AND NOT THREE LINES IN THE DOCUMENTED BLOCK. It used to be
# three lines, and both of them were wrong in a way no reader could see:
#
#   1. RE-RUN SAFETY. The parse started at the FIRST "GoFSH RESULTS" in the raw
#      log and read to end of file. The raw log was appended to, so a second
#      conversion in the same directory -- the ordinary case, an operator
#      adjusting `-d` and repeating the step -- left two tables in one file and
#      the parse SUMMED them. Counts silently doubled; the reconciliation then
#      reported a wrong ratio in a line that looked entirely normal.
#   2. THE ARITHMETIC. The converted count summed the table's cells and dropped
#      only the last one (Aliases), so Mappings and Invariants -- which are not
#      converted resources -- were counted as if they were. On the reference
#      module that was invisible only because `-d` drives Mappings to 0; without
#      `-d` goFSH reports 12 Mappings and the count is 12 too high.
#
# Both are fixed at the cause here, and the cause of the class is that the
# parsing lived in prose that each caller retyped. The fix for (1) is twofold:
# `migration-log.sh run` now truncates each raw log per invocation, so the file
# holds ONE conversion; and this script anchors to the LAST table anyway and
# WARNs loudly (`stale-raw-log:`) if it finds more than one, because a log
# assembled some other way must not silently produce a plausible wrong number.
# The fix for (2) is that cells are read WITH THEIR LABELS from the table's own
# header rows and classified by name -- so the arithmetic states which kinds it
# counts, and an unrecognized label is a refusal rather than a guess.
#
# WHAT COUNTS AS A CONVERTED RESOURCE. Every FSH entity goFSH writes that stands
# for an input resource: Profiles, Extensions, Logicals, Resources, ValueSets,
# CodeSystems, Instances. The other three cells are derived, not converted --
# Invariants and Mappings are parts OF a profile (a single StructureDefinition
# contributes many), and Aliases are URL shorthands goFSH mints for readability.
# Counting any of them would compare a per-resource input count against a
# per-fragment output count.
#
# USAGE
#
#   gofsh-results.sh --log FILE --inputs N [--exit N] [--step S] [--action A]
#
#     --log FILE    the goFSH raw log written by `migration-log.sh run --raw-log`
#     --inputs N    the input count from §5.1b.2 (a), counted BY CONTENT
#     --exit N      goFSH's measured exit status, carried into the INFO line
#     --step S      run-log STEP field   (default 5.1b.2)
#     --action A    run-log ACTION field (default gofsh-convert)
#
# Emits (through migration-log.sh, so the format is not hand-assembled):
#   INFO  <step>  <action>  goFSH RESULTS table  profiles=… … aliases=…  converted=…
#   INFO/WARN     the §10.4 ratio: `converted N of M inputs`, plus the mandatory
#                 `silent-partial-success:` WARN when N < M
#
# Exit codes: 0 = read and emitted; 2 = setup error (no log, no table, a table
# cell whose label this script does not model) -- nothing is guessed, and a
# setup error is reported as an ERROR line rather than a silent zero.

set -u

_here() { cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd; }
# shellcheck source=./migration-log.sh
. "$(_here)/migration-log.sh"

STEP=5.1b.2
ACTION=gofsh-convert
LOG=""
INPUTS=""
GEXIT=""

while [ $# -gt 0 ]; do
  case "$1" in
    --log)    LOG="${2:-}";    shift 2 || true ;;
    --inputs) INPUTS="${2:-}"; shift 2 || true ;;
    --exit)   GEXIT="${2:-}";  shift 2 || true ;;
    --step)   STEP="${2:-}";   shift 2 || true ;;
    --action) ACTION="${2:-}"; shift 2 || true ;;
    -h|--help)
      sed -n '2,/^set -u/p' "${BASH_SOURCE[0]}" | sed '$d' | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *) printf 'gofsh-results: unknown option %s  exit=2\n' "$1" >&2; exit 2 ;;
  esac
done

if [ -z "$LOG" ] || [ -z "$INPUTS" ]; then
  printf 'gofsh-results: --log FILE and --inputs N are both required  exit=2\n' >&2
  exit 2
fi
case "$INPUTS" in *[!0-9]*|"")
  printf 'gofsh-results: --inputs must be a non-negative integer (got %s)  exit=2\n' "$INPUTS" >&2
  exit 2 ;;
esac
if [ ! -f "$LOG" ]; then
  log_error "$STEP" "$ACTION" \
    "setup: no goFSH log at $LOG  exit=2" \
    "The conversion must run through \`migration-log.sh run --raw-log\` first;" \
    "a missing raw log cannot be read back, and an absent count is not a zero."
  exit 2
fi

# --- locate the CURRENT table -----------------------------------------------
NTABLES=$(grep -c 'GoFSH RESULTS' "$LOG" 2>/dev/null | tr -d ' ')
NTABLES=${NTABLES:-0}
if [ "$NTABLES" -eq 0 ]; then
  log_error "$STEP" "$ACTION" \
    "setup: no \"GoFSH RESULTS\" table in $LOG  tables=0 exit=2" \
    "goFSH prints that table on every run that gets as far as writing output," \
    "so its absence means the conversion did not complete -- read the log."
  exit 2
fi
START=$(grep -n 'GoFSH RESULTS' "$LOG" | tail -1 | cut -d: -f1)
if [ "$NTABLES" -gt 1 ]; then
  log_warn "$STEP" "$ACTION" \
    "stale-raw-log: $LOG holds $NTABLES GoFSH RESULTS tables; reading the LAST (current) one  tables=$NTABLES line=$START" \
    "\`run\` truncates a raw log per invocation, so more than one table means this" \
    "log was assembled another way. The earlier tables are NOT summed -- summing" \
    "them is exactly the defect this anchoring exists to prevent."
fi

# --- read the cells WITH their labels ---------------------------------------
# The table is drawn as alternating label and value rows inside a box:
#   ║ │      Profiles      │    Extensions     │      Logicals      │ ║
#   ║ │         3          │         0         │         0          │ ║
# so a row whose first non-empty cell is numeric is the value row for the label
# row above it. Reading the labels is the point: it is what lets the arithmetic
# below name the kinds it counts instead of trusting a column order.
CELLS=$(tail -n +"$START" "$LOG" | awk '
  BEGIN { FS = "│"; nlab = 0 }
  /^║ *╚/ { exit }
  /^║ *│/ {
    n = 0; isnum = -1
    for (i = 2; i < NF; i++) {
      c = $i
      gsub(/^[ \t]+|[ \t]+$/, "", c)
      n++; cell[n] = c
      if (c != "" && isnum == -1) isnum = (c ~ /^[0-9]+$/) ? 1 : 0
    }
    if (isnum == 1) {
      for (i = 1; i <= n && i <= nlab; i++)
        if (lab[i] != "" && cell[i] != "") printf "%s\t%s\n", tolower(lab[i]), cell[i]
    } else {
      nlab = n
      for (i = 1; i <= n; i++) lab[i] = cell[i]
    }
  }
')

if [ -z "$CELLS" ]; then
  log_error "$STEP" "$ACTION" \
    "setup: the GoFSH RESULTS table in $LOG has no readable label/value rows  exit=2" \
    "Layout is pinned by the goFSH version on the command line; a changed layout" \
    "is a signal to re-measure this script, never to fall back on a guess."
  exit 2
fi

# --- classify and sum --------------------------------------------------------
# CONVERTED_KINDS are the FSH entities that each stand for one input resource;
# DERIVED_KINDS are fragments of, or shorthands for, those entities and are
# reported but never added to the converted count.
CONVERTED_KINDS=" profiles extensions logicals resources valuesets codesystems instances "
DERIVED_KINDS=" invariants mappings aliases "

CONVERTED=0
PAIRS=""
UNKNOWN=""
while IFS="$(printf '\t')" read -r label value; do
  [ -n "$label" ] || continue
  key=$(printf '%s' "$label" | tr -d ' ')
  PAIRS="$PAIRS $key=$value"
  case "$CONVERTED_KINDS" in
    *" $key "*) CONVERTED=$(( CONVERTED + value )); continue ;;
  esac
  case "$DERIVED_KINDS" in
    *" $key "*) continue ;;
  esac
  UNKNOWN="$UNKNOWN $key=$value"
done <<EOF
$CELLS
EOF

if [ -n "$UNKNOWN" ]; then
  log_error "$STEP" "$ACTION" \
    "setup: unmodelled cell(s) in the GoFSH RESULTS table -- refusing to guess whether they are converted resources $UNKNOWN  exit=2" \
    "Counting an unknown kind would inflate or deflate the reconciliation" \
    "silently. Classify it in gofsh-results.sh (CONVERTED_KINDS / DERIVED_KINDS)," \
    "re-measure, and record the goFSH version that introduced it."
  exit 2
fi

log_info "$STEP" "$ACTION" \
  "goFSH RESULTS table (of $NTABLES in the log, the last)$PAIRS  converted=$CONVERTED counted=profiles+extensions+logicals+resources+valuesets+codesystems+instances not_counted=invariants,mappings,aliases  gofsh_log=$LOG"

# --- the reconciliation ------------------------------------------------------
# The continuation quotes goFSH's own warnings, but only those that bear on
# COMPLETENESS. Taking the first warning regardless of relevance put "Encountered
# 6 definition(s) that were missing an id" next to a ratio it says nothing about,
# while the warning that explains the ratio -- "13 XML definition(s) found
# without corresponding JSON definitions … will be ignored" -- was never shown.
# The filter is deliberately narrow rather than "anything that sounds bad": a
# generic `could not` also matches "Could not determine FHIR version. Using
# 4.0.1.", which says nothing about how many resources were converted, and a
# continuation full of near-misses is read as noise within two runs.
# Scope the scan to the CURRENT invocation's warnings: everything after the
# previous run's closing box border, or the start of the file when there is none.
PREV_END=$(sed -n "1,${START}p" "$LOG" | grep -n '^╚' | tail -1 | cut -d: -f1)
WARN_REGION=$(sed -n "$(( ${PREV_END:-0} + 1 )),${START}p" "$LOG")
NWARN=$(printf '%s\n' "$WARN_REGION" | grep -c '^warn' | tr -d ' ')
NWARN=${NWARN:-0}
RELEVANT=$(printf '%s\n' "$WARN_REGION" \
  | grep -E '^warn' \
  | grep -iE 'ignor|without corresponding|no corresponding|json-only|xml-only|only mode|cannot find a definition|cannot reliably export|not converted|skipp|dropp' \
  | cut -c1-150)

CONTS=()
if [ -n "$RELEVANT" ]; then
  CONTS+=("goFSH warnings bearing on completeness ($NWARN warning(s) in total):")
  while IFS= read -r w; do [ -n "$w" ] && CONTS+=("  $w"); done <<EOF
$RELEVANT
EOF
else
  CONTS+=("goFSH warnings: $NWARN, none of them bearing on completeness.")
fi

if [ -n "$GEXIT" ]; then
  log_ratio --exit "$GEXIT" "$STEP" "$ACTION" converted inputs "$INPUTS" "$CONVERTED" "${CONTS[@]}"
else
  log_ratio "$STEP" "$ACTION" converted inputs "$INPUTS" "$CONVERTED" "${CONTS[@]}"
fi
exit 0
