# mii-sp-molgen-genomic-study-analysis-device - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-molgen-genomic-study-analysis-device**

## SearchParameter: mii-sp-molgen-genomic-study-analysis-device 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Device | *Version*:2026.0.4 |
| Active as of 2024-11-08 | *Computable Name*:SP_MII_MolGen_GenomicStudyAnalysis_Device |

 
Suchparameter für verwendetes Gerät in GenomicStudyAnalysis 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-molgen-genomic-study-analysis-device",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Device",
  "version" : "2026.0.4",
  "name" : "SP_MII_MolGen_GenomicStudyAnalysis_Device",
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
  "description" : "Suchparameter für verwendetes Gerät in GenomicStudyAnalysis",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "device",
  "base" : ["Procedure"],
  "type" : "reference",
  "expression" : "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device').value",
  "target" : ["Device"]
}

```
