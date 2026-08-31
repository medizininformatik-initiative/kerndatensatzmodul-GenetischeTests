#!/usr/bin/env bash
# parent-snapshots -- detect the "parent package ships no snapshots" condition,
# and generate the missing snapshots with a REAL FHIR snapshot generator
# (spec §5.1b.5).
#
# THE CONDITION. SUSHI cannot import a parent profile that has no snapshot:
#
#   error Structure Definition http://fhir.de/ConsentManagement/StructureDefinition/DocumentReference
#         is missing a snapshot. Snapshot is required for import.
#
# Every profile deriving from that parent, and every instance declaring
# `InstanceOf` one of those profiles, then fails to export. Measured on
# `de.einwilligungsmanagement` (2026-08-06): BOTH 2.0.2 and 2.0.3 ship 21
# StructureDefinitions and ZERO snapshots, so picking another version does not
# help -- the packages carry differentials only.
#
# THE ABSOLUTE RULE. A SNAPSHOT IS NEVER HAND-ROLLED OR APPROXIMATED. Merging a
# differential onto a base is full FHIR profile-merging semantics -- slicing,
# cardinality narrowing, type constraints, element ordering. An approximation
# produces profiles that LOOK generated and are subtly wrong, which is the same
# failure shape as a tool reporting success while emitting garbage. This script
# therefore does no merging of its own: it drives the OFFICIAL HL7 generator
# (`validator_cli.jar snapshot`, backed by `ProfileUtilities`, the same code the
# IG Publisher uses) and refuses to emit anything it cannot verify.
#
# THE VERIFICATION THAT CATCHES A FAKE. A generated snapshot whose element count
# equals the DIFFERENTIAL's is not a snapshot -- it is the differential wearing
# the name. Every generated file is checked to have MORE elements than its own
# differential AND at least as many as its base's snapshot; a file failing that
# is refused, not merged. Measured on the reference parent: DocumentReference
# 61 snapshot / 45 base / 8 differential, Consent 132 / 57 / 32, Provenance
# 65 / 32 / 20 -- a differential-only fake would have read 8, 32, 20.
#
# GETTING THE GENERATOR (~187 MB, pin the version -- `latest` moves):
#
#   curl -sL -o validator_cli.jar \
#     https://github.com/hapifhir/org.hl7.fhir.core/releases/download/6.10.0/validator_cli.jar
#
# TWO MEASURED GOTCHAS, both handled here, both silent if they are not:
#
#   * FILENAMES. The validator lowercases the source path and then mis-detects
#     the format of any filename containing `template`:
#     `extension-ConsentManagement-XacmlTemplate.json` fails with "Unsupported
#     format for …xacmltemplate.json" while the identical bytes under another
#     name succeed. Every StructureDefinition is therefore staged as
#     `sd000.json`, `sd001.json`, … and merged back by url.
#   * BATCHING. A multi-file run ABORTS at the first failure and silently skips
#     the remainder -- which made a healthy QuestionnaireResponse profile look
#     broken. The validator is invoked ONCE PER FILE, and `java` is given
#     `</dev/null` so it cannot consume the loop's stdin.
#
# WHAT IT NEVER TOUCHES. The upstream package in the FHIR cache. The rebuild is
# installed as a NEW cache entry `<id>#<version>-snapshots`; a destination that
# does not end in `-snapshots` is refused, and an existing one is refused unless
# `--replace` is passed. The module repository is not read or written at all.
#
# USAGE
#
#   parent-snapshots.sh detect --package ID [--version V] [--dir PKGDIR]
#   parent-snapshots.sh build  --package ID [--version V] [--dir PKGDIR]
#                              --validator JAR [--fhir-version 4.0.1]
#                              [--base-dir DIR] [--out DIR]
#                              [--install [DIR]] [--replace]
#                              [--require URL_OR_ID]...
#
#     detect          count the StructureDefinitions and how many carry a
#                     snapshot. This is the DETECTION step: run it on every
#                     foreign parent before concluding anything from a SUSHI
#                     "missing a snapshot" error.
#     build           generate the missing snapshots and write a rebuilt package.
#     --package ID    the parent package id (e.g. de.einwilligungsmanagement)
#     --version V     its version. SOURCE EVIDENCE WINS: take the pin from the
#                     module's own published package (§2.1.1), not from the
#                     registry's dist-tags.latest. Omitted -> dist-tags.latest,
#                     and the script says so.
#     --dir PKGDIR    read an already-unpacked package directory (the one
#                     containing package.json) instead of fetching it.
#     --validator JAR path to validator_cli.jar (or set VALIDATOR)
#     --fhir-version  FHIR version passed to the generator (default 4.0.1)
#     --base-dir DIR  the base package directory the parents derive FROM, for
#                     the element-count floor. Default: hl7.fhir.r4.core#4.0.1
#                     in the local FHIR cache; absent, the floor is skipped and
#                     the script WARNs rather than pretending it checked.
#     --out DIR       where the rebuilt package is written (default: a scratch
#                     directory, kept only when --install is given)
#     --install [DIR] install the rebuild into the FHIR package cache. Default
#                     DIR: $HOME/.fhir/packages/<ID>#<V>-snapshots
#     --replace       allow --install to overwrite an existing REBUILD directory
#     --require U     a canonical url or id that MUST end up snapshotted,
#                     repeatable. These are the parents the migration is
#                     actually blocked on; the exit code follows them.
#
# Exit codes: 0 = detect: every SD has a snapshot / build: every required (or,
# with no --require, every) SD was snapshotted and verified; 1 = the condition is
# present (detect) or the rebuild is incomplete (build) -- a Gate-A item, and a
# usable CI gate; 2 = setup error, nothing generated.
#
# Bash 3.2 compatible; python3 for JSON; java only for the generator.

