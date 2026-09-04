<!-- markdownlint-disable MD041 -->
<!-- Deutsche Übersetzung von input/pagecontent/index.md. Englisch ist die
     Standardsprache des Leitfadens; beide Sprachfassungen müssen dieselbe
     Überschriftenstruktur haben. -->
<!-- Migriert aus dem Simplifier-Leitfaden Index.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

### Einleitung

Die vorliegende Spezifikation beschreibt die FHIR-Repräsentation des
KDS-Moduls **Molekulargenetischer Befundbericht** der Medizininformatik-Initiative
(MII). Sie umfasst die Anwendungsfälle des Moduls sowie die dazugehörigen
FHIR-Profile, Extensions und Terminologie-Ressourcen in ihrer verbindlichen
Form. Der MII-Kerndatensatz ermöglicht die standardisierte Sekundärnutzung
klinischer Routinedaten für die medizinische Forschung.

<!-- TODO:REVIEW Die migrierte Quellseite nennt als Veröffentlichungsdatum den
     19.12.2025, das Template-Gerüst den 2026-01-02. Hier steht der Wert des
     Gerüsts. Ebenfalls zu prüfen: die Klammer "(CalVer YYYY.n.n)" in der
     Versionszeile stammt aus dem Template und ist eher ein Autorenhinweis als
     ein Publikationsangabe. -->

| Veröffentlichung |               |
|-------------|---------------|
| Datum       | 2026-09-04 |
| Version     | 2027.0.0-ballot.rc2 (CalVer `YYYY.n.n`) |
| Status      | active        |
| Realm       | DE            |

### Zielgruppen

<div class="ig-highlight ig-highlight-blue">
<h5>Implementierende</h5>
<p>Datenintegrationszentren (DIZ), Softwareentwickelnde und Systemarchitektinnen und -architekten, die FHIR-basierte Lösungen umsetzen.<br/>
→ siehe <a href="profiles.html">Profile</a> und <a href="logical-models.html">Logische Modelle</a>.</p>
</div>

<div class="ig-highlight ig-highlight-green">
<h5>Forschende</h5>
<p>Wissenschaftlerinnen und Wissenschaftler, die KDS-Daten für die medizinische Forschung nutzen.<br/>
→ siehe <a href="guidance.html">Anleitung</a>.</p>
</div>

### Inhalt

- **[Anleitung](guidance.html)** — Einstieg und fachliche Hinweise.
- **Konformität** — die KDS-weiten Konformitätsregeln (Anforderungssprache,
  Must Support, Umgang mit fehlenden Daten) werden zentral vom
  [Meta-Modul](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Conformance)
  gepflegt; die modul-spezifischen Aspekte zu
  [Sicherheit und Datenschutz](security-and-privacy.html) sind Teil dieses
  Leitfadens.
- **[Profile](profiles.html)** und die weiteren
  **[Artefaktseiten](artifacts.html)** — die technischen Artefakte.
- **[Beispiele](examples.html)** — Beispielinstanzen.
- **[Abhängigkeiten](ImplementationGuide-mii-ig-molgen.html)** — die
  ImplementationGuide-Ressource mit der Abhängigkeitstabelle, der
  Cross-Version-Analyse und den Copyright-Angaben.

### Verwandte Leitfäden

