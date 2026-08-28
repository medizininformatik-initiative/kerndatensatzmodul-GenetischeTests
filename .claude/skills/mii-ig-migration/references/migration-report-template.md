# Migration report — {MODULE} → MII KDS module template

<!-- TEMPLATE for migration-log/migration-report.md (SKILL.md step 8). Copy it, replace every
     {curly} value, delete nothing. Six rules for the author:
     1. A section with nothing to report says "none" — an absent section cannot be told apart
        from a forgotten one.
     2. Every number is COPIED from the evidence file named beside it. Where report and
        evidence disagree, the evidence wins: regenerate, never retype.
     3. Sections marked GENERATED are pasted from their generator, never written from memory.
     4. Every queue item fills EVERY labelled line. A line with nothing to say says "none" or
        "not applicable, because {reason}" — it is never dropped.
     5. Explain each code (M9, C4, Gate B, IDENTISCH) where it first appears, in the same
        sentence. The glossary at the end is a backstop, not the mechanism.
     6. The reader is a competent IG author who has never seen this skill, this spec or this
        repository. They must be able to work every item without opening any of the three. -->

**Module:** {module name} · **Report author:** {name | agent + skill version} · **Report date:** {YYYY-MM-DD}
**Written for:** {who reviews this — role, not a personal name} · **Decision requested by:** {YYYY-MM-DD}
**Decision requested:** {approve and merge | approve with the listed conditions | reject | return to the module team}
**State:** {complete through build | stopped at step {n} because {reason}}
**Published?** {No package was released to the FHIR package registry.} The rendered preview {is publicly
reachable | is private} at {full URL | none}.
**Recommendation:** {one sentence — what the author believes should happen to this work, and why}

## How to use this report

1. Read **Summary** and **Applied fixes** first (five minutes): that is everything that already changed.
2. Working a sign-off? Go straight to the **QA checklist** under *Sign-off*: one checkbox per open
   obligation, grouped by gate — tick what is yours, follow each box back to its detail block here.
3. Then work **① Decisions**, **② Reviews**, **③ QA triage** in that order. Every item names its owner — skip the items that are not yours.
4. Comparing the migrated guide against the source by hand? The **Content map** carries the
   generated comparison table: every row links the rendered source page and the rendered target
   page side by side, and a second table says which pages exist because the template mandates them.
5. **Gate 0**, **Identity**, **Verification** and **Protocol** are evidence. Open them only to check an item or to look a term up.
6. Item ids are typeable and greppable (`DEC-3`, `REV-2`, `QA-5`, `FIX-1`) — quote the id when you answer.
7. Nothing is published and every applied change is revertible; but doing nothing is not neutral, so read each item's **If nobody acts**.

## Summary — read this first (for everyone)

<!-- Max 12 lines. Plain words; any code used here is glossed in the same sentence. This section
     is called "Summary" and not "L0" on purpose: L0-L4 are the run-log checks further down. -->

{Two or three sentences: what the module is, what was moved, and what the result is.}

- **Source:** `{org/repo}` @ `{sha}` (tag `{tag}`), shape {A — the source is already an IG-Publisher
  project with FSH in its tree | B — the source ships raw FHIR resources only, so the FSH was derived
  by goFSH}; narrative taken from {the repository's own `input/pagecontent` ({n} pages) | the guide
  harvest | none — escalated}.
- **Rendered preview:** {full URL, clickable} — default language {en}, {de} at {full URL}.
- **Build:** SUSHI (the compiler that turns FSH into FHIR resources) reports **{n} errors**; the IG
  Publisher's separate QA report lists **{n} errors / {n} warnings / {n} broken links**. Two tools,
  two counts — QA errors do not fail the build.
- **QA acceptance bar:** no worse than the unmigrated source. Source **{n} errors**, target **{n}** (③).
- **Verification:** **{n} IDENTISCH · {n} DIVERGIERT · {n} NICHT PRÜFBAR** — the check ran and matched ·
  the check ran and found a named difference · the check could **not** run. The third is **not** a pass.
  Every row, with its next action, is in `migration-log/verification.md`.
- **Open for humans:** {n} decisions (①), {n} reviews (②), {n} QA items (③); **{n} of them block
  publication** and are listed under *Sign-off*.
- **Not checked by this migration:** {e.g. instrument licensing (PROMIS/EORTC/EQ-5D), the CQL library's
  executability, clinical correctness of any prose | none}. Unchanged from the source, and out of scope here.

## Where the evidence lives

<!-- Everything cited below is committed with the branch under migration-log/. List every file the
     report cites, and no file it does not. -->

