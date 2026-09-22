# Family History - Mother with Myocardial Infarction - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Family History - Mother with Myocardial Infarction**

## Beispiel FamilyMemberHistory: Family History - Mother with Myocardial Infarction

-------

**German**

-------

Profile: [MII PR MolGen Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md) version: 2027.0.0-ballot.rc1

**status**: Completed

**patient**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**date**: 2024-03-10

**relationship**: Mother (person)

**sex**: Female (finding)

**deceased**: 71 years (Details: UCUM codea = 'a')

**reasonCode**: Akuter transmuraler Myokardinfarkt an sonstigen Lokalisationen

### Conditions

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Code** | **ContributedToDeath** | **Onset[x]** | **Note** |
| * | Akuter transmuraler Myokardinfarkt an sonstigen Lokalisationen | true | 70 years (Details: UCUM codea = 'a') | > STEMI mit fatalen Komplikationen trotz Akutintervention |



## Resource Content

```json
{
  "resourceType" : "FamilyMemberHistory",
  "id" : "mii-exa-molgen-family-member-history-mi",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese|2027.0.0-ballot.rc1"]
  },
  "status" : "completed",
  "patient" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "date" : "2024-03-10",
  "relationship" : {
    "coding" : [{
      "extension" : [{
        "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad",
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "125678001",
          "display" : "First degree blood relative (person)"
        }
      },
      {
        "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis",
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "13646006",
          "display" : "Natural parent (person)"
        }
      },
      {
        "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-familiare-linie",
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "72705000",
          "display" : "Mother (person)"
        }
      }],
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
  "deceasedAge" : {
    "value" : 71,
    "unit" : "years",
    "system" : "http://unitsofmeasure.org",
    "code" : "a"
  },
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2024",
      "code" : "I21.2",
      "display" : "Akuter transmuraler Myokardinfarkt an sonstigen Lokalisationen"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "401303003",
      "display" : "Acute ST segment elevation myocardial infarction (disorder)"
    }]
  }],
  "condition" : [{
    "code" : {
      "coding" : [{
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024",
        "code" : "I21.2",
        "display" : "Akuter transmuraler Myokardinfarkt an sonstigen Lokalisationen"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "401303003",
        "display" : "Acute ST segment elevation myocardial infarction (disorder)"
      }]
    },
    "contributedToDeath" : true,
    "onsetAge" : {
      "value" : 70,
      "unit" : "years",
      "system" : "http://unitsofmeasure.org",
      "code" : "a"
    },
    "note" : [{
      "text" : "STEMI mit fatalen Komplikationen trotz Akutintervention"
    }]
  }]
}

```
