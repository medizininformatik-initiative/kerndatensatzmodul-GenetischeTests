# Every code this skill uses, in one place

<!-- THE LOOKUP FILE. Nothing here is new information: it collects the codes that appear in the run log,
     the verification output, the report and the module template's CI, so a reader who meets one of them
     never has to know where it is defined. Every artefact that prints a code MUST also print its
     plain-language meaning next to it (verify-migration.py does this from CHECK_TITLES, derived-scan.py
     from its own table) — this file is the backstop, not the mechanism. Keep it in sync: a code that
     exists in a script and not here is a defect. -->

A reviewer should never need this file, because every generated table already carries a plain-language
column. It exists for the case where a code reaches someone out of context — in a commit message, a CI
log, or a conversation.

## The three verdict words

The verifier reports in German, because its findings are read alongside German module content.

| Verdict | Means |
|---|---|
| **IDENTISCH** | the check ran and the target matches the source |
| **DIVERGIERT** | the check ran and found a named, evidenced difference |
| **NICHT PRÜFBAR** | the check could **not** run — an input was missing, or the property is a human judgement. **This is not a pass**; it owes a named human an action at a named gate |

## The human gates

The agent never passes a gate itself.

| Gate | Decides | Typically staffed by |
|---|---|---|
| **Gate 0** | nothing — it is the *measured scope* of the unmigrated source, taken before any work, so a reader can see what the module contains before judging what was done with it | — |
| **A** | identity: canonical URL, ids, version, licence, dependency pins, artefact completeness | module maintainer with TF-KDS (the MII Taskforce Kerndatensatz, which owns cross-module conventions) |
| **B** | the narrative: section mapping, completeness, images, links | the module's clinical and technical authors |
| **C** | language: translation quality and every review marker | a reviewer competent in both languages and in the module's domain |
| **D** | release governance, and the merge decision — **merging is what publishes** | TF-KDS / AG IOP / NSG per KDS governance |

## M1–M11 — the module template's release checks

Run in the module's own CI by `scripts/convention-check.mjs`. They belong to the **template**, not to this
skill; the migration only has to leave a module that passes them. In development they are advisory; on a
release branch they fail the build.

| Code | Asks |
|---|---|
| **M1** | `packageId` sits in the MII KDS namespace (`de.medizininformatikinitiative.kerndatensatz.…`) |
| **M2** | `id` follows `mii-ig-<slug>` |
| **M3** | `name` follows `MII_IG_…` |
| **M4** | `title` starts with `MII ` and names the module |
| **M5** | `canonical` sits in the agreed MII URL space |
| **M6** | `version` is MII CalVer `YYYY.n.n`, never SemVer |
| **M7** | no floating dependency or template pin (`current`, `latest`, `dev`, `cibuild`) |
| **M8** | the scaffold's demonstration page is gone on a release branch |
| **M9** | every optional page is decided — **measured, not judged**: the built artefact count for that page's type is 0 → remove the page, above 0 → keep and fill it |
| **M10** | no page repeats its own title or a parent heading as a heading |
| **M11** | the Security-and-Privacy stage-3 decision is taken and the illustrative example box is gone from **both** languages |

## C, F, P, R, L — this skill's verification checks

Four layers plus the run log read back as a second oracle. `verify-migration.py` prints the plain-language
column beside every one of these, and `migration-log/verification.md` carries the same table.

