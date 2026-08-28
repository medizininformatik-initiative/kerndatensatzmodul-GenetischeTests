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

**Search parameters**

<!-- TODO:REVIEW the German page names the "Modul Pathologie-Befund" (pathology report module) here, although this is the molecular genetics module - this looks like a copy-paste error in the source. Translated literally. -->
The following search parameters are relevant for the Pathologie-Befund (pathology report) module, also in combination:

1. The search parameter ```_id``` MUST be supported:

    Examples: 

    ```GET [base]/DiagnosticReport?_id=example-mii-molgen-molekulargenetischer-befundbericht-1```

    Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. The search parameter "_profile" MUST be supported:

    Examples:
    
    ```GET [base]/DiagnosticReport?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht```

    Usage notes: Further information on searching by "_profile" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. The search parameter "code" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?code=http://loinc.org|51969-4```

    Usage notes: Further information on searching by "code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

4. The search parameter "subject" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?subject=Patient/example-mii-molgen-patient```

    Usage notes: Further information on searching by "subject" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. The search parameter "category" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?category=http://terminology.hl7.org/CodeSystem/v2-0074|GE```

    Usage notes: Further information on searching by "category" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

6. The search parameter "encounter" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?encounter=Encounter/12345```

    Usage notes: Further information on searching by "encounter" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

7. The search parameter "date" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?date=2022-07-13```

    Usage notes: Further information on searching by "date" can be found in the [FHIR base specification - section "date"](http://hl7.org/fhir/R4/search.html#date).

8. The search parameter "issued" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?issued=2022-07-13```

    Usage notes: Further information on searching by "issued" can be found in the [FHIR base specification - section "date"](http://hl7.org/fhir/R4/search.html#date).

9. The search parameter "performer" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?performer=Practioner/example-mii-molgen-practitioner-laboratory```

    Usage notes: Further information on searching by "performer" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

10. The search parameter "requestor" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?requestor=Practioner/example-mii-molgen-practitioner-physician```

    Usage notes: Further information on searching by "requestor" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

11. The search parameter "specimen" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?specimen=Specimen/example-mii-molgen-specimen```

    Usage notes: Further information on searching by "specimen" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

12. The search parameter "status" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?status=final```

    Usage notes: Further information on searching by "status" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

13. The search parameter "result" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?result=Observation/example-mii-molgen-variante-1```

    Usage notes: Further information on searching by "result" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

14. The search parameter "media" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?media=Media/12345```

    Usage notes: Further information on searching by "media" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

15. The search parameter "conclusion" MUST be supported:

    Examples:

    ```GET [base]/DiagnosticReport?conclusion=http://snomed.info/sct|830150003```

    Usage notes: Further information on searching by "conclusion" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

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
