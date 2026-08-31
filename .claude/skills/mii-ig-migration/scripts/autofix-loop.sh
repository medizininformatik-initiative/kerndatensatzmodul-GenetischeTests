#!/usr/bin/env bash
# autofix-loop -- verify, fix ONLY what is allowlisted, verify again, revert
# anything that did not clear, and stop -- after three iterations at the latest.
#
# WHAT IT IS FOR. The verification phase (spec §11) produces findings faster than
# a human can work them, and a handful of them are mechanical: an artefact of a
# conversion tool, a link into deleted template scaffolding, a missing
# translation UNIT (not a translation), a stale vendored template. Fixing those
# by hand is busywork. Fixing them automatically is dangerous unless the loop is
# safe BY CONSTRUCTION -- which is what this file is.
#
# THE SAFETY PROPERTIES, each mechanised rather than asserted:
#
#   ALLOWLIST, NEVER BLOCKLIST. The default is do-not-fix. A finding is fixable
#   only when the verifier ASSIGNED it a class and that class is in
#   `autofix-fix.py classes` AND in this script's --allow set. Two independent
#   lists have to agree; a new class cannot arrive by accident.
#
#   EVERY FIX IS TIED TO ONE FINDING, by the finding's STABLE id (a hash of
#   check+subject, not a sequence number -- so "did the one I targeted clear?"
#   survives a re-run that renumbers nothing).
#
#   SNAPSHOT FIRST. The fixer must declare every path it may touch (`plan`)
#   BEFORE it runs; those paths are tarred into
#   migration-log/autofix/iter<N>/<finding>/before.tar. A path the plan does not
#   name cannot be reverted, so the fixer refuses to write outside it.
#
#   RE-VERIFY, THEN REVERT WHAT DID NOT CLEAR. A fix counts only if the CHECK
#   THAT RAISED THE FINDING clears afterwards. If the finding is still there, the
#   fix is reverted from its snapshot and escalated. A half-fix left in the tree
#   is worse than the finding: it is a change nobody asked for, attached to a
#   problem nobody solved.
#
#   NO-PROGRESS STOP. If the finding set does not SHRINK between iterations, the
#   loop stops immediately. Repeating a fix that is not working is how an
#   automated loop turns one defect into a diff nobody can review.
#
#   HARD CEILING OF THREE. Unconditional. Whatever remains is escalated.
#
# WHY THE GUARDRAILS ASSUME CONFIDENT-AND-WRONG IS NORMAL. On one day this
# project shipped three "high-confidence" claims that were wrong: that IG page
# titles do not localize; that Simplifier is not scrapeable; and the shape of a
# guide-key attribute measured on one module and false on two others. A loop
# whose safety rested on its author's confidence would have amplified each of
# them. This one rests on a re-measurement instead -- and on being cheap to undo.
#
# NEVER AUTO-FIXED, and not configurable: identity (canonical, packageId,
# licence, publisher, version), narrative content, anything the SOURCE declares
# (a source defect is escalated to its maintainers, never patched here), and
# anything needing a judgement call. Those are the report's ① decision queue.
#
# USAGE
#
#   bash autofix-loop.sh --skill-dir DIR [--target DIR] [options]
#
#     --skill-dir DIR   the directory containing SKILL.md (required: this script
#                       calls its siblings, and a bare `scripts/...` from the
#                       project root would silently run the PROJECT's script)
#     --target DIR      the migrated repository (default: .)
#     --max-iterations N  hard ceiling, default 3, never more than 3
#     --allow LIST      comma-separated classes to permit (default: every class
#                       `autofix-fix.py classes` lists that needs no rebuild)
#     --rebuild-cmd CMD a command that rebuilds the IG. Without it the classes
#                       whose confirming check reads the RENDERED output are not
#                       offered at all -- nothing could confirm them
#     --verify-arg ARG  passed through to verify-migration.py (repeatable)
#     --dry-run         plan and report; write nothing
#     -h, --help        this text
#
# Exit codes: 0 = no divergence left · 1 = findings remain (escalated) ·
#             2 = setup error · 3 = verification could not run.
#
# Every action is appended to migration-log/autofix.tsv:
#   iteration, finding, class, status, files, why, cleared
# so a reviewer can audit each fix and revert it individually with the snapshot
# beside it.

set -u

MAXIT=3
TARGET="."
SKILL_DIR=""
ALLOW=""
REBUILD=""
DRYRUN=0
VERIFY_ARGS=()

