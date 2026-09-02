<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht-intro.md - reviewed at Gate C -->
<!-- Migrated from the Simplifier guide TechnischeImplementierung/Workflow/Befundbericht-DiagnosticReport.page.md
     (source tree implementation-guides/ImplementationGuide-2026.x-DE, commit 79eaf41, migration 2026-08-28).
     Simplifier directives are resolved according to references/fql-crosswalk.md. -->

---

#### Description

This profile describes the molecular genetic report (molekulargenetischer Befundbericht) of the Medical Informatics Initiative.

<!-- TODO:REVIEW unresolved FQL metadata block below (url/status/version). references/fql-crosswalk.md says to drop such a block, because the publisher generates that header itself. Carried over verbatim because this task translates only; the same block stands in the German file. The select labels stay German ("Basis") since they sit inside a code block. -->

---

The profile is derived from the profile [Genomics Report](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-report.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

For the use case that the EBM billing codes are stated in a report, <br/>
the [Supporting Information Extension](http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo) is used in DiagnosticReport.extension with a Reference to a ChargeItem resource. 
<br/>
A suitable [profile for ChargeItem](http://fhir.de/StructureDefinition/chargeitem-de-ebm) from the German FHIR base profiles can be used. 

---

#### Profile

---

#### Extensions

**Genomics Artifact**

* Name: Genomics Artifact
* Definition: Captures citations, evidence and other supporting documentation for the observation or the report.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact

---

**Genomics File**

* Name: Genomics File
* Definition: Used to convey the content of, or links to, files created as part of the testing process. 
Examples are VCF, BAM, CRAM and other similar files.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-file

---

**Recommended Action**

* Name: Recommended Action
* Definition: The extension points to a proposed action that is recommended on the basis of the findings of the report.
* url: https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme

---

**Genomics Risk Assessment**

* Name: Genomics Risk Assessment
* Definition: RiskAssessment as part of a genomic report or observation.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-risk-assessment

---

**Coded Note**

* Name: Coded Note
* Definition: Comments on the report that also carry a coded type.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report-note

---

**Supporting Info**

* Name: Supporting Info
* Definition: Further information that could be relevant for this observation.
* url: http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo

---

| FHIR element | Logical data set |
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


<!-- The Simplifier example directive that used to render beneath this caption was dropped: the IG Publisher renders each example on its own page. The examples this page referenced are linked in the "Examples" section at the end. -->
**Examples**

Report 1 BRAF

  
---

Report 2 NIPBL

  
---

The EBM codes to be billed in Report 2 are recorded separately in ChargeItem resources.

 
---

Report 3 Risk-Panel

 
---
