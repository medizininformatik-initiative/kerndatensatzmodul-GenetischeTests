# MII PR MolGen Therapeutische Implikation - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII PR MolGen Therapeutische Implikation**

## Resource Profile: MII PR MolGen Therapeutische Implikation 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation | *Version*:2026.0.4 |
| Active as of 2026-09-01 | *Computable Name*:MII_PR_MolGen_TherapeutischeImplikation |

 
Dieses Profil beschreibt den möglichen Einfluss genetischer Merkmale auf eine medikamentöse oder nicht-medikamentöse Therapie. 

-------

#### Description

The profile describes the possible influence of genetic characteristics on a drug-based or non-drug-based therapy.

-------

The profile is derived from the profile [Therapeutic Implication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-therapeutic-implication.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

-------

#### Profile

-------

| | |
| :--- | :--- |
| Observation | Interpretation.Empfehlungen |
| Observation.component:evidence-level | Interpretation.Clinical Annotation Level Of Evidence |
| Observation.component:conclusion-string | Interpretation.Zusammenfassung |
| Observation.component:medication-assessed | Interpretation.Therapieempfehlung - Medikamentenbewertung |
| Observation.subject | Probeninformationen.Patient |
| Observation.performer | Probeninformationen.Weiteress.Labor / Institution/ Ansprechpartner |

-------

**Search parameters**

The following search parameters are relevant for the Pathologie-Befund (pathology report) module, also in combination:

1. The search parameter `_id` MUST be supported:Examples:`GET [base]/Observation?_id=example-mii-molgen-variante-1`Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).
1. The search parameter "_profile" MUST be supported:Examples:`GET [base]/Observation?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante`Usage notes: Further information on searching by "_profile" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).
1. The search parameter "code" MUST be supported:Examples:`GET [base]/Observation?code=http://loinc.org|69548-6`Usage notes: Further information on searching by "code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "subject" MUST be supported:Examples:`GET [base]/Observation?subject=Patient/example-mii-molgen-patient`Usage notes: Further information on searching by "subject" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "category" MUST be supported:Examples:`GET [base]/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory`Usage notes: Further information on searching by "category" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "encounter" MUST be supported:Examples:`GET [base]/Observation?encounter=Encounter/12345`Usage notes: Further information on searching by "encounter" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "code-value-concept" MUST be supported:Examples:`GET [base]/Observation?code-value-concept=http://loinc.org|69548-6$http://loinc.org|LA9633-4`Usage notes: Further information on searching by "code-value-concept" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).
1. The search parameter "code-value-quantity" MUST be supported:Examples:`GET [base]/Observation?code-value-quantity=http://loinc.org|82155-3$6http://unitsofmeasure.org|1`Usage notes: Further information on searching by "code-value-quantity" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).
1. The search parameter "component-code" MUST be supported:Examples:`GET [base]/Observation?component-code=http://loinc.org|48018-6`Usage notes: Further information on searching by "component-code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "component-code-value-concept" MUST be supported:Examples:`GET [base]/Observation?component-code-value-concept=http://loinc.org|48018-6$http://www.genenames.org/geneId|HGNC:1097`Usage notes: Further information on searching by "component-code-value-concept" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).
1. The search parameter "component-code-value-quantity" MUST be supported:Examples:`GET [base]/Observation?component-code-value-quantity=http://loinc.org|81258-6$ap30%|http://unitsofmeasure.org|%25`Usage notes: Further information on searching by "component-code-value-quantity" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).
1. The search parameter "component-value-concept" MUST be supported:Examples:`GET [base]/Observation?component-value-concept=http://sequenceontology.org|SO:SO:1000008`Usage notes: Further information on searching by "component-code-value-concept" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "component-value-quantity" MUST be supported:Examples:`GET [base]/Observation?component-value-quantity=ap30%|http://unitsofmeasure.org|%25`Usage notes: Further information on searching by "component-value-quantity" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).
1. The search parameter "date" MUST be supported:Examples:`GET [base]/Observation?date=2022-07-13`Usage notes: Further information on searching by "date" can be found in the [FHIR base specification - section "date"](http://hl7.org/fhir/R4/search.html#date).
1. The search parameter "derived-from" MUST be supported:Examples:`GET [base]/Observation?derived-from=Observation/example-mii-molgen-variante-1`Usage notes: Further information on searching by "derived-from" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "device" MUST be supported:Examples:`GET [base]/Observation?device=Device/example-mii-molgen-device-sequencer`Usage notes: Further information on searching by "device" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "specimen" MUST be supported:Examples:`GET [base]/Observation?specimen=Specimen/example-mii-molgen-specimen`Usage notes: Further information on searching by "specimen" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "encounter" MUST be supported:Examples:`GET [base]/Observation?encounter=Encounter/12345`Usage notes: Further information on searching by "encounter" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "method" MUST be supported:Examples:`GET [base]/Observation?method=http://loinc.org|LA26398-0`Usage notes: Further information on searching by "method" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).
1. The search parameter "patient" MUST be supported:Examples:`GET [base]/Observation?patient=Patient/example-mii-molgen-patient-2`Usage notes: Further information on searching by "patient" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "performer" MUST be supported:Examples:`GET [base]/Observation?performer=Practioner/example-mii-molgen-practitioner-laboratory`Usage notes: Further information on searching by "performer" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. The search parameter "status" MUST be supported:Examples:`GET [base]/Observation?status=final`Usage notes: Further information on searching by "status" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

