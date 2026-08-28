<!-- Migriert aus dem Simplifier-Leitfaden Index.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

Die vorliegende Spezifikation beschreibt die FHIR-Repräsentation des KDS-Moduls 'Molekulargenetischer Befundbericht' der Medizininformatik-Initiative. Im Folgenden werden die Use-Cases des Moduls sowie die dazugehörigen FHIR-Profile und Terminologie-Ressourcen in ihrer verbindlichen Form beschrieben.

|Veröffentlichung|     |
|---------|--------------|
|  Datum  | 19.12.2025  |
|  Version| 2026.0.4      |
|  Status | active       |
|  Realm  | DE           |

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

Anmerkungen und Kritik wird außerhalb der Kommentierungsphasen in Form von 'Issues' im Github-Projekt stets gern entgegengenommen.</br>  

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

---

## Navigation und Inhaltsverzeichnis

### 📋 Überblick und Konzepte
- guidance.html#beschreibung-des-moduls - Einführung in das Modul Molekulargenetischer Befundbericht
- guidance.html#anwendungsfalle-und-informationsmodell - Use Cases und Datenmodell
- guidance.html#szenarien-fur-die-anwendung-der-module - Praktische Anwendungsbeispiele
- implementer-guidance.html#kontext-im-gesamtprojekt-und-bezuge-zu-anderen-modulen - Bezug zu anderen MII-Modulen
- logical-models.html - Detaillierte Datensatzbeschreibungen
- uml-diagrams.html - Strukturdiagramme des Moduls

### 🛠️ Technische Implementierung
- profiles.html#profil-vererbungshierarchie - Hauptseite der technischen Dokumentation
- capability-statements.html - Server-Fähigkeiten und unterstützte Operationen

#### 🔄 Workflow-Komponenten
- profiles.html#workflow-anforderung-und-befundbericht - Workflow-Dokumentation
- StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.html - Testanforderung
- StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.html - Hauptbefund

#### 🧬 Genetische Befunde
- profiles.html#genetische-befunde - Befund-Dokumentation
- StructureDefinition-mii-pr-molgen-variante.html - Genetische Varianten
- StructureDefinition-mii-pr-molgen-genotyp.html - Genotyp-Information
- implementer-guidance.html#haplotype-observation - Haplotyp-Information

#### 💡 Genetische Implikationen
- profiles.html#genetische-implikationen - Implikationen-Dokumentation
- StructureDefinition-mii-pr-molgen-diagnostische-implikation.html - Diagnostische Bedeutung
- StructureDefinition-mii-pr-molgen-therapeutische-implikation.html - Therapeutische Bedeutung
- StructureDefinition-mii-pr-molgen-molekulare-konsequenz.html - Molekulare Auswirkungen

#### 📊 Molekulare Biomarker
- profiles.html#molekulare-biomarker - Biomarker-Dokumentation
- StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet.html - MSI-Status
- StructureDefinition-mii-pr-molgen-mutationslast.html - Tumor Mutational Burden
- StructureDefinition-mii-pr-molgen-polygener-risiko-score.html - PRS-Berechnung

#### 💊 Therapieempfehlungen
- profiles.html#therapieempfehlungen - Empfehlungen-Dokumentation
- StructureDefinition-mii-pr-molgen-medikationsempfehlung.html - Pharmakogenetische Empfehlungen
- StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.html - Follow-up Empfehlungen

#### 🔬 Methodik und Studien
- profiles.html#methodik-der-genomischen-untersuchung - Methodik-Dokumentation
- StructureDefinition-mii-pr-molgen-genomic-study.html - Genomische Studie
- StructureDefinition-mii-pr-molgen-genomic-study-analysis.html - Studienanalyse

#### 👨‍👩‍👧‍👦 Familienanamnese
- profiles.html#familienanamnese - Familienanamnese-Dokumentation
- StructureDefinition-mii-pr-molgen-familienanamnese.html - Familienhistorie

#### 📚 Terminologie
- value-sets.html#terminologie - Terminologie-Dokumentation
- value-sets.html#verwendete-terminologien - Externe Terminologien
- value-sets.html#mii-valuesets - MII ValueSets
- value-sets.html#valuesets-aus-clinical-genomics - Clinical Genomics Terminologien

#### ⚠️ Veraltete Profile
- ErgebnisZusammenfassung - (STU2, veraltet)
- UntersuchteRegion - (STU2, ersetzt durch GenomicStudy)

### 📖 Weitere Dokumentation
- changes.html - Versionshinweise und Änderungen
- implementer-guidance.html#referenzen - Literatur und Quellen
