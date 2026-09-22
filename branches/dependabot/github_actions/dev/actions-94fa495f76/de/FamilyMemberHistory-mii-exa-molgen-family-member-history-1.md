# mii-exa-molgen-family-member-history-1 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-family-member-history-1**

## Beispiel FamilyMemberHistory: mii-exa-molgen-family-member-history-1

-------

**German**

-------

Profile: [MII PR MolGen Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md) version: 2027.0.0-ballot.rc1

**status**: Completed

**patient**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**date**: 2022-04-07

**relationship**: Mother (person)

**sex**: Female (finding)

**deceased**: true

**reasonCode**: Adenocarcinoma of anorectum (disorder)

### Conditions

| | | |
| :--- | :--- | :--- |
| - | **Code** | **ContributedToDeath** |
| * | Malignant melanoma with B-Raf proto-oncogene, serine/threonine kinase V600E mutation (disorder) | true |



## Resource Content

```json
{
  "resourceType" : "FamilyMemberHistory",
  "id" : "mii-exa-molgen-family-member-history-1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese|2027.0.0-ballot.rc1"]
  },
  "status" : "completed",
  "patient" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "date" : "2022-04-07",
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
      "code" : "447886005",
      "display" : "Adenocarcinoma of anorectum (disorder)"
    }]
  }],
  "condition" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "830150003",
        "display" : "Malignant melanoma with B-Raf proto-oncogene, serine/threonine kinase V600E mutation (disorder)"
      }]
    },
    "contributedToDeath" : true
  }]
}

```
