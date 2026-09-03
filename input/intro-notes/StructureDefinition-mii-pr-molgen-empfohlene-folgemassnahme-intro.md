<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme-intro.md - reviewed at Gate C -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Therapieempfehlungen/EmpfohleneFolgemanahme-Task.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Description

The profile of this Task resource describes the recommended follow-up measures.

<!-- TODO:REVIEW the column alias "Basis" in the following query block is still German; it is left unchanged because the rule is not to modify code blocks. Decide at Gate C whether query blocks should be localised. -->

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


**Examples**

Example of a recommended follow-up measure from a BRAF finding

---

Example of a recommended follow-up measure from a risk panel finding

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-folgemassnahme-1`](Task-mii-exa-molgen-folgemassnahme-1.html) — Example empfohlene Folgemaßnahme aus BRAF Befund
- [`mii-exa-molgen-folgemassnahme-brca1`](Task-mii-exa-molgen-folgemassnahme-brca1.html) — Example empfohlene Folgemaßnahme aus Risk-Panel Befund
