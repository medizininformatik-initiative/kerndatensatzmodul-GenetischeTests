---
parent: 
topic: Kommentierung
---

## {{page-title}}

Diese Seite sammelt spezifische Punkte, für die gezieltes Feedback in der Kommentierungsphase v2026 des Moduls Molekulargenetischer Befundbericht benötigt wird.

### Migration von Clinical Genomics STU2 zu STU3

#### Profile-Strukturänderungen

* **UntersuchteRegion zu GenomicStudy/GenomicStudyAnalysis**: Die Migration ersetzt das UntersuchteRegion-Profil durch die neuen GenomicStudy-Profile. Ist die gewählte Abbildung der historischen UntersuchteRegion-Daten auf die neue Struktur vollständig?
  - Sollten Legacy-Beispiele als Kommentare erhalten bleiben für Rückwärtsdokumentation?
  - Ist die Granularität von GenomicStudyAnalysis für alle bisherigen Use Cases ausreichend?

* **Molecular Consequence Auslagerung**: Die funktionellen Effekte wurden aus DiagnostischeImplikation in das neue MolekulareKonsequenz-Profil ausgelagert. 
  - Ist die Trennung zwischen Implikation und molekularer Konsequenz klar genug definiert?
  - Sollten beide Profile immer gemeinsam verwendet werden oder sind isolierte Nutzungen sinnvoll?

### Referenzsequenzen und Transkripte

#### MANE-Transkript Empfehlung

* **MANE vs. RefSeq-Versionierung**: Die Empfehlung zur Verwendung von MANE-Transkripten ist aktuell als "SOLL"-Anforderung formuliert.
  - Sollte dies zu einem "MUSS" für Neudiagnosen ab 2026 werden?
  - Wie sollen Altdaten mit nicht-MANE Transkripten behandelt werden?
  - Ist eine Mapping-Tabelle zwischen Legacy-Transkripten und MANE erforderlich?

* **Transkript-Versionsnummern**: Die Versionsnummer (z.B. NM_007294.4) ist empfohlen aber nicht verpflichtend.
  - Sollte die Versionsnummer für eindeutige Interpretation verpflichtend werden?
  - Wie sollen Updates bei neuen Transkript-Versionen gehandhabt werden?

### Terminologie-Bindings

#### HGNC und HGVS ValueSets

* **HGNC-Aktualisierungen**: Das HGNC ValueSet verwendet möglicherweise veraltete Gen-IDs.
  - Sollte ein Mechanismus für automatische HGNC-Updates implementiert werden?
  - Wie sollen umbenannte oder zurückgezogene Gene behandelt werden?
  - Ist eine historische Versionierung der HGNC-Codes notwendig?

* **HGVS-Notation Validierung**: Die HGVS-Notation in component[coding-hgvs] ist als String ohne Validierung.
  - Sollte eine HGVS-Syntax-Validierung verpflichtend werden?
  - Benötigen wir ein dediziertes HGVS-CodeSystem statt Freitext?
  - Wie strikt sollte die HGVS-Konformität durchgesetzt werden?

### Varianten-Klassifikation

#### Pathogenität und Evidenzlevel

* **ACMG vs. ClinVar vs. eigene Klassifikation**: Verschiedene Klassifikationssysteme können parallel verwendet werden.
  - Sollte ein primäres Klassifikationssystem als "preferred" markiert werden?
  - Wie sollen Diskrepanzen zwischen verschiedenen Klassifikationen dokumentiert werden?
  - Ist die aktuelle Slice-Struktur für multiple Klassifikationen optimal?

* **Evidenzlevel-Granularität**: Die Evidenzlevel für therapeutische Implikationen verwenden verschiedene Systeme (ClinVar, PharmGKB, etc.).
  - Sollte ein einheitliches MII-Evidenzlevel-System definiert werden?
  - Wie sollen proprietäre Evidenzlevel von kommerziellen Panels integriert werden?
  - Ist die Trennung zwischen diagnostischer und therapeutischer Evidenz klar genug?


### Fusionen und Strukturvarianten

#### Fusion-Darstellung (aktuell eingeschränkt)


### Molekulare Biomarker

#### Mikrosatelliteninstabilität (MSI) und Tumormutationslast (TMB)

* **MSI-Status Kategorisierung**: Die MSI-Kategorien (MSI-H, MSI-L, MSS) verwenden LOINC-Codes.
  - Sollten zusätzlich numerische Werte (z.B. Anzahl instabiler Marker) verpflichtend sein?
  - Wie sollen Panel-spezifische MSI-Scores harmonisiert werden?
  - Ist die binäre high/low-Unterscheidung für alle Use Cases ausreichend?

* **TMB-Normalisierung**: Die TMB kann als Mutationen/Megabase oder absolute Anzahl angegeben werden.
  - Sollte eine Standardnormalisierung (mut/Mb) verpflichtend werden?
  - Wie sollen unterschiedliche Panel-Größen bei der TMB-Berechnung berücksichtigt werden?
  - Benötigen wir Schwellenwerte für high/intermediate/low TMB?



### Therapieempfehlungen

#### Task-basierte Empfehlungen

