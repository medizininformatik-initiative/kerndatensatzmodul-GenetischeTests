---
topic: ReleaseNotes
---
# Release Notes

## 2026.0.3

### Maintenance Release

**Dependency Updates**

- **kerndatensatz.biobank**: Updated to `2026.0.x` (flexible versioning)

**Current Dependencies**

| Package | Version |
|---------|---------|
| `hl7.fhir.uv.genomics-reporting` | 3.0.x |
| `de.medizininformatikinitiative.kerndatensatz.meta` | 2026.0.x |
| `de.medizininformatikinitiative.kerndatensatz.base` | 2026.0.x |
| `de.medizininformatikinitiative.kerndatensatz.biobank` | 2026.0.x |
| `de.basisprofil.r4` | 1.5.x |
| `hl7.terminology.r4` | 6.1.x |

**Package Build**

- **ImplementationGuide Filtering**: Improved package.bake.yaml to exclude ImplementationGuide resources from FHIR package

## 2026.0.2

### Hotfix: Package Build Error

**Technical Fix**

- **Package Build**: v2026.0.1 wurde mit fehlerhaftem Package-Build publiziert
  - Problem: Package enthielt gesamtes Repository (377 Dateien, 2.1 MB) statt nur FHIR-Ressourcen
  - Ursache: Verwendung von `npm pack` anstatt `fhir bake` für Package-Erstellung
  - Auswirkung: SUSHI konnte keine Ressourcen aus dem Package laden (0 resources statt 36)
  - Behebung: Korrekter Build-Prozess mit `fhir bake package.bake.yaml`
  - Ergebnis: Package nun korrekt strukturiert (140 Dateien, 381 KB)

- **Dokumentation**: build-package.md aktualisiert mit korrektem `fhir bake` Workflow
  - Explizite Verifikationsschritte für Package-Struktur
  - Warnungen vor falschen Build-Methoden

**Hinweis**: v2026.0.1 bleibt auf Simplifier verfügbar, sollte aber nicht verwendet werden. Alle abhängigen Module sollten auf v2026.0.2 aktualisieren.

## 2026.0.1

### Hotfix: Familienanamnese Canonical URL

**Breaking Change Fix**

- **Familienanamnese Profile**: Canonical URL wiederhergestellt zur ursprünglichen Version:
  - Canonical URL: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese`
  - Die URL wurde in v2026.0.0 versehentlich geändert, was ein breaking change war
  - Wiederherstellung der ursprünglichen URL zur Gewährleistung der Rückwärtskompatibilität
  - Betroffene abhängige Module: Seltene Erkrankungen (SE)
  - Commit: 065fabf

**Hinweis**: Die URL `familienanamnese` entspricht zwar nicht formal den aktuellen Namenskonventionen (erwartbar wäre `mii-pr-molgen-familienanamnese`), wird aber beibehalten um breaking changes zu vermeiden.

## 2026.0.0

### Änderungen nach Ballotierung

#### Vervollständigung und Korrektur der Beispiele

#### Datumsstempel für Observations (HDB-762, HDB-763)

- `effective[x]` und `issued` MS zu allen Observation-Profilen hinzugefügt

#### ServiceRequest.requester (HDB-768)

- Referenztypen eingeschränkt auf: Practitioner | PractitionerRole | Organization

#### Terminologie-Dokumentation (HDB-749)

Konsolidierung von 18 Terminologie-Seiten in 4 übersichtliche Seiten, organisiert nach Herkunft:

- **MII-ValueSets**: Unsere 4 eigenen ValueSets (Familiäre Linie, Family Member SNOMED, Verwandtschaftsgrad, Verwandtschaftsverhältnis)
- **ClinicalGenomics**: Alle Clinical Genomics STU3 ValueSets + CodeSystems
- **Terminologien**: Externe Standards (LOINC, SNOMED CT, HGNC, HGVS, etc.) mit Lizenzinformationen
- **Index**: Übersicht mit Entscheidungskriterien zur ValueSet-Auswahl

Entfernte Einzelseiten: ClinVar-Evidence-Level, Condition-Inheritance-Pattern, DNAChangeType, Evidence-Level-Examples, Functional-Effect, HGNC, HGVS, HighLowcodes, MolecularConsequence, PharmGKB-Evidence-Level, TBD-Codes, Variant-Confidence-Status, VariantInheritance

#### URL-Namensraum-Migration

- `example.org` URLs durch MII FHIR Namensraum ersetzt (`https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/`)

#### Molekularer Biomarker Profil

- **Neues Profil**: `MII_PR_MolGen_MolekularerBiomarker` als gemeinsames Elternprofil für:
  - Mikrosatelliteninstabilität (erbt jetzt von MolekularerBiomarker)
  - Mutationslast (erbt jetzt von MolekularerBiomarker)
- Basiert auf Clinical Genomics STU3 MolecularBiomarker-Profil

#### Deutsche Übersetzungen (de-DE)

- **Must Support Elemente**: Alle MS-Elemente in allen Profilen mit deutschen Übersetzungen versehen

#### Konfiguration

- `language: de` in sushi-config.yaml hinzugefügt (Issue #34)

#### CI/CD Verbesserungen

- **Automatische Releases**: GitHub Actions erstellt automatisch Draft-Releases beim Tag-Push
- **Zulip-Benachrichtigung**: Automatische Benachrichtigung im MII-Kerndatensatz Stream bei Release-Veröffentlichung
- **FHIR Package Caching**: Beschleunigte CI-Pipeline durch Caching von FHIR-Paketen

#### Familienanamnese Terminology-Bindings

- Relationship-Bindings aufgeweicht: `required` → `extensible` für SNOMED CT und v3-RoleCode
- Ermöglicht Verwendung im Seltene Erkrankungen (SE) Modul mit spezifischen Verwandtschaftsverhältnissen

#### Terminologie-Server Anforderungen

Das folgende CodeSystem muss auf dem Terminologie-Server importiert werden:

- **URL:** `http://terminology.hl7.org/CodeSystem/variant-confidence-status-cs`
- **Quelle:** https://hl7.org/fhir/uv/genomics-reporting/STU3/CodeSystem-variant-confidence-status-cs.json
- **Hinweis:** Kanonische URL hat sich von STU2 (`http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/variant-confidence-status-cs`) zu STU3 geändert



