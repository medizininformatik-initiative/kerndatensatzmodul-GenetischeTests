# KMT2A Pathogenic Variant from WES - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **KMT2A Pathogenic Variant from WES**

## Example Observation: KMT2A Pathogenic Variant from WES

-------

**English**

-------

Profile: [MII PR MolGen Variante](StructureDefinition-mii-pr-molgen-variante.md) version: 2027.0.0-ballot.rc2

**status**: Final

**category**: Laboratory, Genetics

**code**: Genetic variant assessment

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**effective**: 2024-01-10

**value**: Present

> **component****code**: Gene studied [ID]**value**: KMT2A

> **component****code**: DNA change (c.HGVS)**value**: NM_001197104.2:c.3463C>T

> **component****code**: Amino acid change (pHGVS)**value**: p.(Arg1155Ter)

> **component****code**: Allelic read depth**value**: 45 reads (Details: UCUM code1 = '1')

> **component****code**: Variant confidence status**value**: High



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-variante-comprehensive-pathogenic",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante|2027.0.0-ballot.rc2"]
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
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "effectiveDateTime" : "2024-01-10",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA9633-4",
      "display" : "Present"
    }]
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
        "code" : "HGNC:7132",
        "display" : "KMT2A"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48004-6",
        "display" : "DNA change (c.HGVS)"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://varnomen.hgvs.org",
        "code" : "NM_001197104.2:c.3463C>T"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48005-3",
        "display" : "Amino acid change (pHGVS)"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://varnomen.hgvs.org",
        "code" : "p.(Arg1155Ter)"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "82121-5",
        "display" : "Allelic read depth"
      }]
    },
    "valueQuantity" : {
      "value" : 45,
      "unit" : "reads",
      "system" : "http://unitsofmeasure.org",
      "code" : "1"
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
        "code" : "variant-confidence-status",
        "display" : "Variant confidence status"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/variant-confidence-status-cs",
        "code" : "high",
        "display" : "High"
      }]
    }
  }]
}

```
