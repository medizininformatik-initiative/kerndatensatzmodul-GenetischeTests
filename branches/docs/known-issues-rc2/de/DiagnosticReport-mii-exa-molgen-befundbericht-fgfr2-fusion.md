# mii-exa-molgen-befundbericht-fgfr2-fusion - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-befundbericht-fgfr2-fusion**

## Beispiel DiagnosticReport: mii-exa-molgen-befundbericht-fgfr2-fusion

-------

**German**

-------

Profiles: [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md) version: 2027.0.0-ballot.rc2, [Genomic Report](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-report.html) version: 3.0.0

## Genetic analysis report (Genetics) 

| | |
| :--- | :--- |
| Subject | Anonymous Patient Female, DoB: 1964-05 ( pseudonymized (use: usual, )) |
| Performer | [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md) |

**Report Details**

* **Code**: [Diagnostic Implication](Observation-mii-exa-molgen-diagnostische-implikation-fgfr2-fusion.md)
  * **Value**: 
  * **Flags**: Final
  * **Relevant Time**: 2022-11-30
* **Code**: [Genetic variant assessment](Observation-mii-exa-molgen-variante-fgfr2-fusion.md)
  * **Value**: Present
  * **Flags**: Final
  * **Relevant Time**: 2022-11-30
* **Code**: [Therapeutic Implication](Observation-mii-exa-molgen-therapeutische-implikation-fgfr2-fusion.md)
  * **Value**: 
  * **Flags**: Final
  * **Relevant Time**: 2022-11-30

Nachweis FGFR2-Fusion. Empfehlung: Hochselektive FGFR-Inhibitor-Therapie.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "mii-exa-molgen-befundbericht-fgfr2-fusion",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht|2027.0.0-ballot.rc2",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report|3.0.0"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action",
    "valueReference" : {
      "reference" : "Task/mii-exa-molgen-medikationsempfehlung-fgfr2-fusion"
    }
  }],
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-fgfr2-fusion"
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
    "reference" : "Patient/mii-exa-molgen-patient-fgfr2-fusion"
  },
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }],
  "result" : [{
    "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-fgfr2-fusion"
  },
  {
    "reference" : "Observation/mii-exa-molgen-variante-fgfr2-fusion"
  },
  {
    "reference" : "Observation/mii-exa-molgen-therapeutische-implikation-fgfr2-fusion"
  }],
  "conclusion" : "Nachweis FGFR2-Fusion. Empfehlung: Hochselektive FGFR-Inhibitor-Therapie."
}

```
