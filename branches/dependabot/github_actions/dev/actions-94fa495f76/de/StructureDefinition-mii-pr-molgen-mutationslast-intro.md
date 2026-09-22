<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/MolekulareBiomarker/Mutationslast-Observation.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Dieses Profil beschreibt die Gesamtzahl der in der DNA von Krebszellen gefundenen Mutationen.

---

Das Profil ist abgeleitet vom Profil [Tumor Mutation Burden](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-biomarker.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).
<!-- STU2 tmb -> STU3 molecular-biomarker, per this module's own profile-inheritance table -->

---

#### Profil

---
| FHIR-Element | Logischer Datensatz |
|---|---|
| Observation.valueQuantity | Ergebnisse.Mutationslast |

--- 


**Examples**

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der
> Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG
> Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als
> Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde
> nichts ergänzt und nichts weggelassen.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-mutationslast-1`](Observation-mii-exa-molgen-mutationslast-1.html) — **Examples**
