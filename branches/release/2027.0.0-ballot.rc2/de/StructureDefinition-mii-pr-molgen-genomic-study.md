# MII PR MolGen Genomic Study - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII PR MolGen Genomic Study**

## Ressourcenprofil: MII PR MolGen Genomic Study 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study | *Version*:2027.0.0-ballot.rc2 |
| Active Stand: 2026-09-04 | *Maschinenlesbarer Name*:MII_PR_MolGen_GenomicStudy |

 
Genomic Study ist ein Profil, dass die Durchführung von übergeorndenten molekulargenetischen Untersuchungen (Studies) beschreibt. Einzelne Assays werden dann als GenomicStudyAnalysis abgebildet. Es ist vom GenomicStudy-Profils aus dem Genomics Reporting IG abgeleitet . 

-------

#### Beschreibung

Dieses Profil beschreibt eine Genomic Study als Procedure-Ressource zur Dokumentation der durchgeführten genomischen Untersuchung. Es ersetzt das veraltete UntersuchteRegion-Profil und folgt den Vorgaben des Clinical Genomics Reporting STU3.

GenomicStudy dient zur Erfassung der Metadaten über die durchgeführte genomische Analyse, einschließlich der verwendeten Methoden, untersuchten Regionen und beteiligten Geräte.

-------

Das Profil ist abgeleitet vom Profil [GenomicStudy](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study.html) aus [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

-------

#### Profil

-------

#### Must Support Elemente

| | | |
| :--- | :--- | :--- |
| Procedure.status | Status der genetischen Studie (z.B. completed, cancelled) | Weiteres.Berichtstatus |
| Procedure.code | Art der genomischen Untersuchung | Methoden.Untersuchungsart |
| Procedure.subject | Patient/Proband der Untersuchung | Probeninformation.Patient |
| Procedure.encounter | Fallbezug der Untersuchung | Probeninformation.Fall |
| Procedure.performed[x] | Zeitpunkt oder Zeitraum der Durchführung | Methoden.Durchführungsdatum |
| Procedure.reasonReference | Anforderung/Indikation für die genetische Untersuchung | Anforderung.ServiceRequest |
| Procedure.extension:genomic-study-analysis | Referenzen zu den einzelnen GenomicStudyAnalysis-Ressourcen | Methoden.Analyseschritte |

-------

**Examples**

Beispiel 1: GenomicStudy für Panel-Sequenzierung

-------

### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde nichts ergänzt und nichts weggelassen.

* [`mii-exa-molgen-genomic-study-1`](Procedure-mii-exa-molgen-genomic-study-1.md) — Beispiel 1: GenomicStudy für Panel-Sequenzierung

**Usages:**

* Examples for this Profile: [Procedure/mii-exa-molgen-genomic-study-1](Procedure-mii-exa-molgen-genomic-study-1.md), [Procedure/mii-exa-molgen-genomic-study-comprehensive-wes](Procedure-mii-exa-molgen-genomic-study-comprehensive-wes.md), [Procedure/mii-exa-molgen-genomic-study-cornelia-de-lange](Procedure-mii-exa-molgen-genomic-study-cornelia-de-lange.md), [Procedure/mii-exa-molgen-genomic-study-trurisk-panel](Procedure-mii-exa-molgen-genomic-study-trurisk-panel.md) and [Procedure/mii-exa-molgen-genomic-study-tso500](Procedure-mii-exa-molgen-genomic-study-tso500.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-genomic-study.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [GenomicStudy](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study.html) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [GenomicStudy](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study.html) 

** Summary **

Must-Support: 7 elements

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [GenomicStudy](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study.html) 

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [GenomicStudy](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study.html) 

** Summary **

Must-Support: 7 elements

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-molgen-genomic-study.csv), [Excel](../StructureDefinition-mii-pr-molgen-genomic-study.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-genomic-study.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-genomic-study",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study",
  "version" : "2027.0.0-ballot.rc2",
  "name" : "MII_PR_MolGen_GenomicStudy",
  "title" : "MII PR MolGen Genomic Study",
  "status" : "active",
  "date" : "2026-09-04T13:46:18+00:00",
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
