# Genotyp BRCA1 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Genotyp BRCA1**

## Beispiel Observation: Genotyp BRCA1

-------

**German**

-------

Profiles: [MII PR MolGen Genotyp](StructureDefinition-mii-pr-molgen-genotyp.md) version: 2026.0.4, [Genotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genotype.html) version: 3.0.0

**status**: Final

**category**: Laboratory, Genetik

**code**: Genotype display name

**subject**: [Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient-brca1.md)

**effective**: 2022-11-01

**value**: BRCA1, c.5266dup, p.(Gln1756Profs*74)

**method**: Sequencing

**specimen**: [Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_03; status = available; type = Tissue specimen from breast (specimen); receivedTime = 2022-11-01](Specimen-mii-exa-molgen-specimen-brca1.md)

**device**: [Device: status = active; manufacturer = Illumina](Device-mii-exa-molgen-device-sequencer-nextseq.md)

**derivedFrom**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-brca1.md)

> **component****code**: Gene studied [ID]**value**: BRCA1

> **component****code**: Cytogenetic (chromosome) location**value**: 17q21.31



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-genotyp-brca1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp|2026.0.4",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype|3.0.0"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "laboratory",
      "display" : "Laboratory"
    }]
  },
  {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
      "code" : "GE"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "84413-4",
      "display" : "Genotype display name"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-brca1"
  },
  "effectiveDateTime" : "2022-11-01",
  "valueCodeableConcept" : {
    "text" : "BRCA1, c.5266dup, p.(Gln1756Profs*74)"
  },
  "method" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA26398-0",
      "display" : "Sequencing"
    }]
  },
  "specimen" : {
    "reference" : "Specimen/mii-exa-molgen-specimen-brca1"
  },
  "device" : {
    "reference" : "Device/mii-exa-molgen-device-sequencer-nextseq"
  },
  "derivedFrom" : [{
    "reference" : "Observation/mii-exa-molgen-variante-brca1"
  }],
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48018-6",
        "display" : "Gene studied [ID]"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.genenames.org/geneId",
        "code" : "HGNC:1100",
        "display" : "BRCA1"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48001-2",
        "display" : "Cytogenetic (chromosome) location"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "urn:oid:2.16.840.1.113883.6.335",
        "code" : "17q21.31"
      }]
    }
  }]
}

```
