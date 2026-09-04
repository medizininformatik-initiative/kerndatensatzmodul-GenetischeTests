# Variante SMO CNV - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Variante SMO CNV**

## Example Observation: Variante SMO CNV

-------

**English**

-------

Profiles: [MII PR MolGen Variante](StructureDefinition-mii-pr-molgen-variante.md) version: 2027.0.0-ballot.rc2, [Variant](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-variant.html) version: 3.0.0

**status**: Final

**category**: Laboratory, Genetics

**code**: Genetic variant assessment

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**effective**: 2022-03-16

**value**: Present

**method**: Analysepipeline XXX, Auswertungssoftware XXX, Prozessierungssystem XXX

> **component****code**: Gene studied [ID]**value**: SMO

> **component****code**: DNA change type**value**: copy_number_gain

> **component****code**: Genomic structural variant copy number**value**: 6 1 (Details: UCUM code1 = '1')

> **component****code**: DNA region name [Identifier]**value**: Ex 1-10

> **component****code**: Chromosome [Identifier] in Blood or Tissue by Molecular genetics method**value**: Chromosome 7

> **component****code**: Cytogenetic (chromosome) location**value**: 7q32.1

> **component****code**: Sample variant allelic frequency [NFr]**value**: 55 % (Details: UCUM code% = '%')

> **component****code**: Laboratory device Detection limit**value**: >95 % (Details: UCUM code% = '%')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-variante-cnv-4",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante|2027.0.0-ballot.rc2",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant|3.0.0"]
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
      "code" : "69548-6",
      "display" : "Genetic variant assessment"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "effectiveDateTime" : "2022-03-16",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA9633-4",
      "display" : "Present"
    }]
  },
  "method" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA26398-0",
      "display" : "Sequencing"
    }],
    "text" : "Analysepipeline XXX, Auswertungssoftware XXX, Prozessierungssystem XXX"
  },
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
        "code" : "HGNC:11119",
        "display" : "SMO"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48019-4"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://sequenceontology.org",
        "code" : "SO:0001742",
        "display" : "copy_number_gain"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "82155-3"
      }]
    },
    "valueQuantity" : {
      "value" : 6,
      "unit" : "1",
      "system" : "http://unitsofmeasure.org",
      "code" : "1"
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "47999-8"
      }]
    },
    "valueString" : "Ex 1-10"
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48000-4"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA21260-7",
        "display" : "Chromosome 7"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48001-2"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "urn:oid:2.16.840.1.113883.6.335",
        "code" : "7q32.1"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "81258-6"
      }]
    },
    "valueQuantity" : {
      "value" : 55,
      "unit" : "%",
      "system" : "http://unitsofmeasure.org",
      "code" : "%"
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "87706-8"
      }]
    },
    "valueQuantity" : {
      "value" : 95,
      "comparator" : ">",
      "unit" : "%",
      "system" : "http://unitsofmeasure.org",
      "code" : "%"
    }
  }]
}

```
