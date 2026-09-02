# Molekulare Konsequenz BRCA1 Variante - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Molekulare Konsequenz BRCA1 Variante**

## Example Observation: Molekulare Konsequenz BRCA1 Variante

-------

**English**

-------

Profiles: [MII PR MolGen Molekulare Konsequenz](StructureDefinition-mii-pr-molgen-molekulare-konsequenz.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulare-konsequenz|2026.0.4](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulare-konsequenz|2026.0.4), [Molecular Consequence](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-consequence.html) version: 3.0.0

**Related artifact**: No display for RelatedArtifact (type: citation; citation: Richards et al., Genet Med. 2015; 17:405-24; url: https://pubmed.ncbi.nlm.nih.gov/25741868/)

**status**: Final

**category**: Laboratory, Genetics

**code**: Molecular Consequence

**subject**: [Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient-brca1.md)

**effective**: 2022-11-01

**performer**: [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md)

**derivedFrom**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-brca1.md)

> **component****code**: Conclusion Text**value**: Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt

> **component****code**: Genetic variation clinical significance [Imp]**value**: Pathogenic

> **component****code**: Functional Effect**value**: Funktionsverlust des Genprodukts

> **component****code**: Level of evidence**value**: 2 star



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-molekulare-konsequenz-brca1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekulare-konsequenz",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulare-konsequenz|2026.0.4",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-consequence|3.0.0"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
    "valueRelatedArtifact" : {
      "type" : "citation",
      "citation" : "Richards et al., Genet Med. 2015; 17:405-24",
      "url" : "https://pubmed.ncbi.nlm.nih.gov/25741868/"
    }
  }],
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
      "code" : "molecular-consequence",
      "display" : "Molecular Consequence"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-brca1"
  },
  "effectiveDateTime" : "2022-11-01",
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }],
  "derivedFrom" : [{
    "reference" : "Observation/mii-exa-molgen-variante-brca1"
  }],
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
        "code" : "conclusion-string"
      }]
    },
    "valueString" : "Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt"
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "53037-8",
        "display" : "Genetic variation clinical significance [Imp]"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA6668-3",
        "display" : "Pathogenic"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
        "code" : "functional-effect"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://sequenceontology.org",
        "code" : "SO:0002054",
        "display" : "loss_of_function_variant"
      }],
      "text" : "Funktionsverlust des Genprodukts"
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "93044-6"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/clinvar-evidence-level-custom-cs",
        "code" : "2-star",
        "display" : "2 star"
      }]
    }
  }]
}

```
