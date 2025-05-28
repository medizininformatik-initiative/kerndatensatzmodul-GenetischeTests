#### {{page-title}}

---

#### Beschreibung

Details zur Krankengeschichte von verwandten Familienmitgliedern.

@```
from StructureDefinition
where url='https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese'
select Name: name, Canonical: url
```

---

**Diff**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese, diff}}

---

**Snapshot**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese, snapshot}}

---

#### Extensions

**Verwandtschaftsgrad**

* Name: Verwandtschaftsgrad
* Definition: Extension erlaubt die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen.
* url: https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-mol-gen-verwandtschaftsgrad

**Snapshot**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad}}

---

**Verwandtschaftsverhältnis**

* Name: Verwandtschaftsverhältnis
* Definition: Extension erlaubt die Angabe eines Verwandtschaftsverhältnisses zwischen Patient und Familienangehörigen.
* url: https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis

**Snapshot**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis}}

---

**Familiäre Linie**

* Name: Familiäre Linie
* Definition: Extension erlaubt die Angabe der familiären Linie zwischen Patient und Familienangehörigen.
* url: https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-familiare-linie

**Snapshot**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-familiare-linie}}

---

| FHIR-Element | Logischer Datensatz |
|---|---|
| FamilyMemberHistory | Anforderung.Indikation.Krankengeschichte Familie |

--- 

**Suchparameter**

Folgende Suchparameter sind für das Modul Pathologie-Befund relevant, auch in Kombination:

1. Der Suchparameter ```_id``` MUSS unterstützt werden:

    Beispiele: 

    ```GET [base]/FamilyMemberHistory?_id=1234```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. Der Suchparameter "_profile" MUSS unterstützt werden:

    Beispiele:
    
    ```GET [base]/FamilyMemberHistory?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. Der Suchparameter "code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/FamilyMemberHistory?code=http://snomed.info/sct|830150003```

    Anwendungshinweise: Weitere Informationen zur Suche nach "code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

4. Der Suchparameter "date" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/FamilyMemberHistory?date=2022-04-07```

    Anwendungshinweise: Weitere Informationen zur Suche nach "date" finden sich in der [FHIR-Basisspezifikation - Abschnitt "date"](http://hl7.org/fhir/R4/search.html#date).

4. Der Suchparameter "patient" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/FamilyMemberHistory?patient=Patient/example-mii-molgen-patient-2```

    Anwendungshinweise: Weitere Informationen zur Suche nach "patient" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. Der Suchparameter "relationship" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/FamilyMemberHistory?relationship=http://snomed.info/sct|72705000```

    Anwendungshinweise: Weitere Informationen zur Suche nach "relationship" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

6. Der Suchparameter "sex" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/FamilyMemberHistory?sex=http://hl7.org/fhir/administrative-gender|female```

    Anwendungshinweise: Weitere Informationen zur Suche nach "sex" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

7. Der Suchparameter "status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/FamilyMemberHistory?status=completed```

    Anwendungshinweise: Weitere Informationen zur Suche nach "status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

8. Der Suchparameter "reason-code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/FamilyMemberHistory?reason-code=http://snomed.info/sct|447886005```

    Anwendungshinweise: Weitere Informationen zur Suche nach "reason-code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

9. Der Suchparameter "reason-reference" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/FamilyMemberHistory?reason-reference=Observation/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "reason-reference" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

---

**Examples**

{{json:example-mii-molgen-family-member-history-1}} 

---

{{json:mii-exa-molgen-family-member-history-2}}  

---