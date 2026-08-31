# MII VS Mol Gen Verwandtschaftsgrad - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS Mol Gen Verwandtschaftsgrad**

## ValueSet: MII VS Mol Gen Verwandtschaftsgrad 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-verwandtschaftsgrad | *Version*:2026.0.4 |
| Active as of 2026-08-31 | *Computable Name*:MII_VS_MolGen_Verwandtschaftsgrad |

 
ValueSet für die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen. 

 **References** 

* [MII EX Mol Gen Verwandtschaftsgrad](StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (Unsupported Code System Version)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-molgen-verwandtschaftsgrad",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-verwandtschaftsgrad",
  "version" : "2026.0.4",
  "name" : "MII_VS_MolGen_Verwandtschaftsgrad",
  "title" : "MII VS Mol Gen Verwandtschaftsgrad",
  "status" : "active",
  "date" : "2026-08-31T14:37:52+00:00",
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
  "description" : "ValueSet für die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen.",
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
        "code" : "125678001",
        "display" : "First degree blood relative (person)"
      },
      {
        "code" : "699110007",
        "display" : "Second degree blood relative (person)"
      }]
    }]
  }
}

```
