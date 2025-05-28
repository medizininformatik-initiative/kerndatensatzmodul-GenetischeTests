### Datensätze inkl. Beschreibungen

Die Datenelemente im Bereich **Indikation / Anforderung** beschreiben das Ziel der angeforderten Untersuchung und den relevanten Kontext inklusive zuvor durchgeführter Tests und falls zutreffend bereits bekannte familiäre Prädispositionen.


Zu den Datenelemente, die im Abschnitt **Methoden** beschrieben werden, gehören sequenzbasierte Analytik-Methoden.


Auf Grundlage der Analyse werden Aussagen zu den erbrachten Ergebnissen innerhalb der **Ergebnisse** gemacht.


Zum Schluss werden die Ergebnisse im Bereich **Interpretation / Expertenmeinung** ausgewertet und interpretiert. 


In der thematischen Gruppierung **Weiteres / Formales** finden sich zusätzliche Bemerkungen, Informationen zu dem Test-durchführenden Labor und abrechnugsrelevante Daten. 

---

@```
from StructureDefinition
where url='https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/LogicalModelMolGen'
select Name: name, Canonical: url
```

---

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/LogicalModelMolGen}}

---

@```
from StructureDefinition 
where url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/LogicalModelMolGen'
    for differential.element
    select 
        Datensatz: path, 
        Erklaerung: definition 
```

---