| File | What it is | Cited by |
|---|---|---|
| `migration-log/run.log` | append-only record of every step, its command and what that command measurably produced | all sections |
| `migration-log/verification.md` | the verifier's human-readable per-check table, incl. a **Next action** per divergence | Verification, ②, ③ |
| `migration-log/verification-findings.tsv` | the same rows, machine-readable (`id layer check verdict subject evidence autofix action`) | Verification |
| `migration-log/page-map.tsv` | the page-map v2 contract (`source_page` → `target` or `RETIRED`, plus `reason`, `branch`, `measure`) — GENERATED by the step-3 advice run (`--map`), human-reviewed, consumed by step 5, read by C3/C6 | Content map, ② |
| `migration-log/page-structure-advice.md` | the generated map's human-readable rendering, written by the same advice run | Content map |
| `references/routing-table.tsv` | the semantic `pattern → target home` table the map generator consulted (ships with the skill, not under `migration-log/`) | Content map |
| `migration-log/postflight-analysis.json` | the same `ig-stats` measurement as Gate 0, taken on the **migrated** tree | ③ |
| `migration-log/prepost-delta.md` / `.tsv` | property-by-property pre→post verdicts (`unchanged · improved · REGRESSION · expected-change`); any REGRESSION row means exit 1, a stop to fix | Summary, ③ |
| `migration-log/derived-content.tsv` | one row per DERIVED marker (`page lang kind source gate line excerpt`) — every passage the migration **wrote** rather than carried, and where it stands | ②, Verification (C7) |
| `migration-log/qa-checklist.md` | the per-gate `- [ ]` sign-off checklist, GENERATED by `qa-checklist.py` from the four machine ledgers (verification findings, identity claims, derived content, page map) — pasted into *Sign-off*, plus the report-authored DEC/REV/QA checkboxes | Sign-off |
| `migration-log/comparison-table.md` | the map rendered as a walkable side-by-side view (clickable rendered source ↔ rendered target links, what moved, template-page provenance), GENERATED by `comparison-table.py` | Content map |
| `migration-log/identity-claims.tsv` | one row per identity field per source, with tier and contradiction flag | Identity, ① |
| `migration-log/preflight-analysis.json` | the measured scope of the **unmigrated** source | Gate 0 |
| `migration-log/source-inventory.json` | every source file classified, with a retain/retire disposition | Content map, ② |
| `migration-log/publisher-build.log`, `migration-log/sushi-*.log` | raw tool output behind every build number | ③, Protocol |
| {…} | {…} | {…} |

**Citation format:** `run.log {step} {event}` means one line in the run log — find it with
`grep -F '{event}' migration-log/run.log`. Where this report and an evidence file disagree, the
evidence file is right and this report is stale: regenerate it.

## How to re-run any of this

| What | Command | Expected |
|---|---|---|
| compile the FSH | `{command}` | `Errors: 0` |
| render and validate the guide | `{command}` | `qa.txt` with {n} errors |
| the template's release checks (M1–M11) | `{e.g. node scripts/convention-check.mjs}` | {exit 0 \| `M{n} FAIL`, exit 1 — see DEC-{n}} |
| the migration verifier (C/F/P/R/L) | `python3 {path}/verify-migration.py --target . --source {path} --rendered {path} --source-lang {de} --template-latest {vX.Y.Z}` | exit {0 \| 1 \| 3} |
| the derived-content scan (rewrites `migration-log/derived-content.tsv`, which C7 reads) | `python3 {path}/derived-scan.py --target .` | {n} markers found; exit 0 |
| the same scan as the table pasted into ② | `python3 {path}/derived-scan.py --target . --markdown` | the ② table on stdout — paste it, never retype it |
| the page-routing map generator (menu budget, hub and size gates, and the page-map contract — spec §9e/§9f) | `python3 {path}/page-structure-advice.py --source {source} --target . --out migration-log/page-structure-advice.md --map migration-log/page-map.tsv` | the page-map v2 TSV + its report regenerated; exit 0 = coverage holds, exit 1 = a source page has no target, a RETIRED row has no reason, or a harvest-skipped page is unresolved (the step-2c harvest manifest is auto-discovered from `migration-log/`). Re-generating overwrites the reviewed map — re-apply (and re-review) any human edits |
| the pre/post delta (spec §5.6) | `python3 {path}/prepost-delta.py --pre migration-log/preflight-analysis.json --post migration-log/postflight-analysis.json --out migration-log/prepost-delta.md --tsv migration-log/prepost-delta.tsv` | exit 0 = no REGRESSION row; exit 1 = a property got worse (an artefact count dropped, licence turned contradictory, injection risk appeared, an identity field changed) — a stop to fix, never a delta to file. When the two measurements' census `mode` fields differ (raw-resource vs FSH-declaration census — the harvested source shape), count differences report as expected-change with the modes named, never as regressions |
| the sign-off checklist generator | `python3 {path}/qa-checklist.py --log-dir migration-log --out migration-log/qa-checklist.md` | one `- [ ]` per open obligation, per gate, from the four ledgers; a missing ledger is SAID, not an empty list. Re-add the report-authored DEC/REV/QA checkboxes after regenerating |
| the comparison-table generator | `python3 {path}/comparison-table.py --log-dir migration-log --preview-url {FULL base of the rendered preview, incl. any branches/… path} --out migration-log/comparison-table.md` | the map as clickable rendered-source ↔ rendered-target rows + the template-page provenance table; add `--source-guide-url {pinned guide root}` for guide-tree sources without a harvest, and `--source-repo-url {source repo file-view base, e.g. …/blob/main}` for pagecontent-shaped sources that have no rendered home — the table warns when no source cell could be linked |

