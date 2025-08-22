---
topic: ReleaseNotes
---

# Release Notes

## 2026.0.0-alpha

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

Anmerkungen und Kritik wird in Form von 'Issues' im Simplifier-Projekt stets gern entgegengenommen.</br>  

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
Einige verwendete Codesysteme werden von anderen Organisationen herausgegeben und gepflegt. Es gilt das Copyright der dort jeweils aufgeführten Herausgeber (Publisher).</br> 

### Disclaimer
Der Inhalt dieses Dokuments ist öffentlich. Zu beachten ist, dass Teile dieses Dokuments auf FHIR Version R4 beruhen, für die das Copyright von HL7 International gilt.

Obwohl diese Publikation mit größter Sorgfalt erstellt wurde, können die Autoren keinerlei Haftung für direkten oder indirekten Schaden übernehmen, der durch den Inhalt dieser Spezifikation entstehen könnte.  

