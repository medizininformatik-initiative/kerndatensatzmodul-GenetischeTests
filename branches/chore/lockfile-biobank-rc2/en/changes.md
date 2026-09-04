# Changelog - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* **Changelog**

## Changelog

### Changelog

This page records the changes between the released versions of the **Molekulargenetischer Befundbericht** module, newest version first. It follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the KDS calendar versioning scheme described on the [Versioning](version-history.md) page.

Each version gets its own section with the release date and its changes. These categories are available for them:

* **Added** — new profiles, extensions, value sets, search parameters, pages.
* **Changed** — modified constraints, bindings, guidance or documentation.
* **Deprecated** — artifacts that still exist but should no longer be used.
* **Removed** — artifacts that were withdrawn.
* **Fixed** — corrections of defects.
* **Security** — changes with a security or data-protection impact.

Leave out the categories with nothing to report. Where a change is driven by an issue or a pull request, link it.

The version sections group their entries **by topic** — by the profile or area affected — rather than by these categories. The template allows either, and for a FHIR module the topical axis carries further: a renamed component is **Added** and **Removed** at once, and someone asking what changed about Variante finds it in one place.

**Security is the exception.** Changes with a security or data-protection impact always get their own block under that name — they have to be findable without reading through topical sections. There have been none so far.

##### Breaking changes MUST be reported and explained

A version section that contains a breaking change is not complete until it answers, explicitly and in this changelog:

* **What exactly changed** between the two versions — the artifact, the element, the old and the new constraint (not just "profile X was revised").
* **What it means for existing data:** does data that conformed to the previous version still validate against the new one? If not, which resources and elements are affected, and how does the failure show up?
* **What implementers should do:** the authors' recommendation for migrating existing data to the new version — transformation steps, default values, re-coding guidance — or an explicit statement that no migration path is provided and why.

**What counts as breaking** — treat a change as breaking if it does any of the following, even when it looks small: tightens a cardinality (`0..*` → `1..1`), raises a binding strength (example → required), removes codes from a required value set, removes or renames an element or a slice, narrows a type, adds an invariant or a must-support obligation, or changes a canonical URL. When in doubt, report it as breaking.

**Breaking for whom:** state both perspectives — *stored data* (instances valid against the old version) and *implementations* (clients and servers built against it; a removed search parameter breaks implementations while every stored instance stays valid).

**The version number will not warn anyone.** The KDS calendar versioning scheme (`YYYY.n.n`) carries no major-version signal the way SemVer does — this changelog section is the *only* warning a reader gets.

**Link the technical delta.** From the second formal publication on, enable the IG Publisher's version comparison (`version-comparison` in `sushi-config.yaml` — see the [ Versioning](version-history.md) page for the setup and its prerequisites); it publishes a machine-generated comparison at `comparison-v<previous>/index.html`. Link it from the version section, so the prose explanation and the technical diff sit side by side.

Mark such entries clearly (for example, prefix them with **BREAKING:**) so a reader scanning the section cannot miss them.

-------

#### Version 2027.0.0-ballot.rc2

**Date:** 2026-09-04 · **Release candidate**

The first candidate was formally published; this one closes what that exposed.

##### No breaking changes

Checked rather than assumed, because the CalVer number carries no warning of its own.

The SNOMED CT pin moves a full year, from `20250701` to `20260701`, which is the one change here that could have removed or inactivated codes. All **49** distinct SNOMED codes this module uses were looked up against both versions on the MII terminology server: **none differs** — same existence, same display. Instances valid against rc1 remain valid against rc2.

The five newly pinned systems constrain future expansions but change nothing today: each was pinned to the version the server already resolved to by default. The remaining changes are documentation and release automation.

##### Terminology

* **Every externally versioned code system is now pinned**, not just SNOMED CT. The expansion manifest bound one system out of sixteen candidates, while its own documentation promised that an expansion "produces the same codes today, at release time, and three years later". LOINC alone carries 286 codings here and was unpinned.


  Every version was read from the MII terminology server rather than guessed. HGVS, ATC and Orphanet are not pinned because the server returns no version for them; UCUM is unversioned by design.

