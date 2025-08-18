---
topic: PolygenerRisikoScore
---

#### {{page-title}}

---

#### Beschreibung

Ein polygener Risiko Score (PRS), manchmal auch als polygener Score (PGS) oder genetischer Risikoscore (GRS) bezeichnet, ist eine Schätzung des genetischen Risikos einer Person für ein bestimmtes Merkmal, die durch Aggregation und Quantifizierung der Auswirkungen vieler häufig vorkommender Varianten (in der Regel definiert als Minor-Allel-Häufigkeit ≥1%) im Genom gewonnen wird.

@```
from StructureDefinition
where url='https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score'
select Name: name, Canonical: url
```

---

#### Profil

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score, buttons}}

---

#### Extension

**Einflussfaktor**

* Name: Einflussfaktor
* Definition: Die Extension erweitert RiskAssessment.prediction um die Möglichkeit, weitere ausschlaggebende Faktoren mit Einfluss auf die Risikoberechnung anzugeben.
* url: https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor

**Snapshot**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor, buttons}}

---

**Examples**

{{json:mii-exa-molgen-prs-brca1}} 

---