Dieses Modul ist Teil des MII-Kerndatensatzes; die übrigen KDS-Module und ihre
Abhängigkeiten sind unter
[medizininformatik-initiative.de](https://www.medizininformatik-initiative.de/)
beschrieben. Wie sich dieses Modul zu den anderen MII-Modulen verhält,
beschreibt die [Anleitung für Implementierende](implementer-guidance.html).

Dieser Leitfaden baut auf den folgenden Paketen auf. Die Tabelle stammt aus
`dependencies:` in `sushi-config.yaml` und kann deshalb nicht von dem abweichen,
was der Build tatsächlich auflöst:

| Paket | Version | Wofür |
|---|---|---|
| `hl7.fhir.uv.genomics-reporting` | `3.0.0` | HL7 Clinical Genomics Reporting STU3 — die internationale Basis, von der jedes genetische Profil hier abstammt |
| `de.medizininformatikinitiative.kerndatensatz.meta` | `2027.0.0-ballot.rc3` | MII-Kerndatensatz-Modul Meta — Provenienz und die gemeinsamen Suchparameter |
| `de.basisprofil.r4` | `1.6.0` | Deutsche Basisprofile — Identifikatoren, Adressen, Versicherung |
| `de.medizininformatikinitiative.kerndatensatz.base` | `2027.0.0-ballot.rc1` | MII-Kerndatensatz-Modul Basis — Patient, Encounter und die modulübergreifenden Grundlagen |
| `de.medizininformatikinitiative.kerndatensatz.biobank` | `2027.0.0-ballot.rc2` | MII-Kerndatensatz-Modul Biobank — die Specimen-Profile, auf die die genomischen Studien verweisen |
| `hl7.terminology.r4` | `7.3.0` | HL7 Terminology — die Codesysteme, auf die sich die FHIR-Kernspezifikation stützt |
| `hl7.fhir.uv.crmi` | `2.0.0` | Canonical Resource Management Infrastructure — erklärt, wie dieser Leitfaden seine Artefakte versioniert |
| `hl7.fhir.uv.extensions.r4` | `5.3.0` | HL7-Extension-Paket |


Weitere FHIR-Implementierungsleitfäden finden sich in der offiziellen
**[FHIR IG Registry](https://fhir.org/guides/registry/)** (Quelle:
[`FHIR/ig-registry`](https://github.com/FHIR/ig-registry)).

### Impressum

Dieser Leitfaden ist im Rahmen der Medizininformatik-Initiative erstellt worden
und unterliegt per Governance-Prozess dem Abstimmungsverfahren des
Interoperabilitätsforums und der Technischen Komitees (TCs) von
HL7 Deutschland e. V.

### Kontakt

Fragen zu der vorliegenden Publikation können im HL7-FHIR-Zulip
[chat.fhir.org](https://chat.fhir.org) im Stream `german/mi-initiative` gestellt
werden oder im MII-Zulip [mii.zulipchat.com](https://mii.zulipchat.com/) im
Stream `MII-Kerndatensatz`.
Anmerkungen und Kritik werden als *Issues* auf
[GitHub](https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/issues)
stets gern entgegengenommen.

Ansprechpersonen für die fachlichen Inhalte des Moduls:

* Sylvia Thun, Berlin Institute of Health at Charité (BIH)
* Thomas Debertshäuser, Berlin Institute of Health at Charité (BIH)
* Julian Saß, Berlin Institute of Health at Charité (BIH)
* Karoline Buckow, TMF – Technologie- und Methodenplattform für die vernetzte medizinische Forschung e.V.
* Franziska Klepka, TMF – Technologie- und Methodenplattform für die vernetzte medizinische Forschung e.V.

### Autoren (in alphabetischer Reihenfolge)

<!-- TODO:REVIEW Die Reihenfolge ist unverändert aus der Quellseite übernommen;
     sie ist nicht durchgängig alphabetisch (u. a. "Kirsten Toralf",
     "Stefan Fröhling"). Nicht ohne fachliche Freigabe umsortieren. -->

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

### Copyright und Lizenz

Copyright © 2022+: TMF e. V., Charlottenstraße 42, 10117 Berlin

Dieses Werk ist lizenziert unter der
[Creative-Commons-Namensnennung-4.0-International-Lizenz (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/deed.de).

Zu den Nutzungsrechten der zugrunde liegenden FHIR-Technologie siehe die
FHIR-Basisspezifikation.

Einige der verwendeten Codesysteme werden von anderen Organisationen
herausgegeben und gepflegt; es gilt das Copyright der jeweiligen Herausgeber.

### Disclaimer

Der Inhalt dieses Dokuments ist öffentlich. Zu beachten ist, dass Teile dieses
Dokuments auf FHIR Version R4 beruhen, für die das Copyright von
HL7 International gilt.

Obwohl diese Publikation mit größter Sorgfalt erstellt wurde, können die
Autoren keinerlei Haftung für direkten oder indirekten Schaden übernehmen, der
durch den Inhalt dieser Spezifikation entstehen könnte.

<!-- TODO:REVIEW Der migrierte Abschnitt "Navigation und Inhaltsverzeichnis"
     der Simplifier-Startseite wurde nicht übernommen: er dupliziert die
     Navigationsmenüs des Templates und den Abschnitt "Inhalt" oben, seine
     Einträge waren keine Markdown-Links, und er verwies auf die entfallenen
     STU2-Profile ErgebnisZusammenfassung und UntersuchteRegion. Falls einzelne
     Sprungziele erhalten bleiben sollen, hier nachtragen. -->
