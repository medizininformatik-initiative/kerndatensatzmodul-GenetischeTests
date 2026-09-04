# mii-sp-molgen-diagnostic-report-recommended-action - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-molgen-diagnostic-report-recommended-action**

## SearchParameter: mii-sp-molgen-diagnostic-report-recommended-action 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-RecommendedAction | *Version*:2027.0.0-ballot.rc2 |
| Active Stand: 2024-11-08 | *Maschinenlesbarer Name*:SP_MII_MolGen_DiagnosticReport_RecommendedAction |

 
Finds the reports that recommend a given follow-up action, such as a confirmatory test or a therapy recommendation. The reference sits in the recommended-action extension and is not reachable through DiagnosticReport.result. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-molgen-diagnostic-report-recommended-action",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-RecommendedAction",
  "version" : "2027.0.0-ballot.rc2",
  "name" : "SP_MII_MolGen_DiagnosticReport_RecommendedAction",
  "status" : "active",
  "experimental" : false,
  "date" : "2024-11-08",
  "publisher" : "Medizininformatik-Initiative",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "Medizininformatik-Initiative"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "Medizininformatik-Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    },
    {
      "system" : "email",
      "value" : "info@medizininformatik-initiative.de"
    }]
  }],
  "description" : "Finds the reports that recommend a given follow-up action, such as a confirmatory test or a therapy recommendation. The reference sits in the recommended-action extension and is not reachable through DiagnosticReport.result.",
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
