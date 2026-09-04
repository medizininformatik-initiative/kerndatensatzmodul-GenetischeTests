# MII PR MolGen Genomic Study Analysis - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII PR MolGen Genomic Study Analysis**

## Ressourcenprofil: MII PR MolGen Genomic Study Analysis 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2026-09-04 | *Maschinenlesbarer Name*:MII_PR_MolGen_GenomicStudyAnalysis |

 
Genomic Study Analysis ist ein Profil, das die Durchführung von konkreten molekulargenetischen Methoden und Assays beschreibt. Es ist vom GenomicStudyAnalysis-Profil aus dem Genomics Reporting IG abgeleitet. Die Darstellung über GenomicStudyAnalysis ist präziser als die vorherige UntersuchteRegion, da sie eine klare Repräsentation ermöglicht, welche Regionen mit welchem Assay untersucht wurden und welche Bereiche callable bzw. nicht-callable waren. Dies ermöglicht eine genauere Qualitätsbewertung und Interpretation der Ergebnisse, insbesondere bei negativen Befunden. 

-------

#### Beschreibung

Dieses Profil beschreibt eine Genomic Study Analysis als Procedure-Ressource zur detaillierten Dokumentation der Analyseschritte innerhalb einer genomischen Untersuchung. Es arbeitet in Verbindung mit dem GenomicStudy-Profil und folgt den Vorgaben des Clinical Genomics Reporting STU3.

GenomicStudyAnalysis erfasst spezifische Analyseparameter wie untersuchte Genomregionen, verwendete Referenzassemblies und Analysetools.

-------