set -u

_here() { cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd; }
# shellcheck source=./migration-log.sh
. "$(_here)/migration-log.sh"

STEP=5.1b.5
ACTION=parent-snapshots
MODE=""
PKG=""
VER=""
REGISTRY="https://packages.simplifier.net"
PKGDIR=""
VALIDATOR="${VALIDATOR:-}"
FHIRVER="4.0.1"
BASEDIR=""
OUT=""
INSTALL=""
DO_INSTALL=0
REPLACE=0
REQUIRE=""

case "${1:-}" in
  detect|build) MODE="$1"; shift ;;
  -h|--help)
    sed -n '2,/^set -u/p' "${BASH_SOURCE[0]}" | sed '$d' | sed 's/^# \{0,1\}//'
    exit 0 ;;
  *) printf 'parent-snapshots: first argument must be `detect` or `build`  exit=2\n' >&2
     exit 2 ;;
esac

while [ $# -gt 0 ]; do
  case "$1" in
    --package)      PKG="${2:-}";       shift 2 || true ;;
    --version)      VER="${2:-}";       shift 2 || true ;;
    --registry)     REGISTRY="${2:-}";  shift 2 || true ;;
    --dir)          PKGDIR="${2:-}";    shift 2 || true ;;
    --validator)    VALIDATOR="${2:-}"; shift 2 || true ;;
    --fhir-version) FHIRVER="${2:-}";   shift 2 || true ;;
    --base-dir)     BASEDIR="${2:-}";   shift 2 || true ;;
    --out)          OUT="${2:-}";       shift 2 || true ;;
    --install)      DO_INSTALL=1
                    case "${2:-}" in ""|--*) shift ;; *) INSTALL="$2"; shift 2 ;; esac ;;
    --replace)      REPLACE=1;          shift ;;
    --require)      REQUIRE="$REQUIRE ${2:-}"; shift 2 || true ;;
    --step)         STEP="${2:-}";      shift 2 || true ;;
    --action)       ACTION="${2:-}";    shift 2 || true ;;
    *) printf 'parent-snapshots: unknown option %s  exit=2\n' "$1" >&2; exit 2 ;;
  esac
done

if [ -z "$PKG" ] && [ -z "$PKGDIR" ]; then
  printf 'parent-snapshots: --package ID (or --dir PKGDIR) is required  exit=2\n' >&2
  exit 2
fi
REGISTRY="${REGISTRY%/}"
for t in curl python3 tar; do
  command -v "$t" >/dev/null 2>&1 || {
    printf 'parent-snapshots: %s is required and not on PATH  exit=2\n' "$t" >&2; exit 2; }
done

WORK=$(mktemp -d 2>/dev/null) || {
  printf 'parent-snapshots: cannot create a scratch directory  exit=2\n' >&2; exit 2; }
trap 'rm -rf "$WORK"' EXIT

