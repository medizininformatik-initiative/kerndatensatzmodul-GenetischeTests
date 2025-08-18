---
topic: Szenarien
---

### Beschreibung von Szenarien für die Anwendung der Module

Rapide Weiterentwicklungen der verfügbaren Sequenzierungstechnologien und genetischen Tests für die Sequenzierung von gesamten Genomen und Exomen ermöglichen es, dass diese hochentwickelten Tests von Leistungsgebern und Patienten für klinische Entscheidungen verwendet werden können. Die Ergebnisse der Tests werden genutzt, um spezifische, genetische Varianten zu identifizieren, die Syndrome beeinflussen, die zu Gesundheitszuständen und/oder dem vorhersehbaren Ansprechen auf eine Behandlung beitragen. Die Implementierung von Präzisionsmedizin ist abhängig von genau diesen Daten, um Diagnosen treffen zu können, Medikamente auszuwählen und den Verlauf der Erkrankung und Behandlung vorhersagen zu können. 

Genetische Tests liefern Informationen zu ursächlichen Zusammenhängen zwischen strukturellen Varianten bzw. Veränderungen des Genoms und potenziellen Erkrankungen und möglichen Therapien. Damit und durch die Verfügbarkeit kostengünstiger Tests haben sie eine sehr hohe Bedeutung für die Medizin gewonnen. Sie werden für die Diagnostik, Differentialdiagnostik und zur Therapieauswahl eingesetzt. Sie liefern weiterhin prognostische und prädiktive Informationen zu spezifischen Therapien (z.B. Pharmacogenomics). Inzwischen sind genetische Tests in allen Bereichen der Medizin von Bedeutung; sie werden sowohl in der Routinediagnostik (z.B. Typisierung von Tumoren) als auch der Forschung ubiquitär angewendet. 

### Konkrete Anwendungsszenarien aus den Beispielen

Die folgenden Szenarien basieren auf den implementierten Beispielen und zeigen typische Anwendungsfälle des Moduls:

#### 1. Somatische Onkologie - BRAF-Mutation bei Kolorektalem Karzinom
**Klinisches Szenario**: Patient mit metastasiertem kolorektalem Adenokarzinom zur Therapiestratifizierung.
- **Fragestellung**: BRAF V600E Mutationsstatus für Anti-EGFR-Therapieentscheidung
- **Methode**: Targeted Panel-Sequenzierung
- **Ergebnis**: BRAF p.Val600Glu Mutation nachgewiesen
- **Implikation**: Kontraindikation für Anti-EGFR-Therapie, Alternative Therapieoptionen erforderlich
- **Beispiel**: `mii-exa-molgen-molekulargenetischer-befundbericht-1`

#### 2. Hereditäre Erkrankung - Cornelia de Lange-Syndrom
**Klinisches Szenario**: Kind mit Entwicklungsverzögerung und charakteristischen Dysmorphiezeichen.
- **Fragestellung**: Molekulargenetische Abklärung bei V.a. Cornelia de Lange-Syndrom
- **Methode**: Einzelgen-Sequenzierung NIPBL
- **Ergebnis**: Pathogene NIPBL-Variante identifiziert
- **Implikation**: Diagnosebestätigung, autosomal-dominanter Erbgang, genetische Beratung der Familie
- **Beispiel**: `mii-exa-molgen-molekulargenetischer-befundbericht-2`

#### 3. Hereditäre Tumorprädisposition - BRCA1 bei familiärer Belastung
**Klinisches Szenario**: Gesunde Frau mit positiver Familienanamnese für Brust- und Eierstockkrebs.
- **Fragestellung**: Prädiktive Testung auf BRCA1/2-Mutationen
- **Methode**: TruRisk Panel (BRCA1, BRCA2, weitere Gene)
- **Ergebnis**: Pathogene BRCA1-Variante c.5266dupC
- **Implikation**: Erhöhtes Krebsrisiko, intensivierte Vorsorge, prophylaktische Optionen, Kaskadenscreening
- **Beispiel**: `mii-exa-molgen-molekulargenetischer-befundbericht-trurisk-panel`

#### 4. Whole Exome Sequencing - Forschungskontext
**Klinisches Szenario**: Umfassende genetische Analyse mit detaillierter technischer Dokumentation.
- **Fragestellung**: Identifikation pathogener Varianten bei unklarer Diagnose
- **Methode**: WES mit mehrstufigem Workflow (Library Prep → Sequenzierung → Bioinformatik)
- **Technische Details**: 
  - Illumina NovaSeq 6000 Sequenzierung
  - Mean Coverage 120x
  - 95.2% Callable Regions
  - BWA-GATK Pipeline v4.2
- **Dokumentation**: Vollständige Geräte-, Kit- und Pipeline-Dokumentation
- **Beispiel**: `mii-exa-molgen-bundle-comprehensive-wes`

#### 5. Molekulares Tumorboard - Therapieempfehlung
**Klinisches Szenario**: Tumorpatient mit komplexem molekularem Profil.
- **Fragestellung**: Identifikation targetable alterations
- **Methode**: Comprehensive Genomic Profiling
- **Ergebnisse**: Multiple Biomarker (MSI, TMB, spezifische Varianten)
- **Implikation**: Personalisierte Therapieempfehlung basierend auf molekularem Profil
- **Task-Generierung**: Medikationsempfehlung und Tumorboard-Vorstellung

### Übergreifende Anwendungsmuster

Diese Szenarien demonstrieren die Vielseitigkeit des Moduls:

1. **Diagnostik**: Bestätigung oder Ausschluss genetischer Erkrankungen
2. **Prädiktiv**: Risikoabschätzung bei gesunden Anlageträgern
3. **Therapiestratifizierung**: Auswahl zielgerichteter Therapien
4. **Familienuntersuchung**: Kaskadenscreening bei hereditären Erkrankungen
5. **Forschung**: Detaillierte Dokumentation für wissenschaftliche Auswertungen

Aufgrund des breiten Einsatzes des Erweiterungsmoduls MOLEKULARGENETISCHER BEFUNDBERICHT sind diese Beispiele repräsentativ für die Anwendungen in den verschiedenen Konsortien.
