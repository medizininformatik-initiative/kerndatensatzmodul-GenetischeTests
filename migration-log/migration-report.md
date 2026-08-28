# Migration report — MII KDS-Modul Molekulargenetischer Befundbericht → MII KDS module template

**Module:** MII Kerndatensatz-Modul Molekulargenetischer Befundbericht (`de.medizininformatikinitiative.kerndatensatz.molgen`) · **Report author:** Claude (agent), skill `mii-ig-migration` @ catalog `v0.23.0` · **Report date:** 2026-08-28
**Written for:** the module maintainer and the MII Taskforce Kerndatensatz (TF-KDS) · **Decision requested by:** before the next release of this module
**Decision requested:** approve with the listed conditions — the ① decisions below must be answered first.
**State:** complete through build and verification.
**Published?** No package was released to the FHIR package registry. The rendered preview is private (local build at `output/`); pushing the branch publishes it to `gh-pages` under `branches/migration-2026.0.4-template-v0.13.0/`.
**Recommendation:** merge after Gate A answers the licence question (DEC-1), confirms the example-id rename (DEC-2) and reconciles the two CI systems (DEC-4) — everything else is either already correct or a pre-existing finding this migration only made visible.

## How to use this report

1. Read **Summary** and **Applied fixes** first (five minutes): that is everything that already changed.
2. Working a sign-off? Go to the **QA checklist** under *Sign-off*: one checkbox per open obligation, grouped by gate — tick what is yours, follow each box back to its detail block here.
3. Then work **① Decisions**, **② Reviews**, **③ QA triage** in that order. Every item names its owner — skip the ones that are not yours.
4. Comparing the migrated guide against the source by hand? The **Content map** links every old page to where its content now lives.
5. **Gate 0**, **Identity**, **Verification** and **Protocol** are evidence. Open them only to check an item.
6. Item ids are typeable and greppable (`DEC-3`, `REV-2`, `QA-5`, `FIX-1`) — quote the id when you answer.
7. Nothing is published and every applied change is revertible; but doing nothing is not neutral, so read each item's **If nobody acts**.

## Summary — read this first

The module is the MII core-dataset module for molecular genetic findings: 16 profiles, 5 extensions, 4 value sets, 1 logical model, 1 CapabilityStatement, 6 search parameters and 122 example instances, with a 41-page German narrative. It was authored as a SUSHI project and **rendered by Simplifier**; it has now been moved onto the MII KDS module template, so it is built and rendered by the HL7 IG Publisher instead, in English with a German translation.

- **Source:** `medizininformatik-initiative/kerndatensatzmodul-GenetischeTests` @ `79eaf41` (tag `v2026.0.4`), **shape A** — the source was already an IG-Publisher project with FSH in its tree. Narrative taken from the repository's own `implementation-guides/ImplementationGuide-2026.x-DE` tree (41 pages, 17 194 words), not from a guide harvest.
- **Target:** module template `v0.13.0`, which references the shared IG template `ig-template-mii-kds` from `ig.ini` by URL.
- **Rendered preview:** not yet public. Local build in `output/` — default language English at `output/index.html`, German at `output/de/index.html`.
- **Build:** SUSHI (the compiler that turns FSH into FHIR resources) reports **0 errors, 0 warnings**. The IG Publisher's separate QA report lists **68 errors / 961 warnings / 0 broken links**. Two tools, two counts — QA errors do not fail the build.
- **QA acceptance bar:** no worse than the unmigrated source. The source's own last CI run reported **113 errors**; this build reports **68**. The two are not the same measurement (③ QA-1 explains), but nothing got worse and no error sits in a page this migration wrote.
- **Verification:** **128 IDENTISCH · 70 DIVERGIERT · 50 NICHT PRÜFBAR** — the check ran and matched · ran and found a named difference · could not run. The third is **not** a pass. **42 of the 70 divergences are one systematic false positive** (③ QA-2), re-measured three ways; the rest are named individually below.
- **Open for humans:** **4 decisions (①)**, **4 reviews (②)**, **8 QA items (③)**; **3 of them block publication** and are listed under *Sign-off*.
- **Not checked by this migration:** clinical correctness of any prose, the genetics domain content itself, and whether the terminology bindings are the right ones. Unchanged from the source, and out of scope here.

## Where the evidence lives

| File | What it is | Cited by |
|---|---|---|
| `migration-log/run.log` | append-only record of every step, its command and what that command measurably produced | all sections |
| `migration-log/verification-findings.tsv` | one row per checked subject (`id layer check verdict subject evidence action`) | Verification, ②, ③ |
| `migration-log/verification.md` | the same rows, human-readable, with a next action per divergence | Verification |
| `migration-log/page-map.tsv` | the page-map contract (`source_page → target` or `RETIRED`, plus `reason`, `branch`, `measure`) — generated, then reviewed and edited before anything was written | Content map, ② |
| `migration-log/page-map.generated.tsv` | the **unedited** generator output, kept so Gate B can diff the 21 rows the reviewer re-routed | Content map |
| `migration-log/page-structure-advice.md` | the generated map's human-readable rendering | Content map |
| `migration-log/comparison-table.md` | the map as a walkable side-by-side view, GENERATED | Content map |
| `migration-log/qa-checklist.md` | the per-gate sign-off checklist, GENERATED from the four ledgers | Sign-off |
| `migration-log/identity-claims.tsv` | one row per identity field per source, with tier and contradiction flag | Identity, ① |
| `migration-log/preflight-analysis.json` | the measured scope of the **unmigrated** source (Gate 0) | Gate 0 |
| `migration-log/postflight-analysis.json` | the same measurement on the **migrated** tree | ③ |
| `migration-log/prepost-delta.md` / `.tsv` | property-by-property pre→post verdicts | Summary, ③ |
| `migration-log/source-inventory.json` | every source artefact and page, with its path | Content map |
| `migration-log/derived-content.tsv` | one row per DERIVED marker — every passage the migration **wrote** rather than carried | ②, Verification |
| `migration-log/narrative-transform.json` | every Simplifier directive resolved, counted by kind, plus the unresolved list (empty) | Content map |
| `migration-log/qa-run1.txt` / `qa-run2.txt` / `qa-run3.txt` | the IG Publisher QA report after each of the three builds | ③, Protocol |
| `migration-log/qa-source-baseline-validation.json` | the **source's own** committed validator run (2025-12-04), the only QA baseline that exists | ③ QA-1 |
| `migration-log/narrative-de/` | the migrated German content as staged, before it was merged into the template page scaffolds | ② |
| `migration-log/sushi-*.log`, `ig-publisher.log` | raw tool output behind every build number | ③, Protocol |

