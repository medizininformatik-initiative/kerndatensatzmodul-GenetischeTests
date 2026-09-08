# TSO500 Library Preparation - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TSO500 Library Preparation**

## Example Procedure: TSO500 Library Preparation

-------

**English**

-------

Profiles: [MII PR MolGen Genomic Study Analysis](StructureDefinition-mii-pr-molgen-genomic-study-analysis.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2027.0.0-ballot.rc2](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2027.0.0-ballot.rc2)

**Genomic Study Analysis Specimen**: [Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_tso500_ffpe_01; status = available; type = Formalin-fixed paraffin-embedded tissue specimen; receivedTime = 2024-05-16 09:20:00+0200](Specimen-mii-exa-molgen-specimen-ffpe-tumor.md)

> **Genomic Study Analysis Device**
* device: [Device: identifier = https://www.medizininformatik-initiative.de/fhir/sid/lab-devices#TSO500v2-LOT-20240518-A; status = active; manufacturer = Illumina Inc.; expirationDate = 2026-12-31; lotNumber = 20240518-A; modelNumber = 20130527; type = ](Device-mii-exa-molgen-device-tso500-lot.md)
* function: DNA hybridization

**Genomic Study Analysis Method Type**: DNA hybridization

> **Genomic Study Analysis Regions**
* description: TSO500 v2 Panel: 523 Gene für SNV/Indel, 59 für CNV, 23 für DNA-Rearrangements, 55 Gene für RNA-Fusionen/Splice-Varianten; integrierte Biomarker TMB/MSI/HRD. Unten repräsentatives, NSCLC-relevantes Subset; vollständige Genliste siehe DeviceDefinition mii-exa-molgen-devicedef-tso500
* studied: EGFR
* studied: KRAS
* studied: BRAF
* studied: NRAS
* studied: ALK
* studied: ROS1
* studied: MET
* studied: RET
* studied: TP53
* studied: PIK3CA
* studied: ERBB2
* studied: FGFR2
* studied: FGFR3

**status**: Completed

**category**: Laboratory

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-molgen-genomic-study-analysis-tso500-libprep",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis|2027.0.0-ballot.rc2"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen",
    "valueReference" : {
      "reference" : "Specimen/mii-exa-molgen-specimen-ffpe-tumor"
    }
  },
  {
    "extension" : [{
      "url" : "device",
      "valueReference" : {
        "reference" : "Device/mii-exa-molgen-device-tso500-lot"
      }
    },
    {
      "url" : "function",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "LA26810-4",
          "display" : "DNA hybridization"
        }]
      }
    }],
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device"
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA26810-4",
        "display" : "DNA hybridization"
      }]
    }
  },
  {
    "extension" : [{
      "url" : "description",
      "valueString" : "TSO500 v2 Panel: 523 Gene für SNV/Indel, 59 für CNV, 23 für DNA-Rearrangements, 55 Gene für RNA-Fusionen/Splice-Varianten; integrierte Biomarker TMB/MSI/HRD. Unten repräsentatives, NSCLC-relevantes Subset; vollständige Genliste siehe DeviceDefinition mii-exa-molgen-devicedef-tso500"
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:3236",
          "display" : "EGFR"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:6407",
          "display" : "KRAS"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:1097",
          "display" : "BRAF"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:7989",
          "display" : "NRAS"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:427",
          "display" : "ALK"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:10261",
          "display" : "ROS1"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:7029",
          "display" : "MET"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:9967",
          "display" : "RET"
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
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:8975",
          "display" : "PIK3CA"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:3430",
          "display" : "ERBB2"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:3689",
          "display" : "FGFR2"
        }]
      }
    },
    {
      "url" : "studied",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:3690",
          "display" : "FGFR3"
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
    "reference" : "Patient/mii-exa-molgen-patient"
  }
}

```