##### Documentation

* **Migration from STU2 to STU3** is now a page in the guide. It consolidates two documents that lay unpublished in the repository root and corrects three errors found while checking them against the built artifacts — most importantly the second `category` required on Mikrosatelliteninstabilität and Mutationslast, which was given with the wrong code and the wrong system, and which is the most common validation failure when moving 2025-line data forward.
* That guidance carries **no StructureMaps**, deliberately: data integration at a Data Integration Center runs on its own ETL and rarely includes a FHIR mapping engine, so the mappings are stated declaratively instead.

##### Release automation

* Five defects in the shared module template were fixed here, each of which only bites a module doing something for the first time: the release guard treated documented `` placeholders in comments as an un-instantiated template and silently skipped the entire release path; the first formal publication created neither `package-registry.json` nor the two RSS feeds its own `publish-setup.json` declares; the `-go-publish` invocation did not receive the terminology allowlist the build invocation gets; and the registry validator rejected the `"<sequence> <Status>"` edition name that any non-release publication receives.

#### Version 2027.0.0-ballot.rc1

**Date:** 2026-09-02 · **Release candidate**

First release candidate built on the MII KDS module template. The guide is now built and rendered by the HL7 IG Publisher instead of Simplifier, in English with a German translation.

* **Migrated onto the MII KDS module template** (v0.13.0), which references the shared MII IG template. All 41 pages of the previous Simplifier guide were routed into the template page set: 15 became per-profile intro notes rendered on top of the generated artifact pages, the rest merged into the agreed pages. Identity, canonical URLs and the artifact set are unchanged.
* **Licence declared:** CC BY 4.0. The previous releases named no licence.
* **Dependencies:** `kerndatensatz.meta` and `kerndatensatz.base` to the 2027 ballot release candidates, `de.basisprofil.r4` to 1.6.0, `hl7.terminology.r4` from 6.1.0 to 7.3.0, and `kerndatensatz.biobank` from 2026.0.1 to `2027.0.0-ballot.rc2`. The biobank module's own `2027.0.0-ballot.rc1` could not be used: its `SpecimenCore` profile and the `Specimen` derived from it shipped without a snapshot, which this module's build rejects. `rc2` carries snapshots for all 24 of its StructureDefinitions, and the canonicals are unchanged, so the six `SpecimenCore` examples here needed no adjustment.
* **CapabilityStatement corrected:** the module's own six search parameters are now declared (they were missing entirely), and a wrong canonical for the FamilyMemberHistory `reason-code` parameter was fixed.
* **Search parameters** are listed on their own page, derived from the built artifacts rather than maintained by hand.
* **New example:** an FFPE tumour tissue Specimen for the TSO500 panel study, which two GenomicStudyAnalysis examples referenced but which never existed.
* **Six DiagnosticReport example ids shortened** so the package can be built at all — the previous ids produced a package path over the tar format's 100-byte limit. Old → new: `mii-exa-molgen-molekulargenetischer-befundbericht-*` → `mii-exa-molgen-befundbericht-*`.

##### Conformance expectations

* **Three profiles are now `MAY` instead of `SHALL`:** `genotyp`, and the two Clinical Genomics STU3 profiles `haplotype` and `sequence-phase-relationship`. All three state something about alleles as a whole rather than about a single finding, and many laboratories never derive them. `sequence-phase-relationship` was previously not declared at all, although the implementer page presented it as used; `haplotype` stood at `SHALL`, obliging implementers to support something the guide shows no example of.
* **`MII_PR_MolGen_MolekularerBiomarker` is now declared** (`SHALL`). It is the parent of Mikrosatelliteninstabilität and Mutationslast, both of which were required while their base profile went unmentioned.
* **`DiagnosticReport.result:biomarker` is narrowed** to that profile. It previously inherited the STU3 slice and accepted any `molecular-biomarker`.
* **Three supportedProfile entries pointed at canonicals that do not exist** — `molekulare-konsequenz`, `genomic-study` and `genomic-study-analysis` were written without the `mii-pr-molgen-` prefix that those three profiles actually carry. A server could not have resolved them. The canonicals themselves are unchanged: they are what the published 2026.0.4 package ships.

