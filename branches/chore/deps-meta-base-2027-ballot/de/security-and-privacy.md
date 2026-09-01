# Sicherheit und Datenschutz - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

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

> **Dieser Abschnitt ist noch nicht geschrieben — Entscheidung getroffen, Inhalt offen.** Der Simplifier-Leitfaden, aus dem dieses Modul migriert wurde, enthält überhaupt keine Sicherheits- oder Datenschutz-Darstellung; es gab hier also nichts zu migrieren.Das Template bietet einen Standardtext für Module ohne eigene Aspekte ("führt dieses Modul keine Datenkategorie, die eigene Sicherheits- oder Datenschutzaspekte aufwirft"). **Dieser Standardtext wurde bewusst NICHT übernommen**, weil er für ein molekulargenetisches Modul unzutreffend wäre: Das Modul führt genetische Sequenzdaten. Diese sind besondere Kategorien personenbezogener Daten, sind auch nach Pseudonymisierung inhärent re-identifizierend und enthalten Informationen über Blutsverwandte, die nicht die betroffene Person sind und nicht eingewilligt haben.Die eigentliche Analyse zu schreiben ist Aufgabe der Fach-Autorinnen und -Autoren, nicht der Migration; sie bleibt deshalb offen statt geraten. Sie muss vor dem ersten Release erfolgen: mindestens die geführten Datenkategorien und ihre Sensibilität, das Re-Identifikationsrisiko, das eine Pseudonymisierung auf Profilebene nicht beseitigt, die familiären Implikationen sowie sicherheits- oder datenschutzbezogene SHALL/SHOULD/MAY-Anforderungen dieses Moduls an Implementierende, jeweils mit dem adressierten Risiko.