### Strukturänderungen der Implementation Guide Navigation

#### IG-Struktur Version 2025.x (Flache Struktur)

```
MII IG Modul Molekulargenetischer Befundbericht/
├── IG MII KDS Modul Molekulargenetischer Befundbericht
├── Beschreibung Modul Molekulargenetischer Befundbericht
├── Anwendungsfälle Informationsmodell
├── Beschreibung von Szenarien für die Anwendung der Module
├── Datensätze inkl. Beschreibungen
├── Kontext im Gesamtprojekt Bezüge zu anderen Modulen
├── Technische Implementierung/
│   ├── Technische Implementierung (leer)
│   ├── FHIR Profile
│   ├── Anforderung-ServiceRequest
│   ├── Befundbericht-DiagnosticReport
│   ├── DiagnostischeImplikation-Observation
│   ├── TherapeutischeImplikation-Observation
│   ├── Variante-Observation
│   ├── ErgebnisZusammenfassung-Observation
│   ├── UntersuchteRegion-Observation
│   ├── Mikrosatelliteninstabilität-Observation
│   ├── Mutationslast-Observation
│   ├── Familienanamnese---FamilyMemberHistory
│   ├── Empfohlene Folgemaßnahme-Task
│   ├── Medikationsempfehlung-Task
│   ├── Polygener-Risiko-Score---RiskAssessment
│   ├── Genotyp---Observation
│   ├── Haplotype-Observation
│   ├── Sequence-Phase-Relationship---Observation
│   ├── CapabilityStatement
│   ├── Terminologien
│   ├── CodeSystems
│   ├── ValueSets
│   └── [Weitere einzelne Terminologie-Seiten]
├── UML
└── Referenzen
```

#### IG-Struktur Version 2026.x (Hierarchische Themengruppierung)

```
MII IG Modul Molekulargenetischer Befundbericht/
├── Hauptseite
├── Beschreibung Modul Molekulargenetischer Befundbericht
├── Anwendungsfälle / Informationsmodell/
│   ├── Index
│   ├── Basis des Informationsmodells  
│   ├── Profile-Relationships
│   └── Szenarien
├── Kontext im Gesamtprojekt Bezug zu anderen Modulen
├── Technische Implementierung/
│   ├── Index
│   ├── Workflow/
│   │   ├── Index
│   │   ├── Befundbericht-DiagnosticReport
│   │   ├── Anforderung-ServiceRequest
│   ├── Genetische Befunde/
│   │   ├── Index
│   │   ├── Variante-Observation
│   │   ├── Genotyp-Observation
│   │   ├── Haplotyp-Observation
│   │   └── Sequence-Phase-Relationship-Observation
│   ├── Genetische Implikationen/
│   │   ├── Index
│   │   ├── Molekulare Konsequenz-Observation 🆕
│   │   ├── Diagnostische Implikation-Observation
│   │   └── Therapeutische Implikation-Observation
│   ├── Molekulare Biomarker/
│   │   ├── Index
│   │   ├── Mikrosatelliteninstabilität-Observation
│   │   ├── Mutationslast-Observation
│   │   └── Polygener Risiko Score-Observation
│   ├── Therapieempfehlungen/
│   │   ├── Index
│   │   ├── EmpfohleneFolgemassnahme-Task
│   │   └── Medikationsempfehlung-Task
│   ├── Methodik/
│   │   ├── Index
│   │   ├── GenomicStudy-Procedure 🆕
│   │   └── GenomicStudyAnalysis-Procedure 🆕
│   ├── Familienanamnese/
│   │   ├── Index
│   │   ├── Familienanamnese---FamilyMemberHistory
│   │   └── Familienanamnese-Extensions 🆕
│   ├── CapabilityStatement
│   └── Terminologie/
│       ├── Index
│       ├── CodeSystems
│       └── ValueSets
│   
│   
├── Referenzen
├── Release Notes
└── Kommentierung v2026 🆕
```

