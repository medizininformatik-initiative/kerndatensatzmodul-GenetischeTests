# Polygener Risiko Score BRCA1 Variante - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Polygener Risiko Score BRCA1 Variante**

## Example RiskAssessment: Polygener Risiko Score BRCA1 Variante

-------

**English**

-------

Profile: [MII PR MolGen Polygener Risiko Score](StructureDefinition-mii-pr-molgen-polygener-risiko-score.md) version: 2027.0.0-ballot.rc1

**status**: Final

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**occurrence**: 2022-11-01

**basis**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-brca1.md)

### Predictions

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Extension** | **Outcome** | **QualitativeRisk** |
| * |  | Hereditary breast and ovarian cancer syndrome (disorder) | High likelihood |



## Resource Content

```json
{
  "resourceType" : "RiskAssessment",
  "id" : "mii-exa-molgen-prs-brca1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score|2027.0.0-ballot.rc1"]
  },
  "status" : "final",
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "occurrenceDateTime" : "2022-11-01",
  "basis" : [{
    "reference" : "Observation/mii-exa-molgen-variante-brca1"
  }],
  "prediction" : [{
    "extension" : [{
      "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "414152003",
          "display" : "European (ethnic group)"
        }],
        "text" : "Der verwendete Polygene Risikoscore wurde bisher nur für die europäische Bevölkerung bei Brustkrebs validiert."
      }
    }],
    "outcome" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "718220008",
        "display" : "Hereditary breast and ovarian cancer syndrome (disorder)"
      }]
    },
    "qualitativeRisk" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/risk-probability",
        "code" : "high",
        "display" : "High likelihood"
      }]
    }
  }]
}

```
