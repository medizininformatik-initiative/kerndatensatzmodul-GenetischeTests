# Guidance - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* **Guidance**

## Guidance

This section collects the domain guidance for implementing and using the **Molekulargenetischer Befundbericht** module.

### General Implementation Guidance

* **[Datasets and Descriptions](logical-models.md)** — the module's data elements, described as logical models. (This entry shares its target with **Artifacts → Logical Models**; neither Artifacts-Summary anchor is usable as a link target — see [`docs/page-structure.md`](https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/blob/main/docs/page-structure.md) in this repository.)
* **[UML Diagrams](uml-diagrams.md)** — visual representation of the data models and their relationships.

### Audience-Specific Guidance

* **[Guidance for Implementers](implementer-guidance.md)** — technical guidance for DIC implementers.

### Description of the Module

Detailed rationale for the modelling and the intent of the FHIR profiles

This specification describes the FHIR representation of the CDS module **'Molekulargenetischer Befundbericht'** of the Medical Informatics Initiative.

It covers the module's use cases and the associated FHIR profiles and terminology resources in their normative form.

#### Scope

##### Out of scope

The specification will in future address the structured capture of:

* results of FISH analyses
* RNA fusions and further complex variants.

Preliminary FHIR representations are being trialled in the Molecular Tumor Board.

##### In scope

In the current version, the specification enables the structured representation of:

* point variants (single nucleotide variants, SNVs)
* copy number variations (CNV)
* DNA fusions, in a limited form
* processing steps (bioinformatics pipeline including the databases and software used) — previously out of scope, but made possible by the update to STU3 via GenomicStudy / GenomicStudyAnalysis

A **genetic finding** comprises the presentation of information about the genetic characteristics of a human specimen. In humans, the specimen may come from "normal", transplanted or reproductive tissue (sperm, egg cells) or from "abnormal" tissue such as tumor tissue. The specimen may also take the form of body fluids such as blood, cerebrospinal fluid or urine. Sequence information from fungi, viruses and bacteria is not represented in the molecular genetic report but in the Microbiology module.

Typically the report covers the DNA of the specimen (chromosomal or sometimes also mitochondrial DNA), but it may also contain information about RNA and proteins.

The term **sequence** refers to a series of connected base molecules that form a polymer of subunits. The bases of DNA and RNA (i.e. their monomeric subunits) are nucleotides. The subunits of proteins available for analysis are amino acids. In cells, the polymers from which DNA, RNA and proteins are built are present in innumerable molecules. DNA polymers are structured into chromosomes by condensation and the formation of further organizational units.

Because DNA, RNA and also amino acid sequences can be exceptionally long, the report is typically written on the basis of the differences established between the sequence of the patient specimen under test and a **reference sequence**. These differences are called **variants**. Variations are normally not listed together with the complete sequence, because the clinical relevance of genomic tests is based on the presence of a deviation from the norm within the sequence. It should be noted, however, that a sequence can still be relevant even if there are no changes with respect to the reference sequence.

Results at the genomic level (e.g. wild type, single variant, and simultaneously occurring variants) can be represented collectively as haplotypes and genotypes. Haplotypes describe genomic findings that occur on only one set of chromosomes. Genotypes are combinations of haplotypes or variations at a similar position on both parental chromosomes.

#### Main Elements of the Report

Worldwide, genomic tests are a component of the service repertoire of laboratories. These tests support healthcare providers in the diagnosis, prognosis and treatment of patients. For a genetic test to be carried out, both an order from a healthcare provider and a patient specimen must be present.

What is unique about genomic tests is that the state of knowledge grows continuously, so that genomic tests from the past may under certain circumstances be re-analyzed at a future point in time in order to gain new insights. In these cases the genomic data to be re-analyzed is itself treated as a patient specimen and requires a new order by the healthcare provider for the re-analysis.

When a laboratory adds a new test to its service repertoire and thereby makes it available for physicians to order, there are in the background a large number of prerequisites that must be met before an order is processed and testing on the patient specimen can begin. The laboratory has to validate the test, which includes checking analytical sensitivity, specificity and reporting.

On the technical side, in FHIR resources the payload of the genomic report is carried by the HL7 International ****'DiagnosticReport'**** FHIR resource. The DiagnosticReport brings together all information generated by the genomic analysis and other related elements such as the order, the specimen, etc. It organizes this information, provides a summary and supplies comments and assessments of the results. It is the primary response to the ****'ServiceRequest'****, which is the order to perform the genomic tests and constitutes a further FHIR resource to be used.

