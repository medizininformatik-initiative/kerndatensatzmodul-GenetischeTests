# Comprehensive WES Report with Full Technical Documentation - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Comprehensive WES Report with Full Technical Documentation**

## Example DiagnosticReport: Comprehensive WES Report with Full Technical Documentation

-------

**English**

-------

Profiles: [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md) version: 2027.0.0-ballot.rc1, [Genomic Report](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-report.html) version: 3.0.0

## Genetic analysis report (Genetics) 

| | |
| :--- | :--- |
| Subject | Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, )) |
| Performer | [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md) |

**Report Details**

* **Code**: [Genetic variant assessment](Observation-mii-exa-molgen-variante-comprehensive-pathogenic.md)
  * **Value**: Present
  * **Flags**: Final
  * **Relevant Time**: 2024-01-10
* **Code**: [Diagnostic Implication](Observation-mii-exa-molgen-diagnostische-implikation-comprehensive.md)
  * **Value**: 
  * **Flags**: Final
  * **Relevant Time**: 2024-01-10

Whole exome sequencing identified a pathogenic de novo variant in the KMT2A gene, consistent with Wiedemann-Steiner syndrome. This explains the patient's developmental delay and dysmorphic features. Technical quality metrics met all acceptance criteria.

**Coded Conclusions:**

* Positive



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "mii-exa-molgen-befundbericht-comprehensive-wes",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht|2027.0.0-ballot.rc1",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report|3.0.0"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-reference",
    "valueReference" : {
      "reference" : "Procedure/mii-exa-molgen-genomic-study-comprehensive-wes"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
    "valueRelatedArtifact" : {
      "type" : "documentation",
      "label" : "GATK Best Practices for Germline SNP & Indel Discovery",
      "url" : "https://gatk.broadinstitute.org/hc/en-us/articles/360035535932"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report-note",
    "valueAnnotation" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/annotation-code",
        "valueCodeableConcept" : {
          "text" : "Quality Metrics"
        }
      }],
      "text" : "Mean coverage: 120X, 98.5% of bases >20X, 95.2% of target regions callable. Q30 bases: 92%. Contamination estimate: <1%. Sample identity confirmed by SNP fingerprinting."
    }
  }],
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-wes"
  }],
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
      "code" : "GE",
      "display" : "Genetics"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "51969-4",
      "display" : "Genetic analysis report"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }],
  "specimen" : [{
    "reference" : "Specimen/mii-exa-molgen-specimen-blood-edta"
  }],
  "result" : [{
    "reference" : "Observation/mii-exa-molgen-variante-comprehensive-pathogenic"
  },
  {
    "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-comprehensive"
  }],
  "media" : [{
    "comment" : "Coverage plot showing uniform coverage across all exons",
    "link" : {
      "reference" : "Media/mii-exa-molgen-media-coverage-plot"
    }
  }],
  "conclusion" : "Whole exome sequencing identified a pathogenic de novo variant in the KMT2A gene, consistent with Wiedemann-Steiner syndrome. This explains the patient's developmental delay and dysmorphic features. Technical quality metrics met all acceptance criteria.",
  "conclusionCode" : [{
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA6576-8",
      "display" : "Positive"
    }]
  }]
}

```
