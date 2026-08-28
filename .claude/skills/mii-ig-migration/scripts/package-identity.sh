#!/usr/bin/env bash
# package-identity -- recover a module's identity from its PUBLISHED FHIR package
# and report it, field by field, into the migration run log (spec §2.1, tier 0).
#
# WHY THIS EXISTS. A Forge/Simplifier-authored module keeps NO identity in its
# repository: no `sushi-config.yaml`, no `package.json`, no generated
# `ImplementationGuide`. Every tier of the §2.1 identity chain is then empty and
# the migration stops at Gate A asking a human for everything -- which is more
# pessimistic than the evidence requires. A module that was PUBLISHED carries its
# identity inside the package tarball, and this script reads it back:
#
#   curl -sfL "https://packages.simplifier.net/<packageId>/<version>" -o pkg.tgz
#   tar xzf pkg.tgz    # -> package/package.json + the packaged resources
#
# Measured on `de.medizininformatikinitiative.kerndatensatz.consent@2026.0.0`
# (2026-08-06): the manifest yields `name` (= packageId), `version` 2026.0.0,
# `description`, `fhirVersions`, `jurisdiction`, `author` and the dependency pins
# `hl7.fhir.r4.core@4.0.1` + `de.einwilligungsmanagement@2.0.2`; the canonical
# comes from the packaged resources' own `url` values, 13 of 13 agreeing on
# `https://www.medizininformatik-initiative.de/fhir/modul-consent`.
#
# IT REPORTS. IT NEVER WRITES INTO THE MODULE. Recovered values are evidence for
# a human decision at Gate A, not a patch: nothing in this script edits a
# `sushi-config.yaml`, a manifest or a resource, and existing metadata -- even
# metadata this script shows to be inconsistent -- is left exactly as it is. Its
# only writes are the run log and a scratch directory it removes again.
#
# WHAT IT DOES NOT GUESS
#
#   * The canonical is derived by taking each resource's own `url`, removing the
#     trailing `/<ResourceType>/<id>`, and requiring the remainders to be
#     UNANIMOUS. A split vote is a FINDING, not a majority vote: the script WARNs
#     `canonical-not-unanimous:`, names every candidate with its count and an
#     example, emits no canonical and exits 1. Two resource sets living under two
#     bases is a real condition (a module absorbing another's artefacts), and
#     picking the bigger pile would silently re-home the smaller one.
#   * A url that is not absolute-http(s) carries no base and is excluded, by name.
#     Measured on the reference module: two CodeSystems published under
#     `urn:oid:2.16.840.1.113883.3.1937.777.24.5.x`, and the packaged
#     `ImplementationGuide` whose `url` is the RELATIVE Simplifier guide path
#     `/guide/mii-ig-modul-consent-2026?version=current`. Neither is a canonical
#     base, and treating either as one would invent identity.
#   * `title`, `license` and `publisher` are NOT in a FHIR package manifest. The
#     script names them as absent rather than substituting something adjacent --
#     `author` above all, which is the REGISTRY ACCOUNT that pushed the package
#     (measured: `sebastianstubert`), not a publishing organisation.
#   * The version. With `--version` the operator's value is used verbatim. Without
#     it the script takes `dist-tags.latest` and says so -- and WARNs
#     `version-above-latest:` when the registry lists version strings ABOVE it,
#     because the highest string is routinely a prerelease. Measured: the Consent
#     package's highest string is `2026.0.1-rc-3` while `latest` is `2026.0.0`.
#
# USAGE
#
#   package-identity.sh --package ID [--version V] [--registry URL]
#                       [--keep DIR] [--step S] [--action A]
#
#     --package ID   the FHIR package id, e.g.
#                    de.medizininformatikinitiative.kerndatensatz.consent
#     --version V    the version to read. Omitted -> `dist-tags.latest`, reported
#                    as such. A migration reads the version the SOURCE COMMIT
#                    corresponds to; confirm it against the resources' own
#                    versions before treating `latest` as the source.
#     --registry URL package registry base (default https://packages.simplifier.net;
#                    https://packages.fhir.org serves the same packages)
#     --keep DIR     extract into DIR and keep it, instead of a scratch directory
#                    that is removed. DIR must not exist -- this script never
#                    writes over anything.
#     --step S       run-log STEP field   (default 2.1)
#     --action A     run-log ACTION field (default package-identity)
#
# Call it DIRECTLY, not through `migration-log.sh run --emits-runlog`: it emits
# its lines through the helper as a library, so a wrapper that also folds stdout
# into the run log duplicates every line. Like `gofsh-results.sh`.
#
# Exit codes: 0 = package read and a unanimous canonical derived; 1 = package
# read, but the canonical is NOT derivable (no usable url, or a split vote) --
# a Gate-A item, and a usable CI gate; 2 = setup error (bad arguments, missing
# curl/python3/tar, registry or tarball unreachable, no manifest in the tarball)
# -- nothing is reported, and an absent field is never reported as empty.
#
# Bash 3.2 compatible; python3 is used for JSON only, matching the rest of the
# skill's scripts (`Bash(python3:*)` is in `allowed-tools`).

