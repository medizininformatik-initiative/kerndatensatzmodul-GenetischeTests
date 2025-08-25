---
topic: SequencePhaseRelationship
---

## {{page-title}}

### Beschreibung

Zeigt an, ob zwei Varianten in Cis- (gleicher Strang) oder Trans- (entgegengesetzter Strang) Beziehung zueinander stehen.

---

### Profil

<tabs>
  <tab title="Darstellung">{{tree:http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship, buttons}}</tab>
  <tab title="Beschreibung">
        @```
        from
            StructureDefinition
        where
            url = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship'
        select
            Beschreibung: description
        with
            no header
        ```
        @```
        from
            StructureDefinition
        where
            url = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship'
        for
            differential.element
            where
                mustSupport = true
            select Feldname: id, Kurzbeschreibung: short, Hinweise: comment
        ```
  </tab>
  <tab title="XML">{{xml:http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship}}</tab>
  <tab title="JSON">{{json:http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship}}</tab>
  <tab title="Link">{{link:http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship}}</tab>
</tabs>

---

### Terminologie

#### CodeSystem

**Sequence Phase Relationship CodeSystem**

{{render:http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/SequencePhaseRelationshipCS}}

#### ValueSet

**Sequence Phase Relationship ValueSet**

{{render:http://hl7.org/fhir/uv/genomics-reporting/ValueSet/seq-phase-relationship}}

---

### Referenzen

Das Profil entspricht [Sequence Phase Relationship](http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship) aus [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).