| Code | Asks |
|---|---|
| **C1** | every source artefact still exists in the migrated module |
| **C2** | every artefact is reachable from the rendered Artifacts page |
| **C3** | every source guide page was migrated or explicitly retired |
| **C4** | the source's narrative text is present somewhere in the target |
| **C5** | menus lead somewhere, and every page is in a menu |
| **C6** | each text passage landed on the page the page map promised |
| **C7** | content the migration wrote is marked as such in the guide (spec §9d) |
| **F1** | module identity is unchanged (id, canonical, version, licence, …) |
| **F2** | dependency versions are pinned exactly as the source pinned them |
| **F3** | the licence is asserted from evidence, never defaulted |
| **F4** | no mechanical FSH conversion residue is left |
| **P1** | the rendered site reports the template package it was built with |
| **P2** | the vendored template ref matches what the run log recorded |
| **P3** | the IG Publisher version matches the workflow pin |
| **P4** | the source guide was pinned to a published version, not "current" |
| **P5** | `ig.ini` points at the IG resource the build actually writes — SUSHI names it from the sushi-config `id`, so a path derived from the repository slug names a file that never exists |
| **R1** | tables, tabs and images render with content, not empty |
| **R2** | page header and footer metadata render correctly |
| **R3** | a translated page really differs from the default language |
| **R4** | no links point at template example artefacts that were deleted |
| **R5** | every page has a title unit in the translation catalogue |
| **L0** | a run log exists at all |
| **L1** | every partial-success warning was acted on |
| **L2** | every expected step actually wrote a log line |
| **L3** | no identity contradiction is still open |
| **L4** | the log's counts agree with what the tree holds |

## DERIVED marker kinds (spec §9d)

Written into the pages so that content the migration *wrote* is visible as such in the rendered guide.
Content merely **moved** or **split** is never marked — only text that did not exist in the source.

| Kind | Means |
|---|---|
| **summary** | condensed or reworded from one or more source passages |
| **bridge** | connective text written to join merged sections |
| **suggestion** | content proposed where the source had none |
| **stand-in** | an invented value awaiting confirmation (a date, a contact, a code) |
| **no-source** | a default-language page produced where the source ships no counterpart |

## Report item ids

| Prefix | Means |
|---|---|
| **DEC-n** | an open decision — queue ①, someone must choose |
| **REV-n** | a review item — queue ②, someone must check |
| **QA-n** | a build/validation finding — queue ③, triaged by provenance |
| **FIX-n** | a change the migration already applied, revertible on its own commit |

The report's *Sign-off* section carries a **generated QA checklist** (`qa-checklist.py`): one
`- [ ]` checkbox per open obligation from the machine ledgers, grouped under the gate that owns it
(findings verdicted DIVERGIERT or NICHT PRÜFBAR, per-field identity contradictions — which REPLACE
the verifier's one-line L3 finding whenever the claims ledger is present — derived-content pages,
retirements and harvested twins, plus the fixed release items). Checkboxes for the report-authored
DEC/REV/QA items are added by the report author — the generator cannot enumerate judgement.

## The two source shapes

| Shape | Means |
|---|---|
| **A** | the source repository ships FSH (`input/fsh/`) — the artefact definitions are portable as they are |
| **B** | the source ships only raw XML/JSON resources (the Forge/Consent shape) — the FSH is DERIVED once via goFSH, then both shapes follow the same procedure |

## Run-log step ids

The first field of a run-log line. They follow the specification's section numbers, so `5.4c` is the step
described in spec §5.4c. The full list of steps a run is expected to emit — and therefore the list whose
absence check **L2** reports — is [`references/expected-steps.tsv`](expected-steps.tsv).

**page-map v2 columns.** `migration-log/page-map.tsv` — the contract the narrative migration binds to:
GENERATED and coverage-validated at step 3 by `page-structure-advice.py --map` (the `5.4c page-routing`
run — its page universe spans the `pages:` block, the authoritative guide tree, `input/pagecontent`
AND the step-2c harvest manifest, so every source shape enters the same contract), human-reviewed,
consumed by step 5, checked by C3/C6 at step 8 — carries
`source_page` · `target` (or `RETIRED`) · `reason` · `branch` (the spec-§9e routing branch, 1–5) ·
`measure` (the measurement that forced the branch). Backward compatible: a v1 parser (the verifier
included) reads the first three columns and ignores the rest.
