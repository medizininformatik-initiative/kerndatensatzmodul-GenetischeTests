# Erweiterungsmodul Molekulargenetischer Befundbericht



Die vorliegende Spezifikation beschreibt die FHIR-Repräsentation des Kerndatensatz Erweiterungsmoduls 'Diagnostik | Molekulargenetischer Befundbericht' der Medizininformatik-Initiative. Im Folgenden werden die Use-Cases des Moduls sowie die dazugehörigen FHIR-Profile und Terminologie-Ressourcen in ihrer verbindlichen Form beschrieben.

|Veröffentlichung|     |
|---------|--------------|
|  Datum  | 01.09.2025  |
|  Version| 2026.0.0-ballot        |
|  Status | draft       |
|  Realm  | DE           |



{{index:root}}

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

---

## Navigation und Inhaltsverzeichnis

### 📋 Überblick und Konzepte
- [Beschreibung des Moduls](BeschreibungModulMolekulargenetischerBefundbericht.page.md) - Einführung in das Modul Molekulargenetischer Befundbericht
- [Anwendungsfälle und Informationsmodell](AnwendungsflleInformationsmodell.page.md) - Use Cases und Datenmodell
- [Szenarien für die Anwendung](BeschreibungvonSzenarienfrdieAnwendungderModule.page.md) - Praktische Anwendungsbeispiele
- [Kontext im Gesamtprojekt](KontextimGesamtprojektBezgezuanderenModulen.page.md) - Bezug zu anderen MII-Modulen
- [Datensätze inkl. Beschreibungen](Datenstzeinkl.Beschreibungen.page.md) - Detaillierte Datensatzbeschreibungen
- [UML-Diagramme](UML.page.md) - Strukturdiagramme des Moduls

### 🛠️ Technische Implementierung
- [Technische Implementierung (Übersicht)](TechnischeImplementierung/Index.page.md) - Hauptseite der technischen Dokumentation
- [CapabilityStatement](TechnischeImplementierung/CapabilityStatement.page.md) - Server-Fähigkeiten und unterstützte Operationen

#### 🔄 Workflow-Komponenten
- [Workflow (Übersicht)](TechnischeImplementierung/Workflow/Index.page.md) - Workflow-Dokumentation
- [Anforderung (ServiceRequest)](TechnischeImplementierung/Workflow/Anforderung-ServiceRequest.page.md) - Testanforderung
- [Befundbericht (DiagnosticReport)](TechnischeImplementierung/Workflow/Befundbericht-DiagnosticReport.page.md) - Hauptbefund

#### 🧬 Genetische Befunde
- [Genetische Befunde (Übersicht)](TechnischeImplementierung/GenetischeBefunde/Index.page.md) - Befund-Dokumentation
- [Variante (Observation)](TechnischeImplementierung/GenetischeBefunde/Variante-Observation.page.md) - Genetische Varianten
- [Genotyp (Observation)](TechnischeImplementierung/GenetischeBefunde/Genotyp---Observation.page.md) - Genotyp-Information
- [Haplotyp (Observation)](TechnischeImplementierung/GenetischeBefunde/Haplotype-Observation.page.md) - Haplotyp-Information

#### 💡 Genetische Implikationen
- [Implikationen (Übersicht)](TechnischeImplementierung/GenetischeImplikationen/Index.page.md) - Implikationen-Dokumentation
- [Diagnostische Implikation](TechnischeImplementierung/GenetischeImplikationen/DiagnostischeImplikation-Observation.page.md) - Diagnostische Bedeutung
- [Therapeutische Implikation](TechnischeImplementierung/GenetischeImplikationen/TherapeutischeImplikation-Observation.page.md) - Therapeutische Bedeutung
- [Molekulare Konsequenz](TechnischeImplementierung/GenetischeImplikationen/MolekulareKonsequenz-Observation.page.md) - Molekulare Auswirkungen

#### 📊 Molekulare Biomarker
- [Biomarker (Übersicht)](TechnischeImplementierung/MolekulareBiomarker/Index.page.md) - Biomarker-Dokumentation
- [Mikrosatelliteninstabilität (MSI)](TechnischeImplementierung/MolekulareBiomarker/Mikrosatelliteninstabilitt-Observation.page.md) - MSI-Status
- [Mutationslast (TMB)](TechnischeImplementierung/MolekulareBiomarker/Mutationslast-Observation.page.md) - Tumor Mutational Burden
- [Polygener Risiko-Score](TechnischeImplementierung/MolekulareBiomarker/Polygener-Risiko-Score---RiskAssessment.page.md) - PRS-Berechnung

