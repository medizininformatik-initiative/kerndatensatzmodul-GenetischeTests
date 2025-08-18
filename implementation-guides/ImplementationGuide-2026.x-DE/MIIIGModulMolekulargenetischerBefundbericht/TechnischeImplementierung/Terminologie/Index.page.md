---
topic: TerminologieIndex
---

#### {{page-title}}

{{index:current}}

### Überblick

Die Terminologie-Komponenten definieren die standardisierten Vokabulare für die semantische Interoperabilität genetischer Daten. Diese umfassen internationale Standards und projektspezifische Erweiterungen.

### Kern-Terminologien

#### Genetische Nomenklatur
- **HGNC**: Standardisierte Gen-Symbole und -Namen
- **HGVS**: Notation für Sequenzvarianten
- **ISCN**: Zytogenetische Nomenklatur

#### Klinische Klassifikation
- **LOINC**: Laboruntersuchungen und genetische Tests
- **SNOMED CT**: Klinische Befunde und Prozeduren
- **ICD-10-GM**: Diagnosen (deutsche Modifikation)
- **Orphanet**: Seltene Erkrankungen
- **OMIM**: Mendel'sche Erkrankungen

#### Sequenz-Datenbanken
- **RefSeq**: Referenzsequenzen (bevorzugt MANE)
- **Ensembl**: Alternative Transkript-Referenzen
- **dbSNP**: Varianten-Identifikatoren (rs-Nummern)
- **ClinVar**: Klinische Variantenbewertung

### Projektspezifische ValueSets

#### Pathogenität
- ACMG-Klassifikation (5-stufig)
- ClinVar Clinical Significance
- Evidenzlevel-Codes

#### Vererbung
- Vererbungsmuster (autosomal, X-linked, etc.)
- Verwandtschaftsgrade
- Familiäre Linien

#### Molekulare Effekte
- Funktionelle Konsequenzen (LoF, GoF)
- DNA-Veränderungstypen
- Protein-Effekte

### Binding-Stärken

- **Required**: Exakte Übereinstimmung erforderlich (z.B. HGVS)
- **Extensible**: Erweiterbar bei Bedarf (z.B. Diagnosen)
- **Preferred**: Empfohlen aber nicht verpflichtend

### Versionierung

- Terminologie-Versionen sollten dokumentiert werden
- ICD-10-GM: Jahresversion angeben
- LOINC: Version bei Implementierung fixieren
- SNOMED CT: International Edition + deutsche Erweiterung

### Implementierungshinweise

- Mehrfach-Kodierung unterstützen (ICD-10 + Orphanet)
- Display-Werte für Benutzerfreundlichkeit
- Mapping-Tabellen für Legacy-Systeme
- Validierung gegen offizielle ValueSets