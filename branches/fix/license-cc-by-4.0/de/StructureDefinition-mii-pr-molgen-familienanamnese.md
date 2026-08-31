# MII PR MolGen Familienanamnese - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII PR MolGen Familienanamnese**

## Ressourcenprofil: MII PR MolGen Familienanamnese 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese | *Version*:2026.0.4 |
| Active Stand: 2026-08-31 | *Maschinenlesbarer Name*:MII_PR_MolGen_Familienanamnese |

 
Dieses Profil beschreibt die Familienanamnese eines Patienten im Kontext von genetischen Analysen. 

-------

#### Beschreibung

Details zur Krankengeschichte von verwandten Familienmitgliedern.

-------

#### Profil

-------

#### Extensions

Dieses Profil verwendet drei spezifische Extensions für detaillierte Verwandtschaftsinformationen:

* **Verwandtschaftsgrad**: Grad der Verwandtschaft (erstgradig, zweitgradig)
* **Verwandtschaftsverhältnis**: Spezifisches Verhältnis (natürliches Kind, adoptiert)
* **Familiäre Linie**: Mütterliche oder väterliche Linie

Detaillierte Dokumentation und Profile der Extensions finden Sie auf der extensions.html#extensions-der-familienanamnese Seite.

-------

| | |
| :--- | :--- |
| FamilyMemberHistory | Anforderung.Indikation.Krankengeschichte Familie |

-------

**Suchparameter**

Folgende Suchparameter sind für das Modul Pathologie-Befund relevant, auch in Kombination:

1. Der Suchparameter `_id` MUSS unterstützt werden:Beispiele:`GET [base]/FamilyMemberHistory?_id=1234`Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).
1. Der Suchparameter "_profile" MUSS unterstützt werden:Beispiele:`GET [base]/FamilyMemberHistory?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese`Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).
1. Der Suchparameter "code" MUSS unterstützt werden:Beispiele:`GET [base]/FamilyMemberHistory?code=http://snomed.info/sct|830150003`Anwendungshinweise: Weitere Informationen zur Suche nach "code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).
1. Der Suchparameter "date" MUSS unterstützt werden:Beispiele:`GET [base]/FamilyMemberHistory?date=2022-04-07`Anwendungshinweise: Weitere Informationen zur Suche nach "date" finden sich in der [FHIR-Basisspezifikation - Abschnitt "date"](http://hl7.org/fhir/R4/search.html#date).
1. Der Suchparameter "patient" MUSS unterstützt werden:Beispiele:`GET [base]/FamilyMemberHistory?patient=Patient/example-mii-molgen-patient-2`Anwendungshinweise: Weitere Informationen zur Suche nach "patient" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. Der Suchparameter "relationship" MUSS unterstützt werden:Beispiele:`GET [base]/FamilyMemberHistory?relationship=http://snomed.info/sct|72705000`Anwendungshinweise: Weitere Informationen zur Suche nach "relationship" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).
1. Der Suchparameter "sex" MUSS unterstützt werden:Beispiele:`GET [base]/FamilyMemberHistory?sex=http://hl7.org/fhir/administrative-gender|female`Anwendungshinweise: Weitere Informationen zur Suche nach "sex" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).
1. Der Suchparameter "status" MUSS unterstützt werden:Beispiele:`GET [base]/FamilyMemberHistory?status=completed`Anwendungshinweise: Weitere Informationen zur Suche nach "status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).
1. Der Suchparameter "reason-code" MUSS unterstützt werden:Beispiele:`GET [base]/FamilyMemberHistory?reason-code=http://snomed.info/sct|447886005`Anwendungshinweise: Weitere Informationen zur Suche nach "reason-code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).
1. Der Suchparameter "reason-reference" MUSS unterstützt werden:Beispiele:`GET [base]/FamilyMemberHistory?reason-reference=Observation/12345`Anwendungshinweise: Weitere Informationen zur Suche nach "reason-reference" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

-------

**Examples**

-------

-------

### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde nichts ergänzt und nichts weggelassen.

* [`mii-exa-molgen-family-member-history-1`](FamilyMemberHistory-mii-exa-molgen-family-member-history-1.md) — **Examples**
* [`mii-exa-molgen-family-member-history-2`](FamilyMemberHistory-mii-exa-molgen-family-member-history-2.md)

**Usages:**

