# MII PR MolGen Molekulare Konsequenz - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII PR MolGen Molekulare Konsequenz**

## Resource Profile: MII PR MolGen Molekulare Konsequenz 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekulare-konsequenz | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2026-09-04 | *Computable Name*:MII_PR_MolGen_MolekulareKonsequenz |

 
Dieses Profil beschreibt den Zusammenhang von bestimmten Varianten, Haplotypen oder Genotypen und bestimmten Konsequenzen auf molekularer Ebene. 

-------

#### Description

This profile describes the molecular consequences of genetic variants. It is a new profile in STU3 that enables the downstream description of genetic changes and that was split out of the Variante profile.

The MolekulareKonsequenz profile focuses on the functional effects of variants, whereas the Variante profile concentrates on the description of the variant itself.

-------

The profile is derived from the profile [MolecularConsequence](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-consequence.html) of the [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

-------

#### Profile

-------

| FHIR element | Logical data set | |—|—| | Observation.code | Ergebnisse.Veränderungen.Mutationskonsequenz (funktionell) | | Observation.subject | Probeninformation.Patient | | Observation.derivedFrom | Referenz zur Variante | | Observation.component:functional-effect | Ergebnisse.Veränderungen.Mutationskonsequenz (funktionell) | | Observation.component:feature-consequence | Molekulare Auswirkungen auf Features | | Observation.status | Weiteres.Berichtstatus |

-------

**Examples**

Example 1: MolekulareKonsequenz for the BRAF variant

-------

Example 2: MolekulareKonsequenz for the NIPBL variant

-------

### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide rendered these examples inline on this page; the IG Publisher renders each one on its own page instead, so they are listed here as links, in the order the source had them and with the captions it gave them. Nothing was added or dropped.

* [`mii-exa-molgen-molekulare-konsequenz-1`](Observation-mii-exa-molgen-molekulare-konsequenz-1.md) — Example 1: MolekulareKonsequenz für BRAF-Variant
* [`mii-exa-molgen-molekulare-konsequenz-2`](Observation-mii-exa-molgen-molekulare-konsequenz-2.md) — Example 2: MolekulareKonsequenz für NIPBL-Variant

**Usages:**

* Examples for this Profile: [Observation/mii-exa-molgen-molekulare-konsequenz-1](Observation-mii-exa-molgen-molekulare-konsequenz-1.md), [Observation/mii-exa-molgen-molekulare-konsequenz-2](Observation-mii-exa-molgen-molekulare-konsequenz-2.md), [Observation/mii-exa-molgen-molekulare-konsequenz-brca1](Observation-mii-exa-molgen-molekulare-konsequenz-brca1.md) and [Observation/mii-exa-molgen-molekulare-konsequenz-cnv-4](Observation-mii-exa-molgen-molekulare-konsequenz-cnv-4.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-molekulare-konsequenz.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-molgen-molekulare-konsequenz.csv), [Excel](../StructureDefinition-mii-pr-molgen-molekulare-konsequenz.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-molekulare-konsequenz.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-molekulare-konsequenz",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekulare-konsequenz",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_PR_MolGen_MolekulareKonsequenz",
  "title" : "MII PR MolGen Molekulare Konsequenz",
  "status" : "active",
  "date" : "2026-09-04T06:24:08+00:00",
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
  "description" : "Dieses Profil beschreibt den Zusammenhang von bestimmten Varianten, Haplotypen oder Genotypen und bestimmten Konsequenzen auf molekularer Ebene.",
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
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-consequence",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.extension:workflow-relatedArtifact",
      "path" : "Observation.extension",
      "sliceName" : "workflow-relatedArtifact",
      "short" : "Verknüpfte Artefakte",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verknüpfte Artefakte"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Verknüpfte Literatur oder andere Artefakte wie Zitationen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verknüpfte Literatur oder andere Artefakte wie Zitationen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.category",
      "path" : "Observation.category",
      "short" : "Kategorie",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kategorie"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Klassifizierung der Beobachtungsart",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Klassifizierung der Beobachtungsart"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "Code",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Code zur Identifizierung der molekularen Konsequenz",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Code zur Identifizierung der molekularen Konsequenz"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "short" : "Patient",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Patient auf den sich die Beobachtung bezieht",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Patient auf den sich die Beobachtung bezieht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient",
        "http://hl7.org/fhir/StructureDefinition/Group"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.encounter",
      "path" : "Observation.encounter",
      "short" : "Kontakt",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kontakt"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Kontakt in dessen Rahmen die Beobachtung gemacht wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Kontakt in dessen Rahmen die Beobachtung gemacht wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "short" : "Zeitpunkt der Beobachtung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Zeitpunkt der Beobachtung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Klinisch relevanter Zeitpunkt der Beobachtung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Klinisch relevanter Zeitpunkt der Beobachtung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.issued",
      "path" : "Observation.issued",
      "short" : "Freigabedatum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Freigabedatum"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Datum und Uhrzeit der Freigabe",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Datum und Uhrzeit der Freigabe"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.derivedFrom",
      "path" : "Observation.derivedFrom",
      "short" : "Abgeleitet von",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Abgeleitet von"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenzen zu den Varianten von denen diese Konsequenz abgeleitet ist",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenzen zu den Varianten von denen diese Konsequenz abgeleitet ist"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.derivedFrom:variant",
      "path" : "Observation.derivedFrom",
      "sliceName" : "variant",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"]
      }]
    },
    {
      "id" : "Observation.component",
      "path" : "Observation.component",
      "short" : "Komponenten",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Komponenten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Einzelne Komponenten der molekularen Konsequenz",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Einzelne Komponenten der molekularen Konsequenz"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:conclusion-string",
      "path" : "Observation.component",
      "sliceName" : "conclusion-string",
      "short" : "Schlussfolgerung - Text",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Schlussfolgerung - Text"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Textuelle Zusammenfassung der molekularen Konsequenz",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Textuelle Zusammenfassung der molekularen Konsequenz"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:evidence-level",
      "path" : "Observation.component",
      "sliceName" : "evidence-level",
      "short" : "Evidenzlevel",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Evidenzlevel"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Evidenzlevel für die molekulare Konsequenz",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Evidenzlevel für die molekulare Konsequenz"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:clinical-significance",
      "path" : "Observation.component",
      "sliceName" : "clinical-significance",
      "short" : "Klinische Signifikanz",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Klinische Signifikanz"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die klinische Signifikanz der Variante",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die klinische Signifikanz der Variante"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:functional-effect",
      "path" : "Observation.component",
      "sliceName" : "functional-effect",
      "short" : "Funktioneller Effekt",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Funktioneller Effekt"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der funktionelle Effekt der Variante auf das Genprodukt",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der funktionelle Effekt der Variante auf das Genprodukt"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    }]
  }
}

```
