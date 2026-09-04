# mii-exa-molgen-specimen-1 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-specimen-1**

## Example Specimen: mii-exa-molgen-specimen-1

-------

**English**

-------

Profile: [MII PR Biobank Specimen Bioprobe Core](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.biobank@2027.0.0-ballot.rc2&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore)

**identifier**: `https://biobank.uk-musterstadt.de/fhir/sid/proben`/5432

**status**: Available

**type**: Tissue specimen from colon (specimen)

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)

### Collections

| | | |
| :--- | :--- | :--- |
| - | **Collected[x]** | **BodySite** |
| * | 2022-03-24 12:44:00+0100 | Colon structure (body structure) |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "mii-exa-molgen-specimen-1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore"]
  },
  "identifier" : [{
    "system" : "https://biobank.uk-musterstadt.de/fhir/sid/proben",
    "value" : "5432"
  }],
  "status" : "available",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "128159001",
      "display" : "Tissue specimen from colon (specimen)"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "collection" : {
    "collectedDateTime" : "2022-03-24T12:44:00+01:00",
    "bodySite" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "71854001",
        "display" : "Colon structure (body structure)"
      }]
    }
  }
}

```