**Citation format:** `run.log {step} {event}` means one line in the run log — find it with `grep -F '{event}' migration-log/run.log`. Where this report and an evidence file disagree, the evidence file is right: regenerate, never retype.

## How to re-run any of this

| What | Command | Expected |
|---|---|---|
| compile the FSH | `npx --yes fsh-sushi@3.20.0 .` | `0 Errors 0 Warnings`, 133 resources |
| render and validate the guide | `java -Xmx6g -jar publisher.jar -ig ig.ini` | `output/qa.txt` with 68 errors, 0 broken links |
| the template's release checks (M1–M11) | `node scripts/convention-check.mjs` | `PASS — no hard violation` |
| the migration verifier (C/F/P/R/L) | `python3 .claude/skills/mii-ig-migration/scripts/verify-migration.py --target . --source <unmigrated checkout> --rendered output --source-lang de --template-latest v0.13.0` | exit 1 (findings are the output) |
| the derived-content scan | `python3 .claude/skills/mii-ig-migration/scripts/derived-scan.py --target .` | 28 markers, 0 findings, exit 0 |
| the page-routing map generator | `python3 .claude/skills/mii-ig-migration/scripts/page-structure-advice.py --source <src> --target . --guide-tree ImplementationGuide-2026.x-DE --out migration-log/page-structure-advice.md --map migration-log/page-map.tsv` | exit 0. **Re-running overwrites the reviewed map** — re-apply the 21 reviewer edits from `page-map.generated.tsv` afterwards |
| the pre/post delta | `python3 .claude/skills/mii-ig-migration/scripts/prepost-delta.py --pre migration-log/preflight-analysis.json --post migration-log/postflight-analysis.json --out migration-log/prepost-delta.md --tsv migration-log/prepost-delta.tsv` | exit 1, 1 regression (QA-3) |
| the sign-off checklist | `python3 .claude/skills/mii-ig-migration/scripts/qa-checklist.py --log-dir migration-log --out migration-log/qa-checklist.md` | 40 checkboxes across 4 gates |
| regenerate the `special-url` list | the one-liner in the comment above `special-url:` in `sushi-config.yaml` | the same 21 URLs |

**The verifier is not vendored in this repository** — it ships with the `mii-ig-migration` skill, copied to `.claude/skills/mii-ig-migration/` for this run from catalog release `v0.23.0`. All four scripts run offline; the verifier needs the unmigrated source checkout and the rendered `output/`.

## Codes, gates and words used in this report

**Item ids.** `DEC-n` = decision queue ① · `REV-n` = review queue ② · `QA-n` = QA triage ③ · `FIX-n` = an applied, revertible change.

**Verdict words** (the verifier reports in German): **IDENTISCH** the check ran and matched · **DIVERGIERT** the check ran and found a named difference · **NICHT PRÜFBAR** the check could not run, because an input was absent or the property is a human judgement. NICHT PRÜFBAR is **not** a pass.

**M1–M11 — the template's own release checks**, run in CI by `scripts/convention-check.mjs`. M1 packageId in the MII KDS namespace · M2 `id` follows the MII pattern · M3 `name` is `MII_IG_…` · M4 `title` starts with `MII ` · M5 `canonical` in the agreed MII URL space · M6 `version` is CalVer · M7 no floating dependency pin · M8 the scaffold's demo page is gone · M9 every optional page is explicitly decided, **measured** not judged (built artefact count 0 → remove, >0 → keep) · M10 no page repeats its own title or a parent heading · M11 the Security-and-Privacy stage-3 decision, illustrative example box removed in both languages. **All of them pass** (`run.log 5.4 convention-check`).

**C / F / P / R / L — the migration verifier's four layers plus the run log as a second oracle.** **C** conservation: did everything in the source arrive · **F** fidelity: is the module still itself (identity, pins, licence) · **P** provenance: was it built with the versions it claims · **R** rendering: does the site actually render · **L** the run log read against the tree. The individual checks used below: **C1** every source artefact still exists · **C4** the source's narrative text is present somewhere · **C5** menus lead somewhere and every page is in a menu · **C7** migration-written text carries a DERIVED marker · **F1** module identity unchanged · **F2** dependency pins identical to the source's · **F3** licence asserted from evidence, never defaulted · **P1** the template version the rendered site reports · **R1** tables, tabs and images render with content · **R2** page header/footer metadata render correctly · **R4** no links to deleted template examples.

**Gates — the four human sign-offs.** The agent never passes a gate itself.

