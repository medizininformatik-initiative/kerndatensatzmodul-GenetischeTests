# Family History - Father with Type 2 Diabetes - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Family History - Father with Type 2 Diabetes**

## Beispiel FamilyMemberHistory: Family History - Father with Type 2 Diabetes

-------

**German**

-------

Profile: [MII PR MolGen Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md) version: 2026.0.4

**status**: Completed

**patient**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**date**: 2024-01-15

**relationship**: Natural father (person)

**sex**: Male (finding)

**age**: 68 years (Details: UCUM codea = 'a')

**deceased**: false

### Conditions

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Onset[x]** |
| * | Diabetes mellitus, Typ 2: Ohne Komplikationen | 55 years (Details: UCUM codea = 'a') |



## Resource Content

```json
{
  "resourceType" : "FamilyMemberHistory",
  "id" : "mii-exa-molgen-family-member-history-diabetes",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese|2026.0.4"]
  },
  "status" : "completed",
  "patient" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "date" : "2024-01-15",
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
          "code" : "66839005",
          "display" : "Father (person)"
        }
      }],
      "system" : "http://snomed.info/sct",
      "code" : "9947008",
      "display" : "Natural father (person)"
    },
    {
      "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
      "code" : "FTH",
      "display" : "father"
    }]
  },
  "sex" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/administrative-gender",
      "code" : "male"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "248153007",
      "display" : "Male (finding)"
    }]
  },
  "ageAge" : {
    "value" : 68,
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
        "code" : "E11.9",
        "display" : "Diabetes mellitus, Typ 2: Ohne Komplikationen"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "44054006",
        "display" : "Diabetes mellitus type 2 (disorder)"
      }]
    },
    "onsetAge" : {
      "value" : 55,
      "unit" : "years",
      "system" : "http://unitsofmeasure.org",
      "code" : "a"
    }
  }]
}

```
