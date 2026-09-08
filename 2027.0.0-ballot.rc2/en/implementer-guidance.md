# Guidance for Implementers - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Guidance**](guidance.md)
* **Guidance for Implementers**

## Guidance for Implementers

Technical guidance for DIC implementers on implementing the profiles of the **Molekulargenetischer Befundbericht** module (ETL from primary systems, FHIR API, validation).

### Context within the Overall Project and Relations to Other Modules

#### Relation to the Person Module

The assignment of the results of the report to a patient specified in the order for the report, as well as the assignment of the orderer (healthcare provider) of the report and of the contact person at the performing laboratory, is done via references from the MOLEKULARGENETISCHER BEFUNDBERICHT module to the [PERSON](https://simplifier.net/mii-basismodul-person-2024) module.

#### Relation to the Biospecimen Module

For capturing the characteristics of the specimen used for the analysis, the MOLEKULARGENETISCHER BEFUNDBERICHT module references the [BIOBANK](https://simplifier.net/medizininformatikinitiative-modulbiobank) module.

#### Relation to the Encounter Module

The molecular genetic tests are ordered on the basis of a patient presenting to a healthcare provider (**encounter**) and are referenced via the [FALL](https://simplifier.net/medizininformatikinitiative-modulfall) module.

#### Relation to the Pathology Report Module

Molecular genetic tests can be ordered on the basis of conspicuous results of an existing pathology report. That report should then be referenced as supportingInfo via the [Pathologiebefund](https://simplifier.net/medizininformatikinitiative-modulpathologie) module.

#### Relation to the Oncology Module

The module uses the variant profile of the oBDS. In the cancer registry data there are two data elements (description and characteristic of a genetic variant), where the description of the variant is not structured in HGVS format but given as free text. Sites have the option here of taking the variant directly from the oBDS or, where possible, of enriching it with further locally available structured information. Further information can be found in the [Modul Onkologie](https://simplifier.net/medizininformatikinitiative-modulonkologie).

#### Relation to the Molecular Tumor Board Module

The [KDS-Modul Molekulares Tumorboard](https://simplifier.net/mii-erweiterungsmodul-molekulares-tumorboard) uses this module as the basis for modelling a next generation sequencing report, in particular for representing the various variants and molecular biomarkers.

#### Relation to the Rare Diseases Module

The new [Modul Seltene Erkrankungen](https://simplifier.net/mii-modul-seltene-erkrankungen) has no profiles of its own for molecular genetic investigations, but refers to this module for the representation of molecular genetic data, in particular because the requirements for genetic diagnostics of rare diseases were already taken into account when the Molekulargenetischer Befundbericht module was created.

### Upstream Profiles from HL7 Genomics Reporting

This module is built on [HL7 Genomics Reporting STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/) throughout, not merely alongside it. Counted from the built artifacts, the dependency is:

| | |
| :--- | :--- |
| Own profiles that inherit directly from an STU3 profile | 10 |
| Own profiles that inherit indirectly (via MII_PR_MolGen_MolekularerBiomarker) | 2 |
| Own extensions that inherit from an STU3 extension | 1 |
| STU3 extensions used in the profiles | 12 |
| STU3 ValueSets bound | 3 |
| Code systems taken from STU3 | 2 |

Which of this module's profiles derives from which STU3 profile is listed in the [inheritance table on the Profiles page](profiles.md). **This section is about something narrower**: the two STU3 profiles that this module uses **as they are**, without deriving a profile of its own from them. They have no page under [Artifacts](artifacts.md) for that reason, so they are described here.

#### Haplotype (Observation)

This profile describes the determination of a particular haplotype on the basis of one or more variants.

Canonical: `http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype` · [Profile page](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-haplotype.html)

##### Components

STU3 defines five component slices on this profile. Two of them carry elements of the logical dataset of this module:

| | |
| :--- | :--- |
| `Observation.component:gene-studied` | Methoden.Getestete Gene |
| `Observation.component:cytogenetic-location` | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung |

The remaining three are available but are not mapped to the logical dataset: `conclusion-string`, `reference-sequence-assembly` and `chromosome-identifier`.

#### Sequence Phase Relationship (Observation)

Indicates whether two variants are in a cis (same strand) or trans (opposite strand) relationship to each other — that is, whether they sit on the same copy of a chromosome or on different ones. The distinction decides whether two variants in the same gene affect one allele or both, and therefore whether a recessive condition is present.

Canonical: `http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship` · [Profile page](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-sequence-phase-relationship.html)

##### Structure

| | | |
| :--- | :--- | :--- |
| `Observation.code` | 1..1 | fixed to LOINC`82120-7` |
| `Observation.value[x]` | 1..1 | the phase relationship, bound`required`to the ValueSet below |
| `Observation.derivedFrom:variant` | 0..* | the variants being related — the[Variante](StructureDefinition-mii-pr-molgen-variante.md)profile of this module derives from the STU3 profile referenced here |
| `Observation.derivedFrom:haplotype` | 0..* | alternatively, the haplotypes being related |

##### Terminology

| | |
| :--- | :--- |
| ValueSet | [`sequence-phase-relationship-vs`](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-sequence-phase-relationship-vs.html), binding`required` |
| CodeSystem | [`sequence-phase-relationship-cs`](http://hl7.org/fhir/uv/genomics-reporting/STU3/CodeSystem-sequence-phase-relationship-cs.html)— canonical`http://terminology.hl7.org/CodeSystem/sequence-phase-relationship-cs`, i.e. it belongs to HL7 Terminology and is only rendered in the STU3 guide |

##### Expectation

Both profiles are declared in the [CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md) with **`MAY`**.

That is deliberate, and it was decided for this release. A `MAY` says: if you exchange haplotypes or phase relationships, use these STU3 profiles rather than inventing your own — but nothing in the core dataset of this module obliges you to produce them. Neither profile carries a core dataset requirement, this module derives nothing from either of them, and the guide shows no example of either. Haplotype previously stood at `SHALL`, which obliged implementers to support something the guide never demonstrates; Sequence Phase Relationship was not declared at all, although this page presented it as used. Both are now stated the same way.

### References

#### Publications

**Main publication on this Implementation Guide:**

Stellmach C, Sass J, Auber B, Boeker M, Wienker T, Heidel AJ, Benary M, Schumacher S, Ossowski S, Klauschen F, Möller Y, Schmutzler R, Ustjanzew A, Werner P, Tomczak A, Hölter T, Thun S. **Creation of a structured molecular genomics report for Germany as a local adaption of HL7's Genomic Reporting Implementation Guide**. **J Am Med Inform Assoc**. 2023 Apr 20;30(6):1179-1189. doi: 10.1093/jamia/ocad061. PMID: 37080557; PMCID: PMC10198526.

Available at: [https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/](https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/)

#### Technical Specifications

The FHIR profiles were created taking into account and applying the [Genomics Reporting Implementation Guide](https://hl7.org/fhir/uv/genomics-reporting/STU3/) (STU3) of HL7 International. Most profiles inherit directly from the STU3 profiles and extend them with specific requirements of the Medical Informatics Initiative.

