# MII VS MolGen Family Member SNOMED - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS MolGen Family Member SNOMED**

## ValueSet: MII VS MolGen Family Member SNOMED 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-family-member-snomed | *Version*:2026.0.4 |
| Active as of 2026-09-01 | *Computable Name*:MII_VS_MolGen_FamilyMember_SNOMED |

 
The ValueSet contains codes for related family member types from SNOMED CT. 

 **References** 

* [MII PR MolGen Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-molgen-family-member-snomed",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-family-member-snomed",
  "version" : "2026.0.4",
  "name" : "MII_VS_MolGen_FamilyMember_SNOMED",
  "title" : "MII VS MolGen Family Member SNOMED",
  "status" : "active",
  "date" : "2026-09-01T21:11:35+00:00",
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
  "description" : "The ValueSet contains codes for related family member types from SNOMED CT.",
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
      "filter" : [{
        "property" : "concept",
        "op" : "descendent-of",
        "value" : "125677006"
      }]
    }]
  }
}

```
