# mii-sp-molgen-genomic-study-analysis-specimen - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-molgen-genomic-study-analysis-specimen**

## SearchParameter: mii-sp-molgen-genomic-study-analysis-specimen 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Specimen | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2024-11-08 | *Maschinenlesbarer Name*:SP_MII_MolGen_GenomicStudyAnalysis_Specimen |

 
Finds analyses performed on a given specimen. The specimen sits in the genomic-study-analysis-specimen extension, so the base Procedure.specimen search parameter does not reach it. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-molgen-genomic-study-analysis-specimen",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Specimen",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "SP_MII_MolGen_GenomicStudyAnalysis_Specimen",
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
  "description" : "Finds analyses performed on a given specimen. The specimen sits in the genomic-study-analysis-specimen extension, so the base Procedure.specimen search parameter does not reach it.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "specimen",
  "base" : ["Procedure"],
  "type" : "reference",
  "expression" : "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen').value",
  "target" : ["Specimen"]
}

```
