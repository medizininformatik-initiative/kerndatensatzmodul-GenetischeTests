# Variante BRCA1 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Variante BRCA1**

## Beispiel Observation: Variante BRCA1

-------

**German**

-------

Profiles: [MII PR MolGen Variante](StructureDefinition-mii-pr-molgen-variante.md) version: 2027.0.0-ballot.rc1, [Variant](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-variant.html) version: 3.0.0

**basedOn**: [ServiceRequest Molecular genetic test (procedure)](ServiceRequest-mii-exa-molgen-anforderung-trurisk-panel.md)

**status**: Final

**category**: Laboratory, Genetik

**code**: Genetic variant assessment

**subject**: [Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient-brca1.md)

**effective**: 2022-11-01

**value**: Present

**method**: Sequencing

**specimen**: [Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_03; status = available; type = Tissue specimen from breast (specimen); receivedTime = 2022-11-01](Specimen-mii-exa-molgen-specimen-brca1.md)

**device**: [Device: status = active; manufacturer = Illumina](Device-mii-exa-molgen-device-sequencer-nextseq.md)

> **component****code**: Gene studied [ID]**value**: BRCA1

> **component****code**: Cytogenetic (chromosome) location**value**: 17q21.31

> **component****code**: DNA change (c.HGVS)**value**: NM_007294.3:c.5266dupC

> **component****code**: Transcript reference sequence [ID]**value**: NM_007294.3

> **component****code**: DNA change type**value**: Duplication

> **component****code**: Allelic read depth**value**: 50 Abdeckung der Fragmente (Details: UCUM code1 = '1')

> **component****code**: Discrete genetic variant**value**: rs80357906

> **component****code**: Chromosome [Identifier] in Blood or Tissue by Molecular genetics method**value**: Chromosome 17

> **component****code**: Amino acid change (pHGVS)**value**: p.Gln1756Profs

> **component****code**: Laboratory device Detection limit**value**: >95 % (Details: UCUM code% = '%')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-variante-brca1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante|2027.0.0-ballot.rc1",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant|3.0.0"]
  },
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-trurisk-panel"
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
    "reference" : "Patient/mii-exa-molgen-patient-brca1"
  },
  "effectiveDateTime" : "2022-11-01",
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
    }]
  },
  "specimen" : {
    "reference" : "Specimen/mii-exa-molgen-specimen-brca1"
  },
  "device" : {
    "reference" : "Device/mii-exa-molgen-device-sequencer-nextseq"
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
        "code" : "HGNC:1100",
        "display" : "BRCA1"
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
        "code" : "17q21.31"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48004-6"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://varnomen.hgvs.org",
        "code" : "NM_007294.3:c.5266dupC"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "51958-7"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.ncbi.nlm.nih.gov/refseq",
        "code" : "NM_007294.3"
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
        "code" : "SO:1000035",
        "display" : "Duplication"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "82121-5"
      }]
    },
    "valueQuantity" : {
      "value" : 50,
      "unit" : "Abdeckung der Fragmente",
      "system" : "http://unitsofmeasure.org",
      "code" : "1"
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "81252-9"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.ncbi.nlm.nih.gov/projects/SNP",
        "code" : "rs80357906"
      }]
    }
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
        "code" : "LA21270-6",
        "display" : "Chromosome 17"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48005-3"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://varnomen.hgvs.org",
        "code" : "p.Gln1756Profs"
      }]
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
