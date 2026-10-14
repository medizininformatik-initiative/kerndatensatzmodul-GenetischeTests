# mii-exa-molgen-patient - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-patient**

## Example Patient: mii-exa-molgen-patient

-------

**English**

-------

Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))

-------

| | |
| :--- | :--- |
| Deceased: | false |
| Other Ids: | * Gesetzliche Krankenversicherung/Z234567890 (use: official, )
* Private Krankenversicherung/123456 (use: secondary, )
 |
| Alt. Name: | Haffer (Name changed for Marriage) |
| Contact Detail | Anna-Louisa-Karsch Str. 2 Berlin DE-BE 10178 DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "mii-exa-molgen-patient",
  "identifier" : [{
    "use" : "usual",
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "MR"
      }]
    },
    "system" : "https://www.medizininformatik-initiative.de/fhir/sid/patienten",
    "value" : "42285243",
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
    "value" : "Z234567890",
    "assigner" : {
      "identifier" : {
        "use" : "official",
        "system" : "http://fhir.de/sid/arge-ik/iknr",
        "value" : "109519005"
      }
    }
  },
  {
    "use" : "secondary",
    "type" : {
      "coding" : [{
        "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
        "code" : "PKV"
      }]
    },
    "value" : "123456",
    "assigner" : {
      "display" : "Signal Iduna"
    }
  }],
  "name" : [{
    "use" : "official",
    "family" : "Van-der-Dussen",
    "_family" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/humanname-own-name",
        "valueString" : "Van-der-Dussen"
      }]
    },
    "given" : ["Maja", "Julia"],
    "prefix" : ["Prof. Dr. med."],
    "_prefix" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier",
        "valueCode" : "AC"
      }]
    }]
  },
  {
    "use" : "maiden",
    "family" : "Haffer"
  }],
  "gender" : "female",
  "birthDate" : "1968-09-19",
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
