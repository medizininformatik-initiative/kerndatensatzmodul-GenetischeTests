# mii-exa-molgen-phenotypic-feature-1 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-phenotypic-feature-1**

## Beispiel Observation: mii-exa-molgen-phenotypic-feature-1

-------

**German**

-------

**status**: Final

**category**: Exam

**code**: Long eyelashes

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**effective**: 2022-03-13 09:30:00+0100

**performer**: [Practitioner Dr. Linda Rubens(official)](Practitioner-mii-exa-molgen-practitioner-physician.md)

**value**: Present



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-phenotypic-feature-1",
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "exam"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://human-phenotype-ontology.org",
      "code" : "HP:0000527",
      "display" : "Long eyelashes"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "effectiveDateTime" : "2022-03-13T09:30:00+01:00",
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
  }],
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA9633-4",
      "display" : "Present"
    }]
  }
}

```
