#!/usr/bin/env bash
# migration-log -- emit the migration run log (spec §10) and wrap a command so
# that what it ran, what it produced and what it EXITED WITH all reach the log.
#
# The run log exists so that a human reader can reconstruct, afterwards, WHICH
# STEPS RAN AND WHAT EACH ONE PRODUCED -- without re-running anything, and
# without trusting anybody's recollection. This file is what makes that
# affordable: without it, only the three bundled scripts emitted run-log lines
# and every step that runs no bundled script (goFSH, SUSHI, the IG Publisher,
# every judgement a human or an agent makes) was invisible.
#
# It is BOTH a sourceable library and a CLI, because an agent's shell state does
# not survive between tool calls:
#
#   . "$SKILL_DIR/scripts/migration-log.sh"          # library
#   log_info 2.1 read-identity "packageId=de.medizininformatikinitiative.kerndatensatz.consent"
#
#   bash "$SKILL_DIR/scripts/migration-log.sh" \     # one-shot CLI, same output
#     info 2.1 read-identity "packageId=…"
#
# SUBCOMMANDS / FUNCTIONS
#
#   info|warn|error STEP ACTION DETAIL [CONT ...]
#   log_info|log_warn|log_error STEP ACTION DETAIL [CONT ...]
#       One run-log line, plus one four-space-indented continuation line per
#       CONT. Appends to the run log AND echoes to the terminal (INFO/WARN on
#       stdout, ERROR on stderr, matching the bundled scripts).
#
#   ratio [--exit N] STEP ACTION VERB NOUN EXPECTED ACTUAL [CONT ...]
#   log_ratio  (same signature)
#       The §10.4 mandatory-WARN rule, mechanized. Emits an INFO naming both
#       numbers; when ACTUAL < EXPECTED it emits a WARN as well, whose detail
#       begins with the greppable token `silent-partial-success:`. This is the
#       rule that catches a tool reporting success while producing less than its
#       input implies -- goFSH without `-t json-and-xml` above all. Comparing the
#       two counts is the CALLER's job; this helper is what makes the comparison
#       visible instead of happening in someone's head.
#
#   claim STEP ACTION FIELD VALUE TIER SOURCE [CONT ...]
#   log_claim  (same signature)
#       Record ONE identity field recovered from ONE source, with the evidence
#       (spec §2.1). Appends to the per-field ledger
#       `migration-log/identity-claims.tsv` and emits an INFO naming the field,
#       the value, the tier and the source it was read from.
#
#       Its real job is the SECOND claim for the same field. When an earlier
#       claim carries a DIFFERENT value, it emits a WARN beginning
#       `identity-contradiction:` naming both values with their tiers -- and
#       resolves nothing. Two sources disagreeing about a published module's
#       version or licence is a finding for Gate A, not a precedence puzzle to
#       settle in a script: measured on the reference module, goFSH's derived
#       config says `version: 1.0.8` where the published package says
#       `2026.0.0`, and a pipeline that silently preferred either one would have
#       re-versioned a published module without anybody seeing it happen.
#       TIER is the §2.1 rank letter (C, P, J, I, R, H, G, T), used for the
#       report, never to suppress the WARN.
#
#   claims [--markdown]
#       Read the ledger back: one row per field per source, contradictions
#       marked. `--markdown` prints the table the migration report's identity
#       section takes verbatim. Reads only; exits 1 when the ledger holds a
#       contradiction, so it doubles as a CI gate.
#
#   begin [LABEL]
#   log_begin  (same signature)
#       A run-boundary line. run.log is append-only across invocations, so a
#       second run of a documented block would otherwise concatenate into the
#       first with nothing separating them. `begin` writes one numbered marker
#       -- `run-boundary  ===== run <N> starts` -- so a reader can tell which
#       lines belong to which invocation. Call it once, first, in every block.
#
#   run STEP ACTION [--emits-runlog] [--raw-log FILE] [--expected-nonzero WHY]
#       -- CMD [ARG ...]
#   run_step   (same signature)
#       Run CMD, write its combined output to a per-step raw log under the log
#       directory, emit an INFO carrying the command ACTUALLY EXECUTED and its
#       MEASURED exit status, emit an ERROR when that status is non-zero -- and
#       RETURN THE COMMAND'S REAL EXIT STATUS, taken from PIPESTATUS[0].
#
#       That last part is the reason this wrapper exists. The convention it
#       replaces was `cmd 2>&1 | tee -a migration-log/run.log`, and a pipeline's
#       status is its LAST command's: `tee` succeeds, so a step that failed read
#       as a step that passed. Measured: postprocess-gofsh.py on a too-narrow
#       FSH_DIR exits 1, through that pipeline the shell reported 0. Acceptance
#       criteria in this skill ARE exit statuses, so that discarded them all.
#
#       THE RAW LOG IS TRUNCATED PER INVOCATION -- it holds the output of the
#       CURRENT run of that ACTION and nothing else. It used to be appended to,
#       and that made every read-back of it wrong on a re-run: a second run in
#       the same directory left two goFSH RESULTS tables in one file, and a
#       parse that summed them reported inflated counts while the run.log line
#       that reported them looked entirely normal. Re-running a step after
#       adjusting a flag is the ordinary case, not the exotic one, so the
#       per-invocation file is the safe default and the run log -- which IS
#       append-only -- keeps the history of what each attempt measured. The
#       immediately preceding attempt is not thrown away: it is rolled over to
#       `<ACTION>.prev.log` and named in the start line as `prev_raw_log=`.
#
#       `--expected-nonzero WHY` marks a step whose non-zero exit is the
#       ANTICIPATED, documented outcome -- the shape-B `sushi-after` run, whose
#       residual unresolvable-parent errors are a Gate-A escalation (spec
#       §5.1b.4), not a defect to fix. Such a step logs a WARN beginning
#       `anticipated-nonzero-exit:` instead of the generic ERROR, so the log
#       stops telling its reader that the expected result was a failure. The
#       status is still returned verbatim, the line still demands a queue entry,
#       and an unmarked step still ERRORs exactly as before.
#
#       `--emits-runlog` says CMD already prints run-log-format lines (the three
#       bundled scripts do); its output is then appended to the run log as well
#       as to the raw log, so tool and skill output stay one chronological
#       stream. Without it only the wrapper's own lines reach the run log and
#       the raw output is referenced from them by path. `run` exports
#       MIGRATION_LOG_WRAPPED=1 to the wrapped command; the bundled scripts read
#       it and demote their own `start`/`done` lines to `params`/`result`, so
#       ONE execution produces one `start`, one `done` and one `cmd=` value
#       rather than two of each.
#
#       EXIT STATUS IS EIGHT BITS. The shell reports a status modulo 256, so a
#       tool whose status IS its error count -- SUSHI's is -- reports 0 for
#       exactly 256 errors, and 5 for 261. `run` therefore cross-checks the
#       status against the error count parsed out of the raw log and WARNs
#       (`exit-status-truncated:` / `exit-status-disagrees:`) rather than
#       letting a clean-looking 0 stand unchallenged.
#
# ORDERING. Every line is appended to the run log by this script itself, with a
# single `>>` per line, so the file is chronological by construction. Do NOT
# pipe this script's output into `tee -a migration-log/run.log`: it writes that
# file already, and a `tee` on top duplicates every line.
#
# WHERE IT WRITES. `$MIGRATION_LOG_DIR/run.log`, default `migration-log/run.log`,
# relative to the working directory -- the module repository being migrated. Set
# MIGRATION_LOG_DIR to override (a repository migrated before the rename still
# carries `.ai-log/`; spec §10.1 says leave those alone). The directory is
# created on first use.
#
# LINE FORMAT (spec §10.2), fields separated by exactly two spaces:
#
#   <UTC-ISO-8601-seconds>  <LEVEL>  <STEP>  <ACTION>  <DETAIL>
#
# LEVEL is `INFO `/`WARN `/`ERROR` padded to five; STEP is the spec section
# (`5.1b.2`, `5.4`, `pre.5`); ACTION is a stable kebab-case slug; DETAIL carries
# the command actually executed as cmd=`…` plus measured key=value outcomes.
#
# Exit codes: 0 = line(s) emitted; 2 = setup error (unknown subcommand, missing
# argument, non-numeric count, unwritable log directory) -- nothing is logged.
# `run` is the exception: it returns THE WRAPPED COMMAND'S status verbatim, and
# only reports 2 for a setup error detected before anything is executed.
#
# Bash (not POSIX sh): PIPESTATUS is required, and is present in bash 3.2, which
# is what macOS still ships. stdlib only, like the rest of the catalog's scripts.

