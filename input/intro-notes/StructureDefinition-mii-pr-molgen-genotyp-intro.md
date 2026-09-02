<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-genotyp-intro.md - reviewed at Gate C -->
<!-- Migrated from the Simplifier guide TechnischeImplementierung/GenetischeBefunde/Genotyp---Observation.page.md
     (source tree implementation-guides/ImplementationGuide-2026.x-DE, commit 79eaf41, migration 2026-08-28).
     Simplifier directives are resolved according to references/fql-crosswalk.md. -->

---

#### Description

This profile describes the determination of a particular genotype on the basis of one or more variants or haplotypes.

As the nomenclature for Observation.component:cytogenetic-location.valueCodeableConcept, the CodeSystem Cytogenetic (chromosome) location (NCBI/NLM) can be used, for which no canonical URL exists so far, but an OID `urn:oid:2.16.840.1.113883.6.335` from the HL7 Version 2.5.1 Implementation Guide: Laboratory Results Interface.

<!-- TODO:REVIEW unresolved FQL metadata block below (url/status/version). references/fql-crosswalk.md says to drop such a block, because the publisher generates that header itself. Carried over verbatim because this task translates only; the same block stands in the German file. The select labels stay German ("Basis") since they sit inside a code block. -->

---

The profile is derived from the profile [Genotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genotype.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profile

---
| FHIR element | Logical data set |
|---|---|
| Observation.component:gene-studied | Methoden.Getestete Gene |
| Observation.component:CytogenicLocation | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung |
| Observation.component:RefSequenceAssembly | Ergebnisse.Veränderungen.Referenzgenom |
| Observation.device | Methoden.Geräte / Software / Kits |
| Observation.method | Methoden.Methode | 
| Observation.performer | Weiteres.Labor / Institution/ Ansprechpartner |

---

<!-- The Simplifier example directive that used to render beneath this caption was dropped: the IG Publisher renders each example on its own page. The examples this page referenced are linked in the "Examples" section at the end. -->
**Examples**

Example 1: BRAF
 

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-genotyp-1`](Observation-mii-exa-molgen-genotyp-1.html) — Example 1: BRAF
