# MII VS MolGen Verwandtschaftsverhaeltnis - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS MolGen Verwandtschaftsverhaeltnis**

## ValueSet: MII VS MolGen Verwandtschaftsverhaeltnis 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-verwandtschaftsverhaeltnis | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2026-09-04 | *Computable Name*:MII_VS_MolGen_Verwandtsverhaeltnis |

 
ValueSet für die Angabe eines Verwandtschaftsverhältnis zwischen Patient und Familienangehörigen. 

 **References** 

* [MII EX MolGen Verwandtschaftsverhaeltnis](StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-molgen-verwandtschaftsverhaeltnis",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-verwandtschaftsverhaeltnis",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_VS_MolGen_Verwandtsverhaeltnis",
  "title" : "MII VS MolGen Verwandtschaftsverhaeltnis",
  "status" : "active",
  "date" : "2026-09-04T11:22:02+00:00",
  "publisher" : "Medizininformatik-Initiative",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "Medizininformatik-Initiative"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "Medizininformatik-Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    },
    {
      "system" : "email",
      "value" : "info@medizininformatik-initiative.de"
    }]
  }],
  "description" : "ValueSet für die Angabe eines Verwandtschaftsverhältnis zwischen Patient und Familienangehörigen.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "75226009",
        "display" : "Natural child (person)"
      },
      {
        "code" : "13646006",
        "display" : "Natural parent (person)"
      },
      {
        "code" : "60614009",
        "display" : "Natural brother (person)"
      },
      {
        "code" : "73678001",
        "display" : "Natural sister (person)"
      },
      {
        "code" : "45929001",
        "display" : "Half-brother (person)"
      },
      {
        "code" : "2272004",
        "display" : "Half-sister (person)"
      },
      {
        "code" : "62296006",
        "display" : "Natural grandfather (person)"
      },
      {
        "code" : "17945006",
        "display" : "Natural grandmother (person)"
      }]
    }]
  }
}

```
