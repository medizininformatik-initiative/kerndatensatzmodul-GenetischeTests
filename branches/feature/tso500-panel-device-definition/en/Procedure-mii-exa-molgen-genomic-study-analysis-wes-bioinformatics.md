# WES Bioinformatics Analysis - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **WES Bioinformatics Analysis**

## Example Procedure: WES Bioinformatics Analysis

-------

**English**

-------

Profiles: [MII PR MolGen Genomic Study Analysis](StructureDefinition-mii-pr-molgen-genomic-study-analysis.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4)

> **Genomic Study Analysis Input**
* type: FASTQ files

**Genomic Study Analysis Method Type**: Computational analysis

> **Genomic Study Analysis Regions**
* description: Callable regions after quality filtering

**status**: Completed

**category**: Laboratory

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-molgen-genomic-study-analysis-wes-bioinformatics",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "type",
      "valueCodeableConcept" : {
        "text" : "FASTQ files"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-input"
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA26811-2",
        "display" : "Computational analysis"
      }]
    }
  },
  {
    "extension" : [{
      "url" : "description",
      "valueString" : "Callable regions after quality filtering"
    }],
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions"
  }],
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "laboratory"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  }
}

```
