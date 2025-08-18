### FHIR Profile

Hinweise zur Verwendung der Elemente im Rahmen der Befundung von Varianten finden sich im Profil [Genomics Report](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomics-report.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

### Profil-Vererbungshierarchie

Die folgende Tabelle zeigt die Vererbungsbeziehungen der Profile in diesem Modul:

#### Profile basierend auf Clinical Genomics STU3

| Profilname | Parent-Profil (STU3) | Beschreibung |
|------------|---------------------|--------------|
| MII_PR_MolGen_MolekulargenetischerBefundbericht | genomic-report | Hauptbefundbericht für genetische Analysen |
| MII_PR_MolGen_Variante | variant | Genetische Variante |
| MII_PR_MolGen_Genotyp | genotype | Genotyp-Information |
| MII_PR_MolGen_DiagnostischeImplikation | diagnostic-implication | Diagnostische Bedeutung |
| MII_PR_MolGen_TherapeutischeImplikation | therapeutic-implication | Therapeutische Bedeutung |
| MII_PR_MolGen_MolekulareKonsequenz | molecular-consequence | Molekulare Auswirkung |
| MII_PR_MolGen_Medikationsempfehlung | medication-recommendation | Medikationsempfehlung |
| MII_PR_MolGen_EmpfohleneFolgemassnahme | followup-recommendation | Empfohlene Folgemaßnahme |
| MII_PR_MolGen_GenomicStudy | genomic-study | Genomische Studie |
| MII_PR_MolGen_GenomicStudyAnalysis | genomic-study-analysis | Analyse der genomischen Studie |
| MII_PR_MolGen_Mikrosatelliteninstabilitaet | molecular-biomarker | MSI-Status |
| MII_PR_MolGen_Mutationslast | molecular-biomarker | Tumor-Mutationslast |

#### Profile direkt von FHIR R4

| Profilname | Parent-Ressource (FHIR R4) | Beschreibung |
|------------|---------------------------|--------------|
| MII_PR_MolGen_AnforderungGenetischerTest | ServiceRequest | Anforderung für genetische Tests |
| MII_PR_MolGen_Familienanamnese | FamilyMemberHistory | Familienanamnese |
| MII_PR_MolGen_PolygenerRisikoScore | RiskAssessment | Polygener Risiko-Score |

### Profil-Beziehungsdiagramm

Das folgende Diagramm visualisiert die Beziehungen zwischen den verschiedenen FHIR-Profilen im Modul:

<img src="profile-relationships-final.png" alt="MII Kerndatensatz Modul Molekulargenetik - Profil-Beziehungen" style="width: 100%; max-width: 1200px; margin: 20px 0;" />

**Legende:**
- **Blau (Workflow)**: ServiceRequest und DiagnosticReport als zentrale Workflow-Komponenten
- **Türkis (Study)**: GenomicStudy und GenomicStudyAnalysis für Studiendaten
- **Grün (Finding)**: Genetische Befunde (Variante, Genotyp, Haplotyp)
- **Orange (Biomarker)**: Molekulare Biomarker (MSI, Mutationslast, PRS)
- **Violett (Implication)**: Klinische Implikationen (Diagnostisch, Therapeutisch, Molekular)
- **Grau (Task)**: Empfohlene Maßnahmen (Medikation, Folgemaßnahmen)

Die dicken Pfeile zeigen primäre Beziehungen, während normale Pfeile sekundäre Beziehungen darstellen. Der DiagnosticReport fungiert als zentrale Ressource, die alle Analysen und Befunde zusammenführt.