# emit_records FILE -- turn python's LEVEL<TAB>DETAIL[<TAB>CONT…] records into
# run-log lines, so the §10.2 format is never hand-assembled twice. Sets RC=1 on
# an ERROR record. Same channel as package-identity.sh.
RC=0
emit_records() {
  local level detail c1 c2 c3 c4 c5 c6 c7 c8
  while IFS="$(printf '\t')" read -r level detail c1 c2 c3 c4 c5 c6 c7 c8; do
    [ -n "${level:-}" ] || continue
    CONTS=()
    for c in "$c1" "$c2" "$c3" "$c4" "$c5" "$c6" "$c7" "$c8"; do
      [ -n "$c" ] && CONTS+=("$c")
    done
    case "$level" in
      ERROR) log_error "$STEP" "$ACTION" "$detail" ${CONTS[@]+"${CONTS[@]}"}; RC=1 ;;
      WARN)  log_warn  "$STEP" "$ACTION" "$detail" ${CONTS[@]+"${CONTS[@]}"} ;;
      *)     log_info  "$STEP" "$ACTION" "$detail" ${CONTS[@]+"${CONTS[@]}"} ;;
    esac
  done <"$1"
}

# --- obtain the package -------------------------------------------------------
if [ -n "$PKGDIR" ]; then
  [ -f "$PKGDIR/package.json" ] || {
    log_error "$STEP" "$ACTION" "setup: no package.json in --dir  dir=$PKGDIR exit=2"; exit 2; }
  SRC="$PKGDIR"
  log_info "$STEP" "$ACTION" "params  mode=$MODE dir=$SRC (no fetch) fhir_version=$FHIRVER"
else
  if [ -z "$VER" ]; then
    ROOT="$WORK/root.json"
    curl -sfL "$REGISTRY/$PKG" -o "$ROOT" 2>/dev/null || {
      log_error "$STEP" "$ACTION" \
        "setup: cannot read the registry entry  cmd=\`curl -sfL $REGISTRY/$PKG\` exit=2"; exit 2; }
    VER=$(python3 -c 'import json,sys;d=json.load(open(sys.argv[1],encoding="utf-8"));print((d.get("dist-tags") or {}).get("latest") or "")' "$ROOT")
    [ -n "$VER" ] || {
      log_error "$STEP" "$ACTION" "setup: no dist-tags.latest; pass --version  package=$PKG exit=2"; exit 2; }
    log_warn "$STEP" "$ACTION" \
      "version-from-dist-tags: no --version was given  package=$PKG version=$VER" \
      "SOURCE EVIDENCE WINS: the version to snapshot is the one the module's own" \
      "published package PINS (spec §2.1.1), not the registry's current tag. Pass" \
      "--version explicitly once you have read it; measured on the reference" \
      "module, the two differed (source pins 2.0.2, dist-tags.latest is 2.0.3)."
  fi
  URL="$REGISTRY/$PKG/$VER"
  curl -sfL "$URL" -o "$WORK/p.tgz" 2>/dev/null || {
    log_error "$STEP" "$ACTION" "setup: cannot fetch  cmd=\`curl -sfL $URL\` exit=2"; exit 2; }
  mkdir -p "$WORK/src"
  tar xzf "$WORK/p.tgz" -C "$WORK/src" 2>/dev/null || {
    log_error "$STEP" "$ACTION" "setup: the fetched file is not a readable tarball  exit=2"; exit 2; }
  SRC="$WORK/src/package"
  [ -f "$SRC/package.json" ] || {
    log_error "$STEP" "$ACTION" "setup: no package/package.json in the tarball  exit=2"; exit 2; }
  log_info "$STEP" "$ACTION" \
    "params  mode=$MODE package=$PKG version=$VER registry=$REGISTRY fhir_version=$FHIRVER" \
    "cmd=\`curl -sfL $URL -o p.tgz && tar xzf p.tgz\`"
fi

# --- survey: how many StructureDefinitions, how many with a snapshot ----------
SURVEY="$WORK/survey.tsv"
python3 - "$SRC" "$WORK/map.tsv" >"$SURVEY" <<'PY'
import json
import os
import shutil
import sys

src, mapfile = sys.argv[1], sys.argv[2]
TAB = "\t"


def rec(level, detail, *cont):
    print(TAB.join(s.replace(TAB, " ") for s in ([level, detail] + list(cont))))


