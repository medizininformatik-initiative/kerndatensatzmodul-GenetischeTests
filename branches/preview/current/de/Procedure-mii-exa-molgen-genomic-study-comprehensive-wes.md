# Comprehensive Whole Exome Sequencing Study - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Comprehensive Whole Exome Sequencing Study**

## Beispiel Procedure: Comprehensive Whole Exome Sequencing Study

-------

**German**

-------

Profiles: [MII PR MolGen Genomic Study](StructureDefinition-mii-pr-molgen-genomic-study.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2026.0.4](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2026.0.4)

**Genomic Study Analysis Extension**: [Procedure: extension = ->Specimen: identifier = https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids#EDTA-2024-001; type = Plasma specimen,,DNA hybridization; status = completed; category = Laboratory](Procedure-mii-exa-molgen-genomic-study-analysis-wes-library-prep.md)

**Genomic Study Analysis Extension**: [Procedure: extension = ->Specimen: identifier = https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids#LIB-2024-001; type = Saliva specimen,,Sequencing,,; status = completed; category = Laboratory](Procedure-mii-exa-molgen-genomic-study-analysis-wes-sequencing.md)

**Genomic Study Analysis Extension**: [Procedure: extension = ,Computational analysis,; status = completed; category = Laboratory](Procedure-mii-exa-molgen-genomic-study-analysis-wes-bioinformatics.md)

**status**: Completed

**category**: Laboratory

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-molgen-genomic-study-comprehensive-wes",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2026.0.4"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext",
    "valueReference" : {
      "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-wes-library-prep"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext",
    "valueReference" : {
      "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-wes-sequencing"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext",
    "valueReference" : {
      "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-wes-bioinformatics"
    }
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
