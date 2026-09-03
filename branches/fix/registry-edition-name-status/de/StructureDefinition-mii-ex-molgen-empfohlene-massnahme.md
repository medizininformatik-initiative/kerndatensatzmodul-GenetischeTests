# MII EX MolGen Empfohlene Maßnahme - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII EX MolGen Empfohlene Maßnahme**

## Extension: MII EX MolGen Empfohlene Maßnahme 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2026-09-03 | *Maschinenlesbarer Name*:MII_EX_MolGen_EmpfohleneMassnahme |

Die Extension verweist auf eine vorgeschlagene Maßnahme, die auf der Grundlage der Ergebnisse des Befundberichts empfohlen wird.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-ex-molgen-empfohlene-massnahme.json)

### Formale Ansichten des Extension-Inhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [AlleAll](#tabs-all) 

Diese Struktur ist abgeleitet von [RecommendedAction](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-recommended-action.html) 

#### Constraints

Diese Struktur ist abgeleitet von [RecommendedAction](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-recommended-action.html) 

** Summary **

Simple Extension with the type Reference: Die Extension verweist auf eine vorgeschlagene Maßnahme, die auf der Grundlage der Ergebnisse des Befundberichts empfohlen wird.

 **Differential-AnsichtDifferential View** 

Diese Struktur ist abgeleitet von [RecommendedAction](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-recommended-action.html) 

 **Snapshot-Ansicht** 

#### Constraints

Diese Struktur ist abgeleitet von [RecommendedAction](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-recommended-action.html) 

** Summary **

Simple Extension with the type Reference: Die Extension verweist auf eine vorgeschlagene Maßnahme, die auf der Grundlage der Ergebnisse des Befundberichts empfohlen wird.

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-ex-molgen-empfohlene-massnahme.csv), [Excel](../StructureDefinition-mii-ex-molgen-empfohlene-massnahme.xlsx), [Schematron](../StructureDefinition-mii-ex-molgen-empfohlene-massnahme.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-ex-molgen-empfohlene-massnahme",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_EX_MolGen_EmpfohleneMassnahme",
  "title" : "MII EX MolGen Empfohlene Maßnahme",
  "status" : "active",
  "date" : "2026-09-03T17:23:12+00:00",
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
  "description" : "Die Extension verweist auf eine vorgeschlagene Maßnahme, die auf der Grundlage der Ergebnisse des Befundberichts empfohlen wird.",
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
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "DiagnosticReport"
  },
  {
    "type" : "element",
    "expression" : "Observation"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "MII EX MolGen Empfohlene Maßnahme",
      "definition" : "Die Extension verweist auf eine vorgeschlagene Maßnahme, die auf der Grundlage der Ergebnisse des Befundberichts empfohlen wird."
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung",
        "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme"]
      }]
    }]
  }
}

```
