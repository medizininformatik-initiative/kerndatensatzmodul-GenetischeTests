<!-- markdownlint-disable MD041 -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Index.page.md, TechnischeImplementierung/Workflow/Index.page.md, TechnischeImplementierung/GenetischeBefunde/Index.page.md, TechnischeImplementierung/GenetischeImplikationen/Index.page.md, TechnischeImplementierung/MolekulareBiomarker/Index.page.md, TechnischeImplementierung/Therapieempfehlungen/Index.page.md, TechnischeImplementierung/Methodik/Index.page.md, TechnischeImplementierung/Familienanamnese/Index.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->
<!-- Deutsche Übersetzung von input/pagecontent/profiles.md (aufgeteilt aus der
     früheren Kombi-Seite profiles-and-extensions.md gemäß der abgestimmten
     TF-KDS-Menüstruktur — eine Seite je Artefakt-Typ). Die acht migrierten
     Simplifier-Index-Seiten stehen hier als h3-Abschnitte; mehrfach vorkommende
     Unterüberschriften ("Überblick", "Kernprofile", "Verknüpfungen",
     "Wichtige Komponenten") sind mit ihrer Profilfamilie qualifiziert. -->
Diese Seite listet die FHIR-Profile des Moduls **Molekulargenetischer Befundbericht**
(Namenskonvention `MII_PR_<Modul>_<Name>`, siehe
[`docs/recipes/add-a-profile.md`](https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/blob/main/docs/recipes/add-a-profile.md) in diesem Repository sowie die
MII-Namenskonventionen). Die Extensions des Moduls stehen auf der Seite
[Extensions](extensions.html).

### Profil-Vererbungshierarchie

#### FHIR Profile

