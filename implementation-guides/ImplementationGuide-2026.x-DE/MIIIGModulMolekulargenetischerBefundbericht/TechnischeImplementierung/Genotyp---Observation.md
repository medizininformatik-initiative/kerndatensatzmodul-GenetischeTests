### {{page-title}}

---

#### Beschreibung

Dieses Profil beschreibt die Feststellung eines bestimmten Genotyps auf der Grundlage einer oder mehrerer Varianten oder Haplotypen.

Als Nomenklatur für Observation.component:cytogenetic-location.valueCodeableConcept kann das CodeSystem Cytogenetic (chromosome) location (NCBI/NLM) verwendet werden für das bislang keine Canonical URl existiert, aber eine OID `urn:oid:2.16.840.1.113883.6.335` aus HL7 Version 2.5.1 Implementation Guide: Laboratory Results Interface.

@```
from StructureDefinition
where url='https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp'
select Name: name, Canonical: url
```

---

Das Profil ist abgeleitet vom Profil [Genotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genotype.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

**Diff**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp, diff}}

---

**Snapshot**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp, snapshot}}

---
| FHIR-Element | Logischer Datensatz |
|---|---|
| Observation.component:gene-studied | Methoden.Getestete Gene |
| Observation.component:CytogenicLocation | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung |
| Observation.component:RefSequenceAssembly | Ergebnisse.Veränderungen.Referenzgenom |
| Observation.device | Methoden.Geräte / Software / Kits |
| Observation.method | Methoden.Methode | 
| Observation.performer | Weiteres.Labor / Institution/ Ansprechpartner |

--- 

**Suchparameter**

Folgende Suchparameter sind für das Modul Pathologie-Befund relevant, auch in Kombination:

1. Der Suchparameter ```_id``` MUSS unterstützt werden:

    Beispiele: 

    ```GET [base]/Observation?_id=example-mii-molgen-variante-1```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. Der Suchparameter "_profile" MUSS unterstützt werden:

    Beispiele:
    
    ```GET [base]/Observation?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. Der Suchparameter "code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?code=http://loinc.org|69548-6```

    Anwendungshinweise: Weitere Informationen zur Suche nach "code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

4. Der Suchparameter "subject" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?subject=Patient/example-mii-molgen-patient```

    Anwendungshinweise: Weitere Informationen zur Suche nach "subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. Der Suchparameter "category" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory```

    Anwendungshinweise: Weitere Informationen zur Suche nach "category" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

6. Der Suchparameter "encounter" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?encounter=Encounter/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "encounter" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

7. Der Suchparameter "code-value-concept" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?code-value-concept=http://loinc.org|69548-6$http://loinc.org|LA9633-4```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "code-value-concept" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

8. Der Suchparameter "code-value-quantity" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?code-value-quantity=http://loinc.org|82155-3$6http://unitsofmeasure.org|1```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "code-value-quantity" finden sich in der [FHIR-Basisspezifikation - Abschnitt "composite"](http://hl7.org/fhir/search.html#composite).

9. Der Suchparameter "component-code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-code=http://loinc.org|48018-6```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "component-code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

10. Der Suchparameter "component-code-value-concept" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-code-value-concept=http://loinc.org|48018-6$http://www.genenames.org/geneId|HGNC:1097```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "component-code-value-concept" finden sich in der [FHIR-Basisspezifikation - Abschnitt "composite"](http://hl7.org/fhir/search.html#composite).

11. Der Suchparameter "component-code-value-quantity" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-code-value-quantity=http://loinc.org|81258-6$ap30%|http://unitsofmeasure.org|%25```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "component-code-value-quantity" finden sich in der [FHIR-Basisspezifikation - Abschnitt "composite"](http://hl7.org/fhir/search.html#composite).

12. Der Suchparameter "component-value-concept" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-value-concept=http://sequenceontology.org|SO:SO:1000008```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "component-code-value-concept" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

13. Der Suchparameter "component-value-quantity" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-value-quantity=ap30%|http://unitsofmeasure.org|%25```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "component-value-quantity" finden sich in der [FHIR-Basisspezifikation - Abschnitt "quantity"](http://hl7.org/fhir/search.html#quantity).

14. Der Suchparameter "date" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?date=2022-07-13```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "date" finden sich in der [FHIR-Basisspezifikation - Abschnitt "date"](http://hl7.org/fhir/R4/search.html#date).

15. Der Suchparameter "derived-from" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?derived-from=Observation/example-mii-molgen-variante-1```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "derived-from" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

16. Der Suchparameter "device" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?device=Device/example-mii-molgen-device-sequencer```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "device" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

17. Der Suchparameter "specimen" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?specimen=Specimen/example-mii-molgen-specimen```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "specimen" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

18. Der Suchparameter "encounter" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?encounter=Encounter/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "encounter" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

19. Der Suchparameter "method" MUSS unterstützt werden:
    
    Beispiele:

    ```GET [base]/Observation?method=http://loinc.org|LA26398-0```

    Anwendungshinweise: Weitere Informationen zur Suche nach "method" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

20. Der Suchparameter "patient" MUSS unterstützt werden:
    
    Beispiele:

    ```GET [base]/Observation?patient=Patient/example-mii-molgen-patient-2```

    Anwendungshinweise: Weitere Informationen zur Suche nach "patient" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

21. Der Suchparameter "performer" MUSS unterstützt werden:
    
    Beispiele:

    ```GET [base]/Observation?performer=Practioner/example-mii-molgen-practitioner-laboratory```

    Anwendungshinweise: Weitere Informationen zur Suche nach "performer" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

22. Der Suchparameter "status" MUSS unterstützt werden:
    
    Beispiele:

    ```GET [base]/Observation?status=final```

    Anwendungshinweise: Weitere Informationen zur Suche nach "status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

---
**Examples**

Beispiel 1: BRAF
{{json:example-mii-molgen-genotyp-1}} 

---