stage = os.path.join(os.path.dirname(mapfile), "in")
os.makedirs(stage, exist_ok=True)
sds, withsnap, rows = [], [], []
for fn in sorted(os.listdir(src)):
    if not fn.endswith(".json") or fn in ("package.json", ".index.json"):
        continue
    path = os.path.join(src, fn)
    try:
        d = json.load(open(path, encoding="utf-8"))
    except Exception:
        continue
    if not isinstance(d, dict) or d.get("resourceType") != "StructureDefinition":
        continue
    sds.append(fn)
    snap = len(((d.get("snapshot") or {}).get("element")) or [])
    diff = len(((d.get("differential") or {}).get("element")) or [])
    if snap:
        withsnap.append(fn)
    # Staged under a NEUTRAL filename: the generator mis-detects the format of
    # names containing "template" after lowercasing the path (header, gotcha 1).
    n = "sd%03d" % (len(sds) - 1)
    shutil.copyfile(path, os.path.join(stage, n + ".json"))
    rows.append(TAB.join([n, fn, d.get("url") or "", d.get("id") or "",
                          str(diff), str(snap), d.get("baseDefinition") or ""]))

open(mapfile, "w", encoding="utf-8").write("\n".join(rows) + ("\n" if rows else ""))

if not sds:
    rec("ERROR", "no-structuredefinitions: the package contains none  files=0 exit=2",
        "Nothing to detect and nothing to generate. Check the package id and",
        "version -- an empty survey is not the same as 'all snapshots present'.")
    sys.exit(0)

rec("INFO", "surveyed  structure_definitions=%d with_snapshot=%d without_snapshot=%d"
    % (len(sds), len(withsnap), len(sds) - len(withsnap)))

if not withsnap:
    rec("WARN",
        "parent-without-snapshots: %d of %d StructureDefinitions carry NO snapshot"
        % (len(sds), len(sds)),
        "This is the condition behind SUSHI's `is missing a snapshot. Snapshot is",
        "required for import.` Every profile deriving from one of these, and every",
        "instance declaring InstanceOf such a profile, fails to export. Another",
        "version of the same package usually does NOT help -- measured, two",
        "consecutive releases of the reference parent both ship 0 snapshots.",
        "Next: `parent-snapshots.sh build …` (spec §5.1b.5). Never hand-roll one.")
elif len(withsnap) < len(sds):
    rec("WARN",
        "parent-partially-snapshotted: %d of %d StructureDefinitions carry no snapshot"
        % (len(sds) - len(withsnap), len(sds)),
        "Only the profiles actually derived from need one; check which of the",
        "missing set the module's FSH names as a Parent before building.")
else:
    rec("INFO", "every StructureDefinition in the package carries a snapshot  ok=%d"
        % len(sds), "SUSHI can import this parent as it is; nothing to generate.")

# Derivation chain: a flat one (every parent deriving straight from core) can be
# generated in any order. A parent deriving from another parent IN THE SAME
# package cannot, and that is worth knowing before a batch run.
urls = set(r.split(TAB)[2] for r in rows)
intra = [r.split(TAB)[1] for r in rows if r.split(TAB)[6] in urls]
if intra:
    rec("WARN", "intra-package-derivation: %d SD(s) derive from another SD in this "
                "package  files=%s" % (len(intra), ", ".join(intra[:5])),
        "Generate those AFTER their own parent, and re-read the result: a snapshot",
        "generated against a parent that had none is not evidence of anything.")
else:
    rec("INFO", "derivation chain is flat: every SD derives directly from outside "
                "this package  count=%d" % len(rows),
        "So each can be snapshotted independently, in any order.")
PY
emit_records "$SURVEY"
[ "$RC" -eq 0 ] || exit 2

TOTAL=$(wc -l <"$WORK/map.tsv" | tr -d ' ')
MISSING=$(awk -F'\t' '$6 == 0' "$WORK/map.tsv" | wc -l | tr -d ' ')

if [ "$MODE" = "detect" ]; then
  if [ "$MISSING" -gt 0 ]; then
    log_info "$STEP" "$ACTION" \
      "done  mode=detect missing_snapshots=$MISSING of $TOTAL exit=1" \
      "The condition IS present. It is not a post-processing task and not a" \
      "reason to invent a parent: generate the snapshots with \`build\` (spec" \
      "§5.1b.5), or record the dependent profiles as blocked and migrate the rest."
    exit 1
  fi
  log_info "$STEP" "$ACTION" "done  mode=detect missing_snapshots=0 of $TOTAL exit=0"
  exit 0
