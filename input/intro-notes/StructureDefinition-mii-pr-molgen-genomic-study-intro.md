<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-genomic-study-intro.md - reviewed at Gate C -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Methodik/GenomicStudy-Procedure.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Description

This profile describes a Genomic Study as a Procedure resource for documenting the genomic investigation that was carried out. It replaces the deprecated UntersuchteRegion profile and follows the requirements of Clinical Genomics Reporting STU3.

GenomicStudy is used to record the metadata about the genomic analysis carried out, including the methods used, the regions investigated and the devices involved.

<!-- TODO:REVIEW the column alias "Basis" in the following query block is still German; it is left unchanged because the rule is not to modify code blocks. Decide at Gate C whether query blocks should be localised. -->

---

The profile is derived from the profile [GenomicStudy](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study.html) of the [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profile

---

#### Must Support elements

| FHIR element | Meaning | Logical data set |
|---|---|---|
| Procedure.status | Status of the genetic study (e.g. completed, cancelled) | Weiteres.Berichtstatus |
| Procedure.code | Type of genomic investigation | Methoden.Untersuchungsart |
| Procedure.subject | Patient/subject of the investigation | Probeninformation.Patient |
| Procedure.encounter | Encounter context of the investigation | Probeninformation.Fall |
| Procedure.performed[x] | Point in time or period of performance | Methoden.Durchführungsdatum |
| Procedure.reasonReference | Request/indication for the genetic investigation | Anforderung.ServiceRequest |
| Procedure.extension:genomic-study-analysis | References to the individual GenomicStudyAnalysis resources | Methoden.Analyseschritte |

---

**Search parameters**

The following search parameters are relevant for the GenomicStudy profile, also in combination:

1. The search parameter ```_id``` MUST be supported:

    Examples: 

    ```GET [base]/Procedure?_id=example-mii-molgen-genomic-study-1```

    Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. The search parameter "_profile" MUST be supported:

    Examples:
    
    ```GET [base]/Procedure?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study```

    Usage notes: Further information on searching by "_profile" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. The search parameter "subject" MUST be supported:

    Examples:

    ```GET [base]/Procedure?subject=Patient/example-mii-molgen-patient```

    Usage notes: Further information on searching by "subject" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

4. The search parameter "status" MUST be supported:

    Examples:

    ```GET [base]/Procedure?status=completed```

    Usage notes: Further information on searching by "status" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

5. The search parameter "code" MUST be supported:

    Examples:

    ```GET [base]/Procedure?code=http://loinc.org|33747-0```

    Usage notes: Further information on searching by "code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

--- 

**Examples**

Example 1: GenomicStudy for panel sequencing

---
