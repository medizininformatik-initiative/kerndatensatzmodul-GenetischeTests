#!/usr/bin/env bash
# fql-scan -- find Simplifier and FQL render directives in narrative pages and
# name the HL7 IG Publisher equivalent for each finding.
#
# It REPORTS ONLY. It never transforms: the transformation takes professional
# judgement per finding, and a script that guessed would violate the skill's
# no-fabrication guardrail. See references/fql-crosswalk.md.
#
# Mapping rules come from references/fql-rules.tsv, which is the single source
# of truth for THIS scanner and is extensible by hand -- add a line
# `LABEL<TAB>ERE-pattern<TAB>recommendation`. (The fhir-ig-analysis skill keeps
# a derived pattern set; the catalog's check_directive_rules.py keeps the two
# label taxonomies in sync.)
#
# Run it from the root of the module repository being migrated:
#
#   fql-scan.sh                          # input/pagecontent, plus implementation-guides
#                                        #   when present (Simplifier layout), RECURSIVE
#   fql-scan.sh some/dir a/file.md       # specific files or directories (dirs recursive)
#   fql-scan.sh --strict                 # exit 1 if anything was found
#
# Exit codes: 0 = scanned (findings are informational without --strict);
# 1 = --strict and findings exist; 2 = setup error: missing rules file, or an
# EMPTY TARGET SET -- an empty scan is never a pass.
#
# OUTPUT FORMAT. Every line follows the migration run-log convention (spec §10):
#
#   <UTC-ISO-8601>  <LEVEL>  <STEP>  <ACTION>  <detail>
#
# with LEVEL one of `INFO `/`WARN `/`ERROR`, STEP the spec section this script
# implements (5.4) and ACTION its slug. Two spaces separate the fields;
# continuation lines are indented four spaces and belong to the line above.
# INFO and WARN go to stdout, ERROR to stderr. Capture both through the run-log
# helper, which preserves this script's exit status:
#
#   bash "$SKILL_DIR/scripts/migration-log.sh" run 5.4 fql-scan \
#     --emits-runlog -- bash "$SKILL_DIR/scripts/fql-scan.sh" --strict
#
# NOT `… 2>&1 | tee -a migration-log/run.log`: a pipeline's status is tee's, so
# that form reports 0 for the exit 1 that `--strict` uses as its CI gate and for
# the exit 2 that an empty target set uses to refuse a false pass.
#
# Bash 3.2 compatible, because macOS still ships 3.2.
#
# Portability note: this resolves its rules file relative to ITSELF, not
# relative to a repository root. The original lived at <repo>/tools/ and did
# `cd "$(dirname "$0")/.."`, which broke the moment the script moved. A skill is
# installed into repositories nobody anticipated, so the only safe anchor is the
# script's own location.
set -u

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_ROOT="$(cd "$SCRIPT_DIR" && cd .. && pwd)"
RULES="$SKILL_ROOT/references/fql-rules.tsv"

STEP="5.4"
ACTION="fql-scan"

# `migration-log.sh run` sets MIGRATION_LOG_WRAPPED=1 in the wrapped command's
# environment. It has already logged a `start` line carrying the command ACTUALLY
# executed, and will log the matching `done`; emitting a second pair here gave ONE
# execution two `start` lines, two `done` lines and two different `cmd=` values,
# which a reader has no way to reconcile. Wrapped, this script drops its own
# `cmd=` and calls its two lines what they are: the parameters it resolved, and
# the result it measured. Run directly -- still supported -- nothing changes.
if [ "${MIGRATION_LOG_WRAPPED:-}" = 1 ]; then
  OPEN_WORD="params"; CLOSE_WORD="result"
else
  OPEN_WORD="start"; CLOSE_WORD="done"
fi

ts() { date -u +%Y-%m-%dT%H:%M:%SZ; }
# log LEVEL DETAIL -- one run-log line. ERROR goes to stderr, everything else to
# stdout; the helper's `run --emits-runlog` merges them into the run log while
# keeping this script's exit status.
log() {
  _lvl="$1"; shift
  case "$_lvl" in
    ERROR) printf '%s  ERROR  %s  %s  %s\n' "$(ts)" "$STEP" "$ACTION" "$*" >&2 ;;
    WARN)  printf '%s  WARN   %s  %s  %s\n' "$(ts)" "$STEP" "$ACTION" "$*" ;;
    *)     printf '%s  INFO   %s  %s  %s\n' "$(ts)" "$STEP" "$ACTION" "$*" ;;
  esac
}
cont()  { printf '    %s\n' "$*"; }
conterr() { printf '    %s\n' "$*" >&2; }

STRICT=0
ARGS=""
for a in "$@"; do
  case "$a" in
    --strict) STRICT=1 ;;
    -h|--help) sed -n '2,49p' "$0"; exit 0 ;;
    *) ARGS="$ARGS $a" ;;
  esac
done
DEFAULTED=0
if [ -z "$ARGS" ]; then
  DEFAULTED=1
  ARGS="input/pagecontent"
  # A Simplifier project keeps its narrative under implementation-guides/**/*.page.md.
  # A pre-migration scan that misses those reads "0 directives" on a module that has
  # hundreds -- so the default includes the directory whenever it exists.
  [ -d implementation-guides ] && ARGS="$ARGS implementation-guides"
