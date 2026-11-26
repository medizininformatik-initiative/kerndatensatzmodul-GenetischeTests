# mii-exa-molgen-patient-2 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-patient-2**

## Beispiel Patient: mii-exa-molgen-patient-2

-------

**German**

-------

Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Krankenaktennummer (use: usual, ))

-------

| | |
| :--- | :--- |
| Deceased: | false |
| Other Id: | Gesetzliche Krankenversicherung/Z900211002 (use: official, ) |
| Contact Detail | Anna-Louisa-Karsch Str. 2 Berlin DE-BE 10178 DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "mii-exa-molgen-patient-2",
  "identifier" : [{
    "use" : "usual",
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "MR"
      }]
    },
    "system" : "https://www.charite.de/fhir/sid/patienten",
    "value" : "146314909",
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
    "value" : "Z900211002",
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
    "family" : "Müller",
    "_family" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/humanname-own-name",
        "valueString" : "Müller"
      }]
    },
    "given" : ["Melanie", "Marie"]
  }],
  "gender" : "female",
  "birthDate" : "2021-09-19",
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
