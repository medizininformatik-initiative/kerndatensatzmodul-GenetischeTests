# Genotyp BRAF - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Genotyp BRAF**

## Example Observation: Genotyp BRAF

-------

**English**

-------

Profiles: [MII PR MolGen Genotyp](StructureDefinition-mii-pr-molgen-genotyp.md) version: 2027.0.0-ballot.rc2, [Genotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genotype.html) version: 3.0.0

**status**: Final

**category**: Laboratory, Genetics

**code**: Genotype display name

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**effective**: 2022-04-07

**value**: BRAF rs113488022 T>A

**method**: Sequencing

**specimen**: [Specimen: identifier = https://biobank.uk-musterstadt.de/fhir/sid/proben#5432; status = available; type = Tissue specimen from colon (specimen)](Specimen-mii-exa-molgen-specimen-1.md)

**device**: [Device: status = active; manufacturer = Illumina](Device-mii-exa-molgen-device-sequencer.md)

**derivedFrom**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-1.md)

> **component****code**: Gene studied [ID]**value**: BRAF

> **component****code**: Cytogenetic (chromosome) location**value**: 7q34



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-genotyp-1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp|2027.0.0-ballot.rc2",
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
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "effectiveDateTime" : "2022-04-07",
  "valueCodeableConcept" : {
    "text" : "BRAF rs113488022 T>A"
  },
  "method" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA26398-0",
      "display" : "Sequencing"
    }]
  },
  "specimen" : {
    "reference" : "Specimen/mii-exa-molgen-specimen-1"
  },
  "device" : {
    "reference" : "Device/mii-exa-molgen-device-sequencer"
  },
  "derivedFrom" : [{
    "reference" : "Observation/mii-exa-molgen-variante-1"
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
        "code" : "HGNC:1097",
        "display" : "BRAF"
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
