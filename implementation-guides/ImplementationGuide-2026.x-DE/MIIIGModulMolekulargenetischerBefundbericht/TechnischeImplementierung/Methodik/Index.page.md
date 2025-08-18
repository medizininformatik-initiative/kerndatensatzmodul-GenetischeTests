---
topic: MethodikIndex
---

#### {{page-title}}

{{index:current}}

### Überblick

Die Methodik-Profile dokumentieren die technischen Details der durchgeführten genetischen Analysen, von der Probenverarbeitung bis zur bioinformatischen Auswertung.

### Kernprofile

**GenomicStudy**: Übergeordnete Studie, die alle Analysen zu einer Probe zusammenfasst (ersetzt UntersuchteRegion aus STU2, plus umfangreichere Methodikinformation und Workflow-IDs).

**GenomicStudyAnalysis**: Einzelne Analyseschritte innerhalb einer Studie (z.B. Library Prep, Sequenzierung, Bioinformatik).

### Wichtige Komponenten

#### Untersuchte Regionen
- Gene und Genpanels (HGNC)
- Genomische Koordinaten
- Transkripte (MANE bevorzugt)
- Callable/Non-callable Regionen

#### Methodendokumentation
- Sequenzier-Technologie (WGS, WES, Panel)
- Geräte und Kits
- Software-Pipelines und Versionen
- Qualitätsparameter

#### Qualitätsmetriken
- Coverage (Mean, Median)
- Sequenziertiefe
- Q30-Scores
- Callable Regions Prozentsatz

### Migration von STU2

**UntersuchteRegion (alt)** → **GenomicStudy (neu)**
- Erweiterte Metadaten
- Hierarchische Workflow-Abbildung
- Bessere Gerätedokumentation
- Strukturierte Qualitätsmetriken

### Verknüpfungen

- GenomicStudy wird über Extension vom DiagnosticReport referenziert
- Observations (Varianten) verweisen über `partOf` auf GenomicStudy
- GenomicStudyAnalysis als Extension in GenomicStudy eingebettet
- Specimen-Referenzen für Probenzuordnung

### Implementierungshinweise

- Minimale Implementierung: Nur untersuchte Gene/Regionen
- Erweiterte Implementierung: Vollständige Workflow-Dokumentation
- Forschungsprojekte nutzen erweiterte Metriken
- Routine-Diagnostik fokussiert auf Basis-Informationen