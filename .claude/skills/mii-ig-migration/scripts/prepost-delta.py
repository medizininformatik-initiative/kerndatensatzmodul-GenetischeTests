#!/usr/bin/env python3
"""prepost-delta -- compare the PRE-migration ig-stats measurement with the
POST-migration one, write the delta as Markdown (and optionally TSV), and FAIL
when any property got WORSE.

WHY THIS EXISTS. The migration begins and ends with the same instrument: the
ig-stats analyzer runs once against the unmigrated source (step 1,
`preflight-analysis.json`) and once against the migrated target
(`postflight-analysis.json`). Each file is a few hundred measured facts, and a
human asked to compare two of them side by side compares the four numbers they
remember and trusts the rest. The rest is where the losses hide: an artefact
class whose count quietly dropped by two, a licence that now contradicts
itself because the skeleton shipped its own LICENSE file, a dependency
injection risk that was clean before the migration and is not after it.

The two JSON files are the measurements; this script is the comparison that
cannot get bored. Every property it reads becomes one ROW -- property, pre,
post, verdict -- and the verdict vocabulary is closed:

    unchanged        the value is the same on both sides
    improved         the property got BETTER (a risk flag cleared, the
                     directive count fell)
    REGRESSION       the property got WORSE -- this is the exit-1 class
    expected-change  the property changed the way a migration is SUPPOSED to
                     change it (narrative routing moved page counts, new
                     artefacts were added) -- named, so the report can say why
    not-measurable   a side is missing the key; reported, never guessed at,
                     never a crash

WHAT COUNTS AS A REGRESSION, verbatim from the contract:

  * a MACHINE-IDENTITY field changed (id, canonical, packageId, name, version,
    fhirVersion, license) -- the published package would change identity.
    Descriptive metadata (publisher, title, status, ...) is NOT identity: a
    migration legitimately updates it, so a change there is reported as
    expected-change for the report to confirm, not failed.
  * licence `contradictory` went false -> true (the target now declares more
    than one licence); true -> false is improved.
  * dependency `injection_risk` went false -> true; true -> false is improved.
  * narrative `dual_source` went false -> true (the migration introduced a
    second narrative source tree); true -> false is improved.
  * ANY artefact count DROPPED -- per class, INCLUDING every class inside the
    other-bucket, `other_total` and `total`. A rise is expected-change (the
    migration added content; the report names it), a drop is content lost.
    EXCEPTION -- census modes. When the two measurements' top-level `mode`
    fields DIFFER (ig-stats reports `reduced` for a raw-resource census and
    `static` for a full FSH-declaration one -- they diverge on the
    Consent/harvest source shape, where the source repo holds Forge XML and
    the target holds FSH), per-class counts are NOT comparable: the two
    census styles classify the same artefacts differently
    (measured on PROs: 130 vs 47 examples on the SAME module). Every
    artefact-count difference is then reported as expected-change with the
    modes named, never as a regression -- and conservation of the artefacts
    themselves is the verifier's C1 question, answered by id, not by count.
    Identity, licence, directive and flag regressions are unaffected.
  * the directive count ROSE. A drop is improved -- converting the
    Simplifier/FQL directives away is one of the things the migration is FOR.

Narrative page counts (`pages`, `intro_note_pages`, `translation_pages`) are
the one family where BOTH directions are expected-change: the spec 9d/9e
routing deliberately moves pages between pagecontent, intro-notes and
translations, so 305 -> 22 here is the routing working, not 283 pages lost.
(Whether the routed content actually arrived is the verifier's C3/C4 question,
answered against page-map.tsv -- not this script's.)

Usage:

  prepost-delta.py --pre <preflight.json> --post <postflight.json>
                   --out <delta.md> [--tsv <delta.tsv>]

    --pre FILE     the ig-stats JSON measured against the SOURCE (step 1)
    --post FILE    the ig-stats JSON measured against the migrated TARGET
    --out FILE     the Markdown delta report (the human rendering)
    --tsv FILE     additionally write the machine artefact, exactly
                   `property<TAB>pre<TAB>post<TAB>verdict`
    -h, --help     print this text and exit 0

STREAMS. stdout carries the one-line summary. The opening line, one ERROR line
per regression and one WARN line per not-measurable property go to stderr, so
the regressions reach a human and the raw log even when stdout is redirected.

Exit codes:
    0  compared, no regression (improvements and expected changes are fine)
    1  at least one REGRESSION (the reports are still written; they are the
       artefact, not the verdict)
    2  usage/setup error -- a file missing or unparseable -- nothing written

Run-log lines (spec section 10.2) follow the catalog convention, so this
script is wrapped as
`bash "$ML" run 7 prepost-delta --emits-runlog -- python3 .../prepost-delta.py …`.

stdlib only, like the rest of the catalog's scripts.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import sys
import time

# --- run-log convention (spec section 10) -----------------------------------
STEP = "7"
ACTION = "prepost-delta"
_LEVEL = {"INFO": "INFO ", "WARN": "WARN ", "ERROR": "ERROR"}

# `migration-log.sh run` exports this; wrapped, our own opening/closing lines
# become `params`/`result` so one execution yields one `start` and one `done`.
WRAPPED = os.environ.get("MIGRATION_LOG_WRAPPED") == "1"
OPEN_WORD = "params" if WRAPPED else "start"
CLOSE_WORD = "result" if WRAPPED else "done"

# --- the contract, as data --------------------------------------------------

# The closed verdict set. `REGRESSION` is deliberately the one loud word in a
# lowercase vocabulary: a table scanned in thirty seconds must make the bad row
# the one that is typographically different.
UNCHANGED = "unchanged"
IMPROVED = "improved"
REGRESSION = "REGRESSION"
EXPECTED = "expected-change"
NOT_MEASURABLE = "not-measurable"

# MACHINE identity: a change here means the published package is a different
# package. Descriptive metadata is everything else under identity{} -- it may
# legitimately change during a migration (a publisher renamed, a title
# corrected), so it reports as expected-change and the report confirms it.
IDENTITY_MACHINE = ("id", "canonical", "packageId", "name",
                    "version", "fhirVersion", "license")

# Artefact classes in the order the analyzer prints them, so the two tables
# read in the same order. Classes present in the JSON but not listed here
# (a future analyzer version) are still compared -- appended alphabetically,
# never dropped: an uncompared count is where the next loss hides.
ARTIFACT_CLASSES = ("profiles", "extensions", "valuesets", "codesystems",
                    "logicals", "capabilitystatements", "questionnaires",
                    "searchparameters", "operations", "examples", "rulesets",
                    "invariants", "mappings")
# Keys under artifacts{} that are not artefact-class counts.
ARTIFACT_NON_CLASSES = {"other", "total", "other_total"}

NARRATIVE_KEYS = ("pages", "intro_note_pages", "translation_pages")

MISSING = object()      # sentinel: the key is absent, which is not the same as null


def log(level, detail, cont=(), step=STEP, action=ACTION):
    """One run-log line plus indented continuations, flushed immediately.

    Everything except the closing summary goes to stderr: stdout is the
    machine-readable surface, and a regression printed into a redirected
    stdout is a regression nobody saw.
    """
    stream = sys.stdout if level == "SUMMARY" else sys.stderr
    ts = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
    print("%s  %s  %s  %s  %s"
          % (ts, _LEVEL.get(level, _LEVEL["INFO"]), step, action, detail),
          file=stream, flush=True)
    for c in cont:
        print("    %s" % c, file=stream, flush=True)


def clean(s):
    """TSV-safe and single-line: tabs and newlines are the only characters the
    format cannot carry, so they are folded rather than allowed to corrupt a
    row silently. Runs of any whitespace collapse to one space."""
    return re.sub(r"\s+", " ", str(s)).strip()


def fmt(value):
    """One cell. Booleans render JSON-style so the TSV round-trips; the
    MISSING sentinel renders as `-` -- visibly absent, not visibly empty."""
    if value is MISSING or value is None:
        return "-"
    if isinstance(value, bool):
        return "true" if value else "false"
    return clean(value)


def dig(data, *keys):
    """Walk nested dicts; MISSING the moment a key is not there. A missing key
    and a key holding null are both MISSING for comparison purposes -- neither
    is a value this script may invent a verdict about."""
    node = data
    for key in keys:
        if not isinstance(node, dict) or key not in node:
            return MISSING
        node = node[key]
    return MISSING if node is None else node


# --- one row of the delta ---------------------------------------------------

class Row:
    """One compared property: the TSV row plus the section and the reason the
    Markdown rendering shows. `why` is filled at comparison time, because the
    reason a verdict was reached is knowledge the comparison has and the
    rendering should not re-derive."""

    def __init__(self, section, prop, pre, post, verdict, why):
        self.section = section
        self.prop = prop
        self.pre = pre
        self.post = post
        self.verdict = verdict
        self.why = clean(why)

    def tsv(self):
        return (self.prop, fmt(self.pre), fmt(self.post), self.verdict)


def verdict_for_flag(pre, post, worse_why, better_why):
    """A boolean risk flag: false is the good state on every flag this script
    reads, so false -> true is the regression direction for all of them."""
    if pre is MISSING or post is MISSING:
        return NOT_MEASURABLE, "the flag is absent from %s measurement" % (
            "the pre" if pre is MISSING else "the post")
    if bool(pre) == bool(post):
        return UNCHANGED, ""
    if not pre and post:
        return REGRESSION, worse_why
    return IMPROVED, better_why


def verdict_for_count(pre, post, drop_why, rise_why):
    """A count where MORE is expected and FEWER is loss."""
    if pre is MISSING or post is MISSING:
        return NOT_MEASURABLE, "the count is absent from %s measurement" % (
            "the pre" if pre is MISSING else "the post")
    if pre == post:
        return UNCHANGED, ""
    if post < pre:
        return REGRESSION, drop_why % (pre - post)
    return EXPECTED, rise_why % (post - pre)


# --- the comparison ---------------------------------------------------------

def compare_identity(pre, post):
    rows = []
    pre_id = dig(pre, "identity")
    post_id = dig(post, "identity")
    pre_id = pre_id if isinstance(pre_id, dict) else {}
    post_id = post_id if isinstance(post_id, dict) else {}
    descriptive = sorted((set(pre_id) | set(post_id)) - set(IDENTITY_MACHINE))

    for field in list(IDENTITY_MACHINE) + descriptive:
        a = dig(pre_id, field)
        b = dig(post_id, field)
        prop = "identity.%s" % field
        machine = field in IDENTITY_MACHINE
        if a is MISSING and b is MISSING:
            continue                      # neither side measures it: no row to argue about
        if a is MISSING or b is MISSING:
            rows.append(Row("identity", prop, a, b, NOT_MEASURABLE,
                            "the field is absent from %s measurement"
                            % ("the pre" if a is MISSING else "the post")))
        elif a == b:
            rows.append(Row("identity", prop, a, b, UNCHANGED, ""))
        elif machine:
            rows.append(Row("identity", prop, a, b, REGRESSION,
                            "machine-identity field changed -- the migrated "
                            "package is no longer the same package"))
        else:
            rows.append(Row("identity", prop, a, b, EXPECTED,
                            "descriptive metadata, not machine identity -- "
                            "confirm the change is deliberate in the report"))
    return rows


def compare_flags(pre, post):
    rows = []

    a = dig(pre, "preflight", "licence", "contradictory")
    b = dig(post, "preflight", "licence", "contradictory")
    distinct = dig(post, "preflight", "licence", "distinct_values")
    declared = (" (the target declares: %s)"
                % ", ".join(map(str, distinct))) if isinstance(distinct, list) else ""
    verdict, why = verdict_for_flag(
        a, b,
        "the target now declares CONTRADICTORY licences%s -- one file will be "
        "read as the licence by someone, and it will be the wrong one" % declared,
        "the licence declarations agree again")
    rows.append(Row("flags", "licence.contradictory", a, b, verdict, why))

    a = dig(pre, "preflight", "dependency_health", "injection_risk")
    b = dig(post, "preflight", "dependency_health", "injection_risk")
    verdict, why = verdict_for_flag(
        a, b,
        "the migration INTRODUCED a dependency-injection risk the source did "
        "not have",
        "the dependency-injection risk the source carried is cleared")
    rows.append(Row("flags", "dependency_health.injection_risk", a, b, verdict, why))

    a = dig(pre, "preflight", "narrative_sources", "dual_source")
    b = dig(post, "preflight", "narrative_sources", "dual_source")
    verdict, why = verdict_for_flag(
        a, b,
        "the migration introduced a SECOND narrative source tree -- two trees "
        "is how the wrong one gets edited",
        "the narrative has ONE source tree again")
    rows.append(Row("flags", "narrative_sources.dual_source", a, b, verdict, why))
    return rows


def census_modes(pre, post):
    """The two measurements' top-level `mode` fields and whether they differ.
    Differing modes (ig-stats: `reduced` = raw-resource census, `static` =
    full FSH-declaration census) make per-class counts incomparable -- see
    the docstring's EXCEPTION."""
    pre_mode = dig(pre, "mode")
    post_mode = dig(post, "mode")
    differ = (pre_mode is not MISSING and post_mode is not MISSING
              and pre_mode != post_mode)
    return pre_mode, post_mode, differ


