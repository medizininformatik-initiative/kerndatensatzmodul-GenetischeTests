# mii-exa-molgen-patient-brca1 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-patient-brca1**

## Example Patient: mii-exa-molgen-patient-brca1

-------

**English**

-------

Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, ))

-------

| | |
| :--- | :--- |
| Deceased: | false |
| Other Id: | Gesetzliche Krankenversicherung/Z977188448 (use: official, ) |
| Contact Detail | Anna-Louisa-Karsch Str. 2 Berlin DE-BE 10178 DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "mii-exa-molgen-patient-brca1",
  "identifier" : [{
    "use" : "usual",
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "MR"
      }]
    },
    "system" : "https://www.charite.de/fhir/sid/patienten",
    "value" : "9166147031",
    "assigner" : {
      "identifier" : {
        "system" : "https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier",
        "value" : "Charité"
      },
      "display" : "Charité - Universitätsmedizin Berlin"
    }
  },
  {
    "use" : "official",
    "type" : {
      "coding" : [{
        "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
        "code" : "GKV"
      }]
    },
    "system" : "http://fhir.de/sid/gkv/kvid-10",
    "value" : "Z977188448",
    "assigner" : {
      "identifier" : {
        "use" : "official",
        "system" : "http://fhir.de/sid/arge-ik/iknr",
        "value" : "109519005"
      }
    }
  }],
  "name" : [{
    "use" : "official",
    "family" : "Schmidt-Huber",
    "_family" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/humanname-own-name",
        "valueString" : "Schmidt"
      }]
    },
    "given" : ["Elisa"]
  }],
  "gender" : "female",
  "birthDate" : "1973-03-12",
  "deceasedBoolean" : false,
  "address" : [{
    "type" : "both",
    "line" : ["Anna-Louisa-Karsch Str. 2"],
    "city" : "Berlin",
    "state" : "DE-BE",
    "postalCode" : "10178",
    "country" : "DE"
  }]
}

```
