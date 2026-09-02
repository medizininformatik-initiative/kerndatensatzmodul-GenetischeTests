# mii-exa-molgen-specimen-brca1 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-specimen-brca1**

## Beispiel Specimen: mii-exa-molgen-specimen-brca1

-------

**German**

-------

Profile: [MII PR Biobank Specimen Bioprobe Core](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.biobank@2026.0.1&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore)

**identifier**: `https://www.charite.de/fhir/sid/bioproben`/specimen_03

**status**: Available

**type**: Tissue specimen from breast (specimen)

**subject**: [Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient-brca1.md)

**receivedTime**: 2022-11-01

### Collections

| | |
| :--- | :--- |
| - | **Collected[x]** |
| * | 2022-11-01 |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "mii-exa-molgen-specimen-brca1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore"]
  },
  "identifier" : [{
    "system" : "https://www.charite.de/fhir/sid/bioproben",
    "value" : "specimen_03"
  }],
  "status" : "available",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "127457009",
      "display" : "Tissue specimen from breast (specimen)"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-brca1"
  },
  "receivedTime" : "2022-11-01",
  "collection" : {
    "collectedDateTime" : "2022-11-01"
  }
}

```
