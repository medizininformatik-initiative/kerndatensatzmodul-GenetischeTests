# Diagnostic Implication for KMT2A Variant - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Diagnostic Implication for KMT2A Variant**

## Example Observation: Diagnostic Implication for KMT2A Variant

-------

**English**

-------

Profile: [MII PR MolGen Diagnostische Implikation](StructureDefinition-mii-pr-molgen-diagnostische-implikation.md) version: 2027.0.0-ballot.rc1

**status**: Final

**category**: Laboratory, Genetics

**code**: Diagnostic Implication

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**effective**: 2024-01-10

**derivedFrom**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-comprehensive-pathogenic.md)

> **component****code**: Genetic variation clinical significance [Imp]**value**: Pathogenic

> **component****code**: Level of evidence**value**: Strong evidence pathogenic

> **component****code**: Associated phenotype**value**: Wiedemann Steiner syndrome



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-diagnostische-implikation-comprehensive",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation|2027.0.0-ballot.rc1"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "laboratory",
      "display" : "Laboratory"
    }]
  },
  {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
      "code" : "GE"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
      "code" : "diagnostic-implication",
      "display" : "Diagnostic Implication"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "effectiveDateTime" : "2024-01-10",
  "derivedFrom" : [{
    "reference" : "Observation/mii-exa-molgen-variante-comprehensive-pathogenic"
  }],
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "53037-8"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA6668-3",
        "display" : "Pathogenic"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "93044-6",
        "display" : "Level of evidence"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA30201-0",
        "display" : "Strong evidence pathogenic"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "81259-4",
        "display" : "Associated phenotype"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "763618001",
        "display" : "Wiedemann Steiner syndrome"
      }]
    }
  }]
}

```
