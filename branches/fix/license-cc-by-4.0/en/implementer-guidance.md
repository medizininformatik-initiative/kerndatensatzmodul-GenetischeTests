# Guidance for Implementers - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

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

The following two profiles come from the [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/) and are not profiled by this module itself. They are described here because they are used together with this module's profiles when implementing genetic reports.

#### Haplotype (Observation)

This profile describes the determination of a particular haplotype on the basis of one or more variants.

Canonical: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype

The profile [Haplotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-haplotype.html) comes from the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

##### Profile

| | |
| :--- | :--- |
| Observation.component:gene-studied | Methoden.Getestete Gene |
| Observation.component:CytogenicLocation | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung |

##### Search Parameters

The following search parameters are relevant for the Pathologie-Befund module, also in combination:

1. The search parameter `_id` SHALL be supported:Examples:`GET [base]/Observation?_id=example-mii-molgen-variante-1`Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification, section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).
1. The search parameter "_profile" SHALL be supported:Examples:`GET [base]/Observation?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante`Usage notes: Further information on searching by "_profile" can be found in the [FHIR base specification, section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).
1. The search parameter "code" SHALL be supported:Examples:`GET [base]/Observation?code=http://loinc.org|69548-6`Usage notes: Further information on searching by "code" can be found in the [FHIR base specification, section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "subject" SHALL be supported:Examples:`GET [base]/Observation?subject=Patient/example-mii-molgen-patient`Usage notes: Further information on searching by "subject" can be found in the [FHIR base specification, section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "category" SHALL be supported:Examples:`GET [base]/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory`Usage notes: Further information on searching by "category" can be found in the [FHIR base specification, section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "encounter" SHALL be supported:Examples:`GET [base]/Observation?encounter=Encounter/12345`Usage notes: Further information on searching by "encounter" can be found in the [FHIR base specification, section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "code-value-concept" SHALL be supported:Examples:`GET [base]/Observation?code-value-concept=http://loinc.org|69548-6$http://loinc.org|LA9633-4`Usage notes: Further information on searching by "code-value-concept" can be found in the [FHIR base specification, section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "code-value-quantity" SHALL be supported:Examples:`GET [base]/Observation?code-value-quantity=http://loinc.org|82155-3$6http://unitsofmeasure.org|1`Usage notes: Further information on searching by "code-value-quantity" can be found in the [FHIR base specification, section "composite"](http://hl7.org/fhir/search.html#composite).
1. The search parameter "component-code" SHALL be supported:Examples:`GET [base]/Observation?component-code=http://loinc.org|48018-6`Usage notes: Further information on searching by "component-code" can be found in the [FHIR base specification, section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "component-code-value-concept" SHALL be supported:Examples:`GET [base]/Observation?component-code-value-concept=http://loinc.org|48018-6$http://www.genenames.org/geneId|HGNC:1097`Usage notes: Further information on searching by "component-code-value-concept" can be found in the [FHIR base specification, section "composite"](http://hl7.org/fhir/search.html#composite).
1. The search parameter "component-code-value-quantity" SHALL be supported:Examples:`GET [base]/Observation?component-code-value-quantity=http://loinc.org|81258-6$ap30%|http://unitsofmeasure.org|%25`Usage notes: Further information on searching by "component-code-value-quantity" can be found in the [FHIR base specification, section "composite"](http://hl7.org/fhir/search.html#composite).
1. The search parameter "component-value-concept" SHALL be supported:Examples:`GET [base]/Observation?component-value-concept=http://sequenceontology.org|SO:SO:1000008`Usage notes: Further information on searching by "component-code-value-concept" can be found in the [FHIR base specification, section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "component-value-quantity" SHALL be supported:Examples:`GET [base]/Observation?component-value-quantity=ap30%|http://unitsofmeasure.org|%25`Usage notes: Further information on searching by "component-value-quantity" can be found in the [FHIR base specification, section "composite"](http://hl7.org/fhir/search.html#composite).
1. The search parameter "date" SHALL be supported:Examples:`GET [base]/Observation?date=2022-07-13`Usage notes: Further information on searching by "date" can be found in the [FHIR base specification, section "date"](http://hl7.org/fhir/R4/search.html#date).
1. The search parameter "derived-from" SHALL be supported:Examples:`GET [base]/Observation?derived-from=Observation/example-mii-molgen-variante-1`Usage notes: Further information on searching by "derived-from" can be found in the [FHIR base specification, section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "device" SHALL be supported:Examples:`GET [base]/Observation?device=Device/example-mii-molgen-device-sequencer`Usage notes: Further information on searching by "device" can be found in the [FHIR base specification, section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "specimen" SHALL be supported:Examples:`GET [base]/Observation?specimen=Specimen/example-mii-molgen-specimen`Usage notes: Further information on searching by "specimen" can be found in the [FHIR base specification, section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "encounter" SHALL be supported:Examples:`GET [base]/Observation?encounter=Encounter/12345`Usage notes: Further information on searching by "encounter" can be found in the [FHIR base specification, section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "method" SHALL be supported:Examples:`GET [base]/Observation?method=http://loinc.org|LA26398-0`Usage notes: Further information on searching by "method" can be found in the [FHIR base specification, section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "patient" SHALL be supported:Examples:`GET [base]/Observation?patient=Patient/example-mii-molgen-patient-2`Usage notes: Further information on searching by "patient" can be found in the [FHIR base specification, section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "performer" SHALL be supported:Examples:`GET [base]/Observation?performer=Practioner/example-mii-molgen-practitioner-laboratory`Usage notes: Further information on searching by "performer" can be found in the [FHIR base specification, section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "status" SHALL be supported:Examples:`GET [base]/Observation?status=final`Usage notes: Further information on searching by "status" can be found in the [FHIR base specification, section "token"](http://hl7.org/fhir/R4/search.html#token).

#### Sequence Phase Relationship (Observation)

Indicates whether two variants are in a cis (same strand) or trans (opposite strand) relationship to each other.

The profile corresponds to [Sequence Phase Relationship](http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship) from the [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

##### Terminology

###### CodeSystem

**Sequence Phase Relationship CodeSystem**

[SequencePhaseRelationshipCS](http://hl7.org/fhir/uv/genomics-reporting/STU3/CodeSystem-sequence-phase-relationship-cs.html)

###### ValueSet

**Sequence Phase Relationship ValueSet**

[seq-phase-relationship](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-sequence-phase-relationship-vs.html)

### References

#### Publications

**Main publication on this Implementation Guide:**

Stellmach C, Sass J, Auber B, Boeker M, Wienker T, Heidel AJ, Benary M, Schumacher S, Ossowski S, Klauschen F, Möller Y, Schmutzler R, Ustjanzew A, Werner P, Tomczak A, Hölter T, Thun S. **Creation of a structured molecular genomics report for Germany as a local adaption of HL7's Genomic Reporting Implementation Guide**. **J Am Med Inform Assoc**. 2023 Apr 20;30(6):1179-1189. doi: 10.1093/jamia/ocad061. PMID: 37080557; PMCID: PMC10198526.

Available at: [https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/](https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/)

#### Technical Specifications

The FHIR profiles were created taking into account and applying the [Genomics Reporting Implementation Guide](https://hl7.org/fhir/uv/genomics-reporting/STU3/) (STU3) of HL7 International. Most profiles inherit directly from the STU3 profiles and extend them with specific requirements of the Medical Informatics Initiative.