set -u

_here() { cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd; }
# shellcheck source=./migration-log.sh
. "$(_here)/migration-log.sh"

STEP=2.1
ACTION=package-identity
PKG=""
VER=""
REGISTRY="https://packages.simplifier.net"
KEEP=""

while [ $# -gt 0 ]; do
  case "$1" in
    --package)  PKG="${2:-}";      shift 2 || true ;;
    --version)  VER="${2:-}";      shift 2 || true ;;
    --registry) REGISTRY="${2:-}"; shift 2 || true ;;
    --keep)     KEEP="${2:-}";     shift 2 || true ;;
    --step)     STEP="${2:-}";     shift 2 || true ;;
    --action)   ACTION="${2:-}";   shift 2 || true ;;
    -h|--help)
      sed -n '2,/^set -u/p' "${BASH_SOURCE[0]}" | sed '$d' | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *) printf 'package-identity: unknown option %s  exit=2\n' "$1" >&2; exit 2 ;;
  esac
done

if [ -z "$PKG" ]; then
  printf 'package-identity: --package ID is required  exit=2\n' >&2
  exit 2
fi
REGISTRY="${REGISTRY%/}"
for t in curl python3 tar; do
  command -v "$t" >/dev/null 2>&1 || {
    printf 'package-identity: %s is required and not on PATH  exit=2\n' "$t" >&2
    exit 2; }
done
if [ -n "$KEEP" ] && [ -e "$KEEP" ]; then
  log_error "$STEP" "$ACTION" \
    "setup: --keep target already exists  keep=$KEEP exit=2" \
    "This script never writes over an existing path. Name a new directory."
  exit 2
fi

# --- the scratch directory ---------------------------------------------------
# Everything below is extracted here and read; nothing is extracted into the
# module repository, which this script only ever reports ABOUT.
if [ -n "$KEEP" ]; then
  mkdir -p "$KEEP" 2>/dev/null || {
    log_error "$STEP" "$ACTION" "setup: cannot create $KEEP  exit=2"; exit 2; }
  WORK="$KEEP"
else
  WORK=$(mktemp -d 2>/dev/null) || {
    log_error "$STEP" "$ACTION" "setup: cannot create a scratch directory  exit=2"; exit 2; }
  trap 'rm -rf "$WORK"' EXIT
fi

log_info "$STEP" "$ACTION" \
  "params  package=$PKG version=${VER:-<from dist-tags.latest>} registry=$REGISTRY work=$WORK" \
  "Reporting only: no file in the module repository is read or written here." \
  "Recovered values are Gate-A evidence, never applied to existing metadata."