while [ $# -gt 0 ]; do
  case "$1" in
    --skill-dir) SKILL_DIR="${2:-}"; shift 2 || true ;;
    --target) TARGET="${2:-}"; shift 2 || true ;;
    --max-iterations) MAXIT="${2:-3}"; shift 2 || true ;;
    --allow) ALLOW="${2:-}"; shift 2 || true ;;
    --rebuild-cmd) REBUILD="${2:-}"; shift 2 || true ;;
    --verify-arg) VERIFY_ARGS+=("${2:-}"); shift 2 || true ;;
    --dry-run) DRYRUN=1; shift ;;
    -h|--help) sed -n '2,/^set -u/p' "$0" | sed '$d' | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) printf 'autofix-loop: unknown option %s  exit=2\n' "$1" >&2; exit 2 ;;
  esac
done

if [ -z "$SKILL_DIR" ] || [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  printf 'autofix-loop: --skill-dir must name the directory containing SKILL.md  exit=2\n' >&2
  exit 2
fi
case "$MAXIT" in
  ''|*[!0-9]*) printf 'autofix-loop: --max-iterations must be a number  exit=2\n' >&2; exit 2 ;;
esac
# The ceiling is not a preference. Three iterations is the documented bound
# (spec §12.3); a caller asking for more gets three.
[ "$MAXIT" -le 3 ] || MAXIT=3

# Every path below is absolute. The snapshot is written from inside $TARGET (tar
# needs relative members so a restore lands in the right place), so a relative
# snapshot path would resolve against the WRONG directory -- and a snapshot
# written somewhere unexpected is a revert that silently does nothing.
if [ ! -d "$TARGET" ]; then
  printf 'autofix-loop: --target is not a directory: %s  exit=2\n' "$TARGET" >&2; exit 2
fi
TARGET=$(cd "$TARGET" && pwd)

