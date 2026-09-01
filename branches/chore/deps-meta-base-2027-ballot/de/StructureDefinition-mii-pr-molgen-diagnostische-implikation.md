# MII PR MolGen Diagnostische Implikation - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII PR MolGen Diagnostische Implikation**

## Ressourcenprofil: MII PR MolGen Diagnostische Implikation 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation | *Version*:2026.0.4 |
| Active Stand: 2026-09-01 | *Maschinenlesbarer Name*:MII_PR_MolGen_DiagnostischeImplikation |

 
Dieses Profil beschreibt den Zusammenhang zwischen einem oder mehreren Genotyp/Haplotyp/Varianten und Beweisen für oder gegen eine bestimmte Krankheit. 

-------

#### Beschreibung

Observation Profil, das einen Zusammenhang zwischen einem oder mehreren Genotyp/Haplotyp/Varianten und Beweisen für oder gegen eine bestimmte Krankheit, einen Zustand oder eine Tumordiagnose angibt.

-------

Das Profil ist abgeleitet vom Profil [Diagnostic Implication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

-------

#### Profil

-------

| | |
| :--- | :--- |
| Observation.component:associated-phenotype | Interpretation.Assoziierter Phänotyp |
| Observation.component:evidence-level | Interpretation.Clinical Annotation Level Of Evidence |
| Observation.component:mode-of-inheritance | Interpretation.Vererbungsmodus |
| Observation.component:conclusion-string | Interpretation.Zusammenfassung |
| Observation.component:clinical-significance | Interpretation.Klinische Signifikanz |
| Observation.extension:relatedArtifact | Interpretation.Referenzen |

-------

**Suchparameter**

Folgende Suchparameter sind für das Modul Pathologie-Befund relevant, auch in Kombination:

1. Der Suchparameter `_id` MUSS unterstützt werden:Beispiele:`GET [base]/Observation?_id=example-mii-molgen-variante-1`Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).
1. Der Suchparameter "_profile" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante`Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).
1. Der Suchparameter "code" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?code=http://loinc.org|69548-6`Anwendungshinweise: Weitere Informationen zur Suche nach "code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).
1. Der Suchparameter "subject" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?subject=Patient/example-mii-molgen-patient`Anwendungshinweise: Weitere Informationen zur Suche nach "subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. Der Suchparameter "category" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory`Anwendungshinweise: Weitere Informationen zur Suche nach "category" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).
1. Der Suchparameter "encounter" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?encounter=Encounter/12345`Anwendungshinweise: Weitere Informationen zur Suche nach "encounter" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. Der Suchparameter "code-value-concept" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?code-value-concept=http://loinc.org|69548-6$http://loinc.org|LA9633-4`Anwendungshinweise: Weitere Informationen zur Suche nach "code-value-concept" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).
1. Der Suchparameter "code-value-quantity" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?code-value-quantity=http://loinc.org|82155-3$6http://unitsofmeasure.org|1`Anwendungshinweise: Weitere Informationen zur Suche nach "code-value-quantity" finden sich in der [FHIR-Basisspezifikation - Abschnitt "composite"](http://hl7.org/fhir/search.html#composite).
1. Der Suchparameter "component-code" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?component-code=http://loinc.org|48018-6`Anwendungshinweise: Weitere Informationen zur Suche nach "component-code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).
1. Der Suchparameter "component-code-value-concept" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?component-code-value-concept=http://loinc.org|48018-6$http://www.genenames.org/geneId|HGNC:1097`Anwendungshinweise: Weitere Informationen zur Suche nach "component-code-value-concept" finden sich in der [FHIR-Basisspezifikation - Abschnitt "composite"](http://hl7.org/fhir/search.html#composite).
1. Der Suchparameter "component-code-value-quantity" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?component-code-value-quantity=http://loinc.org|81258-6$ap30%|http://unitsofmeasure.org|%25`Anwendungshinweise: Weitere Informationen zur Suche nach "component-code-value-quantity" finden sich in der [FHIR-Basisspezifikation - Abschnitt "composite"](http://hl7.org/fhir/search.html#composite).
1. Der Suchparameter "component-value-concept" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?component-value-concept=http://sequenceontology.org|SO:SO:1000008`Anwendungshinweise: Weitere Informationen zur Suche nach "component-code-value-concept" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).
1. Der Suchparameter "component-value-quantity" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?component-value-quantity=ap30%|http://unitsofmeasure.org|%25`Anwendungshinweise: Weitere Informationen zur Suche nach "component-value-quantity" finden sich in der [FHIR-Basisspezifikation - Abschnitt "composite"](http://hl7.org/fhir/search.html#composite).
1. Der Suchparameter "date" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?date=2022-07-13`Anwendungshinweise: Weitere Informationen zur Suche nach "date" finden sich in der [FHIR-Basisspezifikation - Abschnitt "date"](http://hl7.org/fhir/R4/search.html#date).
1. Der Suchparameter "derived-from" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?derived-from=Observation/example-mii-molgen-variante-1`Anwendungshinweise: Weitere Informationen zur Suche nach "derived-from" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. Der Suchparameter "device" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?device=Device/example-mii-molgen-device-sequencer`Anwendungshinweise: Weitere Informationen zur Suche nach "device" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. Der Suchparameter "specimen" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?specimen=Specimen/example-mii-molgen-specimen`Anwendungshinweise: Weitere Informationen zur Suche nach "specimen" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. Der Suchparameter "encounter" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?encounter=Encounter/12345`Anwendungshinweise: Weitere Informationen zur Suche nach "encounter" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. Der Suchparameter "method" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?method=http://loinc.org|LA26398-0`Anwendungshinweise: Weitere Informationen zur Suche nach "method" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).
1. Der Suchparameter "patient" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?patient=Patient/example-mii-molgen-patient-2`Anwendungshinweise: Weitere Informationen zur Suche nach "patient" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. Der Suchparameter "performer" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?performer=Practioner/example-mii-molgen-practitioner-laboratory`Anwendungshinweise: Weitere Informationen zur Suche nach "performer" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).
1. Der Suchparameter "status" MUSS unterstützt werden:Beispiele:`GET [base]/Observation?status=final`Anwendungshinweise: Weitere Informationen zur Suche nach "status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