# --- resolve the version -----------------------------------------------------
# `dist-tags.latest` is the registry's own answer to "which release is current",
# and it is NOT the highest version string: prereleases outrank it lexically.
if [ -z "$VER" ]; then
  ROOT="$WORK/registry-root.json"
  if ! curl -sfL "$REGISTRY/$PKG" -o "$ROOT" 2>/dev/null; then
    log_error "$STEP" "$ACTION" \
      "setup: cannot read the registry entry  cmd=\`curl -sfL $REGISTRY/$PKG\` exit=2" \
      "A package id that does not resolve is a Gate-A escalation (spec §2.1)," \
      "never a reason to invent one from the canonical's shape."
    exit 2
  fi
  VER=$(python3 - "$ROOT" <<'PY'
import json, sys
try:
    d = json.load(open(sys.argv[1], encoding="utf-8"))
except Exception:
    d = {}
print((d.get("dist-tags") or {}).get("latest") or "")
PY
)
  if [ -z "$VER" ]; then
    log_error "$STEP" "$ACTION" \
      "setup: the registry entry names no dist-tags.latest  package=$PKG exit=2" \
      "Pass --version explicitly; an absent tag is not a reason to pick a version."
    exit 2
  fi
  ABOVE=$(python3 - "$ROOT" "$VER" <<'PY'
import json, re, sys
d = json.load(open(sys.argv[1], encoding="utf-8"))
latest = sys.argv[2]


def key(v):
    # Compare on the numeric release triple only; anything after it (-rc-3,
    # -ballot1, -alpha) is a prerelease of that triple and sorts BELOW it,
    # which is what makes "higher string" and "later release" different.
    m = re.match(r"^(\d+)\.(\d+)\.(\d+)(.*)$", v)
    if not m:
        return (0, 0, 0, 1, v)
    a, b, c, rest = m.groups()
    return (int(a), int(b), int(c), 1 if rest == "" else 0, rest)


above = [v for v in (d.get("versions") or {}) if key(v) > key(latest)]
print(" ".join(sorted(above)))
PY
)
  log_info "$STEP" "$ACTION" \
    "version resolved from the registry  version=$VER source=dist-tags.latest package=$PKG"
  if [ -n "$ABOVE" ]; then
    log_warn "$STEP" "$ACTION" \
      "version-above-latest: the registry lists version string(s) above dist-tags.latest  latest=$VER above=$ABOVE" \
      "The highest string is routinely a PRERELEASE, so it is not automatically" \
      "the module's version. Confirm which release the migrated source commit" \
      "corresponds to -- the resources' own versions are the check -- and pass it" \
      "with --version rather than accepting either end by default."
  fi
else
  log_info "$STEP" "$ACTION" \
    "version supplied by the operator  version=$VER source=--version package=$PKG"
fi

# --- fetch and unpack --------------------------------------------------------
TGZ="$WORK/package.tgz"
URL="$REGISTRY/$PKG/$VER"
if ! curl -sfL "$URL" -o "$TGZ" 2>/dev/null; then
  log_error "$STEP" "$ACTION" \
    "setup: cannot fetch the package  cmd=\`curl -sfL $URL -o pkg.tgz\` exit=2" \
    "Either the version does not exist or the registry is unreachable. A package" \
    "that cannot be fetched yields no identity -- and no identity is not a default."
  exit 2
fi
if ! tar xzf "$TGZ" -C "$WORK" 2>/dev/null; then
  log_error "$STEP" "$ACTION" \
    "setup: the fetched file is not a readable tarball  file=$TGZ exit=2" \
    "Registries answer an unknown version with an HTML or JSON error body; read it."
  exit 2
fi
if [ ! -f "$WORK/package/package.json" ]; then
  log_error "$STEP" "$ACTION" \
    "setup: no package/package.json in the tarball  file=$TGZ exit=2" \
    "Every FHIR package carries its manifest at that path; its absence means this" \
    "is not one, and nothing below can be read out of it."
  exit 2