# --- configuration ----------------------------------------------------------
: "${MIGRATION_LOG_DIR:=migration-log}"
: "${MIGRATION_LOG_FILE:=$MIGRATION_LOG_DIR/run.log}"
: "${MIGRATION_CLAIMS_FILE:=$MIGRATION_LOG_DIR/identity-claims.tsv}"

_ml_ts() { date -u +%Y-%m-%dT%H:%M:%SZ; }

# Create the log directory on demand. A failure here is a setup error, not
# something to swallow: a run log nobody can write is the defect this whole
# convention exists to prevent.
_ml_ensure_dir() {
  [ -d "$MIGRATION_LOG_DIR" ] && return 0
  mkdir -p "$MIGRATION_LOG_DIR" 2>/dev/null && return 0
  printf '%s  ERROR  %s  %s  %s\n' "$(_ml_ts)" "log" "migration-log" \
    "setup: cannot create the log directory  dir=$MIGRATION_LOG_DIR  exit=2" >&2
  return 2
}

# _ml_emit LEVEL STEP ACTION DETAIL [CONT ...]
# One line to the run log AND to the terminal. Written with one append per line
# so the file stays chronological however the streams are later redirected.
_ml_emit() {
  local level="$1" step="$2" action="$3" detail="$4"; shift 4
  local padded stream line
  case "$level" in
    INFO)  padded="INFO " ; stream=1 ;;
    WARN)  padded="WARN " ; stream=1 ;;
    ERROR) padded="ERROR" ; stream=2 ;;
    *) printf 'migration-log: unknown level %s\n' "$level" >&2; return 2 ;;
  esac
  _ml_ensure_dir || return 2
  line="$(_ml_ts)  $padded  $step  $action  $detail"
  {
    printf '%s\n' "$line"
    local c
    for c in "$@"; do printf '    %s\n' "$c"; done
  } >>"$MIGRATION_LOG_FILE"
  {
    printf '%s\n' "$line"
    local c
    for c in "$@"; do printf '    %s\n' "$c"; done
  } >&"$stream"
}

