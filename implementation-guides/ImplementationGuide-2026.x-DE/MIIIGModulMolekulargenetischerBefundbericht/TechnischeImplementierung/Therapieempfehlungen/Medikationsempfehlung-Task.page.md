---
topic: Medikationsempfehlung
---

### {{page-title}}

---

#### Beschreibung

Das Profil dieser Task Ressource dient dazu, auf der Grundlage der genetischen Ergebnisse medikamanetöse Maßnahmen vorzuschlagen.

@```
from 
    StructureDefinition 
where 
    url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung' 
select 
    Name: name, Status: status, Version: version, Canonical: url, Basis: baseDefinition
```

---

Das Profil ist abgeleitet vom Profil [Medication Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-medication-recommendation.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profil

<tabs>
  <tab title="Darstellung">{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung, buttons}}</tab>
  <tab title="Beschreibung">
        @```
        from
            StructureDefinition
        where
            url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung'
        select
            Beschreibung: description
        with
            no header
        ```
        @```
        from
            StructureDefinition
        where
            url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung'
        for
            differential.element
            where
                mustSupport = true
            select Feldname: id, Kurzbeschreibung: short, Hinweise: comment
        ```
  </tab>
  <tab title="XML">{{xml:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung}}</tab>
  <tab title="JSON">{{json:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung}}</tab>
  <tab title="Link">{{link:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung}}</tab>
</tabs>

---

| FHIR-Element | Logischer Datensatz |
|---|---|
| Task | Interpretation.Empfehlungen |

--- 

**Suchparameter**

Folgende Suchparameter sind für das Modul Pathologie-Befund relevant, auch in Kombination:

1. Der Suchparameter ```_id``` MUSS unterstützt werden:

    Beispiele: 

    ```GET [base]/Task?_id=1234```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. Der Suchparameter "_profile" MUSS unterstützt werden:

    Beispiele:
    
    ```GET [base]/Task?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. Der Suchparameter "code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Task?code=http://loinc.org|LA26421-0```

    Anwendungshinweise: Weitere Informationen zur Suche nach "code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

4. Der Suchparameter "based-on" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Task?based-on=ServiceRequest/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "based-on" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. Der Suchparameter "subject" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Task?subject=Patient/example-mii-molgen-patient```

    Anwendungshinweise: Weitere Informationen zur Suche nach "subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).


6. Der Suchparameter "requestor" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Task?requestor=Practioner/example-mii-molgen-practitioner-physician```

    Anwendungshinweise: Weitere Informationen zur Suche nach "requestor" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

7. Der Suchparameter "reason-code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Task?reason-code=http://snomed.info/sct|447886005```

    Anwendungshinweise: Weitere Informationen zur Suche nach "reason-code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

9. Der Suchparameter "reason-reference" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Task?reason-reference=Observation/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "reason-reference" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

10. Der Suchparameter "encounter" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Task?encounter=Encounter/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "encounter" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).



---

**Examples**

Beispiel 1: Medikationsempfehlung basierend auf detektierter BRAF Variante
{{json:example-mii-molgen-medikationsempfehlung-1}}

---