#### Entfernte/Ersetzte Seiten:

- ❌ ErgebnisZusammenfassung-Observation → in DiagnosticReport.conclusion
- ❌ UntersuchteRegion-Observation → GenomicStudy/GenomicStudyAnalysis

#### Neue Seiten:

- 🆕 Molekulare Konsequenz (aus DiagnostischeImplikation ausgelagert)
- 🆕 GenomicStudy/GenomicStudyAnalysis (STU3)
- 🆕 Index-Seiten für jede Kategorie
- 🆕 Szenarien (konkrete Anwendungsbeispiele)
- 🆕 Kommentierung v2026

### Technische Änderungen

#### Migration zu Clinical Genomics STU3

- Dependency auf den Clinical Genomics Reporting von STU2 auf STU3
  - Neues MolecularBiomarker-Profil
  - Neues Molekulare-Konsequenz-Profil (downstream-Beschreibung von genetischen Änderungen)
  - DiagnosticImplication

    - Schärfung der Profilierung mit Fokus auf Erkrankungsrisiko, Auslagerung der reinen Beschreibung der Änderung ins Molekulare-Konsequenz-Profil
    - replaced `extension[genomic-artifact]` with `extension[workflow-relatedArtifact]`
    - component[functional-effect] in MolecularConsequence übertragen
  - Ergebnis-Zusammenfassung

    - Löschen des Profils (Grund: Redundanzen, Ergebnis kann über GenomicReport.conclusion/conclusionCode abgebildet werden)
  - Mikrosatelliteninstabilität

    - erbt jetzt vom STU3 Molecular Biomarker Profile
    - `component[conclusion-string]` entfällt
  - Molekulargenetischer Befundbericht erbt jetzt von genomic-report und nicht mehr genomics-report

    - wegfallen des [overall]-Slices
    - Zusammenlegen der extensions für [genomics-artifact] und [genomics-file] in [workflow-relatedArtifact]
    - extension[genomics-risk-assessment] ist jetzt extension[genomic-risk-assessment]
    - extension[region-studied] entfällt; Metadaten über die Untersuchte Region werden jetzt über GenomicStudy/GenomicStudyAnalysis abgebildet
  - Mutationslast

    - erbt jetzt vom neuen Molekularer Biomarker Modul
    - damit entfällt `component[conclusion-string]`
  - Therapeutische Implikation

    - component[prognosis] fällt weg, weil in den (Gründe?)
    - `component[predicted-therapeutic-implication]` zu `component[therapeutic-implication]` geändert
  - Untersuchte Regiion

    - Profil fällt weg, Information über Lokalisation und Geräte wird stattdessen über GenomicStudy/GenomicStudyAnalysis kodiert
  - Variante

    - component[coding-hgvs] umbenannt in component[representative-coding-hgvs]
    - component[transcript-ref-seq] umbenannt in component[representative-transcript-ref-seq]
    - component[protein-hgvs] umbenannt in component[representative-protein-hgvs]
    - component[amino-acid-change-type] gelöscht
    - component[molecular-consequence] aus Variante gelöst und in MolecularConsequence überführt
  - Beispiele entsprechend angepasst (alte Beispiele für Diagnostische Implikation entsprechen eher neuem Profil für Molekulare Konsequenz )
  - Neue Ordnerstruktur im GitHub-Repo
- Logical Model (LogicalModel.fsh)
  - Elementnamen bereinigt: Bindestriche entfernt und durch CamelCase ersetzt (z.B. Krankengeschichte-Familie → KrankengeschichteFamilie)
  - Sonderzeichen entfernt: Mikrosatelliteninstabilität → Mikrosatelliteninstabilitaet
  - FHIR-Mappings entsprechend aktualisiert für Konsistenz
  - Alle Elementnamen folgen jetzt FHIR-Namenskonventionen (nur alphanumerische Zeichen)
