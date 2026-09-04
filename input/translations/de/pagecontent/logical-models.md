<!-- markdownlint-disable MD041 -->
<!-- Migriert aus dem Simplifier-Leitfaden Anwendungsfaelle-Informationsmodell/Datenstzeinkl.Beschreibungen.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->
<!-- Deutsche Übersetzung von input/pagecontent/logical-models.md
     — beide Dateien müssen dasselbe aussagen. -->
### Logische Modelle

Die logischen Datenmodelle des Moduls **Molekulargenetischer Befundbericht** beschreiben den fachlichen Datensatz unabhängig von der konkreten FHIR-Repräsentation.

#### Datensätze inkl. Beschreibungen

Die Datenelemente im Bereich **Indikation / Anforderung** beschreiben das Ziel der angeforderten Untersuchung und den relevanten Kontext inklusive zuvor durchgeführter Tests und, falls zutreffend, bereits bekannter familiärer Prädispositionen.

Zu den Datenelementen, die im Abschnitt **Methoden** beschrieben werden, gehören sequenzbasierte Analytik-Methoden.

Auf Grundlage der Analyse werden Aussagen zu den erbrachten Ergebnissen innerhalb der **Ergebnisse** gemacht.

Zum Schluss werden die Ergebnisse im Bereich **Interpretation / Expertenmeinung** ausgewertet und interpretiert.

In der thematischen Gruppierung **Weiteres / Formales** finden sich zusätzliche Bemerkungen, Informationen zu dem Test-durchführenden Labor und abrechnungsrelevante Daten.

#### Logisches Modell des Moduls

[LogicalModelMolGen](StructureDefinition-LogicalModelMolGen.html)

Die vollständige Liste der Datensatz-Elemente mit ihrem Pfad und der zugehörigen Erklärung steht im Element-Verzeichnis auf der Artefakt-Seite des logischen Modells; der IG-Publisher erzeugt diese Ansicht automatisch aus der StructureDefinition.

<!-- TODO:REVIEW Die Simplifier-Quellseite erzeugte hier zwei FQL-Tabellen: (1) Name/Canonical des
     logischen Modells - entfällt, weil der IG-Publisher den Artefakt-Header selbst rendert;
     (2) eine Tabelle "Datensatz (path) / Erklaerung (definition)" ueber differential.element -
     ersetzt durch den obigen Verweis auf das Element-Verzeichnis der Artefakt-Seite, die genau
     diese beiden Spalten rendert. Bei Gate C pruefen, ob stattdessen das -dict-Fragment inline
     eingebunden werden soll. -->
#### Domänenmodell

Das folgende Klassendiagramm zeigt dasselbe Modell als Übersicht: welche fachlichen
Konzepte es gibt, wie sie zusammenhängen und — in den Notizen am Rand — durch welche
FHIR-Artefakte dieses Moduls sie umgesetzt werden. Es ist bewusst
implementierungsagnostisch: Datentypen und Kardinalitäten sind hier Orientierung, nicht
Vorgabe. Verbindlich ist, was die [Profile](profiles.html) festlegen.

<img src="MII_MolGen_LogicalModel_Domain_de.svg"
     alt="Domänenmodell des Moduls Molekulargenetischer Befundbericht: Befundbericht, Anforderung mit Indikation, Methoden, Ergebnisse mit Veränderungen und molekularen Biomarkern, Interpretation sowie Labor, mit ihren Beziehungen und der Zuordnung zu FHIR-Artefakten"
     style="width: 100%; max-width: 1400px; margin: 20px 0;" />

Die Quelle liegt als PlantUML im Repository. Sie ist in eine sprachneutrale Struktur
(`input/images-source/logical-model-domain.iuml`) und je eine Beschriftungsdatei pro
Sprache aufgeteilt, damit die deutsche und die englische Fassung strukturell nicht
auseinanderlaufen können.