-------

**Examples**

Example 1: Therapeutic implication BRAF variant

-------

### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide rendered these examples inline on this page; the IG Publisher renders each one on its own page instead, so they are listed here as links, in the order the source had them and with the captions it gave them. Nothing was added or dropped.

* [`mii-exa-molgen-therapeutische-implikation-1`](Observation-mii-exa-molgen-therapeutische-implikation-1.md) — Example 1: Therapeutische Implikation BRAF Variant

**Usages:**

* Refer to this Profile: [MII PR MolGen Empfohlene Folgemaßnahme](StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.md), [MII PR MolGen Medikationsempfehlung](StructureDefinition-mii-pr-molgen-medikationsempfehlung.md) and [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md)
* Examples for this Profile: [Observation/mii-exa-molgen-therapeutische-implikation-1](Observation-mii-exa-molgen-therapeutische-implikation-1.md) and [Observation/mii-exa-molgen-therapeutische-implikation-fgfr2-fusion](Observation-mii-exa-molgen-therapeutische-implikation-fgfr2-fusion.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-therapeutische-implikation.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-molgen-therapeutische-implikation.csv), [Excel](../StructureDefinition-mii-pr-molgen-therapeutische-implikation.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-therapeutische-implikation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-therapeutische-implikation",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation",
  "version" : "2026.0.4",
  "name" : "MII_PR_MolGen_TherapeutischeImplikation",
  "title" : "MII PR MolGen Therapeutische Implikation",
  "status" : "active",
  "date" : "2026-09-01T21:27:10+00:00",
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
  "description" : "Dieses Profil beschreibt den möglichen Einfluss genetischer Merkmale auf eine medikamentöse oder nicht-medikamentöse Therapie.",
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
  "baseDefinition" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation",
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1724",
        "comment" : "Empfehlungen (Therapie, Allg.)"
      }]
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
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
      "definition" : "Status der Beobachtung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Status der Beobachtung"
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
      "definition" : "Code zur Identifizierung der therapeutischen Implikation",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Code zur Identifizierung der therapeutischen Implikation"
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
      "definition" : "Der Patient auf den sich die therapeutische Implikation bezieht",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Patient auf den sich die therapeutische Implikation bezieht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
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
      "definition" : "Referenzen zu anderen Beobachtungen von denen diese abgeleitet ist",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenzen zu anderen Beobachtungen von denen diese abgeleitet ist"
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
      "short" : "Abgeleitet von Variante",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Abgeleitet von Variante"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die genetische Variante von der diese Implikation abgeleitet wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die genetische Variante von der diese Implikation abgeleitet wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"]
      }],
      "mustSupport" : true
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
      "definition" : "Einzelne Komponenten der therapeutischen Implikation",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Einzelne Komponenten der therapeutischen Implikation"
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
      "definition" : "Textuelle Zusammenfassung der therapeutischen Implikation",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Textuelle Zusammenfassung der therapeutischen Implikation"
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
      "definition" : "Das Evidenzlevel für die therapeutische Empfehlung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Evidenzlevel für die therapeutische Empfehlung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1720",
        "comment" : "Clinical Annotation Level Of Evidence"
      }]
    },
    {
      "id" : "Observation.component:therapeutic-implication",
      "path" : "Observation.component",
      "sliceName" : "therapeutic-implication",
      "short" : "Art der therapeutischen Implikation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Art der therapeutischen Implikation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Art der therapeutischen Implikation wie z.B. Sensitivität oder Resistenz",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Art der therapeutischen Implikation wie z.B. Sensitivität oder Resistenz"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:phenotypic-treatment-context",
      "path" : "Observation.component",
      "sliceName" : "phenotypic-treatment-context",
      "short" : "Phänotypischer Behandlungskontext",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Phänotypischer Behandlungskontext"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der phänotypische oder krankheitsbezogene Kontext der Behandlung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der phänotypische oder krankheitsbezogene Kontext der Behandlung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:medication-assessed",
      "path" : "Observation.component",
      "sliceName" : "medication-assessed",
      "short" : "Bewertete Medikation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Bewertete Medikation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die bewertete Medikation für die therapeutische Empfehlung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die bewertete Medikation für die therapeutische Empfehlung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:therapy-assessed",
      "path" : "Observation.component",
      "sliceName" : "therapy-assessed",
      "short" : "Bewertete Therapie",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Bewertete Therapie"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die bewertete nicht-medikamentöse Therapie",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die bewertete nicht-medikamentöse Therapie"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    }]
  }
}

```
