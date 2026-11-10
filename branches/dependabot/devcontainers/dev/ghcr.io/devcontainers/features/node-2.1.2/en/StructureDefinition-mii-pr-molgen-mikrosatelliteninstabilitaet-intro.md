<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet-intro.md - reviewed at Gate C -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/MolekulareBiomarker/Mikrosatelliteninstabilitt-Observation.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Description

Microsatellite instability (MSI) is a condition of genetic hypermutability (predisposition to mutation) that results from impaired DNA mismatch repair (MMR).

<!-- TODO:REVIEW the column alias "Basis" in the following query block is still German; it is left unchanged because the rule is not to modify code blocks. Decide at Gate C whether query blocks should be localised. -->

---

The profile is derived from the profile [Microsatellite Instability](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-biomarker.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).
<!-- STU2 msi -> STU3 molecular-biomarker, per this module's own profile-inheritance table -->

---

#### Profile

---

| FHIR element | Logical data set |
|---|---|
| Observation.valueCodeableConcept | Ergebnisse.Mikrosatelliteninstabilität |

--- 


**Examples**

 
---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-mikrosatelliteninstabilitaet-1`](Observation-mii-exa-molgen-mikrosatelliteninstabilitaet-1.html) — **Examples**
