# mii-exa-molgen-therapeutische-implikation-fgfr2-fusion - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-therapeutische-implikation-fgfr2-fusion**

## Example Observation: mii-exa-molgen-therapeutische-implikation-fgfr2-fusion

-------

**English**

-------

Profiles: [MII PR MolGen Therapeutische Implikation](StructureDefinition-mii-pr-molgen-therapeutische-implikation.md) version: 2026.0.4, [Therapeutic Implication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-therapeutic-implication.html) version: 3.0.0

**status**: Final

**category**: Laboratory, Genetics

**code**: Therapeutic Implication

**subject**: [Anonymous Patient Female, DoB: 1964-05 ( pseudonymized (use: usual, ))](Patient-mii-exa-molgen-patient-fgfr2-fusion.md)

**effective**: 2022-11-30

**performer**: [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md)

**derivedFrom**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-fgfr2-fusion.md)

> **component****code**: Conclusion Text**value**: Hochselektiver FGFR2-Inhibitor RLY-4008 bei Patienten mit Cholangiokarzinomen und anderen soliden Tumoren, mit oder ohne FGFR- gerichtete Vortherapie.

> **component****code**: Medication assessed [ID]**value**: Fibroblasten-Wachstumsfaktor-Rezeptor (FGFR)-Tyrosinkinase-Inhibitoren

> **component****code**: Level of evidence**value**: m1c

> **component****code**: Associated phenotype**value**: Intrahepatic bile duct carcinoma (disorder)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-therapeutische-implikation-fgfr2-fusion",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation|2026.0.4",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication|3.0.0"]
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
      "code" : "therapeutic-implication",
      "display" : "Therapeutic Implication"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-fgfr2-fusion"
  },
  "effectiveDateTime" : "2022-11-30",
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }],
  "derivedFrom" : [{
    "reference" : "Observation/mii-exa-molgen-variante-fgfr2-fusion"
  }],
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
        "code" : "conclusion-string"
      }]
    },
    "valueString" : "Hochselektiver FGFR2-Inhibitor RLY-4008 bei Patienten mit Cholangiokarzinomen und anderen soliden Tumoren, mit oder ohne FGFR- gerichtete Vortherapie."
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "51963-7",
        "display" : "Medication assessed [ID]"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "L01EN",
        "display" : "Fibroblasten-Wachstumsfaktor-Rezeptor (FGFR)-Tyrosinkinase-Inhibitoren"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "1162485005",
        "display" : "Substance with fibroblast growth factor receptor inhibitor mechanism of action (substance)"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "93044-6"
      }]
    },
    "valueCodeableConcept" : {
      "text" : "m1c"
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
        "code" : "109842005",
        "display" : "Intrahepatic bile duct carcinoma (disorder)"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024",
        "code" : "C22.1",
        "display" : "Intrahepatisches Gallengangskarzinom"
      }]
    }
  }]
}

```
