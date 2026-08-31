# Genomic Study Analysis TruRisk Panel v3 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Genomic Study Analysis TruRisk Panel v3**

## Beispiel Procedure: Genomic Study Analysis TruRisk Panel v3

-------

**German**

-------

Profiles: [MII PR MolGen Genomic Study Analysis](StructureDefinition-mii-pr-molgen-genomic-study-analysis.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2026.0.0&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4)

**Genomic Study Analysis Specimen**: [Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_03; status = available; type = Tissue specimen from breast (specimen); receivedTime = 2022-11-01](Specimen-mii-exa-molgen-specimen-brca1.md)

> **Genomic Study Analysis Device**
* device: [Device: status = active; manufacturer = Illumina](Device-mii-exa-molgen-device-sequencer-nextseq.md)

**Genomic Study Analysis Method Type**: Sequencing

> **Genomic Study Analysis Regions**
* description: TruRisk Panel v3: Alle kodierenden Exons der Core-Gene für erblichen Brust- und Eierstockkrebs
* studied: ATM
* studied: BRCA1
* studied: BARD1
* studied: BRCA2
* studied: BRIP1
* studied: CDH1
* studied: CHEK2
* studied: MLH1
* studied: MSH2
* studied: MSH6
* studied: PALB2
* studied: PMS2
* studied: PTEN
* studied: RAD51C
* studied: RAD51D
* studied: TP53

**status**: Completed

**category**: Laboratory

**subject**: [Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient-brca1.md)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-molgen-genomic-study-analysis-trurisk-panel",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2026.0.4"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen",
    "valueReference" : {
      "reference" : "Specimen/mii-exa-molgen-specimen-brca1"
    }
  },
  {
    "extension" : [{
      "url" : "device",
      "valueReference" : {
        "reference" : "Device/mii-exa-molgen-device-sequencer-nextseq"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device"
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA26398-0",
        "display" : "Sequencing"
      }]
    }
  },
  {
    "extension" : [{
      "url" : "description",
      "valueString" : "TruRisk Panel v3: Alle kodierenden Exons der Core-Gene für erblichen Brust- und Eierstockkrebs"
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:795",
          "display" : "ATM"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:1100",
          "display" : "BRCA1"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:952",
          "display" : "BARD1"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:1101",
          "display" : "BRCA2"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:20473",
          "display" : "BRIP1"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:1748",
          "display" : "CDH1"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:16627",
          "display" : "CHEK2"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:7127",
          "display" : "MLH1"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:7325",
          "display" : "MSH2"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:7329",
          "display" : "MSH6"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:26144",
          "display" : "PALB2"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:9122",
          "display" : "PMS2"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:9588",
          "display" : "PTEN"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:9820",
          "display" : "RAD51C"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:9823",
          "display" : "RAD51D"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:11998",
          "display" : "TP53"
        }]
      }
    }],
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions"
  }],
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "laboratory"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-brca1"
  }
}

```
