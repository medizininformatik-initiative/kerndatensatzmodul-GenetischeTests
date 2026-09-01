# TSO500 Sequencing on NovaSeq 6000 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TSO500 Sequencing on NovaSeq 6000**

## Example Procedure: TSO500 Sequencing on NovaSeq 6000

-------

**English**

-------

Profiles: [MII PR MolGen Genomic Study Analysis](StructureDefinition-mii-pr-molgen-genomic-study-analysis.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4)

**Genomic Study Analysis Specimen**: [mii-exa-molgen-specimen-ffpe-tumor](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/modul-meta/mii-exa-molgen-specimen-ffpe-tumor)

> **Genomic Study Analysis Device**
* device: [Device: identifier = https://www.medizininformatik-initiative.de/fhir/sid/lab-devices#NOVASEQ-6000-SN12345; status = active; manufacturer = Illumina Inc.; serialNumber = SN12345; modelNumber = NovaSeq 6000; type = Medical laboratory analyzer](Device-mii-exa-molgen-device-illumina-novaseq.md)

**Genomic Study Analysis Method Type**: Sequencing

> **Genomic Study Analysis Metrics**
* read-depth: 1000 reads (Details: UCUM code1 = '1')
* sequencing-coverage: 95 percent (Details: UCUM code% = '%')
* metrics-description: Mean target coverage 1000X; 95% der Zielregionen >250X; Q30 >90%; FFPE-bedingte Qualitätsfilter angewandt

**status**: Completed

**category**: Laboratory

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-molgen-genomic-study-analysis-tso500-sequencing",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen",
    "valueReference" : {
      "reference" : "mii-exa-molgen-specimen-ffpe-tumor"
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
        "value" : 1000,
        "unit" : "reads",
        "system" : "http://unitsofmeasure.org",
        "code" : "1"
      }
    },
    {
      "url" : "sequencing-coverage",
      "valueQuantity" : {
        "value" : 95,
        "unit" : "percent",
        "system" : "http://unitsofmeasure.org",
        "code" : "%"
      }
    },
    {
      "url" : "metrics-description",
      "valueString" : "Mean target coverage 1000X; 95% der Zielregionen >250X; Q30 >90%; FFPE-bedingte Qualitätsfilter angewandt"
    }],
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-metrics"
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