fi
BYTES=$(wc -c <"$TGZ" 2>/dev/null | tr -d ' ')
NRES=$(find "$WORK/package" -type f -name '*.json' ! -name 'package.json' ! -name '.index.json' \
       | wc -l | tr -d ' ')
log_info "$STEP" "$ACTION" \
  "fetched  cmd=\`curl -sfL $URL -o pkg.tgz && tar xzf pkg.tgz\`  bytes=${BYTES:-0} json_files=${NRES:-0} manifest=package/package.json"

# --- read the manifest and derive the canonical ------------------------------
# python3 emits one record per line -- LEVEL <TAB> DETAIL [<TAB> CONT ...] -- and
# bash turns each into a run-log line through the helper, so the format is never
# hand-assembled here either.
RECORDS="$WORK/records.tsv"
python3 - "$WORK/package" >"$RECORDS" <<'PY'
import json
import os
import re
import sys

root = sys.argv[1]
TAB = "\t"


def rec(level, detail, *cont):
    # TAB separates the fields the shell reads back, so no field may contain one.
    # A value that does is a corrupted line, not a smaller problem than the tab.
    print(TAB.join(s.replace(TAB, " ") for s in ([level, detail] + list(cont))))


def claim(field, value, source):
    # One row in the per-field identity ledger (spec §2.1.4): FIELD, VALUE and
    # the SOURCE it was read from. The shell turns this into
    # `migration-log.sh claim`, which is what raises `identity-contradiction:`
    # when another tier already recorded a different value for the same field.
    rec("CLAIM", field, str(value), source)


man = json.load(open(os.path.join(root, "package.json"), encoding="utf-8"))

# --- what the manifest yields -----------------------------------------------
# Named one by one, because "read the manifest" is not a record: a reviewer at
# Gate A has to see WHICH value came from WHERE.
present, absent = [], []
for field, note in (
    ("name", "= packageId (spec §2.1)"),
    ("version", "the module version -- authoritative for this RELEASE"),
    ("description", ""),
    ("fhirVersions", ""),
    ("jurisdiction", ""),
    ("author", "a REGISTRY ACCOUNT, not `publisher`"),
    ("canonical", "declared canonical, where a manifest carries one"),
    ("title", ""),
    ("license", ""),
    ("publisher", ""),
    ("homepage", ""),
):
    v = man.get(field)
    if v in (None, "", [], {}):
        absent.append(field)
        continue
    if isinstance(v, (list, dict)):
        v = json.dumps(v, ensure_ascii=False, sort_keys=True)
    v = re.sub(r"\s+", " ", str(v)).strip()
    if len(v) > 160:
        v = v[:157] + "..."
    present.append(field)
    rec("INFO", "manifest field  %s=%s%s" % (field, v, ("  -- " + note) if note else ""))
    # `author` is deliberately NOT claimed: it is a registry account, and a
    # ledger row for it would read as a `publisher` to the next person.
    if field != "author":
        claim("packageId" if field == "name" else field, v, "package/package.json")

rec("INFO", "manifest read  package/package.json  recovered=%d absent=%d fields=%s"
    % (len(present), len(absent), ",".join(present)))

# The three the migration will still have to ask for. Named as absent rather
# than filled from something adjacent: a FHIR package manifest has no place for
# them, so their absence is a property of the format, not of this package.
MISSING_BY_FORMAT = [f for f in ("title", "license", "publisher") if f in absent]
if MISSING_BY_FORMAT:
    rec("WARN",
        "not-in-a-package-manifest: %s" % ", ".join(MISSING_BY_FORMAT),
        "A FHIR package manifest has no field for these, so the published package",
        "cannot supply them and no other field substitutes -- `author` is the",
        "registry account that pushed the package, never a publishing organisation.",
        "They stay Gate-A items: a human supplies them (spec §2.1).")
