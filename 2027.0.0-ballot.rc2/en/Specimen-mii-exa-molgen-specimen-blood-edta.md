# EDTA Blood Sample - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **EDTA Blood Sample**

## Example Specimen: EDTA Blood Sample

-------

**English**

-------

**identifier**: `https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids`/EDTA-2024-001

**type**: Plasma specimen

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient.md)

### Collections

| | |
| :--- | :--- |
| - | **Collected[x]** |
| * | 2024-01-15 09:30:00+0100 |

### Containers

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Type** | **Capacity** | **SpecimenQuantity** |
| * | Evacuated blood collection tube with clot activator | 10 milliliter (Details: UCUM codemL = 'mL') | 10 milliliter (Details: UCUM codemL = 'mL') |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "mii-exa-molgen-specimen-blood-edta",
  "identifier" : [{
    "system" : "https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids",
    "value" : "EDTA-2024-001"
  }],
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "119361006",
      "display" : "Plasma specimen"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "collection" : {
    "collectedDateTime" : "2024-01-15T09:30:00+01:00"
  },
  "container" : [{
    "type" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "767384004",
        "display" : "Evacuated blood collection tube with clot activator"
      }]
    },
    "capacity" : {
      "value" : 10,
      "unit" : "milliliter",
      "system" : "http://unitsofmeasure.org",
      "code" : "mL"
    },
    "specimenQuantity" : {
      "value" : 10,
      "unit" : "milliliter",
      "system" : "http://unitsofmeasure.org",
      "code" : "mL"
    }
  }]
}

```
