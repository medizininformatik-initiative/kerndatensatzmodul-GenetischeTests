# BRAF Variante Medikationsempfehlung - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **BRAF Variante Medikationsempfehlung**

## Beispiel Task: BRAF Variante Medikationsempfehlung

-------

**German**

-------

Profiles: [MII PR MolGen Medikationsempfehlung](StructureDefinition-mii-pr-molgen-medikationsempfehlung.md) version: 2027.0.0-ballot.rc2, [Medication Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-medication-recommendation.html) version: 3.0.0

**basedOn**: [ServiceRequest Molecular genetic test (procedure)](ServiceRequest-mii-exa-molgen-anforderung-1.md)

**status**: Requested

**intent**: proposal

**code**: Alternative Medikation in Erwägung ziehen

**for**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**reasonReference**: [Observation Therapeutic Implication](Observation-mii-exa-molgen-therapeutische-implikation-1.md)



## Resource Content

```json
{
  "resourceType" : "Task",
  "id" : "mii-exa-molgen-medikationsempfehlung-1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung|2027.0.0-ballot.rc2",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/medication-recommendation|3.0.0"]
  },
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-1"
  }],
  "status" : "requested",
  "intent" : "proposal",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA26421-0",
      "display" : "Consider alternative medication"
    }],
    "text" : "Alternative Medikation in Erwägung ziehen"
  },
  "for" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "reasonReference" : {
    "reference" : "Observation/mii-exa-molgen-therapeutische-implikation-1"
  }
}

```
