<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Therapieempfehlungen/EmpfohleneFolgemanahme-Task.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Das Profil dieser Task Ressource beschreibt die empfohlenen Folgemaßnahmen.

---

Das Profil ist abgeleitet vom Profil [Followup Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-followup-recommendation.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profil

---

| FHIR-Element | Logischer Datensatz |
|---|---|
| Task.code | Weiteres.Beratung |
| Task.code | Interpretation.Empfehlungen |
| Task.for | Probeninformationen.Patient |

---


**Examples**

Beispiel empfohlene Folgemaßnahme aus BRAF Befund

---

Beispiel empfohlene Folgemaßnahme aus Risk-Panel Befund

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der
> Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG
> Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als
> Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde
> nichts ergänzt und nichts weggelassen.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-folgemassnahme-1`](Task-mii-exa-molgen-folgemassnahme-1.html) — Beispiel empfohlene Folgemaßnahme aus BRAF Befund
- [`mii-exa-molgen-folgemassnahme-brca1`](Task-mii-exa-molgen-folgemassnahme-brca1.html) — Beispiel empfohlene Folgemaßnahme aus Risk-Panel Befund
