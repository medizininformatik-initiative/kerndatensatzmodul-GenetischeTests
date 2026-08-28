<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-genomic-study-analysis-intro.md - reviewed at Gate C -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Methodik/GenomicStudyAnalysis-Procedure.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Description

This profile describes a Genomic Study Analysis as a Procedure resource for the detailed documentation of the analysis steps within a genomic investigation. It works in conjunction with the GenomicStudy profile and follows the requirements of Clinical Genomics Reporting STU3.

GenomicStudyAnalysis records specific analysis parameters such as the genome regions investigated, the reference assemblies used and the analysis tools.

<!-- TODO:REVIEW the column alias "Basis" in the following query block is still German; it is left unchanged because the rule is not to modify code blocks. Decide at Gate C whether query blocks should be localised. -->

---

The profile is derived from the profile [GenomicStudyAnalysis](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html) of the [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profile

---

#### Must Support elements

| FHIR element | Meaning | Logical data set |
|---|---|---|
| Procedure.extension:specimen | Reference to the specimen used | Probeninformation.Probe |
| Procedure.extension:device | Analysis device used (sequencer, software) | Methoden.Geräte / Software |
| Procedure.extension:method-type | Type of analysis method (e.g. sequencing, PCR) | Methoden.Analysetyp |
| Procedure.extension:change-type | Types of variation investigated (SNV, CNV, etc.) | Methoden.Variationstypen |
| Procedure.extension:regions | Genomic regions investigated (genes, exons) | Methoden.Untersuchte Regionen |
| Procedure.extension:genome-build | Version of the reference genome (e.g. GRCh38) | Methoden.Referenzgenom |
| Procedure.extension:focus | Focus/target of the analysis | Methoden.Analysefokus |
| Procedure.extension:title | Designation of the analysis | Methoden.Analysebezeichnung |
| Procedure.extension:metrics | Quality metrics (coverage, depth) | Methoden.Qualitätsmetriken |

---

**Search parameters**

The following search parameters are relevant for the GenomicStudyAnalysis profile, also in combination:

1. The search parameter ```_id``` MUST be supported:

    Examples: 

    ```GET [base]/Procedure?_id=example-mii-molgen-genomic-study-analysis-1```

    Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. The search parameter "_profile" MUST be supported:

    Examples:
    
    ```GET [base]/Procedure?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis```

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

    ```GET [base]/Procedure?code=http://loinc.org|LA26419-4```

    Usage notes: Further information on searching by "code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

--- 

**Examples**

Example 1: GenomicStudyAnalysis for exome sequencing

---