| Gate | What it decides | Who staffs it | Passed when |
|---|---|---|---|
| **A** | identity: canonical, ids, version, licence, artefact completeness | module maintainer + TF-KDS (the MII Taskforce Kerndatensatz, which owns cross-module conventions) | every ① row is answered and the answer is recorded here |
| **B** | the narrative: section mapping, completeness, images and links | the module's clinical and technical authors | every ② row is checked or explicitly accepted |
| **C** | language: translation quality, every `TODO:REVIEW` marker | a reviewer competent in German and English and in this domain | no `TODO:REVIEW` remains unreviewed |
| **D** | release governance, and the merge decision | TF-KDS / AG IOP / NSG per KDS governance | A–C signed and the blocking items cleared |

**Gate 0 is not a sign-off.** It is the measured scope picture taken on the unmigrated source before any work started.

**"spec §n"** refers to the migration specification in `.claude/skills/mii-ig-migration/references/migration-spec.md`.

## Applied fixes (already changed — a human confirms or reverts)

Accepting these needs no action — merging accepts all of them. To reject one, revert it on branch `migration/2026.0.4-template-v0.13.0`. **Revert newest first:** FIX-5, FIX-4, FIX-3, FIX-2, FIX-1.

| # | Fix, in plain words | Commit | Also touches (beyond the headline) | If reverted | Independent? |
|---|---|---|---|---|---|
| FIX-1 | Vendored the module template v0.13.0 and filled in the module's identity | `8c3e224` | ~120 template files (`docs/`, `scripts/`, `qc/`, `.github/workflows/`, `ig-template/`, `input/pagecontent/` starter pages, `input/translations/`); merged the FSH scaffold per the collision rule; deleted the template's example profile and its test fixture; **rewrote `ig.ini` and `sushi-config.yaml`** | the module is no longer on the template at all — this is the migration | yes (it is the base) |
| FIX-2 | Migrated all 41 narrative pages onto the template page set, in both languages | `6ee0d4b` | 15 intro notes + their German mirrors, 12 page pairs, `input/images/` (5 files), `input/images-source/` (3), `menu.xml` in both languages, the `pages:` tree, the page-title `.po`; removed 4 pages (M8/M9) | the guide renders the template's starter pages under this module's name | conflicts with FIX-1 |
| FIX-3 | Shortened six DiagnosticReport **example** ids so the package can be built at all | `e0f0dcd` | `input/fsh/{MolekulargenetischerBefundbericht,additional-examples,GenomicStudy,ARCHIVED-STU2-Examples}.fsh` and 3 references in `guidance.md` (both languages) | **the IG Publisher hard-fails** — see DEC-2 | yes |
| FIX-4 | Cleared every build, link and rendering finding the publisher raised | `86d6f39` | the 21-entry `special-url` list in `sushi-config.yaml`; 20 link repairs across 8 pages; 30 FQL blocks removed from the intro notes; `implementation-guides/README.md`; the licence wording on `index.md` and `metadata.md` in both languages | 42 URL-mismatch errors and 20 broken links return | yes |

| FIX-5 | Restored the 27 example references the transform had dropped, and cleared the two CI checks | `78a9ae0` | 26 intro notes (13 profiles × 2 languages) gain a marked *Examples* section; the phrase "the German source" reworded to "the German page" across 12 English files; 3 reviewed ALLOW entries added to `scripts/language-model-check.sh` | eight intro notes keep captions that point at nothing, and the language-model CI check fails | yes |

**Required, not optional:** FIX-3 — reverting it only reproduces a hard build failure. It is listed for completeness, not as a choice, but the id change itself **is** a decision (DEC-2).

## ① Decision queue (Gate A — someone must choose)

**DEC-1 — The module declares no licence, and this migration refused to invent one** · severity **blocking** · Gate A

- **What it is:** The source declares no licence anywhere a machine reads it: no `license:` in `sushi-config.yaml`, none in `package.json`, no `LICENSE` file, no SPDX extension in the FSH. Its home page *does* carry a reuse statement — "Der Inhalt dieser Spezifikation ist öffentlich. Die Nachnutzungs- bzw. Veröffentlichungsansprüche sind nicht beschränkt" — but that names no licence, so it cannot go into `license:`, which takes an SPDX code. The module template ships `license: CC-BY-4.0` as a plain literal that no placeholder check flags; adopting it would have silently relicensed a published module.
- **Where:** `sushi-config.yaml` (the `license:` block, commented out with a TODO) · `input/pagecontent/index.md` and its German mirror (the copyright section) · `input/pagecontent/metadata.md` and its mirror (the FAIR table row R1.1).
- **If nobody acts:** the guide ships asserting no licence. Consumers have only the prose statement on the home page; the FHIR package carries no licence field; check F3 stays DIVERGIERT; the FAIR metadata row on `metadata.md` reads "TODO:REVIEW" in the published guide.
- **Options:** (a) `CC0-1.0` → closest to the source's "reuse is not restricted" wording · (b) `CC-BY-4.0` → what the template ships and what sibling module *Biobank* declares on artefact-level evidence; **more restrictive than what the source promises**, so it is a change of terms, not a formalisation · (c) leave it undeclared → the current state, honest but incomplete.
  **Default applied now:** (c) — nothing is asserted, and the home page carries the source's own wording verbatim.
- **Next action:** pick an SPDX id, then make three places agree: `license:` in `sushi-config.yaml`, a `LICENSE` file at the repo root, and the copyright section of `index.md` in both languages.
- **Who decides:** the module maintainer with TF-KDS — a licence binds every consumer of the published package, and MII wants it consistent across modules.
- **Effort · impact:** minutes to apply, but the decision itself is legal · consumer-visible.
- **Reversible:** yes while unpublished; **no** once a package is released under a licence.
- **Evidence:** `run.log 2.2 licence-evidence` · `run.log 2.2 licence-absent` · `migration-log/identity-claims.tsv` · verification `F1-7bae24`, `F3-1a29c4`.

**DEC-2 — Six published example ids were shortened so the package can be built** · severity **blocking** · Gate A

