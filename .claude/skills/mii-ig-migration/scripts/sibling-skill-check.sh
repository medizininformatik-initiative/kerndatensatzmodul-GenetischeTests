#!/usr/bin/env bash
# sibling-skill-check -- is the SIBLING SKILL this procedure hands off to
# actually installed? Report it, and when it is not, print the exact PINNED
# install command -- without installing anything (spec §5.6a).
#
# WHY THIS EXISTS. §5.6's acceptance criterion and §7's Definition of Done both
# require the same-module comparison performed by the catalog's
# `fhir-ig-analysis` skill. The specification named that skill and never said
# how to obtain it, which left an operator without it three bad options: skip
# the check, hand-wave it, or improvise a comparison. All three end with a
# migration reported as done on evidence nobody produced.
#
# WHY IT DOES NOT INSTALL IT. A TOOL GRANT IS NOT A DEPENDENCY DECLARATION.
# `allowed-tools` answers "may the agent run this command", never "does this
# skill need that skill" -- and this skill's own frontmatter is the proof: it
# grants Bash(npx:*) for the pinned SUSHI/goFSH invocations, and that grant
# would equally permit `npx skills add`. Permission is not intent. Beyond that:
#
#   * installing would WRITE TO THE OPERATOR'S PROJECT as a side effect of an
#     unrelated run. A migration touches a working branch of the module
#     repository (guardrail 6) and nothing else; .claude/skills, .agents/skills
#     and skills-lock.json are not this run's to change, and no reviewer of the
#     migration's pull request would ever see the change.
#   * it would make the run NON-HERMETIC. A sibling resolved from the network at
#     run time is not the version anybody reviewed, and not one the run log can
#     name. This skill pins a published guide version and records it like a
#     source commit SHA (§5.1c.3); the tooling gets the same treatment.
#   * it cuts against the catalog's STATIC-BY-DESIGN stance: a Git repository
#     with a generated index, no server, no runtime. Installation is an
#     explicit, reviewed act by the consumer, recorded in skills-lock.json. A
#     skill that installs another skill turns a deliberate pin into a run-time
#     resolution.
#
# So: detect, and on absence emit ONE WARN carrying ONE command to copy.
#
# HOW IT DETECTS. Installed skills are plain sibling directories under one
# skills root, so the root is derived from THIS skill's own directory when the
# caller passes --skill-dir, and otherwise looked for in the conventional
# project- and user-level agent directories. A candidate counts only when its
# SKILL.md declares the expected `name:` -- a directory name is not evidence.
# Nothing outside this skill's own directory is ever READ AS A DEPENDENCY: the
# search is environment discovery, and finding nothing is a reported outcome,
# not a failure to function.
#
# USAGE
#
#   sibling-skill-check.sh [--skill NAME] [--skill-dir DIR] [--root DIR]...
#                          [--self NAME] [--lock FILE] [--ref REF]
#                          [--step S] [--action A]
#
#     --skill NAME    the sibling to look for      (default fhir-ig-analysis)
#     --skill-dir DIR THIS skill's directory, i.e. the one holding SKILL.md.
#                     Its parent is the installed-skills root. Pass "$SKILL_DIR".
#     --root DIR      an additional skills root to search; repeatable
#     --self NAME     this skill's name, for the lock-file lookup
#                     (default mii-ig-migration)
#     --lock FILE     skills-lock.json to read the pinned ref from; by default
#                     the conventional locations are tried
#     --ref REF       use this ref in the emitted command instead of the lock
#                     file's
#     --step S        run-log STEP field   (default 5.6a)
#     --action A      run-log ACTION field (default sibling-skill-check)
#
# EXIT CODES
#
#   0  the sibling is installed and identified          (INFO)
#   1  it is not, or no skills root could be determined  (WARN + the command)
#   2  setup error (bad arguments)
#
# Call it DIRECTLY, not through `migration-log.sh run --emits-runlog`: it emits
# its lines through the helper as a library, like repo-identity.sh and
# simplifier-discover.sh.
#
# Bash 3.2 compatible. python3 is used only to read skills-lock.json, and its
# absence degrades to a named, reported fallback rather than to a guess.

set -u

_here() { cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd; }
# shellcheck source=./migration-log.sh
. "$(_here)/migration-log.sh"

STEP=5.6a
ACTION=sibling-skill-check
SIBLING=fhir-ig-analysis
SELF=mii-ig-migration
SKILL_DIR_IN=""
LOCK_IN=""
REF_IN=""
CATALOG=forschungsgruppe-digital-health/agent-skills
ROOTS=""

