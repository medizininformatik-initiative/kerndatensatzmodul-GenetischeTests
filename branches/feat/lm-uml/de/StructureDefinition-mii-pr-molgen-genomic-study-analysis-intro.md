<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Methodik/GenomicStudyAnalysis-Procedure.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Dieses Profil beschreibt eine Genomic Study Analysis als Procedure-Ressource zur detaillierten Dokumentation der Analyseschritte innerhalb einer genomischen Untersuchung. Es arbeitet in Verbindung mit dem GenomicStudy-Profil und folgt den Vorgaben des Clinical Genomics Reporting STU3.

GenomicStudyAnalysis erfasst spezifische Analyseparameter wie untersuchte Genomregionen, verwendete Referenzassemblies und Analysetools.

---

Das Profil ist abgeleitet vom Profil [GenomicStudyAnalysis](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html) aus [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profil

---

#### Must Support Elemente

| FHIR-Element | Bedeutung | Logischer Datensatz |
|---|---|---|
| Procedure.extension:specimen | Referenz zur verwendeten Probe | Probeninformation.Probe |
| Procedure.extension:device | Verwendetes Analysegerät (Sequenzer, Software) | Methoden.Geräte / Software |
| Procedure.extension:method-type | Art der Analysemethode (z.B. Sequenzierung, PCR) | Methoden.Analysetyp |
| Procedure.extension:change-type | Untersuchte Variationstypen (SNV, CNV, etc.) | Methoden.Variationstypen |
| Procedure.extension:regions | Untersuchte genomische Regionen (Gene, Exons) | Methoden.Untersuchte Regionen |
| Procedure.extension:genome-build | Version des Referenzgenoms (z.B. GRCh38) | Methoden.Referenzgenom |
| Procedure.extension:focus | Fokus/Ziel der Analyse | Methoden.Analysefokus |
| Procedure.extension:title | Bezeichnung der Analyse | Methoden.Analysebezeichnung |
| Procedure.extension:metrics | Qualitätsmetriken (Coverage, Depth) | Methoden.Qualitätsmetriken |

---


**Examples**

Beispiel 1: GenomicStudyAnalysis für Exom-Sequenzierung

---
