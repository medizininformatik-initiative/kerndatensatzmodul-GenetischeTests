<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-molekulare-konsequenz-intro.md - reviewed at Gate C -->
<!-- Migrated from the Simplifier guide TechnischeImplementierung/GenetischeImplikationen/MolekulareKonsequenz-Observation.page.md
     (source tree implementation-guides/ImplementationGuide-2026.x-DE, commit 79eaf41, migration 2026-08-28).
     Simplifier directives are resolved according to references/fql-crosswalk.md. -->

---

#### Description

This profile describes the molecular consequences of genetic variants. It is a new profile in STU3 that enables the downstream description of genetic changes and that was split out of the Variante profile.

The MolekulareKonsequenz profile focuses on the functional effects of variants, whereas the Variante profile concentrates on the description of the variant itself.

<!-- TODO:REVIEW unresolved FQL metadata block below (url/status/version). references/fql-crosswalk.md says to drop such a block, because the publisher generates that header itself. Carried over verbatim because this task translates only; the same block stands in the German file. The select labels stay German ("Basis") since they sit inside a code block. -->

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


<!-- The Simplifier example directive that used to render beneath this caption was dropped: the IG Publisher renders each example on its own page. The examples this page referenced are linked in the "Examples" section at the end. -->
**Examples**

Example 1: MolekulareKonsequenz for the BRAF variant

---

Example 2: MolekulareKonsequenz for the NIPBL variant

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-molekulare-konsequenz-1`](Observation-mii-exa-molgen-molekulare-konsequenz-1.html) — Example 1: MolekulareKonsequenz für BRAF-Variant
- [`mii-exa-molgen-molekulare-konsequenz-2`](Observation-mii-exa-molgen-molekulare-konsequenz-2.html) — Example 2: MolekulareKonsequenz für NIPBL-Variant