# BEFORE sourcing the helper: it fixes MIGRATION_LOG_DIR with `:=` on source, so
# setting it afterwards is a no-op. A repository migrated before the rename
# carries `.ai-log/` and sets this itself (spec §10.1); that value is honoured,
# only made absolute.
if [ -n "${MIGRATION_LOG_DIR:-}" ]; then
  case "$MIGRATION_LOG_DIR" in /*) ;; *) MIGRATION_LOG_DIR="$TARGET/$MIGRATION_LOG_DIR" ;; esac
else
  MIGRATION_LOG_DIR="$TARGET/migration-log"
fi
export MIGRATION_LOG_DIR

. "$SKILL_DIR/scripts/migration-log.sh"

STEP="12"
ACTION="autofix-loop"
VERIFY="$SKILL_DIR/scripts/verify-migration.py"
FIXER="$SKILL_DIR/scripts/autofix-fix.py"
FINDINGS="$MIGRATION_LOG_DIR/verification-findings.tsv"
AUDIT="$MIGRATION_LOG_DIR/autofix.tsv"
SNAPROOT="$MIGRATION_LOG_DIR/autofix"

for f in "$VERIFY" "$FIXER"; do
  [ -f "$f" ] || { printf 'autofix-loop: missing %s  exit=2\n' "$f" >&2; exit 2; }
done

mkdir -p "$SNAPROOT" 2>/dev/null || {
  printf 'autofix-loop: cannot create %s  exit=2\n' "$SNAPROOT" >&2; exit 2; }
[ -s "$AUDIT" ] || printf 'iteration\tfinding\tclass\tstatus\tfiles\twhy\tcleared\n' >"$AUDIT"

# --- the two allowlists, intersected ----------------------------------------
# `autofix-fix.py classes` is the single definition; --allow narrows it. A class
# needing a rebuild is dropped unless one was supplied, because its confirming
# check reads the rendered output and an unconfirmable fix is not applied.
CLASSES_TSV=$(python3 "$FIXER" classes)
AVAILABLE=""
while IFS=$'\t' read -r CLS CHECK REQS _WHY; do
  [ "$CLS" = "class" ] && continue
  [ -n "$CLS" ] || continue
  if [ "$REQS" = "rebuild" ] && [ -z "$REBUILD" ]; then
    log_info "$STEP" "$ACTION" \
      "class not offered  class=$CLS confirming_check=$CHECK requires=rebuild" \
      "Its confirming check reads the RENDERED output. Without --rebuild-cmd nothing" \
      "could re-measure it, and a fix nobody can confirm is not applied (spec §12.2)."
    continue
  fi
  if [ -n "$ALLOW" ]; then
    case ",$ALLOW," in *",$CLS,"*) ;; *) continue ;; esac
  fi
  AVAILABLE="$AVAILABLE $CLS"
done <<EOF
$CLASSES_TSV
EOF
AVAILABLE="${AVAILABLE# }"

log_info "$STEP" "$ACTION" \
  "start  target=$TARGET max_iterations=$MAXIT dry_run=$DRYRUN allowlist=[${AVAILABLE:-none}]" \
  "ALLOWLIST, never blocklist: the default is do-not-fix. Identity, narrative," \
  "anything the SOURCE declares and every judgement call are excluded by" \
  "construction and cannot be enabled by an option."

# --- helpers ----------------------------------------------------------------

_verify() {
  # The verifier's non-zero statuses are its RESULT (1 = divergence, 3 = a check
  # could not be mechanised), not a failure -- marked as such so the log does not
  # call its own expected outcome an error.
  run_step 11 verify-migration --emits-runlog \
    --expected-nonzero 'verification findings are this step OUTPUT (1 = DIVERGIERT, 3 = NICHT PRUEFBAR)' \
    -- python3 "$VERIFY" --target "$TARGET" --findings "$FINDINGS" \
       --markdown "$MIGRATION_LOG_DIR/verification.md" \
       ${VERIFY_ARGS[@]+"${VERIFY_ARGS[@]}"}
  return $?
}

_count_divergent() {
  awk -F'\t' 'NR>1 && $4=="DIVERGIERT" {n++} END {print n+0}' "$FINDINGS" 2>/dev/null
}

_fixable_ids() {
  awk -F'\t' -v allow=" $AVAILABLE " \
    'NR>1 && $4=="DIVERGIERT" && $7!="-" && index(allow, " " $7 " ") {print $1 "\t" $7}' \
    "$FINDINGS" 2>/dev/null
}

_snapshot() {  # _snapshot SNAPDIR PLANFILE
  local snapdir="$1" plan="$2" existing=()
  mkdir -p "$snapdir" || return 1
  : >"$snapdir/created.txt"
  while IFS= read -r p; do
    [ -n "$p" ] || continue
    case "$p" in
      +*) printf '%s\n' "${p#+}" >>"$snapdir/created.txt" ;;
      *)  existing+=("$p") ;;
    esac
  done <"$plan"
  if [ ${#existing[@]} -gt 0 ]; then
    ( cd "$TARGET" && tar -cf "$snapdir/before.tar" "${existing[@]}" ) 2>/dev/null || return 1
  fi
  return 0
}

_restore() {  # _restore SNAPDIR
  local snapdir="$1"
  if [ -f "$snapdir/before.tar" ]; then
    ( cd "$TARGET" && tar -xf "$snapdir/before.tar" ) || return 1
  fi
  while IFS= read -r p; do
    [ -n "$p" ] || continue
    rm -rf "$TARGET/$p"
  done <"$snapdir/created.txt" 2>/dev/null
  return 0
}

_still_open() {  # _still_open FINDING_ID
  awk -F'\t' -v id="$1" 'NR>1 && $1==id && $4=="DIVERGIERT" {found=1} END {exit found?0:1}' \
    "$FINDINGS" 2>/dev/null
}

# --- the loop ---------------------------------------------------------------

_verify; VSTATUS=$?
if [ "$VSTATUS" -eq 2 ]; then
  log_error "$STEP" "$ACTION" "verification could not run  exit=3" \
    "Nothing was fixed. Fix the setup error the verifier reported and re-run."
  exit 3
fi
COUNT=$(_count_divergent)
log_info "$STEP" "$ACTION" "baseline  divergiert=$COUNT findings=$FINDINGS"

# WHICH STOP FIRED, ALWAYS SAID OUT LOUD. Four stops can end this loop and only
# one of them used to announce itself, so a run that halted with findings still
# open logged nothing about WHY -- the same silent gap the verifier exists to
# close, committed by its own repair loop.
#
# THE CEILING IS THE OUTERMOST OF THE FOUR, AND IT IS NEARLY UNREACHABLE. One
# iteration applies EVERY fixable finding it can see, so a second iteration has
# work only if the first one's fixes (or the rebuild between them) created NEW
# fixable findings; a third needs that to happen twice running, with the total
# strictly shrinking each time. Measured: across the four real migrations it has
# never fired -- every run ends at `clean` or at `no-fixable`. It is kept because
# it is the one stop that does not depend on the loop's own bookkeeping being
# right: if the shrink test or the fixable-set test were ever wrong, this is what
# still bounds the run. That is a backstop, not dead code -- but calling it "the"
# stop, as the prose used to, described a path almost no run takes.
PREV=""
IT=0
STOP_REASON=clean
while [ "$IT" -lt "$MAXIT" ]; do
  [ "$COUNT" -gt 0 ] || { STOP_REASON=clean; break; }
  if [ -n "$PREV" ] && [ "$COUNT" -ge "$PREV" ]; then
    STOP_REASON=no-progress
    log_warn "$STEP" "$ACTION" \
      "autofix-no-progress: the finding set did not shrink  before=$PREV after=$COUNT" \
      "Stopping immediately rather than iterating. A loop that keeps applying fixes" \
      "which change nothing produces a diff nobody can review, attached to defects" \
      "nobody solved. Everything remaining is escalated to the report's ① queue."
    break
  fi
  PREV="$COUNT"
  IT=$((IT + 1))
  STOP_REASON=ceiling          # overwritten by whichever stop actually fires

  FIXES=$(_fixable_ids)
  if [ -z "$FIXES" ]; then
    STOP_REASON=no-fixable
    log_info "$STEP" "$ACTION" \
      "iteration $IT: no fixable findings  divergiert=$COUNT fixable=0" \
      "Every remaining finding is outside the allowlist by design -- identity," \
      "narrative, a source defect, or a judgement call. They are escalated."
    break
  fi

  APPLIED=""
  while IFS=$'\t' read -r ID CLS; do
    [ -n "$ID" ] || continue
    SNAPDIR="$SNAPROOT/iter$IT/$ID"
    mkdir -p "$SNAPDIR"
    PLAN="$SNAPDIR/plan.txt"
    if ! python3 "$FIXER" plan --class "$CLS" --finding "$ID" \
           --findings "$FINDINGS" --target "$TARGET" >"$PLAN" 2>"$SNAPDIR/plan.err"; then
      log_warn "$STEP" "$ACTION" \
        "autofix-skipped: could not plan the fix  finding=$ID class=$CLS" \
        "$(head -1 "$SNAPDIR/plan.err" 2>/dev/null)"
      printf '%s\t%s\t%s\tplan-failed\t\t%s\t\n' "$IT" "$ID" "$CLS" \
        "the fixer could not name the paths it would touch" >>"$AUDIT"
      continue
    fi
    if [ "$DRYRUN" = 1 ]; then
      log_info "$STEP" "$ACTION" \
        "dry-run: would apply  finding=$ID class=$CLS paths=$(wc -l <"$PLAN" | tr -d ' ')"
      printf '%s\t%s\t%s\tdry-run\t%s\t%s\t\n' "$IT" "$ID" "$CLS" \
        "$(tr '\n' ',' <"$PLAN")" "planned only" >>"$AUDIT"
      continue
    fi
    if ! _snapshot "$SNAPDIR" "$PLAN"; then
      log_error "$STEP" "$ACTION" \
        "autofix-skipped: could not snapshot the planned paths  finding=$ID class=$CLS" \
        "A fix that cannot be reverted is not applied. This is the guardrail working."
      printf '%s\t%s\t%s\tsnapshot-failed\t\t%s\t\n' "$IT" "$ID" "$CLS" \
        "no snapshot, so no revert, so no fix" >>"$AUDIT"
      continue
    fi
    OUT=$(python3 "$FIXER" apply --class "$CLS" --finding "$ID" --findings "$FINDINGS" \
            --target "$TARGET" --skill-dir "$SKILL_DIR" 2>&1)
    RC=$?
    printf '%s\n' "$OUT" >"$SNAPDIR/apply.log"
    FILES=$(printf '%s' "$OUT" | sed -n 's/.*files=\([^ ]*\).*/\1/p' | tail -1)
    case "$RC" in
      0) log_info "$STEP" "$ACTION" \
           "fix applied  iteration=$IT finding=$ID class=$CLS files=${FILES:-?}" \
           "Not yet 'fixed': it counts only if the check that raised it clears below."
         printf '%s\t%s\t%s\tapplied\t%s\t%s\t\n' "$IT" "$ID" "$CLS" "${FILES:-}" \
           "mechanical, reversible, self-confirming" >>"$AUDIT"
         APPLIED="$APPLIED $ID:$CLS:$SNAPDIR" ;;
      3) log_info "$STEP" "$ACTION" \
           "fix changed nothing  finding=$ID class=$CLS" \
           "The finding no longer describes this tree. Left alone; the next" \
           "verification decides."
         printf '%s\t%s\t%s\tno-change\t\t%s\t\n' "$IT" "$ID" "$CLS" \
           "nothing to change" >>"$AUDIT" ;;
      *) _restore "$SNAPDIR"
         log_warn "$STEP" "$ACTION" \
           "autofix-refused: the fixer declined or failed  finding=$ID class=$CLS exit=$RC" \
           "$(printf '%s' "$OUT" | tail -1)" \
           "Tree restored from the snapshot; the finding is escalated."
         printf '%s\t%s\t%s\trefused\t\t%s\t\n' "$IT" "$ID" "$CLS" \
           "fixer exit $RC -- nothing kept" >>"$AUDIT" ;;
    esac
  done <<EOF
