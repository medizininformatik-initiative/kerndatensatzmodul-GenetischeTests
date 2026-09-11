# FFPE-Tumorgewebe (NSCLC) fuer TSO500 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **FFPE-Tumorgewebe (NSCLC) fuer TSO500**

## Beispiel Specimen: FFPE-Tumorgewebe (NSCLC) fuer TSO500

-------

**German**

-------

Profile: [MII PR Biobank Specimen Bioprobe Core](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.biobank@2027.0.0-ballot.rc2&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore)

**identifier**: `https://www.charite.de/fhir/sid/bioproben`/specimen_tso500_ffpe_01

**status**: Available

**type**: Formalin-fixed paraffin-embedded tissue specimen

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**receivedTime**: 2024-05-16 09:20:00+0200

### Collections

| | | |
| :--- | :--- | :--- |
| - | **Collected[x]** | **BodySite** |
| * | 2024-05-15 | Lung structure |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "mii-exa-molgen-specimen-ffpe-tumor",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore"]
  },
  "identifier" : [{
    "system" : "https://www.charite.de/fhir/sid/bioproben",
    "value" : "specimen_tso500_ffpe_01"
  }],
  "status" : "available",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "441652008",
      "display" : "Formalin-fixed paraffin-embedded tissue specimen"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "receivedTime" : "2024-05-16T09:20:00+02:00",
  "collection" : {
    "collectedDateTime" : "2024-05-15",
    "bodySite" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "39607008",
        "display" : "Lung structure"
      }]
    }
  }
}

```