other_absent = [f for f in absent if f not in MISSING_BY_FORMAT]
if other_absent:
    rec("INFO", "manifest fields absent (optional in this format)  %s" % ", ".join(other_absent))

# --- dependencies ------------------------------------------------------------
deps = man.get("dependencies") or {}
for k, v in sorted(deps.items()):
    # One ledger row per dependency, so that a pin read anywhere else -- goFSH's
    # derived config, the registry's dist-tags.latest -- collides with THIS one
    # visibly instead of quietly replacing it.
    claim("dependency:%s" % k, v, "package/package.json (source pin)")
if deps:
    rec("INFO",
        "dependency pins from the SOURCE package  %s"
        % " ".join("%s@%s" % (k, v) for k, v in sorted(deps.items())),
        "SOURCE EVIDENCE, and it outranks the registry's dist-tags.latest for the",
        "same package (spec §2.1 floating-pin rule, §5.1b.2 step 1): this is what",
        "the module was actually published against. Use these for goFSH's `-d` set",
        "and record any divergence from a previously assumed pin in the report.")
else:
    rec("WARN", "no-dependencies-declared: the manifest lists none",
        "Every foreign parent then has to be resolved canonical-by-canonical",
        "against the registry (spec §5.1b.2) -- and that resolution is a guess",
        "about the VERSION unless other source evidence pins it.")

# --- the canonical, by common prefix ----------------------------------------
# Each resource's own `url` minus its trailing /<ResourceType>/<id> is that
# resource's canonical base. The module's canonical is that base ONLY when every
# resource agrees; disagreement is reported, never resolved by counting heads.
bases, unusable, nourl, igs = {}, [], [], []
for dirpath, _dirnames, filenames in os.walk(root):
    for fn in sorted(filenames):
        if not fn.endswith(".json") or fn in ("package.json", ".index.json"):
            continue
        path = os.path.join(dirpath, fn)
        rel = os.path.relpath(path, root)
        try:
            d = json.load(open(path, encoding="utf-8"))
        except Exception:
            unusable.append("%s (unparseable)" % rel)
            continue
        if not isinstance(d, dict) or not d.get("resourceType"):
            continue
        if d.get("resourceType") == "ImplementationGuide":
            igs.append((rel, d))
        url = d.get("url")
        if not url:
            nourl.append("%s [%s]" % (rel, d.get("resourceType")))
            continue
        if not re.match(r"^https?://", url):
            unusable.append("%s -> %s (not an absolute http(s) URL)" % (rel, url))
            continue
        parts = url.split("/")
        # .../<ResourceType>/<id> -- the FHIR canonical shape. A url that does not
        # end that way is reported, not reshaped into something that does.
        if len(parts) < 3 or not re.match(r"^[A-Z][A-Za-z]+$", parts[-2]):
            unusable.append("%s -> %s (no trailing /<ResourceType>/<id>)" % (rel, url))
            continue
        bases.setdefault("/".join(parts[:-2]), []).append(rel)

for rel, d in igs:
    ig_url = d.get("url") or "<none>"
    rec("INFO",
        "packaged ImplementationGuide  file=%s url=%s version=%s name=%s title=%s "
        "publisher=%s license=%s"
        % (rel, ig_url, d.get("version") or "-", d.get("name") or "-",
           d.get("title") or "<absent>", d.get("publisher") or "<absent>",
           d.get("license") or "<absent>"))
    if not re.match(r"^https?://", str(ig_url)):
        rec("WARN",
            "ig-url-not-canonical: the packaged ImplementationGuide's url is not "
            "an absolute http(s) URL  url=%s" % ig_url,
            "A Simplifier-rendered guide carries its own relative guide path here.",
            "It is a rendering address, not the module's canonical base, and it is",
            "excluded from the derivation below.")

if unusable:
    rec("INFO", "urls excluded from the canonical derivation  count=%d" % len(unusable),
        *["  " + u for u in unusable])