$FIXES
EOF

  if [ -z "$APPLIED" ]; then
    STOP_REASON=nothing-applied
    log_info "$STEP" "$ACTION" "iteration $IT applied nothing -- stopping"
    break
  fi

  if [ -n "$REBUILD" ]; then
    run_step 12 autofix-rebuild --expected-nonzero \
      'a rebuild may legitimately still report findings; the verification below decides' \
      -- bash -c "cd '$TARGET' && $REBUILD"
  fi

  _verify; VSTATUS=$?
  COUNT=$(_count_divergent)

  for ENTRY in $APPLIED; do
    ID="${ENTRY%%:*}"; REST="${ENTRY#*:}"; CLS="${REST%%:*}"; SNAPDIR="${REST#*:}"
    if _still_open "$ID"; then
      if _restore "$SNAPDIR"; then
        log_warn "$STEP" "$ACTION" \
          "autofix-reverted: the finding it targeted did NOT clear  finding=$ID class=$CLS" \
          "Reverted from $SNAPDIR/before.tar and escalated. A half-fix left in the" \
          "tree is worse than the finding: an unexplained change attached to an" \
          "unsolved problem. Being wrong here is expected -- being wrong and" \
          "LEAVING IT is what this revert prevents."
        printf '%s\t%s\t%s\treverted\t\t%s\tno\n' "$IT" "$ID" "$CLS" \
          "targeted finding still open after re-verification" >>"$AUDIT"
      else
        log_error "$STEP" "$ACTION" \
          "autofix-revert-failed: could not restore  finding=$ID snapshot=$SNAPDIR" \
          "Restore it by hand: tar -xf $SNAPDIR/before.tar -C $TARGET"
        printf '%s\t%s\t%s\trevert-failed\t\t%s\tno\n' "$IT" "$ID" "$CLS" \
          "manual restore required" >>"$AUDIT"
      fi
    else
      log_info "$STEP" "$ACTION" "fix confirmed  finding=$ID class=$CLS cleared=yes"
      printf '%s\t%s\t%s\tconfirmed\t\t%s\tyes\n' "$IT" "$ID" "$CLS" \
        "the check that raised it clears" >>"$AUDIT"
    fi
  done

  # Reverts change the tree, so the count above is stale where any happened.
  if grep -q "	reverted	" "$AUDIT" 2>/dev/null; then
    _verify; VSTATUS=$?
    COUNT=$(_count_divergent)
  fi