while [ $# -gt 0 ]; do
  case "$1" in
    --skill)     SIBLING="${2:-}";     shift 2 || true ;;
    --skill-dir) SKILL_DIR_IN="${2:-}"; shift 2 || true ;;
    --root)      ROOTS="$ROOTS
${2:-}";                                shift 2 || true ;;
    --self)      SELF="${2:-}";        shift 2 || true ;;
    --lock)      LOCK_IN="${2:-}";     shift 2 || true ;;
    --ref)       REF_IN="${2:-}";      shift 2 || true ;;
    --step)      STEP="${2:-}";        shift 2 || true ;;
    --action)    ACTION="${2:-}";      shift 2 || true ;;
    -h|--help)
      sed -n '2,/^set -u/p' "${BASH_SOURCE[0]}" | sed '$d' | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *) printf 'sibling-skill-check: unknown option %s  exit=2\n' "$1" >&2; exit 2 ;;
  esac
done

if [ -z "$SIBLING" ]; then
  printf 'sibling-skill-check: --skill needs a name  exit=2\n' >&2; exit 2
fi

# --- the candidate skills roots ----------------------------------------------
# In order: what the caller named, then this skill's own parent directory (the
# root every installed skill shares), then the conventional project- and
# user-level agent directories. `dirname` is how the parent is taken -- the
# catalog's portability rule forbids a skill from REFERENCING anything outside
# its own directory, and this is discovery of the installation, not a reference
# to a file the skill needs in order to work.
if [ -n "$SKILL_DIR_IN" ]; then
  if [ -d "$SKILL_DIR_IN" ]; then
    ROOTS="$ROOTS
$(dirname -- "$SKILL_DIR_IN")"
  else
    log_warn "$STEP" "$ACTION" \
      "skill-dir-not-a-directory: --skill-dir does not exist  skill_dir=$SKILL_DIR_IN" \
      "Pass the directory that CONTAINS this SKILL.md, e.g." \
      ".claude/skills/$SELF -- the search continues in the conventional roots."
  fi
fi
ROOTS="$ROOTS
.claude/skills
.agents/skills
.codex/skills
skills
${HOME:-}/.claude/skills
${HOME:-}/.codex/skills
${HOME:-}/.agents/skills"

# --- find it ------------------------------------------------------------------
# A directory named like the skill is not evidence that it IS the skill: an
# installation may be partial, renamed or left over. The frontmatter `name:` is.
#
# EXAMINED counts the roots that EXIST. A candidate path that is not there was
# not examined, and counting it would turn "there is no skills root on this
# machine, so the question could not be answered" into "searched 8 places, it is
# absent" -- a different, and unearned, claim.
FOUND=""
EXAMINED=0
EXAMINED_LIST=""
SEEN=""
while IFS= read -r root; do
  [ -n "$root" ] || continue
  [ -d "$root" ] || continue
  # Canonicalize before de-duplicating: `.claude/skills` and
  # `$PWD/.claude/skills` are one directory, and reporting one finding about it
  # twice would put the same item in the report's queue twice.
  root=$(cd -- "$root" 2>/dev/null && pwd) || continue
  case "$SEEN" in *"[$root]"*) continue ;; esac
  SEEN="${SEEN}[$root]"
  EXAMINED=$((EXAMINED + 1))
  EXAMINED_LIST="${EXAMINED_LIST:+$EXAMINED_LIST }$root"
  cand="$root/$SIBLING/SKILL.md"
  [ -f "$cand" ] || continue
  name=$(sed -n '1,40p' "$cand" | grep -m1 '^name:' | sed 's/^name:[[:space:]]*//' | tr -d '\r"'"'")
  if [ "$name" = "$SIBLING" ]; then
    FOUND="$root/$SIBLING"
    break
  fi
  log_warn "$STEP" "$ACTION" \
    "sibling-name-mismatch: a directory named $SIBLING declares name=${name:-<none>}  path=$cand" \
    "Not accepted as the sibling. The directory name is not evidence; the" \
    "frontmatter is, and the specification requires the two to be equal."
done <<EOF
$ROOTS
EOF

# --- the ref to pin the emitted command to ------------------------------------
# skills-lock.json records, per skill, the ref the consumer installed FROM. It
# is the honest source for the ref here: the sibling should arrive at the
# version the rest of this installation is on, not at whatever is newest.
REF=""
REF_SRC=""
LOCK=""
if [ -n "$REF_IN" ]; then
  REF="$REF_IN"; REF_SRC="--ref"
