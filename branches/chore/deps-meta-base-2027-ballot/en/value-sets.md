# Value Sets - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* **Value Sets**

## Value Sets

### Value Sets

This page describes the ValueSets of the **Molekulargenetischer Befundbericht** module (naming convention `MII_VS_<Module>_<Name>`). For general guidance on using codes, see [FHIR Terminology](http://hl7.org/fhir/R4/terminologies.html); the code systems the sets draw from are described in the terminology section of this page — the module does not define a code system of its own.

**Expansions:** ValueSet expansions in this guide are produced by a FHIR terminology server — SU-TermServ if the client certificate is configured, otherwise the public HL7 server `tx.fhir.org` (in which case some KDS-specific ValueSets may not expand completely).

#### Terminology overview

The terminology components define the standardized vocabularies for the semantic interoperability of genetic data. The terminologies are organized by their origin:

| | |
| :--- | :--- |
| **MII ValueSets** | This module's own ValueSets (relationship, family history) |
| **Clinical Genomics** | ValueSets and CodeSystems from the HL7 Genomics Reporting IG |
| **External terminologies** | International standards (LOINC, SNOMED CT, HGNC, etc.) with licensing information |

##### Selection criteria

| | | |
| :--- | :--- | :--- |
| **MII-defined** | Own requirements, no suitable external terminology | Verwandtschaftsgrad, Familiäre Linie |
| **Clinical Genomics** | Genetics-specific concepts from the STU3 standard | DNA Change Type, Functional Effect |
| **External terminology** | Established international standards | LOINC, SNOMED CT, HGNC |

##### Binding strengths

| | | |
| :--- | :--- | :--- |
| **Required** | Exact match required | HGVS notation |
| **Extensible** | ValueSet may be extended where needed | Diagnosis codes |
| **Preferred** | Recommended but not mandatory | - |
| **Example** | Illustrative only, no constraint | - |

##### Implementation notes on terminology

* **Multiple coding**: ICD-10-GM + Orphanet for rare diseases
* **Display values**: always provide them, for usability
* **Versioning**: document terminology versions (particularly the ICD-10-GM annual version)
* **MANE transcripts**: preferred for HGVS notations

#### This module's MII ValueSets

This module defines the following ValueSets of its own for the interoperability of molecular genetic reports.

##### Family Member (SNOMED)

SNOMED CT codes for family members in the context of the family history.

[mii-vs-molgen-family-member-snomed](ValueSet-mii-vs-molgen-family-member-snomed.md)

-------

##### Verwandtschaftsgrad

Coding of the degree of relationship for the family history.

[mii-vs-molgen-verwandtschaftsgrad](ValueSet-mii-vs-molgen-verwandtschaftsgrad.md)

-------

##### Verwandtschaftsverhältnis

Coding of the type of relationship (biological, legal, etc.).

[mii-vs-molgen-verwandtschaftsverhaeltnis](ValueSet-mii-vs-molgen-verwandtschaftsverhaeltnis.md) 

-------

##### Familiäre Linie

Coding of the family line (maternal, paternal, etc.).

[mii-vs-molgen-familiaere-linie](ValueSet-mii-vs-molgen-familiaere-linie.md)

#### Terminologies from Clinical Genomics

The following ValueSets and CodeSystems are taken from the [HL7 Clinical Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/). They are not defined by this module.

##### CodeSystems from Clinical Genomics

The Clinical Genomics IG defines the following CodeSystems, which are used in this module:

| | | |
| :--- | :--- | :--- |
| TBD Codes | Temporary codes for Genomics Reporting | `http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs` |
| Molecular Biomarker Ontology | Biomarker categories | `http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/molecular-biomarker-ontology-cs` |

-------

##### ValueSets from Clinical Genomics

###### HGNC (Gene Names)

Standardized gene symbols and names from the HUGO Gene Nomenclature Committee. HGNC gene IDs are used with the prefix "HGNC:" as the code and the gene symbol as the display.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgnc-vs`

[hgnc-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-hgnc-vs.html)

-------

###### HGVS (Sequence Variant Nomenclature)

Human Genome Variation Society notation for the standardized description of sequence variants.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgvs-vs`

[hgvs-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-hgvs-vs.html)

-------

###### DNA Change Type

Types of DNA changes, based on the Sequence Ontology.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/dna-change-type-vs`

[dna-change-type-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-dna-change-type-vs.html)

-------

###### Molecular Consequence

Molecular consequences of a variant at the transcript and protein level.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/molecular-consequence-vs`

[molecular-consequence-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-molecular-consequence-vs.html)

-------

###### Functional Effect

Functional effects of a variant on biological products or pathways (e.g. loss of function, gain of function).

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/functional-effect-vs`

[functional-effect-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-functional-effect-vs.html)

-------

###### Variant Confidence Status

Confidence levels for the assessment of a variant.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/variant-confidence-status-vs`

[variant-confidence-status-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-variant-confidence-status-vs.html)

-------

###### Condition Inheritance Mode

Modes of inheritance for genetic diseases (autosomal dominant, recessive, X-linked, etc.).

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/condition-inheritance-vs`

[condition-inheritance-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-condition-inheritance-mode-vs.html)

-------

###### Evidence Level Examples

Example evidence-level codes for the classification of variants.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/evidence-level-example-vs`

[evidence-level-example-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-evidence-level-example-vs.html)

-------

###### Therapeutic Implication

Therapeutic implications of genetic variants.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/therapeutic-implication-vs`

[therapeutic-implication-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-genetic-therapeutic-implications-vs.html) 

-------

###### High/Low Codes

Codes for relative interpretations (high, low, normal).

**Canonical:** `http://hl7.org/fhir/ValueSet/observation-interpretation`

[observation-interpretation](http://hl7.org/fhir/R4/valueset-observation-interpretation.html)

#### External terminologies used

This module uses international terminology standards for the semantic coding of genetic findings.

##### Genetic nomenclature

| | | | |
| :--- | :--- | :--- | :--- |
| **HGNC** | HUGO Gene Nomenclature Committee - standardized gene symbols | `http://www.genenames.org/geneId` | [CC0](https://www.genenames.org/about/) |
| **HGVS** | Human Genome Variation Society - sequence variant notation | `http://varnomen.hgvs.org` | Open |
| **ISCN** | International System for Human Cytogenomic Nomenclature | - | Commercial |
| **Sequence Ontology** | Ontology for genomic annotations | `http://sequenceontology.org` | [CC BY-SA](http://www.sequenceontology.org/about.html) |

##### Clinical terminologies

| | | | |
| :--- | :--- | :--- | :--- |
| **LOINC** | Logical Observation Identifiers Names and Codes | `http://loinc.org` | [LOINC License](https://loinc.org/license/)- free of charge |
| **SNOMED CT** | Systematized Nomenclature of Medicine | `http://snomed.info/sct` | [NRC license](https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/_node.html) |
| **ICD-10-GM** | ICD-10 German Modification | `http://fhir.de/CodeSystem/bfarm/icd-10-gm` | BfArM - free of charge |
| **Orphanet** | Rare diseases | `http://www.orpha.net` | [CC BY 4.0](https://www.orphadata.com/terms-of-use/) |
| **OMIM** | Online Mendelian Inheritance in Man | `http://www.omim.org` | [OMIM License](https://www.omim.org/help/agreement) |
| **HPO** | Human Phenotype Ontology | `http://human-phenotype-ontology.org` | [Custom](https://hpo.jax.org/app/license)- free of charge |

##### Reference sequences

| | | | |
| :--- | :--- | :--- | :--- |
| **RefSeq** | NCBI Reference Sequences | `http://www.ncbi.nlm.nih.gov/refseq` | Preferred: MANE Select transcripts |
| **Ensembl** | Ensembl Genome Browser | `http://www.ensembl.org` | Alternative transcript references |
| **dbSNP** | Single Nucleotide Polymorphism Database | `http://www.ncbi.nlm.nih.gov/snp` | rs numbers for known variants |
| **ClinVar** | Clinical Variant Database | `http://www.ncbi.nlm.nih.gov/clinvar` | Clinical variant assessments |
| **COSMIC** | Catalogue of Somatic Mutations in Cancer | `https://cancer.sanger.ac.uk/cosmic` | Somatic variants |

##### Pharmacogenomics

| | | | |
| :--- | :--- | :--- | :--- |
| **PharmGKB** | Pharmacogenomics Knowledge Base | `https://www.pharmgkb.org` | Evidence levels for pharmacogenetics |
| **CPIC** | Clinical Pharmacogenetics Implementation Consortium | `https://cpicpgx.org` | Dosing recommendations |

##### MANE (Matched Annotation from NCBI and EMBL-EBI)

For HGVS notations, **MANE Select** transcripts should be used preferentially:

* **MANE Select**: one representative transcript per protein-coding gene
* **MANE Plus Clinical**: additional clinically relevant transcripts
* **Format**: RefSeq NM_ identifiers with version number (e.g. `NM_007294.4`)
* **Reference**: [NCBI MANE](https://www.ncbi.nlm.nih.gov/refseq/MANE/)

##### Versioning of the terminologies

| | |
| :--- | :--- |
| ICD-10-GM | State the annual version (e.g. 2024) |
| LOINC | Document the version at implementation time |
| SNOMED CT | International Edition + German extension |
| RefSeq | Always state the transcript version number |

##### Licensing notes

Using some terminologies requires licensing agreements:

* **SNOMED CT**: use in Germany under the BfArM license (NRC)
* **LOINC**: free registration required
* **OMIM**: license required for commercial use

