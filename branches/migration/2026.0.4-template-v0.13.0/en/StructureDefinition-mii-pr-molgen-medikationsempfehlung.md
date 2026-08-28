# MII PR MolGen Medikationsempfehlung - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII PR MolGen Medikationsempfehlung**

## Resource Profile: MII PR MolGen Medikationsempfehlung 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung | *Version*:2026.0.4 |
| Active as of 2026-08-28 | *Computable Name*:MII_PR_MolGen_Medikationsempfehlung |

 
Das Profil dieser Task Ressource dient dazu, auf der Grundlage der genetischen Ergebnisse medikamanetöse Maßnahmen vorzuschlagen. 

-------

#### Description

The profile of this Task resource serves to propose medication-based measures on the basis of the genetic results.

-------

The profile is derived from the profile [Medication Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-medication-recommendation.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

-------

#### Profile

-------

| | |
| :--- | :--- |
| Task | Interpretation.Empfehlungen |

-------

**Search parameters**

The following search parameters are relevant for the Pathologie-Befund (pathology report) module, also in combination:

1. The search parameter `_id` MUST be supported:Examples:`GET [base]/Task?_id=1234`Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).
1. The search parameter "_profile" MUST be supported:Examples:`GET [base]/Task?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung`Usage notes: Further information on searching by "_profile" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).
1. The search parameter "code" MUST be supported:Examples:`GET [base]/Task?code=http://loinc.org|LA26421-0`Usage notes: Further information on searching by "code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "based-on" MUST be supported:Examples:`GET [base]/Task?based-on=ServiceRequest/12345`Usage notes: Further information on searching by "based-on" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "subject" MUST be supported:Examples:`GET [base]/Task?subject=Patient/example-mii-molgen-patient`Usage notes: Further information on searching by "subject" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "requestor" MUST be supported:Examples:`GET [base]/Task?requestor=Practioner/example-mii-molgen-practitioner-physician`Usage notes: Further information on searching by "requestor" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "reason-code" MUST be supported:Examples:`GET [base]/Task?reason-code=http://snomed.info/sct|447886005`Usage notes: Further information on searching by "reason-code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

1. The search parameter "reason-reference" MUST be supported:Examples:`GET [base]/Task?reason-reference=Observation/12345`Usage notes: Further information on searching by "reason-reference" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "encounter" MUST be supported:Examples:`GET [base]/Task?encounter=Encounter/12345`Usage notes: Further information on searching by "encounter" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

-------

**Examples**

Example 1: Medication recommendation based on a detected BRAF variant

-------

### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide rendered these examples inline on this page; the IG Publisher renders each one on its own page instead, so they are listed here as links, in the order the source had them and with the captions it gave them. Nothing was added or dropped.

* [`mii-exa-molgen-medikationsempfehlung-1`](Task-mii-exa-molgen-medikationsempfehlung-1.md) — Example 1: Medikationsempfehlung basierend auf detektierter BRAF Variant

**Usages:**

* Refer to this Profile: [MII EX MolGen Empfohlene Maßnahme](StructureDefinition-mii-ex-molgen-empfohlene-massnahme.md)
* Examples for this Profile: [Task/mii-exa-molgen-medikationsempfehlung-1](Task-mii-exa-molgen-medikationsempfehlung-1.md) and [Task/mii-exa-molgen-medikationsempfehlung-fgfr2-fusion](Task-mii-exa-molgen-medikationsempfehlung-fgfr2-fusion.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-medikationsempfehlung.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-molgen-medikationsempfehlung.csv), [Excel](../StructureDefinition-mii-pr-molgen-medikationsempfehlung.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-medikationsempfehlung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-medikationsempfehlung",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung",
  "version" : "2026.0.4",
  "name" : "MII_PR_MolGen_Medikationsempfehlung",
  "title" : "MII PR MolGen Medikationsempfehlung",
  "status" : "active",
  "date" : "2026-08-28T15:16:36+00:00",
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
  "description" : "Das Profil dieser Task Ressource dient dazu, auf der Grundlage der genetischen Ergebnisse medikamanetöse Maßnahmen vorzuschlagen.",
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
  "type" : "Task",
  "baseDefinition" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/medication-recommendation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Task",
      "path" : "Task",
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1724",
        "comment" : "Empfehlungen (Therapie, Allg.)"
      }]
    },
    {
      "id" : "Task.status",
      "path" : "Task.status",
      "short" : "Status",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Status der Medikationsempfehlung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Status der Medikationsempfehlung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Task.intent",
      "path" : "Task.intent",
      "short" : "Absicht",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Absicht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Absicht der Aufgabe wie z.B. Vorschlag",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Absicht der Aufgabe wie z.B. Vorschlag"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Task.code",
      "path" : "Task.code",
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
      "definition" : "Code der Medikationsempfehlung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Code der Medikationsempfehlung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Task.for",
      "path" : "Task.for",
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
      "definition" : "Der Patient für den die Medikation empfohlen wird",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Patient für den die Medikation empfohlen wird"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.encounter",
      "path" : "Task.encounter",
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
      "definition" : "Der Kontakt in dessen Rahmen die Empfehlung ausgesprochen wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Kontakt in dessen Rahmen die Empfehlung ausgesprochen wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Task.reasonCode",
      "path" : "Task.reasonCode",
      "short" : "Begründung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Begründung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierte Begründung für die Medikationsempfehlung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierte Begründung für die Medikationsempfehlung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Task.reasonReference",
      "path" : "Task.reasonReference",
      "short" : "Referenz zur Begründung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zur Begründung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zur therapeutischen Implikation die diese Empfehlung begründet",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zur therapeutischen Implikation die diese Empfehlung begründet"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation"]
      }],
      "mustSupport" : true
    }]
  }
}

```