* **Task vs. MedicationRequest**: Therapieempfehlungen nutzen Task-Ressourcen statt MedicationRequest.
  - Ist Task die richtige Wahl für konkrete Medikationsempfehlungen?
  - Sollten beide Ansätze parallel unterstützt werden?
  - Wie sollen Dosierungsempfehlungen in Task strukturiert werden?

* **Priorisierung von Empfehlungen**: Bei multiplen Therapieoptionen fehlt eine Priorisierung.
  - Sollte eine Ranking-Extension für Therapieempfehlungen eingeführt werden?
  - Wie sollen Kombinationstherapien vs. Monotherapien priorisiert werden?
  - Ist die aktuelle Task.priority ausreichend granular?

### Familienanamnese

#### Verwandtschaftsgrad-Extensions

* **Adoptiv- vs. biologische Verwandtschaft**: Die Extensions unterscheiden zwischen verschiedenen Verwandtschaftstypen.
  - Sollte unbekannte biologische Verwandtschaft explizit kodierbar sein?
  - Wie sollen Samenspender/Eizellenspender in der Familienanamnese dargestellt werden?
  - Ist die Granularität für Halbgeschwister ausreichend?

* **Consanguinität**: Blutsverwandtschaft der Eltern ist nicht explizit modelliert.
  - Benötigen wir eine Extension für Consanguinität?
  - Wie soll der Verwandtschaftsgrad zwischen Eltern angegeben werden?
  - Ist dies relevant für die Risikoberechnung?

### Qualitätsmetriken

#### Coverage und Depth

* **Callable Regions**: Die Definition von "callable" vs. "non-callable" Regionen variiert zwischen Laboren.
  - Sollten einheitliche Callable-Kriterien definiert werden?
  - Wie sollen borderline-callable Regionen dokumentiert werden?
  - Ist die binäre callable/non-callable Unterscheidung ausreichend?

* **Coverage-Metriken**: Verschiedene Coverage-Metriken (mean, median, percentage >X) sind möglich.
  - Welche Coverage-Metriken sollten verpflichtend sein?
  - Sollte die Coverage pro Gen oder pro Exon angegeben werden?
  - Wie sollen ungleichmäßige Coverage-Verteilungen dokumentiert werden?

### Interoperabilität mit anderen Modulen

#### Onkologie-Modul Integration

* **Somatisch vs. Keimbahn**: Die Unterscheidung ist aktuell über genomic-source-class.
  - Sollte dies prominenter in der Profil-Hierarchie abgebildet werden?
  - Benötigen wir separate Profile für somatische vs. Keimbahn-Varianten?
  - Wie sollen Keimbahn-Zufallsbefunde bei somatischen Analysen dokumentiert werden?

* **MTB-Empfehlungen**: Molekulare Tumorboard-Empfehlungen überschneiden sich mit dem Onkologie-Modul.
  - Welches Modul sollte primär für MTB-Dokumentation verwendet werden?
  - Wie sollen die Module bei gemeinsamer Nutzung verlinkt werden?
  - Ist eine Harmonisierung der Therapieempfehlungs-Struktur notwendig?

### Technische Implementierung

#### Bundle-Strategie

* **Transaction-Bundle Vollständigkeit**: Die Transaction-Bundles enthalten teilweise Referenzen auf nicht enthaltene Ressourcen.
  - Sollten Bundles immer self-contained sein?
  - Wie sollen externe Referenzen (z.B. auf Patient) gehandhabt werden?
  - Ist die Hybrid-Bundle-Strategie (Einzel + Bundle-Beispiele) optimal?

#### SearchParameter

* **Component-Search Komplexität**: Die Suche in Observation.component ist komplex.
  - Sollten häufig gesuchte Components als Top-Level-Extensions modelliert werden?
  - Ist die aktuelle composite-Search-Strategie performant genug?
  - Benötigen wir spezielle Indizes für Varianten-Suchen?

### Ethische und regulatorische Aspekte

#### Zufallsbefunde

* **Incidental Findings Dokumentation**: Zufallsbefunde sind nicht explizit gekennzeichnet.
  - Sollte eine "incidental-finding" Extension eingeführt werden?
  - Wie sollen nicht-gemeldete Zufallsbefunde dokumentiert werden?
  - Welche Consent-Informationen sind für Zufallsbefunde erforderlich?

#### Datenschutz

* **Varianten-Eindeutigkeit**: Seltene Varianten können potentiell re-identifizierend sein.
  - Sollten seltene Varianten speziell gekennzeichnet werden?
  - Wie sollen Varianten mit Populationsfrequenz <0.01% geschützt werden?
  - Sind zusätzliche Zugriffskontrollen für genetische Daten erforderlich?

### Kernfragen für die Kommentierung

1. **Priorisierung**: Welche der genannten Punkte haben höchste Priorität für die Implementierung?
2. **Verpflichtungsgrad**: Welche aktuellen SOLL-Anforderungen sollten zu MUSS werden?
3. **Rückwärtskompatibilität**: Wie wichtig ist die Unterstützung von STU2-Legacy-Daten?
4. **Harmonisierung**: Wo besteht der größte Bedarf für standortübergreifende Harmonisierung?
5. **Erweiterungen**: Welche zusätzlichen Profile/Extensions werden dringend benötigt?