-------

**Examples**

Beispiel 1: Diagnostische Implikation BRAF

-------

Beispiel 2: Diagnostische Implikation NIPBL

-------

Beispiel 3: Diagnostische Implikation CNV SMO

-------

Beispiel 4: Diagnostische Implikation aus Risk-Panel Befund

-------

### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde nichts ergänzt und nichts weggelassen.

* [`mii-exa-molgen-diagnostische-implikation-1`](Observation-mii-exa-molgen-diagnostische-implikation-1.md) — Beispiel 1: Diagnostische Implikation BRAF
* [`mii-exa-molgen-diagnostische-implikation-2`](Observation-mii-exa-molgen-diagnostische-implikation-2.md) — Beispiel 2: Diagnostische Implikation NIPBL
* [`mii-exa-molgen-diagnostische-implikation-cnv-4`](Observation-mii-exa-molgen-diagnostische-implikation-cnv-4.md) — Beispiel 3: Diagnostische Implikation CNV SMO
* [`mii-exa-molgen-diagnostische-implikation-brca1`](Observation-mii-exa-molgen-diagnostische-implikation-brca1.md) — Beispiel 4: Diagnostische Implikation aus Risk-Panel Befund

**Usages:**

* Refer to this Profile: [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md)
* Examples for this Profile: [Observation/mii-exa-molgen-diagnostische-implikation-1](Observation-mii-exa-molgen-diagnostische-implikation-1.md), [Observation/mii-exa-molgen-diagnostische-implikation-2](Observation-mii-exa-molgen-diagnostische-implikation-2.md), [Observation/mii-exa-molgen-diagnostische-implikation-brca1](Observation-mii-exa-molgen-diagnostische-implikation-brca1.md), [Observation/mii-exa-molgen-diagnostische-implikation-cnv-4](Observation-mii-exa-molgen-diagnostische-implikation-cnv-4.md)... Show 3 more, [Observation/mii-exa-molgen-diagnostische-implikation-comprehensive](Observation-mii-exa-molgen-diagnostische-implikation-comprehensive.md), [Observation/mii-exa-molgen-diagnostische-implikation-fgfr2-fusion](Observation-mii-exa-molgen-diagnostische-implikation-fgfr2-fusion.md) and [Observation/mii-exa-molgen-diagnostische-implikation-srcc-ctnna1](Observation-mii-exa-molgen-diagnostische-implikation-srcc-ctnna1.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-diagnostische-implikation.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [DiagnosticImplication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [DiagnosticImplication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html) 

** Summary **

Must-Support: 14 elements

**Structures**

This structure refers to these other structures:

* [MII PR MolGen Variante (https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante)](StructureDefinition-mii-pr-molgen-variante.md)

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [DiagnosticImplication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html) 

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [DiagnosticImplication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html) 

** Summary **

Must-Support: 14 elements

**Structures**

This structure refers to these other structures:

* [MII PR MolGen Variante (https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante)](StructureDefinition-mii-pr-molgen-variante.md)

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-molgen-diagnostische-implikation.csv), [Excel](../StructureDefinition-mii-pr-molgen-diagnostische-implikation.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-diagnostische-implikation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-diagnostische-implikation",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation",
  "version" : "2026.0.4",
  "name" : "MII_PR_MolGen_DiagnostischeImplikation",
  "title" : "MII PR MolGen Diagnostische Implikation",
  "status" : "active",
  "date" : "2026-09-01T20:30:33+00:00",
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
  "description" : "Dieses Profil beschreibt den Zusammenhang zwischen einem oder mehreren Genotyp/Haplotyp/Varianten und Beweisen für oder gegen eine bestimmte Krankheit.",
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
  "baseDefinition" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication",
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
      "definition" : "Code zur Identifizierung der diagnostischen Implikation",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Code zur Identifizierung der diagnostischen Implikation"
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
      "definition" : "Der Patient auf den sich die diagnostische Implikation bezieht",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Patient auf den sich die diagnostische Implikation bezieht"
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
      "definition" : "Einzelne Komponenten der diagnostischen Implikation",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Einzelne Komponenten der diagnostischen Implikation"
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
      "definition" : "Textuelle Zusammenfassung der diagnostischen Implikation",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Textuelle Zusammenfassung der diagnostischen Implikation"
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
      "definition" : "Das Evidenzlevel für die klinische Signifikanz",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Evidenzlevel für die klinische Signifikanz"
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
      "definition" : "Die klinische Signifikanz der Variante wie z.B. pathogen oder benigne",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die klinische Signifikanz der Variante wie z.B. pathogen oder benigne"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-2015",
        "comment" : "Klinische Signifikanz"
      }]
    },
    {
      "id" : "Observation.component:predicted-phenotype",
      "path" : "Observation.component",
      "sliceName" : "predicted-phenotype",
      "short" : "Vorhergesagter Phänotyp",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Vorhergesagter Phänotyp"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der mit der Variante assoziierte vorhergesagte Phänotyp oder Erkrankung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der mit der Variante assoziierte vorhergesagte Phänotyp oder Erkrankung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:mode-of-inheritance",
      "path" : "Observation.component",
      "sliceName" : "mode-of-inheritance",
      "short" : "Vererbungsmodus",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Vererbungsmodus"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Vererbungsmodus der assoziierten Erkrankung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Vererbungsmodus der assoziierten Erkrankung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    }]
  }
}

```
