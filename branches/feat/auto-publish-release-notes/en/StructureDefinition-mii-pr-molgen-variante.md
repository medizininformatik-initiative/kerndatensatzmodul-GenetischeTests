# MII PR MolGen Variante - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII PR MolGen Variante**

## Resource Profile: MII PR MolGen Variante 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante | *Version*:2027.0.0-ballot.rc2 |
| Active as of 2026-09-04 | *Computable Name*:MII_PR_MolGen_Variante |

 
Dieses Profil ermöglicht eine vollständige Beschreibung der gefundenen Variante unter Verwendung von Eigenschaften aus einer Vielzahl von Testmethoden. 

-------

#### Description

This profile allows a complete description of the variant found, using properties from a wide range of testing methods.

* As the nomenclature for Observation.component:cytogenetic-location.valueCodeableConcept, the CodeSystem Cytogenetic (chromosome) location (NCBI/NLM) can be used, for which no canonical URL exists so far, but an OID `urn:oid:2.16.840.1.113883.6.335` from the HL7 Version 2.5.1 Implementation Guide: Laboratory Results Interface.
* The description of complex variants, e.g. the representation of 'Compound Heterozygous', is done via two Variant instances, as described [here](http://hl7.org/fhir/uv/genomics-reporting/sequencing.html#representing-compound-heterozygotes)

#### Recommendation on reference sequences

For the unambiguous and interoperable representation of variants using HGVS nomenclature, the use of **MANE (Matched Annotation from NCBI and EMBL-EBI)** transcripts is recommended:

* **MANE Select**: The preferred transcript for each gene - represents the biologically most relevant isoform
* **MANE Plus Clinical**: Additional clinically relevant transcripts, where required for variant interpretation
* **Versioning**: Reference sequences should always be stated with a version number (e.g. `NM_007294.4`, not `NM_007294`)

The use of standardised MANE transcripts offers the following advantages:

* Unambiguous assignment of variants between different laboratories and systems
* Reduction of differences in interpretation through uniform references
* Improved compatibility with international databases (ClinVar, gnomAD)
* Support for cross-site data integration in the MII/NUM context

Example of the correct entry in `component[representative-transcript-ref-seq]`:

```
* component[representative-transcript-ref-seq].valueCodeableConcept.coding.system = "http://www.ncbi.nlm.nih.gov/refseq"
* component[representative-transcript-ref-seq].valueCodeableConcept.coding.code = "NM_007294.4"
* component[representative-transcript-ref-seq].valueCodeableConcept.coding.display = "BRCA1 transcript variant 1, MANE Select"

```

Further information on MANE: https://www.ncbi.nlm.nih.gov/refseq/MANE/

-------

The profile is derived from the profile [Variant](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-variant.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

-------

#### Profile

-------

| FHIR element | Logical data set | |—|—| | Observation.method | Methoden.Methode | | Observation.device | Methoden.Geräte / Software / Kits | | Observation.note | Methoden.Limitierungen/Bemerkungen | | Observation.component:gene-studied | Methoden.Getestete Gene | | Observation.component:transcript-ref-seq | Ergebnisse.Veränderungen.Transcript-ID | | Observation.component:coding-hgvs | Ergebnisse.Veränderungen.DNA Veränderung | | Observation.component:protein-hgvs | Ergebnisse.Veränderungen.Veränderung auf Proteinebene | | Observation.component:genomic-hgvs | Ergebnisse.Veränderungen.Genomische DNA Veränderung | | Observation.component:reference-sequence-assembly | Ergebnisse.Veränderungen.Referenzgenom | | Observation.component:coding-change-type | Ergebnisse.Veränderungen.DNA Mutationstyp | | Observation.component:sample-allelic-frequency | Ergebnisse.Veränderungen.Proben-Allelfrequenz | | Observation.component:genomic-source-class | Ergebnisse.Veränderungen.Ursprung der Variante | | Observation.component:cytogenetic-location | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung | | Observation.component:copy-number | Ergebnisse.Kopienzahlvariationen | | Observation.component:transcript-ref-seq | Methoden.Referenzsequenz | | Observation.component:allelic-read-depth | Methoden.Read depth/Coverage | | Observation.component:dna-region | Methoden.Intron spanning/IVS | | Observation.component:exact-start-end | Methoden.Start- und Endnukleotid | | Observation.derivedFrom | Ergebnisse.Daten | | Observation.component:chromosome-identifier | Ergebnisse.Veränderungen.Chromosom | | Observation.component:alt-allele| Ergebnisse.Veränderungen.Alt Allel | | Observation.component:ref-allele| Ergebnisse.Veränderungen.Ref Allel | | Observation.component:dna-region | Ergebnisse.Veränderungen.Exon | | Observation.component.variation-code | Ergebnisse.Veränderungen.Varianten ID | | Observation.status | Weiteres.Berichtstatus | | Observation.component:detection-limit | Methoden.Sensitivität/Detektionslimit |

-------

**Examples**

Example 1: Variant BRAF

-------

Example of the Device referenced in the previous example

-------

Example 2: Variant NIPBL

-------

Example of the Device referenced in the previous Example 2

-------

Example 3: Copy number variant in the SMO gene

-------

Example 4: Variant BRCA1

-------

### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide rendered these examples inline on this page; the IG Publisher renders each one on its own page instead, so they are listed here as links, in the order the source had them and with the captions it gave them. Nothing was added or dropped.

* [`mii-exa-molgen-variante-1`](Observation-mii-exa-molgen-variante-1.md) — Example 1: Variant BRAF
* [`mii-exa-molgen-device-sequencer`](Device-mii-exa-molgen-device-sequencer.md) — Example of the Device referenced in the example above
* [`mii-exa-molgen-variante-2`](Observation-mii-exa-molgen-variante-2.md) — Example 2: Variant NIPBL
* [`mii-exa-molgen-device-sequencer-2`](Device-mii-exa-molgen-device-sequencer-2.md) — Example of the Device referenced in example 2 above
* [`mii-exa-molgen-variante-cnv-4`](Observation-mii-exa-molgen-variante-cnv-4.md) — Example 3: Copy number variant in the SMO gene
* [`mii-exa-molgen-variante-brca1`](Observation-mii-exa-molgen-variante-brca1.md) — Example 4: Variant BRCA1

**Usages:**

* Refer to this Profile: [MII PR MolGen Diagnostische Implikation](StructureDefinition-mii-pr-molgen-diagnostische-implikation.md), [MII PR MolGen Molekulare Konsequenz](StructureDefinition-mii-pr-molgen-molekulare-konsequenz.md), [MII PR MolGen Molekularer Biomarker](StructureDefinition-mii-pr-molgen-molekularer-biomarker.md), [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md) and [MII PR MolGen Therapeutische Implikation](StructureDefinition-mii-pr-molgen-therapeutische-implikation.md)
* Examples for this Profile: [Observation/mii-exa-molgen-variante-1](Observation-mii-exa-molgen-variante-1.md), [Observation/mii-exa-molgen-variante-2](Observation-mii-exa-molgen-variante-2.md), [Observation/mii-exa-molgen-variante-brca1](Observation-mii-exa-molgen-variante-brca1.md), [Observation/mii-exa-molgen-variante-cnv-4](Observation-mii-exa-molgen-variante-cnv-4.md)... Show 3 more, [Observation/mii-exa-molgen-variante-comprehensive-pathogenic](Observation-mii-exa-molgen-variante-comprehensive-pathogenic.md), [Observation/mii-exa-molgen-variante-fgfr2-fusion](Observation-mii-exa-molgen-variante-fgfr2-fusion.md) and [Observation/mii-exa-molgen-variante-srcc-ctnna1](Observation-mii-exa-molgen-variante-srcc-ctnna1.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-variante.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-molgen-variante.csv), [Excel](../StructureDefinition-mii-pr-molgen-variante.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-variante.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-variante",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante",
  "version" : "2027.0.0-ballot.rc2",
  "name" : "MII_PR_MolGen_Variante",
  "title" : "MII PR MolGen Variante",
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
  "description" : "Dieses Profil ermöglicht eine vollständige Beschreibung der gefundenen Variante unter Verwendung von Eigenschaften aus einer Vielzahl von Testmethoden.",
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
  "baseDefinition" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant",
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
      "definition" : "Code zur Identifizierung der Varianten-Beobachtung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Code zur Identifizierung der Varianten-Beobachtung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "short" : "Patient oder Proband",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Patient oder Proband"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Patient oder die Gruppe auf die sich die Variante bezieht",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Patient oder die Gruppe auf die sich die Variante bezieht"
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
      "definition" : "Klinisch relevanter Zeitpunkt oder Zeitraum der Beobachtung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Klinisch relevanter Zeitpunkt oder Zeitraum der Beobachtung"
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
      "definition" : "Datum und Uhrzeit der Freigabe der Beobachtung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Datum und Uhrzeit der Freigabe der Beobachtung"
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
      "definition" : "Das Ergebnis der Variantenanalyse - vorhanden oder abwesend",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Ergebnis der Variantenanalyse - vorhanden oder abwesend"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.method",
      "path" : "Observation.method",
      "short" : "Methode",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Methode"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die verwendete Untersuchungsmethode",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die verwendete Untersuchungsmethode"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.specimen",
      "path" : "Observation.specimen",
      "short" : "Probe",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Probe"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die untersuchte Probe",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die untersuchte Probe"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.device",
      "path" : "Observation.device",
      "short" : "Gerät",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Gerät"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das verwendete Analysegerät",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das verwendete Analysegerät"
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
      "definition" : "Textuelle Zusammenfassung oder Schlussfolgerung zur Variante",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Textuelle Zusammenfassung oder Schlussfolgerung zur Variante"
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
      "definition" : "Chromosomale Position der Variante in Bandennomenklatur",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Chromosomale Position der Variante in Bandennomenklatur"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
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
      "definition" : "Die verwendete Referenzgenom-Version wie z.B. GRCh37 oder GRCh38",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die verwendete Referenzgenom-Version wie z.B. GRCh37 oder GRCh38"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:chromosome-identifier",
      "path" : "Observation.component",
      "sliceName" : "chromosome-identifier",
      "short" : "Chromosom",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Chromosom"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das betroffene Chromosom",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das betroffene Chromosom"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:representative-coding-hgvs",
      "path" : "Observation.component",
      "sliceName" : "representative-coding-hgvs",
      "short" : "DNA-Änderung c.HGVS",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "DNA-Änderung c.HGVS"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die cDNA-Änderung in HGVS-Nomenklatur auf Transkriptebene",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die cDNA-Änderung in HGVS-Nomenklatur auf Transkriptebene"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:genomic-hgvs",
      "path" : "Observation.component",
      "sliceName" : "genomic-hgvs",
      "short" : "Genomische DNA-Änderung g.HGVS",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Genomische DNA-Änderung g.HGVS"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die genomische DNA-Änderung in HGVS-Nomenklatur",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die genomische DNA-Änderung in HGVS-Nomenklatur"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:genomic-ref-seq",
      "path" : "Observation.component",
      "sliceName" : "genomic-ref-seq",
      "short" : "Genomische Referenzsequenz",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Genomische Referenzsequenz"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die genomische Referenzsequenz-ID wie z.B. NC_000007.14",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die genomische Referenzsequenz-ID wie z.B. NC_000007.14"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:representative-transcript-ref-seq",
      "path" : "Observation.component",
      "sliceName" : "representative-transcript-ref-seq",
      "short" : "Transkript-Referenzsequenz",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Transkript-Referenzsequenz"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Transkript-Referenzsequenz-ID wie z.B. NM_004333.4",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Transkript-Referenzsequenz-ID wie z.B. NM_004333.4"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:exact-start-end",
      "path" : "Observation.component",
      "sliceName" : "exact-start-end",
      "short" : "Exakte Start-End-Position",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Exakte Start-End-Position"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die exakten genomischen Koordinaten der Variante - Start und Ende",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die exakten genomischen Koordinaten der Variante - Start und Ende"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:inner-start-end",
      "path" : "Observation.component",
      "sliceName" : "inner-start-end",
      "short" : "Innere Start-End-Position",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Innere Start-End-Position"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der innere Bereich bei strukturellen Varianten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der innere Bereich bei strukturellen Varianten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:outer-start-end",
      "path" : "Observation.component",
      "sliceName" : "outer-start-end",
      "short" : "Äußere Start-End-Position",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Äußere Start-End-Position"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der äußere Bereich bei strukturellen Varianten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der äußere Bereich bei strukturellen Varianten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:ref-allele",
      "path" : "Observation.component",
      "sliceName" : "ref-allele",
      "short" : "Referenz-Allel",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz-Allel"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Nukleotidsequenz des Referenz-Allels",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Nukleotidsequenz des Referenz-Allels"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:alt-allele",
      "path" : "Observation.component",
      "sliceName" : "alt-allele",
      "short" : "Alternatives Allel",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Alternatives Allel"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Nukleotidsequenz des alternativen - mutierten - Allels",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Nukleotidsequenz des alternativen - mutierten - Allels"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:coding-change-type",
      "path" : "Observation.component",
      "sliceName" : "coding-change-type",
      "short" : "DNA-Änderungstyp",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "DNA-Änderungstyp"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Typ der DNA-Änderung wie z.B. Substitution oder Deletion",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Typ der DNA-Änderung wie z.B. Substitution oder Deletion"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:genomic-source-class",
      "path" : "Observation.component",
      "sliceName" : "genomic-source-class",
      "short" : "Genomische Herkunftsklasse",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Genomische Herkunftsklasse"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Herkunft der Variante wie z.B. somatisch oder Keimbahn",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Herkunft der Variante wie z.B. somatisch oder Keimbahn"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:sample-allelic-frequency",
      "path" : "Observation.component",
      "sliceName" : "sample-allelic-frequency",
      "short" : "Allelfrequenz in der Probe",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Allelfrequenz in der Probe"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Häufigkeit des varianten Allels in der untersuchten Probe",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Häufigkeit des varianten Allels in der untersuchten Probe"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:allelic-read-depth",
      "path" : "Observation.component",
      "sliceName" : "allelic-read-depth",
      "short" : "Allelische Lesetiefe",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Allelische Lesetiefe"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Anzahl der Reads die das Allel unterstützen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Anzahl der Reads die das Allel unterstützen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:allelic-state",
      "path" : "Observation.component",
      "sliceName" : "allelic-state",
      "short" : "Allelstatus",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Allelstatus"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Allelstatus wie z.B. heterozygot oder homozygot",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Allelstatus wie z.B. heterozygot oder homozygot"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:variant-inheritance",
      "path" : "Observation.component",
      "sliceName" : "variant-inheritance",
      "short" : "Varianten-Vererbung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Varianten-Vererbung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Vererbungsart der Variante wie z.B. maternal oder paternal",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Vererbungsart der Variante wie z.B. maternal oder paternal"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:variation-code",
      "path" : "Observation.component",
      "sliceName" : "variation-code",
      "short" : "Varianten-Code",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Varianten-Code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Eindeutiger Identifikator der Variante aus externen Datenbanken wie z.B. ClinVar oder dbSNP",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Eindeutiger Identifikator der Variante aus externen Datenbanken wie z.B. ClinVar oder dbSNP"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:representative-protein-hgvs",
      "path" : "Observation.component",
      "sliceName" : "representative-protein-hgvs",
      "short" : "Aminosäure-Änderung p.HGVS",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Aminosäure-Änderung p.HGVS"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Aminosäure-Änderung in HGVS-Nomenklatur auf Proteinebene",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Aminosäure-Änderung in HGVS-Nomenklatur auf Proteinebene"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:copy-number",
      "path" : "Observation.component",
      "sliceName" : "copy-number",
      "short" : "Kopienzahl",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kopienzahl"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Anzahl der Kopien eines genomischen Abschnitts",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Anzahl der Kopien eines genomischen Abschnitts"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:variant-confidence-status",
      "path" : "Observation.component",
      "sliceName" : "variant-confidence-status",
      "short" : "Konfidenzstatus der Variante",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Konfidenzstatus der Variante"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Vertrauensstatus der Variantendetektion",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Vertrauensstatus der Variantendetektion"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:dna-region",
      "path" : "Observation.component",
      "sliceName" : "dna-region",
      "short" : "DNA-Regionsname",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "DNA-Regionsname"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ein lesbarer Name für die untersuchte Region. Typischerweise Exon # oder Intron # oder andere.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ein lesbarer Name für die untersuchte Region. Typischerweise Exon # oder Intron # oder andere."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:dna-region.code",
      "path" : "Observation.component.code",
      "short" : "47999-8",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "47999-8"
        }]
      }
    },
    {
      "id" : "Observation.component:dna-region.value[x]",
      "path" : "Observation.component.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Observation.component:gene-fusion",
      "path" : "Observation.component",
      "sliceName" : "gene-fusion",
      "short" : "Genfusion",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Genfusion"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Details zur Genfusion in Blut oder Gewebe mittels molekulargenetischer Methode",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Details zur Genfusion in Blut oder Gewebe mittels molekulargenetischer Methode"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:gene-fusion.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "95123-6"
        }]
      }
    },
    {
      "id" : "Observation.component:gene-fusion.value[x]",
      "path" : "Observation.component.value[x]",
      "short" : "HGNC-Format für Genfusionen GENESYMBOL1::GENESYMBOL2 und Readthrough-Transkripte GENESYMBOL1-GENESYMBOL2",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "HGNC-Format für Genfusionen GENESYMBOL1::GENESYMBOL2 und Readthrough-Transkripte GENESYMBOL1-GENESYMBOL2"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgnc-vs"
      }
    },
    {
      "id" : "Observation.component:detection-limit",
      "path" : "Observation.component",
      "sliceName" : "detection-limit",
      "short" : "Nachweisgrenze",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Nachweisgrenze"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Nachweisgrenze des Laborgeräts",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Nachweisgrenze des Laborgeräts"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:detection-limit.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "87706-8"
        }]
      }
    },
    {
      "id" : "Observation.component:detection-limit.value[x]",
      "path" : "Observation.component.value[x]",
      "short" : "Wird üblicherweise als Prozentsatz angegeben",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Wird üblicherweise als Prozentsatz angegeben"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Quantity"
      }]
    }]
  }
}

```
