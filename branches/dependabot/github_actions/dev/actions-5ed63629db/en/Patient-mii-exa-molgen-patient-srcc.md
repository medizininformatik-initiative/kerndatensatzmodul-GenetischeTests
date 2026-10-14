# mii-exa-molgen-patient-srcc - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-patient-srcc**

## Example Patient: mii-exa-molgen-patient-srcc

-------

**English**

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