def compare_artifacts(pre, post):
    rows = []
    pre_a = dig(pre, "artifacts")
    post_a = dig(post, "artifacts")
    pre_a = pre_a if isinstance(pre_a, dict) else {}
    post_a = post_a if isinstance(post_a, dict) else {}

    pre_mode, post_mode, modes_differ = census_modes(pre, post)
    mode_why = ("census modes differ (pre=%s, post=%s): a raw-resource census "
                "and an FSH-declaration census classify the same artefacts "
                "differently, so a count difference here is not evidence of "
                "loss -- conservation is checked by id, not by count (the "
                "verifier's C1)" % (fmt(pre_mode), fmt(post_mode)))
    if pre_mode is MISSING or post_mode is MISSING:
        if pre_mode is not MISSING or post_mode is not MISSING:
            # one side measured its census mode, the other did not: that is
            # not "unchanged", it is unmeasurable -- and count comparisons
            # below stay UNguarded, because a missing mode is no evidence
            # the censuses were comparable OR incomparable
            rows.append(Row("artifacts", "mode", pre_mode, post_mode,
                            NOT_MEASURABLE,
                            "the census mode is absent from %s measurement"
                            % ("the pre" if pre_mode is MISSING
                               else "the post")))
    else:
        rows.append(Row("artifacts", "mode", pre_mode, post_mode,
                        EXPECTED if modes_differ else UNCHANGED,
                        mode_why if modes_differ else ""))

    def guard(verdict, why):
        """Count verdicts are downgraded to expected-change when the modes
        differ; unchanged and not-measurable stay what they are."""
        if modes_differ and verdict in (REGRESSION, EXPECTED):
            return EXPECTED, mode_why
        return verdict, why

    def is_count(d, k):
        return (k in d and isinstance(d[k], int)
                and not isinstance(d[k], bool))

    extras = sorted(k for k in (set(pre_a) | set(post_a))
                    if k not in ARTIFACT_CLASSES
                    and k not in ARTIFACT_NON_CLASSES
                    and not k.startswith("_")
                    and (is_count(pre_a, k) or is_count(post_a, k)))
    for cls in list(ARTIFACT_CLASSES) + extras:
        a = dig(pre_a, cls)
        b = dig(post_a, cls)
        if a is MISSING and b is MISSING:
            continue
        verdict, why = guard(*verdict_for_count(
            a, b,
            "the count DROPPED by %d -- artefacts of this class were lost in "
            "the migration",
            "the count rose by %d -- artefacts added by the migration; the "
            "report names what and why"))
        rows.append(Row("artifacts", "artifacts.%s" % cls, a, b, verdict, why))

    # The other-bucket: classes the analyzer had no named counter for. Inside
    # an EXISTING bucket a missing class key means zero were counted -- that is
    # a measured 0, not an unmeasured property, so a vanished class is a DROP
    # and not not-measurable.
    pre_o = dig(pre_a, "other")
    post_o = dig(post_a, "other")
    if pre_o is not MISSING or post_o is not MISSING:
        pre_o = pre_o if isinstance(pre_o, dict) else {}
        post_o = post_o if isinstance(post_o, dict) else {}
        for cls in sorted(set(pre_o) | set(post_o)):
            a = pre_o.get(cls, 0)
            b = post_o.get(cls, 0)
            verdict, why = guard(*verdict_for_count(
                a, b,
                "the count DROPPED by %d -- artefacts of this class were lost "
                "in the migration",
                "the count rose by %d -- artefacts added by the migration; "
                "the report names what and why"))
            rows.append(Row("artifacts", "artifacts.other.%s" % cls,
                            a, b, verdict, why))

    for total_key in ("other_total", "total"):
        a = dig(pre_a, total_key)
        b = dig(post_a, total_key)
        if a is MISSING and b is MISSING:
            continue
        verdict, why = guard(*verdict_for_count(
            a, b,
            "the total DROPPED by %d -- the migration ships fewer artefacts "
            "than the source",
            "the total rose by %d -- consistent with the per-class rises above"))
        rows.append(Row("artifacts", "artifacts.%s" % total_key,
                        a, b, verdict, why))
    return rows


