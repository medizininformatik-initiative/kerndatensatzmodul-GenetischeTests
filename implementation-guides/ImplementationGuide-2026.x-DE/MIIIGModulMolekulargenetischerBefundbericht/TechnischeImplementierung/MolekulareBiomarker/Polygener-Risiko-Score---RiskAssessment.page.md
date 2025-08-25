---
topic: PolygenerRisikoScore
---

#### {{page-title}}

---

#### Beschreibung

Ein polygener Risiko Score (PRS), manchmal auch als polygener Score (PGS) oder genetischer Risikoscore (GRS) bezeichnet, ist eine Schätzung des genetischen Risikos einer Person für ein bestimmtes Merkmal, die durch Aggregation und Quantifizierung der Auswirkungen vieler häufig vorkommender Varianten (in der Regel definiert als Minor-Allel-Häufigkeit ≥1%) im Genom gewonnen wird.

@```
from 
    StructureDefinition 
where 
    url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score' 
select 
    Name: name, Status: status, Version: version, Canonical: url, Basis: baseDefinition
```

---

#### Profil

<tabs>
  <tab title="Darstellung">{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score, buttons}}</tab>
  <tab title="Beschreibung">
        @```
        from
            StructureDefinition
        where
            url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score'
        select
            Beschreibung: description
        with
            no header
        ```
        @```
        from
            StructureDefinition
        where
            url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score'
        for
            differential.element
            where
                mustSupport = true
            select Feldname: id, Kurzbeschreibung: short, Hinweise: comment
        ```
  </tab>
  <tab title="XML">{{xml:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score}}</tab>
  <tab title="JSON">{{json:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score}}</tab>
  <tab title="Link">{{link:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score}}</tab>
</tabs>

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