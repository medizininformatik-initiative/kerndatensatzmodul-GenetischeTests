# mii-exa-molgen-patient-srcc - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-patient-srcc**

## Beispiel Patient: mii-exa-molgen-patient-srcc

-------

**German**

-------

Anonymous Patient Male, DoB: 1986-01 ( pseudonymized (use: usual, ))

-------

| | |
| :--- | :--- |
| Deceased: | false |
| Contact Detail | 10 DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "mii-exa-molgen-patient-srcc",
  "identifier" : [{
    "use" : "usual",
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
        "code" : "PSEUDED"
      }]
    },
    "system" : "https://www.charite.de/fhir/sid/pseudonym",
    "value" : "66036015"
  }],
  "gender" : "male",
  "birthDate" : "1986-01",
  "deceasedBoolean" : false,
  "address" : [{
    "type" : "both",
    "postalCode" : "10",
    "country" : "DE"
  }]
}

```