- Profile Korrektur (Anforderung.fsh)
  - Typo korrigiert: "gentischer" → "genetischer" in Profile ID und InstanceOf Referenzen
  - Korrekte Canonical URL: mii-pr-molgen-anforderung-genetischer-test
- Familienanamnese (FamilyMemberHistory.fsh)
  - Terminology-Bindings an Diagnose-Modul 2025.0.1 angeglichen
  - ValueSet-Migration für ICD-10-GM, Alpha-ID, SNOMED CT und Orphanet Codings:
    - `reasonCode.coding[icd10-gm]`: `http://fhir.de/ValueSet/bfarm/icd-10-gm` → `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm`
    - `reasonCode.coding[alpha-id]`: `http://fhir.de/ValueSet/bfarm/alpha-id` → `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid`
    - `reasonCode.coding[sct]`: bereits `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct`
    - `reasonCode.coding[orphanet]`: Neues Binding zu `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet`
    - Gleiche Änderungen für `condition.code.coding` Slices
  - Relationship-Bindings aufgeweicht: `required` → `extensible` für SNOMED CT und v3-RoleCode
    - Erlaubt Flexibilität bei ungewöhnlichen Verwandtschaftsverhältnissen

## 2025.0.0

- updated package id
- harmonized dependencies

### Impressum

Dieser Leitfaden ist im Rahmen der Medizininformatik-Initiative erstellt worden und unterliegt per Governance-Prozess dem Abstimmungsverfahren des Interoperabilitätsforums und der Technischen Komitees (TCs) von HL7 Deutschland e. V.

### Ansprechpartner

* Sylvia Thun, Berlin Institute of Health at Charité (BIH)
* Thomas Debertshäuser, Berlin Institute of Health at Charité (BIH)
* Julian Saß, Berlin Institute of Health at Charité (BIH)
* Karoline Buckow, TMF – Technologie- und Methodenplattform für
  die vernetzte medizinische Forschung e.V.
* Franziska Klepka, TMF – Technologie- und Methodenplattform für
  die vernetzte medizinische Forschung e.V.

Fragen zu der vorliegenden Publikation können jederzeit unter chat.fhir.org im Stream 'german/mi-initiative' gestellt werden.

Anmerkungen und Kritik wird in Form von 'Issues' im Simplifier-Projekt stets gern entgegengenommen.`</br>`

### Autoren

* Alexander Zautke (HL7 Deutschland)
* Andrew Heidel (SMITH)
* Anna Trelinska-Finger (HiGHmed)
* Arsenij Ustjanzew (MIRACUM)
* Bernd Auber (HiGHmed)
* Brigitte Schlegelberger (HiGHmed)
* Caroline Stellmach (BIH at Charité)
* Franziska Klepka (MII-Koordinationsstelle)
* Frederick Klauschen (Charité)
* Julian Saß (BIH at Charité)
* Karoline Buckow (MII-Koordinationsstelle)
* Kirsten Toralf (SMITH)
* Manuela Benary (Charité)
* Martin Boeker (DIFUTURE)
* Michael Krawczak (HiGHmed)
* Oliver Kohlbacher (DIFUTURE)
* Patrick Werner (MOLIT Institut gGmbH)
* Simon Schumacher (HiGHmed)
* Sylvia Thun (Charité)
* Stefan Fröhling (GenomDE)
* Stephan Ossowski (DIFUTURE)
* Thomas Debertshäuser (BIH at Charité)
* Thomas Wienker (GenomDE)
* Yvonne Möller (GenomDE)

### Copyright-Hinweis, Nutzungshinweise

Copyright © 2022+: TMF e. V., Charlottenstraße 42, 10117 Berlin
Der Inhalt dieser Spezifikation ist öffentlich. Die Nachnutzungs- bzw. Veröffentlichungsansprüche sind nicht beschränkt.
Zu den Nutzungsrechten der zugrunde liegenden FHIR-Technologie siehe die FHIR-Basis-Spezifikation.
Einige verwendete Codesysteme werden von anderen Organisationen herausgegeben und gepflegt. Es gilt das Copyright der dort jeweils aufgeführten Herausgeber (Publisher).`</br>`

### Disclaimer

Der Inhalt dieses Dokuments ist öffentlich. Zu beachten ist, dass Teile dieses Dokuments auf FHIR Version R4 beruhen, für die das Copyright von HL7 International gilt.

Obwohl diese Publikation mit größter Sorgfalt erstellt wurde, können die Autoren keinerlei Haftung für direkten oder indirekten Schaden übernehmen, der durch den Inhalt dieser Spezifikation entstehen könnte.
