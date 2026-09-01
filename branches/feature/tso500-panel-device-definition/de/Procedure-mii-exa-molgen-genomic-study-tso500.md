# Genomic Study TSO500 NSCLC - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Genomic Study TSO500 NSCLC**

## Beispiel Procedure: Genomic Study TSO500 NSCLC

-------

**German**

-------

Profiles: [MII PR MolGen Genomic Study](StructureDefinition-mii-pr-molgen-genomic-study.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2026.0.4](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2026.0.4)

**Genomic Study Analysis Extension**: 

**Exception Generating Narrative: Cannot invoke "org.hl7.fhir.r5.renderers.utils.ResourceWrapper.fhirType()" because "resource" is null **



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "mii-exa-molgen-genomic-study-tso500",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study|2026.0.4"]
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
