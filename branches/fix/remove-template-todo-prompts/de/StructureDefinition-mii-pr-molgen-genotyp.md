# MII PR MolGen Genotyp - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII PR MolGen Genotyp**

## Ressourcenprofil: MII PR MolGen Genotyp 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2026-09-03 | *Maschinenlesbarer Name*:MII_PR_MolGen_Genotyp |

 
Dieses Profil beschreibt die Feststellung eines bestimmten Genotyps auf der Grundlage einer oder mehrerer Varianten oder Haplotypen. 

-------

#### Beschreibung

Dieses Profil beschreibt die Feststellung eines bestimmten Genotyps auf der Grundlage einer oder mehrerer Varianten oder Haplotypen.

Als Nomenklatur für Observation.component:cytogenetic-location.valueCodeableConcept kann das CodeSystem Cytogenetic (chromosome) location (NCBI/NLM) verwendet werden für das bislang keine Canonical URl existiert, aber eine OID `urn:oid:2.16.840.1.113883.6.335` aus HL7 Version 2.5.1 Implementation Guide: Laboratory Results Interface.

-------

Das Profil ist abgeleitet vom Profil [Genotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genotype.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

-------

#### Profil

-------

| FHIR-Element | Logischer Datensatz | |—|—| | Observation.component:gene-studied | Methoden.Getestete Gene | | Observation.component:cytogenetic-location | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung | | Observation.component:reference-sequence-assembly | Ergebnisse.Veränderungen.Referenzgenom | | Observation.device | Methoden.Geräte / Software / Kits | | Observation.method | Methoden.Methode | | Observation.performer | Weiteres.Labor / Institution/ Ansprechpartner |

-------

**Examples**

Beispiel 1: BRAF

-------

### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde nichts ergänzt und nichts weggelassen.

* [`mii-exa-molgen-genotyp-1`](Observation-mii-exa-molgen-genotyp-1.md) — Beispiel 1: BRAF

**Usages:**

* Refer to this Profile: [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md)
* Examples for this Profile: [Observation/mii-exa-molgen-genotyp-1](Observation-mii-exa-molgen-genotyp-1.md), [Observation/mii-exa-molgen-genotyp-2](Observation-mii-exa-molgen-genotyp-2.md) and [Observation/mii-exa-molgen-genotyp-brca1](Observation-mii-exa-molgen-genotyp-brca1.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-genotyp.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Genotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genotype.html) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Genotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genotype.html) 

** Summary **

Mandatory: 1 element
 Must-Support: 14 elements

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [Genotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genotype.html) 

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Genotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genotype.html) 

** Summary **

Mandatory: 1 element
 Must-Support: 14 elements

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-molgen-genotyp.csv), [Excel](../StructureDefinition-mii-pr-molgen-genotyp.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-genotyp.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-genotyp",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_PR_MolGen_Genotyp",
  "title" : "MII PR MolGen Genotyp",
  "status" : "active",
  "date" : "2026-09-03T09:10:28+00:00",
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
  "description" : "Dieses Profil beschreibt die Feststellung eines bestimmten Genotyps auf der Grundlage einer oder mehrerer Varianten oder Haplotypen.",
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
  "baseDefinition" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
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
      "definition" : "Code zur Identifizierung des Genotyps",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Code zur Identifizierung des Genotyps"
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
      "definition" : "Der Patient auf den sich der Genotyp bezieht",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Patient auf den sich der Genotyp bezieht"
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
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "short" : "Ergebniswert",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ergebniswert"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Genotyp als kodierter Wert oder Text",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Genotyp als kodierter Wert oder Text"
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
      "definition" : "Die Varianten oder Haplotypen von denen der Genotyp abgeleitet wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Varianten oder Haplotypen von denen der Genotyp abgeleitet wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "definition" : "Einzelne Komponenten des Genotyps",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Einzelne Komponenten des Genotyps"
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
      "definition" : "Textuelle Zusammenfassung des Genotyps",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Textuelle Zusammenfassung des Genotyps"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:gene-studied",
      "path" : "Observation.component",
      "sliceName" : "gene-studied",
      "short" : "Untersuchtes Gen",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Untersuchtes Gen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das untersuchte Gen identifiziert durch HGNC-ID",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das untersuchte Gen identifiziert durch HGNC-ID"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1400",
        "comment" : "Getestete Gene ID"
      }]
    },
    {
      "id" : "Observation.component:cytogenetic-location",
      "path" : "Observation.component",
      "sliceName" : "cytogenetic-location",
      "short" : "Zytogenetische Lokalisation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Zytogenetische Lokalisation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Chromosomale Position in Bandennomenklatur",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Chromosomale Position in Bandennomenklatur"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1434",
        "comment" : "Zytogenetische Lokalisierung (Lokus)"
      }]
    },
    {
      "id" : "Observation.component:reference-sequence-assembly",
      "path" : "Observation.component",
      "sliceName" : "reference-sequence-assembly",
      "short" : "Referenzgenom-Assembly",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenzgenom-Assembly"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die verwendete Referenzgenom-Version",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die verwendete Referenzgenom-Version"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1788",
        "comment" : "Referenzgenom"
      }]
    }]
  }
}

```
