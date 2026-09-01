# FASTQ Sequencing Files - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **FASTQ Sequencing Files**

## Beispiel DocumentReference: FASTQ Sequencing Files

-------

**German**

-------

**status**: Current

**type**: FASTQ files - paired-end sequencing data

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

> **content**

### Attachments

| | | | |
| :--- | :--- | :--- | :--- |
| - | **ContentType** | **Url** | **Title** |
| * | application/gzip | [https://www.medizininformatik-initiative.de/fhir/files/sample_R1.fastq.gz](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/files/sample_R1.fastq.gz) | Forward reads |


> **content**

### Attachments

| | | | |
| :--- | :--- | :--- | :--- |
| - | **ContentType** | **Url** | **Title** |
| * | application/gzip | [https://www.medizininformatik-initiative.de/fhir/files/sample_R2.fastq.gz](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=https://www.medizininformatik-initiative.de/fhir/files/sample_R2.fastq.gz) | Reverse reads |




## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "mii-exa-molgen-documentreference-fastq",
  "status" : "current",
  "type" : {
    "text" : "FASTQ files - paired-end sequencing data"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "content" : [{
    "attachment" : {
      "contentType" : "application/gzip",
      "url" : "https://www.medizininformatik-initiative.de/fhir/files/sample_R1.fastq.gz",
      "title" : "Forward reads"
    }
  },
  {
    "attachment" : {
      "contentType" : "application/gzip",
      "url" : "https://www.medizininformatik-initiative.de/fhir/files/sample_R2.fastq.gz",
      "title" : "Reverse reads"
    }
  }]
}

```
