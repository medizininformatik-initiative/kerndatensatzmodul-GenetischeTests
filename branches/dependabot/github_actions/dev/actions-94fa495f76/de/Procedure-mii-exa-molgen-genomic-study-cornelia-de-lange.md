# Genomic Study Cornelia de Lange Panel - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Genomic Study Cornelia de Lange Panel**

## Beispiel Procedure: Genomic Study Cornelia de Lange Panel

-------

**German**

-------

Profiles: [MII PR MolGen Genomic Study](StructureDefinition-mii-pr-molgen-genomic-study.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2027.0.0-ballot.rc1](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2027.0.0-ballot.rc1)

**Genomic Study Analysis Extension**: [Procedure: extension = ->Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_02; status = available; type = Blood specimen with edetic acid (specimen); receivedTime = 2021-11-24,,Sequencing,; status = completed; category = Laboratory](Procedure-mii-exa-molgen-genomic-study-analysis-cornelia-de-lange.md)

**status**: Completed

**category**: Laboratory

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-molgen-genomic-study-cornelia-de-lange",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2027.0.0-ballot.rc1"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext",
    "valueReference" : {
      "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-cornelia-de-lange"
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
    "reference" : "Patient/mii-exa-molgen-patient-2"
  }
}

```
