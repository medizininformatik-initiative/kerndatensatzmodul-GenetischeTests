# MII PR MolGen Anforderung genetischer Test - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **MII PR MolGen Anforderung genetischer Test**

## Ressourcenprofil: MII PR MolGen Anforderung genetischer Test 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test | *Version*:2027.0.0-ballot.rc1 |
| Active Stand: 2026-09-02 | *Maschinenlesbarer Name*:MII_PR_MolGen_AnforderungGenetischerTest |

 
Der Laborauftrag oder die Anfrage, die die Durchführung des genetischen Tests auslöst. 

-------

#### Beschreibung

Der Laborauftrag oder die Anfrage, die die Durchführung des genetischen Tests auslöst.

In der Anforderung können auch ein oder mehrere bekannte Symptome über das reasonReference Element als ['Phenotypic Features'](https://build.fhir.org/ig/HL7/phenomics-exchange-ig/branches/v0.1.0/StructureDefinition-PhenotypicFeature.html), die in GA4GH's Phenopackets IG profiliert sind, angegeben werden.

#### Profil

-------

-------

| FHIR-Element | Logischer Datensatz | |—|—| | ServiceRequest.reasonCode | Anforderung.Indikation.Indikation | | ServiceRequest.supportingInfo | Anforderung.Indikation.Gesundheitszustand | | ServiceRequest.supportingInfo | Anforderung.Indikation.Anlageträger | | ServiceRequest.reasonReference | Anforderung.Indikation.Relevante Vorergebnisse | | ServiceRequest.code | Anforderung.Zu testende Gene | | ServiceRequest.code.text | Anforderung.Anforderungstext | | ServiceRequest.authoredOn | Anforderung.Datum der Anforderung | | ServiceRequest.requester | Anforderung.Anforderer | | ServiceRequest.note | Anforderung.Anforderung.Anforderungstext | | ServiceRequest.subject |Anforderung.Probeninformationen.Patient | | ServiceRequest.supportingInfo | Anforderung.Indikation.Krankengeschichte Familie |

-------

**Examples**

Anforderung 1 - BRAF

-------

Beispiel des in der Anforderung 1 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.

-------

Anforderung 2 - NIPBL

-------

Beispiel des in der Anforderung 2 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.

-------

Beispiel der Anforderung für das Risk-Panel

### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde nichts ergänzt und nichts weggelassen.

* [`mii-exa-molgen-anforderung-1`](ServiceRequest-mii-exa-molgen-anforderung-1.md) — Anforderung 1 - BRAF
* [`mii-exa-molgen-specimen-1`](Specimen-mii-exa-molgen-specimen-1.md) — Beispiel des in der Anforderung 1 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.
* [`mii-exa-molgen-anforderung-2`](ServiceRequest-mii-exa-molgen-anforderung-2.md) — Anforderung 2 - NIPBL
* [`mii-exa-molgen-specimen-2`](Specimen-mii-exa-molgen-specimen-2.md) — Beispiel des in der Anforderung 2 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.

**Usages:**

* Examples for this Profile: [ServiceRequest/mii-exa-molgen-anforderung-1](ServiceRequest-mii-exa-molgen-anforderung-1.md), [ServiceRequest/mii-exa-molgen-anforderung-2](ServiceRequest-mii-exa-molgen-anforderung-2.md), [ServiceRequest/mii-exa-molgen-anforderung-fgfr2-fusion](ServiceRequest-mii-exa-molgen-anforderung-fgfr2-fusion.md), [ServiceRequest/mii-exa-molgen-anforderung-srcc](ServiceRequest-mii-exa-molgen-anforderung-srcc.md)... Show 2 more, [ServiceRequest/mii-exa-molgen-anforderung-trurisk-panel](ServiceRequest-mii-exa-molgen-anforderung-trurisk-panel.md) and [ServiceRequest/mii-exa-molgen-anforderung-wes](ServiceRequest-mii-exa-molgen-anforderung-wes.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [ServiceRequest](http://hl7.org/fhir/R4/servicerequest.html) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [ServiceRequest](http://hl7.org/fhir/R4/servicerequest.html) 

** Summary **

Must-Support: 10 elements

**Structures**

This structure refers to these other structures:

* [MII PR MolGen Familienanamnese (https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese)](StructureDefinition-mii-pr-molgen-familienanamnese.md)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of ServiceRequest.supportingInfo

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [ServiceRequest](http://hl7.org/fhir/R4/servicerequest.html) 

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [ServiceRequest](http://hl7.org/fhir/R4/servicerequest.html) 

** Summary **

Must-Support: 10 elements

**Structures**

This structure refers to these other structures:

* [MII PR MolGen Familienanamnese (https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese)](StructureDefinition-mii-pr-molgen-familienanamnese.md)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of ServiceRequest.supportingInfo

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.csv), [Excel](../StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-anforderung-genetischer-test",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_PR_MolGen_AnforderungGenetischerTest",
  "title" : "MII PR MolGen Anforderung genetischer Test",
  "status" : "active",
  "date" : "2026-09-02T09:30:27+00:00",
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
  "description" : "Der Laborauftrag oder die Anfrage, die die Durchführung des genetischen Tests auslöst.",
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
  },
  {
    "identity" : "quick",
    "uri" : "http://siframework.org/cqf",
    "name" : "Quality Improvement and Clinical Knowledge (QUICK)"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ServiceRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ServiceRequest",
      "path" : "ServiceRequest",
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1733",
        "comment" : "Indikation / Anforderung"
      }]
    },
    {
      "id" : "ServiceRequest.basedOn",
      "path" : "ServiceRequest.basedOn",
      "short" : "Basiert auf",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Basiert auf"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu vorherigen Anforderungen oder Plänen auf denen diese basiert",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu vorherigen Anforderungen oder Plänen auf denen diese basiert"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1742",
        "comment" : "Zuvor durchgeführte Tests Methode"
      },
      {
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1743",
        "comment" : "Zuvor durchgeführte Tests Gen"
      }]
    },
    {
      "id" : "ServiceRequest.code",
      "path" : "ServiceRequest.code",
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
      "definition" : "Code der angeforderten Untersuchung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Code der angeforderten Untersuchung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1761",
        "comment" : "Zu testende Gene, ID"
      },
      {
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1704",
        "comment" : "Einheitlicher Bewertungsmaßstab"
      }]
    },
    {
      "id" : "ServiceRequest.code.text",
      "path" : "ServiceRequest.code.text",
      "alias" : ["Anforderungstext"],
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1763",
        "comment" : "Anforderungstext"
      }]
    },
    {
      "id" : "ServiceRequest.subject",
      "path" : "ServiceRequest.subject",
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
      "definition" : "Der Patient für den der Test angefordert wird",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Patient für den der Test angefordert wird"
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
      "id" : "ServiceRequest.encounter",
      "path" : "ServiceRequest.encounter",
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
      "definition" : "Der Kontakt in dessen Rahmen die Anforderung gestellt wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Kontakt in dessen Rahmen die Anforderung gestellt wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.authoredOn",
      "path" : "ServiceRequest.authoredOn",
      "short" : "Anforderungsdatum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Anforderungsdatum"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Datum der Anforderung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Datum der Anforderung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "alias" : ["Datum der Anforderung"],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1766",
        "comment" : "Datum der Anforderung"
      }]
    },
    {
      "id" : "ServiceRequest.requester",
      "path" : "ServiceRequest.requester",
      "short" : "Anforderer",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Anforderer"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Person oder Organisation die den Test anfordert",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Person oder Organisation die den Test anfordert"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "alias" : ["Anforderer", "orderer"],
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner",
        "http://hl7.org/fhir/StructureDefinition/PractitionerRole",
        "http://hl7.org/fhir/StructureDefinition/Organization"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1746",
        "comment" : "Anforderer"
      }]
    },
    {
      "id" : "ServiceRequest.reasonCode",
      "path" : "ServiceRequest.reasonCode",
      "short" : "Indikation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Indikation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Indikation oder der Grund für die Testanforderung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Indikation oder der Grund für die Testanforderung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "alias" : ["Indikation"],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1736",
        "comment" : "Indikation"
      }]
    },
    {
      "id" : "ServiceRequest.reasonReference",
      "path" : "ServiceRequest.reasonReference",
      "short" : "Referenz zur Indikation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zur Indikation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu Diagnosen oder Beobachtungen die die Anforderung begründen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu Diagnosen oder Beobachtungen die die Anforderung begründen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1744",
        "comment" : "Ergebnisse vorheriger Tests"
      },
      {
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1745",
        "comment" : "Bereichtsverweis"
      }]
    },
    {
      "id" : "ServiceRequest.supportingInfo",
      "path" : "ServiceRequest.supportingInfo",
      "slicing" : {
        "discriminator" : [{
          "type" : "profile",
          "path" : "resolve()"
        }],
        "rules" : "open"
      },
      "short" : "Unterstützende Informationen",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Unterstützende Informationen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zusätzliche Informationen die die Anforderung unterstützen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Zusätzliche Informationen die die Anforderung unterstützen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1738",
        "comment" : "Aktueller Gesundheitszustand"
      },
      {
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1739",
        "comment" : "Krankengeschichte Patient"
      },
      {
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1740",
        "comment" : "Krankengeschichte Familie"
      },
      {
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1741",
        "comment" : "Anlageträger"
      }]
    },
    {
      "id" : "ServiceRequest.supportingInfo:familienanamnese",
      "path" : "ServiceRequest.supportingInfo",
      "sliceName" : "familienanamnese",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese"]
      }]
    },
    {
      "id" : "ServiceRequest.note",
      "path" : "ServiceRequest.note",
      "short" : "Anmerkung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Anmerkung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zusätzliche Anmerkungen oder Anforderungstext",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Zusätzliche Anmerkungen oder Anforderungstext"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "alias" : ["Anforderungstext"],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1763",
        "comment" : "Anforderungstext"
      }]
    }]
  }
}

```
