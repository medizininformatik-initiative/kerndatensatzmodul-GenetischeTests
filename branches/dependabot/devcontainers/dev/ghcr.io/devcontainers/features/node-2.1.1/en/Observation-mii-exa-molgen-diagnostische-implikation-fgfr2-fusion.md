# mii-exa-molgen-diagnostische-implikation-fgfr2-fusion - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-diagnostische-implikation-fgfr2-fusion**

## Example Observation: mii-exa-molgen-diagnostische-implikation-fgfr2-fusion

-------

**English**

-------

Profiles: [MII PR MolGen Diagnostische Implikation](StructureDefinition-mii-pr-molgen-diagnostische-implikation.md) version: 2027.0.0-ballot.rc1, [Diagnostic Implication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html) version: 3.0.0

**status**: Final

**category**: Laboratory, Genetics

**code**: Diagnostic Implication

**subject**: [Anonymous Patient Female, DoB: 1964-05 ( pseudonymized (use: usual, ))](Patient-mii-exa-molgen-patient-fgfr2-fusion.md)

**effective**: 2022-11-30

**performer**: [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md)

**derivedFrom**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-fgfr2-fusion.md)

### Components

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Value[x]** |
| * | Conclusion Text | starke Überexpression (25-fach) |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-diagnostische-implikation-fgfr2-fusion",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation|2027.0.0-ballot.rc1",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication|3.0.0"]
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
    "valueString" : "starke Überexpression (25-fach)"
  }]
}

```