if nourl:
    rec("INFO", "packaged resources carrying no url  count=%d" % len(nourl),
        *["  " + u for u in nourl])

total = sum(len(v) for v in bases.values())
if not bases:
    rec("ERROR", "canonical-not-derivable: no packaged resource carries a usable "
                 "absolute canonical url  urls=0  exit=1",
        "Nothing is inferred from the package id or the guide's rendering address.",
        "The canonical becomes a Gate-A item (spec §2.1).")
elif len(bases) == 1:
    base, files = next(iter(bases.items()))
    claim("canonical", base, "packaged resource urls (%d of %d agree)" % (len(files), total))
    rec("INFO", "canonical derived by common prefix  canonical=%s agree=%d of %d"
        % (base, len(files), total),
        "Unanimous: every packaged resource with an absolute canonical url shares",
        "this base. Carried over UNCHANGED -- guardrail 1. It is not written",
        "anywhere by this script; a human records it at Gate A.")
else:
    ranked = sorted(bases.items(), key=lambda kv: (-len(kv[1]), kv[0]))
    rec("WARN",
        "canonical-not-unanimous: %d distinct canonical bases across %d resource url(s) "
        "-- NOT resolved by majority  bases=%d urls=%d exit=1"
        % (len(bases), total, len(bases), total),
        *(["A split vote is a finding. Picking the larger set would silently re-home",
           "the smaller one, and a changed published canonical breaks every consumer",
           "that resolves it (guardrail 1). Every candidate, with an example:"]
          + ["  %s  (%d resource(s), e.g. %s)" % (b, len(f), f[0]) for b, f in ranked]
          + ["Take it to Gate A; do not pick one here."]))
PY
PYSTATUS=$?
if [ "$PYSTATUS" -ne 0 ]; then
  log_error "$STEP" "$ACTION" \
    "setup: reading the package failed  exit=2 work=$WORK" \
    "Nothing is reported from a partial read -- an absent field must never reach" \
    "the log as an empty one."
  exit 2
fi

# --- emit ---------------------------------------------------------------------
RC=0
while IFS="$(printf '\t')" read -r level detail c1 c2 c3 c4 c5 c6 c7 c8 c9 c10; do
  [ -n "${level:-}" ] || continue
  CONTS=()
  for c in "$c1" "$c2" "$c3" "$c4" "$c5" "$c6" "$c7" "$c8" "$c9" "$c10"; do
    [ -n "$c" ] && CONTS+=("$c")
  done
  case "$level" in
    ERROR) log_error "$STEP" "$ACTION" "$detail" ${CONTS[@]+"${CONTS[@]}"}; RC=1 ;;
    WARN)  log_warn  "$STEP" "$ACTION" "$detail" ${CONTS[@]+"${CONTS[@]}"}
           case "$detail" in canonical-not-unanimous:*) RC=1 ;; esac ;;
    # CLAIM: detail=FIELD, c1=VALUE, c2=SOURCE -- tier P by construction, since
    # everything this script reads comes out of the published package.
    CLAIM) log_claim "$STEP" "$ACTION" "$detail" "$c1" P "$c2" ;;
    *)     log_info  "$STEP" "$ACTION" "$detail" ${CONTS[@]+"${CONTS[@]}"} ;;
  esac
done <"$RECORDS"

if [ "$RC" -eq 0 ]; then
  log_info "$STEP" "$ACTION" \
    "done  package=$PKG version=$VER  canonical=derived exit=0" \
    "Identity RECOVERED, not applied: record it at Gate A against the module's" \
    "own existing metadata, and change nothing that already carries a value."
else
  log_info "$STEP" "$ACTION" \
    "done  package=$PKG version=$VER  canonical=not-derived exit=1" \
    "The package was read; the canonical was not derivable from it. That is a" \
    "Gate-A item (spec §2.1), not a licence to infer one."
fi
exit "$RC"
