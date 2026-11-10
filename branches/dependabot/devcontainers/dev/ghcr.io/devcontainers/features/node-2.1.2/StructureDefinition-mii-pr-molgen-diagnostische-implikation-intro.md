<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-diagnostische-implikation-intro.md - reviewed at Gate C -->
<!-- Migrated from the Simplifier guide TechnischeImplementierung/GenetischeImplikationen/DiagnostischeImplikation-Observation.page.md
     (source tree implementation-guides/ImplementationGuide-2026.x-DE, commit 79eaf41, migration 2026-08-28).
     Simplifier directives are resolved according to references/fql-crosswalk.md. -->

---

#### Description

Observation profile that states a relationship between one or more genotypes/haplotypes/variants and evidence for or against a particular disease, condition or tumour diagnosis.

<!-- TODO:REVIEW unresolved FQL metadata block below (url/status/version). references/fql-crosswalk.md says to drop such a block, because the publisher generates that header itself. Carried over verbatim because this task translates only; the same block stands in the German file. The select labels stay German ("Basis") since they sit inside a code block. -->

---

The profile is derived from the profile [Diagnostic Implication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profile

---

| FHIR element | Logical data set |
|---|---|
| Observation.component:predicted-phenotype | Interpretation.Assoziierter Phänotyp |
| Observation.component:evidence-level | Interpretation.Clinical Annotation Level Of Evidence |
| Observation.component:mode-of-inheritance | Interpretation.Vererbungsmodus |
| Observation.component:conclusion-string | Interpretation.Zusammenfassung |
| Observation.component:clinical-significance | Interpretation.Klinische Signifikanz |
| Observation.extension:relatedArtifact | Interpretation.Referenzen | 

---


<!-- The Simplifier example directive that used to render beneath this caption was dropped: the IG Publisher renders each example on its own page. The examples this page referenced are linked in the "Examples" section at the end. -->
**Examples**

Example 1: Diagnostic implication BRAF

  
---

Example 2: Diagnostic implication NIPBL

  
---

Example 3: Diagnostic implication CNV SMO

 
---

Example 4: Diagnostic implication from a Risk-Panel report

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-diagnostische-implikation-1`](Observation-mii-exa-molgen-diagnostische-implikation-1.html) — Example 1: Diagnostische Implikation BRAF
- [`mii-exa-molgen-diagnostische-implikation-2`](Observation-mii-exa-molgen-diagnostische-implikation-2.html) — Example 2: Diagnostische Implikation NIPBL
- [`mii-exa-molgen-diagnostische-implikation-cnv-4`](Observation-mii-exa-molgen-diagnostische-implikation-cnv-4.html) — Example 3: Diagnostische Implikation CNV SMO
- [`mii-exa-molgen-diagnostische-implikation-brca1`](Observation-mii-exa-molgen-diagnostische-implikation-brca1.html) — Example 4: Diagnostische Implikation aus Risk-Panel Befund