**The verifier is not vendored in this repository** — it ships with the `mii-ig-migration` skill at
{URL or path}, version {vX.Y.Z}. Runs offline: {which of the four}. Needs the source checkout and the
rendered site: {which}.

## Codes, gates and words used in this report

<!-- Explained once, here, because everything after this point uses them. Keep each gloss to one
     line; the full lists live where the table says. -->

**Item ids.** `DEC-n` = decision queue ① · `REV-n` = review queue ② · `QA-n` = QA triage ③ ·
`FIX-n` = an applied, revertible change.

**Verdict words** (the verifier reports in German): **IDENTISCH** the check ran and matched ·
**DIVERGIERT** the check ran and found a named difference · **NICHT PRÜFBAR** the check could not
run, because an input was absent or the property is a human judgement. NICHT PRÜFBAR is **not** a
pass: every such row owes a named human an action at a named gate.

**M1–M11 — the template's own release checks**, run in CI by `{scripts/convention-check.mjs}`; the full
matrix is `{skills/wiki-consistency-check/references/check-matrix.md}`. M1 packageId in the MII KDS
namespace · M2 `id` is `mii-ig-<slug>` · M3 `name` is `MII_IG_…` · M4 `title` starts with `MII ` and names
the module · M5 `canonical` sits in the agreed MII URL space · M6 `version` is CalVer `YYYY.n.n`, never
SemVer · M7 no floating pin (`current`, `latest`, `x`) on any dependency or on the template · M8 the
scaffold's demonstration page is gone on a release branch · M9 every optional page is explicitly
decided — **measured**, not judged: the built artefact count for that page's type is 0 → remove the
page, > 0 → keep and fill it · M10 no page repeats its own title or a parent heading as a heading · M11 the
Security-and-Privacy stage-3 decision, with the illustrative example box removed in both languages.

**C / F / P / R / L — the migration verifier's four layers plus the run log as a second oracle.**
**C** conservation: did everything in the source arrive · **F** fidelity: is the module still itself
(identity, pins, licence, no conversion residue) · **P** provenance: was it built with the versions it
claims · **R** rendering: does the published site actually render · **L** the run log read against the
tree, because a class of defect exists only in the gap between them (the log says 20 converted, the
tree holds 19). Every individual check is named and defined in *Verification* below.

**Gates — the four human sign-offs (spec §6).** The agent never passes a gate itself.

