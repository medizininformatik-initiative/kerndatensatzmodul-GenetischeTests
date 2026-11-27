<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Therapieempfehlungen/Medikationsempfehlung-Task.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Das Profil dieser Task Ressource dient dazu, auf der Grundlage der genetischen Ergebnisse medikamanetöse Maßnahmen vorzuschlagen.

---

Das Profil ist abgeleitet vom Profil [Medication Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-medication-recommendation.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profil

---

| FHIR-Element | Logischer Datensatz |
|---|---|
| Task | Interpretation.Empfehlungen |

--- 


**Examples**

Beispiel 1: Medikationsempfehlung basierend auf detektierter BRAF Variante

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der
> Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG
> Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als
> Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde
> nichts ergänzt und nichts weggelassen.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-medikationsempfehlung-1`](Task-mii-exa-molgen-medikationsempfehlung-1.html) — Beispiel 1: Medikationsempfehlung basierend auf detektierter BRAF Variante