log_info()  { [ $# -ge 3 ] || { _ml_usage_err "info"  ; return 2; }
              local s="$1" a="$2" d="$3"; shift 3; _ml_emit INFO  "$s" "$a" "$d" "$@"; }
log_warn()  { [ $# -ge 3 ] || { _ml_usage_err "warn"  ; return 2; }
              local s="$1" a="$2" d="$3"; shift 3; _ml_emit WARN  "$s" "$a" "$d" "$@"; }
log_error() { [ $# -ge 3 ] || { _ml_usage_err "error" ; return 2; }
              local s="$1" a="$2" d="$3"; shift 3; _ml_emit ERROR "$s" "$a" "$d" "$@"; }

_ml_usage_err() {
  printf 'migration-log: %s needs STEP ACTION DETAIL [CONT ...]  exit=2\n' "$1" >&2
}

# log_begin [LABEL] -- the run-boundary marker.
#
# run.log is append-only ACROSS invocations, which is what makes it an audit
# trail; the cost is that a second run of a block continues the first with
# nothing between them. This writes one numbered §10.2 line so a reader can see
# where each invocation starts, and numbers it by counting the markers already
# in the file -- so `run 2` is literally the second time the block ran here.
log_begin() {
  local label="${1:-unlabelled}" n=1
  _ml_ensure_dir || return 2
  if [ -f "$MIGRATION_LOG_FILE" ]; then
    n=$(grep -c '  run-boundary  ' "$MIGRATION_LOG_FILE" 2>/dev/null | tr -d ' ')
    n=$(( ${n:-0} + 1 ))
  fi
  _ml_emit INFO "log" "run-boundary" \
    "===== run $n starts  run=$n label=$label cwd=$PWD log=$MIGRATION_LOG_FILE" \
    "Every line below belongs to run $n; the lines above are earlier invocations." \
    "Per-step raw logs (migration-log/<ACTION>.log) hold THIS run only -- \`run\`" \
    "truncates each one and rolls the previous attempt over to <ACTION>.prev.log."
}

# _ml_quote ARG... -- the command line as it would have to be typed to be
# re-run. Only arguments that need it are quoted, so the common case stays
# readable and `cmd=` remains a faithful record rather than a paraphrase.
_ml_quote() {
  local out="" arg
  for arg in "$@"; do
    case "$arg" in
      *[!A-Za-z0-9_@%+=:,./-]*) out="$out '$(printf '%s' "$arg" | sed "s/'/'\\\\''/g")'" ;;
      "")                       out="$out ''" ;;
      *)                        out="$out $arg" ;;
    esac
  done
  printf '%s' "${out# }"
}

