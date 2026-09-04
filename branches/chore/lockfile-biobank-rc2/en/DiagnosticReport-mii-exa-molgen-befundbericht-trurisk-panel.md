# Molekulargentischer Befund Familiäre Belastung für Brust- und Eierstockkrebs - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Molekulargentischer Befund Familiäre Belastung für Brust- und Eierstockkrebs**

## Example DiagnosticReport: Molekulargentischer Befund Familiäre Belastung für Brust- und Eierstockkrebs

-------

**English**

-------

Profiles: [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md) version: 2027.0.0-ballot.rc2, [Genomic Report](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-report.html) version: 3.0.0

## Genetic analysis report (Genetics) 

| | |
| :--- | :--- |
| Subject | Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, )) |
| Performer | [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md) |

**Report Details**

* **Code**: [Genetic variant assessment](Observation-mii-exa-molgen-variante-brca1.md)
  * **Value**: Present
  * **Flags**: Final
  * **Relevant Time**: 2022-11-01
* **Code**: [Diagnostic Implication](Observation-mii-exa-molgen-diagnostische-implikation-brca1.md)
  * **Value**: 
  * **Flags**: Final
  * **Relevant Time**: 2022-11-01

Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "mii-exa-molgen-befundbericht-trurisk-panel",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht|2027.0.0-ballot.rc2",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report|3.0.0"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
    "valueRelatedArtifact" : {
      "type" : "citation",
      "citation" : "Plon SE, Eccles DM, Easton D, Foulkes WD, Genuardi M, Greenblatt MS, Hogervorst FB, Hoogerbrugge N, Spurdle AB, Tavtigian SV; IARC Unclassified Genetic Variants Working Group. Sequence variant classification and reporting: recommendations for improving the interpretation of cancer susceptibility genetic test results. Hum Mutat. 2008 Nov;29(11):1282-91. doi: 10.1002/humu.20880. PMID: 18951446; PMCID: PMC3075918.",
      "url" : "https://doi.org/10.1002/humu.20880"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
    "valueRelatedArtifact" : {
      "type" : "citation",
      "citation" : "Rhiem K, Auber B, Briest S, Dikow N, Ditsch N, Dragicevic N, Grill S, Hahnen E, Horvath J, Jaeger B, Kast K, Kiechle M, Leinert E, Morlot S, Püsken M, Schäfer D, Schott S, Schroeder C, Siebers-Renelt U, Solbach C, Weber-Lassalle N, Witzel I, Zeder-Göß C, Schmutzler RK. Consensus Recommendations of the German Consortium for Hereditary Breast and Ovarian Cancer. Breast Care (Basel). 2022 Apr;17(2):199-207. doi: 10.1159/000516376. Epub 2021 Jul 19. PMID: 35702495; PMCID: PMC9149395.",
      "url" : "https://doi.org/10.1159%2F000516376"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-reference",
    "valueReference" : {
      "reference" : "Procedure/mii-exa-molgen-genomic-study-trurisk-panel"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action",
    "valueReference" : {
      "reference" : "Task/mii-exa-molgen-folgemassnahme-brca1"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-risk-assessment",
    "valueReference" : {
      "reference" : "RiskAssessment/mii-exa-molgen-prs-brca1"
    }
  }],
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-trurisk-panel"
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
    "reference" : "Patient/mii-exa-molgen-patient-brca1"
  },
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }],
  "specimen" : [{
    "reference" : "Specimen/mii-exa-molgen-specimen-brca1"
  }],
  "result" : [{
    "reference" : "Observation/mii-exa-molgen-variante-brca1"
  },
  {
    "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-brca1"
  }],
  "conclusion" : "Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt."
}

```
