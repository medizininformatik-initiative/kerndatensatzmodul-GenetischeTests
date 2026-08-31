# Pre/post delta — the two ig-stats measurements compared

| Side | Measurement |
|---|---|
| pre | preflight-analysis.json (molgen-source, 79eaf41, 2026-08-28T13:14:46Z) |
| post | postflight-analysis.json (molgen-target, e0f0dcd, 2026-08-28T14:27:42Z) |

Verdicts: **unchanged** 26 · **improved** 1 · **expected-change** 5 · **REGRESSION** 1 · **not-measurable** 0.

## ⛔ Regressions — properties that got WORSE

Each one blocks the migration until it is fixed or explained; an explanation belongs in the migration report, not in a merge commit.

- **`narrative_sources.dual_source`**: `false` → `true` — the migration introduced a SECOND narrative source tree -- two trees is how the wrong one gets edited

## Identity

| Property | Pre | Post | Verdict | Why |
|---|---|---|---|---|
| `identity.id` | mii-ig-molgen-de-v2026 | mii-ig-molgen-de-v2026 | unchanged |  |
| `identity.canonical` | https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen | https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen | unchanged |  |
| `identity.packageId` | de.medizininformatikinitiative.kerndatensatz.molgen | de.medizininformatikinitiative.kerndatensatz.molgen | unchanged |  |
| `identity.name` | MII_IG_MolGen_DE | MII_IG_MolGen_DE | unchanged |  |
| `identity.version` | 2026.0.4 | 2026.0.4 | unchanged |  |
| `identity.fhirVersion` | 4.0.1 | 4.0.1 | unchanged |  |
| `identity.calver` | true | true | unchanged |  |
| `identity.publisher` | Medizininformatik-Initiative | Medizininformatik Initiative | expected-change | descriptive metadata, not machine identity -- confirm the change is deliberate in the report |
| `identity.status` | active | active | unchanged |  |
| `identity.title` | MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht | MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht | unchanged |  |

## Preflight flags

| Property | Pre | Post | Verdict | Why |
|---|---|---|---|---|
| `licence.contradictory` | false | false | unchanged |  |
| `dependency_health.injection_risk` | true | false | improved | the dependency-injection risk the source carried is cleared |
| `narrative_sources.dual_source` | false | true | **REGRESSION** | the migration introduced a SECOND narrative source tree -- two trees is how the wrong one gets edited |

## Artefact counts

| Property | Pre | Post | Verdict | Why |
|---|---|---|---|---|
| `mode` | static | static | unchanged |  |
| `artifacts.profiles` | 16 | 16 | unchanged |  |
| `artifacts.extensions` | 5 | 5 | unchanged |  |
| `artifacts.valuesets` | 4 | 4 | unchanged |  |
| `artifacts.codesystems` | 0 | 0 | unchanged |  |
| `artifacts.logicals` | 1 | 1 | unchanged |  |
| `artifacts.capabilitystatements` | 1 | 1 | unchanged |  |
| `artifacts.questionnaires` | 0 | 0 | unchanged |  |
| `artifacts.searchparameters` | 6 | 6 | unchanged |  |
| `artifacts.operations` | 0 | 0 | unchanged |  |
| `artifacts.examples` | 159 | 159 | unchanged |  |
| `artifacts.rulesets` | 14 | 58 | expected-change | the count rose by 44 -- artefacts added by the migration; the report names what and why |
| `artifacts.invariants` | 0 | 0 | unchanged |  |
| `artifacts.mappings` | 16 | 16 | unchanged |  |
| `artifacts.other_total` | 0 | 0 | unchanged |  |
| `artifacts.total` | 192 | 192 | unchanged |  |

## Narrative pages

| Property | Pre | Post | Verdict | Why |
|---|---|---|---|---|
| `narrative.pages` | 41 | 60 | expected-change | narrative routing (spec 9d/9e) moves pages between pagecontent, intro-notes and translations -- conservation of the CONTENT is checked by the verifier against page-map.tsv |
| `narrative.intro_note_pages` | 0 | 15 | expected-change | narrative routing (spec 9d/9e) moves pages between pagecontent, intro-notes and translations -- conservation of the CONTENT is checked by the verifier against page-map.tsv |
| `narrative.translation_pages` | 0 | 19 | expected-change | narrative routing (spec 9d/9e) moves pages between pagecontent, intro-notes and translations -- conservation of the CONTENT is checked by the verifier against page-map.tsv |

## Directives

| Property | Pre | Post | Verdict | Why |
|---|---|---|---|---|
| `directives.total` | 388 | 388 | unchanged |  |

