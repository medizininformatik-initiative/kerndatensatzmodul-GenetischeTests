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
