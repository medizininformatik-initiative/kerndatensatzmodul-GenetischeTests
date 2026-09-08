# mii-exa-molgen-patient-fgfr2-fusion - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-patient-fgfr2-fusion**

## Example Patient: mii-exa-molgen-patient-fgfr2-fusion

-------

**English**

-------

Anonymous Patient Female, DoB: 1964-05 ( pseudonymized (use: usual, ))

-------

| | |
| :--- | :--- |
| Deceased: | false |
| Contact Detail | 10 DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "mii-exa-molgen-patient-fgfr2-fusion",
  "identifier" : [{
    "use" : "usual",
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
        "code" : "PSEUDED"
      }]
    },
    "system" : "https://www.charite.de/fhir/sid/pseudonym",
    "value" : "3337167192"
  }],
  "gender" : "female",
  "birthDate" : "1964-05",
  "deceasedBoolean" : false,
  "address" : [{
    "type" : "both",
    "postalCode" : "10",
    "country" : "DE"
  }]
}

```
