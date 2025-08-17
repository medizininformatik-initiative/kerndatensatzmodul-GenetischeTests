---
parent: 
topic: GenomicStudyComprehensive
subject: https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study
---

## {{page-title}}

### Erweiterte Dokumentationsmöglichkeiten mit GenomicStudy/GenomicStudyAnalysis

Die Migration von UntersuchteRegion zu GenomicStudy/GenomicStudyAnalysis in Clinical Genomics Reporting STU3 bietet erheblich erweiterte Möglichkeiten zur technischen Dokumentation molekulargenetischer Analysen. Diese Erweiterungen sind besonders relevant für Forschungsprojekte und klinische Studien, die detaillierte Nachvollziehbarkeit der Methodik erfordern.

### Vorteile der neuen Struktur

#### 1. **Mehrstufige Analyse-Workflows**
GenomicStudy kann multiple GenomicStudyAnalysis-Instanzen referenzieren, wodurch komplexe Workflows präzise abgebildet werden können:
- Library Preparation
- Sequenzierung
- Bioinformatische Auswertung
- Qualitätskontrolle

#### 2. **Geräte- und Kit-Dokumentation**
Vollständige Erfassung der verwendeten Technologie:
- Sequenziergeräte mit Seriennummern
- Library Preparation Systeme
- Enrichment Kits mit Versionen
- Software-Pipelines mit Versionsnummern

#### 3. **Qualitätsmetriken**
Detaillierte technische Metriken für Qualitätssicherung:
- Coverage-Statistiken (Mean, Median, Perzentile)
- Callable/Non-callable Regionen
- Q30-Scores
- Kontaminationsschätzungen

#### 4. **Datenmanagement**
Verknüpfung mit Rohdaten und Analysedateien:
- FASTQ-Dateien
- BED-Dateien für Zielregionen
- VCF-Dateien
- Coverage-Plots

### Anwendungsfälle

Diese erweiterten Dokumentationsmöglichkeiten sind besonders wertvoll für:

1. **Forschungsprojekte**: Vollständige Methodendokumentation für Publikationen
2. **Klinische Studien**: GCP-konforme Dokumentation aller Analyseschritte
3. **Qualitätsmanagement**: Lückenlose Nachvollziehbarkeit für Akkreditierung
4. **Datenintegration**: Strukturierte Metadaten für Multi-Center-Studien

### Implementierung im MII-Kontext

Während die grundlegenden Informationen (welche Gene wurden untersucht) für die MII-Kerndatensätze ausreichend sind, ermöglicht die erweiterte Struktur zusätzliche Use Cases:

- **NUM-DIZ Integration**: Metadaten für zentrale Datenanalyse
- **CORD-MI**: Methodenharmonisierung über Standorte
- **GenomDE**: Technische Standards für Precision Medicine

### Vollständiges Beispiel: Whole Exome Sequencing

Das folgende Beispiel demonstriert die umfassenden Dokumentationsmöglichkeiten anhand einer Whole Exome Sequencing Analyse:

{{json:mii-exa-molgen-bundle-comprehensive-wes}}

### Technische Details im Beispiel

#### Geräte-Dokumentation
```fsh
Instance: mii-exa-molgen-device-illumina-novaseq
* manufacturer = "Illumina Inc."
* modelNumber = "NovaSeq 6000"
* serialNumber = "SN12345"
```

#### Mehrschrittige Analyse
```fsh
* extension[+].url = ".../genomic-study-analysis-ext"
* extension[=].valueReference = Reference(library-prep)
* extension[+].url = ".../genomic-study-analysis-ext"
* extension[=].valueReference = Reference(sequencing)
* extension[+].url = ".../genomic-study-analysis-ext"
* extension[=].valueReference = Reference(bioinformatics)
```

#### Qualitätsmetriken
```fsh
* extension[metrics].extension[metric-type].valueCodeableConcept.text = "Mean Coverage"
* extension[metrics].extension[metric-value].valueQuantity = 120 'X'
* extension[regions].extension[called].valueQuantity = 95.2 '%'
* extension[regions].extension[uncalled].valueQuantity = 4.8 '%'
```

