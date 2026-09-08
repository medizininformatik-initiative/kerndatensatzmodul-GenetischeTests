# Anforderung Whole Exome Sequencing - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Anforderung Whole Exome Sequencing**

## Example ServiceRequest: Anforderung Whole Exome Sequencing

-------

**English**

-------

Profile: [MII PR MolGen Anforderung genetischer Test](StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.md) version: 2027.0.0-ballot.rc1

**status**: Completed

**intent**: Order

**code**: Whole exome sequence analysis in Blood or Tissue by Molecular genetics method

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**authoredOn**: 2024-01-10

**requester**: [Practitioner Klaus Müller ](Practitioner-mii-exa-molgen-practitioner-ordering.md)

**reasonCode**: Unklare Entwicklungsverzögerung mit Dysmorphiezeichen, V.a. genetisches Syndrom nach unauffälliger Chromosomenanalyse und Array-CGH



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "mii-exa-molgen-anforderung-wes",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test|2027.0.0-ballot.rc1"]
  },
  "status" : "completed",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "86205-2",
      "display" : "Whole exome sequence analysis in Blood or Tissue by Molecular genetics method"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "authoredOn" : "2024-01-10",
  "requester" : {
    "reference" : "Practitioner/mii-exa-molgen-practitioner-ordering"
  },
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "224958001",
      "display" : "Global developmental delay"
    }],
    "text" : "Unklare Entwicklungsverzögerung mit Dysmorphiezeichen, V.a. genetisches Syndrom nach unauffälliger Chromosomenanalyse und Array-CGH"
  }]
}

```
