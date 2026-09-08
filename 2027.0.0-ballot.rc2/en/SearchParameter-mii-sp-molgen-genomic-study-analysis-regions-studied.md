# mii-sp-molgen-genomic-study-analysis-regions-studied - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-sp-molgen-genomic-study-analysis-regions-studied**

## SearchParameter: mii-sp-molgen-genomic-study-analysis-regions-studied 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-RegionsStudied | *Version*:2027.0.0-ballot.rc2 |
| Active as of 2024-11-08 | *Computable Name*:SP_MII_MolGen_GenomicStudyAnalysis_RegionsStudied |

 
Finds analyses that actually examined a given gene or genomic region. This is what distinguishes a variant that was not found from a region that was never examined: without it a query cannot tell the two apart. The value sits in the studied sub-extension of genomic-study-analysis-regions. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-molgen-genomic-study-analysis-regions-studied",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-RegionsStudied",
  "version" : "2027.0.0-ballot.rc2",
  "name" : "SP_MII_MolGen_GenomicStudyAnalysis_RegionsStudied",
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
  "description" : "Finds analyses that actually examined a given gene or genomic region. This is what distinguishes a variant that was not found from a region that was never examined: without it a query cannot tell the two apart. The value sits in the studied sub-extension of genomic-study-analysis-regions.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "regions-studied",
  "base" : ["Procedure"],
  "type" : "token",
  "expression" : "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions').extension.where(url='studied').value"
}

```