fi

# --- build --------------------------------------------------------------------
[ -n "$VALIDATOR" ] || {
  log_error "$STEP" "$ACTION" \
    "setup: --validator JAR is required (or set VALIDATOR)  exit=2" \
    "The official generator, pinned. Get it with:" \
    "curl -sL -o validator_cli.jar https://github.com/hapifhir/org.hl7.fhir.core/releases/download/6.10.0/validator_cli.jar" \
    "Do NOT substitute a hand-written merge -- see this script's header."
  exit 2; }
[ -f "$VALIDATOR" ] || {
  log_error "$STEP" "$ACTION" "setup: validator jar not found  validator=$VALIDATOR exit=2"; exit 2; }
command -v java >/dev/null 2>&1 || {
  log_error "$STEP" "$ACTION" "setup: java is required and not on PATH  exit=2"; exit 2; }

if [ -z "$BASEDIR" ]; then
  CAND="$HOME/.fhir/packages/hl7.fhir.r4.core#4.0.1/package"
  [ -d "$CAND" ] && BASEDIR="$CAND"
fi
if [ -n "$BASEDIR" ]; then
  log_info "$STEP" "$ACTION" "base package for the element-count floor  base_dir=$BASEDIR"
else
  log_warn "$STEP" "$ACTION" \
    "base-count-unavailable: the base package was not found, so the floor check is REDUCED" \
    "Each generated snapshot is still required to have MORE elements than its own" \
    "differential -- which is what catches a differential-only fake -- but it is" \
    "not compared against its base's element count. Pass --base-dir to restore it."
fi

JV=$(java -version 2>&1 | head -1 | tr -d '\n')
log_info "$STEP" "$ACTION" \
  "generating with the OFFICIAL HL7 generator  validator=$VALIDATOR java=\"$JV\" fhir_version=$FHIRVER" \
  "cmd=\`java -jar $VALIDATOR snapshot <sd.json> -version $FHIRVER -tx n/a -ig $SRC -output <out.json>\`" \
  "One invocation PER FILE: a batch run aborts at the first failure and silently" \
  "skips the rest. Nothing here merges a differential by hand (script header)."

OK=0; FAILED=""
while IFS="$(printf '\t')" read -r n orig url id diff snap base; do
  [ -n "${n:-}" ] || continue
  java -jar "$VALIDATOR" snapshot "$WORK/in/$n.json" \
    -version "$FHIRVER" -tx n/a -ig "$SRC" \
    -output "$WORK/in/$n.snap.json" </dev/null >"$WORK/$n.log" 2>&1
  msg=$(grep -aiE 'Exception generating|Error generating|Unsupported format|DefinitionException' \
        "$WORK/$n.log" | sed 's/\x1b\[[0-9;]*m//g' | head -1)
  if [ -s "$WORK/in/$n.snap.json" ] && [ -z "$msg" ]; then
    OK=$((OK + 1))
  else
    FAILED="$FAILED $orig"
    log_warn "$STEP" "$ACTION" \
      "generator-refused: $orig  url=$url reason=${msg:-no output produced}" \
      "The generator declining a differential is EVIDENCE ABOUT THE PARENT, not a" \
      "gap to work around: an upstream differential the official merge cannot" \
      "process is malformed. Do not hand-finish it. Check whether the module's FSH" \
      "names this profile as a Parent or InstanceOf; if it does, this is a Gate-A" \
      "escalation for the upstream package's maintainers (spec §5.1b.4)."
  fi
done <"$WORK/map.tsv"

[ -n "$OUT" ] || OUT="$WORK/rebuilt/package"
MERGE="$WORK/merge.tsv"
python3 - "$SRC" "$WORK" "$OUT" "${BASEDIR:-}" >"$MERGE" <<'PY'
import json
import os
import shutil
import sys

src, work, out, basedir = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]
TAB = "\t"


def rec(level, detail, *cont):
    print(TAB.join(s.replace(TAB, " ") for s in ([level, detail] + list(cont))))


