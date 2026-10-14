# NIPBL Variante - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NIPBL Variante**

## Example Observation: NIPBL Variante

-------

**English**

-------

Profiles: [MII PR MolGen Variante](StructureDefinition-mii-pr-molgen-variante.md) version: 2027.0.0-ballot.rc1, [Variant](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-variant.html) version: 3.0.0

**basedOn**: [ServiceRequest Molecular genetic test (procedure)](ServiceRequest-mii-exa-molgen-anforderung-2.md)

**status**: Final

**category**: Laboratory, Genetics

**code**: Genetic variant assessment

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**effective**: 2022-03-16

**value**: Present

**method**: Sequencing

**specimen**: [Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_02; status = available; type = Blood specimen with edetic acid (specimen); receivedTime = 2021-11-24](Specimen-mii-exa-molgen-specimen-2.md)

**device**: [Device: status = active; manufacturer = Illumina](Device-mii-exa-molgen-device-sequencer-2.md)

> **component****code**: Gene studied [ID]**value**: NIPBL

> **component****code**: Transcript reference sequence [ID]**value**: NM_133433.4

> **component****code**: DNA region name [Identifier]**value**: Exon #10

> **component****code**: DNA change (c.HGVS)**value**: NM_133433.4:c.2207del

> **component****code**: Amino acid change (pHGVS)**value**: p.(Pro736Glnfs*58)

> **component****code**: Allelic state**value**: Heterozygous

> **component****code**: DNA change type**value**: Deletion

> **component****code**: Cytogenetic (chromosome) location**value**: 5p13.2

> **component****code**: Discrete genetic variant**value**: 1076298



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-variante-2",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante|2027.0.0-ballot.rc1",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant|3.0.0"]
  },
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-2"
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
    },
    {
      "system" : "http://loinc.org",
      "code" : "86206-0",
      "display" : "Whole genome sequence analysis in Blood or Tissue by Molecular genetics method"
    }]
  },
  "specimen" : {
    "reference" : "Specimen/mii-exa-molgen-specimen-2"
  },
  "device" : {
    "reference" : "Device/mii-exa-molgen-device-sequencer-2"
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
        "code" : "HGNC:28862",
        "display" : "NIPBL"
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
        "code" : "NM_133433.4"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "47999-8",
        "display" : "DNA region name [Identifier]"
      }]
    },
    "valueString" : "Exon #10"
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
        "code" : "NM_133433.4:c.2207del"
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
        "code" : "p.(Pro736Glnfs*58)"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "53034-5",
        "display" : "Allelic state"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA6706-1",
        "display" : "Heterozygous"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48019-4",
        "display" : "DNA change type"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://sequenceontology.org",
        "code" : "SO:0000159",
        "display" : "Deletion"
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
        "code" : "5p13.2"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "81252-9",
        "display" : "Discrete genetic variant"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.ncbi.nlm.nih.gov/clinvar",
        "code" : "1076298"
      },
      {
        "system" : "http://www.ncbi.nlm.nih.gov/clinvar",
        "code" : "VCV001076298.1"
      }]
    }
  }]
}

```
