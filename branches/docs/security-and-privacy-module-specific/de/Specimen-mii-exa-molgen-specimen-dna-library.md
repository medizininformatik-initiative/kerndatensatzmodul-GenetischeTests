# DNA Library - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **DNA Library**

## Beispiel Specimen: DNA Library

-------

**German**

-------

**identifier**: `https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids`/LIB-2024-001

**type**: DNA Library

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**parent**: [Specimen: identifier = https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids#EDTA-2024-001; type = Plasma specimen](Specimen-mii-exa-molgen-specimen-blood-edta.md)

### Processings

| | | |
| :--- | :--- | :--- |
| - | **Description** | **Time[x]** |
| * | DNA extraction and library preparation using Agilent SureSelect | 2024-01-16 14:00:00+0100 |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "mii-exa-molgen-specimen-dna-library",
  "identifier" : [{
    "system" : "https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids",
    "value" : "LIB-2024-001"
  }],
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "119342007",
      "display" : "Saliva specimen"
    }],
    "text" : "DNA Library"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "parent" : [{
    "reference" : "Specimen/mii-exa-molgen-specimen-blood-edta"
  }],
  "processing" : [{
    "description" : "DNA extraction and library preparation using Agilent SureSelect",
    "timeDateTime" : "2024-01-16T14:00:00+01:00"
  }]
}

```