- **What it is:** The IG Publisher hard-fails when a resource's path inside the package exceeds the tar format's 100-byte file-name field. `package/example/DiagnosticReport-mii-exa-molgen-molekulargenetischer-befundbericht-trurisk-panel.json` is 101 bytes; two more sat at exactly 100. FIX-3 shortened the shared id segment `molekulargenetischer-befundbericht-` to `befundbericht-` across the six DiagnosticReport **example** instances, matching the module's own `mii-exa-befund-bundle-*` convention. Longest path is now 89 bytes.
- **Where:** `input/fsh/MolekulargenetischerBefundbericht.fsh`, `input/fsh/additional-examples.fsh`, `input/fsh/GenomicStudy.fsh`, `input/fsh/ARCHIVED-STU2-Examples.fsh` — commit `e0f0dcd`.
- **Why it was never seen before:** the source repository's CI (`.github/workflows/main.yml`) runs only the Java validator and a release step. **It never ran the IG Publisher**, so the packaging step that enforces this limit never executed; Simplifier rendered the guide instead. The defect is pre-existing and latent; this migration is the first thing to expose it.
- **If nobody acts:** nothing further happens — the build works. But release 2026.0.4 published the old example ids, so anyone who pinned them by id will not find them in the next release.
- **Options:** (a) accept the rename → the six examples get new ids in the next release; a changelog entry should say so · (b) revert `e0f0dcd` and shorten differently (e.g. only the three offenders) → asymmetric ids in one family, and the other three sit one character from the same failure · (c) revert and drop the offending examples → loses coverage.
  **Default applied now:** (a).
- **Next action:** confirm (a), and add the old→new id mapping to the module's changelog for the next release.
- **Who decides:** the module maintainer — example ids are the module's own naming, but they are published.
- **Effort · impact:** minutes · consumer-visible for anyone referencing an example by id.
- **Reversible:** yes — `git revert e0f0dcd`, at the cost of an unbuildable package.
- **Evidence:** `run.log 5.6 tar-name-limit` · verification `C1 ×6` · the old→new pairs are in that log line and in the `C1` rows of `verification-findings.tsv`.

**DEC-3 — Three identity fields disagree between the source's own files** · severity **medium** · Gate A

- **What it is:** Three fields have two source values each. The migration carried the higher-tier one and **changed nothing**, per spec §2.1 ("reported, never resolved").
  - `publisher`: `sushi-config.yaml` says `Medizininformatik-Initiative` (hyphen), `input/fsh/rulesets/publisher.fsh` says `Medizininformatik Initiative` (space) and stamps that onto **every conformance resource**. The migration used the artefact-level value, so the guide is now internally consistent — but it differs from the source's `sushi-config.yaml`.
  - `copyrightYear`: `sushi-config.yaml` says `2021+`, the home page says `Copyright © 2022+`. Both are still in the tree, in their respective places.
  - `title`: `sushi-config.yaml` says the full module title; `README.md`'s first heading says the repository slug. Not a real conflict — recorded because the tooling reads both.
- **Where:** `sushi-config.yaml` (`publisher:`, `copyrightYear:`) · `input/fsh/rulesets/publisher.fsh` · `input/pagecontent/index.md` copyright section (both languages).
- **If nobody acts:** the published guide shows `2021+` in its package metadata and `2022+` on its home page. Cosmetic, but a reader will notice.
- **Options:** for `publisher`, (a) keep `Medizininformatik Initiative` everywhere → what is in the tree now · (b) switch to the hyphenated form → then `publisher.fsh` and every generated resource must change too. For `copyrightYear`, pick one year and use it in both places.
  **Default applied now:** (a) for publisher; both years left where the source put them.
- **Next action:** confirm the publisher spelling; pick a copyright year and make `sushi-config.yaml` and `index.md` agree.
- **Who decides:** the module maintainer.
- **Effort · impact:** minutes · cosmetic.
- **Reversible:** yes, config-only.
- **Evidence:** `run.log 2.1 identity-read` (three `identity-contradiction:` lines) · `migration-log/identity-claims.tsv` · verification `F1-5451f2`.

**DEC-4 — Two CI systems now run side by side, and the older one fails** · severity **high** · Gate A, executed at Gate D

- **What it is:** The template brings ten workflows (build and preview, validation, convention check, release, dependency and security scans). The source's own `.github/workflows/main.yml` is still there and now **fails on every push**. It fails for a specific reason: it validates from the **committed** `fsh-generated/` — it never runs SUSHI itself — and then auto-commits `fsh-generated/` back to the branch. The template gitignores `fsh-generated/` as a build artefact (`.gitignore:42`), so that commit step errors with *"The following paths are ignored by one of your .gitignore files: fsh-generated"*.
- **The side effect is the dangerous part.** Git keeps tracking files it already tracked, so `fsh-generated/` is now **half-tracked: 127 files tracked, 134 on disk**. The six examples FIX-3 renamed are **not** among the tracked ones — they were created after the `.gitignore` merge — and the six they replaced are gone. The committed copy no longer matches `input/fsh`, and `main.yml` validates exactly that copy.
- **Where:** `.github/workflows/main.yml` · `.gitignore:42` · the 127 tracked files under `fsh-generated/`.
- **If nobody acts:** every push to this branch and to `main` shows a red check; the committed `fsh-generated/` drifts further from the FSH with each change, and anything reading it — including that workflow's validation result — reports on stale resources.
- **Options:** (a) **retire `main.yml`** and untrack `fsh-generated/` (`git rm -r --cached fsh-generated`) → the template's `validation.yml` and `module-release.yml` already cover validation and release; the Zulip notification and the release-tagging behaviour of `main.yml` must be checked against `module-release.yml` first · (b) keep `main.yml` and remove `fsh-generated/` from `.gitignore` → two systems keep running, and generated output stays in git · (c) leave both as they are → the red check and the drift stay.
  **Default applied now:** (c) — nothing was removed. The skill's rule for a repository carrying both old and new scaffolding is *list, do not remove*: retiring the previous release automation is a governance decision, not a technical one.
