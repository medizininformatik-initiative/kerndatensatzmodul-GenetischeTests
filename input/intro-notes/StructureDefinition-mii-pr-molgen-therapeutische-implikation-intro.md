<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-therapeutische-implikation-intro.md - reviewed at Gate C -->
<!-- Migrated from the Simplifier guide TechnischeImplementierung/GenetischeImplikationen/TherapeutischeImplikation-Observation.page.md
     (source tree implementation-guides/ImplementationGuide-2026.x-DE, commit 79eaf41, migration 2026-08-28).
     Simplifier directives are resolved according to references/fql-crosswalk.md. -->

---

#### Description

The profile describes the possible influence of genetic characteristics on a drug-based or non-drug-based therapy.

<!-- TODO:REVIEW unresolved FQL metadata block below (url/status/version). references/fql-crosswalk.md says to drop such a block, because the publisher generates that header itself. Carried over verbatim because this task translates only; the same block stands in the German file. The select labels stay German ("Basis") since they sit inside a code block. -->

---

The profile is derived from the profile [Therapeutic Implication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-therapeutic-implication.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profile

---

| FHIR element | Logical data set |
|---|---|
| Observation | Interpretation.Empfehlungen |
| Observation.component:evidence-level | Interpretation.Clinical Annotation Level Of Evidence |
| Observation.component:conclusion-string | Interpretation.Zusammenfassung | 
| Observation.component:medication-assessed | Interpretation.Therapieempfehlung - Medikamentenbewertung |
| Observation.subject |  Probeninformationen.Patient |
| Observation.performer |  Probeninformationen.Weiteress.Labor / Institution/ Ansprechpartner |

---

**Search parameters**

<!-- TODO:REVIEW the German source names the "Modul Pathologie-Befund" (pathology report module) here, although this is the molecular genetics module - this looks like a copy-paste error in the source. Translated literally. -->
The following search parameters are relevant for the Pathologie-Befund (pathology report) module, also in combination:

1. The search parameter ```_id``` MUST be supported:

    Examples: 

    ```GET [base]/Observation?_id=example-mii-molgen-variante-1```

    Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. The search parameter "_profile" MUST be supported:

    Examples:
    
    ```GET [base]/Observation?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante```

    Usage notes: Further information on searching by "_profile" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. The search parameter "code" MUST be supported:

    Examples:

    ```GET [base]/Observation?code=http://loinc.org|69548-6```

    Usage notes: Further information on searching by "code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

4. The search parameter "subject" MUST be supported:

    Examples:

    ```GET [base]/Observation?subject=Patient/example-mii-molgen-patient```

    Usage notes: Further information on searching by "subject" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. The search parameter "category" MUST be supported:

    Examples:

    ```GET [base]/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory```

    Usage notes: Further information on searching by "category" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

6. The search parameter "encounter" MUST be supported:

    Examples:

    ```GET [base]/Observation?encounter=Encounter/12345```

    Usage notes: Further information on searching by "encounter" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

7. The search parameter "code-value-concept" MUST be supported:

    Examples:

    ```GET [base]/Observation?code-value-concept=http://loinc.org|69548-6$http://loinc.org|LA9633-4```
    
    Usage notes: Further information on searching by "code-value-concept" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).

8. The search parameter "code-value-quantity" MUST be supported:

    Examples:

    ```GET [base]/Observation?code-value-quantity=http://loinc.org|82155-3$6http://unitsofmeasure.org|1```
    
    Usage notes: Further information on searching by "code-value-quantity" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).

9. The search parameter "component-code" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-code=http://loinc.org|48018-6```
    
    Usage notes: Further information on searching by "component-code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

10. The search parameter "component-code-value-concept" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-code-value-concept=http://loinc.org|48018-6$http://www.genenames.org/geneId|HGNC:1097```
    
    Usage notes: Further information on searching by "component-code-value-concept" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).

11. The search parameter "component-code-value-quantity" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-code-value-quantity=http://loinc.org|81258-6$ap30%|http://unitsofmeasure.org|%25```
    
    Usage notes: Further information on searching by "component-code-value-quantity" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).

12. The search parameter "component-value-concept" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-value-concept=http://sequenceontology.org|SO:SO:1000008```
    
    Usage notes: Further information on searching by "component-code-value-concept" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

13. The search parameter "component-value-quantity" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-value-quantity=ap30%|http://unitsofmeasure.org|%25```
    
    Usage notes: Further information on searching by "component-value-quantity" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).

14. The search parameter "date" MUST be supported:

    Examples:

    ```GET [base]/Observation?date=2022-07-13```
    
    Usage notes: Further information on searching by "date" can be found in the [FHIR base specification - section "date"](http://hl7.org/fhir/R4/search.html#date).

15. The search parameter "derived-from" MUST be supported:

    Examples:

    ```GET [base]/Observation?derived-from=Observation/example-mii-molgen-variante-1```
    
    Usage notes: Further information on searching by "derived-from" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

16. The search parameter "device" MUST be supported:

    Examples:

    ```GET [base]/Observation?device=Device/example-mii-molgen-device-sequencer```
    
    Usage notes: Further information on searching by "device" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

17. The search parameter "specimen" MUST be supported:

    Examples:

    ```GET [base]/Observation?specimen=Specimen/example-mii-molgen-specimen```
    
    Usage notes: Further information on searching by "specimen" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

18. The search parameter "encounter" MUST be supported:

    Examples:

    ```GET [base]/Observation?encounter=Encounter/12345```

    Usage notes: Further information on searching by "encounter" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

19. The search parameter "method" MUST be supported:
    
    Examples:

    ```GET [base]/Observation?method=http://loinc.org|LA26398-0```

    Usage notes: Further information on searching by "method" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

20. The search parameter "patient" MUST be supported:
    
    Examples:

    ```GET [base]/Observation?patient=Patient/example-mii-molgen-patient-2```

    Usage notes: Further information on searching by "patient" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

21. The search parameter "performer" MUST be supported:
    
    Examples:

    ```GET [base]/Observation?performer=Practioner/example-mii-molgen-practitioner-laboratory```

    Usage notes: Further information on searching by "performer" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

22. The search parameter "status" MUST be supported:
    
    Examples:

    ```GET [base]/Observation?status=final```

    Usage notes: Further information on searching by "status" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

---

<!-- TODO:REVIEW the German source carries an example caption with no example rendered beneath it - the Simplifier example directive was dropped during migration. The caption is translated as it stands; nothing was added. -->
**Examples**

Example 1: Therapeutic implication BRAF variant
  

---
