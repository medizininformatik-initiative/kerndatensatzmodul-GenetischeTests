# Extensions - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* **Extensions**

## Extensions

### Extensions

This page lists the FHIR extensions defined by the **Molekulargenetischer Befundbericht** module (naming convention `MII_EX_<Module>_<Name>`). Extensions carry information the base resources and profiles cannot express; the profiles that use them are on the [Profiles](profiles.md) page.

#### Overview: family history extensions

This section documents the specific extensions for the family history in the context of genetic analyses. These extensions add detailed information about family relationships to the FHIR FamilyMemberHistory resource.

-------

#### Extension: Verwandtschaftsgrad (degree of relationship)

**Description**: States the degree of relationship between the patient and the family member (e.g. first degree, second degree).

**URL**: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad`

**Context**: `FamilyMemberHistory.relationship.coding`

**Cardinality**: 0..1

##### Profile: Verwandtschaftsgrad

[mii-ex-molgen-verwandtschaftsgrad](StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.md)

##### ValueSet: Verwandtschaftsgrad

[mii-vs-molgen-verwandtschaftsgrad](ValueSet-mii-vs-molgen-verwandtschaftsgrad.md)

**Contains the concepts**:

* `SCT#125678001` - First degree blood relative (person)
* `SCT#699110007` - Second degree blood relative (person)

-------

#### Extension: Verwandtschaftsverhältnis (type of relationship)

**Description**: Specifies the exact type of relationship between the patient and the family member (e.g. natural child, adopted).

**URL**: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis`

**Context**: `FamilyMemberHistory.relationship.coding`

**Cardinality**: 0..1

##### Profile: Verwandtschaftsverhältnis

[mii-ex-molgen-verwandtschaftsverhaeltnis](StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.md)

##### ValueSet: Verwandtschaftsverhältnis

[mii-vs-molgen-verwandtschaftsverhaeltnis](ValueSet-mii-vs-molgen-verwandtschaftsverhaeltnis.md)

**Example concepts**:

* `SCT#75226009` - Natural child (person)
* `SCT#441869007` - Adopted child (person)

-------

#### Extension: Familiäre Linie (family line)

**Description**: States the family line (maternal or paternal) the relationship originates from.

**URL**: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-familiare-linie`

**Context**: `FamilyMemberHistory.relationship.coding`

**Cardinality**: 0..1

##### Profile: Familiäre Linie

[mii-ex-molgen-familiare-linie](StructureDefinition-mii-ex-molgen-familiare-linie.md)

##### ValueSet: Familiäre Linie

[mii-vs-molgen-familiaere-linie](ValueSet-mii-vs-molgen-familiaere-linie.md)

**Contains the concepts**:

* `SCT#72705000` - Mother (person)
* `SCT#66839005` - Father (person)

-------

#### Usage example

```
{
  "resourceType": "FamilyMemberHistory",
  "relationship": {
    "coding": [
      {
        "system": "http://snomed.info/sct",
        "code": "72705000",
        "display": "Mother",
        "extension": [
          {
            "url": "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad",
            "valueCoding": {
              "system": "http://snomed.info/sct",
              "code": "125678001",
              "display": "First degree blood relative"
            }
          },
          {
            "url": "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis",
            "valueCoding": {
              "system": "http://snomed.info/sct",
              "code": "75226009",
              "display": "Natural child"
            }
          },
          {
            "url": "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-familiare-linie",
            "valueCoding": {
              "system": "http://snomed.info/sct",
              "code": "72705000",
              "display": "Mother"
            }
          }
        ]
      }
    ]
  }
}

```

-------

#### Implementation notes

* All three extensions are optional and can be used independently of one another
* The extensions are attached as part of the `relationship.coding` element
* The ValueSets primarily use SNOMED CT concepts
* When stating the family line, the distinction between the maternal and the paternal line is particularly relevant for genetic modes of inheritance

