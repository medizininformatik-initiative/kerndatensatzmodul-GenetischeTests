# mii-exa-molgen-befundbericht-srcc - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-befundbericht-srcc**

## Beispiel DiagnosticReport: mii-exa-molgen-befundbericht-srcc

-------

**German**

-------

Profiles: [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md) version: 2027.0.0-ballot.rc2, [Genomic Report](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-report.html) version: 3.0.0

## Genetic analysis report (Genetics) 

| | |
| :--- | :--- |
| Subject | Anonymous Patient Male, DoB: 1986-01 ( pseudonymized (use: usual, )) |
| Performer | [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md) |

**Report Details**

* **Code**: [Diagnostic Implication](Observation-mii-exa-molgen-diagnostische-implikation-srcc-ctnna1.md)
  * **Value**: 
  * **Flags**: Final
  * **Relevant Time**: 2022-11-30
* **Code**: [Genetic variant assessment](Observation-mii-exa-molgen-variante-srcc-ctnna1.md)
  * **Value**: Present
  * **Flags**: Final
  * **Relevant Time**: 2022-11-30

Nachweis der pathogenen Variante im CTNNA1-Gen.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "mii-exa-molgen-befundbericht-srcc",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht|2027.0.0-ballot.rc2",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report|3.0.0"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo",
    "valueReference" : {
      "reference" : "FamilyMemberHistory/mii-exa-molgen-family-member-history-srcc"
    }
  }],
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-srcc"
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
    "reference" : "Patient/mii-exa-molgen-patient-srcc"
  },
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }],
  "specimen" : [{
    "reference" : "Specimen/mii-exa-molgen-specimen-srcc"
  },
  {
    "reference" : "Specimen/mii-exa-molgen-specimen-srcc-2"
  }],
  "result" : [{
    "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-srcc-ctnna1"
  },
  {
    "reference" : "Observation/mii-exa-molgen-variante-srcc-ctnna1"
  }],
  "conclusion" : "Nachweis der pathogenen Variante im CTNNA1-Gen."
}

```