In practice, several orders can be bundled into a single collective order. This allows multiple tests to be ordered at the same time and the results to be collated as a group. A genomic test report may in addition contain results from different test methods. For example, specific tests may be carried out based on the result of a more general test in order to gain additional information.

The structure of the DiagnosticReport arises from sub-listings or groups. The structure of these groups is mostly determined by the type of tests/panels that were ordered, but it may also differ by the performing laboratory. In some cases there is no subdivision at all in the reports.

The main elements of the report are the results, interpretations, implications and recommendations.

Results (****Genomic Findings****) in the report represent observations (****Observations****) about the genomic characteristics of the examined specimen. For example, a chromosomal abnormality (such as the duplication of a chromosome) or a particular genotype, haplotype or variant may be established. Genomic implications (****Genomic Implications****) give an overview of the effects of one or more genomic results, such as a "poor response to medication". Recommendations such as "reduction of the dosage of the drug" can be given together with the notes on implications.

The genomic ****interpretation**** is an overall assessment of the results of the genomic tests, placed in the context of the order text — for example that a positive or a negative result is present.

While some or all of this information can be communicated in the report, it is important to note that the treating physician knows the overall picture of the patient's condition, which is formed from radiological findings and knowledge of the patient history as well as the evaluation of the molecular genetic report.

#### Detection and Reporting of Variants

DNA, RNA and amino acid sequences can be examined by a range of methods including, among others, direct sequencing of particular genome regions, whole genome sequencing, microarrays and mass spectrometry.

Comparing the patient's genomic sequence with a reference sequence using a wide variety of techniques serves to detect differences, i.e. genomic variants. Each of these techniques comes with limitations that have to be weighed up, such as applicability, cost, time required, availability and precision. For example, some techniques can be applied only to DNA but not to RNA or protein sequences. Others can detect only certain types of change.

Even though variant reporting based on a reference comparison covers many use cases, there are some variants in the population for which no "regular" reference sequence exists. In these cases the entire sequence is often reported. A known sequence can at this point also be used as a designated reference for the comparison.

Sequence differences can occur at various levels of granularity, ranging from chromosomal or polychromosomal abnormalities to additional or missing chromosomes, but also comprising large-scale differences (as in the case of microsatellite instabilities) and single nucleotide changes (single nucleotide polymorphisms/variations, SNP or SNV for short).

Known genomic variants are often designated by a **code** and catalogued within code systems. This makes it easy to link knowledge with information for a particular specimen. Reports can refer to the matching code, and the physician then has the possibility of looking up relevant information associated with the code. Sometimes, however, variants are detected to which no standardized code has yet been assigned. In these cases the description of the variant and its location is communicated in the report. Even when a code for the variant exists, detailed descriptions of the variant type are often included in the report.

### Use Cases and Information Model

The CDS module **Molekulargenetischer Befundbericht** enables the representation of the reporting of pathological and wild-type genotypes based on ordered sequence-based and non-sequence-based tests.

A molecular genetic finding contains information about the genetic characteristics of a human specimen. This specimen may come from "normal", transplanted or reproductive tissue (sperm, egg cells) or from "abnormal" tissue such as tumor tissue. The specimen may also take the form of body fluids such as blood, cerebrospinal fluid or urine.

Typically the report covers the DNA of the specimen (chromosomal or sometimes also mitochondrial DNA), but it may also contain information about RNA and proteins. Results (****Genomic Findings****) of the report (****DiagnosticReport****) describe sequence variants, which are represented as observations (Observation). Connected representations consisting of observations and the interpretations derived from them (****Genomic Implications****) are possible. The genomic interpretation is an overall assessment of the results of the genomic tests, placed in the context of the order text — for example that a positive or a negative result is present.

While some or all of this information can be communicated in the report, it is important to note that the treating physician knows the overall picture of the patient's condition, which is formed from pathology and laboratory findings, radiological findings and knowledge of the patient history as well as the evaluation of the molecular genetic report.

This module can be used whenever there is no specific representation in existing dedicated modules such as Laboratory, or when those are not applicable for whatever reason. It must be checked in the context of each specific application whether this CDS module can and should be used.

