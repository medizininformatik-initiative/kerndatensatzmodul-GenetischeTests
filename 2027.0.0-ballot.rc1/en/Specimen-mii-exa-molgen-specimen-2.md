# mii-exa-molgen-specimen-2 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-specimen-2**

## Example Specimen: mii-exa-molgen-specimen-2

-------

**English**

-------

Profile: [MII PR Biobank Specimen Bioprobe Core](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.biobank@2027.0.0-ballot.rc2&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore)

**identifier**: `https://www.charite.de/fhir/sid/bioproben`/specimen_02

**status**: Available

**type**: Blood specimen with edetic acid (specimen)

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**receivedTime**: 2021-11-24

### Collections

| | |
| :--- | :--- |
| - | **Collected[x]** |
| * | 2021-11-23 |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "mii-exa-molgen-specimen-2",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore"]
  },
  "identifier" : [{
    "system" : "https://www.charite.de/fhir/sid/bioproben",
    "value" : "specimen_02"
  }],
  "status" : "available",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "445295009",
      "display" : "Blood specimen with edetic acid (specimen)"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "receivedTime" : "2021-11-24",
  "collection" : {
    "collectedDateTime" : "2021-11-23"
  }
}

```
