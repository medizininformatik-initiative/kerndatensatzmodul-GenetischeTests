# CNV SMO Molekulare Konsequenz - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **CNV SMO Molekulare Konsequenz**

## Beispiel Observation: CNV SMO Molekulare Konsequenz

-------

**German**

-------

Profiles: [MII PR MolGen Molekulare Konsequenz](StructureDefinition-mii-pr-molgen-molekulare-konsequenz.md), [https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulare-konsequenz|2027.0.0-ballot.rc2](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulare-konsequenz|2027.0.0-ballot.rc2), [Molecular Consequence](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-consequence.html) version: 3.0.0

**Related artifact**: No display for RelatedArtifact (type: citation; citation: Richards et al., Genet Med. 2015; 17:405-24; url: https://pubmed.ncbi.nlm.nih.gov/25741868/)

**status**: Final

**category**: Laboratory, Genetik

**code**: Molecular Consequence

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**effective**: 2022-03-16

**performer**: [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md)

**derivedFrom**: [Observation Genetic variant assessment](Observation-mii-exa-molgen-variante-cnv-4.md)

> **component****code**: Conclusion Text**value**: onkogene Veränderung mögl. Überexpression

> **component****code**: Genetic variation clinical significance [Imp]**value**: Likely pathogenic

> **component****code**: Functional Effect**value**: mögl. Überexpression



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-molekulare-konsequenz-cnv-4",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekulare-konsequenz",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulare-konsequenz|2027.0.0-ballot.rc2",
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
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "effectiveDateTime" : "2022-03-16",
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }],
  "derivedFrom" : [{
    "reference" : "Observation/mii-exa-molgen-variante-cnv-4"
  }],
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
        "code" : "conclusion-string"
      }]
    },
    "valueString" : "onkogene Veränderung mögl. Überexpression"
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
        "code" : "LA26332-9",
        "display" : "Likely pathogenic"
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
        "code" : "SO:0002315",
        "display" : "increased_gene_product_level"
      },
      {
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C36337",
        "display" : "Messenger RNA Overexpression"
      }],
      "text" : "mögl. Überexpression"
    }
  }]
}

```
