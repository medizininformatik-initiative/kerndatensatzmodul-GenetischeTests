<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-familienanamnese-intro.md - reviewed at Gate C -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Familienanamnese/Familienanamnese---FamilyMemberHistory.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Description

Details of the medical history of related family members.

<!-- TODO:REVIEW the column alias "Basis" in the following query block is still German; it is left unchanged because the rule is not to modify code blocks. Decide at Gate C whether query blocks should be localised. -->

---

#### Profile

---

#### Extensions

This profile uses three specific extensions for detailed information about kinship:

- **Verwandtschaftsgrad** (degree of relationship): degree of kinship (first-degree, second-degree)
- **Verwandtschaftsverhältnis** (relationship type): specific relationship (natural child, adopted)
- **Familiäre Linie** (family line): maternal or paternal line

<!-- TODO:REVIEW the German page names the target extensions.html#extensions-der-familienanamnese as bare text rather than as a markdown link; reproduced unchanged. -->
Detailed documentation and profiles of the extensions can be found on the extensions.html#extensions-der-familienanamnese page.

---

| FHIR element | Logical data set |
|---|---|
| FamilyMemberHistory | Anforderung.Indikation.Krankengeschichte Familie |

--- 

**Search parameters**

<!-- TODO:REVIEW the German page names the "Modul Pathologie-Befund" (pathology report module) here, although this is the genetic testing module; translated literally, presumed copy/paste error in the source. -->
The following search parameters are relevant for the Pathologie-Befund (pathology report) module, also in combination:

1. The search parameter ```_id``` MUST be supported:

    Examples: 

    ```GET [base]/FamilyMemberHistory?_id=1234```

    Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. The search parameter "_profile" MUST be supported:

    Examples:
    
    ```GET [base]/FamilyMemberHistory?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese```

    Usage notes: Further information on searching by "_profile" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. The search parameter "code" MUST be supported:

    Examples:

    ```GET [base]/FamilyMemberHistory?code=http://snomed.info/sct|830150003```

    Usage notes: Further information on searching by "code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

4. The search parameter "date" MUST be supported:

    Examples:

    ```GET [base]/FamilyMemberHistory?date=2022-04-07```

    Usage notes: Further information on searching by "date" can be found in the [FHIR base specification - section "date"](http://hl7.org/fhir/R4/search.html#date).

<!-- TODO:REVIEW the German page numbers this item "4" a second time, so the list runs 1,2,3,4,4,5,...; the numbering is reproduced verbatim. -->
4. The search parameter "patient" MUST be supported:

    Examples:

    ```GET [base]/FamilyMemberHistory?patient=Patient/example-mii-molgen-patient-2```

    Usage notes: Further information on searching by "patient" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. The search parameter "relationship" MUST be supported:

    Examples:

    ```GET [base]/FamilyMemberHistory?relationship=http://snomed.info/sct|72705000```

    Usage notes: Further information on searching by "relationship" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

6. The search parameter "sex" MUST be supported:

    Examples:

    ```GET [base]/FamilyMemberHistory?sex=http://hl7.org/fhir/administrative-gender|female```

    Usage notes: Further information on searching by "sex" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

7. The search parameter "status" MUST be supported:

    Examples:

    ```GET [base]/FamilyMemberHistory?status=completed```

    Usage notes: Further information on searching by "status" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

8. The search parameter "reason-code" MUST be supported:

    Examples:

    ```GET [base]/FamilyMemberHistory?reason-code=http://snomed.info/sct|447886005```

    Usage notes: Further information on searching by "reason-code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

9. The search parameter "reason-reference" MUST be supported:

    Examples:

    ```GET [base]/FamilyMemberHistory?reason-reference=Observation/12345```

    Usage notes: Further information on searching by "reason-reference" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

---

**Examples**

 

---

  

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-family-member-history-1`](FamilyMemberHistory-mii-exa-molgen-family-member-history-1.html) — **Examples**
- [`mii-exa-molgen-family-member-history-2`](FamilyMemberHistory-mii-exa-molgen-family-member-history-2.html)
