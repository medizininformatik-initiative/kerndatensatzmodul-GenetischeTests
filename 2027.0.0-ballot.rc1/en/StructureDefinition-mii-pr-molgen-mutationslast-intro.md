<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-mutationslast-intro.md - reviewed at Gate C -->
<!-- Migrated from the Simplifier guide TechnischeImplementierung/MolekulareBiomarker/Mutationslast-Observation.page.md
     (source tree implementation-guides/ImplementationGuide-2026.x-DE, commit 79eaf41, migration 2026-08-28).
     Simplifier directives are resolved according to references/fql-crosswalk.md. -->

---

#### Description

This profile describes the total number of mutations found in the DNA of cancer cells.

<!-- TODO:REVIEW unresolved FQL metadata block below (url/status/version). references/fql-crosswalk.md says to drop such a block, because the publisher generates that header itself. Carried over verbatim because this task translates only; the same block stands in the German file. The select labels stay German ("Basis") since they sit inside a code block. -->

---

The profile is derived from the profile [Tumor Mutation Burden](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-biomarker.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).
<!-- STU2 tmb -> STU3 molecular-biomarker, per this module's own profile-inheritance table -->

---

#### Profile

---
| FHIR element | Logical data set |
|---|---|
| Observation.valueQuantity | Ergebnisse.Mutationslast |

---


<!-- The Simplifier example directive that used to render beneath this caption was dropped: the IG Publisher renders each example on its own page. The examples this page referenced are linked in the "Examples" section at the end. -->
**Examples**

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-mutationslast-1`](Observation-mii-exa-molgen-mutationslast-1.html) — **Examples**