Das Profil ist abgeleitet vom Profil [GenomicStudyAnalysis](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html) aus [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

-------

#### Profil

-------

#### Must Support Elemente

| | | |
| :--- | :--- | :--- |
| Procedure.extension:specimen | Referenz zur verwendeten Probe | Probeninformation.Probe |
| Procedure.extension:device | Verwendetes Analysegerät (Sequenzer, Software) | Methoden.Geräte / Software |
| Procedure.extension:method-type | Art der Analysemethode (z.B. Sequenzierung, PCR) | Methoden.Analysetyp |
| Procedure.extension:change-type | Untersuchte Variationstypen (SNV, CNV, etc.) | Methoden.Variationstypen |
| Procedure.extension:regions | Untersuchte genomische Regionen (Gene, Exons) | Methoden.Untersuchte Regionen |
| Procedure.extension:genome-build | Version des Referenzgenoms (z.B. GRCh38) | Methoden.Referenzgenom |
| Procedure.extension:focus | Fokus/Ziel der Analyse | Methoden.Analysefokus |
| Procedure.extension:title | Bezeichnung der Analyse | Methoden.Analysebezeichnung |
| Procedure.extension:metrics | Qualitätsmetriken (Coverage, Depth) | Methoden.Qualitätsmetriken |

-------

**Examples**

Beispiel 1: GenomicStudyAnalysis für Exom-Sequenzierung

-------

**Usages:**

* Examples for this Profile: [Procedure/mii-exa-molgen-genomic-study-analysis-braf](Procedure-mii-exa-molgen-genomic-study-analysis-braf.md), [Procedure/mii-exa-molgen-genomic-study-analysis-cornelia-de-lange](Procedure-mii-exa-molgen-genomic-study-analysis-cornelia-de-lange.md), [Procedure/mii-exa-molgen-genomic-study-analysis-trurisk-panel](Procedure-mii-exa-molgen-genomic-study-analysis-trurisk-panel.md), [Procedure/mii-exa-molgen-genomic-study-analysis-tso500-libprep](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-libprep.md)... Show 4 more, [Procedure/mii-exa-molgen-genomic-study-analysis-tso500-sequencing](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-sequencing.md), [Procedure/mii-exa-molgen-genomic-study-analysis-wes-bioinformatics](Procedure-mii-exa-molgen-genomic-study-analysis-wes-bioinformatics.md), [Procedure/mii-exa-molgen-genomic-study-analysis-wes-library-prep](Procedure-mii-exa-molgen-genomic-study-analysis-wes-library-prep.md) and [Procedure/mii-exa-molgen-genomic-study-analysis-wes-sequencing](Procedure-mii-exa-molgen-genomic-study-analysis-wes-sequencing.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-genomic-study-analysis.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [GenomicStudyAnalysis](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [GenomicStudyAnalysis](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html) 

** Summary **

Must-Support: 9 elements

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [GenomicStudyAnalysis](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html) 

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [GenomicStudyAnalysis](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html) 

** Summary **

Must-Support: 9 elements

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-molgen-genomic-study-analysis.csv), [Excel](../StructureDefinition-mii-pr-molgen-genomic-study-analysis.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-genomic-study-analysis.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-genomic-study-analysis",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_PR_MolGen_GenomicStudyAnalysis",
  "title" : "MII PR MolGen Genomic Study Analysis",
  "status" : "active",
  "date" : "2026-09-04T11:22:02+00:00",
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
  "description" : "Genomic Study Analysis ist ein Profil, das die Durchführung von konkreten molekulargenetischen Methoden und Assays beschreibt. Es ist vom GenomicStudyAnalysis-Profil aus dem Genomics Reporting IG abgeleitet. Die Darstellung über GenomicStudyAnalysis ist präziser als die vorherige UntersuchteRegion, da sie eine klare Repräsentation ermöglicht, welche Regionen mit welchem Assay untersucht wurden und welche Bereiche callable bzw. nicht-callable waren. Dies ermöglicht eine genauere Qualitätsbewertung und Interpretation der Ergebnisse, insbesondere bei negativen Befunden.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
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
  "baseDefinition" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure",
      "path" : "Procedure"
    },
    {
      "id" : "Procedure.extension:method-type",
      "path" : "Procedure.extension",
      "sliceName" : "method-type",
      "short" : "Analysemethode",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Analysemethode"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Art der durchgeführten Analysemethode wie z.B. Sequenzierung oder PCR oder Array-CGH",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Art der durchgeführten Analysemethode wie z.B. Sequenzierung oder PCR oder Array-CGH"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.extension:change-type",
      "path" : "Procedure.extension",
      "sliceName" : "change-type",
      "short" : "Untersuchte Variationstypen",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Untersuchte Variationstypen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Typen genetischer Veränderungen die mit dieser Analyse untersucht wurden wie z.B. SNV oder CNV oder Strukturvarianten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Typen genetischer Veränderungen die mit dieser Analyse untersucht wurden wie z.B. SNV oder CNV oder Strukturvarianten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.extension:genome-build",
      "path" : "Procedure.extension",
      "sliceName" : "genome-build",
      "short" : "Referenzgenom-Version",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenzgenom-Version"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Version des verwendeten Referenzgenoms wie z.B. GRCh38 oder hg19",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Version des verwendeten Referenzgenoms wie z.B. GRCh38 oder hg19"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.extension:title",
      "path" : "Procedure.extension",
      "sliceName" : "title",
      "short" : "Bezeichnung der Analyse",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Bezeichnung der Analyse"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kurze prägnante Bezeichnung oder Titel dieser spezifischen Analyse",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kurze prägnante Bezeichnung oder Titel dieser spezifischen Analyse"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.extension:focus",
      "path" : "Procedure.extension",
      "sliceName" : "focus",
      "short" : "Fokus der Analyse",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Fokus der Analyse"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Spezifischer Fokus oder Ziel dieser Analyse wie z.B. Referenz auf Krebserkrankung oder erbliche Erkrankung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Spezifischer Fokus oder Ziel dieser Analyse wie z.B. Referenz auf Krebserkrankung oder erbliche Erkrankung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.extension:specimen",
      "path" : "Procedure.extension",
      "sliceName" : "specimen",
      "short" : "Untersuchte Probe",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Untersuchte Probe"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zur Specimen-Ressource die die für diese Analyse verwendete Probe beschreibt",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zur Specimen-Ressource die die für diese Analyse verwendete Probe beschreibt"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.extension:metrics",
      "path" : "Procedure.extension",
      "sliceName" : "metrics",
      "short" : "Qualitätsmetriken",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Qualitätsmetriken"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Qualitätsmetriken der Analyse wie z.B. Coverage oder Depth oder Call-Rate",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Qualitätsmetriken der Analyse wie z.B. Coverage oder Depth oder Call-Rate"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.extension:regions",
      "path" : "Procedure.extension",
      "sliceName" : "regions",
      "short" : "Untersuchte genomische Regionen",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Untersuchte genomische Regionen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Komplexe Extension zur Spezifikation der genomischen Regionen - v.a. Gene aber theoretisch erweiterbar durch z.B. Exonangaben - die in dieser Analyse untersucht wurden. Angabe der untersuchten Regionen sowie optional Angabe der callable/non-callable Regions",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Komplexe Extension zur Spezifikation der genomischen Regionen - v.a. Gene aber theoretisch erweiterbar durch z.B. Exonangaben - die in dieser Analyse untersucht wurden. Angabe der untersuchten Regionen sowie optional Angabe der callable/non-callable Regions"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.extension:device",
      "path" : "Procedure.extension",
      "sliceName" : "device",
      "short" : "Verwendetes Analysegerät",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verwendetes Analysegerät"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Komplexe Extension mit Art des Gerätes und Referenz zum Device wie z.B. Sequenziergerät oder Library Preparation Kit oder bioinformatische Pipelines das für diese Analyse verwendet wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Komplexe Extension mit Art des Gerätes und Referenz zum Device wie z.B. Sequenziergerät oder Library Preparation Kit oder bioinformatische Pipelines das für diese Analyse verwendet wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    }]
  }
}

```
