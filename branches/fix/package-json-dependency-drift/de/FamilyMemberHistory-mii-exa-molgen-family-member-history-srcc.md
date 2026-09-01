# mii-exa-molgen-family-member-history-srcc - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-family-member-history-srcc**

## Beispiel FamilyMemberHistory: mii-exa-molgen-family-member-history-srcc

-------

**German**

-------

Profile: [MII PR MolGen Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md) version: 2026.0.4

**status**: Completed

**patient**: [Anonymous Patient Male, DoB: 1986-01 ( pseudonymized (use: usual, ))](Patient-mii-exa-molgen-patient-srcc.md)

**date**: 2022-11-30

**relationship**: Mother (person)

**sex**: Female (finding)

**deceased**: true

**reasonCode**: Malignant tumor of stomach

### Conditions

| | | |
| :--- | :--- | :--- |
| - | **Code** | **ContributedToDeath** |
| * | Malignant neoplasm of breast (disorder) | true |



## Resource Content

```json
{
  "resourceType" : "FamilyMemberHistory",
  "id" : "mii-exa-molgen-family-member-history-srcc",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese|2026.0.4"]
  },
  "status" : "completed",
  "patient" : {
    "reference" : "Patient/mii-exa-molgen-patient-srcc"
  },
  "date" : "2022-11-30",
  "relationship" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "72705000",
      "display" : "Mother (person)"
    },
    {
      "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
      "code" : "MTH",
      "display" : "mother"
    }]
  },
  "sex" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/administrative-gender",
      "code" : "female"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "248152002",
      "display" : "Female (finding)"
    }]
  },
  "deceasedBoolean" : true,
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "363349007",
      "display" : "Malignant tumor of stomach"
    }]
  }],
  "condition" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "254837009",
        "display" : "Malignant neoplasm of breast (disorder)"
      }]
    },
    "contributedToDeath" : true
  }]
}

```
