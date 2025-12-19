# {{page-title}}



Die vorliegende Spezifikation beschreibt die FHIR-Repräsentation des Kerndatensatz Erweiterungsmoduls 'Diagnostik | Molekulargenetischer Befundbericht' der Medizininformatik-Initiative. Im Folgenden werden die Use-Cases des Moduls sowie die dazugehörigen FHIR-Profile und Terminologie-Ressourcen in ihrer verbindlichen Form beschrieben.

|Veröffentlichung|     |
|---------|--------------|
|  Datum  | 19.12.2025  |
|  Version| 2026.0.4        |
|  Status | active       |
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
- {{pagelink:BeschreibungModul}} - Einführung in das Modul Molekulargenetischer Befundbericht
- {{pagelink:AnwendungsfaelleUebersicht}} - Use Cases und Datenmodell
- {{pagelink:Szenarien}} - Praktische Anwendungsbeispiele
- {{pagelink:KontextGesamtprojekt}} - Bezug zu anderen MII-Modulen
- {{pagelink:Datensaetze}} - Detaillierte Datensatzbeschreibungen
- {{pagelink:UMLDiagramme}} - Strukturdiagramme des Moduls

### 🛠️ Technische Implementierung
- {{pagelink:TechnischeImplementierungIndex}} - Hauptseite der technischen Dokumentation
- {{pagelink:CapabilityStatement}} - Server-Fähigkeiten und unterstützte Operationen

#### 🔄 Workflow-Komponenten
- {{pagelink:WorkflowIndex}} - Workflow-Dokumentation
- {{pagelink:AnforderungServiceRequest}} - Testanforderung
- {{pagelink:BefundberichtDiagnosticReport}} - Hauptbefund

#### 🧬 Genetische Befunde
- {{pagelink:GenetischeBefundeIndex}} - Befund-Dokumentation
- {{pagelink:VarianteObservation}} - Genetische Varianten
- {{pagelink:GenotypObservation}} - Genotyp-Information
- {{pagelink:HaplotypeObservation}} - Haplotyp-Information

#### 💡 Genetische Implikationen
- {{pagelink:GenetischeImplikationenIndex}} - Implikationen-Dokumentation
- {{pagelink:DiagnostischeImplikation}} - Diagnostische Bedeutung
- {{pagelink:TherapeutischeImplikation}} - Therapeutische Bedeutung
- {{pagelink:MolekulareKonsequenz}} - Molekulare Auswirkungen

#### 📊 Molekulare Biomarker
- {{pagelink:MolekulareBiomarkerIndex}} - Biomarker-Dokumentation
- {{pagelink:Mikrosatelliteninstabilitaet}} - MSI-Status
- {{pagelink:Mutationslast}} - Tumor Mutational Burden
- {{pagelink:PolygenerRisikoScore}} - PRS-Berechnung

#### 💊 Therapieempfehlungen
- {{pagelink:TherapieempfehlungenIndex}} - Empfehlungen-Dokumentation
- {{pagelink:Medikationsempfehlung}} - Pharmakogenetische Empfehlungen
- {{pagelink:EmpfohleneFolgemassnahme}} - Follow-up Empfehlungen

#### 🔬 Methodik und Studien
- {{pagelink:MethodikIndex}} - Methodik-Dokumentation
- {{pagelink:GenomicStudy}} - Genomische Studie
- {{pagelink:GenomicStudyAnalysis}} - Studienanalyse

#### 👨‍👩‍👧‍👦 Familienanamnese
- {{pagelink:FamilienanamneseIndex}} - Familienanamnese-Dokumentation
- {{pagelink:FamilienanameseFamilyMemberHistory}} - Familienhistorie

#### 📚 Terminologie
- {{pagelink:TerminologieIndex}} - Terminologie-Dokumentation
- {{pagelink:Terminologien}} - Verwendete Terminologien
- {{pagelink:CodeSystems}} - Code-Systeme
- {{pagelink:ValueSets}} - Wertemengen

##### Spezielle Terminologien
- {{pagelink:HGNCValueSet}} - Gen-Nomenklatur
- {{pagelink:HGVSValueSet}} - Varianten-Nomenklatur
- {{pagelink:DNAChangeType}} - DNA-Veränderungstypen
- {{pagelink:MolecularConsequenceTerminologie}} - Molekulare Konsequenzen
- {{pagelink:FunctionalEffect}} - Funktionelle Effekte
- {{pagelink:VariantInheritance}} - Vererbungsmuster von Varianten
- {{pagelink:ConditionInheritancePattern}} - Krankheitsvererbungsmuster
- {{pagelink:VariantConfidenceStatus}} - Konfidenzstatus
- {{pagelink:GeneticTherapeuticImplications}} - Therapeutische Implikationen
- {{pagelink:EvidenceLevelExamples}} - Evidenzlevel
- {{pagelink:ClinVarEvidenceLevel}} - ClinVar Evidenz
- {{pagelink:PharmGKBEvidenceLevel}} - PharmGKB Evidenz
- {{pagelink:HighLowCodes}} - Hoch/Niedrig-Codes
- {{pagelink:TBDCodes}} - Noch zu definierende Codes
- {{pagelink:TBDValueSet}} - Noch zu definierende ValueSets

#### ⚠️ Veraltete Profile
- ErgebnisZusammenfassung - (STU2, veraltet)
- UntersuchteRegion - (STU2, ersetzt durch GenomicStudy)

### 📖 Weitere Dokumentation
- {{pagelink:ReleaseNotes}} - Versionshinweise und Änderungen
- {{pagelink:Referenzen}} - Literatur und Quellen  