def compare_narrative(pre, post):
    """Both directions are expected-change here, by contract: the spec 9d/9e
    routing deliberately moves pages between pagecontent, intro-notes and
    translations. Whether the routed CONTENT survived is the verifier's C3/C4
    question, answered against page-map.tsv -- not a page count's."""
    rows = []
    for key in NARRATIVE_KEYS:
        a = dig(pre, "narrative", key)
        b = dig(post, "narrative", key)
        prop = "narrative.%s" % key
        if a is MISSING or b is MISSING:
            rows.append(Row("narrative", prop, a, b, NOT_MEASURABLE,
                            "the count is absent from %s measurement"
                            % ("the pre" if a is MISSING else "the post")))
        elif a == b:
            rows.append(Row("narrative", prop, a, b, UNCHANGED, ""))
        else:
            rows.append(Row("narrative", prop, a, b, EXPECTED,
                            "narrative routing (spec 9d/9e) moves pages "
                            "between pagecontent, intro-notes and "
                            "translations -- conservation of the CONTENT is "
                            "checked by the verifier against page-map.tsv"))
    return rows


def compare_directives(pre, post):
    a = dig(pre, "directives", "total")
    b = dig(post, "directives", "total")
    prop = "directives.total"
    if a is MISSING or b is MISSING:
        return [Row("directives", prop, a, b, NOT_MEASURABLE,
                    "the count is absent from %s measurement"
                    % ("the pre" if a is MISSING else "the post"))]
    if a == b:
        return [Row("directives", prop, a, b, UNCHANGED, "")]
    if b < a:
        return [Row("directives", prop, a, b, IMPROVED,
                    "%d Simplifier/FQL directives converted away -- template-"
                    "alien markup the target no longer carries" % (a - b))]
    return [Row("directives", prop, a, b, REGRESSION,
                "the directive count ROSE by %d -- the migration added "
                "template-alien markup that renders as nothing" % (b - a))]


