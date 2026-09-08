# Mikrosatelliteninstabilität - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Mikrosatelliteninstabilität**

## Beispiel Observation: Mikrosatelliteninstabilität

-------

**German**

-------

Profiles: [MII PR MolGen Mikrosatelliteninstabilität](StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet.md) version: 2027.0.0-ballot.rc2, [Molecular Biomarker](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-biomarker.html) version: 3.0.0

**status**: Final

**category**: Laboratory, A characterization of a given biomarker observation.

**code**: Microsatellite instability [Interpretation] in Cancer specimen Qualitative

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**value**: Stable

**specimen**: [Specimen: identifier = https://biobank.uk-musterstadt.de/fhir/sid/proben#5432; status = available; type = Tissue specimen from colon (specimen)](Specimen-mii-exa-molgen-specimen-1.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-mikrosatelliteninstabilitaet-1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mikrosatelliteninstabilitaet|2027.0.0-ballot.rc2",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-biomarker|3.0.0"]
  },
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
      "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
      "code" : "biomarker-category",
      "display" : "A characterization of a given biomarker observation."
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "81695-9",
      "display" : "Microsatellite instability [Interpretation] in Cancer specimen Qualitative"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA14122-8",
      "display" : "Stable"
    }]
  },
  "specimen" : {
    "reference" : "Specimen/mii-exa-molgen-specimen-1"
  }
}

```