fi

if [ ! -f "$RULES" ]; then
  log ERROR "setup: rules file not found  path=$RULES  exit=2"
  conterr "The skill directory appears incomplete -- references/fql-rules.tsv is required."
  exit 2
fi

if [ "$OPEN_WORD" = params ]; then
  log INFO "params  rules=$RULES  targets=$ARGS  defaulted=$DEFAULTED"
else
  log INFO "start  cmd=\`fql-scan.sh $*\`  rules=$RULES  targets=$ARGS  defaulted=$DEFAULTED"
fi

# Collect target files (.md only; directories are searched RECURSIVELY -- a flat
# glob missed the nested implementation-guides/**/*.page.md layout entirely).
TARGETS=""
EMPTY_DIRS=""
for p in $ARGS; do
  if [ -d "$p" ]; then
    n=0
    for f in $(find "$p" -type f -name '*.md' | sort); do
      TARGETS="$TARGETS $f"; n=$((n + 1))
    done
    log INFO "target  path=$p  kind=dir  files=$n"
    [ "$n" -eq 0 ] && EMPTY_DIRS="$EMPTY_DIRS $p"
  elif [ -f "$p" ]; then
    TARGETS="$TARGETS $p"
    log INFO "target  path=$p  kind=file  files=1"
  else
    log WARN "target  path=$p  kind=missing  files=0 -- no such file or directory"
  fi
done
if [ -z "$TARGETS" ]; then
  log ERROR "setup: empty target set  files=0  targets=$ARGS  exit=2"
  conterr "An empty scan is never a pass. Point the scanner at the narrative"
  conterr "sources (input/pagecontent, or implementation-guides for a"
  conterr "Simplifier project), or run it from the module repository's root."
  exit 2
fi
NFILES=0
for f in $TARGETS; do NFILES=$((NFILES + 1)); done
# Silent-partial-success guard (spec §10): the scan is about to report a healthy
# file count while one of the named directories contributed nothing to it.
if [ -n "$EMPTY_DIRS" ]; then
  log WARN "silent-partial-success: scanning $NFILES file(s), but 0 of them came from:$EMPTY_DIRS"
  cont "A directory that yields no .md is usually the wrong one -- after migration"
  cont "the German pages live under input/translations/<lang>/pagecontent."
fi

total=0
MATCHED=""   # "file:line" per specific-rule hit, so the unknown pass can skip them

while IFS="$(printf '\t')" read -r label regex recommendation; do
  case "$label" in ''|\#*) continue ;; esac
  [ -n "$regex" ] || continue
  for f in $TARGETS; do
    while IFS= read -r hit; do
      [ -n "$hit" ] || continue
      ln="${hit%%:*}"
      txt="${hit#*:}"
      snip="$(printf '%s' "$txt" | sed 's/^[[:space:]]*//' | cut -c1-80)"
      log INFO "finding  at=$f:$ln  [$label]"
      cont "found:  $snip"
      cont "action: $recommendation"
      MATCHED="$MATCHED
$f:$ln"
      total=$((total + 1))
    done <<EOF
$(grep -nE "$regex" "$f" 2>/dev/null)
EOF
  done
done < "$RULES"

# Second pass: directive-shaped lines that no rule covered. An [UNKNOWN] is the
# signal to add a rule, not to ignore the line -- so it is a WARN, not an INFO:
# the mapped-findings count understates the work until every one is classified.
unknown=0
GENERIC='\{\{[A-Za-z]|<fql|@```|</?tab'
for f in $TARGETS; do
  while IFS= read -r hit; do
    [ -n "$hit" ] || continue
    ln="${hit%%:*}"
    txt="${hit#*:}"
    case "$MATCHED" in *"$f:$ln"*) continue ;; esac
    snip="$(printf '%s' "$txt" | sed 's/^[[:space:]]*//' | cut -c1-80)"
    log WARN "finding  at=$f:$ln  [UNKNOWN]"
    cont "found:  $snip"
    cont "action: no rule matched -- review, and add a line to fql-rules.tsv if it recurs."
    unknown=$((unknown + 1))
  done <<EOF
$(grep -nE "$GENERIC" "$f" 2>/dev/null)
EOF
done

total_all=$((total + unknown))
if [ "$STRICT" = 1 ] && [ "$total_all" -gt 0 ]; then
  log INFO "$CLOSE_WORD  mapped=$total unknown=$unknown files=$NFILES strict=1  exit=1"
  cont "Transform per references/fql-crosswalk.md; when in doubt mark TODO:REVIEW."
  exit 1
fi
if [ "$total_all" -eq 0 ]; then
  log INFO "$CLOSE_WORD  mapped=0 unknown=0 files=$NFILES  exit=0  no directives found"
else
  log INFO "$CLOSE_WORD  mapped=$total unknown=$unknown files=$NFILES  exit=0"
  cont "Transform per references/fql-crosswalk.md; when in doubt mark TODO:REVIEW."
  cont "Rule missing or imprecise? Add a line to $RULES (LABEL<TAB>ERE-pattern<TAB>recommendation)."
fi
exit 0