base_counts = {}
if basedir and os.path.isdir(basedir):
    for fn in os.listdir(basedir):
        if not fn.endswith(".json"):
            continue
        try:
            d = json.load(open(os.path.join(basedir, fn), encoding="utf-8"))
        except Exception:
            continue
        if isinstance(d, dict) and d.get("resourceType") == "StructureDefinition" and d.get("url"):
            base_counts[d["url"]] = len(((d.get("snapshot") or {}).get("element")) or [])

if os.path.isdir(out):
    shutil.rmtree(out)
os.makedirs(out, exist_ok=True)
for fn in os.listdir(src):
    s = os.path.join(src, fn)
    if os.path.isfile(s):
        shutil.copyfile(s, os.path.join(out, fn))

merged, refused = 0, []
for line in open(os.path.join(work, "map.tsv"), encoding="utf-8").read().splitlines():
    if not line.strip():
        continue
    n, orig, url, rid, diff, snap, basedef = line.split(TAB)
    gen = os.path.join(work, "in", n + ".snap.json")
    if not os.path.exists(gen):
        continue
    try:
        g = json.load(open(gen, encoding="utf-8"))
    except Exception:
        refused.append("%s (generated file unreadable)" % orig)
        continue
    n_snap = len(((g.get("snapshot") or {}).get("element")) or [])
    n_diff = int(diff)
    # THE CHECK THAT CATCHES A FAKE. A "snapshot" no larger than the
    # differential is the differential renamed. And a real snapshot is at least
    # its base's full element tree, because that is what it merges onto.
    floor = base_counts.get(basedef)
    if g.get("url") != url:
        refused.append("%s (url mismatch: %s)" % (orig, g.get("url")))
        continue
    if n_snap <= n_diff:
        rec("ERROR",
            "snapshot-implausible: %s has %d snapshot element(s) for %d differential "
            "element(s) -- REFUSED  file=%s" % (orig, n_snap, n_diff, orig),
            "A snapshot no larger than the differential it came from is not a",
            "merge result. It is not written into the rebuild; nothing is",
            "'fixed up' to make it pass (spec §5.1b.5).")
        refused.append(orig)
        continue
    if floor is not None and n_snap < floor:
        rec("ERROR",
            "snapshot-below-base: %s has %d snapshot element(s), fewer than its base's "
            "%d  base=%s -- REFUSED  file=%s" % (orig, n_snap, floor, basedef, orig),
            "A profile's snapshot contains its base's whole element tree. Fewer",
            "elements means the merge did not happen as it appears to have.")
        refused.append(orig)
        continue
    target = json.load(open(os.path.join(out, orig), encoding="utf-8"))
    target["snapshot"] = g["snapshot"]
    json.dump(target, open(os.path.join(out, orig), "w", encoding="utf-8"),
              indent=2, ensure_ascii=False)
    merged += 1
    rec("INFO", "snapshot verified and merged  file=%s snapshot=%d differential=%d base=%s"
        % (orig, n_snap, n_diff, floor if floor is not None else "n/a"))

rec("INFO", "rebuild written  dir=%s merged=%d refused=%d" % (out, merged, len(refused)),
    "Only the `snapshot` property was added; every other field is the upstream",
    "bytes re-serialized. Do not diff this against upstream expecting byte",
    "equality -- key order and indentation are the serializer's.")
PY
emit_records "$MERGE"

log_ratio "$STEP" "$ACTION" generated snapshots "$TOTAL" "$OK"

# --- did the parents the migration is BLOCKED ON make it? --------------------
BLOCKED=""
if [ -n "$REQUIRE" ]; then
  for want in $REQUIRE; do
    hit=$(awk -F'\t' -v w="$want" '$3 == w || $4 == w { print $2 }' "$WORK/map.tsv" | head -1)
    if [ -z "$hit" ]; then
      log_error "$STEP" "$ACTION" \
        "required-parent-not-in-package: $want" \
        "The package does not contain it at all, so no snapshot of it can exist" \
        "here. Re-check the parent package and version (source evidence, §2.1.1)."
      BLOCKED="$BLOCKED $want"
      continue
    fi
    if python3 -c 'import json,sys;d=json.load(open(sys.argv[1],encoding="utf-8"));sys.exit(0 if ((d.get("snapshot") or {}).get("element")) else 1)' \
         "$OUT/$hit" 2>/dev/null; then
      log_info "$STEP" "$ACTION" "required parent snapshotted  require=$want file=$hit"
    else
      log_error "$STEP" "$ACTION" \
        "required-parent-still-without-snapshot: $want  file=$hit" \
        "This one blocks the migration: SUSHI still cannot import it. Escalate it" \
        "to Gate A with the generator's reason, and migrate the rest -- never" \
        "fabricate the parent (guardrails 1 and 3)."
      BLOCKED="$BLOCKED $want"
    fi
  done
