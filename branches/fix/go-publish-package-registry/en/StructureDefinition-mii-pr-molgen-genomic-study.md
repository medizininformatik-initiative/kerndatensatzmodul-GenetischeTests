# MII PR MolGen Genomic Study - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII PR MolGen Genomic Study**

## Resource Profile: MII PR MolGen Genomic Study 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2026-09-03 | *Computable Name*:MII_PR_MolGen_GenomicStudy |

 
Genomic Study ist ein Profil, dass die Durchführung von übergeorndenten molekulargenetischen Untersuchungen (Studies) beschreibt. Einzelne Assays werden dann als GenomicStudyAnalysis abgebildet. Es ist vom GenomicStudy-Profils aus dem Genomics Reporting IG abgeleitet . 

-------

#### Description

This profile describes a Genomic Study as a Procedure resource for documenting the genomic investigation that was carried out. It replaces the deprecated UntersuchteRegion profile and follows the requirements of Clinical Genomics Reporting STU3.

GenomicStudy is used to record the metadata about the genomic analysis carried out, including the methods used, the regions investigated and the devices involved.

-------

The profile is derived from the profile [GenomicStudy](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study.html) of the [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

-------

#### Profile

-------

#### Must Support elements

| | | |
| :--- | :--- | :--- |
| Procedure.status | Status of the genetic study (e.g. completed, cancelled) | Weiteres.Berichtstatus |
| Procedure.code | Type of genomic investigation | Methoden.Untersuchungsart |
| Procedure.subject | Patient/subject of the investigation | Probeninformation.Patient |
| Procedure.encounter | Encounter context of the investigation | Probeninformation.Fall |
| Procedure.performed[x] | Point in time or period of performance | Methoden.Durchführungsdatum |
| Procedure.reasonReference | Request/indication for the genetic investigation | Anforderung.ServiceRequest |
| Procedure.extension:genomic-study-analysis | References to the individual GenomicStudyAnalysis resources | Methoden.Analyseschritte |

-------

**Examples**

Example 1: GenomicStudy for panel sequencing

-------

### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide rendered these examples inline on this page; the IG Publisher renders each one on its own page instead, so they are listed here as links, in the order the source had them and with the captions it gave them. Nothing was added or dropped.

* [`mii-exa-molgen-genomic-study-1`](Procedure-mii-exa-molgen-genomic-study-1.md) — Example 1: GenomicStudy für Panel-Sequenzierung

**Usages:**

* Examples for this Profile: [Procedure/mii-exa-molgen-genomic-study-1](Procedure-mii-exa-molgen-genomic-study-1.md), [Procedure/mii-exa-molgen-genomic-study-comprehensive-wes](Procedure-mii-exa-molgen-genomic-study-comprehensive-wes.md), [Procedure/mii-exa-molgen-genomic-study-cornelia-de-lange](Procedure-mii-exa-molgen-genomic-study-cornelia-de-lange.md), [Procedure/mii-exa-molgen-genomic-study-trurisk-panel](Procedure-mii-exa-molgen-genomic-study-trurisk-panel.md) and [Procedure/mii-exa-molgen-genomic-study-tso500](Procedure-mii-exa-molgen-genomic-study-tso500.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-genomic-study.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-molgen-genomic-study.csv), [Excel](../StructureDefinition-mii-pr-molgen-genomic-study.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-genomic-study.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-genomic-study",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_PR_MolGen_GenomicStudy",
  "title" : "MII PR MolGen Genomic Study",
  "status" : "active",
  "date" : "2026-09-03T11:31:01+00:00",
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
  "description" : "Genomic Study ist ein Profil, dass die Durchführung von übergeorndenten molekulargenetischen Untersuchungen (Studies) beschreibt. Einzelne Assays werden dann als GenomicStudyAnalysis abgebildet. Es ist vom GenomicStudy-Profils aus dem Genomics Reporting IG abgeleitet .",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "MII-KDS",
    "name" : "MII KDS Mapping"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure",
      "path" : "Procedure"
    },
    {
      "id" : "Procedure.extension:genomic-study-analysis",
      "path" : "Procedure.extension",
      "sliceName" : "genomic-study-analysis",
      "short" : "Durchgeführte Analysen",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Durchgeführte Analysen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenzen zu den einzelnen GenomicStudyAnalysis-Ressourcen die die spezifischen Analysen und Assays dieser Studie beschreiben",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenzen zu den einzelnen GenomicStudyAnalysis-Ressourcen die die spezifischen Analysen und Assays dieser Studie beschreiben"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.status",
      "path" : "Procedure.status",
      "short" : "Status der genetischen Studie",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Status der genetischen Studie"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Aktueller Status der genetischen Studie wie z.B. registered oder completed oder cancelled",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Aktueller Status der genetischen Studie wie z.B. registered oder completed oder cancelled"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.code",
      "path" : "Procedure.code",
      "short" : "Art der genomischen Untersuchung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Art der genomischen Untersuchung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Art der genomischen oder molekulargenetischen Untersuchung die durchgeführt wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Art der genomischen oder molekulargenetischen Untersuchung die durchgeführt wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.subject",
      "path" : "Procedure.subject",
      "short" : "Patient/Proband der Untersuchung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Patient/Proband der Untersuchung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zum Patienten oder Probanden für den die genetische Studie durchgeführt wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zum Patienten oder Probanden für den die genetische Studie durchgeführt wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.encounter",
      "path" : "Procedure.encounter",
      "short" : "Fallbezug der Untersuchung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Fallbezug der Untersuchung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zum Behandlungsfall in dessen Kontext die genetische Studie durchgeführt wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zum Behandlungsfall in dessen Kontext die genetische Studie durchgeführt wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.performed[x]",
      "path" : "Procedure.performed[x]",
      "short" : "Zeitpunkt oder Zeitraum der Durchführung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Zeitpunkt oder Zeitraum der Durchführung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zeitpunkt oder Zeitraum in dem die genetische Studie durchgeführt wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Zeitpunkt oder Zeitraum in dem die genetische Studie durchgeführt wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.reasonReference",
      "path" : "Procedure.reasonReference",
      "short" : "Anforderung/Indikation für die genetische Untersuchung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Anforderung/Indikation für die genetische Untersuchung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zur ServiceRequest-Ressource die die Anforderung für diese genetische Studie darstellt",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zur ServiceRequest-Ressource die die Anforderung für diese genetische Studie darstellt"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    }]
  }
}

```
