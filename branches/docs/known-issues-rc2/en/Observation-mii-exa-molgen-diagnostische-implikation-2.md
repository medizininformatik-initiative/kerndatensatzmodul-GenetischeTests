# NIPBL Variante Diagnostische Implikation - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NIPBL Variante Diagnostische Implikation**

## Example Observation: NIPBL Variante Diagnostische Implikation

-------

**English**

-------

Profiles: [MII PR MolGen Diagnostische Implikation](StructureDefinition-mii-pr-molgen-diagnostische-implikation.md) version: 2027.0.0-ballot.rc2, [Diagnostic Implication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html) version: 3.0.0

**Related artifact**: No display for RelatedArtifact (type: citation; citation: Richards et al., Genet Med. 2015; 17:405-24; url: https://doi.org/10.1038/gim.2015.30)

**status**: Final

**category**: Laboratory, Genetics

**code**: Diagnostic Implication

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**effective**: 2022-03-16

**performer**: [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md)

**derivedFrom**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-2.md)

> **component****code**: Conclusion Text**value**: Nachweis einer pathogenen Variante im NIPBL-Gen in heterozygoter Form.

> **component****code**: Genetic variation clinical significance [Imp]**value**: Pathogenic

> **component****code**: Condition Inheritance**value**: Autosomal dominant inheritance

> **component****code**: Associated phenotype**value**: De Lange syndrome (disorder)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-diagnostische-implikation-2",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation|2027.0.0-ballot.rc2",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication|3.0.0"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
    "valueRelatedArtifact" : {
      "type" : "citation",
      "citation" : "Richards et al., Genet Med. 2015; 17:405-24",
      "url" : "https://doi.org/10.1038/gim.2015.30"
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
      "code" : "diagnostic-implication",
      "display" : "Diagnostic Implication"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "effectiveDateTime" : "2022-03-16",
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }],
  "derivedFrom" : [{
    "reference" : "Observation/mii-exa-molgen-variante-2"
  }],
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
        "code" : "conclusion-string"
      }]
    },
    "valueString" : "Nachweis einer pathogenen Variante im NIPBL-Gen in heterozygoter Form."
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
        "code" : "condition-inheritance"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://human-phenotype-ontology.org",
        "code" : "HP:0000006",
        "display" : "Autosomal dominant inheritance"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "81259-4",
        "display" : "Associated phenotype"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "40354009",
        "display" : "De Lange syndrome (disorder)"
      }]
    }
  }]
}

```
