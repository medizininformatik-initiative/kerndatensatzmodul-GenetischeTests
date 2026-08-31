# BRAF Variante Therapeutische Implikation - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **BRAF Variante Therapeutische Implikation**

## Beispiel Observation: BRAF Variante Therapeutische Implikation

-------

**German**

-------

Profiles: [MII PR MolGen Therapeutische Implikation](StructureDefinition-mii-pr-molgen-therapeutische-implikation.md) version: 2026.0.4, [Therapeutic Implication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-therapeutic-implication.html) version: 3.0.0

**status**: Final

**category**: Laboratory, Genetik

**code**: Therapeutic Implication

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**effective**: 2022-04-07

**performer**: [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md)

**derivedFrom**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-1.md)

> **component****code**: Conclusion Text**value**: Nachweis einer aktivierenden Mutation BRAF V600E. Triple-Therapie mit einem EGFR-Antikörper sowie einem BRAF- und einem MEK- Inhibitor prüfen.

> **component****code**: Medication assessed [ID]**value**: BRAF Inhibitor

> **component****code**: Medication assessed [ID]**value**: EGFR (Epidermal Growth Factor Receptor) inhibitors

> **component****code**: Medication assessed [ID]**value**: Mitogen-activated protein kinase (MEK) inhibitors



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-therapeutische-implikation-1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation|2026.0.4",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication|3.0.0"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "laboratory",
      "display" : "Laboratory"
    }]
  },
  {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
      "code" : "GE"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
      "code" : "therapeutic-implication",
      "display" : "Therapeutic Implication"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "effectiveDateTime" : "2022-04-07",
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }],
  "derivedFrom" : [{
    "reference" : "Observation/mii-exa-molgen-variante-1"
  }],
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
        "code" : "conclusion-string"
      }]
    },
    "valueString" : "Nachweis einer aktivierenden Mutation BRAF V600E. Triple-Therapie mit einem EGFR-Antikörper sowie einem BRAF- und einem MEK- Inhibitor prüfen."
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "51963-7",
        "display" : "Medication assessed [ID]"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "L01EC",
        "display" : "B-Raf serine-threonine kinase (BRAF) inhibitors"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "703645005",
        "display" : "Product containing B-Raf inhibitor (product)"
      }],
      "text" : "BRAF Inhibitor"
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "51963-7",
        "display" : "Medication assessed [ID]"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "L01FE",
        "display" : "EGFR (Epidermal Growth Factor Receptor) inhibitors"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "51963-7",
        "display" : "Medication assessed [ID]"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "L01EE",
        "display" : "Mitogen-activated protein kinase (MEK) inhibitors"
      }]
    }
  }]
}

```
