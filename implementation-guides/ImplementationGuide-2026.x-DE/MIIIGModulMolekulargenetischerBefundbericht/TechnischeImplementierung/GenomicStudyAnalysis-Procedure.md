### {{page-title}}

---

#### Beschreibung

Dieses Profil beschreibt eine Genomic Study Analysis als Procedure-Ressource zur detaillierten Dokumentation der Analyseschritte innerhalb einer genomischen Untersuchung. Es arbeitet in Verbindung mit dem GenomicStudy-Profil und folgt den Vorgaben des Clinical Genomics Reporting STU3.

GenomicStudyAnalysis erfasst spezifische Analyseparameter wie untersuchte Genomregionen, verwendete Referenzassemblies und Analysetools.

@```
from StructureDefinition
where url='https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis'
select Name: name, Canonical: url
```

---

Das Profil ist abgeleitet vom Profil [GenomicStudyAnalysis](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html) aus [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

**Diff**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis, diff}}

---
**Snapshot**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis, snapshot}}

---
| FHIR-Element | Logischer Datensatz |
|---|---|
| Procedure.status | Weiteres.Berichtstatus |
| Procedure.code | Methoden.Methode |
| Procedure.subject | Probeninformation.Patient |
| Procedure.usedReference | Methoden.Geräte / Software / Kits |
| Procedure.extension:genomic-study-analysis-regions | Methoden.Start- und Endnukleotid |
| Procedure.extension:genomic-study-analysis-genome-build | Ergebnisse.Veränderungen.Referenzgenom |
| Procedure.note | Methoden.Limitierungen/Bemerkungen |

---

**Suchparameter**

Folgende Suchparameter sind für das GenomicStudyAnalysis-Profil relevant, auch in Kombination:

1. Der Suchparameter ```_id``` MUSS unterstützt werden:

    Beispiele: 

    ```GET [base]/Procedure?_id=example-mii-molgen-genomic-study-analysis-1```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. Der Suchparameter "_profile" MUSS unterstützt werden:

    Beispiele:
    
    ```GET [base]/Procedure?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis```

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

    ```GET [base]/Procedure?code=http://loinc.org|LA26419-4```

    Anwendungshinweise: Weitere Informationen zur Suche nach "code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

--- 

**Examples**

Beispiel 1: GenomicStudyAnalysis für Exom-Sequenzierung

{{json:example-mii-molgen-genomic-study-analysis-1}}

---