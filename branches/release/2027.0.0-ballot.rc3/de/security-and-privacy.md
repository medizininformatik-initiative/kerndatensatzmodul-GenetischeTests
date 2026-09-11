# Sicherheit und Datenschutz - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc3

* [**Inhaltsverzeichnis**](toc.md)
* **Sicherheit und Datenschutz**

## Sicherheit und Datenschutz

 Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie [hier](translationinfo.md). 

Dieser Abschnitt richtet sich an Sicherheits- und Datenschutz-Fachleute. Allgemeine Anforderungen stehen in der FHIR-Kernspezifikation — [Security & Privacy Module](https://build.fhir.org/secpriv-module.html) und die [Security-Checkliste](https://build.fhir.org/security.html). Diese Seite wiederholt sie nicht; sie verlinkt den übergreifenden Datenschutzrahmen und nennt, was **für dieses Modul spezifisch** ist.

#### 1. Das übergreifende Datenschutzkonzept

Das [übergreifende Datenschutzkonzept der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/de/datenschutzkonzept) regelt, wie Patientendaten über das Netz der Datenintegrationszentren hinweg für die Forschung verarbeitet werden dürfen: die Rechtsgrundlage (der Broad Consent der MII), die Rollen der Datenintegrationszentren und der Use-&-Access-Committees sowie die standortübergreifenden Anwendungsszenarien (Machbarkeitsanfragen, verteilte Analysen, Daten- und Bioproben-Bereitstellung). Alles, was dieses Modul spezifiziert, bewegt sich innerhalb dieses Rahmens — dieser Leitfaden fügt keinen eigenen Verarbeitungszweck hinzu.

#### 2. De-Identifikation, Minimierung und Pseudonymisierung (DIMP)

Wie Daten, die ein Datenintegrationszentrum verlassen, praktisch de-identifiziert werden, spezifiziert [DIMP (De-Identification — Minimisation — Pseudonymisation)](https://medizininformatik-initiative.github.io/dataportal/data-node/DIMP.html) in der Dokumentation des Datenportals: direkte Identifikatoren werden entfernt, vom genehmigten Projekt nicht benötigte Datenelemente entfallen, und identifizierende Werte werden durch projektspezifische Pseudonyme ersetzt (FHIR-Pseudonymizer-Konfiguration). Die Profile dieses Moduls beschreiben die Daten **vor** Anwendung von DIMP; welche Elemente eine konkrete Datenbereitstellung erreicht, entscheidet je Projekt die DIMP-Konfiguration, nicht dieser Leitfaden.

#### 3. Modul-spezifische Aspekte

Dies ist der eigene Beitrag des Moduls: die Sicherheits- und Datenschutz-Eigenschaften, die aus der **Art der Daten dieses Moduls** folgen.

##### Welche Daten dieses Modul führt

Das Modul führt drei Kategorien, die über gewöhnliche Befunddaten hinausgehen.

**Sequenzangaben.** Das Profil [Variante](StructureDefinition-mii-pr-molgen-variante.md) führt unter anderem das untersuchte Gen, die HGVS-Notation auf DNA- und Genomebene, die Referenzsequenz mit Assembly, exakte sowie innere und äußere Start-End-Positionen, Referenz- und Alternativallel und den DNA-Änderungstyp. Das ist keine Kodierung eines Befundes, sondern eine Beschreibung der Sequenz selbst.

**Die Unterscheidung Keimbahn/somatisch.** Die Komponente `genomic-source-class` hält fest, ob eine Veränderung ererbt oder erworben ist. Keimbahnbefunde gelten unverändert lebenslang und betreffen Blutsverwandte.

**Angaben über Dritte.** Das Profil [Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md) führt Verwandtschaftsverhältnis, Verwandtschaftsgrad, familiäre Linie, Geschlecht und den Grund der Erhebung — zu Personen, die **nicht die betroffene Person sind** und in die Erhebung ihrer Daten nicht eingewilligt haben.

##### Was daraus folgt

**Re-Identifizierbarkeit überlebt die Pseudonymisierung.** Eine Pseudonymisierung auf Profilebene ersetzt Identifikatoren. Sie berührt nicht, dass eine hinreichende Zahl exakter Positionen mit Referenz- und Alternativallel eine Person eindeutig kennzeichnet — gegen jede andere Probe derselben Person und gegen Referenzdatenbanken. Die Sequenzangaben sind selbst der Identifikator. Das ist der Grund, warum die in Abschnitt 2 beschriebenen Maßnahmen hier nicht ausreichen.

**Der Befund reicht über die betroffene Person hinaus.** Ein Keimbahnbefund sagt etwas über Eltern, Geschwister und Kinder aus, die weder befragt noch eingewilligt haben. Die Familienanamnese macht diesen Bezug zusätzlich explizit.

**Die Daten altern nicht.** Ein Pseudonym lässt sich wechseln, eine Sequenz nicht. Eine Offenlegung ist endgültig.

Genetische Daten sind besondere Kategorien personenbezogener Daten im Sinne von Art. 9 DSGVO.

##### Anforderungen dieses Moduls

Die folgenden Anforderungen richten sich an Implementierende. Sie ergänzen die allgemeinen Maßnahmen aus Abschnitt 2, sie ersetzen sie nicht.

| | | |
| :--- | :--- | :--- |
| **SHALL** | Sequenzangaben nur an Empfänger übermitteln, deren Zweckbindung sie ausdrücklich einschließt | Sequenzdaten sind selbst Identifikator; eine Weitergabe „im Rahmen des Befundes" trägt hier nicht |
| **SHALL** | `genomic-source-class`führen, wo die Unterscheidung bekannt ist | ohne sie ist nicht erkennbar, ob ein Befund Verwandte betrifft |
| **SHOULD** | Für Auswertungen, die keine Basengenauigkeit brauchen, die Positionsangaben weglassen statt sie mitzuliefern | senkt die Re-Identifizierbarkeit, ohne den fachlichen Zweck zu verfehlen |
| **SHOULD** | Familienanamnese-Angaben getrennt von den Sequenzdaten freigeben | die Verknüpfung beider erhöht die Aussagekraft über Dritte erheblich |
| **MAY** | Zugriffe auf Instanzen der Profile Variante, Genotyp und Familienanamnese gesondert protokollieren | ermöglicht Nachvollzug bei Verdacht auf Zweckentfremdung |

Was davon technisch wie durchgesetzt wird — Zugriffskontrolle, Protokollierung, Einwilligungsprüfung — entscheidet die DIMP-Konfiguration des jeweiligen Projekts, nicht dieser Leitfaden. Dieses Modul benennt, **was** zu schützen ist und warum.

