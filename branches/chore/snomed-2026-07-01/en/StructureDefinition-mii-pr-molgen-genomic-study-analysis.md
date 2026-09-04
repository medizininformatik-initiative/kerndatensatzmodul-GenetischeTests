# MII PR MolGen Genomic Study Analysis - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII PR MolGen Genomic Study Analysis**

## Resource Profile: MII PR MolGen Genomic Study Analysis 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2026-09-04 | *Computable Name*:MII_PR_MolGen_GenomicStudyAnalysis |

 
Genomic Study Analysis ist ein Profil, das die Durchführung von konkreten molekulargenetischen Methoden und Assays beschreibt. Es ist vom GenomicStudyAnalysis-Profil aus dem Genomics Reporting IG abgeleitet. Die Darstellung über GenomicStudyAnalysis ist präziser als die vorherige UntersuchteRegion, da sie eine klare Repräsentation ermöglicht, welche Regionen mit welchem Assay untersucht wurden und welche Bereiche callable bzw. nicht-callable waren. Dies ermöglicht eine genauere Qualitätsbewertung und Interpretation der Ergebnisse, insbesondere bei negativen Befunden. 

-------

#### Description

This profile describes a Genomic Study Analysis as a Procedure resource for the detailed documentation of the analysis steps within a genomic investigation. It works in conjunction with the GenomicStudy profile and follows the requirements of Clinical Genomics Reporting STU3.

GenomicStudyAnalysis records specific analysis parameters such as the genome regions investigated, the reference assemblies used and the analysis tools.

-------

The profile is derived from the profile [GenomicStudyAnalysis](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html) of the [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

-------

#### Profile

-------

#### Must Support elements

| | | |
| :--- | :--- | :--- |
| Procedure.extension:specimen | Reference to the specimen used | Probeninformation.Probe |
| Procedure.extension:device | Analysis device used (sequencer, software) | Methoden.Geräte / Software |
| Procedure.extension:method-type | Type of analysis method (e.g. sequencing, PCR) | Methoden.Analysetyp |
| Procedure.extension:change-type | Types of variation investigated (SNV, CNV, etc.) | Methoden.Variationstypen |
| Procedure.extension:regions | Genomic regions investigated (genes, exons) | Methoden.Untersuchte Regionen |
| Procedure.extension:genome-build | Version of the reference genome (e.g. GRCh38) | Methoden.Referenzgenom |
| Procedure.extension:focus | Focus/target of the analysis | Methoden.Analysefokus |
| Procedure.extension:title | Designation of the analysis | Methoden.Analysebezeichnung |
| Procedure.extension:metrics | Quality metrics (coverage, depth) | Methoden.Qualitätsmetriken |

-------

**Examples**

Example 1: GenomicStudyAnalysis for exome sequencing

-------

**Usages:**

* Examples for this Profile: [Procedure/mii-exa-molgen-genomic-study-analysis-braf](Procedure-mii-exa-molgen-genomic-study-analysis-braf.md), [Procedure/mii-exa-molgen-genomic-study-analysis-cornelia-de-lange](Procedure-mii-exa-molgen-genomic-study-analysis-cornelia-de-lange.md), [Procedure/mii-exa-molgen-genomic-study-analysis-trurisk-panel](Procedure-mii-exa-molgen-genomic-study-analysis-trurisk-panel.md), [Procedure/mii-exa-molgen-genomic-study-analysis-tso500-libprep](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-libprep.md)... Show 4 more, [Procedure/mii-exa-molgen-genomic-study-analysis-tso500-sequencing](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-sequencing.md), [Procedure/mii-exa-molgen-genomic-study-analysis-wes-bioinformatics](Procedure-mii-exa-molgen-genomic-study-analysis-wes-bioinformatics.md), [Procedure/mii-exa-molgen-genomic-study-analysis-wes-library-prep](Procedure-mii-exa-molgen-genomic-study-analysis-wes-library-prep.md) and [Procedure/mii-exa-molgen-genomic-study-analysis-wes-sequencing](Procedure-mii-exa-molgen-genomic-study-analysis-wes-sequencing.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-genomic-study-analysis.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-molgen-genomic-study-analysis.csv), [Excel](../StructureDefinition-mii-pr-molgen-genomic-study-analysis.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-genomic-study-analysis.sch) 



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
  "date" : "2026-09-04T10:35:16+00:00",
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