##### Documentation

* **The upstream relationship to Clinical Genomics STU3 is stated properly.** The implementer page documented two profiles; the real dependency is ten profiles inheriting directly, two indirectly, one extension, twelve extensions used, three ValueSets and two code systems.
* **The CapabilityStatement page carries a profile/expectation table.** The IG Publisher renders supported profiles as a bare list of links and drops the `SHALL`/`MAY` expectation, so without this table the expectations are invisible in the rendered guide.
* **The search parameters are stated once.** The numbered lists repeated on all 14 profile intro pages were removed (3373 lines); they duplicated the CapabilityStatement, had drifted from it, and named the wrong module.
* **Corrected element names** that do not exist in STU3: `CytogenicLocation` → `cytogenetic-location`, `RefSequenceAssembly` → `reference-sequence-assembly`, `associated-phenotype` → `predicted-phenotype`. A mapping to `amino-acid-change-type` was dropped: STU3 has no such component on `variant`, and the dataset element moved to `molecular-consequence`.

##### Example corrections

* `Task.basedOn` in two examples referenced `servicerequest/example` — a placeholder with a lowercase resource type, resolving to nothing. Now the BRAF request.
* Two examples claimed the STU2 profiles `msi` and `tmb`, which STU3 folded into `molecular-biomarker`.
* Two gene ids in the TSO500 panel were wrong: `HGNC:3942` (which is MTOR) labelled FGFR2, and `HGNC:3943` (which does not exist) labelled FGFR3. Correct are `HGNC:3689` and `HGNC:3690`.
* A Practitioner reference in the comprehensive WES bundle pointed at a resource that exists nowhere.
* **`known_errors.txt` was added.** Of the validation errors, the large majority are terminology-server limitations rather than defects of this module; the file states which is which, and records the one error accepted deliberately (the FGFR2::DBP fusion coding, where LOINC 95123-6 is narrative-scaled but the profile binds the slice to CodeableConcept).

#### Version 2026.0.4

**Date:** 2026-01-02

##### Package build and version consistency

**Problem**: the v2026.0.3 package on Simplifier contained unwanted text files (FSH source files, Markdown, etc.)

**Fix**:

* **Version consistency**: the CapabilityStatement and all SearchParameters now use the central `Version` ruleset
* **CapabilityStatement**: the hard-coded version `2026.0.0-alpha` was replaced by `* insert Version`
* **SearchParameters**: `* insert Version` added to all 6 active SearchParameter instances
* **SupportProfile URLs**: all canonical URLs in the CapabilityStatement updated to `|2026.0.4`

**Technical details**:

* The local package build contains only JSON resources (correct)
* The Simplifier pipeline must use the correct bake workflow

-------

#### Version 2026.0.3

##### Maintenance release

**Dependency updates**

* **kerndatensatz.biobank**: updated to `2026.0.x` (flexible versioning)

**Current dependencies**

| | |
| :--- | :--- |
| `hl7.fhir.uv.genomics-reporting` | 3.0.x |
| `de.medizininformatikinitiative.kerndatensatz.meta` | 2026.0.x |
| `de.medizininformatikinitiative.kerndatensatz.base` | 2026.0.x |
| `de.medizininformatikinitiative.kerndatensatz.biobank` | 2026.0.x |
| `de.basisprofil.r4` | 1.5.x |
| `hl7.terminology.r4` | 6.1.x |

**Package build**

* **ImplementationGuide filtering**: package.bake.yaml improved, to exclude ImplementationGuide resources from the FHIR package

-------

#### Version 2026.0.2

##### Hotfix: package build error

**Technical fix**

* **Package build**: v2026.0.1 was published with a faulty package build 
* Problem: the package contained the entire repository (377 files, 2.1 MB) instead of only the FHIR resources
* Cause: use of `npm pack` instead of `fhir bake` to create the package
* Effect: SUSHI could not load any resources from the package (0 resources instead of 36)
* Fix: correct build process using `fhir bake package.bake.yaml`
* Result: the package is now structured correctly (140 files, 381 KB)
 
