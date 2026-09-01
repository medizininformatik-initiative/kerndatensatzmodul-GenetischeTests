# mii-sp-molgen-diagnostic-report-recommended-action - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-molgen-diagnostic-report-recommended-action**

## SearchParameter: mii-sp-molgen-diagnostic-report-recommended-action 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-RecommendedAction | *Version*:2026.0.4 |
| Active as of 2024-11-08 | *Computable Name*:SP_MII_MolGen_DiagnosticReport_RecommendedAction |

 
Suchparameter für empfohlene Maßnahmen in DiagnosticReport 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-molgen-diagnostic-report-recommended-action",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-RecommendedAction",
  "version" : "2026.0.4",
  "name" : "SP_MII_MolGen_DiagnosticReport_RecommendedAction",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-11-08",
  "publisher" : "Medizininformatik Initiative",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "Medizininformatik Initiative"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    },
    {
      "system" : "email",
      "value" : "info@medizininformatik-initiative.de"
    }]
  }],
  "description" : "Suchparameter für empfohlene Maßnahmen in DiagnosticReport",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "recommended-action",
  "base" : ["DiagnosticReport"],
  "type" : "reference",
  "expression" : "DiagnosticReport.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action').value",
  "target" : ["Task"]
}

```
