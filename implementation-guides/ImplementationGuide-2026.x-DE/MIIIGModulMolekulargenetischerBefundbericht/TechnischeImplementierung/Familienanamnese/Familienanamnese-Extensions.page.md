## Familienanamnese Extensions

### Übersicht

Diese Seite dokumentiert die spezifischen Extensions für die Familienanamnese im Kontext genetischer Analysen. Diese Extensions erweitern die FHIR FamilyMemberHistory Ressource um detaillierte Verwandtschaftsinformationen.

---

### Extension: Verwandtschaftsgrad

**Beschreibung**: Gibt den Verwandtschaftsgrad zwischen Patient und Familienangehörigen an (z.B. erstgradig, zweitgradig).

**URL**: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad`

**Kontext**: `FamilyMemberHistory.relationship.coding`

**Kardinalität**: 0..1

#### ValueSet: Verwandtschaftsgrad

{{render:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-verwandtschaftsgrad}}

**Enthält Konzepte**:
- `SCT#125678001` - First degree blood relative (person)
- `SCT#699110007` - Second degree blood relative (person)

---

### Extension: Verwandtschaftsverhältnis

**Beschreibung**: Spezifiziert das genaue Verwandtschaftsverhältnis zwischen Patient und Familienangehörigen (z.B. natürliches Kind, adoptiert).

**URL**: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis`

**Kontext**: `FamilyMemberHistory.relationship.coding`

**Kardinalität**: 0..1

#### ValueSet: Verwandtschaftsverhältnis

{{render:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-verwandtschaftsverhaeltnis}}

**Beispiel-Konzepte**:
- `SCT#75226009` - Natural child (person)
- `SCT#441869007` - Adopted child (person)

---

### Extension: Familiäre Linie

**Beschreibung**: Gibt die familiäre Linie an (mütterlich oder väterlich), aus der die Verwandtschaft stammt.

**URL**: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-familiare-linie`

**Kontext**: `FamilyMemberHistory.relationship.coding`

**Kardinalität**: 0..1

#### ValueSet: Familiäre Linie

{{render:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-familiaere-linie}}

**Enthält Konzepte**:
- `SCT#72705000` - Mother (person)
- `SCT#66839005` - Father (person)

---

### Verwendungsbeispiel

```json
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

---

### Hinweise zur Implementierung

- Alle drei Extensions sind optional und können unabhängig voneinander verwendet werden
- Die Extensions werden als Teil des `relationship.coding` Elements angehängt
- Die ValueSets verwenden primär SNOMED CT Konzepte
- Bei der Angabe der familiären Linie ist besonders bei genetischen Erbgängen die Unterscheidung zwischen mütterlicher und väterlicher Linie relevant