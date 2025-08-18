---
topic: WorkflowIndex
---

#### {{page-title}}

{{index:current}}

### Überblick

Der Workflow für molekulargenetische Analysen umfasst den gesamten Prozess von der Anforderung einer genetischen Untersuchung bis zur Erstellung des finalen Befundberichts.

### Kernkomponenten

**ServiceRequest (Anforderung)**: Initiiert den diagnostischen Prozess mit spezifischen Fragestellungen und gewünschten Analysen.

**DiagnosticReport (Befundbericht)**: Zentrale Ressource, die alle Ergebnisse, Interpretationen und Empfehlungen zusammenführt und strukturiert darstellt.

### Workflow-Ablauf

1. **Anforderung**: Kliniker stellt Anfrage für genetische Testung mit klinischer Fragestellung
2. **Probenentnahme**: Gewinnung und Vorbereitung der Probe (referenziert durch Specimen)
3. **Durchführung**: Genetische Analyse mittels GenomicStudy
4. **Auswertung**: Identifikation von Varianten und deren Interpretation
5. **Befunderstellung**: Zusammenführung aller Ergebnisse im DiagnosticReport
6. **Empfehlungen**: Ableitung therapeutischer oder diagnostischer Konsequenzen

### Wichtige Verknüpfungen

- ServiceRequest → DiagnosticReport über `basedOn`
- DiagnosticReport → GenomicStudy über Extension
- DiagnosticReport → Observations über `result`
- DiagnosticReport → Tasks über `recommended-action` Extension