done

[ "$COUNT" -gt 0 ] || STOP_REASON=clean
if [ "$STOP_REASON" = ceiling ] && [ "$COUNT" -gt 0 ]; then
  log_warn "$STEP" "$ACTION" \
    "autofix-ceiling: stopped after $IT iterations with $COUNT finding(s) open" \
    "The ceiling is unconditional (spec §12.3) and is the OUTERMOST of four" \
    "stops -- reaching it means every iteration shrank the set and still found" \
    "new fixable findings, which no real migration has done. Whatever is left" \
    "is a human's: it goes to the report's ① decision queue, named individually."
elif [ "$COUNT" -gt 0 ]; then
  log_warn "$STEP" "$ACTION" \
    "autofix-stopped: reason=$STOP_REASON  iterations=$IT open=$COUNT" \
    "Named so the run's end is never inferred from the absence of a line." \
    "The $COUNT open finding(s) go to the report's ① decision queue."
fi

CONFIRMED=$(awk -F'\t' '$4=="confirmed" {n++} END {print n+0}' "$AUDIT")
REVERTED=$(awk -F'\t' '$4=="reverted" {n++} END {print n+0}' "$AUDIT")
log_info "$STEP" "$ACTION" \
  "done  iterations=$IT stop=$STOP_REASON divergiert=$COUNT confirmed=$CONFIRMED reverted=$REVERTED audit=$AUDIT" \
  "Every row of $AUDIT names what changed, why, which finding it targeted and" \
  "whether that finding cleared -- and the snapshot beside it reverts that one" \
  "fix alone."
[ "$COUNT" -eq 0 ] && exit 0
exit 1