* **Documentation**: build-package.md updated with the correct `fhir bake` workflow 
* Explicit verification steps for the package structure
* Warnings about incorrect build methods
 

**Note**: v2026.0.1 remains available on Simplifier but should not be used. All dependent modules should update to v2026.0.2.

-------

#### Version 2026.0.1

##### Hotfix: Familienanamnese canonical URL

**Breaking change fix**

* **Familienanamnese profile**: the canonical URL was restored to its original version: 
* Canonical URL: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese`
* The URL was changed inadvertently in v2026.0.0, which was a breaking change
* Restoring the original URL ensures backward compatibility
* Affected dependent modules: Seltene Erkrankungen (SE)
* Commit: 065fabf
 

**Note**: the URL `familienanamnese` does not formally follow the current naming conventions (`mii-pr-molgen-familienanamnese` would be expected), but it is being kept in order to avoid breaking changes.

-------

#### Version 2026.0.0

##### Changes after balloting

###### Completion and correction of the examples

###### Date stamps for Observations (HDB-762, HDB-763)

* `effective[x]` and `issued` added as MS to all Observation profiles

###### ServiceRequest.requester (HDB-768)

*  

| | | |
| :--- | :--- | :--- |
| Reference types restricted to: Practitioner | PractitionerRole | Organization |

 

###### Terminology documentation (HDB-749)

Consolidation of 18 terminology pages into 4 clear pages, organized by origin:

* **MII ValueSets**: our 4 own ValueSets (Familiäre Linie, Family Member SNOMED, Verwandtschaftsgrad, Verwandtschaftsverhältnis)
* **ClinicalGenomics**: all Clinical Genomics STU3 ValueSets + CodeSystems
* **Terminologies**: external standards (LOINC, SNOMED CT, HGNC, HGVS, etc.) with licensing information
* **Index**: overview with the selection criteria for choosing a ValueSet

Individual pages removed: ClinVar-Evidence-Level, Condition-Inheritance-Pattern, DNAChangeType, Evidence-Level-Examples, Functional-Effect, HGNC, HGVS, HighLowcodes, MolecularConsequence, PharmGKB-Evidence-Level, TBD-Codes, Variant-Confidence-Status, VariantInheritance

###### URL namespace migration

* `example.org` URLs replaced by the MII FHIR namespace (`https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/`)

###### Molecular biomarker profile

* **New profile**: `MII_PR_MolGen_MolekularerBiomarker` as the common parent profile for: 
* Mikrosatelliteninstabilität (now inherits from MolekularerBiomarker)
* Mutationslast (now inherits from MolekularerBiomarker)
 
* Based on the Clinical Genomics STU3 MolecularBiomarker profile

###### German translations (de-DE)

* **Must Support elements**: all MS elements in all profiles given German translations

###### Configuration

* `language: de` added in sushi-config.yaml (issue #34)

###### CI/CD improvements

* **Automatic releases**: GitHub Actions creates draft releases automatically on a tag push
* **Zulip notification**: automatic notification in the MII Kerndatensatz stream when a release is published
* **FHIR package caching**: faster CI pipeline through caching of FHIR packages

###### Familienanamnese terminology bindings

* Relationship bindings relaxed: `required` → `extensible` for SNOMED CT and v3-RoleCode
* Enables use in the Seltene Erkrankungen (SE) module with specific types of relationship

###### Terminology server requirements

The following CodeSystem must be imported on the terminology server:

* **URL:** `http://terminology.hl7.org/CodeSystem/variant-confidence-status-cs`
* **Source:** https://hl7.org/fhir/uv/genomics-reporting/STU3/CodeSystem-variant-confidence-status-cs.json
* **Note:** the canonical URL changed from STU2 (`http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/variant-confidence-status-cs`) to STU3

##### Structural changes to the Implementation Guide navigation

###### IG structure version 2025.x (flat structure)

