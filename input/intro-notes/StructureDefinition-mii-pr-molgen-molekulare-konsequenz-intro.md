<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-molekulare-konsequenz-intro.md - reviewed at Gate C -->
<!-- Migrated from the Simplifier guide TechnischeImplementierung/GenetischeImplikationen/MolekulareKonsequenz-Observation.page.md
     (source tree implementation-guides/ImplementationGuide-2026.x-DE, commit 79eaf41, migration 2026-08-28).
     Simplifier directives are resolved according to references/fql-crosswalk.md. -->

---

#### Description

This profile describes the molecular consequences of genetic variants. It is a new profile in STU3 that enables the downstream description of genetic changes and that was split out of the Variante profile.

The MolekulareKonsequenz profile focuses on the functional effects of variants, whereas the Variante profile concentrates on the description of the variant itself.

<!-- TODO:REVIEW unresolved FQL metadata block below (url/status/version). references/fql-crosswalk.md says to drop such a block, because the publisher generates that header itself. Carried over verbatim because this task translates only; the same block stands in the German file. The select labels stay German ("Basis") since they sit inside a code block. -->
@```
from 
    StructureDefinition 
where 
    url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulare-konsequenz' 
select 
    Name: name, Status: status, Version: version, Canonical: url, Basis: baseDefinition
```

---

The profile is derived from the profile [MolecularConsequence](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-consequence.html) of the [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profile

---
| FHIR element | Logical data set |
|---|---|
| Observation.code | Ergebnisse.Veränderungen.Mutationskonsequenz (funktionell) |
| Observation.subject | Probeninformation.Patient |
| Observation.derivedFrom | Referenz zur Variante |
| Observation.component:functional-effect | Ergebnisse.Veränderungen.Mutationskonsequenz (funktionell) |
| Observation.component:feature-consequence | Molekulare Auswirkungen auf Features |
| Observation.status | Weiteres.Berichtstatus |

---

**Search parameters**

The following search parameters are relevant for the MolekulareKonsequenz profile, also in combination:

1. The search parameter ```_id``` MUST be supported:

    Examples: 

    ```GET [base]/Observation?_id=example-mii-molgen-molekulare-konsequenz-1```

    Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. The search parameter "_profile" MUST be supported:

    Examples:
    
    ```GET [base]/Observation?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulare-konsequenz```

    Usage notes: Further information on searching by "_profile" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. The search parameter "subject" MUST be supported:

    Examples:

    ```GET [base]/Observation?subject=Patient/example-mii-molgen-patient```

    Usage notes: Further information on searching by "subject" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

4. The search parameter "code" MUST be supported:

    Examples:

    ```GET [base]/Observation?code=http://loinc.org|81259-4```

    Usage notes: Further information on searching by "code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

5. The search parameter "derived-from" MUST be supported:

    Examples:

    ```GET [base]/Observation?derived-from=Observation/example-mii-molgen-variante-1```

    Usage notes: Further information on searching by "derived-from" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

6. The search parameter "component-code" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-code=http://loinc.org|53037-8```

    Usage notes: Further information on searching by "component-code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

7. The search parameter "component-value-concept" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-value-concept=http://sequenceontology.org|SO:0001583```

    Usage notes: Further information on searching by "component-value-concept" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

--- 

<!-- TODO:REVIEW the German source carries example captions with no example rendered beneath them - the Simplifier example directives were dropped during migration. The captions are translated as they stand; nothing was added. -->
**Examples**

Example 1: MolekulareKonsequenz for the BRAF variant

---

Example 2: MolekulareKonsequenz for the NIPBL variant

---
