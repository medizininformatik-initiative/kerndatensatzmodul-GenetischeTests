<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-genomic-study-intro.md - reviewed at Gate C -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Methodik/GenomicStudy-Procedure.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Description

This profile describes a Genomic Study as a Procedure resource for documenting the genomic investigation that was carried out. It replaces the deprecated UntersuchteRegion profile and follows the requirements of Clinical Genomics Reporting STU3.

GenomicStudy is used to record the metadata about the genomic analysis carried out, including the methods used, the regions investigated and the devices involved.

<!-- TODO:REVIEW the column alias "Basis" in the following query block is still German; it is left unchanged because the rule is not to modify code blocks. Decide at Gate C whether query blocks should be localised. -->

---

The profile is derived from the profile [GenomicStudy](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study.html) of the [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profile

---

#### Must Support elements

| FHIR element | Meaning | Logical data set |
|---|---|---|
| Procedure.status | Status of the genetic study (e.g. completed, cancelled) | Weiteres.Berichtstatus |
| Procedure.code | Type of genomic investigation | Methoden.Untersuchungsart |
| Procedure.subject | Patient/subject of the investigation | Probeninformation.Patient |
| Procedure.encounter | Encounter context of the investigation | Probeninformation.Fall |
| Procedure.performed[x] | Point in time or period of performance | Methoden.Durchführungsdatum |
| Procedure.reasonReference | Request/indication for the genetic investigation | Anforderung.ServiceRequest |
| Procedure.extension:genomic-study-analysis | References to the individual GenomicStudyAnalysis resources | Methoden.Analyseschritte |

---


**Examples**

Example 1: GenomicStudy for panel sequencing

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-genomic-study-1`](Procedure-mii-exa-molgen-genomic-study-1.html) — Example 1: GenomicStudy für Panel-Sequenzierung
