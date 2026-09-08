# mii-exa-molgen-condition-nipbl-clinical - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-condition-nipbl-clinical**

## Example Condition: mii-exa-molgen-condition-nipbl-clinical

-------

**English**

-------

Profile: [MII PR Diagnose Condition](https://medizininformatik-initiative.github.io/kerndatensatz-basis/2027.0.0-ballot.rc1/StructureDefinition-mii-pr-diagnose-condition.html)

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**code**: Angeborene Fehlbildungssyndrome, die vorwiegend mit Kleinwuchs einhergehen

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**onset**: 2021-09-19 --> (ongoing)

**recordedDate**: 2022-03-06 07:36:00+0100

**recorder**: [Practitioner Dr. Linda Rubens(official)](Practitioner-mii-exa-molgen-practitioner-physician.md)

**asserter**: [Practitioner Dr. Linda Rubens(official)](Practitioner-mii-exa-molgen-practitioner-physician.md)

### Evidences

| | |
| :--- | :--- |
| - | **Detail** |
| * | [Diagnostic Report for 'Genetic analysis report' for '->Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))'](DiagnosticReport-mii-exa-molgen-befundbericht-2.md) |



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "mii-exa-molgen-condition-nipbl-clinical",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose"]
  },
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "active"
    }]
  },
  "verificationStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
      "code" : "confirmed"
    }]
  },
  "code" : {
    "coding" : [{
      "extension" : [{
        "url" : "http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit",
        "valueCoding" : {
          "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT",
          "code" : "G"
        }
      }],
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2021",
      "code" : "Q87.1",
      "display" : "Angeborene Fehlbildungssyndrome, die vorwiegend mit Kleinwuchs einhergehen"
    },
    {
      "system" : "http://www.omim.org",
      "code" : "122470",
      "display" : "Cornelia de Lange syndrome 1"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "onsetPeriod" : {
    "start" : "2021-09-19",
    "_start" : {
      "extension" : [{
        "url" : "http://fhir.de/StructureDefinition/lebensphase",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "255407002",
            "display" : "Neonatal (qualifier value)"
          }]
        }
      }]
    }
  },
  "recordedDate" : "2022-03-06T07:36:00+01:00",
  "recorder" : {
    "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
  },
  "asserter" : {
    "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
  },
  "evidence" : [{
    "detail" : [{
      "reference" : "DiagnosticReport/mii-exa-molgen-befundbericht-2"
    }]
  }]
}

```
