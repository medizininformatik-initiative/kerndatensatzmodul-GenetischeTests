# MII EX MolGen RiskAssessment Einflussfaktor - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII EX MolGen RiskAssessment Einflussfaktor**

## Extension: MII EX MolGen RiskAssessment Einflussfaktor 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor | *Version*:2027.0.0-ballot.rc2 |
| Active Stand: 2026-09-04 | *Maschinenlesbarer Name*:MII_EX_MolGen_RiskAssessment_Einflussfaktor |

Die Extension erweitert RiskAssessment.prediction um die Möglichkeit, weitere ausschlaggebende Faktoren mit Einfluss auf die Risikoberechnung anzugeben.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [MII PR MolGen Polygener Risiko Score](StructureDefinition-mii-pr-molgen-polygener-risiko-score.md)
* Examples for this Extension: [Bundle/mii-exa-molgen-bundle-fam-his-breast-ovar-can](Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.md) and [RiskAssessment/mii-exa-molgen-prs-brca1](RiskAssessment-mii-exa-molgen-prs-brca1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-ex-molgen-risk-assessment-einflussfaktor.json)

### Formale Ansichten des Extension-Inhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [AlleAll](#tabs-all) 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Simple Extension with the type CodeableConcept: Die Extension erweitert RiskAssessment.prediction um die Möglichkeit, weitere ausschlaggebende Faktoren mit Einfluss auf die Risikoberechnung anzugeben.

 **Differential-AnsichtDifferential View** 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

 **Snapshot-Ansicht** 

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Simple Extension with the type CodeableConcept: Die Extension erweitert RiskAssessment.prediction um die Möglichkeit, weitere ausschlaggebende Faktoren mit Einfluss auf die Risikoberechnung anzugeben.

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-ex-molgen-risk-assessment-einflussfaktor.csv), [Excel](../StructureDefinition-mii-ex-molgen-risk-assessment-einflussfaktor.xlsx), [Schematron](../StructureDefinition-mii-ex-molgen-risk-assessment-einflussfaktor.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-ex-molgen-risk-assessment-einflussfaktor",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor",
  "version" : "2027.0.0-ballot.rc2",
  "name" : "MII_EX_MolGen_RiskAssessment_Einflussfaktor",
  "title" : "MII EX MolGen RiskAssessment Einflussfaktor",
  "status" : "active",
  "date" : "2026-09-04T18:16:30+00:00",
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
  "description" : "Die Extension erweitert RiskAssessment.prediction um die Möglichkeit, weitere ausschlaggebende Faktoren mit Einfluss auf die Risikoberechnung anzugeben.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "RiskAssessment.prediction"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "MII EX MolGen RiskAssessment Einflussfaktor",
      "definition" : "Die Extension erweitert RiskAssessment.prediction um die Möglichkeit, weitere ausschlaggebende Faktoren mit Einfluss auf die Risikoberechnung anzugeben."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    }]
  }
}

```