### Scenarios for the Application of the Modules

Rapid advances in the available sequencing technologies and genetic tests for sequencing whole genomes and exomes make it possible for these highly developed tests to be used by providers and patients for clinical decisions. The results of the tests are used to identify specific genetic variants that influence syndromes which contribute to health conditions and/or to the predictable response to a treatment. The implementation of precision medicine depends on exactly this data in order to make diagnoses, select drugs and predict the course of disease and treatment.

Genetic tests provide information about causal relationships between structural variants or changes of the genome and potential diseases and possible therapies. Because of this, and through the availability of low-cost tests, they have gained very high importance for medicine. They are used for diagnostics, differential diagnostics and for therapy selection. They furthermore provide prognostic and predictive information on specific therapies (e.g. pharmacogenomics). By now genetic tests are of importance in all areas of medicine; they are applied ubiquitously both in routine diagnostics (e.g. typing of tumors) and in research.

#### Concrete Application Scenarios from the Examples

The following scenarios are based on the implemented examples and show typical use cases of the module:

##### 1. Somatic Oncology – BRAF Mutation in Colorectal Carcinoma

**Clinical scenario**: Patient with metastatic colorectal adenocarcinoma for therapy stratification.

* **Question**: BRAF V600E mutation status for the anti-EGFR therapy decision
* **Method**: Targeted panel sequencing
* **Result**: BRAF p.Val600Glu mutation detected
* **Implication**: Contraindication for anti-EGFR therapy, alternative therapy options required
* **Example**: `mii-exa-molgen-befundbericht-1`

##### 2. Hereditary Disease – Cornelia de Lange Syndrome

**Clinical scenario**: Child with developmental delay and characteristic dysmorphic features.

* **Question**: Molecular genetic clarification with suspected Cornelia de Lange syndrome
* **Method**: Single gene sequencing NIPBL
* **Result**: Pathogenic NIPBL variant identified
* **Implication**: Confirmation of diagnosis, autosomal dominant inheritance, genetic counselling of the family
* **Example**: `mii-exa-molgen-befundbericht-2`

##### 3. Hereditary Tumor Predisposition – BRCA1 with Familial Burden

**Clinical scenario**: Healthy woman with a positive family history of breast and ovarian cancer.

* **Question**: Predictive testing for BRCA1/2 mutations
* **Method**: TruRisk panel (BRCA1, BRCA2, further genes)
* **Result**: Pathogenic BRCA1 variant c.5266dupC
* **Implication**: Increased cancer risk, intensified surveillance, prophylactic options, cascade screening
* **Example**: `mii-exa-molgen-befundbericht-trurisk-panel`

##### 4. Whole Exome Sequencing – Research Context

**Clinical scenario**: Comprehensive genetic analysis with detailed technical documentation.

* **Question**: Identification of pathogenic variants with an unclear diagnosis
* **Method**: WES with a multi-stage workflow (library prep → sequencing → bioinformatics)
* **Technical details**: 
* Illumina NovaSeq 6000 sequencing
* Mean coverage 120x
* 95.2% callable regions
* BWA-GATK pipeline v4.2
 
* **Documentation**: Complete device, kit and pipeline documentation
* **Example**: `mii-exa-molgen-bundle-comprehensive-wes`

##### 5. Molecular Tumor Board – Therapy Recommendation

**Clinical scenario**: Tumor patient with a complex molecular profile.

* **Question**: Identification of targetable alterations
* **Method**: Comprehensive genomic profiling
* **Results**: Multiple biomarkers (MSI, TMB, specific variants)
* **Implication**: Personalized therapy recommendation based on the molecular profile
* **Task generation**: Medication recommendation and tumor board presentation

#### Cross-Cutting Application Patterns

These scenarios demonstrate the versatility of the module:

1. **Diagnostics**: Confirmation or exclusion of genetic diseases
1. **Predictive**: Risk assessment in healthy carriers
1. **Therapy stratification**: Selection of targeted therapies
1. **Family investigation**: Cascade screening in hereditary diseases
1. **Research**: Detailed documentation for scientific evaluation

Because of the broad use of the CDS module Molekulargenetischer Befundbericht, these examples are representative of the applications in the various consortia.

-------

For the KDS-wide conformance requirements see the [Conformance rules of the Meta module](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Conformance); for the technical artifacts see [Profiles](profiles.md).