# log_ratio [--exit N] STEP ACTION VERB NOUN EXPECTED ACTUAL [CONT ...]
#
# The §10.4 rule. Exit code 0 is not evidence of completeness; the counts are.
#   equal      -> one INFO
#   actual <   -> an INFO *and* a WARN carrying `silent-partial-success:`
#   actual >   -> an INFO *and* a WARN carrying `count-above-expected:`
#                 (a different token: over-production is also worth a look, but
#                 it is not the silent-partial-success class and must not
#                 pollute a grep for it)
# Always returns 0 -- the WARN is the signal, and a non-zero here would abort a
# `set -e` caller mid-step. The CI gate is
#   grep -F 'silent-partial-success:' migration-log/run.log
log_ratio() {
  local exitnote="" atnote=""
  while [ $# -gt 0 ]; do
    case "$1" in
      --exit) [ $# -ge 2 ] || { printf 'migration-log: --exit needs a value  exit=2\n' >&2; return 2; }
              exitnote=" exit=$2"; atnote=" at exit $2"; shift 2 ;;
      *) break ;;
    esac
  done
  if [ $# -lt 6 ]; then
    printf 'migration-log: ratio needs STEP ACTION VERB NOUN EXPECTED ACTUAL  exit=2\n' >&2
    return 2
  fi
  local step="$1" action="$2" verb="$3" noun="$4" expected="$5" actual="$6"; shift 6
  # An EMPTY count is a setup error, not a zero. It is what a caller passes when
  # the command that was supposed to produce it failed -- `$(wc -l < missing)`
  # yields "" -- and treating it as 0 would print a confident, wrong ratio.
  case "${expected:-x}${actual:-x}" in
    *[!0-9]*) printf 'migration-log: ratio EXPECTED/ACTUAL must be non-empty integers (got %s, %s)  exit=2\n' \
                "${expected:-<empty>}" "${actual:-<empty>}" >&2; return 2 ;;
  esac
  _ml_emit INFO "$step" "$action" \
    "$verb $actual of $expected $noun  expected=$expected actual=$actual$exitnote" "$@"
  if [ "$actual" -lt "$expected" ]; then
    _ml_emit WARN "$step" "$action" \
      "silent-partial-success: $verb $actual of $expected $noun$atnote" \
      "Exit status is not evidence of completeness; these two counts are." \
      "Reconcile against the step-1 inventory before continuing."
  elif [ "$actual" -gt "$expected" ]; then
    _ml_emit WARN "$step" "$action" \
      "count-above-expected: $verb $actual of $expected $noun$atnote" \
      "More was produced than the input implies -- check the input set for" \
      "foreign resources before treating the surplus as this module's."
  fi
  return 0
}