* Refer to this Profile: [MII PR MolGen Anforderung genetischer Test](StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.md)
* Examples for this Profile: [FamilyMemberHistory/mii-exa-molgen-family-member-history-1](FamilyMemberHistory-mii-exa-molgen-family-member-history-1.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-2](FamilyMemberHistory-mii-exa-molgen-family-member-history-2.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-diabetes](FamilyMemberHistory-mii-exa-molgen-family-member-history-diabetes.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-mi](FamilyMemberHistory-mii-exa-molgen-family-member-history-mi.md)... Show 2 more, [FamilyMemberHistory/mii-exa-molgen-family-member-history-retinal](FamilyMemberHistory-mii-exa-molgen-family-member-history-retinal.md) and [FamilyMemberHistory/mii-exa-molgen-family-member-history-srcc](FamilyMemberHistory-mii-exa-molgen-family-member-history-srcc.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-familienanamnese.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [FamilyMemberHistory](http://hl7.org/fhir/R4/familymemberhistory.html) 

#### Terminology Bindings (Differential)

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [FamilyMemberHistory](http://hl7.org/fhir/R4/familymemberhistory.html) 

** Summary **

Mandatory: 2 elements(15 nested mandatory elements)
 Must-Support: 40 elements

**Structures**

This structure refers to these other structures:

* [Coding-Profil für ICD-10-GM (http://fhir.de/StructureDefinition/CodingICD10GM)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/CodingICD10GM)
* [Coding-Profil für Alpha-ID (http://fhir.de/StructureDefinition/CodingAlphaID)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/CodingAlphaID)

**Extensions**

This structure refers to these extensions:

* [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad](StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.md)
* [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis](StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.md)
* [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-familiare-linie](StructureDefinition-mii-ex-molgen-familiare-linie.md)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of FamilyMemberHistory.relationship.coding
* The element 1 is sliced based on the value of FamilyMemberHistory.reasonCode.coding
* The element 1 is sliced based on the value of FamilyMemberHistory.condition.code.coding

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [FamilyMemberHistory](http://hl7.org/fhir/R4/familymemberhistory.html) 

#### Terminology Bindings (Differential)

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [FamilyMemberHistory](http://hl7.org/fhir/R4/familymemberhistory.html) 

** Summary **

Mandatory: 2 elements(15 nested mandatory elements)
 Must-Support: 40 elements

**Structures**

This structure refers to these other structures:

* [Coding-Profil für ICD-10-GM (http://fhir.de/StructureDefinition/CodingICD10GM)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/CodingICD10GM)
* [Coding-Profil für Alpha-ID (http://fhir.de/StructureDefinition/CodingAlphaID)](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/StructureDefinition/CodingAlphaID)

**Extensions**

This structure refers to these extensions:

* [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad](StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.md)
* [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis](StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.md)
* [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-familiare-linie](StructureDefinition-mii-ex-molgen-familiare-linie.md)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of FamilyMemberHistory.relationship.coding
* The element 1 is sliced based on the value of FamilyMemberHistory.reasonCode.coding
* The element 1 is sliced based on the value of FamilyMemberHistory.condition.code.coding

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-molgen-familienanamnese.csv), [Excel](../StructureDefinition-mii-pr-molgen-familienanamnese.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-familienanamnese.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-familienanamnese",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese",
  "version" : "2026.0.4",
  "name" : "MII_PR_MolGen_Familienanamnese",
  "title" : "MII PR MolGen Familienanamnese",
  "status" : "active",
  "date" : "2026-08-31T14:11:50+00:00",
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
  "description" : "Dieses Profil beschreibt die Familienanamnese eines Patienten im Kontext von genetischen Analysen.",
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "FamilyMemberHistory",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "FamilyMemberHistory",
      "path" : "FamilyMemberHistory",
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1740",
        "comment" : "Krankengeschichte Familie"
      }]
    },
    {
      "id" : "FamilyMemberHistory.status",
      "path" : "FamilyMemberHistory.status",
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
      "definition" : "Status der Familienanamnese",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Status der Familienanamnese"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.patient",
      "path" : "FamilyMemberHistory.patient",
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
      "definition" : "Der Patient zu dem die Familienanamnese gehört",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Patient zu dem die Familienanamnese gehört"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.date",
      "path" : "FamilyMemberHistory.date",
      "short" : "Datum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Datum"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Datum der Erfassung der Familienanamnese",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Datum der Erfassung der Familienanamnese"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.relationship",
      "path" : "FamilyMemberHistory.relationship",
      "short" : "Verwandtschaftsbeziehung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verwandtschaftsbeziehung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Art der Verwandtschaft zum Patienten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Art der Verwandtschaft zum Patienten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.relationship.coding",
      "path" : "FamilyMemberHistory.relationship.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "FamilyMemberHistory.relationship.coding:snomed",
      "path" : "FamilyMemberHistory.relationship.coding",
      "sliceName" : "snomed",
      "min" : 1,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct"
      },
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-family-member-snomed"
      }
    },
    {
      "id" : "FamilyMemberHistory.relationship.coding:snomed.extension:Verwandtschaftsgrad",
      "path" : "FamilyMemberHistory.relationship.coding.extension",
      "sliceName" : "Verwandtschaftsgrad",
      "short" : "Verwandtschaftsgrad",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verwandtschaftsgrad"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Grad der Blutsverwandtschaft wie z.B. ersten oder zweiten Grades",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Grad der Blutsverwandtschaft wie z.B. ersten oder zweiten Grades"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.relationship.coding:snomed.extension:Verwandtschaftsverhaeltnis",
      "path" : "FamilyMemberHistory.relationship.coding.extension",
      "sliceName" : "Verwandtschaftsverhaeltnis",
      "short" : "Verwandtschaftsverhältnis",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verwandtschaftsverhältnis"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das spezifische Verwandtschaftsverhältnis wie z.B. Elternteil oder Geschwister",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das spezifische Verwandtschaftsverhältnis wie z.B. Elternteil oder Geschwister"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.relationship.coding:snomed.extension:FamiliareLinie",
      "path" : "FamilyMemberHistory.relationship.coding.extension",
      "sliceName" : "FamiliareLinie",
      "short" : "Familiäre Linie",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Familiäre Linie"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die familiäre Linie - mütterlich oder väterlich",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die familiäre Linie - mütterlich oder väterlich"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-familiare-linie"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.relationship.coding:v3-RoleCode",
      "path" : "FamilyMemberHistory.relationship.coding",
      "sliceName" : "v3-RoleCode",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
      },
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "http://terminology.hl7.org/ValueSet/v3-PersonalRelationshipRoleType"
      }
    },
    {
      "id" : "FamilyMemberHistory.sex",
      "path" : "FamilyMemberHistory.sex",
      "short" : "Geschlecht",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Geschlecht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Geschlecht des Familienangehörigen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Geschlecht des Familienangehörigen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonCode",
      "path" : "FamilyMemberHistory.reasonCode",
      "short" : "Grund der Erhebung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Grund der Erhebung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Grund für die Erhebung dieser Familienanamnese",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Grund für die Erhebung dieser Familienanamnese"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding",
      "path" : "FamilyMemberHistory.reasonCode.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "short" : "Kodierung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierung des Grundes",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung des Grundes"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:icd10-gm",
      "path" : "FamilyMemberHistory.reasonCode.coding",
      "sliceName" : "icd10-gm",
      "short" : "ICD-10-GM Kodierung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "ICD-10-GM Kodierung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierung nach ICD-10-GM",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung nach ICD-10-GM"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm"
      }
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:icd10-gm.system",
      "path" : "FamilyMemberHistory.reasonCode.coding.system",
      "short" : "System",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "System"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Kodesystem ICD-10-GM",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Kodesystem ICD-10-GM"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:icd10-gm.version",
      "path" : "FamilyMemberHistory.reasonCode.coding.version",
      "short" : "Version",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Version"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Version des ICD-10-GM Katalogs",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Version des ICD-10-GM Katalogs"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:icd10-gm.code",
      "path" : "FamilyMemberHistory.reasonCode.coding.code",
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
      "definition" : "Der ICD-10-GM Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der ICD-10-GM Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:alpha-id",
      "path" : "FamilyMemberHistory.reasonCode.coding",
      "sliceName" : "alpha-id",
      "short" : "Alpha-ID Kodierung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Alpha-ID Kodierung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierung nach Alpha-ID",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung nach Alpha-ID"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://fhir.de/CodeSystem/bfarm/alpha-id"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid"
      }
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:alpha-id.system",
      "path" : "FamilyMemberHistory.reasonCode.coding.system",
      "short" : "System",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "System"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Kodesystem Alpha-ID",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Kodesystem Alpha-ID"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:alpha-id.code",
      "path" : "FamilyMemberHistory.reasonCode.coding.code",
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
      "definition" : "Der Alpha-ID Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Alpha-ID Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:sct",
      "path" : "FamilyMemberHistory.reasonCode.coding",
      "sliceName" : "sct",
      "short" : "SNOMED CT Kodierung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "SNOMED CT Kodierung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierung nach SNOMED CT",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung nach SNOMED CT"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct"
      }
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:sct.system",
      "path" : "FamilyMemberHistory.reasonCode.coding.system",
      "short" : "System",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "System"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Kodesystem SNOMED CT",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Kodesystem SNOMED CT"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:sct.code",
      "path" : "FamilyMemberHistory.reasonCode.coding.code",
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
      "definition" : "Der SNOMED CT Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der SNOMED CT Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:orphanet",
      "path" : "FamilyMemberHistory.reasonCode.coding",
      "sliceName" : "orphanet",
      "short" : "Orphanet Kodierung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Orphanet Kodierung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierung nach Orphanet für seltene Erkrankungen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung nach Orphanet für seltene Erkrankungen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://www.orpha.net"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet"
      }
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:orphanet.system",
      "path" : "FamilyMemberHistory.reasonCode.coding.system",
      "short" : "System",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "System"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Kodesystem Orphanet",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Kodesystem Orphanet"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonCode.coding:orphanet.code",
      "path" : "FamilyMemberHistory.reasonCode.coding.code",
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
      "definition" : "Der Orphanet Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Orphanet Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.reasonReference",
      "path" : "FamilyMemberHistory.reasonReference",
      "short" : "Referenz zum Grund",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zum Grund"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu einer Condition die den Grund der Familienanamnese beschreibt",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu einer Condition die den Grund der Familienanamnese beschreibt"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition",
      "path" : "FamilyMemberHistory.condition",
      "short" : "Erkrankung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Erkrankung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Erkrankung des Familienangehörigen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Erkrankung des Familienangehörigen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition.code",
      "path" : "FamilyMemberHistory.condition.code",
      "short" : "Erkrankungscode",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Erkrankungscode"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierte Darstellung der Erkrankung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierte Darstellung der Erkrankung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding",
      "path" : "FamilyMemberHistory.condition.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "short" : "Kodierung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierung der Erkrankung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung der Erkrankung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:icd10-gm",
      "path" : "FamilyMemberHistory.condition.code.coding",
      "sliceName" : "icd10-gm",
      "short" : "ICD-10-GM Kodierung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "ICD-10-GM Kodierung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierung nach ICD-10-GM",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung nach ICD-10-GM"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Coding",
        "profile" : ["http://fhir.de/StructureDefinition/CodingICD10GM"]
      }],
      "patternCoding" : {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm"
      }
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:icd10-gm.system",
      "path" : "FamilyMemberHistory.condition.code.coding.system",
      "short" : "System",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "System"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Kodesystem ICD-10-GM",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Kodesystem ICD-10-GM"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:icd10-gm.version",
      "path" : "FamilyMemberHistory.condition.code.coding.version",
      "short" : "Version",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Version"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Version des ICD-10-GM Katalogs",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Version des ICD-10-GM Katalogs"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:icd10-gm.code",
      "path" : "FamilyMemberHistory.condition.code.coding.code",
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
      "definition" : "Der ICD-10-GM Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der ICD-10-GM Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:alpha-id",
      "path" : "FamilyMemberHistory.condition.code.coding",
      "sliceName" : "alpha-id",
      "short" : "Alpha-ID Kodierung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Alpha-ID Kodierung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierung nach Alpha-ID",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung nach Alpha-ID"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Coding",
        "profile" : ["http://fhir.de/StructureDefinition/CodingAlphaID"]
      }],
      "patternCoding" : {
        "system" : "http://fhir.de/CodeSystem/bfarm/alpha-id"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid"
      }
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:alpha-id.system",
      "path" : "FamilyMemberHistory.condition.code.coding.system",
      "short" : "System",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "System"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Kodesystem Alpha-ID",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Kodesystem Alpha-ID"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:alpha-id.code",
      "path" : "FamilyMemberHistory.condition.code.coding.code",
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
      "definition" : "Der Alpha-ID Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Alpha-ID Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:sct",
      "path" : "FamilyMemberHistory.condition.code.coding",
      "sliceName" : "sct",
      "short" : "SNOMED CT Kodierung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "SNOMED CT Kodierung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierung nach SNOMED CT",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung nach SNOMED CT"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct"
      }
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:sct.system",
      "path" : "FamilyMemberHistory.condition.code.coding.system",
      "short" : "System",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "System"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Kodesystem SNOMED CT",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Kodesystem SNOMED CT"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:sct.code",
      "path" : "FamilyMemberHistory.condition.code.coding.code",
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
      "definition" : "Der SNOMED CT Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der SNOMED CT Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:orphanet",
      "path" : "FamilyMemberHistory.condition.code.coding",
      "sliceName" : "orphanet",
      "short" : "Orphanet Kodierung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Orphanet Kodierung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierung nach Orphanet für seltene Erkrankungen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierung nach Orphanet für seltene Erkrankungen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://www.orpha.net"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet"
      }
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:orphanet.system",
      "path" : "FamilyMemberHistory.condition.code.coding.system",
      "short" : "System",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "System"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Kodesystem Orphanet",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Kodesystem Orphanet"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition.code.coding:orphanet.code",
      "path" : "FamilyMemberHistory.condition.code.coding.code",
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
      "definition" : "Der Orphanet Code",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Orphanet Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
