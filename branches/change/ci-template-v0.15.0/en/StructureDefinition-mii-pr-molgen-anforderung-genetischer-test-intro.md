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
