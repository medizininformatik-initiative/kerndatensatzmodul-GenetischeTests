<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-familienanamnese-intro.md - reviewed at Gate C -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Familienanamnese/Familienanamnese---FamilyMemberHistory.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Description

Details of the medical history of related family members.

<!-- TODO:REVIEW the column alias "Basis" in the following query block is still German; it is left unchanged because the rule is not to modify code blocks. Decide at Gate C whether query blocks should be localised. -->

---

#### Profile

---

#### Extensions

This profile uses three specific extensions for detailed information about kinship:

- **Verwandtschaftsgrad** (degree of relationship): degree of kinship (first-degree, second-degree)
- **Verwandtschaftsverhältnis** (relationship type): specific relationship (natural child, adopted)
- **Familiäre Linie** (family line): maternal or paternal line

<!-- TODO:REVIEW the German page names the target extensions.html#extensions-der-familienanamnese as bare text rather than as a markdown link; reproduced unchanged. -->
Detailed documentation and profiles of the extensions can be found on the extensions.html#extensions-der-familienanamnese page.

---

| FHIR element | Logical data set |
|---|---|
| FamilyMemberHistory | Anforderung.Indikation.Krankengeschichte Familie |

--- 


**Examples**

 
---

  
---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-family-member-history-1`](FamilyMemberHistory-mii-exa-molgen-family-member-history-1.html) — **Examples**
- [`mii-exa-molgen-family-member-history-2`](FamilyMemberHistory-mii-exa-molgen-family-member-history-2.html)
