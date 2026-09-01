# Genotyp NIPBL - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Genotyp NIPBL**

## Beispiel Observation: Genotyp NIPBL

-------

**German**

-------

Profiles: [MII PR MolGen Genotyp](StructureDefinition-mii-pr-molgen-genotyp.md) version: 2026.0.4, [Genotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genotype.html) version: 3.0.0

**status**: Final

**category**: Laboratory, Genetik

**code**: Genotype display name

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**effective**: 2022-03-16

**value**: NIPBL Variante c.2207del p.(Pro736Glnfs*58) (heterozygot)

**method**: Sequencing

**specimen**: [Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_02; status = available; type = Blood specimen with edetic acid (specimen); receivedTime = 2021-11-24](Specimen-mii-exa-molgen-specimen-2.md)

**device**: [Device: status = active; manufacturer = Illumina](Device-mii-exa-molgen-device-sequencer-2.md)

**derivedFrom**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-2.md)

> **component****code**: Gene studied [ID]**value**: NIPBL

> **component****code**: Cytogenetic (chromosome) location**value**: 7q34



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-genotyp-2",
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
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "effectiveDateTime" : "2022-03-16",
  "valueCodeableConcept" : {
    "text" : "NIPBL Variante c.2207del p.(Pro736Glnfs*58) (heterozygot)"
  },
  "method" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA26398-0",
      "display" : "Sequencing"
    }]
  },
  "specimen" : {
    "reference" : "Specimen/mii-exa-molgen-specimen-2"
  },
  "device" : {
    "reference" : "Device/mii-exa-molgen-device-sequencer-2"
  },
  "derivedFrom" : [{
    "reference" : "Observation/mii-exa-molgen-variante-2"
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
        "code" : "HGNC:28862",
        "display" : "NIPBL"
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
        "code" : "7q34"
      }]
    }
  }]
}

```