```
MII IG Modul Molekulargenetischer Befundbericht/
├── IG MII KDS Modul Molekulargenetischer Befundbericht
├── Beschreibung Modul Molekulargenetischer Befundbericht
├── Anwendungsfälle Informationsmodell
├── Beschreibung von Szenarien für die Anwendung der Module
├── Datensätze inkl. Beschreibungen
├── Kontext im Gesamtprojekt Bezüge zu anderen Modulen
├── Technische Implementierung/
│   ├── Technische Implementierung (leer)
│   ├── FHIR Profile
│   ├── Anforderung-ServiceRequest
│   ├── Befundbericht-DiagnosticReport
│   ├── DiagnostischeImplikation-Observation
│   ├── TherapeutischeImplikation-Observation
│   ├── Variante-Observation
│   ├── ErgebnisZusammenfassung-Observation
│   ├── UntersuchteRegion-Observation
│   ├── Mikrosatelliteninstabilität-Observation
│   ├── Mutationslast-Observation
│   ├── Familienanamnese---FamilyMemberHistory
│   ├── Empfohlene Folgemaßnahme-Task
│   ├── Medikationsempfehlung-Task
│   ├── Polygener-Risiko-Score---RiskAssessment
│   ├── Genotyp---Observation
│   ├── Haplotype-Observation
│   ├── Sequence-Phase-Relationship---Observation
│   ├── CapabilityStatement
│   ├── Terminologien
│   ├── CodeSystems
│   ├── ValueSets
│   └── [Weitere einzelne Terminologie-Seiten]
├── UML
└── Referenzen

```

###### IG structure version 2026.x (hierarchical grouping by topic)

```
MII IG Modul Molekulargenetischer Befundbericht/
├── Hauptseite
├── Beschreibung Modul Molekulargenetischer Befundbericht
├── Anwendungsfälle / Informationsmodell/
│   ├── Index
│   ├── Basis des Informationsmodells  
│   ├── Profile-Relationships
│   └── Szenarien
├── Kontext im Gesamtprojekt Bezug zu anderen Modulen
├── Technische Implementierung/
│   ├── Index
│   ├── Workflow/
│   │   ├── Index
│   │   ├── Befundbericht-DiagnosticReport
│   │   ├── Anforderung-ServiceRequest
│   ├── Genetische Befunde/
│   │   ├── Index
│   │   ├── Variante-Observation
│   │   ├── Genotyp-Observation
│   │   ├── Haplotyp-Observation
│   │   └── Sequence-Phase-Relationship-Observation
│   ├── Genetische Implikationen/
│   │   ├── Index
│   │   ├── Molekulare Konsequenz-Observation 🆕
│   │   ├── Diagnostische Implikation-Observation
│   │   └── Therapeutische Implikation-Observation
│   ├── Molekulare Biomarker/
│   │   ├── Index
│   │   ├── Mikrosatelliteninstabilität-Observation
│   │   ├── Mutationslast-Observation
│   │   └── Polygener Risiko Score-Observation
│   ├── Therapieempfehlungen/
│   │   ├── Index
│   │   ├── EmpfohleneFolgemassnahme-Task
│   │   └── Medikationsempfehlung-Task
│   ├── Methodik/
│   │   ├── Index
│   │   ├── GenomicStudy-Procedure 🆕
│   │   └── GenomicStudyAnalysis-Procedure 🆕
│   ├── Familienanamnese/
│   │   ├── Index
│   │   ├── Familienanamnese---FamilyMemberHistory
│   │   └── Familienanamnese-Extensions 🆕
│   ├── CapabilityStatement
│   └── Terminologie/
│       ├── Index
│       ├── CodeSystems
│       └── ValueSets
│   
│   
├── Referenzen
├── Release Notes
└── Kommentierung v2026 🆕

```

###### Removed/replaced pages

* ❌ ErgebnisZusammenfassung-Observation → moved into DiagnosticReport.conclusion
* ❌ UntersuchteRegion-Observation → GenomicStudy/GenomicStudyAnalysis

###### New pages

* 🆕 Molekulare Konsequenz (split out of DiagnostischeImplikation)
* 🆕 GenomicStudy/GenomicStudyAnalysis (STU3)
* 🆕 Index pages for each category
* 🆕 Szenarien (concrete usage examples)
* 🆕 Kommentierung v2026

