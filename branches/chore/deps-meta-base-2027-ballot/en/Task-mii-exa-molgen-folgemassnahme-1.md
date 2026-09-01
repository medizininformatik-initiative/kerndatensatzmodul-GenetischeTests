# BRAF Empfohlene Folgemaßnahme - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BRAF Empfohlene Folgemaßnahme**

## Example Task: BRAF Empfohlene Folgemaßnahme

-------

**English**

-------

Profiles: [MII PR MolGen Empfohlene Folgemaßnahme](StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.md) version: 2026.0.4, [Followup Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-followup-recommendation.html) version: 3.0.0

**basedOn**: [servicerequest/example](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/modul-meta/servicerequest/example)

**status**: Requested

**intent**: proposal

**code**: Genetic counseling recommended

**description**: Genetische Beratung empfohlen mit Dr. Rosalind Franklin

**for**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**reasonReference**: [Observation Therapeutic Implication](Observation-mii-exa-molgen-therapeutische-implikation-1.md)



## Resource Content

```json
{
  "resourceType" : "Task",
  "id" : "mii-exa-molgen-folgemassnahme-1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme|2026.0.4",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation|3.0.0"]
  },
  "basedOn" : [{
    "reference" : "servicerequest/example"
  }],
  "status" : "requested",
  "intent" : "proposal",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA14020-4",
      "display" : "Genetic counseling recommended"
    }]
  },
  "description" : "Genetische Beratung empfohlen mit Dr. Rosalind Franklin",
  "for" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "reasonReference" : {
    "reference" : "Observation/mii-exa-molgen-therapeutische-implikation-1"
  }
}

```
