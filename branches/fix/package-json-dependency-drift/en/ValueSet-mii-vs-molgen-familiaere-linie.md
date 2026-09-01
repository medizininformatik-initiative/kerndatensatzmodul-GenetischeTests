# MII VS MolGen Familiäre Linie - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS MolGen Familiäre Linie**

## ValueSet: MII VS MolGen Familiäre Linie 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-familiaere-linie | *Version*:2026.0.4 |
| Active as of 2026-09-01 | *Computable Name*:MII_VS_MolGen_FamiliaereLinie |

 
ValueSet für die Angabe der familären Linie zwischen Patient und Familienangehörigen. 

 **References** 

* [MII EX MolGen Familiare Linie](StructureDefinition-mii-ex-molgen-familiare-linie.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-molgen-familiaere-linie",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-familiaere-linie",
  "version" : "2026.0.4",
  "name" : "MII_VS_MolGen_FamiliaereLinie",
  "title" : "MII VS MolGen Familiäre Linie",
  "status" : "active",
  "date" : "2026-09-01T21:55:18+00:00",
  "publisher" : "Medizininformatik Initiative",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "Medizininformatik Initiative"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "Medizininformatik Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    },
    {
      "system" : "email",
      "value" : "info@medizininformatik-initiative.de"
    }]
  }],
  "description" : "ValueSet für die Angabe der familären Linie zwischen Patient und Familienangehörigen.",
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
        "code" : "72705000",
        "display" : "Mother (person)"
      },
      {
        "code" : "66839005",
        "display" : "Father (person)"
      }]
    }]
  }
}

```
