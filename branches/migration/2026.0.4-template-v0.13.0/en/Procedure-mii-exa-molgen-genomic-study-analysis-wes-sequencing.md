# WES Sequencing Analysis - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **WES Sequencing Analysis**

## Example Procedure: WES Sequencing Analysis

-------

**English**

-------

Profiles: [MII PR MolGen Genomic Study Analysis](StructureDefinition-mii-pr-molgen-genomic-study-analysis.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2026.0.0&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4)

**Genomic Study Analysis Specimen**: [Specimen: identifier = https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids#LIB-2024-001; type = Saliva specimen](Specimen-mii-exa-molgen-specimen-dna-library.md)

> **Genomic Study Analysis Device**
* device: [Device: identifier = https://www.medizininformatik-initiative.de/fhir/sid/lab-devices#NOVASEQ-6000-SN12345; status = active; manufacturer = Illumina Inc.; serialNumber = SN12345; modelNumber = NovaSeq 6000; type = Medical laboratory analyzer](Device-mii-exa-molgen-device-illumina-novaseq.md)

**Genomic Study Analysis Method Type**: Sequencing

> **Genomic Study Analysis Metrics**
* read-depth: 120 reads (Details: UCUM code1 = '1')
* sequencing-coverage: 98.5 percent (Details: UCUM code% = '%')
* metrics-description: High-quality sequencing run with mean coverage of 120X. 98.5% of target regions achieved >20X coverage. Q30 bases: 92%. Contamination estimate: <1%. Sample identity confirmed by SNP fingerprinting.

> **Genomic Study Analysis Regions**
* description: Whole Exome - Agilent SureSelect Human All Exon V7

**status**: Completed

**category**: Laboratory

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-molgen-genomic-study-analysis-wes-sequencing",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen",
    "valueReference" : {
      "reference" : "Specimen/mii-exa-molgen-specimen-dna-library"
    }
  },
  {
    "extension" : [{
      "url" : "device",
      "valueReference" : {
        "reference" : "Device/mii-exa-molgen-device-illumina-novaseq"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device"
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA26398-0",
        "display" : "Sequencing"
      }]
    }
  },
  {
    "extension" : [{
      "url" : "read-depth",
      "valueQuantity" : {
        "value" : 120,
        "unit" : "reads",
        "system" : "http://unitsofmeasure.org",
        "code" : "1"
      }
    },
    {
      "url" : "sequencing-coverage",
      "valueQuantity" : {
        "value" : 98.5,
        "unit" : "percent",
        "system" : "http://unitsofmeasure.org",
        "code" : "%"
      }
    },
    {
      "url" : "metrics-description",
      "valueString" : "High-quality sequencing run with mean coverage of 120X. 98.5% of target regions achieved >20X coverage. Q30 bases: 92%. Contamination estimate: <1%. Sample identity confirmed by SNP fingerprinting."
    }],
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-metrics"
  },
  {
    "extension" : [{
      "url" : "description",
      "valueString" : "Whole Exome - Agilent SureSelect Human All Exon V7"
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
