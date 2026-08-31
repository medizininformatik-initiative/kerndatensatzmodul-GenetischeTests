# BED File for Target Regions - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **BED File for Target Regions**

## Beispiel DocumentReference: BED File for Target Regions

-------

**German**

-------

**status**: Current

**type**: BED file - Agilent SureSelect V7 target regions

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

> **content**

### Attachments

| | | | |
| :--- | :--- | :--- | :--- |
| - | **ContentType** | **Url** | **Title** |
| * | text/plain | [https://www.medizininformatik-initiative.de/fhir/files/agilent_v7_targets.bed](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2026.0.0&canonical=https://www.medizininformatik-initiative.de/fhir/files/agilent_v7_targets.bed) | Agilent SureSelect Human All Exon V7 Target Regions |




## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "mii-exa-molgen-documentreference-bed-file",
  "status" : "current",
  "type" : {
    "text" : "BED file - Agilent SureSelect V7 target regions"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "content" : [{
    "attachment" : {
      "contentType" : "text/plain",
      "url" : "https://www.medizininformatik-initiative.de/fhir/files/agilent_v7_targets.bed",
      "title" : "Agilent SureSelect Human All Exon V7 Target Regions"
    }
  }]
}

```