fi

# --- install as a NEW cache entry --------------------------------------------
if [ "$DO_INSTALL" = 1 ]; then
  [ -n "$INSTALL" ] || INSTALL="$HOME/.fhir/packages/$PKG#$VER-snapshots"
  case "$INSTALL" in
    *-snapshots|*-snapshots/) : ;;
    *) log_error "$STEP" "$ACTION" \
         "refusing-to-install: the destination does not end in \`-snapshots\`  dest=$INSTALL exit=2" \
         "A rebuild is never installed over the upstream package: a cache entry" \
         "silently carrying locally generated snapshots would make every later" \
         "build unreproducible for everyone else."
       exit 2 ;;
  esac
  if [ -e "$INSTALL" ] && [ "$REPLACE" != 1 ]; then
    log_error "$STEP" "$ACTION" \
      "refusing-to-install: the destination exists  dest=$INSTALL exit=2" \
      "Pass --replace to overwrite it deliberately."
    exit 2
  fi
  rm -rf "$INSTALL" 2>/dev/null
  mkdir -p "$INSTALL" || {
    log_error "$STEP" "$ACTION" "setup: cannot create $INSTALL  exit=2"; exit 2; }
  cp -R "$OUT" "$INSTALL/package" || {
    log_error "$STEP" "$ACTION" "setup: cannot copy the rebuild into $INSTALL  exit=2"; exit 2; }
  python3 - "$INSTALL/package/package.json" "$VER-snapshots" "$PKG" "$VER" <<'PY'
import json
import sys

path, newver, pkg, oldver = sys.argv[1:5]
m = json.load(open(path, encoding="utf-8"))
m["version"] = newver
m["description"] = (
    "LOCAL SNAPSHOT-BEARING REBUILD of %s %s, generated with the official HL7 "
    "validator_cli snapshot command (ProfileUtilities). NOT an upstream release."
    % (pkg, oldver))
json.dump(m, open(path, "w", encoding="utf-8"), indent=2, ensure_ascii=False)
PY
  log_info "$STEP" "$ACTION" \
    "installed as a NEW cache entry  dest=$INSTALL version=$VER-snapshots" \
    "Upstream $PKG#$VER is untouched. Depend on it by pinning" \
    "\`$PKG: $VER-snapshots\` in sushi-config.yaml -- and note that this entry is" \
    "LOCAL: CI and every other machine need this same build step, or the pin" \
    "fails to resolve there (spec §5.1b.5, 'carrying it upstream')."
fi

if [ -n "$FAILED" ]; then
  log_warn "$STEP" "$ACTION" \
    "rebuild-incomplete: the generator refused $(echo "$FAILED" | wc -w | tr -d ' ') of $TOTAL StructureDefinition(s)  files=${FAILED# }" \
    "Each refusal is named above with the generator's own reason. Decide per file" \
    "whether the module's FSH depends on it; those that it does are Gate-A" \
    "escalations for the upstream maintainers."
fi

if [ -n "$BLOCKED" ]; then
  log_info "$STEP" "$ACTION" \
    "done  mode=build generated=$OK of $TOTAL required_blocked=${BLOCKED# } exit=1"
  exit 1
fi
if [ -n "$REQUIRE" ]; then
  log_info "$STEP" "$ACTION" \
    "done  mode=build generated=$OK of $TOTAL required=all-snapshotted exit=0" \
    "Re-run SUSHI now and compare the error count against the run BEFORE this" \
    "step; that difference is the evidence, not this script's exit status."
  exit 0
fi
if [ "$OK" -lt "$TOTAL" ]; then
  log_info "$STEP" "$ACTION" "done  mode=build generated=$OK of $TOTAL exit=1"
  exit 1
fi
log_info "$STEP" "$ACTION" "done  mode=build generated=$OK of $TOTAL exit=0"
exit 0