Hinweise zur Verwendung der Elemente im Rahmen der Befundung von Varianten finden sich im Profil [Genomics Report](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-report.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

Die folgende Tabelle zeigt die Vererbungsbeziehungen der Profile in diesem Modul:

##### Profile basierend auf Clinical Genomics STU3

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

##### Profile direkt von FHIR R4

| Profilname | Parent-Ressource (FHIR R4) | Beschreibung |
|------------|---------------------------|--------------|
| MII_PR_MolGen_AnforderungGenetischerTest | ServiceRequest | Anforderung für genetische Tests |
| MII_PR_MolGen_Familienanamnese | FamilyMemberHistory | Familienanamnese |
| MII_PR_MolGen_PolygenerRisikoScore | RiskAssessment | Polygener Risiko-Score |

#### Profil-Beziehungsdiagramm

Das folgende Diagramm visualisiert die Beziehungen zwischen den verschiedenen FHIR-Profilen im Modul:

<img src="MII_MolGen_Profile_Relationships_Final.png" alt="MII Kerndatensatz Modul Molekulargenetik - Profil-Beziehungen" style="width: 100%; max-width: 1200px; margin: 20px 0;" />

**Legende:**
- **Blau (Workflow)**: ServiceRequest und DiagnosticReport als zentrale Workflow-Komponenten
- **Türkis (Study)**: GenomicStudy und GenomicStudyAnalysis für Studiendaten
- **Grün (Finding)**: Genetische Befunde (Variante, Genotyp, Haplotyp)
- **Orange (Biomarker)**: Molekulare Biomarker (MSI, Mutationslast, PRS)
- **Violett (Implication)**: Klinische Implikationen (Diagnostisch, Therapeutisch, Molekular)
- **Grau (Task)**: Empfohlene Maßnahmen (Medikation, Folgemaßnahmen)

### Workflow: Anforderung und Befundbericht

#### Überblick: Workflow

Der Workflow für molekulargenetische Analysen umfasst den gesamten Prozess von der Anforderung einer genetischen Untersuchung bis zur Erstellung des finalen Befundberichts.

#### Kernkomponenten des Workflows

**ServiceRequest (Anforderung)**: Initiiert den diagnostischen Prozess mit spezifischen Fragestellungen und gewünschten Analysen.

**DiagnosticReport (Befundbericht)**: Zentrale Ressource, die alle Ergebnisse, Interpretationen und Empfehlungen zusammenführt und strukturiert darstellt.

#### Workflow-Ablauf

1. **Anforderung**: Kliniker stellt Anfrage für genetische Testung mit klinischer Fragestellung
2. **Probenentnahme**: Gewinnung und Vorbereitung der Probe (referenziert durch Specimen)
3. **Durchführung**: Genetische Analyse mittels GenomicStudy
4. **Auswertung**: Identifikation von Varianten und deren Interpretation
5. **Befunderstellung**: Zusammenführung aller Ergebnisse im DiagnosticReport
6. **Empfehlungen**: Ableitung therapeutischer oder diagnostischer Konsequenzen

#### Verknüpfungen: Workflow

- ServiceRequest → DiagnosticReport über `basedOn`
- DiagnosticReport → GenomicStudy über Extension
- DiagnosticReport → Observations über `result`
- DiagnosticReport → Tasks über `recommended-action` Extension

### Genetische Befunde

#### Überblick: Genetische Befunde

Genetische Befunde dokumentieren die identifizierten genetischen Varianten und deren molekulare Eigenschaften. Diese Observation-basierten Profile bilden die faktische Grundlage für die molekulargenetische Diagnostik ohne interpretative Bewertungen.

#### Kernprofile: Genetische Befunde

**Variante**: Einzelne genetische Veränderung mit detaillierten molekularen Annotationen.

**Genotyp**: Kombination von Allelen an einem bestimmten Genlocus, wichtig für die Vererbungsanalyse.

**Haplotyp**: Gruppe von gekoppelten genetischen Varianten, die gemeinsam vererbt werden.

**Sequence Phase Relationship**: Beschreibt die Phasenbeziehung zwischen Varianten (cis/trans).

#### Wichtige Komponenten der Variante

##### Molekulare Annotation

- HGVS-Notation auf verschiedenen Ebenen (genomisch, Transkript, Protein)
- Referenzsequenzen (bevorzugt MANE-Transkripte)
- Genomische Position (Chromosom, Start, Ende)
- Referenz- und alternative Allele
- Gen-Symbol (HGNC)

##### Allelischer Status

- Zygosität (heterozygot, homozygot, hemizygot)
- Allelfrequenz (VAF - Variant Allele Frequency) in der untersuchten Probe
- Allelic Read Depth (Anzahl der Reads pro Allel)

#### Verknüpfungen: Genetische Befunde

- Varianten können zu Genotypen gruppiert werden (`hasMember`)
- Genotypen können Haplotypen bilden
- Alle Befunde referenzieren die zugehörige GenomicStudy über `partOf`
- Interpretationen in den Implikationen verweisen über `derivedFrom` auf diese Befunde

#### Abgrenzung der Genetischen Befunde

**Nicht in den Befunden enthalten:**
- Pathogenität und klinische Bedeutung → siehe Implikationen
- Coverage und Sequenziertiefe → siehe Methodik (GenomicStudy)
- Qualitätsmetriken → siehe Methodik (GenomicStudyAnalysis)

### Genetische Implikationen

#### Überblick: Genetische Implikationen

Genetische Implikationen bewerten und interpretieren die identifizierten genetischen Befunde hinsichtlich ihrer klinischen Bedeutung. Diese Observation-Profile enthalten die medizinische Einordnung der Varianten.

#### Kernprofile: Genetische Implikationen

**Diagnostische Implikation**: Bewertet die Bedeutung einer Variante für die Diagnosestellung und Krankheitsursache.

**Therapeutische Implikation**: Beschreibt die Auswirkungen auf Therapieentscheidungen und Medikamentenwahl.

**Molekulare Konsequenz**: Dokumentiert die funktionellen Auswirkungen auf Genprodukte (Proteine, RNA).

#### Wichtige Komponenten: Genetische Implikationen

##### Klinische Bewertung

- Pathogenität nach ACMG-Kriterien (pathogen, likely pathogen, VUS, likely benign, benign)
- Evidenzlevel für klinische Aussagen
- Assoziierte Erkrankungen (ICD-10, Orphanet, OMIM)
- Penetranz und Expressivität

##### Therapeutische Relevanz

- Medikamenten-Wirksamkeit (Response/Non-Response)
- Dosisanpassungen basierend auf Genotyp
- Kontraindikationen
- Pharmakogenetische Guidelines (CPIC, DPWG)

##### Molekulare Effekte

- Funktionsverlust (Loss of Function)
- Funktionsgewinn (Gain of Function)
- Dominant-negativer Effekt
- Auswirkung auf Proteinfaltung oder -stabilität

#### Verknüpfungen: Genetische Implikationen

- Implikationen verweisen über `derivedFrom` auf die zugrundeliegenden Varianten
- Therapeutische Implikationen können zu Medikationsempfehlungen führen
- Diagnostische Implikationen können weitere Untersuchungen triggern

#### Evidenz und Quellen

- ClinVar-Klassifikationen
- Literaturverweise (PubMed)
- Datenbank-Einträge (COSMIC, dbSNP, gnomAD)
- Expertenkonsens und Guidelines

### Molekulare Biomarker

#### Überblick: Molekulare Biomarker

Molekulare Biomarker sind aggregierte genomische oder molekulare Messgrößen, die prognostische oder prädiktive Aussagen über Krankheitsverlauf und Therapieansprechen ermöglichen. Alle Biomarker-Profile erben vom [Clinical Genomics STU3 Molecular Biomarker](https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-biomarker.html) Profil.

#### Aktuell definierte Profile (nicht abschließend)

**Mikrosatelliteninstabilität (MSI)**: Marker für DNA-Mismatch-Reparatur-Defizienz, wichtig für Immuntherapie-Entscheidungen.

**Mutationslast (TMB)**: Gesamtzahl somatischer Mutationen pro Megabase, Prädiktor für Checkpoint-Inhibitor-Ansprechen.

**Polygener Risiko-Score (PRS)**: Kombinierte Bewertung multipler genetischer Varianten zur Risikostratifizierung (RiskAssessment-basiert).

#### Erweiterbarkeit

Das Molecular Biomarker Profil ist **flexibel erweiterbar** und wird bereits für weitere Analysen genutzt:

##### In Modul Molekulares Tumorboards (MTB) weiter spezifiziert

- **Immunhistochemie (IHC)**: generische Observations, spezielle Profile für PD-L1 Expression, HER2-Status
- **In-situ-Hybridisierung (ISH)**: z.B. FISH für Genamplifikationen
- **Homologe Rekombinationsdefizienz (HRD)**: inkl. Subskalen

##### Weitere mögliche Biomarker ohne spezifische Genzuordnung

- Chromosomale Instabilität (CIN)
- Klonale Hämatopoese (CHIP)
- Liquid Biopsy Marker (ctDNA-Fraktion)
- Methylierungssignaturen

#### Verknüpfungen: Molekulare Biomarker

- Alle Biomarker erben vom STU3 `molecular-biomarker` Profil
- Referenzieren die zugrundeliegende GenomicStudy über `partOf`
- Können aus verschiedenen Analysemethoden stammen (NGS, IHC, ISH)
- Werden im DiagnosticReport als `result` eingebunden

### Therapieempfehlungen

#### Überblick: Therapieempfehlungen

Therapieempfehlungen dokumentieren konkrete Handlungsanweisungen, die sich aus den genetischen Befunden ergeben. Diese Task-basierten Profile ermöglichen die strukturierte Weitergabe von Empfehlungen.

#### Kernprofile: Therapieempfehlungen

**Medikationsempfehlung**: Pharmakogenetisch begründete Empfehlungen zu Medikamentenwahl und -dosierung.

**Empfohlene Folgemaßnahme**: Weitere diagnostische oder präventive Maßnahmen basierend auf genetischen Befunden.

#### Medikationsempfehlung

- Medikamentenauswahl basierend auf Genotyp
- Dosisanpassungen oder Kontraindikationen
- Evidenzbasis: CPIC, DPWG, PharmGKB
- Beispiele: CYP2D6, TPMT, DPYD, HLA-B*57:01

#### Empfohlene Folgemaßnahme

- Familienuntersuchung bei hereditären Erkrankungen
- Tumorboard-Vorstellung
- Intensivierte Vorsorge
- Genetische Beratung
- Verlaufskontrollen

#### Verknüpfungen: Therapieempfehlungen

- Tasks verweisen über `reasonReference` auf die Implikationen
- DiagnosticReport referenziert Tasks über `recommended-action` Extension
- Task-Status tracking: draft → requested → completed

### Methodik der genomischen Untersuchung

#### Überblick: Methodik

Die Methodik-Profile dokumentieren die technischen Details der durchgeführten genetischen Analysen, von der Probenverarbeitung bis zur bioinformatischen Auswertung.

#### Kernprofile: Methodik

**GenomicStudy**: Übergeordnete Studie, die alle Analysen zu einer Probe zusammenfasst (ersetzt UntersuchteRegion aus STU2, plus umfangreichere Methodikinformation und Workflow-IDs).

**GenomicStudyAnalysis**: Einzelne Analyseschritte innerhalb einer Studie (z.B. Library Prep, Sequenzierung, Bioinformatik).

#### Wichtige Komponenten: Methodik

##### Untersuchte Regionen

- Gene und Genpanels (HGNC)
- Genomische Koordinaten
- Transkripte (MANE bevorzugt)
- Callable/Non-callable Regionen

##### Methodendokumentation

- Sequenzier-Technologie (WGS, WES, Panel)
- Geräte und Kits
- Software-Pipelines und Versionen
- Qualitätsparameter

##### Qualitätsmetriken

- Coverage (Mean, Median)
- Sequenziertiefe
- Q30-Scores
- Callable Regions Prozentsatz

#### Migration von STU2

**UntersuchteRegion (alt)** → **GenomicStudy (neu)**

- Erweiterte Metadaten
- Hierarchische Workflow-Abbildung
- Bessere Gerätedokumentation
- Strukturierte Qualitätsmetriken

#### Verknüpfungen: Methodik

- GenomicStudy wird über Extension vom DiagnosticReport referenziert
- Observations (Varianten) verweisen über `partOf` auf GenomicStudy
- GenomicStudyAnalysis als Extension in GenomicStudy eingebettet
- Specimen-Referenzen für Probenzuordnung

#### Implementierungshinweise: Methodik

- Minimale Implementierung: Nur untersuchte Gene/Regionen
- Erweiterte Implementierung: Vollständige Workflow-Dokumentation
- Forschungsprojekte nutzen erweiterte Metriken
- Routine-Diagnostik fokussiert auf Basis-Informationen

### Familienanamnese

#### Überblick: Familienanamnese

Die Familienanamnese erfasst genetisch relevante Erkrankungen bei Blutsverwandten und ist essentiell für die Interpretation hereditärer Varianten und die Risikoeinschätzung.

#### Kernprofil: Familienanamnese

**FamilyMemberHistory**: Dokumentiert Erkrankungen von Familienangehörigen mit detaillierten Verwandtschaftsinformationen.

#### Wichtige Komponenten: Familienanamnese

##### Verwandtschaftsbeziehung

- Verwandtschaftsgrad (1., 2., 3. Grades)
- Verwandtschaftsverhältnis (leiblich, adoptiert)
- Familiäre Linie (mütterlich, väterlich)
- Spezifische Beziehung (Mutter, Vater, Geschwister, etc.)

##### Erkrankungsdokumentation

- Diagnosen (ICD-10, Orphanet, OMIM)
- Manifestationsalter
- Krankheitsverlauf
- Todesursache (falls zutreffend)

#### Extensions (MII-spezifisch)

Drei spezielle Extensions erweitern die Standardressource:

- **Verwandtschaftsgrad**: Grad der biologischen Verwandtschaft
- **Verwandtschaftsverhältnis**: Art der Beziehung (leiblich/adoptiert)
- **Familiäre Linie**: Mütterliche oder väterliche Seite

Details siehe [Extensions](extensions.html)
<!-- TODO:REVIEW Linkziel umgeschrieben: die Simplifier-Quelle verwies auf
     Extensions/Familienanamnese-Extensions.page.md; dieser Inhalt steht jetzt auf
     extensions.html. -->

#### Klinische Bedeutung der Familienanamnese

- Identifikation hereditärer Muster
- Risikostratifizierung für Anlageträger
- Indikationsstellung für erweiterte Diagnostik
- Familienberatung und Kaskadenscreening

#### Verknüpfungen: Familienanamnese

- Referenziert über `patient` den Indexpatienten
- Kann über `reasonReference` auf genetische Befunde verweisen
- Wird in ServiceRequest als `reasonReference` für Testindikation genutzt
