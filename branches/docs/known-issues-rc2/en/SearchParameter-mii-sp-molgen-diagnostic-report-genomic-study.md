# mii-sp-molgen-diagnostic-report-genomic-study - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-molgen-diagnostic-report-genomic-study**

## SearchParameter: mii-sp-molgen-diagnostic-report-genomic-study 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-GenomicStudy | *Version*:2027.0.0-ballot.rc2 |
| Active as of 2024-11-08 | *Computable Name*:SP_MII_MolGen_DiagnosticReport_GenomicStudy |

 
Finds the reports produced by a given genomic study, which is the link from the clinical report back to the investigation behind it. The reference sits in the genomic-study-reference extension; DiagnosticReport has no base search parameter for it. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-molgen-diagnostic-report-genomic-study",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-GenomicStudy",
  "version" : "2027.0.0-ballot.rc2",
  "name" : "SP_MII_MolGen_DiagnosticReport_GenomicStudy",
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
  "description" : "Finds the reports produced by a given genomic study, which is the link from the clinical report back to the investigation behind it. The reference sits in the genomic-study-reference extension; DiagnosticReport has no base search parameter for it.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "genomic-study",
  "base" : ["DiagnosticReport"],
  "type" : "reference",
  "expression" : "DiagnosticReport.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-reference').value",
  "target" : ["Procedure"]
}

```