#### Pipeline-Dokumentation
```fsh
* extension[pipeline].extension[name].valueString = "BWA-GATK Best Practices Pipeline v4.2"
* extension[pipeline].extension[description].valueMarkdown = "## Pipeline Components
- BWA-MEM 0.7.17 for alignment
- GATK 4.2.6.1 for variant calling
- VEP 105 for annotation"
```

### Praktische Umsetzung

#### Minimale Implementierung (MII-Kerndatensatz)
Für die Basisfunktionalität des MII-Kerndatensatzes ist eine minimale GenomicStudy ausreichend:
- Referenz zum Patienten
- Untersuchte Gene/Regionen
- Basis-Methode (z.B. "Sequencing")

#### Erweiterte Implementierung (Forschung)
Forschungsprojekte können die vollständigen Möglichkeiten nutzen:
- Komplette Gerätedokumentation
- Detaillierte Qualitätsmetriken
- Pipeline-Versionierung
- Rohdaten-Verknüpfung

### Migration von UntersuchteRegion

Die Migration von der alten UntersuchteRegion-Struktur bietet mehrere Vorteile:

| UntersuchteRegion (alt) | GenomicStudy/Analysis (neu) |
|------------------------|----------------------------|
| Nur Gene/Regionen | Gene + Methode + Qualität |
| Keine Gerätedaten | Vollständige Gerätedokumentation |
| Keine Metriken | Umfassende Qualitätsmetriken |
| Flache Struktur | Hierarchische Workflow-Abbildung |
| Keine Callable-Regions | Explizite Callable/Uncallable Angaben |

### Interoperabilität

Die erweiterte Struktur unterstützt verschiedene Interoperabilitäts-Szenarien:

1. **HL7 FHIR Genomics**: Volle Kompatibilität mit internationalem Standard
2. **GA4GH Standards**: Alignment mit Genomics API Spezifikationen
3. **FAIR Data Principles**: Strukturierte Metadaten für Findability und Reusability
4. **Cross-Site Analysen**: Harmonisierte Methodendokumentation

### Empfehlungen

#### Für MII-Implementierer
- Basis-GenomicStudy für Routine-Diagnostik implementieren
- Erweiterte Features bei Bedarf ergänzen
- Fokus auf untersuchte Gene/Regionen

#### Für Forschungsprojekte
- Vollständige Gerätedokumentation erfassen
- Qualitätsmetriken systematisch dokumentieren
- Pipeline-Versionen tracken
- Rohdaten-Referenzen einbinden

#### Für Qualitätsmanagement
- Callable/Uncallable Regions dokumentieren
- Coverage-Metriken erfassen
- Geräte-Wartungsdaten verknüpfen

### Ausblick

Die erweiterten Dokumentationsmöglichkeiten von GenomicStudy/GenomicStudyAnalysis schaffen die Grundlage für:

- **Automatisierte Qualitätskontrolle**: Regelbasierte Prüfung von Metriken
- **Cross-Site Benchmarking**: Vergleich von Sequenzierqualität
- **AI/ML Integration**: Strukturierte Metadaten für Trainingsmodelle
- **Precision Medicine**: Methodenabhängige Varianteninterpretation

### Technische Hinweise

#### SearchParameter für GenomicStudy
Aufgrund der komplexen Extension-Struktur sind Standard-FHIR-SearchParameter limitiert. Implementierungen sollten erwägen:
- Custom SearchParameter für häufige Queries
- GraphQL für komplexe Abfragen
- _include Parameter für vollständige Datensätze

#### Performance-Überlegungen
Bei umfangreicher Nutzung der erweiterten Features:
- Indexierung von Extension-Werten
- Caching von aggregierten Metriken
- Asynchrone Verarbeitung großer Bundles

### Zusammenfassung

GenomicStudy/GenomicStudyAnalysis bietet gegenüber der vorherigen UntersuchteRegion-Struktur erheblich erweiterte Dokumentationsmöglichkeiten. Während die Basisanforderungen des MII-Kerndatensatzes unverändert bleiben, eröffnen sich für Forschungsprojekte und spezialisierte Anwendungsfälle neue Möglichkeiten zur präzisen technischen Dokumentation molekulargenetischer Analysen.