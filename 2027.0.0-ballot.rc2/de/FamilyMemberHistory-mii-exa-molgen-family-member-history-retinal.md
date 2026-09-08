# Family History - Sister with Retinal Disorder - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Family History - Sister with Retinal Disorder**

## Beispiel FamilyMemberHistory: Family History - Sister with Retinal Disorder

-------

**German**

-------

Profile: [MII PR MolGen Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md) version: 2027.0.0-ballot.rc2

**status**: Completed

**patient**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**date**: 2024-02-20

**relationship**: Natural sister (person)

**sex**: Female (finding)

**age**: 42 years (Details: UCUM codea = 'a')

**deceased**: false

### Conditions

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Code** | **Onset[x]** | **Note** |
| * | Sonstige näher bezeichnete Affektionen der Netzhaut | 38 years (Details: UCUM codea = 'a') | > Entwicklung einer Makuladegeneration mit progressivem Verlauf |



## Resource Content

```json
{
  "resourceType" : "FamilyMemberHistory",
  "id" : "mii-exa-molgen-family-member-history-retinal",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese|2027.0.0-ballot.rc2"]
  },
  "status" : "completed",
  "patient" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "date" : "2024-02-20",
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
          "code" : "73678001",
          "display" : "Natural sister (person)"
        }
      }],
      "system" : "http://snomed.info/sct",
      "code" : "73678001",
      "display" : "Natural sister (person)"
    },
    {
      "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
      "code" : "SIS",
      "display" : "sister"
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
  "ageAge" : {
    "value" : 42,
    "unit" : "years",
    "system" : "http://unitsofmeasure.org",
    "code" : "a"
  },
  "deceasedBoolean" : false,
  "condition" : [{
    "code" : {
      "coding" : [{
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024",
        "code" : "H35.8",
        "display" : "Sonstige näher bezeichnete Affektionen der Netzhaut"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "95695004",
        "display" : "Degeneration of retina"
      }]
    },
    "onsetAge" : {
      "value" : 38,
      "unit" : "years",
      "system" : "http://unitsofmeasure.org",
      "code" : "a"
    },
    "note" : [{
      "text" : "Entwicklung einer Makuladegeneration mit progressivem Verlauf"
    }]
  }]
}

```
