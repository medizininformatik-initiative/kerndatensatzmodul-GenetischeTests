# MII PR MolGen Empfohlene Folgemaßnahme - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII PR MolGen Empfohlene Folgemaßnahme**

## Ressourcenprofil: MII PR MolGen Empfohlene Folgemaßnahme 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2026-09-02 | *Maschinenlesbarer Name*:MII_PR_MolGen_EmpfohleneFolgemassnahme |

 
Das Profil dieser Task Ressource beschreibt die empfohlenen Folgemaßnahmen. 

-------

#### Beschreibung

Das Profil dieser Task Ressource beschreibt die empfohlenen Folgemaßnahmen.

-------

Das Profil ist abgeleitet vom Profil [Followup Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-followup-recommendation.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

-------

#### Profil

-------

| | |
| :--- | :--- |
| Task.code | Weiteres.Beratung |
| Task.code | Interpretation.Empfehlungen |
| Task.for | Probeninformationen.Patient |

-------

**Examples**

Beispiel empfohlene Folgemaßnahme aus BRAF Befund

-------

Beispiel empfohlene Folgemaßnahme aus Risk-Panel Befund

-------

### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde nichts ergänzt und nichts weggelassen.

* [`mii-exa-molgen-folgemassnahme-1`](Task-mii-exa-molgen-folgemassnahme-1.md) — Beispiel empfohlene Folgemaßnahme aus BRAF Befund
* [`mii-exa-molgen-folgemassnahme-brca1`](Task-mii-exa-molgen-folgemassnahme-brca1.md) — Beispiel empfohlene Folgemaßnahme aus Risk-Panel Befund

**Usages:**

* Refer to this Profile: [MII EX MolGen Empfohlene Maßnahme](StructureDefinition-mii-ex-molgen-empfohlene-massnahme.md)
* Examples for this Profile: [Task/mii-exa-molgen-folgemassnahme-1](Task-mii-exa-molgen-folgemassnahme-1.md) and [Task/mii-exa-molgen-folgemassnahme-brca1](Task-mii-exa-molgen-folgemassnahme-brca1.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [FollowupRecommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-followup-recommendation.html) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [FollowupRecommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-followup-recommendation.html) 

** Summary **

Mandatory: 1 element
 Must-Support: 7 elements

**Structures**

This structure refers to these other structures:

* [MII PR MolGen Therapeutische Implikation (https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation)](StructureDefinition-mii-pr-molgen-therapeutische-implikation.md)

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [FollowupRecommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-followup-recommendation.html) 

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [FollowupRecommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-followup-recommendation.html) 

** Summary **

Mandatory: 1 element
 Must-Support: 7 elements

**Structures**

This structure refers to these other structures:

* [MII PR MolGen Therapeutische Implikation (https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation)](StructureDefinition-mii-pr-molgen-therapeutische-implikation.md)

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.csv), [Excel](../StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-empfohlene-folgemassnahme",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_PR_MolGen_EmpfohleneFolgemassnahme",
  "title" : "MII PR MolGen Empfohlene Folgemaßnahme",
  "status" : "active",
  "date" : "2026-09-02T14:15:24+00:00",
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
  "description" : "Das Profil dieser Task Ressource beschreibt die empfohlenen Folgemaßnahmen.",
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
  "baseDefinition" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Task",
      "path" : "Task"
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
      "definition" : "Status der empfohlenen Maßnahme",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Status der empfohlenen Maßnahme"
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
      "definition" : "Code der empfohlenen Maßnahme",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Code der empfohlenen Maßnahme"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1724",
        "comment" : "Empfehlungen (Therapie, Allg.)"
      },
      {
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1443",
        "comment" : "Beratung"
      }]
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
      "definition" : "Der Patient für den die Maßnahme empfohlen wird",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Patient für den die Maßnahme empfohlen wird"
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
      "definition" : "Kodierte Begründung für die Empfehlung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierte Begründung für die Empfehlung"
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
