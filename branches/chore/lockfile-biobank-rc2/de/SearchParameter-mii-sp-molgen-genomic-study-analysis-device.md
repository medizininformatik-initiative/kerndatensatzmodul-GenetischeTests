# mii-sp-molgen-genomic-study-analysis-device - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-sp-molgen-genomic-study-analysis-device**

## SearchParameter: mii-sp-molgen-genomic-study-analysis-device 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Device | *Version*:2027.0.0-ballot.rc2 |
| Active Stand: 2024-11-08 | *Maschinenlesbarer Name*:SP_MII_MolGen_GenomicStudyAnalysis_Device |

 
Finds analyses run on a given sequencer or analytical device, for tracing results back to the instrument that produced them. The device sits in the genomic-study-analysis-device extension, not in Procedure. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "mii-sp-molgen-genomic-study-analysis-device",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Device",
  "version" : "2027.0.0-ballot.rc2",
  "name" : "SP_MII_MolGen_GenomicStudyAnalysis_Device",
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
  "description" : "Finds analyses run on a given sequencer or analytical device, for tracing results back to the instrument that produced them. The device sits in the genomic-study-analysis-device extension, not in Procedure.",
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