- **Next action:** compare `main.yml` against the template's `validation.yml`, `module-release.yml` and `go-publish.yml` feature by feature — especially release tagging and the Zulip notification — then take option (a) or (b).
- **Who decides:** the module maintainer, with TF-KDS for the release-automation part.
- **Effort · impact:** an hour to compare · blocks a clean release, because two release paths can both fire.
- **Reversible:** yes — the workflow file and the tracked files are both restorable from git history.
- **Evidence:** `run.log 9 ci-model-conflict` · the failing run on this branch, workflow "FHIR validation".

## ② Review queue (Gate B / C — someone must read)

**REV-1 — The page map was re-routed on 21 of 43 rows before anything was written** · Gate B

The routing generator proposed a target for every source page; the reviewer changed 21 of them and only then was anything written. Two correction classes: **seven** pages that the generator sent to a page of their own are about exactly one profile, and are now that profile's intro note — the generator's token match failed where the Simplifier slug had dropped a German umlaut or sharp-s (`Mikrosatelliteninstabilitt` vs `-instabilitaet`, `EmpfohleneFolgemanahme` vs `-folgemassnahme`) or where the page title named the FHIR resource type rather than the profile (`GenomicStudy-Procedure`). **Fourteen** more would have become new pages or hubs duplicating the template's fixed page set, and are now sections on agreed pages. Result: 15 intro notes, 12 agreed pages, exactly **one** new page.
**Next action:** diff `migration-log/page-map.tsv` against `migration-log/page-map.generated.tsv` and confirm the 21 rows. **Evidence:** `run.log 5.4c page-map-review`.

**REV-2 — `profiles.md` merges eight source pages; the size gate fired on the source count** · Gate B

The spec's size gate re-runs the routing when a host page exceeds 2500 words, merges more than 4 sources, or repeats any heading. Measured on `profiles.md`: **1420 words** (limit 2500, pass), **8 merged sources** (limit 4, **exceeds**), **0 repeated section headings** (pass). The verdict recorded was KEEP: the eight are exactly the branch-2 family overviews whose designed target *is* the artefact index page, and splitting them would add eight menu entries duplicating the generated artifact index. Recorded rather than silently exceeded.
Separately, after merging, some **sub**-headings repeat across sections (`Überblick`, `Kernprofile`, `Verknüpfungen`, `Wichtige Komponenten` on `profiles.md`; `Profil`, `Referenzen` on `implementer-guidance.md`; `Profil` on `extensions.md`). They are siblings under distinct parents, so M10 passes and the publisher disambiguates the anchors — the cost is a repetitive table of contents.
**Next action:** confirm the KEEP verdict, and decide whether to qualify the repeated sub-headings. **Evidence:** `run.log 5.4c size-gate`, `run.log 5.4 heading-collisions`.

**REV-3 — Security and Privacy: the decision was taken, the content is deliberately open** · Gate B

The source guide carries no security or privacy narrative at all (measured: 0 hits across the 41-page tree). The template offers a default text for modules with no aspects of their own. **That default was not adopted**, because for a molecular genetics module it would be untrue: the module carries genetic sequence data, which is special-category data, is inherently re-identifying after pseudonymisation, and describes blood relatives who are not the data subject. Asserting the default would have been a fabricated claim; writing the real analysis is a domain-author task the migration must not perform. Stage 3 therefore carries a marked `DERIVED:no-source` block naming exactly why the default does not apply and what must be written. The illustrative example box is removed from both languages, as M11 requires.
**Next action:** a domain author writes stage 3 before the first release. **Evidence:** `run.log 5.4b security-privacy-decision` · `migration-log/derived-content.tsv` (the only 2 DERIVED markers in the guide).

**REV-4 — Every English page is a machine translation and is marked as one** · Gate C

The source narrative is German; the template's default rendering language is English. The German text therefore became the *translation* under `input/translations/de/`, and the English default pages were produced as machine translations of it — the one sanctioned exception to the no-fabrication rule, because each traces to the page it renders. Every English page and intro note carries `<!-- TODO:REVIEW machine translation of … - reviewed at Gate C -->` at the top. Individual passages the translators found unclear carry their own inline `TODO:REVIEW` comment with the reason.
**Next action:** a bilingual domain reviewer reads the English pages against their German mirrors and removes each marker. **Evidence:** `grep -rl 'TODO:REVIEW machine translation' input/` → 26 files.

## ③ QA triage (findings that are not decisions)

**QA-1 — "No worse than the source" is only partly measurable** · owner: module maintainer

Gate 0 reported `qa_baseline: None`. The source repository does commit one — `.validation-history/20251204_163500_7deaf2b/validation.json`, a Java-validator run of 2025-12-04 reporting **113 errors**, 832 warnings — copied to `migration-log/qa-source-baseline-validation.json`. This build reports **68**. But the two are **not the same measurement**: that is the standalone validator, while `qa.txt` is the IG Publisher, which additionally checks links, page rendering, canonical/id agreement and package structure. And the unmigrated source cannot produce a comparable `qa.txt` at all, because running the publisher on it reproduces the tar-name crash of DEC-2. So the comparison holds for the terminology error class and nothing else.

**QA-2 — 42 of the 70 verification divergences are one systematic false positive** · owner: nobody (recorded)

