# Molekulargentischer Befund 3: Tumorboard Genfusion - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Molekulargentischer Befund 3: Tumorboard Genfusion**

## Beispiel DiagnosticReport: Molekulargentischer Befund 3: Tumorboard Genfusion

-------

**German**

-------

Profiles: [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md) version: 2027.0.0-ballot.rc1, [Genomic Report](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-report.html) version: 3.0.0

## Genetic analysis report (Genetics) 

| | |
| :--- | :--- |
| Subject | Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, )) |
| Performer | [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md) |

**Report Details**

* **Code**: [Diagnostic Implication](Observation-mii-exa-molgen-diagnostische-implikation-1.md)
  * **Value**: 
  * **Flags**: Final
  * **Relevant Time**: 2022-04-07
* **Code**: [Therapeutic Implication](Observation-mii-exa-molgen-therapeutische-implikation-1.md)
  * **Value**: 
  * **Flags**: Final
  * **Relevant Time**: 2022-04-07
* **Code**: [Genetic variant assessment](Observation-mii-exa-molgen-variante-1.md)
  * **Value**: Present
  * **Flags**: Final
  * **Relevant Time**: 2022-04-07
* **Code**: [Genotype display name](Observation-mii-exa-molgen-genotyp-1.md)
  * **Value**: BRAF rs113488022 T>A
  * **Flags**: Final
  * **Relevant Time**: 2022-04-07
* **Code**: [Mutations/Megabase [# Ratio] in Tumor](Observation-mii-exa-molgen-mutationslast-1.md)
  * **Value**: 12 Mutations/Megabase (Details: UCUM code1/1000000{Base} = '1/1000000{Base}')
  * **Flags**: Final
  * **Relevant Time**: 

Nachweis der bekannten treibenden FGFR2-Fusion



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "mii-exa-molgen-befundbericht-tumorboard-3",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht|2027.0.0-ballot.rc1",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report|3.0.0"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-reference",
    "valueReference" : {
      "reference" : "Procedure/mii-exa-molgen-genomic-study-1"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action",
    "valueReference" : {
      "reference" : "Task/mii-exa-molgen-medikationsempfehlung-1"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action",
    "valueReference" : {
      "reference" : "Task/mii-exa-molgen-folgemassnahme-1"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo",
    "valueReference" : {
      "reference" : "FamilyMemberHistory/mii-exa-molgen-family-member-history-1"
    }
  }],
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-1"
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
    "reference" : "Specimen/mii-exa-molgen-specimen-1"
  }],
  "result" : [{
    "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-1"
  },
  {
    "reference" : "Observation/mii-exa-molgen-therapeutische-implikation-1"
  },
  {
    "reference" : "Observation/mii-exa-molgen-variante-1"
  },
  {
    "reference" : "Observation/mii-exa-molgen-genotyp-1"
  },
  {
    "reference" : "Observation/mii-exa-molgen-mutationslast-1"
  }],
  "conclusion" : "Nachweis der bekannten treibenden FGFR2-Fusion"
}

```
