<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-medikationsempfehlung-intro.md - reviewed at Gate C -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Therapieempfehlungen/Medikationsempfehlung-Task.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Description

<!-- TODO:REVIEW the German page has a typo here ("medikamanetöse" instead of "medikamentöse"); translated as intended, i.e. "medication-based". -->
The profile of this Task resource serves to propose medication-based measures on the basis of the genetic results.

<!-- TODO:REVIEW the column alias "Basis" in the following query block is still German; it is left unchanged because the rule is not to modify code blocks. Decide at Gate C whether query blocks should be localised. -->

---

The profile is derived from the profile [Medication Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-medication-recommendation.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profile

---

| FHIR element | Logical data set |
|---|---|
| Task | Interpretation.Empfehlungen |

--- 

**Search parameters**

<!-- TODO:REVIEW the German page names the "Modul Pathologie-Befund" (pathology report module) here, although this is the genetic testing module; translated literally, presumed copy/paste error in the source. -->
The following search parameters are relevant for the Pathologie-Befund (pathology report) module, also in combination:

1. The search parameter ```_id``` MUST be supported:

    Examples: 

    ```GET [base]/Task?_id=1234```

    Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. The search parameter "_profile" MUST be supported:

    Examples:
    
    ```GET [base]/Task?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung```

    Usage notes: Further information on searching by "_profile" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. The search parameter "code" MUST be supported:

    Examples:

    ```GET [base]/Task?code=http://loinc.org|LA26421-0```

    Usage notes: Further information on searching by "code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

4. The search parameter "based-on" MUST be supported:

    Examples:

    ```GET [base]/Task?based-on=ServiceRequest/12345```

    Usage notes: Further information on searching by "based-on" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. The search parameter "subject" MUST be supported:

    Examples:

    ```GET [base]/Task?subject=Patient/example-mii-molgen-patient```

    Usage notes: Further information on searching by "subject" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

6. The search parameter "requestor" MUST be supported:

    Examples:

    ```GET [base]/Task?requestor=Practioner/example-mii-molgen-practitioner-physician```

    Usage notes: Further information on searching by "requestor" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

7. The search parameter "reason-code" MUST be supported:

    Examples:

    ```GET [base]/Task?reason-code=http://snomed.info/sct|447886005```

    Usage notes: Further information on searching by "reason-code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

<!-- TODO:REVIEW the German page skips number 8: the list jumps from 7 to 9. The numbering is reproduced verbatim. -->
9. The search parameter "reason-reference" MUST be supported:

    Examples:

    ```GET [base]/Task?reason-reference=Observation/12345```

    Usage notes: Further information on searching by "reason-reference" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

10. The search parameter "encounter" MUST be supported:

    Examples:

    ```GET [base]/Task?encounter=Encounter/12345```

    Usage notes: Further information on searching by "encounter" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

---

**Examples**

Example 1: Medication recommendation based on a detected BRAF variant

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-medikationsempfehlung-1`](Task-mii-exa-molgen-medikationsempfehlung-1.html) — Example 1: Medikationsempfehlung basierend auf detektierter BRAF Variant