#### 💊 Therapieempfehlungen
- [Therapieempfehlungen (Übersicht)](TechnischeImplementierung/Therapieempfehlungen/Index.page.md) - Empfehlungen-Dokumentation
- [Medikationsempfehlung](TechnischeImplementierung/Therapieempfehlungen/Medikationsempfehlung-Task.page.md) - Pharmakogenetische Empfehlungen
- [Empfohlene Folgemaßnahme](TechnischeImplementierung/Therapieempfehlungen/EmpfohleneFolgemanahme-Task.page.md) - Follow-up Empfehlungen

#### 🔬 Methodik und Studien
- [Methodik (Übersicht)](TechnischeImplementierung/Methodik/Index.page.md) - Methodik-Dokumentation
- [GenomicStudy (Procedure)](TechnischeImplementierung/Methodik/GenomicStudy-Procedure.page.md) - Genomische Studie
- [GenomicStudyAnalysis (Procedure)](TechnischeImplementierung/Methodik/GenomicStudyAnalysis-Procedure.page.md) - Studienanalyse
- [GenomicStudy Comprehensive](TechnischeImplementierung/Methodik/GenomicStudyComprehensive.page.md) - Umfassende Studiendokumentation

#### 👨‍👩‍👧‍👦 Familienanamnese
- [Familienanamnese (Übersicht)](TechnischeImplementierung/Familienanamnese/Index.page.md) - Familienanamnese-Dokumentation
- [Familienanamnese (FamilyMemberHistory)](TechnischeImplementierung/Familienanamnese/Familienanamnese---FamilyMemberHistory.page.md) - Familienhistorie

#### 📚 Terminologie
- [Terminologie (Übersicht)](TechnischeImplementierung/Terminologie/Index.page.md) - Terminologie-Dokumentation
- [Terminologien](TechnischeImplementierung/Terminologie/Terminologien.page.md) - Verwendete Terminologien
- [CodeSystems](TechnischeImplementierung/Terminologie/CodeSystems.page.md) - Code-Systeme
- [ValueSets](TechnischeImplementierung/Terminologie/ValueSets.page.md) - Wertemengen

##### Spezielle Terminologien
- [HGNC ValueSet](TechnischeImplementierung/Terminologie/HGNCValueSet.page.md) - Gen-Nomenklatur
- [HGVS ValueSet](TechnischeImplementierung/Terminologie/HGVSValueSet.page.md) - Varianten-Nomenklatur
- [DNA Change Type](TechnischeImplementierung/Terminologie/DNAChangeType.page.md) - DNA-Veränderungstypen
- [Molecular Consequence](TechnischeImplementierung/Terminologie/MolecularConsequence.page.md) - Molekulare Konsequenzen
- [Functional Effect](TechnischeImplementierung/Terminologie/Functional-Effect.page.md) - Funktionelle Effekte
- [Variant Inheritance](TechnischeImplementierung/Terminologie/VariantInheritance.page.md) - Vererbungsmuster von Varianten
- [Condition Inheritance Pattern](TechnischeImplementierung/Terminologie/Condition-Inheritance-Pattern.page.md) - Krankheitsvererbungsmuster
- [Variant Confidence Status](TechnischeImplementierung/Terminologie/Variant-Confidence-Status.page.md) - Konfidenzstatus
- [Genetic Therapeutic Implications](TechnischeImplementierung/Terminologie/Genetic-Therapeutic-Implications.page.md) - Therapeutische Implikationen
- [Evidence Level Examples](TechnischeImplementierung/Terminologie/Evidence-Level-Examples.page.md) - Evidenzlevel
- [ClinVar Evidence Level](TechnischeImplementierung/Terminologie/ClinVar-Evidence-Level-Example-Codes.page.md) - ClinVar Evidenz
- [PharmGKB Evidence Level](TechnischeImplementierung/Terminologie/PharmGKB-Evidence-Level-Example-Codes.page.md) - PharmGKB Evidenz
- [High/Low Codes](TechnischeImplementierung/Terminologie/HighLowcodes.page.md) - Hoch/Niedrig-Codes
- [TBD Codes](TechnischeImplementierung/Terminologie/TBD-Codes.page.md) - Noch zu definierende Codes
- [TBD ValueSet](TechnischeImplementierung/Terminologie/TBDValueSet.page.md) - Noch zu definierende ValueSets

#### ⚠️ Veraltete/Kommentierte Profile
- [Ergebnis-Zusammenfassung](TechnischeImplementierung/ErgebnisZusammenfassung-Observation.page.md) - (STU2, veraltet)
- [Untersuchte Region](TechnischeImplementierung/UntersuchteRegion-Observation.page.md) - (STU2, ersetzt durch GenomicStudy)
- [Sequence Phase Relationship](TechnischeImplementierung/Sequence-Phase-Relationship---Observation.page.md) - Phasenbeziehung

### 📖 Weitere Dokumentation
- [Release Notes](ReleaseNotes.page.md) - Versionshinweise und Änderungen
- [Referenzen](Referenzen.page.md) - Literatur und Quellen  

