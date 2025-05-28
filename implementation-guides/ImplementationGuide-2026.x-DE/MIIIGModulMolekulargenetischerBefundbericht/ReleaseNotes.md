
# Release Notes

## 2026.0.0-alpha
- Dependency auf den Clinical Genomics Reporting von STU2 auf STU3
    - Neues MolecularBiomarker-Profil 
    - Neues Molekulare-Konsequenz-Profil (downstream-Beschreibung von genetischen Änderungen)
    - DiagnosticImplication 
        - Schärfung der Profilierung mit Fokus auf Erkrankungsrisiko, Auslagerung der reinen Beschreibung der Änderung ins Molekulare-Konsequenz-Profil
            - replaced `extension[genomic-artifact]` with `extension[workflow-relatedArtifact]`
    - Ergebnis-Zusammenfassung 
        - Löschen des Profils (Grund: Redundanzen, Ergebnis kann über GenomicReport.conclusion/conclusionCode abgebildet werden)
    - Mikrosatelliteninstabilität
        - erbt jetzt vom STU3 Molecular Biomarker Profile
        - `component[conclusion-string]` entfällt
    - Beispiele entsprechend angepasst (alte Beispiele für Diagnostische Implikation entsprechen eher )
    - Neue Ordnerstruktur im GitHub-Repo


## 2025.0.0
- not complete
- updated package id
- harmonized 

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

