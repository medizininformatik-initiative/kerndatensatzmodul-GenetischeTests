---
topic: GenomicStudy
---

### {{page-title}}

---

#### Beschreibung

Dieses Profil beschreibt eine Genomic Study als Procedure-Ressource zur Dokumentation der durchgeführten genomischen Untersuchung. Es ersetzt das veraltete UntersuchteRegion-Profil und folgt den Vorgaben des Clinical Genomics Reporting STU3.

GenomicStudy dient zur Erfassung der Metadaten über die durchgeführte genomische Analyse, einschließlich der verwendeten Methoden, untersuchten Regionen und beteiligten Geräte.

@```
from StructureDefinition
where url='https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study'
select Name: name, Canonical: url
```

---

Das Profil ist abgeleitet vom Profil [GenomicStudy](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study.html) aus [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profil

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study, buttons}}

---

#### Must Support Elemente

| FHIR-Element | Bedeutung | Logischer Datensatz |
|---|---|---|
| Procedure.status | Status der genetischen Studie (z.B. completed, cancelled) | Weiteres.Berichtstatus |
| Procedure.code | Art der genomischen Untersuchung | Methoden.Untersuchungsart |
| Procedure.subject | Patient/Proband der Untersuchung | Probeninformation.Patient |
| Procedure.encounter | Fallbezug der Untersuchung | Probeninformation.Fall |
| Procedure.performed[x] | Zeitpunkt oder Zeitraum der Durchführung | Methoden.Durchführungsdatum |
| Procedure.reasonReference | Anforderung/Indikation für die genetische Untersuchung | Anforderung.ServiceRequest |
| Procedure.extension:genomic-study-analysis | Referenzen zu den einzelnen GenomicStudyAnalysis-Ressourcen | Methoden.Analyseschritte |

---

**Suchparameter**

Folgende Suchparameter sind für das GenomicStudy-Profil relevant, auch in Kombination:

1. Der Suchparameter ```_id``` MUSS unterstützt werden:

    Beispiele: 

    ```GET [base]/Procedure?_id=example-mii-molgen-genomic-study-1```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. Der Suchparameter "_profile" MUSS unterstützt werden:

    Beispiele:
    
    ```GET [base]/Procedure?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. Der Suchparameter "subject" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Procedure?subject=Patient/example-mii-molgen-patient```

    Anwendungshinweise: Weitere Informationen zur Suche nach "subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

4. Der Suchparameter "status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Procedure?status=completed```

    Anwendungshinweise: Weitere Informationen zur Suche nach "status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

5. Der Suchparameter "code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Procedure?code=http://loinc.org|33747-0```

    Anwendungshinweise: Weitere Informationen zur Suche nach "code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

--- 

**Examples**

Beispiel 1: GenomicStudy für Panel-Sequenzierung

{{json:example-mii-molgen-genomic-study-1}}

---