# log_claim STEP ACTION FIELD VALUE TIER SOURCE [CONT ...]
#
# One identity field, from one source, with its evidence (spec §2.1). The ledger
# is a TSV so it can be read back mechanically:
#
#   <ts> <TAB> <field> <TAB> <tier> <TAB> <source> <TAB> <value> <TAB> <step> <TAB> <action>
#
# Tabs and newlines are the only characters this format cannot carry, so they are
# folded to spaces in the VALUE rather than allowed to corrupt a row silently.
# Always returns 0: like `ratio`, the WARN is the signal, and a non-zero here
# would abort a `set -e` caller in the middle of reporting its evidence.
log_claim() {
  if [ $# -lt 6 ]; then
    printf 'migration-log: claim needs STEP ACTION FIELD VALUE TIER SOURCE  exit=2\n' >&2
    return 2
  fi
  local step="$1" action="$2" field="$3" value="$4" tier="$5" source="$6"; shift 6
  _ml_ensure_dir || return 2
  field=$(printf '%s' "$field" | tr -d '\t\n ')
  value=$(printf '%s' "$value" | tr '\t\n' '  ')
  tier=$(printf '%s' "$tier" | tr -d '\t\n ')
  source=$(printf '%s' "$source" | tr '\t\n' '  ')
  if [ -z "$field" ] || [ -z "$value" ]; then
    printf 'migration-log: claim FIELD and VALUE must be non-empty  exit=2\n' >&2
    return 2
  fi

  # Every earlier claim for this field whose value differs. A missing ledger is
  # not an empty one by accident: the file is created on the first claim.
  local prior=""
  if [ -f "$MIGRATION_CLAIMS_FILE" ]; then
    prior=$(awk -F'\t' -v f="$field" -v v="$value" \
      '$2==f && $5!=v { printf "%s=%s (tier %s, %s) ", $2, $5, $3, $4 }' \
      "$MIGRATION_CLAIMS_FILE" 2>/dev/null)
  fi

  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
    "$(_ml_ts)" "$field" "$tier" "$source" "$value" "$step" "$action" \
    >>"$MIGRATION_CLAIMS_FILE" 2>/dev/null || {
      _ml_emit ERROR "$step" "$action" \
        "setup: cannot write the identity ledger  file=$MIGRATION_CLAIMS_FILE exit=2"
      return 2; }

  _ml_emit INFO "$step" "$action" \
    "identity-claim  field=$field value=$value tier=$tier source=$source" "$@"

  if [ -n "$prior" ]; then
    _ml_emit WARN "$step" "$action" \
      "identity-contradiction: field=$field  now=$value (tier $tier, $source)  vs  ${prior% }" \
      "Two sources disagree about the same identity field. This is REPORTED, not" \
      "resolved: the tier ranking (spec §2.1) says which value a human should" \
      "probably adopt, and adopting one here would silently rename, re-license or" \
      "re-version a published module. Both readings stand in the ledger; Gate A" \
      "decides, and nothing in the repository is rewritten either way."
  fi
  return 0
}

# log_claims [--markdown] -- read the ledger back.
# Exits 1 when any field carries more than one distinct value, so the same call
# is both the report's input and a CI gate.
log_claims() {
  local md=0
  [ "${1:-}" = "--markdown" ] && md=1
  if [ ! -s "$MIGRATION_CLAIMS_FILE" ]; then
    printf 'migration-log: no identity claims recorded  file=%s\n' "$MIGRATION_CLAIMS_FILE" >&2
    return 2
  fi
  awk -F'\t' -v md="$md" '
    { key=$2; seen[key]++; vals[key,$5]=1
      row[NR]=$2 "\t" $3 "\t" $4 "\t" $5 }
    END {
      for (k in vals) { split(k, p, SUBSEP); distinct[p[1]]++ }
      if (md) { print "| Field | Tier | Source | Value | Contradiction |"
                print "| --- | --- | --- | --- | --- |" }
      for (i = 1; i <= NR; i++) {
        if (!row[i]) continue
        split(row[i], c, "\t")
        flag = (distinct[c[1]] > 1) ? "YES -- Gate A" : ""
        if (md) printf "| %s | %s | %s | %s | %s |\n", c[1], c[2], c[3], c[4], flag
        else    printf "%-14s tier=%-2s %-34s %s%s\n", c[1], c[2], c[3], c[4],
                       (flag == "" ? "" : "   <- " flag)
      }
      bad = 0
      for (f in distinct) if (distinct[f] > 1) bad++
      exit (bad > 0) ? 1 : 0
    }' "$MIGRATION_CLAIMS_FILE"
}

# _ml_parsed_errors FILE -- the error count a FSH tool printed in its own summary
# ("41 Errors", "0 Errors"), taken from the LAST such summary in the file. Prints
# nothing when the file names no count, which is the normal case for a tool that
# does not report one; a caller must treat "" as "unknown", never as 0.
_ml_parsed_errors() {
  local n
  n=$(grep -oE '[0-9]+ Errors' "$1" 2>/dev/null | tail -1 | cut -d' ' -f1)
  printf '%s' "$n"
}

# _ml_exit_crosscheck STEP ACTION STATUS RAWLOG
#
# A shell exit status is EIGHT BITS: the kernel reports it modulo 256. SUSHI's
# status IS its error count, so a guide with exactly 256 errors exits 0 and one
# with 261 exits 5 -- measured, a probe exiting 256 logged `exit=0` and returned
# 0, indistinguishable from a clean run. Nothing downstream can recover the real
# number from the status, so the only honest move is to cross-check the status
# against the count the tool PRINTED and say so when the two disagree.
_ml_exit_crosscheck() {
  local step="$1" action="$2" status="$3" rawlog="$4" parsed
  parsed="$(_ml_parsed_errors "$rawlog")"
  [ -n "$parsed" ] || return 0
  [ "$parsed" -ne "$status" ] || return 0
  # 10# so a count that arrives zero-padded is not read as octal.
  if [ $(( 10#$parsed % 256 )) -eq "$status" ]; then
    _ml_emit WARN "$step" "$action" \
      "exit-status-truncated: the tool printed $parsed errors but exited $status  parsed_errors=$parsed exit=$status raw_log=$rawlog" \
      "A shell exit status is 8 bits: $parsed mod 256 = $status, so the status is" \
      "NOT usable as the error count here. Read $parsed out of $rawlog and treat" \
      "the status as meaningless for this step."
  elif [ "$status" -eq 0 ]; then
    _ml_emit WARN "$step" "$action" \
      "exit-status-disagrees: exit 0 but the tool printed $parsed errors  parsed_errors=$parsed exit=0 raw_log=$rawlog" \
      "A zero status is not evidence of a clean run when the tool's own summary" \
      "says otherwise. Believe the printed count and read $rawlog."
  fi
}

# run_step STEP ACTION [--emits-runlog] [--raw-log FILE] [--expected-nonzero WHY]
#          -- CMD [ARG ...]
run_step() {
  local step action emits=0 rawlog="" expected_why=""
  if [ $# -lt 2 ]; then
    printf 'migration-log: run needs STEP ACTION [opts] -- CMD [ARG ...]  exit=2\n' >&2
    return 2
  fi
  step="$1"; action="$2"; shift 2
  while [ $# -gt 0 ]; do
    case "$1" in
      --emits-runlog) emits=1; shift ;;
      --raw-log) [ $# -ge 2 ] || { printf 'migration-log: --raw-log needs a path  exit=2\n' >&2; return 2; }
                 rawlog="$2"; shift 2 ;;
      --expected-nonzero)
                 [ $# -ge 2 ] || { printf 'migration-log: --expected-nonzero needs a reason  exit=2\n' >&2; return 2; }
                 expected_why="$2"; shift 2 ;;
      --) shift; break ;;
      *) printf 'migration-log: run: unknown option %s (did you forget the `--`?)  exit=2\n' "$1" >&2
         return 2 ;;
    esac
  done
  if [ $# -eq 0 ]; then
    printf 'migration-log: run needs a command after `--`  exit=2\n' >&2
    return 2
  fi
  _ml_ensure_dir || return 2
  [ -n "$rawlog" ] || rawlog="$MIGRATION_LOG_DIR/$action.log"

  # ONE INVOCATION PER RAW LOG. Appending made every read-back of the raw log
  # wrong on a re-run (two goFSH RESULTS tables in one file, summed into an
  # inflated count) and made `raw_log_lines=` the total of every attempt. The
  # previous attempt is rolled over rather than lost.
  local prevlog=""
  if [ -s "$rawlog" ]; then
    prevlog="${rawlog%.log}.prev.log"
    mv -f "$rawlog" "$prevlog" 2>/dev/null || prevlog=""
  fi
  : >"$rawlog" 2>/dev/null || {
    _ml_emit ERROR "$step" "$action" \
      "setup: cannot write the raw log  raw_log=$rawlog exit=2"
    return 2
  }

  local cmdline status
  cmdline="$(_ml_quote "$@")"
  _ml_emit INFO "$step" "$action" \
    "start  cmd=\`$cmdline\`  raw_log=$rawlog${prevlog:+ prev_raw_log=$prevlog}"

  # The whole point: `tee` is the LAST command of the pipeline, so `$?` is
  # tee's. PIPESTATUS[0] is the wrapped command's, and it is what we report and
  # what we return. MIGRATION_LOG_WRAPPED tells a bundled script that its own
  # start/done lines would duplicate this wrapper's.
  if [ "$emits" = 1 ]; then
    MIGRATION_LOG_WRAPPED=1 "$@" 2>&1 | tee -a "$rawlog" "$MIGRATION_LOG_FILE"
  else
    MIGRATION_LOG_WRAPPED=1 "$@" 2>&1 | tee -a "$rawlog"
  fi
  status=${PIPESTATUS[0]}

  local lines
  lines=$(wc -l <"$rawlog" 2>/dev/null | tr -d ' ')
  if [ "$status" -eq 0 ]; then
    if [ -n "$expected_why" ]; then
      _ml_emit INFO "$step" "$action" \
        "done  cmd=\`$cmdline\`  exit=0 raw_log=$rawlog raw_log_lines=${lines:-0}" \
        "A non-zero exit was anticipated here ($expected_why) and did not occur." \
        "Confirm the anticipation still holds before reusing it as documentation."
    else
      _ml_emit INFO "$step" "$action" \
        "done  cmd=\`$cmdline\`  exit=0 raw_log=$rawlog raw_log_lines=${lines:-0}"
    fi
  elif [ -n "$expected_why" ]; then
    # The status is real and returned; what changes is the claim made about it.
    # Telling a reader that the DOCUMENTED, EXPECTED outcome "did NOT meet its
    # acceptance criterion" trains them to ignore the line.
    _ml_emit WARN "$step" "$action" \
      "anticipated-nonzero-exit: $expected_why  cmd=\`$cmdline\`  exit=$status raw_log=$rawlog raw_log_lines=${lines:-0}" \
      "This non-zero status is this step's ANTICIPATED, documented outcome, not a" \
      "failure to fix -- the acceptance criterion is met AS QUALIFIED (spec" \
      "§5.1b.4). Escalated, not ignored: every item behind it belongs in the" \
      "report's ① decision queue, named individually (spec §10.3, §10.6)."
  else
    _ml_emit ERROR "$step" "$action" \
      "failed  cmd=\`$cmdline\`  exit=$status raw_log=$rawlog raw_log_lines=${lines:-0}" \
      "The exit status is preserved and returned -- this step did NOT meet its" \
      "acceptance criterion. Read $rawlog, then either fix and re-run or take it" \
      "to the report's decision queue (spec §10.3)."
  fi
  _ml_exit_crosscheck "$step" "$action" "$status" "$rawlog"
  return "$status"
}

# --- CLI --------------------------------------------------------------------
# The help text is this file's own header comment, so the two cannot drift: it is
# printed from the start of the file to the `# --- configuration` divider.
_ml_help() {
  sed -n '2,/^# --- configuration/p' "${BASH_SOURCE[0]}" \
    | sed '$d' | sed 's/^# \{0,1\}//'
}

_ml_main() {
  [ $# -ge 1 ] || { _ml_help >&2; return 2; }
  local sub="$1"; shift
  case "$sub" in
    info)  log_info  "$@" ;;
    warn)  log_warn  "$@" ;;
    error) log_error "$@" ;;
    ratio) log_ratio "$@" ;;
    claim) log_claim "$@" ;;
    claims) log_claims "$@" ;;
    begin) log_begin "$@" ;;
    run)   run_step  "$@" ;;
    -h|--help|help) _ml_help; return 0 ;;
    *) printf 'migration-log: unknown subcommand %s  exit=2\n' "$sub" >&2
       printf 'usage: migration-log.sh {begin|info|warn|error|ratio|claim|claims|run|--help} …\n' >&2
       return 2 ;;
  esac
}

# Sourced -> library only. Executed -> CLI.
if [ "${BASH_SOURCE[0]}" = "$0" ]; then
  _ml_main "$@"
  exit $?
fi
