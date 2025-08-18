---
topic: BefundberichtDiagnosticReport
---

### {{page-title}}

---

#### Beschreibung

Dieses Profil beschreibt molekulargenetischen Befundbericht der Medizininformatik-Initiative.

@```
from StructureDefinition
where url='https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht'
select Name: name, Canonical: url
```

---

Das Profil ist abgeleitet vom Profil [Genomics Report](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomics-report.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

Für den Use Case, dass die EBM Abrechnungsziffern in einem Befund angegeben werden, <br/>
wird die [Supporting Information Extension](http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo) in DiagnosticReport.extension mit Reference auf ChargeItem Ressource verwendet. 
<br/>
Ein passendes [Profil für ChargeItem](http://fhir.de/StructureDefinition/chargeitem-de-ebm) kann aus den deutschen FHIR Basisprofilen verwendet werden. 

---

#### Profil

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht, buttons}}

---

#### Extensions

**Genomics Artifact**

* Name: Genomics Artifact
* Definition: Erfasst Zitate, Beweise und andere unterstützende Unterlagen für die Beobachtung oder den Bericht.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact

{{tree:http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact, buttons}}

---

**Genomics File**

* Name: Genomics File
* Definition: Wird verwendet, um den Inhalt von oder Links zu Dateien zu übermitteln, die als Teil des Testprozesses erstellt wurden. 
Beispiele sind VCF-, BAM-, CRAM- und andere ähnliche Dateien.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-file

{{tree:http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-file, buttons}}

---

**Empfohlene Maßnahme**

* Name: Empfohlene Maßnahme
* Definition: Die Extension verweist auf eine vorgeschlagene Maßnahme, die auf der Grundlage der Ergebnisse des Befundberichts empfohlen wird.
* url: https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme, buttons}}

---

**Genomics Risk Assessment**

* Name: Genomics Risk Assessment
* Definition: RiskAssessment als Teil eines genomischen Berichtes oder einer Beobachtung.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-risk-assessment

{{tree:http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-risk-assessment, buttons}}

---

**Coded Note**

* Name: Coded Note
* Definition: Kommentare zum Bericht, die auch einen kodierten Typ enthalten.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report-note

{{tree:http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report-note, buttons}}

---

**Supporting Info**

* Name: Supporting Info
* Definition: Weitere Informationen, die für diese Beobachtung relevant sein könnten.
* url: http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo

{{tree:http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo, buttons}}

---

| FHIR-Element | Logischer Datensatz |
|---|---|
| DiagnosticReport.status | Weiteres.Berichtstatus |
| DiagnosticReport.issued | Weiteres.Datum des Berichts |
| DiagnosticReport.performer | Weiteres.Labor / Institution/ Ansprechpartner |
| DiagnosticReport.resultsInterpreter | Weiteres.Labor / Institution/ Ansprechpartner |
| DiagnosticReport.media | Ergebnisse.Daten |
| DiagnosticReport.media | Weiteres.Anhänge |
| DiagnosticReport.subject | Probeninformationen.Patient |
| DiagnosticReport.specimen | Probeninformationen.Probe | 
| DiagnosticReport.identifier | Weiteres.Bericht ID |
| DiagnosticReport.extension:supporting-info(ChargeItem) | Anforderung.Einheitlicher Bewertungsmaßstab |
| DiagnosticReport.supporting-info | Methoden.Relevante Parameter |

--- 

**Suchparameter**

Folgende Suchparameter sind für das Modul Pathologie-Befund relevant, auch in Kombination:

1. Der Suchparameter ```_id``` MUSS unterstützt werden:

    Beispiele: 

    ```GET [base]/DiagnosticReport?_id=example-mii-molgen-molekulargenetischer-befundbericht-1```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. Der Suchparameter "_profile" MUSS unterstützt werden:

    Beispiele:
    
    ```GET [base]/DiagnosticReport?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. Der Suchparameter "code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?code=http://loinc.org|51969-4```

    Anwendungshinweise: Weitere Informationen zur Suche nach "code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

4. Der Suchparameter "subject" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?subject=Patient/example-mii-molgen-patient```

    Anwendungshinweise: Weitere Informationen zur Suche nach "subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. Der Suchparameter "category" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?category=http://terminology.hl7.org/CodeSystem/v2-0074|GE```

    Anwendungshinweise: Weitere Informationen zur Suche nach "category" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

6. Der Suchparameter "encounter" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?encounter=Encounter/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "encounter" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

7. Der Suchparameter "date" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?date=2022-07-13```

    Anwendungshinweise: Weitere Informationen zur Suche nach "date" finden sich in der [FHIR-Basisspezifikation - Abschnitt "date"](http://hl7.org/fhir/R4/search.html#date).

8. Der Suchparameter "issued" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?issued=2022-07-13```

    Anwendungshinweise: Weitere Informationen zur Suche nach "issued" finden sich in der [FHIR-Basisspezifikation - Abschnitt "date"](http://hl7.org/fhir/R4/search.html#date).

9. Der Suchparameter "performer" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?performer=Practioner/example-mii-molgen-practitioner-laboratory```

    Anwendungshinweise: Weitere Informationen zur Suche nach "performer" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

10. Der Suchparameter "requestor" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?requestor=Practioner/example-mii-molgen-practitioner-physician```

    Anwendungshinweise: Weitere Informationen zur Suche nach "requestor" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

11. Der Suchparameter "specimen" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?specimen=Specimen/example-mii-molgen-specimen```

    Anwendungshinweise: Weitere Informationen zur Suche nach "specimen" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

12. Der Suchparameter "status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?status=final```

    Anwendungshinweise: Weitere Informationen zur Suche nach "status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

13. Der Suchparameter "result" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?result=Observation/example-mii-molgen-variante-1```

    Anwendungshinweise: Weitere Informationen zur Suche nach "result" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

14. Der Suchparameter "media" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?media=Media/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "media" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

15. Der Suchparameter "conclusion" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/DiagnosticReport?conclusion=http://snomed.info/sct|830150003```

    Anwendungshinweise: Weitere Informationen zur Suche nach "conclusion" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).



---

**Examples**

Befundbericht-1 BRAF

{{json:example-mii-molgen-molekulargenetischer-befundbericht-1}}  

---

Befundbericht-2 NIPBL

{{json:example-mii-molgen-molekulargenetischer-befundbericht-2}}  

---

Die in Befundbericht-2 abzurechnenden EBM-Ziffern werden separat in ChargeItem Ressourcen erfasst.

{{json:example-mii-molgen-chargeitem-ebm-2}} 

---

Befundbericht-3 Risk-Panel

{{json:mii-exa-molgen-molekulargenetischer-befundbericht-brca1}} 

---