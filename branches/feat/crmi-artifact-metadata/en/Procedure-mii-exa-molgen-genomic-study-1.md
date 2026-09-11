# Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom**

## Example Procedure: Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom

-------

**English**

-------

Profiles: [MII PR MolGen Genomic Study](StructureDefinition-mii-pr-molgen-genomic-study.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2027.0.0-ballot.rc2](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2027.0.0-ballot.rc2)

**Genomic Study Analysis Extension**: [Procedure: extension = ->Specimen: identifier = https://biobank.uk-musterstadt.de/fhir/sid/proben#5432; status = available; type = Tissue specimen from colon (specimen),,Sequencing,; status = completed; category = Laboratory](Procedure-mii-exa-molgen-genomic-study-analysis-braf.md)

**status**: Completed

**category**: Laboratory

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-molgen-genomic-study-1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2027.0.0-ballot.rc2"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext",
    "valueReference" : {
      "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-braf"
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
