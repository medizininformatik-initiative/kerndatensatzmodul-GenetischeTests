# Variante FGFR2-DBP Fusion - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Variante FGFR2-DBP Fusion**

## Example Observation: Variante FGFR2-DBP Fusion

-------

**English**

-------

Profiles: [MII PR MolGen Variante](StructureDefinition-mii-pr-molgen-variante.md) version: 2027.0.0-ballot.rc1, [Variant](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-variant.html) version: 3.0.0

**basedOn**: [ServiceRequest Molecular genetic test (procedure)](ServiceRequest-mii-exa-molgen-anforderung-fgfr2-fusion.md)

**status**: Final

**category**: Laboratory, Genetics

**code**: Genetic variant assessment

**subject**: [Anonymous Patient Female, DoB: 1964-05 ( pseudonymized (use: usual, ))](Patient-mii-exa-molgen-patient-fgfr2-fusion.md)

**effective**: 2022-11-30

**value**: Present

**method**: Sequencing

> **component****code**: Gene studied [ID]**value**: FGFR2

> **component****code**: DNA change type**value**: gene_fusion

> **component****code**: Gene fusion transcript details in Blood or Tissue by Molecular genetics method Narrative**value**: FGFR2::DBP



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-variante-fgfr2-fusion",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante|2027.0.0-ballot.rc1",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant|3.0.0"]
  },
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-fgfr2-fusion"
  }],
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
    "reference" : "Patient/mii-exa-molgen-patient-fgfr2-fusion"
  },
  "effectiveDateTime" : "2022-11-30",
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
    },
    {
      "system" : "http://loinc.org",
      "code" : "86206-0",
      "display" : "Whole genome sequence analysis in Blood or Tissue by Molecular genetics method"
    }]
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48018-6"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.genenames.org/geneId",
        "code" : "HGNC:3689",
        "display" : "FGFR2"
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
        "code" : "SO:0001565",
        "display" : "gene_fusion"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "95123-6"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.genenames.org/geneId",
        "code" : "HGNC:3689::HGNC:2697",
        "display" : "FGFR2::DBP"
      }]
    }
  }]
}

```