Checks **C4** (21) and **C7** (21) report that source prose runs are "in no target page" and that pages "were rewritten and the guide does not say so". C4 compares source runs against the **default-language** pages. This module's source is German and the default is now English, so a correctly translated run can never match — the language inversion the skill's own Language section describes. C7 then fires on every C4 page. Re-measured three independent ways: (1) re-running the comparison against the **German** target and hand-checking the worst case (`KontextimGesamtprojekt`, reported 8 of 8 runs missing) finds all of it present in `input/translations/de/pagecontent/implementer-guidance.md`, under headings demoted one level; (2) **every** live German page is larger than its staged migrated content, so scaffold was added and nothing removed; (3) total narrative conservation is **17 194 → 20 367 words (118 %)**. **Evidence:** `run.log 11 c4-c7-recheck`.

**QA-3 — Two narrative trees now exist; retiring the old one is a Gate-D call** · owner: TF-KDS at Gate D

The one surviving pre/post regression: `narrative_sources.dual_source` went `false → true`, because the migration creates `input/pagecontent/` while `implementation-guides/` is retained as history. The metric's stated risk — "two trees is how the wrong one gets edited" — is real and is mitigated, not dismissed: `implementation-guides/README.md` now says in its first lines that the tree is retired, that editing it changes nothing, where the four live locations are, and where the page-by-page mapping is. Deleting the historical trees is a release-governance decision, not a technical one. **Evidence:** `run.log 7 prepost-delta-residual`.

**QA-4 — Two examples claim conformance to profiles that do not exist** · owner: the module's technical authors

`input/fsh/Mikrosatelliteninstabilitaet.fsh:61` and `input/fsh/Mutationslast.fsh:74` set `meta.profile` to Clinical Genomics **STU2** canonicals pinned to the STU3 version: `.../StructureDefinition/msi|3.0.0` and `.../StructureDefinition/tmb|3.0.0`. Measured against the CG STU3 artifact index (fetched 2026-08-28): **neither exists** — STU2's `msi` and `tmb` were merged into `molecular-biomarker` in STU3, which this module's own profile-inheritance table already documents. The examples therefore assert conformance to profiles absent from the declared dependency. Same root cause as four narrative links FIX-4 repaired — those were prose, these are normative assertions, so the migration reported them instead of changing them. **Evidence:** `run.log 5.6 stu2-canonicals-in-fsh`; two of the 68 QA errors.

**QA-5 — 44 example declarations sit inside block comments** · owner: the module's technical authors

The FSH declares 166 `Instance:` but SUSHI imports 122. The 44 difference sits inside `/* … */` blocks in six files (`UntersuchteRegion.fsh` 23, `ErgebnisZusammenfassung.fsh`, `MolekulareKonsequenz.fsh`, `MolekularerBiomarker.fsh`, `additional-examples.fsh`, `ARCHIVED-STU2-Examples.fsh`). This is pre-existing state from the module's documented STU2→STU3 migration, untouched here. Artefact conservation was therefore measured against the **134 generated** resources, not the 166 declarations. **Evidence:** `run.log 1 source-inventory-findings`.

**QA-7 — Twelve pages of this guide talk about the *Pathologie-Befund* module** · owner: the module's technical authors

Verified in the source, not relayed: `grep 'Modul Pathologie'` over the authoritative guide tree returns **12 occurrences of "Modul Pathologie-Befund"** plus one "Modul Pathologiebefund", every one of them in the sentence *"Folgende Suchparameter sind für das Modul Pathologie-Befund relevant, auch in Kombination"* — in the **molecular genetics** module's guide. It is a systematic copy-paste from a sibling module's guide. The text was migrated verbatim (migration does not rewrite content) and each occurrence carries a `TODO:REVIEW` naming the problem, in the English intro notes and their German mirrors.
**Next action:** correct the module name in all 13 places, or confirm the cross-reference is intended. **Evidence:** `grep -rn 'Modul Pathologie' input/intro-notes input/translations/de/intro-notes`.

**QA-8 — Smaller source defects the translation surfaced** · owner: the module's technical authors

Carried over verbatim with a `TODO:REVIEW` each, because correcting them is content work, not migration work: two numbered lists **skip item 8** (7 → 9); one list numbers an item **"4" twice**; one `_profile` example points at the canonical of the *Medikationsempfehlung* profile on the *EmpfohleneFolgemassnahme* page; one usage note names `component-code-value-concept` where the item is `component-value-concept`; `encounter` appears twice in one search-parameter list; and one page has the typo *"medikamanetöse"*. **Evidence:** `grep -rn 'TODO:REVIEW' input/intro-notes/` — 27 files carry at least one marker.

**QA-6 — Two rendering findings and one provenance finding are artefacts of the checks themselves** · owner: nobody (recorded)

**R2 ×4:** two flag the marker string `Unknown code` on `qualitaetsbericht.html` in both languages — but that page *is* the module's quality report, and the string sits in a table cell quoting a known validation finding. Two flag `{{title}}` on `searchform.html`, a page the IG Publisher generates itself; it exists in neither `input/` nor the template. **P1 ×1:** the rendered site reports IG template package `1.3.3` while the tree carries `1.3.2` — `ig.ini` references the template **by URL**, which follows the template's `main` branch, so it moved between the vendoring and the final build. That is inherent to the URL-reference mode the template recommends today; pinning returns when the package is published to a registry. **Evidence:** `run.log 11 r2-recheck`, `verification-findings.tsv` rows `R2-*`, `P1-*`.

## Gate 0 — the unmigrated source, measured before any work