else
  for f in ${LOCK_IN:-} skills-lock.json .claude/skills-lock.json .agents/skills-lock.json \
           .codex/skills-lock.json "${HOME:-}/.claude/skills-lock.json"; do
    [ -n "$f" ] && [ -f "$f" ] || continue
    LOCK="$f"; break
  done
  if [ -n "$LOCK" ]; then
    if command -v python3 >/dev/null 2>&1; then
      # Two lines, not one tab-separated line: an invisible delimiter in a
      # source file is a maintenance trap of exactly the kind this skill keeps
      # finding in other people's code.
      LOCKOUT=$(python3 - "$LOCK" "$SELF" "$SIBLING" <<'PY' 2>/dev/null
import json, sys
try:
    d = json.load(open(sys.argv[1], encoding="utf-8"))
except Exception:
    sys.exit(0)
s = d.get("skills") or {}
for key in (sys.argv[2], sys.argv[3]):
    e = s.get(key)
    if isinstance(e, dict) and e.get("ref"):
        print(e["ref"])
        print(key)
        break
PY
)
      REF=$(printf '%s\n' "$LOCKOUT" | sed -n '1p')
      [ -n "$REF" ] && REF_SRC="$LOCK (entry $(printf '%s\n' "$LOCKOUT" | sed -n '2p'))"
    else
      log_warn "$STEP" "$ACTION" \
        "lock-file-unparsed: python3 is not on PATH, so $LOCK was not read  lock=$LOCK" \
        "The install command below therefore carries a <ref> placeholder. Read the" \
        "ref out of the lock file by hand rather than installing from the default" \
        "branch -- that is not a pin."
    fi
  fi
fi
[ -n "$REF" ] || { REF="<ref>"; [ -n "$REF_SRC" ] || REF_SRC="not recorded"; }

# The lock file is also the second, independent way to see that a pin never
# applied: `owner/repo@tag` installs from the default branch in that CLI,
# because `@` introduces a skill NAME there, and the lock then records `main`.
case "$REF" in
  main|master)
    log_warn "$STEP" "$ACTION" \
      "pin-not-taken: the lock file records ref=$REF for this installation  lock=${LOCK:-<none>}" \
      "That is the default branch, not a pin, so the procedure an agent follows" \
      "can move between two runs of the same migration. The pinning form is the" \
      "tree URL below; \`<owner>/<repo>@<tag>\` is NOT one." ;;
esac

CMD="npx skills add \"https://github.com/$CATALOG/tree/$REF\" --skill $SIBLING --agent claude-code codex --yes"

# --- report -------------------------------------------------------------------
if [ -n "$FOUND" ]; then
  log_info "$STEP" "$ACTION" \
    "sibling-skill-present  skill=$SIBLING path=$FOUND roots_examined=$EXAMINED ref=${REF} ref_source=${REF_SRC:-unknown}" \
    "Identified by its frontmatter name, not by its directory name. §5.6's" \
    "same-module verification can run; its IDENTISCH lines are the evidence, not" \
    "this line."
  exit 0
fi

if [ "$EXAMINED" -eq 0 ]; then
  log_warn "$STEP" "$ACTION" \
    "skill-root-undetermined: no skills root could be examined  skill=$SIBLING" \
    "Reported as UNREAD, never as absent. Pass --skill-dir \"\$SKILL_DIR\" or" \
    "--root <dir> so the question can actually be answered."
  exit 1
fi

log_warn "$STEP" "$ACTION" \
  "sibling-skill-unavailable: $SIBLING is not installed  roots_examined=$EXAMINED ref=$REF ref_source=${REF_SRC:-not recorded}" \
  "Roots examined (existing directories only): $EXAMINED_LIST" \
  "§5.6 and §7 require its same-module verification (identity, published artifact" \
  "set, canonical URLs all IDENTISCH). Install it yourself -- ONE command, and it" \
  "stays visible, pinned, reviewed and yours:" \
  "" \
  "    $CMD" \
  "" \
  "This script does NOT run that command. A tool grant is permission, not a" \
  "dependency; installing here would write to your project as a side effect of a" \
  "migration, and would resolve a version nobody reviewed (§5.6a.1). Until it is" \
  "installed, this is an OPEN Definition-of-Done item for the report's ① decision" \
  "queue -- not a step to drop quietly." \
  "A <ref> placeholder above means no skills-lock.json recorded one: use the" \
  "catalog release tag you consume, and keep the tree-URL form -- it is the one" \
  "that pins."
exit 1
