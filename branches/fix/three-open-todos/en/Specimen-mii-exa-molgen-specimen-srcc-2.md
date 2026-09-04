# mii-exa-molgen-specimen-srcc-2 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-specimen-srcc-2**

## Example Specimen: mii-exa-molgen-specimen-srcc-2

-------

**English**

-------

Profile: [MII PR Biobank Specimen Bioprobe Core](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.biobank@2027.0.0-ballot.rc2&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore)

**identifier**: `https://www.charite.de/fhir/sid/bioproben`/00070025

**status**: Available

**type**: Blood specimen with edetic acid (specimen)

**subject**: [Anonymous Patient Male, DoB: 1986-01 ( pseudonymized (use: usual, ))](Patient-mii-exa-molgen-patient-srcc.md)

**receivedTime**: 2022-11-30

### Collections

| | |
| :--- | :--- |
| - | **Collected[x]** |
| * | 2022-11-30 |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "mii-exa-molgen-specimen-srcc-2",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore"]
  },
  "identifier" : [{
    "system" : "https://www.charite.de/fhir/sid/bioproben",
    "value" : "00070025"
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
    "reference" : "Patient/mii-exa-molgen-patient-srcc"
  },
  "receivedTime" : "2022-11-30",
  "collection" : {
    "collectedDateTime" : "2022-11-30"
  }
}

```
