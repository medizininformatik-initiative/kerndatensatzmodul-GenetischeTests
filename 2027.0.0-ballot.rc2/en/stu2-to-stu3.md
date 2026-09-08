# Migration STU2 to STU3 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Guidance**](guidance.md)
* **Migration STU2 to STU3**

## Migration STU2 to STU3

### Migration from Clinical Genomics STU2 to STU3

Version 2026.0.0 of this module moved from [Clinical Genomics Reporting STU2](http://hl7.org/fhir/uv/genomics-reporting/STU2/) to [STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/). This page states what changed and how to move existing data across. It addresses sites that already produce data against the 2025 line.

**There are no StructureMaps here, deliberately.** Data integration at a Data Integration Center runs on its own ETL, and a FHIR mapping engine is rarely part of it. A StructureMap would describe a transformation most sites could not execute. What follows is the mapping stated declaratively — implementable in whatever technology your pipeline already uses.

#### Profiles: what became of what

| | | |
| :--- | :--- | :--- |
| UntersuchteRegion | `…/StructureDefinition/region-studied` | **removed**— see GenomicStudy below |
| ErgebnisZusammenfassung | own Observation | **removed**— folded into`DiagnosticReport.conclusionCode` |
| Variante | `…/variant` | `…/variant`— unchanged base, components renamed |
| Mikrosatelliteninstabilität | directly from`Observation` | via`MII_PR_MolGen_MolekularerBiomarker` |
| Mutationslast | directly from`Observation` | via`MII_PR_MolGen_MolekularerBiomarker` |
| MolekulareKonsequenz | — | **new**, from`…/molecular-consequence` |
| GenomicStudy | — | **new**, from`…/genomic-study`(a`Procedure`) |
| GenomicStudyAnalysis | — | **new**, from`…/genomic-study-analysis`(a`Procedure`) |

Note the two levels on the biomarkers: MSI and Mutationslast do **not** derive from the STU3 `molecular-biomarker` directly. They derive from this module's `MII_PR_MolGen_MolekularerBiomarker`, and that is what derives from STU3. The practical consequence is the same — see the category requirement below — but a profile binding written against the STU3 canonical will not match.

#### Components in Variante

Slice names changed; in an instance you identify a component by its `code`, so most of this is invisible in the data:

| | | |
| :--- | :--- | :--- |
| DNA change (c.HGVS) | `48004-6` | unchanged |
| Transcript reference | `51958-7` | unchanged |
| Amino acid change | `48005-3` | unchanged |
| Amino acid change type | `48006-1` | **removed from the profile** |
| Molecular consequence | various | **moved**to a separate MolekulareKonsequenz observation |

Three slices gained a `representative-` prefix — `coding-hgvs`, `transcript-ref-seq` and `protein-hgvs`. This matters only where you reference slices by name, for example in your own derived profiles or in FHIRPath; instance data is unaffected.

#### The added category on MSI and Mutationslast

Because both now sit under a biomarker profile, they require a second `category` alongside `laboratory`:

```
"category": [
  { "coding": [{ "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                 "code": "laboratory", "display": "Laboratory" }] },
  { "coding": [{ "system": "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
                 "code": "biomarker-category",
                 "display": "A characterization of a given biomarker observation." }] }
]

```

Note the second system: the biomarker category comes from the Clinical Genomics `tbd-codes-cs`, **not** from `observation-category`. STU3 requires both slices at `1..1`, so an instance carrying only `laboratory` fails validation. This is the single most common failure when moving 2025-line data forward.

#### Path 1 — UntersuchteRegion becomes GenomicStudy

STU2 recorded which regions were examined as components on one Observation. STU3 replaces this with a `Procedure` pair: a GenomicStudy that orchestrates, and one or more GenomicStudyAnalysis steps carrying the detail.

**Before:**

```
{
  "resourceType": "Observation",
  "meta": { "profile": ["…/mii-pr-molgen-untersuchte-region"] },
  "component": [{
    "code": { "coding": [{ "code": "48018-6" }] },
    "valueCodeableConcept": { "coding": [{ "code": "HGNC:1097", "display": "BRAF" }] }
  }]
}

```

**After** — the studied region moves into the `genomic-study-analysis-regions` extension of an analysis step:

```
{
  "resourceType": "Procedure",
  "meta": { "profile": ["…/mii-pr-molgen-genomic-study-analysis"] },
  "extension": [{
    "url": ".../genomic-study-analysis-regions",
    "extension": [{
      "url": "studied",
      "valueCodeableConcept": { "coding": [{ "code": "HGNC:1097", "display": "BRAF" }] }
    }]
  }]
}

```

The minimum viable migration is exactly this: one analysis step per former UntersuchteRegion, carrying the same gene codes. Everything else GenomicStudyAnalysis offers — sequencer and pipeline as `Device`, method type, read depth and coverage, specimen, input and output files — is optional, and worth adding only where your source system actually holds it.

Note that `regions-studied` is what lets a query tell **not found** from **not looked for**. If your STU2 data recorded examined regions, carry them across; dropping them loses that distinction.

#### Path 2 — ErgebnisZusammenfassung becomes conclusionCode

**Before:** a separate Observation referenced from `DiagnosticReport.result`.

```
{ "resourceType": "DiagnosticReport",
  "result": [{ "reference": "Observation/ergebnis-zusammenfassung-1" }] }

{ "resourceType": "Observation", "id": "ergebnis-zusammenfassung-1",
  "valueCodeableConcept": { "coding": [{ "code": "LA6576-8", "display": "Positive" }] } }

```

**After:** the code moves onto the report itself and the Observation disappears.

```
{ "resourceType": "DiagnosticReport",
  "conclusionCode": [{ "coding": [{ "code": "LA6576-8", "display": "Positive" }] }] }

```

Remember to remove the now-dangling `result` entry, not just to add the `conclusionCode`.

#### Path 3 — renamed slices in Variante

Only relevant if you reference slice names. In instance data nothing changes, because components are identified by `code`:

| | |
| :--- | :--- |
| `coding-hgvs` | `representative-coding-hgvs` |
| `transcript-ref-seq` | `representative-transcript-ref-seq` |
| `protein-hgvs` | `representative-protein-hgvs` |

#### Checklist

**Before you start**

* Pull the current package and read the [Changelog](changes.md) for the version you are moving to.
* Establish which profiles you actually produce. Most sites use a fraction of the module.
* Find every instance carrying `untersuchte-region` or `ergebnis-zusammenfassung` in `meta.profile` — those are the two that cannot be migrated mechanically.

**While migrating**

* Add the second `category` to MSI and Mutationslast instances.
* Split each UntersuchteRegion into a GenomicStudy plus at least one GenomicStudyAnalysis, preserving the studied regions.
* Move each ErgebnisZusammenfassung value into `DiagnosticReport.conclusionCode` and delete the Observation and its `result` reference.
* Move any molecular consequence out of Variante into its own MolekulareKonsequenz.

**Afterwards**

* Validate against the published package; the profiles this module declares and the expectation attached to each are on the [Capability Statements](capability-statements.md) page.
* Search your output for remaining STU2 canonicals — `untersuchte-region`, `ergebnis-zusammenfassung`, `region-studied` — before declaring the migration done.