##### Technical changes

###### Migration to Clinical Genomics STU3

* Dependency on Clinical Genomics Reporting moved from STU2 to STU3 
* New MolecularBiomarker profile
* New Molekulare Konsequenz profile (downstream description of genetic changes)
* DiagnosticImplication 
* Sharpened profiling with a focus on disease risk; the plain description of the change moved out into the Molekulare Konsequenz profile
* `extension[genomic-artifact]` replaced with `extension[workflow-relatedArtifact]`
* component[functional-effect] moved into MolecularConsequence
 
* Ergebnis-Zusammenfassung 
* Profile deleted (reason: redundancy; the result can be represented via GenomicReport.conclusion/conclusionCode)
 
* Mikrosatelliteninstabilität 
* now inherits from the STU3 Molecular Biomarker profile
* `component[conclusion-string]` is dropped
 
* Molekulargenetischer Befundbericht now inherits from genomic-report instead of genomics-report 
* the [overall] slice is dropped
* the extensions for [genomics-artifact] and [genomics-file] are merged into [workflow-relatedArtifact]
* extension[genomics-risk-assessment] is now extension[genomic-risk-assessment]
* extension[region-studied] is dropped; metadata about the region studied is now represented via GenomicStudy/GenomicStudyAnalysis
 
* Mutationslast 
* now inherits from the new Molekularer Biomarker module
* `component[conclusion-string]` is therefore dropped
 
* Therapeutische Implikation 
* `component[prognosis]` is dropped **without a successor**. Checked against every STU3 profile: neither `therapeutic-implication` nor `diagnostic-implication`, `molecular-consequence` or the shared parent `implication` carries a prognosis slice. Anyone who used to set this value has nowhere to put it in STU3.
* `component[predicted-therapeutic-implication]` changed to `component[therapeutic-implication]`
 
* Untersuchte Region 
* the profile is dropped; information about location and instruments is coded via GenomicStudy/GenomicStudyAnalysis instead
 
* Variante 
* component[coding-hgvs] renamed to component[representative-coding-hgvs]
* component[transcript-ref-seq] renamed to component[representative-transcript-ref-seq]
* component[protein-hgvs] renamed to component[representative-protein-hgvs]
* component[amino-acid-change-type] deleted
* component[molecular-consequence] detached from Variante and moved into MolecularConsequence
 
* Examples adjusted accordingly (the old examples for Diagnostische Implikation correspond more closely to the new Molekulare Konsequenz profile)
* New folder structure in the GitHub repository
 
* Logical model (LogicalModel.fsh) 
* Element names cleaned up: hyphens removed and replaced by CamelCase (e.g. Krankengeschichte-Familie → KrankengeschichteFamilie)
* Special characters removed: Mikrosatelliteninstabilität → Mikrosatelliteninstabilitaet
* FHIR mappings updated accordingly for consistency
* All element names now follow the FHIR naming conventions (alphanumeric characters only)
 
* Profile correction (Anforderung.fsh) 
* Typo corrected: "gentischer" → "genetischer" in the profile ID and the InstanceOf references
* Correct canonical URL: mii-pr-molgen-anforderung-genetischer-test
 
* Familienanamnese (FamilyMemberHistory.fsh) 
* Terminology bindings aligned with the Diagnose module 2025.0.1
* ValueSet migration for the ICD-10-GM, Alpha-ID, SNOMED CT and Orphanet codings: 
* `reasonCode.coding[icd10-gm]`: `http://fhir.de/ValueSet/bfarm/icd-10-gm` → `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm`
* `reasonCode.coding[alpha-id]`: `http://fhir.de/ValueSet/bfarm/alpha-id` → `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid`
* `reasonCode.coding[sct]`: already `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct`
* `reasonCode.coding[orphanet]`: new binding to `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet`
* The same changes for the `condition.code.coding` slices
 
* Relationship bindings relaxed: `required` → `extensible` for SNOMED CT and v3-RoleCode 
* Allows flexibility for unusual types of relationship
 
 

-------

#### Version 2025.0.0

* Package ID updated
* Dependencies harmonized