| Gate | What it decides | Who staffs it (role) | Passed when |
|---|---|---|---|
| **A** | identity: canonical, ids, version, licence, artefact completeness, every identity divergence | {module maintainer + TF KDS — the MII Taskforce Kerndatensatz, which owns cross-module conventions} | every ① row routed to A is answered and the answer is recorded here |
| **B** | the narrative: section mapping, completeness, images and links | {module's clinical/technical authors} | every ② row routed to B is checked or explicitly accepted |
| **C** | language: translation quality, every `TODO:REVIEW` marker | {a German- and English-competent reviewer of the module's domain} | no `TODO:REVIEW` remains unreviewed |
| **D** | release governance, and the merge decision — **merging is what publishes** | {TF KDS / AG IOP (Arbeitsgruppe Interoperabilität) / NSG (Nationale Steuerungsgruppe), per KDS governance} | A–C signed and the blocking items under *Sign-off* are cleared |

**Gate 0 is not a sign-off.** It is the measured scope picture taken on the unmigrated source before
any work started, so a reader can see what the module contains before judging what was done with it.

**"spec §n"** refers to the migration specification `{skills/mii-ig-migration/references/migration-spec.md}`
in the {agent-skills} repository at version {vX.Y.Z}; it is not vendored here. Cited so a reviewer can
check a rule, never as a substitute for stating the rule.

## Applied fixes (already changed — a human confirms or reverts)

<!-- One dedicated commit per fix, so each can be reverted alone. Name the FULL blast radius of each
     commit, not the headline: a reviewer who reverts to undo one thing must know what else goes.
     Delete no row; if the migration applied none, write "none". -->

Accepting these needs no action — merging accepts all of them. To reject one, revert it on branch
`{branch}`. **Revert newest first:** {FIX-n, FIX-n, …}. Reverting out of order conflicts where the
"Also touches" column overlaps; to revert a middle commit, exclude the log:
`git revert -n {SHA} && git checkout HEAD -- migration-log/ && git revert --continue`.

| # | Fix, in plain words | Commit | Also touches (beyond the headline) | If reverted | Independent? |
|---|---|---|---|---|---|
| FIX-1 | {what changed and why} | `{SHA}` | {every other path in the commit, with counts \| nothing else} | {the measurable consequence} | {yes \| conflicts with FIX-{n} in `{path}`} |
| FIX-2 | {…} | `{SHA}` | {…} | {…} | {…} |

**Required, not optional:** {FIX-n} — reverting it only reproduces a build failure; it is listed for
completeness, not as a choice.

## ① Decision queue (Gate A — someone must choose)

<!-- One block per open decision. Fill EVERY line. "Default applied" is what the migration did in
     the meantime — a placeholder, never a recommendation. Options without consequences are not
     options: a reviewer cannot choose between two names. Order the blocks by severity, blocking
     first. Anything the migration INVENTED (a date, a contact, a code) is a decision and belongs
     here, marked STAND-IN, with the file and line to edit. -->

**DEC-1 — {one-line title in plain words}** · severity **{blocking | high | medium | low}** · Gate {A}

- **What it is:** {two sentences at most. Every code glossed in place: "M5 (the template's release
  check that the canonical sits in the agreed MII URL space)".}
- **Where:** `{path:line}` {| `{artefact id}` | {URL}} — {if the file is not in this repository, say
  so and name the repository that owns it}.
- **If nobody acts:** {the concrete consequence, in the reader's terms: what a consumer sees, what CI
  does, whether a release is blocked. "Nothing happens" is a legitimate answer and must be said.}
- **Options:** (a) {option} → {consequence} · (b) {option} → {consequence} · (c) {…}.
  **Default applied now:** {what is in the tree today}.
- **Next action:** {the one concrete step, with the command or the edit if there is one}.
- **Who decides:** {role} — {one clause explaining what that role is and why it owns this}.
- **Effort · impact:** {minutes | hours | days} · {cosmetic | consumer-visible | blocks release}.
- **Reversible:** {yes, config-only | yes — `git revert {SHA}` | NO — {why, e.g. published canonicals
  cannot be recalled}}.
- **Evidence:** run.log `{step} {event}` · {file:line} · {generated table}.

**DEC-2 — {…}** · severity **{…}** · Gate {…}

- **What it is:** {…}
- **Where:** {…}
- **If nobody acts:** {…}
- **Options:** {…} **Default applied now:** {…}
- **Next action:** {…}
- **Who decides:** {…}
- **Effort · impact:** {…}
- **Reversible:** {…}
- **Evidence:** {…}

{Repeat per decision, or write "none — no open decisions" and keep the section.}

**Values this migration invented (STAND-IN — each is a Gate-A confirmation, decided by a human):** {list each with
`{path:line}` and its DEC id | none}.

## ② Review queue (Gates B/C — someone must check)

<!-- Two kinds of row, and they are filled differently. The DERIVED-content table is GENERATED — its
     rows come from the scanner, never from memory. The REV-n blocks below it are hand-written, and
     only for review questions that are NOT derived content. Group the in-tree TODO:REVIEW markers
     into reviewable units; never paste a raw grep. Give a grep that returns exactly this group and
     nothing else, and say what the marker's other hits are. Typical groups: machine-translated pages
     (C), section-mapping homes (B), replaced live tables (B), image and link substitutions (B),
     retain/retire proposals (D). -->

### Derived content — GENERATED, do not retype

Every passage this migration **wrote** rather than carried is marked where it stands: an HTML comment
`<!-- DERIVED:{kind} source={source page | none} gate={A|B|C} -->` the machine reads, plus the visible
"Written during migration — review before release" box the reader sees (spec §9d). Marked content is
only what was written — verbatim carry-over, moved and split content and the routine per-language
mirror are **never** marked, because a page of boxes is a page whose boxes stop being read.

The rows below are GENERATED from `migration-log/derived-content.tsv` — regenerate, never retype:

```
python3 {path}/derived-scan.py --target . --markdown
```

{paste the generated table here | none — this migration wrote no derived content}

One row per marker: page · language · **kind** (`summary` condensed or reworded · `bridge` connective
text joining merged sections · `suggestion` proposed where the source had none · `stand-in` an invented
value pending confirmation · `no-source` a default-language page the source ships no counterpart for) ·
source page (or `none`) · gate · line · the first 120 characters. Where this table and the tree
disagree, the tree wins: re-run the scan. The verifier's **C7** reads the same file and fails on a
marker whose `source=` names no source page, on a marker present in one language mirror only, and on a
page whose source prose did not survive and that carries no marker at all.

**Each row is answered, and the answer is a human's:** clearing a row means deleting its marker and box;
letting one stand is a Gate-D decision, recorded here — nothing blocks a release automatically. `stand-in` rows are
ALSO ① decisions (an invented value — carry the same item id in both places); `suggestion`, `summary`,
`bridge` and `no-source` rows are Gate B, except where the kind's `gate=` says otherwise. The
per-language mirror of a marked page is not a separate item: it is the same decision, edited twice.

### Hand-written review items

Everything that is **not** derived content: a placement question (is this section on the right page?),
a machine-translated page, a replaced live table, an image or link substitution, a retain/retire
proposal. Never hand-write a REV block for a marker the scan above already reports — one item, one
place. Each hand-written item fills every labelled line below; a line with nothing to say says "none".

**REV-1 — {one-line title}** · severity **{…}** · Gate {B | C}

- **What it is:** {what a reviewer is being asked to judge, and why a machine could not}.
- **Where:** {exact paths from `migration-log/page-map.tsv`, not slugs} — grep handle:
  `{the grep that returns exactly this group}` ({n} files, {n} hits; other hits of the same marker
  belong to {REV-n | DEC-n}).
- **If nobody acts:** {what ships unreviewed, and who sees it}.
- **Next action:** {correct the wording and remove the marker | confirm and remove the marker |
  escalate to {whom}}.
- **Who checks:** {role} — {one clause}. {Say plainly where clinical, not editorial, sign-off is needed.}
- **Effort · impact:** {…} · {…}.
- **Reversible:** {yes — the page is text under version control | …}.
- **Evidence:** {file}, run.log `{step} {event}`.

**REV-2 — {…}** · severity **{…}** · Gate {…} · {then the same eight labelled lines — none may be dropped}

{Repeat, or write "none".}

## ③ QA triage (what the build says, and whose problem it is)

<!-- Provenance requires PROOF: "source-inherent" means the unmigrated source was BUILT with the same
     pinned toolchain and showed the same finding. Anything unproven is "unclassified" and stays open.
     ③ rows are findings, not changes, so they carry no reversibility column — where a finding was
     already repaired, the repair is a FIX row above and is named in "Next action". -->

**Baseline (proven, not asserted):** the unmigrated source was built with the same pinned toolchain
({IG Publisher {v}, {Jekyll {v}}, image `{ref}`}) — {or: Gate 0 reported a QA baseline of {…}, which
was reused}.

| Build | Errors | Read as |
|---|---|---|
| **Source total (unmigrated, measured)** | **{n}** | what the module already had |
| **Target total (this migration)** | **{n}** | the bar is "no worse than the source" |
| Reconciliation | {source n = {n} shared + {n} source-only + {n} other} · {target n = {n} shared + {n} new} | the two totals must add up here, in one line |

| # | Finding (shortened) | Count | Whose problem (proof) | If nobody acts | Next action | Who owns it (role) | Where to look |
|---|---|---|---|---|---|---|---|
| QA-1 | {qa error text} | {n} | **source-inherent, proven** — the same finding is in the baseline build. **Not this migration's problem, and not the reviewer's.** | {nothing — it ships exactly as it does today} | {accept, recorded \| report upstream} | {nobody here — the module team upstream, which authors the source} | `grep -n '{pattern}' migration-log/publisher-build.log` |
| QA-2 | {…} | {n} | migration-**visible**, source-authored — {the mechanism} | {…} | {…} | {…} | {…} |
| QA-3 | {…} | {n} | migration-induced | {…} | {fixed in FIX-{n} \| fix \| escalate} | {…} | {…} |
| QA-4 | {…} | {n} | environment: {the missing prerequisite} | {…} | {…} | {…} | {…} |
| QA-5 | {…} | {n} | **unclassified — provenance not proven** | {…} | {prove or escalate} | {…} | {…} |

**Blocking?** {none of the above fails the build; the acceptance bar is met | QA-{n} blocks, because {…}}.

## Gate 0 — pre-flight scope (evidence behind the queues; not a sign-off)

<!-- GENERATED from migration-log/preflight-analysis.json — measured on the UNMIGRATED source before
     any work. Quote the measured numbers; never retype an estimate. Spec §9c. -->

| Aspect | Measured on the source | What it caused in this run | Reviewer action |
|---|---|---|---|
| Artefacts (profiles / extensions / ValueSets / CodeSystems / SearchParameters / examples / CapabilityStatements / other) | {…} | {…} | {none \| DEC-{n}} |
| Generated-versus-declared cross-check | {n} mismatches: {…} | {which census was treated as authoritative, and why} | {…} |
| Canonical URL space (out-of-space artefacts, id↔url disagreements — the "special-url" list the IG must declare explicitly) | {n} — {so no such list is needed \| so {n} entries were declared} | {…} | {…} |
| Licence evidence | {value} from {sources, agreeing or not} | {template default {value} deliberately not applied \| …} | {…} |
| Dependency health (pins, pre-SUSHI-3 "old-style" declarations, packages the IG Publisher injects itself if unpinned, external parents) | {…} | {…} | {…} |
| Narrative source | {single \| dual: {…}} | {which copy is authoritative, decided by measurement and recorded as run.log `{step} decision`} | {…} |
| QA baseline | {value \| **none — so it was obtained**, see ③} | {…} | {…} |

**Artefact counts, reconciled** (the first question a reviewer asks is "was anything lost?"):
{n} declared in `sushi-config.yaml` · {n} distinct generated artefacts · {n} resources reported by
SUSHI (the difference is {…}) · {n} resources in the published package. {One sentence explaining each
difference | all four agree}.

## Content map (where every source page went)

<!-- "Anything lost?" is the honest column: name RENDERING losses (a live query table that became a
     static pointer) even when the underlying data survives in the resources. -->

**Narrative source (spec §5.1d):** {the repository's own pages | the authenticated project download |
the guide harvest | none — escalated}. For a harvest, take the numbers from
`migration-log/guide-harvest.tsv`, not from memory: **{n} discovered, {n} harvested, {n} skipped**
({n} narrative, {n} artefact-view), guide version `{version}`. Every skipped page is a row below with
its reason. **A template page still carrying the template's starter text is a GAP, not a migrated
page** — say so here rather than letting the build's green tick imply otherwise.

**The machine-readable form of this table is `migration-log/page-map.tsv`** — the page-map v2
contract (`source_page` → `target` or `RETIRED`, plus `reason`, `branch`, `measure`), GENERATED by
the step-3 advice run (`--map`, spec §9e/§9f) and human-reviewed, never hand-typed. Check C3 reads
it: a page in no row is reported MISSING. This table is the map's rendering — when the two
disagree, fix (and re-review) the map and re-render this table from it, never the table alone.

**Paste the GENERATED comparison table here** (`comparison-table.py`, invocation under *How to
re-run*; written to `migration-log/comparison-table.md` — do not retype). It renders the map as a
side-by-side view a human can walk: one row per source page with **clickable links to the rendered
source page and the rendered target page** (pass `--preview-url`, and `--source-guide-url` when
there is no harvest manifest), what moved in plain words, and how many migration-written blocks sit
on each target — plus a second table answering "where does this page come from?" for **every
template-mandated page with no source counterpart**. A reviewer comparing the two guides manually
starts here, not from memory.

{GENERATED comparison table — paste `migration-log/comparison-table.md`}

| Source page | Target page | Anything lost? |
|---|---|---|
| {page} | {page or "— retired: {reason}"} | {none \| description} |
| {harvested page, skipped} | — | **not harvested: {reason from the manifest}** |

**Optional pages, decided by measurement (M9):** REMOVED at artefact count 0: {list | none}. KEPT with
counts: {page ({n}), …}. **M8:** {the scaffold's demonstration page deleted | not applicable}.
**M11:** {the Security-and-Privacy stage-3 decision taken: {which}; illustrative example box removed
in both languages | …}.

**Artefact classes the template's page set does not model** (the open `other` bucket — ConceptMap,
ObservationDefinition, Measure, Library and the like each need an explicit placement decision):
{class ({n}) → documented on `{page}`, section "{section}"} | none. Evidence: run.log `{step} {event}`.

**Template pages without source content (kept as stubs — gaps, not errors):** {list | none}.
**Source files retained for Gate-D retirement (listed, not removed):** {list | none}, per
`migration-log/source-inventory.json`.

## Identity (what makes this module *this* module)

| Field | Value | Same as the source? | Where it came from |
|---|---|---|---|
| canonical | {…} | {yes \| **DIVERGES → DEC-{n}**} | {…} |
| id / name | {…} | {…} | {…} |
| title | {…} | {…} | {…} |
| packageId | {…} | {…} | {…} |
| version / releaseLabel | {…} | {…} | {…} |
| status / licence | {…} | {…} | {…} |
| publisher | {…} | {…} | {…} |
| dependencies | {…} | {…} | {…} |

**Any field that changes must say so in its own row and again here:** {the {n} fields that differ from
the source, each with the rule that overrode source-wins and what a reader of the rendered site sees |
none — every field is unchanged}.

### Where each value came from (GENERATED — do not retype)

<!-- `bash "$ML" claims --markdown` (spec §2.1.4) prints this from migration-log/identity-claims.tsv:
     one row per field PER SOURCE, with its tier, contradictions flagged. Recovered is not applied —
     nothing in the repository was rewritten from these. -->

**Tiers, in recovery order:** **C** the repo's `sushi-config.yaml` (what the build actually reads) ·
**P** the published package · **J** `package.json` · **I** the generated ImplementationGuide ·
**R** the source repository · **H** the rendered guide, read by a human · **T** the template's default ·
**G** goFSH's derived config, which is never identity. A higher tier is a **recommendation to the Gate-A
human**, never an automatic winner. A field carrying two distinct values is a ① decision, never a pick
made here.

| Field | Tier | Source | Value | Contradiction |
|---|---|---|---|---|
| {field} | {P} | {package/package.json} | {value} | {— \| **YES → DEC-{n}**} |

**{n} claims with {n} contradictions** stand in `migration-log/identity-claims.tsv`, reported and never
resolved by machine. {n} of them are open as DEC-{…}; the other {n} were resolved by {what}.
**Still unrecovered after every tier (a human supplies these):** {list | none}.
**Parent packages missing snapshots** — a snapshot is the fully expanded element list a profile carries
so downstream profiles can build on it; a parent shipping only differentials leaves SUSHI unable to
resolve anything derived from it (spec §5.1b.5): {package@version — {n} of {m} StructureDefinitions carry
none, rebuilt as `{id}#{version}-snapshots`, SUSHI {before} → {after} errors | none}; **how that rebuild
reaches CI:** {CI prebuild step | vendored | internal registry | not repinned, profiles stay blocked}
→ DEC-{n}.

## Verification (GENERATED — paste `migration-log/verification.md`, do not retype)

<!-- The four layers plus the run log as a second oracle (spec §11). This block is produced by
     verify-migration.py. A verification section with no `11 verify-migration` line behind it in
     run.log claims something that did not happen. If the pasted totals and the totals in
     verification.md ever differ, the file wins: re-run and re-paste. -->

**Command:** see *How to re-run any of this*. **Exit status:** {0 = every check matched | 1 = at least
one named divergence | 3 = no divergence, but a check could not run — INCOMPLETE, which is not
"passed"}. **Inputs:** target · source `{path | — not supplied, which is itself a finding}` · rendered
`{output | — not built}` · log.

| Layer | Checks (each named, so a count can be read) | IDENTISCH | DIVERGIERT | NICHT PRÜFBAR |
|---|---|---|---|---|
| conservation | C1 every source artefact still exists · C2 every artefact is **reachable** from the rendered Artifacts page · C3 every source page was migrated or explicitly retired · C4 every source text run (a contiguous prose fragment of ≥40 characters) survives somewhere · C5 menus lead somewhere and every page is in a menu · C6 each passage landed on the page the map promised | {n} | {n} | {n} |
| fidelity | F1 identity unchanged · F2 dependencies pinned exactly as the source pinned them (a pin the target ADDS is NICHT PRÜFBAR, not a defect) · F3 the licence is asserted from evidence, never defaulted · F4 no mechanical FSH conversion residue | {n} | {n} | {n} |
| provenance | P1 the rendered site reports the template package it was built with · P2 the vendored template ref matches the log · P3 the IG Publisher version matches the workflow pin · P4 the source guide was pinned to a published version, not "current" | {n} | {n} | {n} |
| rendering | R1 tables, tabs and images render with content · R2 no defect marker in the page header or footer · R3 a translated page really differs from the default language · R4 no link points at a deleted template example · R5 every page has a title unit in the translation catalogue | {n} | {n} | {n} |
| run log (2nd oracle) | L0 a run log exists · L1 every partial-success warning was acted on · L2 every expected step wrote a line · L3 no identity contradiction is still open · L4 the log's counts agree with what the tree holds | {n} | {n} | {n} |

**DIVERGIERT — every row, its evidence and its queue:** {paste the generated table | none}. Each row's
**Next action** column is the worklist; this report's queues carry the same actions, grouped.
**NICHT PRÜFBAR — not a pass; who does what, at which gate:** {paste the generated table | none}.

**Acceptance criterion (the exit code is not it):** every DIVERGIERT row is either fixed or accepted as a
recorded decision at Gate A–D, and every NICHT PRÜFBAR row has a named human who checked it by hand.

**Verifier changes made during this run:** {none | {what was changed, with a link}}. {If the verifier was
patched mid-run, say so plainly, state that the final numbers come from the patched version, and say
whether the patched verifier was re-run against the pre-fix tree.} **Runs, in order:**
{run 1 {a}/{b}/{c} → {what changed before the next run} → run 2 {…} → …} — so a reader can tell a tooling
correction from a content repair.

## Auto-fix (spec §12 — only if the loop ran)

<!-- From migration-log/autofix.tsv. If the loop did not run, say "not run". Every row is individually
     revertible from the snapshot beside it in migration-log/autofix/iter<N>/<finding>/before.tar. -->

**Loop:** {not run | {n} iterations of at most 3, stopped by {clean | no fixable findings | no-progress |
the ceiling}}. **Allowlist offered:** {classes} — everything else was excluded by construction (identity,
narrative, a source defect, a judgement call).

| # | Finding | Class | What changed | Why it is auto-fixable | Cleared? |
|---|---|---|---|---|---|
| {1} | `{id}` | {class} | {files} | {mechanical · reversible · confirmed by check {X}} | {yes \| **REVERTED → DEC-{n}**} |

**Reverted or refused fixes are findings, not footnotes:** each is a ① row. A fix whose finding did not
clear was undone deliberately — a half-fix is an unexplained change attached to an unsolved problem.

## Protocol (what was executed — for auditors)

<!-- GENERATED FROM migration-log/run.log (spec §10.6). Do not write it from recollection: every claim
     traces to a log line, and where the two disagree the log is right. A claim with no line behind it
     is a defect — re-run the step, do not add the sentence. Tool versions, pins and the goFSH `-d` set
     are read out of the `cmd=` tokens. Every WARN and ERROR must also appear in a queue above: a WARN
     that reaches nobody is the failure mode this section exists to prevent. -->

| Step | What ran (`cmd=` from the log) | Measured outcome | Raw log | WARN/ERROR → queue | Acceptance |
|---|---|---|---|---|---|
| {5.1b.2} | `{the actual command line}` | {counts, exit code} | `migration-log/{action}.log` | {n} → {DEC-n \| REV-n \| QA-n \| none} | {met \| met-as-qualified \| **NOT met**} |

**Acceptance verdicts:** *met* — the step's stated criterion held · *met-as-qualified* — it held only
under an exception documented before the run (spec §5.1b.4: a shape-B build whose residual
unresolvable-parent errors are a known Gate-A escalation) · *NOT met*.

**Log:** `migration-log/run.log` — {n} lines, {n} WARN, {n} ERROR, {n} runs, all accounted for above.
Take those from the log, not from memory: `wc -l`, `grep -c '  WARN   '`, `grep -c '  ERROR  '`,
`grep -c '  run-boundary  '`. More than one run means the block was repeated: report the LAST run's
numbers and say the earlier ones exist.

**Silent-partial-success WARNs:** {list | none} (`grep -F 'silent-partial-success:' migration-log/run.log`)
— a step whose tool reported success while producing less than its input implies (goFSH exiting 0 having
converted 1 of 20 resources). Exit status is not evidence of completeness; the two counts are, so each
such WARN names both. **If one of these is reported as superseded, say which later step fixed it, with
the line and the check that confirms the fix** — a partial transfer left unproven is content loss.

**Other WARN classes and where each goes:**

| WARN class | Means | Goes to |
|---|---|---|
| `anticipated-nonzero-exit:` | the shape-B `sushi-after` escalation | ①, one row per residual error |
| `exit-status-truncated:` / `exit-status-disagrees:` | believe the printed error count, not the status | ③ |
| `stale-raw-log:` / `count-above-expected:` | the log and the tree disagree | ③, or ① if it is a loss |
| `identity-contradiction:` | two tiers assert different values for one field (§2.1.4) | ①, one row per field |
| `not-in-a-package-manifest:` / `not-recoverable-from-a-repository:` / `license-text-unrecognized:` | the identity fields a human still supplies | ① |
| `client-rendered-page:` | the Simplifier PROJECT page yields nothing mechanically — read it by hand | ② |
| `unpinned-guide-version:` / `page-unreachable:` / `content-region-absent:` / `project-download-unavailable:` | the narrative harvest's own gaps | ②, one row per skipped page |
| `generated-view-lossy:` | a rendered artefact view the IG Publisher regenerates anyway | ③ |
| `parent-without-snapshots:` / `generator-refused:` / `snapshot-implausible:` | §5.1b.5 | ① |
| `verification-divergence:` | one DIVERGIERT row (§11) | ① if a decision, ③ if a build finding |
| `not-mechanisable:` | one NICHT PRÜFBAR row — never read as a pass | ① |
| `autofix-reverted:` / `autofix-refused:` / `autofix-no-progress:` / `autofix-ceiling:` | what the loop declined to leave behind (§12) | ① |

**Deviations from the skill or the template, with justification:** {list | none}.

## Sign-off — what must happen before anything is published

**Paste the GENERATED QA checklist here** (`qa-checklist.py`, invocation under *How to re-run*;
written to `migration-log/qa-checklist.md` — do not retype). It renders every open obligation from
the machine ledgers as one `- [ ]` checkbox under the gate that owns it — delivered as a
pull-request body, the boxes are clickable and the PR shows tick progress. The generator cannot
enumerate judgement: **add one checkbox per report-authored DEC-n/REV-n/QA-n block** where its
placeholder comment says so, then keep checklist and report blocks in sync by regenerating, never by
retyping.

{GENERATED QA checklist — paste `migration-log/qa-checklist.md`, then fill in the report-authored
items}

| Status | Items | Owner |
|---|---|---|
| **Blocks publication** | {DEC-n, REV-n, QA-n \| none} | {…} |
| **Should be settled, does not block** | {…} | {…} |
| **Accepted as-is, recorded** | {…} | {…} |
| **Sent upstream to the module team** | {…} | {…} |

| Gate | Signed by | Date | Conditions attached |
|---|---|---|---|
| A | {…} | {…} | {…} |
| B | {…} | {…} | {…} |
| C | {…} | {…} | {…} |
| D | {…} | {…} | {merging publishes — {what exactly becomes public}} |

## Mini-glossary (backstop — every term is also glossed where it is used)

- **canonical** — the module's permanent identifying URL; changing it breaks everyone who resolves it.
- **FSH / SUSHI** — FHIR Shorthand is the plain-text language profiles are authored in; SUSHI is the
  compiler that turns it into FHIR resources. A SUSHI error means nothing downstream ran.
- **IG Publisher** — HL7's tool that renders the resources and prose into the published specification
  website and validates them on the way; every QA error in this report is one of its findings.
- **qa.txt / qa.html** — that validation report: errors block a release, warnings need judgement,
  "broken links" are unresolved references in the rendered site.
- **goFSH** — the reverse compiler that turns existing FHIR resources back into FSH (the shape-B path);
  its `-d` set is the dependency packages it is given so it can resolve those resources' parents.
- **Gate A–D** — the four human sign-offs; see the gate table above for what each decides and who staffs it.
- **Gate 0** — the measured pre-flight scope picture; not a sign-off.
- **TODO:REVIEW** — an in-tree marker meaning "a human must look here"; queue ② groups them all.
- **Intro note** — narrative that renders atop an artefact page (`input/intro-notes/`).
- **Logical model / profile** — the dataset described abstractly vs. its concrete FHIR shape.
- **Text run** — one contiguous stretch of source prose of at least 40 characters; the unit check C4
  counts, so an unmatched run is at most a sentence-sized fragment.
- **Run log** — `migration-log/run.log`: every step, the command it ran, and what that command measurably
  produced. The Protocol section is generated from it, so this report cannot claim what the run did not do.
- **The two oracles** — the run log records what each step *intended and measured*; the target tree records
  the *outcome*. Verification reads both, because a class of defect exists only in the gap between them.
- **IDENTISCH / DIVERGIERT / NICHT PRÜFBAR** — matches · differs, named · could not be checked. The third
  is **not** a pass; it is a job for a named human.
