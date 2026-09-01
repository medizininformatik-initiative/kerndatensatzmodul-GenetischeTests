# Empfohlene Folgemaßnahme bei BRCA1 Variante - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Empfohlene Folgemaßnahme bei BRCA1 Variante**

## Example Task: Empfohlene Folgemaßnahme bei BRCA1 Variante

-------

**English**

-------

Profiles: [MII PR MolGen Empfohlene Folgemaßnahme](StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.md) version: 2026.0.4, [Followup Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-followup-recommendation.html) version: 3.0.0

**basedOn**: [ServiceRequest Molecular genetic test (procedure)](ServiceRequest-mii-exa-molgen-anforderung-trurisk-panel.md)

**status**: Requested

**intent**: proposal

**code**: Genetic counseling recommended

**description**: Eine genetische Beratung hinsichtlich einer gezielten Testung leiblicher Familienmitglieder wird empfohlen.

**for**: [Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient-brca1.md)



## Resource Content

```json
{
  "resourceType" : "Task",
  "id" : "mii-exa-molgen-folgemassnahme-brca1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme|2026.0.4",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation|3.0.0"]
  },
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-trurisk-panel"
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
  "description" : "Eine genetische Beratung hinsichtlich einer gezielten Testung leiblicher Familienmitglieder wird empfohlen.",
  "for" : {
    "reference" : "Patient/mii-exa-molgen-patient-brca1"
  }
}

```
