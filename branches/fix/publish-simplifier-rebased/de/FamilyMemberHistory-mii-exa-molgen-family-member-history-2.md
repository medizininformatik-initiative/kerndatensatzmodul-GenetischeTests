# mii-exa-molgen-family-member-history-2 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-family-member-history-2**

## Beispiel FamilyMemberHistory: mii-exa-molgen-family-member-history-2

-------

**German**

-------

Profile: [MII PR MolGen Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md) version: 2027.0.0-ballot.rc2

**status**: Completed

**patient**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**date**: 2022-11-08

**relationship**: Paternal grandmother (person)

**sex**: Female (finding)

**deceased**: true



## Resource Content

```json
{
  "resourceType" : "FamilyMemberHistory",
  "id" : "mii-exa-molgen-family-member-history-2",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese|2027.0.0-ballot.rc2"]
  },
  "status" : "completed",
  "patient" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "date" : "2022-11-08",
  "relationship" : {
    "coding" : [{
      "extension" : [{
        "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad",
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "699110007",
          "display" : "Second degree blood relative (person)"
        }
      },
      {
        "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis",
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "17945006",
          "display" : "Natural grandmother (person)"
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
      "code" : "394858009",
      "display" : "Paternal grandmother (person)"
    },
    {
      "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
      "code" : "PGRMTH",
      "display" : "paternal grandmother"
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
  "deceasedBoolean" : true
}

```
