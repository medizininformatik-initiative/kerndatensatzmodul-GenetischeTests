<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Workflow/Befundbericht-DiagnosticReport.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Dieses Profil beschreibt molekulargenetischen Befundbericht der Medizininformatik-Initiative.

---

Das Profil ist abgeleitet vom Profil [Genomics Report](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-report.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

Für den Use Case, dass die EBM Abrechnungsziffern in einem Befund angegeben werden, <br/>
wird die [Supporting Information Extension](http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo) in DiagnosticReport.extension mit Reference auf ChargeItem Ressource verwendet. 
<br/>
Ein passendes [Profil für ChargeItem](http://fhir.de/StructureDefinition/chargeitem-de-ebm) kann aus den deutschen FHIR Basisprofilen verwendet werden. 

---

#### Profil

---

#### Extensions

**Genomics Artifact**

* Name: Genomics Artifact
* Definition: Erfasst Zitate, Beweise und andere unterstützende Unterlagen für die Beobachtung oder den Bericht.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact

---

**Genomics File**

* Name: Genomics File
* Definition: Wird verwendet, um den Inhalt von oder Links zu Dateien zu übermitteln, die als Teil des Testprozesses erstellt wurden. 
Beispiele sind VCF-, BAM-, CRAM- und andere ähnliche Dateien.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-file

---

**Empfohlene Maßnahme**

* Name: Empfohlene Maßnahme
* Definition: Die Extension verweist auf eine vorgeschlagene Maßnahme, die auf der Grundlage der Ergebnisse des Befundberichts empfohlen wird.
* url: https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme

---

**Genomics Risk Assessment**

* Name: Genomics Risk Assessment
* Definition: RiskAssessment als Teil eines genomischen Berichtes oder einer Beobachtung.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-risk-assessment

---

**Coded Note**

* Name: Coded Note
* Definition: Kommentare zum Bericht, die auch einen kodierten Typ enthalten.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report-note

---

**Supporting Info**

* Name: Supporting Info
* Definition: Weitere Informationen, die für diese Beobachtung relevant sein könnten.
* url: http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo

---

| FHIR-Element | Logischer Datensatz |
|---|---|
| DiagnosticReport.status | Weiteres.Berichtstatus |
| DiagnosticReport.issued | Weiteres.Datum des Berichts |
| DiagnosticReport.performer | Weiteres.Labor / Institution/ Ansprechpartner |
| DiagnosticReport.resultsInterpreter | Weiteres.Labor / Institution/ Ansprechpartner |
| DiagnosticReport.media | Ergebnisse.Daten |
| DiagnosticReport.media | Weiteres.Anhänge |
| DiagnosticReport.subject | Probeninformationen.Patient |
| DiagnosticReport.specimen | Probeninformationen.Probe | 
| DiagnosticReport.identifier | Weiteres.Bericht ID |
| DiagnosticReport.extension:supporting-info(ChargeItem) | Anforderung.Einheitlicher Bewertungsmaßstab |
| DiagnosticReport.supporting-info | Methoden.Relevante Parameter |

--- 


**Examples**

Befundbericht-1 BRAF

  
---

Befundbericht-2 NIPBL

  
---

Die in Befundbericht-2 abzurechnenden EBM-Ziffern werden separat in ChargeItem Ressourcen erfasst.

 
---

Befundbericht-3 Risk-Panel

 
---
