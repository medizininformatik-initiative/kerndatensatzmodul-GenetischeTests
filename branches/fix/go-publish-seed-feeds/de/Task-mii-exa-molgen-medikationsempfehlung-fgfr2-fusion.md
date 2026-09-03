# mii-exa-molgen-medikationsempfehlung-fgfr2-fusion - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-medikationsempfehlung-fgfr2-fusion**

## Beispiel Task: mii-exa-molgen-medikationsempfehlung-fgfr2-fusion

-------

**German**

-------

Profiles: [MII PR MolGen Medikationsempfehlung](StructureDefinition-mii-pr-molgen-medikationsempfehlung.md) version: 2027.0.0-ballot.rc1, [Medication Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-medication-recommendation.html) version: 3.0.0

**basedOn**: [ServiceRequest Molecular genetic test (procedure)](ServiceRequest-mii-exa-molgen-anforderung-fgfr2-fusion.md)

**status**: Requested

**intent**: proposal

**code**: Hochselektive FGFR-Inhibitor-Therapie

**for**: [Anonymous Patient Female, DoB: 1964-05 ( pseudonymized (use: usual, ))](Patient-mii-exa-molgen-patient-fgfr2-fusion.md)

**reasonReference**: [Observation Therapeutic Implication](Observation-mii-exa-molgen-therapeutische-implikation-fgfr2-fusion.md)



## Resource Content

```json
{
  "resourceType" : "Task",
  "id" : "mii-exa-molgen-medikationsempfehlung-fgfr2-fusion",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung|2027.0.0-ballot.rc1",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/medication-recommendation|3.0.0"]
  },
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-fgfr2-fusion"
  }],
  "status" : "requested",
  "intent" : "proposal",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA26421-0",
      "display" : "Consider alternative medication"
    }],
    "text" : "Hochselektive FGFR-Inhibitor-Therapie"
  },
  "for" : {
    "reference" : "Patient/mii-exa-molgen-patient-fgfr2-fusion"
  },
  "reasonReference" : {
    "reference" : "Observation/mii-exa-molgen-therapeutische-implikation-fgfr2-fusion"
  }
}

```
