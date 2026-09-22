# WES Library Preparation Analysis - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **WES Library Preparation Analysis**

## Beispiel Procedure: WES Library Preparation Analysis

-------

**German**

-------

Profiles: [MII PR MolGen Genomic Study Analysis](StructureDefinition-mii-pr-molgen-genomic-study-analysis.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2027.0.0-ballot.rc1](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2027.0.0-ballot.rc1)

**Genomic Study Analysis Specimen**: [Specimen: identifier = https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids#EDTA-2024-001; type = Plasma specimen](Specimen-mii-exa-molgen-specimen-blood-edta.md)

> **Genomic Study Analysis Device**
* device: [Device: identifier = https://www.medizininformatik-initiative.de/fhir/sid/lab-devices#IONCHEF-IC12345; status = active; manufacturer = Thermo Fisher Scientific; serialNumber = IC12345; modelNumber = Ion Chef; type = ](Device-mii-exa-molgen-device-thermofisher-ionchef.md)

**Genomic Study Analysis Method Type**: DNA hybridization

**status**: Completed

**category**: Laboratory

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-molgen-genomic-study-analysis-wes-library-prep",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2027.0.0-ballot.rc1"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen",
    "valueReference" : {
      "reference" : "Specimen/mii-exa-molgen-specimen-blood-edta"
    }
  },
  {
    "extension" : [{
      "url" : "device",
      "valueReference" : {
        "reference" : "Device/mii-exa-molgen-device-thermofisher-ionchef"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device"
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA26810-4",
        "display" : "DNA hybridization"
      }]
    }
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
