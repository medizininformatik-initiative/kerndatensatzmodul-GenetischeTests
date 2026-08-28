<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-anforderung-genetischer-test-intro.md - reviewed at Gate C -->
<!-- Migrated from the Simplifier guide TechnischeImplementierung/Workflow/Anforderung-ServiceRequest.page.md
     (source tree implementation-guides/ImplementationGuide-2026.x-DE, commit 79eaf41, migration 2026-08-28).
     Simplifier directives are resolved according to references/fql-crosswalk.md. -->

---

#### Description

The laboratory order or the request that triggers the performance of the genetic test.

The request can also state one or more known symptoms via the reasonReference element as ['Phenotypic Features'](https://build.fhir.org/ig/HL7/phenomics-exchange-ig/branches/v0.1.0/StructureDefinition-PhenotypicFeature.html), which are profiled in GA4GH's Phenopackets IG.

<!-- TODO:REVIEW unresolved FQL metadata block below (url/status/version). references/fql-crosswalk.md says to drop such a block, because the publisher generates that header itself. Carried over verbatim because this task translates only; the same block stands in the German file. The select labels stay German ("Basis") since they sit inside a code block. -->

#### Profile

---

---
| FHIR element | Logical data set |
|---|---|
| ServiceRequest.reasonCode | Anforderung.Indikation.Indikation |
| ServiceRequest.supportingInfo | Anforderung.Indikation.Gesundheitszustand | 
| ServiceRequest.supportingInfo | Anforderung.Indikation.Anlageträger |
| ServiceRequest.reasonReference | Anforderung.Indikation.Relevante Vorergebnisse |
| ServiceRequest.code | Anforderung.Zu testende Gene |
| ServiceRequest.code.text | Anforderung.Anforderungstext |
| ServiceRequest.authoredOn | Anforderung.Datum der Anforderung |
| ServiceRequest.requester | Anforderung.Anforderer |
| ServiceRequest.note | Anforderung.Anforderung.Anforderungstext |
| ServiceRequest.subject |Anforderung.Probeninformationen.Patient |
| ServiceRequest.supportingInfo | Anforderung.Indikation.Krankengeschichte Familie |

---

**Search parameters**

<!-- TODO:REVIEW the German page names the "Modul Pathologie-Befund" (pathology report module) here, although this is the molecular genetics module - this looks like a copy-paste error in the source. Translated literally. -->
The following search parameters are relevant for the Pathologie-Befund (pathology report) module, also in combination:

1. The search parameter ```_id``` MUST be supported:

    Examples: 

    ```GET [base]/ServiceRequest?_id=1234```
    
    Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. The search parameter "_profile" MUST be supported:

    Examples:
    
    ```GET [base]/ServiceRequest?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test```
    
    Usage notes: Further information on searching by "_profile" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#all). 

3. The search parameter "code" MUST be supported:

    Examples:

    ```GET [base]/ServiceRequest?code=http://snomed.info/sct|405825005```
    
    Usage notes: Further information on searching by "code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

4. The search parameter "based-on" MUST be supported:

    Examples:

    ```GET [base]/ServiceRequest?based-on=ServiceRequest/12345```

    Usage notes: Further information on searching by "based-on" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. The search parameter "subject" MUST be supported:

    Examples:

    ```GET [base]/ServiceRequest?subject=Patient/example-mii-molgen-patient```

    Usage notes: Further information on searching by "subject" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

6. The search parameter "authored" MUST be supported:

    Examples:

    ```GET [base]/ServiceRequest?authored=2022-04-07```

    Usage notes: Further information on searching by "authored" can be found in the [FHIR base specification - section "date"](http://hl7.org/fhir/R4/search.html#date).

7. The search parameter "requestor" MUST be supported:

    Examples:

    ```GET [base]/ServiceRequest?requestor=Practioner/example-mii-molgen-practitioner-physician```

    Usage notes: Further information on searching by "requestor" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

8. The search parameter "reason-code" MUST be supported:

    Examples:

    ```GET [base]/ServiceRequest?reason-code=http://snomed.info/sct|447886005```

    Usage notes: Further information on searching by "reason-code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

9. The search parameter "reason-reference" MUST be supported:

    Examples:

    ```GET [base]/ServiceRequest?reason-reference=Condition/12345```

    Usage notes: Further information on searching by "reason-reference" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

---

<!-- The Simplifier example directive that used to render beneath this caption was dropped: the IG Publisher renders each example on its own page. The examples this page referenced are linked in the "Examples" section at the end. -->
**Examples**

Request 1 - BRAF

 

---

Example of the Specimen (sample) referenced in Request 1, based on the profile of the MII Biobank module.

---

Request 2 - NIPBL

 

---

Example of the Specimen (sample) referenced in Request 2, based on the profile of the MII Biobank module.

---

Example of the request for the Risk-Panel

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-anforderung-1`](ServiceRequest-mii-exa-molgen-anforderung-1.html) — Request 1 - BRAF
- [`mii-exa-molgen-specimen-1`](Specimen-mii-exa-molgen-specimen-1.html) — Example des in der Request 1 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.
- [`mii-exa-molgen-anforderung-2`](ServiceRequest-mii-exa-molgen-anforderung-2.html) — Request 2 - NIPBL
- [`mii-exa-molgen-specimen-2`](Specimen-mii-exa-molgen-specimen-2.html) — Example des in der Request 2 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.
