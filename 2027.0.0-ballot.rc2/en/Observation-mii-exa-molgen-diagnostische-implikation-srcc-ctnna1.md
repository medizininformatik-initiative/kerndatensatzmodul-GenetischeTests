# mii-exa-molgen-diagnostische-implikation-srcc-ctnna1 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-diagnostische-implikation-srcc-ctnna1**

## Example Observation: mii-exa-molgen-diagnostische-implikation-srcc-ctnna1

-------

**English**

-------

Profiles: [MII PR MolGen Diagnostische Implikation](StructureDefinition-mii-pr-molgen-diagnostische-implikation.md) version: 2027.0.0-ballot.rc2, [Diagnostic Implication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html) version: 3.0.0

**Related artifact**: No display for RelatedArtifact (type: citation; citation: ClinGen; url: https://search.clinicalgenome.org/kb/gene-dosage/HGNC:2509)

**status**: Final

**category**: Laboratory, Genetics

**code**: Diagnostic Implication

**subject**: [Anonymous Patient Male, DoB: 1986-01 ( pseudonymized (use: usual, ))](Patient-mii-exa-molgen-patient-srcc.md)

**effective**: 2022-11-30

**performer**: [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md)

**derivedFrom**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-srcc-ctnna1.md)

> **component****code**: Conclusion Text**value**: Diese Variante wird nach den ACMG/AMP-Kriterien zusammenfasssend als pathogen bewertet entsprechend IARC Class 5.

> **component****code**: Genetic variation clinical significance [Imp]**value**: Pathogenic

> **component****code**: Associated phenotype**value**: Hereditary diffuse carcinoma of stomach (disorder)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-diagnostische-implikation-srcc-ctnna1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation|2027.0.0-ballot.rc2",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication|3.0.0"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
    "valueRelatedArtifact" : {
      "type" : "citation",
      "citation" : "ClinGen",
      "url" : "https://search.clinicalgenome.org/kb/gene-dosage/HGNC:2509"
    }
  }],
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
    "reference" : "Patient/mii-exa-molgen-patient-srcc"
  },
  "effectiveDateTime" : "2022-11-30",
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }],
  "derivedFrom" : [{
    "reference" : "Observation/mii-exa-molgen-variante-srcc-ctnna1"
  }],
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
        "code" : "conclusion-string"
      }]
    },
    "valueString" : "Diese Variante wird nach den ACMG/AMP-Kriterien zusammenfasssend als pathogen bewertet entsprechend IARC Class 5."
  },
  {
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
        "code" : "81259-4"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "716859000",
        "display" : "Hereditary diffuse carcinoma of stomach (disorder)"
      }]
    }
  }]
}

```
