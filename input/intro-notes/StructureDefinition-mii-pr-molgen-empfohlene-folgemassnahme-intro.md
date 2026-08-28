<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme-intro.md - reviewed at Gate C -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Therapieempfehlungen/EmpfohleneFolgemanahme-Task.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Description

The profile of this Task resource describes the recommended follow-up measures.

<!-- TODO:REVIEW the column alias "Basis" in the following query block is still German; it is left unchanged because the rule is not to modify code blocks. Decide at Gate C whether query blocks should be localised. -->
@```
from 
    StructureDefinition 
where 
    url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme' 
select 
    Name: name, Status: status, Version: version, Canonical: url, Basis: baseDefinition
```

---

The profile is derived from the profile [Followup Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-followup-recommendation.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profile

---

| FHIR element | Logical data set |
|---|---|
| Task.code | Weiteres.Beratung |
| Task.code | Interpretation.Empfehlungen |
| Task.for | Probeninformationen.Patient |

---

**Search parameters**

<!-- TODO:REVIEW the German source names the "Modul Pathologie-Befund" (pathology report module) here, although this is the genetic testing module; translated literally, presumed copy/paste error in the source. -->
The following search parameters are relevant for the Pathologie-Befund (pathology report) module, also in combination:

1. The search parameter ```_id``` MUST be supported:

    Examples: 

    ```GET [base]/Task?_id=1234```

    Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

<!-- TODO:REVIEW the _profile example in the German source points at the canonical of the Medikationsempfehlung profile, not at empfohlene-folgemassnahme; the URL is reproduced unchanged as an identifier. -->
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

<!-- TODO:REVIEW the German source skips number 8: the list jumps from 7 to 9. The numbering is reproduced verbatim. -->
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

Example of a recommended follow-up measure from a BRAF finding

---

Example of a recommended follow-up measure from a risk panel finding

---
