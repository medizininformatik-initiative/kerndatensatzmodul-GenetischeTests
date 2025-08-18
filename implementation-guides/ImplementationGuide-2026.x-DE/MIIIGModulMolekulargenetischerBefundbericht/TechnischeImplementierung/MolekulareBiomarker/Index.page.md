#### {{page-title}}

{{index:current}}

### Überblick

Molekulare Biomarker sind aggregierte genomische oder molekulare Messgrößen, die prognostische oder prädiktive Aussagen über Krankheitsverlauf und Therapieansprechen ermöglichen. Alle Biomarker-Profile erben vom [Clinical Genomics STU3 Molecular Biomarker](https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-biomarker.html) Profil.

### Aktuell definierte Profile (nicht abschließend)

**Mikrosatelliteninstabilität (MSI)**: Marker für DNA-Mismatch-Reparatur-Defizienz, wichtig für Immuntherapie-Entscheidungen.

**Mutationslast (TMB)**: Gesamtzahl somatischer Mutationen pro Megabase, Prädiktor für Checkpoint-Inhibitor-Ansprechen.

**Polygener Risiko-Score (PRS)**: Kombinierte Bewertung multipler genetischer Varianten zur Risikostratifizierung (RiskAssessment-basiert).

### Erweiterbarkeit

Das Molecular Biomarker Profil ist **flexibel erweiterbar** und wird bereits für weitere Analysen genutzt:

#### In Modul Molekulares Tumorboards (MTB) weiter spezifiziert
- **Immunhistochemie (IHC)**: generische Observations, spezielle Profile für PD-L1 Expression, HER2-Status
- **In-situ-Hybridisierung (ISH)**: z.B. FISH für Genamplifikationen
- **Homologe Rekombinationsdefizienz (HRD)**: inkl. Subskalen

#### Weitere mögliche Biomarker ohne spezifische Genzuordnung
- Chromosomale Instabilität (CIN)
- Klonale Hämatopoese (CHIP)
- Liquid Biopsy Marker (ctDNA-Fraktion)
- Methylierungssignaturen

### Verknüpfungen

- Alle Biomarker erben vom STU3 `molecular-biomarker` Profil
- Referenzieren die zugrundeliegende GenomicStudy über `partOf`
- Können aus verschiedenen Analysemethoden stammen (NGS, IHC, ISH)
- Werden im DiagnosticReport als `result` eingebunden