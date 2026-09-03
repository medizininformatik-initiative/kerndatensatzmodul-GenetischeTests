# Änderungshistorie - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* **Änderungshistorie**

## Änderungshistorie

 Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie [hier](translationinfo.md). 

### Änderungshistorie

Diese Seite hält die Änderungen zwischen den veröffentlichten Versionen des Moduls **Molekulargenetischer Befundbericht** fest, die neueste Version zuerst. Sie folgt [Keep a Changelog](https://keepachangelog.com/de/1.1.0/) und dem KDS-CalVer-Schema, das die Seite [Versionierung](version-history.md) beschreibt.

Jede Version erhält einen eigenen Abschnitt mit dem Release-Datum und den nach Kategorien gruppierten Änderungen:

* **Hinzugefügt** — neue Profile, Extensions, ValueSets, Suchparameter, Seiten.
* **Geändert** — geänderte Einschränkungen, Bindings, Hinweise oder Dokumentation.
* **Abgekündigt** — Artefakte, die noch existieren, aber nicht mehr genutzt werden sollen.
* **Entfernt** — zurückgezogene Artefakte.
* **Behoben** — Korrekturen von Fehlern.
* **Sicherheit** — Änderungen mit Auswirkung auf Sicherheit oder Datenschutz.

Kategorien ohne Inhalt werden weggelassen. Geht eine Änderung auf ein Issue oder einen Pull-Request zurück, wird darauf verlinkt.

##### Breaking Changes MÜSSEN berichtet und erläutert werden

Ein Versionsabschnitt mit einer Breaking Change ist erst vollständig, wenn er ausdrücklich und in diesem Changelog beantwortet:

* **Was genau sich geändert hat** zwischen den beiden Versionen — das Artefakt, das Element, die alte und die neue Einschränkung (nicht nur „Profil X wurde überarbeitet“).
* **Was das für bestehende Daten bedeutet:** Validieren Daten, die der Vorversion entsprachen, weiterhin gegen die neue Version? Falls nein: welche Ressourcen und Elemente sind betroffen, und wie zeigt sich der Fehler?
* **Was Implementierende tun sollten:** die Empfehlung der Autorinnen und Autoren zur Migration bestehender Daten auf die neue Version — Transformationsschritte, Standardwerte, Umkodierungs-Hinweise — oder die ausdrückliche Aussage, dass kein Migrationspfad bereitgestellt wird, und warum.

**Was als Breaking Change zählt** — behandeln Sie eine Änderung als Breaking Change, wenn sie eines der Folgenden tut, auch wenn sie klein wirkt: eine Kardinalität verschärft (`0..*` → `1..1`), eine Binding-Stärke erhöht (example → required), Codes aus einem required-ValueSet entfernt, ein Element oder einen Slice entfernt oder umbenennt, einen Typ einengt, eine Invariante oder eine Must-Support-Pflicht hinzufügt oder eine kanonische URL ändert. Im Zweifel: als Breaking Change berichten.

**Breaking für wen:** benennen Sie beide Perspektiven — *gespeicherte Daten* (Instanzen, die gegen die alte Version valide sind) und *Implementierungen* (Clients und Server, die dagegen gebaut wurden; ein entfernter Suchparameter bricht Implementierungen, während jede gespeicherte Instanz valide bleibt).

**Die Versionsnummer warnt niemanden.** Das KDS-Kalender-Versionsschema (`JJJJ.n.n`) trägt kein Major-Signal wie SemVer — dieser Changelog-Abschnitt ist die *einzige* Warnung, die Lesende bekommen.

**Verlinken Sie das technische Delta.** Ab der zweiten formalen Publikation aktivieren Sie den Versionsvergleich des IG Publishers (`version-comparison` in `sushi-config.yaml` — siehe die Seite [Versionierung](version-history.md) zur Einrichtung und ihren Voraussetzungen); er veröffentlicht einen maschinell erzeugten Vergleich unter `comparison-v<Vorversion>/index.html`. Verlinken Sie ihn aus dem Versionsabschnitt, damit die Erläuterung und der technische Diff nebeneinanderstehen.

Kennzeichnen Sie solche Einträge deutlich (zum Beispiel mit dem Präfix **BREAKING:**), damit sie beim Überfliegen des Abschnitts nicht übersehen werden können.

-------

#### Version 2027.0.0-ballot.rc1

**Datum:** 2026-09-02 · **Release Candidate**

Erster Release Candidate auf Basis des MII-KDS-Modul-Templates. Der Leitfaden wird jetzt vom HL7 IG Publisher gebaut und gerendert statt von Simplifier, englisch mit deutscher Übersetzung.

* **Migration auf das MII-KDS-Modul-Template** (v0.13.0), das das gemeinsame MII-IG-Template referenziert. Alle 41 Seiten des bisherigen Simplifier-Leitfadens wurden in den Template-Seitensatz überführt: 15 wurden zu Intro-Notes über den generierten Artefaktseiten, der Rest ging in die vereinbarten Seiten. Identität, kanonische URLs und Artefaktmenge sind unverändert.
* **Lizenz deklariert:** CC BY 4.0. Die bisherigen Releases nannten keine Lizenz.
* **Abhängigkeiten:** `kerndatensatz.meta` und `kerndatensatz.base` auf die 2027er-Ballot-Kandidaten, `de.basisprofil.r4` auf 1.6.0, `hl7.terminology.r4` von 6.1.0 auf 7.3.0.
* **CapabilityStatement korrigiert:** Die sechs eigenen Suchparameter des Moduls sind jetzt deklariert (sie fehlten vollständig), und eine falsche Kanonische beim FamilyMemberHistory-Parameter `reason-code` wurde behoben.
* **Suchparameter** stehen auf einer eigenen Seite, aus den gebauten Artefakten abgeleitet statt von Hand gepflegt.
* **Neues Beispiel:** ein FFPE-Tumorgewebe-Specimen für die TSO500-Panel-Studie, auf das zwei GenomicStudyAnalysis-Beispiele verwiesen, das es aber nie gab.
* **Sechs DiagnosticReport-Beispiel-IDs gekürzt**, damit das Paket überhaupt baubar ist — die bisherigen IDs erzeugten einen Paketpfad über der 100-Byte-Grenze des tar-Formats. Alt → neu: `mii-exa-molgen-molekulargenetischer-befundbericht-*` → `mii-exa-molgen-befundbericht-*`.

##### Konformitätserwartungen

* **Drei Profile sind jetzt `MAY` statt `SHALL`:** `genotyp` sowie die beiden Clinical-Genomics-STU3-Profile `haplotype` und `sequence-phase-relationship`. Alle drei sagen etwas über Allele als Ganzes aus statt über einen Einzelbefund, und viele Labore leiten sie nie ab. `sequence-phase-relationship` war zuvor gar nicht deklariert, obwohl die Implementiererseite es als verwendet darstellte; `haplotype` stand auf `SHALL` und verpflichtete damit zu etwas, wozu der Guide kein Beispiel zeigt.
* **`MII_PR_MolGen_MolekularerBiomarker` ist jetzt deklariert** (`SHALL`). Es ist das Elternprofil von Mikrosatelliteninstabilität und Mutationslast, die beide gefordert waren, während ihr Basisprofil unerwähnt blieb.
* **`DiagnosticReport.result:biomarker` ist darauf verengt.** Zuvor erbte der Slice von STU3 und akzeptierte jedes `molecular-biomarker`.
* **Drei supportedProfile-Einträge zeigten auf Canonicals, die es nicht gibt** — `molekulare-konsequenz`, `genomic-study` und `genomic-study-analysis` waren ohne den Präfix `mii-pr-molgen-` geschrieben, den diese drei Profile tatsächlich tragen. Ein Server hätte sie nicht auflösen können. Die Canonicals selbst bleiben unverändert: sie stehen so im veröffentlichten Paket 2026.0.4.

##### Dokumentation

* **Die Abhängigkeit von Clinical Genomics STU3 ist jetzt korrekt beziffert.** Die Implementiererseite dokumentierte zwei Profile; tatsächlich erben zehn Profile direkt, zwei indirekt, eine Extension erbt, zwölf Extensions werden verwendet, dazu drei ValueSets und zwei Codesysteme.
* **Die CapabilityStatement-Seite trägt eine Tabelle Profil/Erwartung.** Der IG Publisher rendert die unterstützten Profile als reine Linkliste ohne die `SHALL`/`MAY`-Erwartung — ohne diese Tabelle wären die Erwartungen im gerenderten Guide unsichtbar.
* **Die Suchparameter stehen nur noch an einer Stelle.** Die nummerierten Listen auf allen 14 Profil-Intro-Seiten wurden entfernt (3373 Zeilen); sie doppelten das CapabilityStatement, wichen davon ab und nannten das falsche Modul.
* **Elementnamen korrigiert**, die es in STU3 nicht gibt: `CytogenicLocation` → `cytogenetic-location`, `RefSequenceAssembly` → `reference-sequence-assembly`, `associated-phenotype` → `predicted-phenotype`. Ein Mapping auf `amino-acid-change-type` entfiel: STU3 kennt diese Komponente auf `variant` nicht, und das Datensatzelement ist nach `molecular-consequence` gewandert.

##### Korrekturen an Beispielen

* `Task.basedOn` verwies in zwei Beispielen auf `servicerequest/example` — ein Platzhalter mit kleingeschriebenem Ressourcentyp, der ins Leere zeigte. Jetzt die BRAF-Anforderung.
* Zwei Beispiele beanspruchten die STU2-Profile `msi` und `tmb`, die STU3 in `molecular-biomarker` zusammengeführt hat.
* Zwei Gen-IDs im TSO500-Panel waren falsch: `HGNC:3942` (das ist MTOR) mit dem Label FGFR2 und `HGNC:3943` (existiert nicht) mit dem Label FGFR3. Richtig sind `HGNC:3689` und `HGNC:3690`.
* Eine Practitioner-Referenz im umfassenden WES-Bundle zeigte auf eine Ressource, die es nirgends gibt.
* **`known_errors.txt` wurde angelegt.** Von den Validierungsfehlern geht die große Mehrheit auf Grenzen des Terminologieservers zurück und nicht auf Defekte dieses Moduls; die Datei sagt, was was ist, und hält den einen bewusst hingenommenen Fehler fest (die FGFR2::DBP-Fusionscodierung, bei der LOINC 95123-6 narrativ skaliert ist, das Profil den Slice aber an CodeableConcept bindet).

#### Version 2026.0.4

**Datum:** 2026-01-02

##### Package Build & Versionskonsistenz

**Problem**: v2026.0.3 Package auf Simplifier enthielt unerwünschte Text-Dateien (FSH-Quelldateien, Markdown, etc.)

**Behebung**:

* **Versionskonsistenz**: CapabilityStatement und alle SearchParameters verwenden jetzt das zentrale `Version`-Ruleset
* **CapabilityStatement**: Hardcodierte Version `2026.0.0-alpha` durch `* insert Version` ersetzt
* **SearchParameters**: `* insert Version` zu allen 6 aktiven SearchParameter-Instanzen hinzugefügt
* **SupportProfile URLs**: Alle kanonischen URLs im CapabilityStatement auf `|2026.0.4` aktualisiert

**Technische Details**:

* Lokaler Package-Build enthält ausschließlich JSON-Ressourcen (korrekt)
* Simplifier-Pipeline muss korrekten Bake-Workflow verwenden

-------

#### Version 2026.0.3

##### Maintenance Release

**Dependency Updates**

* **kerndatensatz.biobank**: Updated to `2026.0.x` (flexible versioning)

**Aktuelle Abhängigkeiten**

| | |
| :--- | :--- |
| `hl7.fhir.uv.genomics-reporting` | 3.0.x |
| `de.medizininformatikinitiative.kerndatensatz.meta` | 2026.0.x |
| `de.medizininformatikinitiative.kerndatensatz.base` | 2026.0.x |
| `de.medizininformatikinitiative.kerndatensatz.biobank` | 2026.0.x |
| `de.basisprofil.r4` | 1.5.x |
| `hl7.terminology.r4` | 6.1.x |

**Package Build**

* **ImplementationGuide-Filterung**: package.bake.yaml verbessert, um ImplementationGuide-Ressourcen aus dem FHIR-Package auszuschließen

-------

#### Version 2026.0.2

##### Hotfix: Package-Build-Fehler

**Technische Korrektur**

* **Package Build**: v2026.0.1 wurde mit fehlerhaftem Package-Build publiziert 
* Problem: Package enthielt gesamtes Repository (377 Dateien, 2.1 MB) statt nur FHIR-Ressourcen
* Ursache: Verwendung von `npm pack` anstatt `fhir bake` für Package-Erstellung
* Auswirkung: SUSHI konnte keine Ressourcen aus dem Package laden (0 resources statt 36)
* Behebung: Korrekter Build-Prozess mit `fhir bake package.bake.yaml`
* Ergebnis: Package nun korrekt strukturiert (140 Dateien, 381 KB)
 
* **Dokumentation**: build-package.md aktualisiert mit korrektem `fhir bake` Workflow 
* Explizite Verifikationsschritte für Package-Struktur
* Warnungen vor falschen Build-Methoden
 

**Hinweis**: v2026.0.1 bleibt auf Simplifier verfügbar, sollte aber nicht verwendet werden. Alle abhängigen Module sollten auf v2026.0.2 aktualisieren.

-------

#### Version 2026.0.1

##### Hotfix: Familienanamnese Canonical URL

**Breaking Change Fix**

* **Familienanamnese Profile**: Canonical URL wiederhergestellt zur ursprünglichen Version: 
* Canonical URL: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese`
* Die URL wurde in v2026.0.0 versehentlich geändert, was ein breaking change war
* Wiederherstellung der ursprünglichen URL zur Gewährleistung der Rückwärtskompatibilität
* Betroffene abhängige Module: Seltene Erkrankungen (SE)
* Commit: 065fabf
 

**Hinweis**: Die URL `familienanamnese` entspricht zwar nicht formal den aktuellen Namenskonventionen (erwartbar wäre `mii-pr-molgen-familienanamnese`), wird aber beibehalten um breaking changes zu vermeiden.

-------

#### Version 2026.0.0

##### Änderungen nach Ballotierung

###### Vervollständigung und Korrektur der Beispiele

###### Datumsstempel für Observations (HDB-762, HDB-763)

* `effective[x]` und `issued` MS zu allen Observation-Profilen hinzugefügt

###### ServiceRequest.requester (HDB-768)

*  

| | | |
| :--- | :--- | :--- |
| Referenztypen eingeschränkt auf: Practitioner | PractitionerRole | Organization |

 

###### Terminologie-Dokumentation (HDB-749)

Konsolidierung von 18 Terminologie-Seiten in 4 übersichtliche Seiten, organisiert nach Herkunft:

* **MII-ValueSets**: Unsere 4 eigenen ValueSets (Familiäre Linie, Family Member SNOMED, Verwandtschaftsgrad, Verwandtschaftsverhältnis)
* **ClinicalGenomics**: Alle Clinical Genomics STU3 ValueSets + CodeSystems
* **Terminologien**: Externe Standards (LOINC, SNOMED CT, HGNC, HGVS, etc.) mit Lizenzinformationen
* **Index**: Übersicht mit Entscheidungskriterien zur ValueSet-Auswahl

Entfernte Einzelseiten: ClinVar-Evidence-Level, Condition-Inheritance-Pattern, DNAChangeType, Evidence-Level-Examples, Functional-Effect, HGNC, HGVS, HighLowcodes, MolecularConsequence, PharmGKB-Evidence-Level, TBD-Codes, Variant-Confidence-Status, VariantInheritance

###### URL-Namensraum-Migration

* `example.org` URLs durch MII FHIR Namensraum ersetzt (`https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/`)

###### Molekularer Biomarker Profil

* **Neues Profil**: `MII_PR_MolGen_MolekularerBiomarker` als gemeinsames Elternprofil für: 
* Mikrosatelliteninstabilität (erbt jetzt von MolekularerBiomarker)
* Mutationslast (erbt jetzt von MolekularerBiomarker)
 
* Basiert auf Clinical Genomics STU3 MolecularBiomarker-Profil

###### Deutsche Übersetzungen (de-DE)

* **Must Support Elemente**: Alle MS-Elemente in allen Profilen mit deutschen Übersetzungen versehen

###### Konfiguration

* `language: de` in sushi-config.yaml hinzugefügt (Issue #34)

###### CI/CD Verbesserungen

* **Automatische Releases**: GitHub Actions erstellt automatisch Draft-Releases beim Tag-Push
* **Zulip-Benachrichtigung**: Automatische Benachrichtigung im MII-Kerndatensatz Stream bei Release-Veröffentlichung
* **FHIR Package Caching**: Beschleunigte CI-Pipeline durch Caching von FHIR-Paketen

###### Familienanamnese Terminology-Bindings

* Relationship-Bindings aufgeweicht: `required` → `extensible` für SNOMED CT und v3-RoleCode
* Ermöglicht Verwendung im Seltene Erkrankungen (SE) Modul mit spezifischen Verwandtschaftsverhältnissen

###### Terminologie-Server Anforderungen

Das folgende CodeSystem muss auf dem Terminologie-Server importiert werden:

* **URL:** `http://terminology.hl7.org/CodeSystem/variant-confidence-status-cs`
* **Quelle:** https://hl7.org/fhir/uv/genomics-reporting/STU3/CodeSystem-variant-confidence-status-cs.json
* **Hinweis:** Kanonische URL hat sich von STU2 (`http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/variant-confidence-status-cs`) zu STU3 geändert

##### Strukturänderungen der Implementation Guide Navigation

###### IG-Struktur Version 2025.x (Flache Struktur)

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

###### IG-Struktur Version 2026.x (Hierarchische Themengruppierung)

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

###### Entfernte/Ersetzte Seiten

* ❌ ErgebnisZusammenfassung-Observation → in DiagnosticReport.conclusion
* ❌ UntersuchteRegion-Observation → GenomicStudy/GenomicStudyAnalysis

###### Neue Seiten

* 🆕 Molekulare Konsequenz (aus DiagnostischeImplikation ausgelagert)
* 🆕 GenomicStudy/GenomicStudyAnalysis (STU3)
* 🆕 Index-Seiten für jede Kategorie
* 🆕 Szenarien (konkrete Anwendungsbeispiele)
* 🆕 Kommentierung v2026

##### Technische Änderungen

###### Migration zu Clinical Genomics STU3

* Dependency auf den Clinical Genomics Reporting von STU2 auf STU3 
* Neues MolecularBiomarker-Profil
* Neues Molekulare-Konsequenz-Profil (downstream-Beschreibung von genetischen Änderungen)
* DiagnosticImplication 
* Schärfung der Profilierung mit Fokus auf Erkrankungsrisiko, Auslagerung der reinen Beschreibung der Änderung ins Molekulare-Konsequenz-Profil
* `extension[genomic-artifact]` durch `extension[workflow-relatedArtifact]` ersetzt
* component[functional-effect] in MolecularConsequence übertragen
 
* Ergebnis-Zusammenfassung 
* Löschen des Profils (Grund: Redundanzen, Ergebnis kann über GenomicReport.conclusion/conclusionCode abgebildet werden)
 
* Mikrosatelliteninstabilität 
* erbt jetzt vom STU3 Molecular Biomarker Profile
* `component[conclusion-string]` entfällt
 
* Molekulargenetischer Befundbericht erbt jetzt von genomic-report und nicht mehr genomics-report 
* wegfallen des [overall]-Slices
* Zusammenlegen der extensions für [genomics-artifact] und [genomics-file] in [workflow-relatedArtifact]
* extension[genomics-risk-assessment] ist jetzt extension[genomic-risk-assessment]
* extension[region-studied] entfällt; Metadaten über die Untersuchte Region werden jetzt über GenomicStudy/GenomicStudyAnalysis abgebildet
 
* Mutationslast 
* erbt jetzt vom neuen Molekularer Biomarker Modul
* damit entfällt `component[conclusion-string]`
 
* Therapeutische Implikation 
* component[prognosis] fällt weg 
* `component[predicted-therapeutic-implication]` zu `component[therapeutic-implication]` geändert
 
* Untersuchte Region 
* Profil fällt weg, Information über Lokalisation und Geräte wird stattdessen über GenomicStudy/GenomicStudyAnalysis kodiert
 
* Variante 
* component[coding-hgvs] umbenannt in component[representative-coding-hgvs]
* component[transcript-ref-seq] umbenannt in component[representative-transcript-ref-seq]
* component[protein-hgvs] umbenannt in component[representative-protein-hgvs]
* component[amino-acid-change-type] gelöscht
* component[molecular-consequence] aus Variante gelöst und in MolecularConsequence überführt
 
* Beispiele entsprechend angepasst (alte Beispiele für Diagnostische Implikation entsprechen eher neuem Profil für Molekulare Konsequenz)
* Neue Ordnerstruktur im GitHub-Repo
 
* Logical Model (LogicalModel.fsh) 
* Elementnamen bereinigt: Bindestriche entfernt und durch CamelCase ersetzt (z.B. Krankengeschichte-Familie → KrankengeschichteFamilie)
* Sonderzeichen entfernt: Mikrosatelliteninstabilität → Mikrosatelliteninstabilitaet
* FHIR-Mappings entsprechend aktualisiert für Konsistenz
* Alle Elementnamen folgen jetzt FHIR-Namenskonventionen (nur alphanumerische Zeichen)
 
* Profil-Korrektur (Anforderung.fsh) 
* Typo korrigiert: "gentischer" → "genetischer" in Profile ID und InstanceOf Referenzen
* Korrekte Canonical URL: mii-pr-molgen-anforderung-genetischer-test
 
* Familienanamnese (FamilyMemberHistory.fsh) 
* Terminology-Bindings an Diagnose-Modul 2025.0.1 angeglichen
* ValueSet-Migration für ICD-10-GM, Alpha-ID, SNOMED CT und Orphanet Codings: 
* `reasonCode.coding[icd10-gm]`: `http://fhir.de/ValueSet/bfarm/icd-10-gm` → `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm`
* `reasonCode.coding[alpha-id]`: `http://fhir.de/ValueSet/bfarm/alpha-id` → `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid`
* `reasonCode.coding[sct]`: bereits `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct`
* `reasonCode.coding[orphanet]`: Neues Binding zu `https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet`
* Gleiche Änderungen für `condition.code.coding` Slices
 
* Relationship-Bindings aufgeweicht: `required` → `extensible` für SNOMED CT und v3-RoleCode 
* Erlaubt Flexibilität bei ungewöhnlichen Verwandtschaftsverhältnissen
 
 

-------

#### Version 2025.0.0

* Package-ID aktualisiert
* Abhängigkeiten harmonisiert