| Property | Value |
|---|---|
| Artefacts (SUSHI, fresh run) | **134** resources: 16 profiles, 5 extensions, 4 ValueSets, 0 CodeSystems, 1 logical model, 1 CapabilityStatement, 6 SearchParameters, 122 instances, 1 generated ImplementationGuide |
| Declared in FSH | 264 declarations (166 `Instance:`, of which 44 are commented out — QA-5) |
| Narrative | 41 pages, 17 194 words, 4 images, in `implementation-guides/ImplementationGuide-2026.x-DE` |
| Other narrative trees | `ImplementationGuide-2025.x-DE` (49 pages), `ImplementationGuide-1.x` (49 pages) — prior releases, retained |
| Licence | undeclared in every machine-read location (DEC-1) |
| Dependency pins | 6 of 6 floating (`1.5.x`, `2026.0.x`, `3.0.x`, `6.1.x`) — injection risk **true** |
| Canonicals outside their id | **21** predicted — exactly the number the `special-url` list now carries |
| QA baseline | reported `None`; one was found later (QA-1) |
| Rendered guide | Simplifier guide `MII-Modul-MolekulargenetischerBefundbericht-v2026-DE` — **no published version exists**, only a preview at `?version=current`, so no read-only pin could be recorded |

## Identity — every field, with the source it came from

Carried over **unchanged** wherever the source and the template disagreed; the template's patterns are what a *new* module gets, and changing a published canonical breaks every consumer.

| Field | Value in the migrated module | Source | Template would have said |
|---|---|---|---|
| `id` | `mii-ig-molgen-de-v2026` | source `sushi-config.yaml` | `mii-ig-molgen` |
| `canonical` | `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen` | source `sushi-config.yaml` | `…/fhir/modul-molgen` |
| `packageId` | `de.medizininformatikinitiative.kerndatensatz.molgen` | source, confirmed by `package.json` | same |
| `name` | `MII_IG_MolGen_DE` | source | `MII_IG_MolGen` |
| `title` | `MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht` | source (German, as published) | `MII Implementation Guide …` |
| `version` | `2026.0.4` | source, confirmed by `package.json` and the IG resource | — |
| `publisher` | `Medizininformatik Initiative` | `input/fsh/rulesets/publisher.fsh` (artefact level) | `NUM-DIZ` |
| `releaseLabel` | `ci-build` | source — **TODO:REVIEW**, `Release` is expected for a published release | `Release` |
| `copyrightYear` | `2021+` (config) / `2022+` (page) | both from the source — DEC-3 | — |
| `license` | **unset** | nothing to carry — DEC-1 | `CC-BY-4.0` |
| `topic` | NCI `C17457` "Molecular Genetics" | verified against the NCI EVS REST API, 2026-08-28, exact term match | placeholder |
| dependencies | the source's six, each resolved to the version SUSHI actually pulled at the source baseline (`3.0.0`, `2026.0.0`, `1.5.4`, `2026.0.1`, `2026.0.1`, `6.1.0`), plus `hl7.fhir.uv.crmi 2.0.0` (template machinery) and `hl7.fhir.uv.extensions.r4 5.3.0` (pinned against auto-injection) | x-ranges are rejected by M7; the resolution freezes the measured state rather than bumping anything | its own pinned set, incl. THO 7.3.0 |

## Content map

The full page-by-page mapping is `migration-log/page-map.tsv` (43 rows: 41 pages + 2 retired trees), rendered walkably in `migration-log/comparison-table.md`. Summary of where the 41 source pages went:

| Target | Pages | Kind |
|---|---|---|
| 15 per-profile intro notes | 15 | rendered on top of the generated artifact page for that profile |
| `profiles.md` | 8 | the profile-inheritance table and seven family overviews, as h3 sections |
| `implementer-guidance.md` | 4 | cross-module context, references, and the two upstream CG profiles this module does not profile |
| `guidance.md` | 3 | scope in/out and modelling rationale, the use-case scenarios, the use-case overview |
| `value-sets.md` | 4 | the whole terminology cluster (the Code Systems page was removed: the module defines none) |
| `index.md`, `changes.md`, `uml-diagrams.md`, `logical-models.md`, `capability-statements.md`, `extensions.md` | 6 | one page each |
| `qualitaetsbericht.md` | 1 | **the only page created beyond the template's fixed set** |
| RETIRED | 2 trees | `ImplementationGuide-2025.x-DE`, `ImplementationGuide-1.x` — retained as history |

**Directives:** 731 Simplifier/FQL directives were resolved, **0 unresolved**. 38 `pagelink`, 15 artefact links, 2 external links, 8 render-to-artefact, 12 render-to-external, 1 image, 1 branch-pinned GitHub hotlink copied into `input/images/`; 17 `<tabs>`, 11 `{{tree}}` and 30 FQL metadata blocks **dropped**, because the generated artifact page renders exactly those views itself — the artifact-page-with-intro pattern. Of the 51 `{{json}}` directives, 24 rendered the profile's own JSON and were dropped for the same reason; the other **27 pointed at example instances**, and dropping those left captions pointing at nothing, so each affected intro note now carries a marked *Examples* section listing them as links, in source order, identically in both languages (FIX-5). One source typo was resolved with a recorded reason and marked in the rendered page (`mii-vs-molgen-verwandtsverhaeltnis` → `…verwandtschaftsverhaeltnis`, exactly one candidate).

