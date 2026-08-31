# mii-exa-molgen-bundle-befund-2-nipbl-condition-lab - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-bundle-befund-2-nipbl-condition-lab**

## Beispiel Condition: mii-exa-molgen-bundle-befund-2-nipbl-condition-lab

-------

**German**

-------

Profile: [MII PR Diagnose Condition](https://medizininformatik-initiative.github.io/kerndatensatz-basis/2026.0.1/StructureDefinition-mii-pr-diagnose-condition.html)

**clinicalStatus**: Active

**verificationStatus**: Provisional

**code**: Angeborene Fehlbildungssyndrome, die vorwiegend mit Kleinwuchs einhergehen

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**recordedDate**: 2022-03-05 10:49:00+0100

**recorder**: [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md)

**asserter**: [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "mii-exa-molgen-bundle-befund-2-nipbl-condition-lab",
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
      "code" : "provisional"
    }]
  },
  "code" : {
    "coding" : [{
      "extension" : [{
        "url" : "http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit",
        "valueCoding" : {
          "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT",
          "code" : "V"
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
  "recordedDate" : "2022-03-05T10:49:00+01:00",
  "recorder" : {
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  },
  "asserter" : {
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }
}

```
