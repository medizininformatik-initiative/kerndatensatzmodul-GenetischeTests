# MII EX Mol Gen Verwandtschaftsgrad - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII EX Mol Gen Verwandtschaftsgrad**

## Extension: MII EX Mol Gen Verwandtschaftsgrad 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad | *Version*:2026.0.4 |
| Active as of 2026-08-28 | *Computable Name*:MII_EX_MolGen_Verwandtschaftsgrad |

Extension erlaubt die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [MII PR MolGen Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md)
* Examples for this Extension: [FamilyMemberHistory/mii-exa-molgen-family-member-history-2](FamilyMemberHistory-mii-exa-molgen-family-member-history-2.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-diabetes](FamilyMemberHistory-mii-exa-molgen-family-member-history-diabetes.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-mi](FamilyMemberHistory-mii-exa-molgen-family-member-history-mi.md) and [FamilyMemberHistory/mii-exa-molgen-family-member-history-retinal](FamilyMemberHistory-mii-exa-molgen-family-member-history-retinal.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.csv), [Excel](../StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.xlsx), [Schematron](../StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-ex-molgen-verwandtschaftsgrad",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad",
  "version" : "2026.0.4",
  "name" : "MII_EX_MolGen_Verwandtschaftsgrad",
  "title" : "MII EX Mol Gen Verwandtschaftsgrad",
  "status" : "active",
  "date" : "2026-08-28T15:49:28+00:00",
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
  "description" : "Extension erlaubt die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "FamilyMemberHistory.relationship.coding"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "MII EX Mol Gen Verwandtschaftsgrad",
      "definition" : "Extension erlaubt die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-verwandtschaftsgrad"
      }
    }]
  }
}

```
