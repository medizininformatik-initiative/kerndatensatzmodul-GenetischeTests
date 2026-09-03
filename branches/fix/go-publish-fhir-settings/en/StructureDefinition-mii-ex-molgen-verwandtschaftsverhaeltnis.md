# MII EX MolGen Verwandtschaftsverhaeltnis - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII EX MolGen Verwandtschaftsverhaeltnis**

## Extension: MII EX MolGen Verwandtschaftsverhaeltnis 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2026-09-03 | *Computable Name*:MII_EX_MolGen_Verwandtschaftsverhaeltnis |

Extension erlaubt die Angabe eines Verwandtschaftsverhältnisses zwischen Patient und Familienangehörigen.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [MII PR MolGen Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md)
* Examples for this Extension: [FamilyMemberHistory/mii-exa-molgen-family-member-history-2](FamilyMemberHistory-mii-exa-molgen-family-member-history-2.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-diabetes](FamilyMemberHistory-mii-exa-molgen-family-member-history-diabetes.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-mi](FamilyMemberHistory-mii-exa-molgen-family-member-history-mi.md) and [FamilyMemberHistory/mii-exa-molgen-family-member-history-retinal](FamilyMemberHistory-mii-exa-molgen-family-member-history-retinal.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.csv), [Excel](../StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.xlsx), [Schematron](../StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-ex-molgen-verwandtschaftsverhaeltnis",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis",
  "version" : "2027.0.0-ballot.rc1",
  "name" : "MII_EX_MolGen_Verwandtschaftsverhaeltnis",
  "title" : "MII EX MolGen Verwandtschaftsverhaeltnis",
  "status" : "active",
  "date" : "2026-09-03T12:55:27+00:00",
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
  "description" : "Extension erlaubt die Angabe eines Verwandtschaftsverhältnisses zwischen Patient und Familienangehörigen.",
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
      "short" : "MII EX MolGen Verwandtschaftsverhaeltnis",
      "definition" : "Extension erlaubt die Angabe eines Verwandtschaftsverhältnisses zwischen Patient und Familienangehörigen."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-verwandtschaftsverhaeltnis"
      }
    }]
  }
}

```