**Pages the template contributes** that have no source page: `security-and-privacy`, `metadata`, `version-history`, `translationinfo`, `downloads`, `examples`, `search-parameters`, `ImplementationGuide-mii-ig-molgen-de-v2026`, and the generated `artifacts`/`toc`. **Pages removed:** `code-systems` and `operations` (M9: 0 built artefacts of that type), `researcher-guidance` (no source content routes to it), `rendering-artifacts` (M8: the scaffold's demonstration page, with all six of its wiring points).

## Verification

**128 IDENTISCH · 70 DIVERGIERT · 50 NICHT PRÜFBAR** (`migration-log/verification.md`, `verification-findings.tsv`). The 70 divergences, every one accounted for:

| Count | Check | What it is | Where it is handled |
|---|---|---|---|
| 42 | C4, C7 | the German-source / English-default language inversion | QA-2 — false positive, re-measured three ways |
| 6 | C1 | the six renamed example ids | DEC-2 / FIX-3 |
| 6 | F2 | the source's x-ranges vs the concrete versions they resolve to | Identity table — M7 rejects x-ranges |
| 4 | R2 | quoted text on the quality-report page, and the publisher's own search page | QA-6 — false positive |
| 4 | L2 | run-log steps that never ran because they are shape-B only (goFSH, guide harvest) | expected for shape A |
| 4 | L3 | the recorded identity contradictions, read back from the log | DEC-1, DEC-3 |
| 2 | F1 | licence and publisher | DEC-1, DEC-3 |
| 1 | F3 | no licence declared | DEC-1 |
| 1 | P1 | the URL-referenced template moved 1.3.2 → 1.3.3 mid-run | QA-6 |

The 50 NICHT PRÜFBAR rows are checks that could not run: mostly C4 rows needing a human read, plus `R1` (no rendered source guide exists to compare against — the Simplifier guide has no published version, only a preview), `C5` and `R4` (the checker's reference tables need re-measuring at template tag v0.13.0), and the shape-B log steps. None is a pass; each is a checkbox under *Sign-off*.

## Sign-off

Paste of `migration-log/qa-checklist.md` (GENERATED — regenerate, do not retype), plus the report-authored items:

**Gate A — identity** (module maintainer, with TF-KDS)
- [ ] **DEC-1** licence decided, and `sushi-config.yaml`, a `LICENSE` file and `index.md` made to agree — **blocks publication**
- [ ] **DEC-2** the six renamed example ids confirmed, and the mapping added to the changelog — **blocks publication**
- [ ] **DEC-3** publisher spelling and copyright year decided
- [ ] **DEC-4** the two CI systems reconciled and `fsh-generated/` un-half-tracked — **blocks a clean release**
- [ ] `releaseLabel: ci-build` confirmed or changed to `Release`
- [ ] the artefact set confirmed complete: 134 resources, canonical-URL and id diffs against the source empty apart from the six of DEC-2

**Gate B — narrative** (the module's clinical and technical authors)
- [ ] **REV-1** the 21 re-routed page-map rows confirmed against `page-map.generated.tsv`
- [ ] **REV-2** the `profiles.md` size-gate KEEP verdict confirmed; repeated sub-headings decided
- [ ] **REV-3** Security and Privacy stage 3 written
- [ ] the two retired guide trees confirmed as containing nothing still needed (QA-3)
- [ ] **QA-4** the two STU2 `meta.profile` canonicals corrected or accepted

**Gate C — language** (a bilingual domain reviewer)
- [ ] **REV-4** all 26 machine-translated files reviewed and their markers removed
- [ ] the inline `TODO:REVIEW` comments the translators left resolved

**Gate D — release governance** (TF-KDS / AG IOP / NSG)
- [ ] Gates A–C signed
- [ ] the retirement of `implementation-guides/` decided (QA-3)
- [ ] merge — **merging is what publishes**

## Protocol

Generated from `migration-log/run.log`. The run recorded **61 WARN and 5 ERROR lines**; every one is either resolved in the tree or carried above as a queue item. Read them back with `grep -E '  (WARN |ERROR)  ' migration-log/run.log`.

The five ERROR lines, so none is mistaken for an open failure: **two** are the `simplifier-discover` chain finding no published guide version (the finding of Gate 0, carried as a stated limitation); **one** is the first `rsync` of the template exiting 23 on `.claude/skills` — the module's real skills directory could not be replaced by the template's symlink, which is correct, and the re-run with that path excluded exited 0; **one** is the first IG Publisher run failing on the tar name limit, which FIX-3 resolved; **one** is `prepost-delta` exiting non-zero on the regressions, two of which were then cleared and the third carried as QA-3. Nothing in this report claims what the log does not show.

| Step | What ran | Measured outcome |
|---|---|---|
| 0 | preconditions, placeholder census | shape A, hybrid state; `{{` hits only in skill sources and the Simplifier trees |
| 1 | Gate-0 analysis, source SUSHI baseline, guide discovery, source inventory | 134 resources, 0 errors; guide found but **no published version** |
| 2.1–2.2 | identity read and claimed, 22 claims across 4 tiers | 3 `identity-contradiction:` lines, all reported not resolved |
| 5.2 | template vendored (v0.13.0, `288e2c5`), FSH scaffold merged, 19 placeholders substituted | 2 files skipped whole, 4 appended per definition, 14 copied; **one id-vs-slug defect (P5 class) found and fixed before the build** |
| 5.3 | transfer acceptance | `comm -3` shows only the 7 logged scaffold additions; canonical and id diffs **empty both ways** |
| 5.4–5.4d | FQL scan, page routing, narrative transform, M9/M11 decisions, derived scan | 731 directives mapped, 0 unknown; 41 of 41 pages routed; 2 DERIVED markers, 0 findings |
| 5.5 | page-title catalogue | 20 titles, 0 untranslated, 4 stale units dropped |
| 5.6 | three IG Publisher runs | 137 → 68 errors; broken links 20 → 0; URL mismatches 42 → 0; build errors 20 → 0 |
| 7 | postflight, pre/post delta | 26 unchanged, 1 improved, 5 expected-change, 1 regression (QA-3) |
| 11 | verification and its re-measurements | 128 / 70 / 50; 42 divergences re-measured as false positives |

## Next step

Open the pull request against `main` (the repository's own convention: every merged PR uses it), let CI build the branch preview, and take the preview into Gate A. **Nothing is published by this branch** — merging to `main` is what publishes, which is the Gate-D decision.
