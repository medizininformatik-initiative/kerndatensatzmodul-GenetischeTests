# Genomic Study TSO500 NSCLC - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Genomic Study TSO500 NSCLC**

## Example Procedure: Genomic Study TSO500 NSCLC

-------

**English**

-------

Profiles: [MII PR MolGen Genomic Study](StructureDefinition-mii-pr-molgen-genomic-study.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2027.0.0-ballot.rc2](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2027.0.0-ballot.rc2)

**Genomic Study Analysis Extension**: [Procedure: extension = ->Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_tso500_ffpe_01; status = available; type = Formalin-fixed paraffin-embedded tissue specimen; receivedTime = 2024-05-16 09:20:00+0200,,DNA hybridization,; status = completed; category = Laboratory](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-libprep.md)

**Genomic Study Analysis Extension**: [Procedure: extension = ->Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_tso500_ffpe_01; status = available; type = Formalin-fixed paraffin-embedded tissue specimen; receivedTime = 2024-05-16 09:20:00+0200,,Sequencing,; status = completed; category = Laboratory](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-sequencing.md)

**status**: Completed

**category**: Laboratory

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-molgen-genomic-study-tso500",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2027.0.0-ballot.rc2"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext",
    "valueReference" : {
      "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-tso500-libprep"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext",
    "valueReference" : {
      "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-tso500-sequencing"
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