# --- outputs ----------------------------------------------------------------

SECTIONS = (
    ("identity", "Identity"),
    ("flags", "Preflight flags"),
    ("artifacts", "Artefact counts"),
    ("narrative", "Narrative pages"),
    ("directives", "Directives"),
)


def write_tsv(path, rows):
    directory = os.path.dirname(path)
    if directory:
        os.makedirs(directory, exist_ok=True)
    with open(path, "w", encoding="utf-8") as fh:
        fh.write("property\tpre\tpost\tverdict\n")
        for r in rows:
            fh.write("\t".join(r.tsv()) + "\n")


def md_cell(text):
    return str(text).replace("|", "\\|")


def side_label(data, path):
    """`label (commit, timestamp)` when the measurement says who it measured;
    the bare file path always, so the report is checkable against its inputs."""
    parts = [os.path.basename(path)]
    label = dig(data, "analyzed", "label")
    commit = dig(data, "analyzed", "git_commit")
    ts = dig(data, "analyzed", "timestamp")
    detail = ", ".join(fmt(v) for v in (label, commit, ts) if v is not MISSING)
    if detail:
        parts.append("(%s)" % detail)
    return " ".join(parts)


def write_md(path, rows, pre, post, pre_path, post_path, counts):
    directory = os.path.dirname(path)
    if directory:
        os.makedirs(directory, exist_ok=True)
    out = []
    out.append("# Pre/post delta — the two ig-stats measurements compared")
    out.append("")
    out.append("| Side | Measurement |")
    out.append("|---|---|")
    out.append("| pre | %s |" % md_cell(side_label(pre, pre_path)))
    out.append("| post | %s |" % md_cell(side_label(post, post_path)))
    out.append("")
    out.append("Verdicts: %s." % " · ".join(
        "**%s** %d" % (v, counts.get(v, 0))
        for v in (UNCHANGED, IMPROVED, EXPECTED, REGRESSION, NOT_MEASURABLE)))
    out.append("")

    regressions = [r for r in rows if r.verdict == REGRESSION]
    if regressions:
        out.append("## ⛔ Regressions — properties that got WORSE")
        out.append("")
        out.append("Each one blocks the migration until it is fixed or explained; "
                   "an explanation belongs in the migration report, not in a merge "
                   "commit.")
        out.append("")
        for r in regressions:
            out.append("- **`%s`**: `%s` → `%s` — %s"
                       % (r.prop, fmt(r.pre), fmt(r.post), r.why))
        out.append("")
    else:
        out.append("No regression: nothing measured got worse between the two "
                   "measurements.")
        out.append("")

    for section, title in SECTIONS:
        section_rows = [r for r in rows if r.section == section]
        if not section_rows:
            continue
        out.append("## %s" % title)
        out.append("")
        out.append("| Property | Pre | Post | Verdict | Why |")
        out.append("|---|---|---|---|---|")
        for r in section_rows:
            verdict = "**%s**" % r.verdict if r.verdict == REGRESSION else r.verdict
            out.append("| `%s` | %s | %s | %s | %s |"
                       % (md_cell(r.prop), md_cell(fmt(r.pre)),
                          md_cell(fmt(r.post)), verdict, md_cell(r.why)))
        out.append("")

    with open(path, "w", encoding="utf-8") as fh:
        fh.write("\n".join(out) + "\n")


