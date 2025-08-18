---
topic: AnforderungServiceRequest
---

### {{page-title}}

---

#### Beschreibung

Der Laborauftrag oder die Anfrage, die die Durchführung des genetischen Tests auslöst.

In der Anforderung können auch ein oder mehrere bekannte Symptome über das reasonReference Element als ['Phenotypic Features'](https://build.fhir.org/ig/HL7/phenomics-exchange-ig/branches/v0.1.0/StructureDefinition-PhenotypicFeature.html), die in GA4GH's Phenopackets IG profiliert sind, angegeben werden.


@```
from StructureDefinition
where url='https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test'
select Name: name, Canonical: url
```



#### Profil

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test, buttons}}

---

---
| FHIR-Element | Logischer Datensatz |
|---|---|
| ServiceRequest.reasonCode | Anforderung.Indikation.Indikation |
| ServiceRequest.supportingInfo | Anforderung.Indikation.Gesundheitszustand | 
| ServiceRequest.supportingInfo | Anforderung.Indikation.Anlageträger |
| ServiceRequest.reasonReference | Anforderung.Indikation.Relevante Vorergebnisse |
| ServiceRequest.code | Anforderung.Zu testende Gene |
| ServiceRequest.code.text | Anforderung.Anforderungstext |
| ServiceRequest.authoredOn | Anforderung.Datum der Anforderung |
| ServiceRequest.requester | Anforderung.Anforderer |
| ServiceRequest.note | Anforderung.Anforderung.Anforderungstext |
| ServiceRequest.subject |Anforderung.Probeninformationen.Patient |
| ServiceRequest.supportingInfo | Anforderung.Indikation.Krankengeschichte Familie |

--- 

**Suchparameter**

Folgende Suchparameter sind für das Modul Pathologie-Befund relevant, auch in Kombination:

1. Der Suchparameter ```_id``` MUSS unterstützt werden:

    Beispiele: 

    ```GET [base]/ServiceRequest?_id=1234```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. Der Suchparameter "_profile" MUSS unterstützt werden:

    Beispiele:
    
    ```GET [base]/ServiceRequest?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#all). 

3. Der Suchparameter "code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ServiceRequest?code=http://snomed.info/sct|405825005```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

4. Der Suchparameter "based-on" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ServiceRequest?based-on=ServiceRequest/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "based-on" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. Der Suchparameter "subject" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ServiceRequest?subject=Patient/example-mii-molgen-patient```

    Anwendungshinweise: Weitere Informationen zur Suche nach "subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

6. Der Suchparameter "authored" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ServiceRequest?authored=2022-04-07```

    Anwendungshinweise: Weitere Informationen zur Suche nach "authored" finden sich in der [FHIR-Basisspezifikation - Abschnitt "date"](http://hl7.org/fhir/R4/search.html#date).

7. Der Suchparameter "requestor" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ServiceRequest?requestor=Practioner/example-mii-molgen-practitioner-physician```

    Anwendungshinweise: Weitere Informationen zur Suche nach "requestor" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

8. Der Suchparameter "reason-code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ServiceRequest?reason-code=http://snomed.info/sct|447886005```

    Anwendungshinweise: Weitere Informationen zur Suche nach "reason-code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

9. Der Suchparameter "reason-reference" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/ServiceRequest?reason-reference=Condition/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "reason-reference" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).


---

**Examples**

Anforderung 1 - BRAF

{{json:example-mii-molgen-anforderung-1}} 

---

Beispiel des in der Anforderung 1 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.

{{json:example-mii-molgen-specimen-1}}

---

Anforderung 2 - NIPBL

{{json:example-mii-molgen-anforderung-2}} 

---

Beispiel des in der Anforderung 2 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.

{{json:example-mii-molgen-specimen-2}}

---

Beispiel der Anforderung für das Risk-Panel

{{json:fsh-generated-resources-ServiceRequest-mii-exa-molgen-anforderung-brca1}}