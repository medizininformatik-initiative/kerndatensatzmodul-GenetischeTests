---
topic: MolekulareKonsequenz
---

### {{page-title}}

---

#### Beschreibung

Dieses Profil beschreibt die molekularen Konsequenzen von genetischen Varianten. Es ist ein neues Profil in STU3, das die downstream-Beschreibung von genetischen Änderungen ermöglicht und aus dem Variante-Profil ausgegliedert wurde.

Das MolekulareKonsequenz-Profil fokussiert auf die funktionellen Auswirkungen von Varianten, während das Variante-Profil sich auf die Beschreibung der Variante selbst konzentriert.

@```
from 
    StructureDefinition 
where 
    url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulare-konsequenz' 
select 
    Name: name, Status: status, Version: version, Canonical: url, Basis: baseDefinition
```

---

Das Profil ist abgeleitet vom Profil [MolecularConsequence](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-consequence.html) aus [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profil

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulare-konsequenz, buttons}}

---
| FHIR-Element | Logischer Datensatz |
|---|---|
| Observation.code | Ergebnisse.Veränderungen.Mutationskonsequenz (funktionell) |
| Observation.subject | Probeninformation.Patient |
| Observation.derivedFrom | Referenz zur Variante |
| Observation.component:functional-effect | Ergebnisse.Veränderungen.Mutationskonsequenz (funktionell) |
| Observation.component:feature-consequence | Molekulare Auswirkungen auf Features |
| Observation.status | Weiteres.Berichtstatus |

---

**Suchparameter**

Folgende Suchparameter sind für das MolekulareKonsequenz-Profil relevant, auch in Kombination:

1. Der Suchparameter ```_id``` MUSS unterstützt werden:

    Beispiele: 

    ```GET [base]/Observation?_id=example-mii-molgen-molekulare-konsequenz-1```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. Der Suchparameter "_profile" MUSS unterstützt werden:

    Beispiele:
    
    ```GET [base]/Observation?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulare-konsequenz```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. Der Suchparameter "subject" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?subject=Patient/example-mii-molgen-patient```

    Anwendungshinweise: Weitere Informationen zur Suche nach "subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

4. Der Suchparameter "code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?code=http://loinc.org|81259-4```

    Anwendungshinweise: Weitere Informationen zur Suche nach "code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

5. Der Suchparameter "derived-from" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?derived-from=Observation/example-mii-molgen-variante-1```

    Anwendungshinweise: Weitere Informationen zur Suche nach "derived-from" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

6. Der Suchparameter "component-code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-code=http://loinc.org|53037-8```

    Anwendungshinweise: Weitere Informationen zur Suche nach "component-code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

7. Der Suchparameter "component-value-concept" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-value-concept=http://sequenceontology.org|SO:0001583```

    Anwendungshinweise: Weitere Informationen zur Suche nach "component-value-concept" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

--- 

**Examples**

Beispiel 1: MolekulareKonsequenz für BRAF-Variante

{{json:example-mii-molgen-molekulare-konsequenz-1}}

---

Beispiel 2: MolekulareKonsequenz für NIPBL-Variante

{{json:example-mii-molgen-molekulare-konsequenz-2}}

---