# --- main -------------------------------------------------------------------

def load_json(path, side):
    if not os.path.isfile(path):
        log("ERROR", "setup: --%s is not a file  path=%s exit=2" % (side, path))
        return None
    try:
        with open(path, encoding="utf-8") as fh:
            data = json.load(fh)
    except (OSError, ValueError) as exc:
        log("ERROR", "setup: --%s could not be read as JSON  path=%s exit=2"
            % (side, path), ["%s" % exc])
        return None
    if not isinstance(data, dict):
        log("ERROR", "setup: --%s is not a JSON object  path=%s exit=2"
            % (side, path))
        return None
    return data


def main(argv):
    p = argparse.ArgumentParser(add_help=False)
    p.add_argument("--pre")
    p.add_argument("--post")
    p.add_argument("--out")
    p.add_argument("--tsv")
    p.add_argument("-h", "--help", action="store_true")
    try:
        a = p.parse_args(argv)
    except SystemExit:
        return 2
    if a.help:
        print(__doc__)
        return 0
    if not a.pre or not a.post or not a.out:
        log("ERROR", "setup: --pre, --post and --out are all required  exit=2",
            ["usage: prepost-delta.py --pre <preflight.json> --post "
             "<postflight.json> --out <delta.md> [--tsv <delta.tsv>]"])
        return 2

    pre = load_json(a.pre, "pre")
    if pre is None:
        return 2
    post = load_json(a.post, "post")
    if post is None:
        return 2

    log("INFO", "%s  pre=%s post=%s out=%s tsv=%s"
        % (OPEN_WORD, a.pre, a.post, a.out, a.tsv or "-"))

    pre_mode, post_mode, modes_differ = census_modes(pre, post)
    if modes_differ:
        log("WARN", "census-mode-mismatch: pre=%s post=%s -- artefact-count "
                    "differences reported as expected-change, never as "
                    "regressions" % (fmt(pre_mode), fmt(post_mode)),
            ["The two census styles classify the same artefacts differently;",
             "conservation of the artefacts themselves is the verifier's C1",
             "question, answered by id, not by count."])

    rows = []
    rows.extend(compare_identity(pre, post))
    rows.extend(compare_flags(pre, post))
    rows.extend(compare_artifacts(pre, post))
    rows.extend(compare_narrative(pre, post))
    rows.extend(compare_directives(pre, post))

    counts = {}
    for r in rows:
        counts[r.verdict] = counts.get(r.verdict, 0) + 1

    write_md(a.out, rows, pre, post, a.pre, a.post, counts)
    if a.tsv:
        write_tsv(a.tsv, rows)

    # One line per regression, on stderr, greppable by its class -- and one per
    # property that could not be measured, because a comparison that silently
    # skips a key is a comparison that stops being trusted.
    for r in rows:
        if r.verdict == REGRESSION:
            log("ERROR", "delta-regression: %s  pre=%s post=%s"
                % (r.prop, fmt(r.pre), fmt(r.post)),
                ["why: %s" % r.why])
        elif r.verdict == NOT_MEASURABLE:
            log("WARN", "delta-not-measurable: %s  pre=%s post=%s"
                % (r.prop, fmt(r.pre), fmt(r.post)),
                ["%s" % r.why])

    status = 1 if counts.get(REGRESSION) else 0
    log("SUMMARY", "%s  rows=%d unchanged=%d improved=%d expected-change=%d "
        "regression=%d not-measurable=%d out=%s tsv=%s exit=%d"
        % (CLOSE_WORD, len(rows),
           counts.get(UNCHANGED, 0), counts.get(IMPROVED, 0),
           counts.get(EXPECTED, 0), counts.get(REGRESSION, 0),
           counts.get(NOT_MEASURABLE, 0),
           a.out, a.tsv or "-", status))
    if status:
        log("WARN", "prepost-delta: %d regression(s) -- a property of the "
                    "module got WORSE between the pre- and post-measurement."
            % counts[REGRESSION],
            ["Every regression above names its property and both values.",
             "The reports were still written: they are the artefact, not the verdict."])
    return status


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
