<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/GenetischeImplikationen/TherapeutischeImplikation-Observation.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Das Profil beschreibt den möglichen Einfluss genetischer Merkmale auf eine medikamentöse oder nicht-medikamentöse Therapie.

---

Das Profil ist abgeleitet vom Profil [Therapeutic Implication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-therapeutic-implication.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profil

---

| FHIR-Element | Logischer Datensatz |
|---|---|
| Observation | Interpretation.Empfehlungen |
| Observation.component:evidence-level | Interpretation.Clinical Annotation Level Of Evidence |
| Observation.component:conclusion-string | Interpretation.Zusammenfassung | 
| Observation.component:medication-assessed | Interpretation.Therapieempfehlung - Medikamentenbewertung |
| Observation.subject |  Probeninformationen.Patient |
| Observation.performer |  Probeninformationen.Weiteress.Labor / Institution/ Ansprechpartner |

--- 


**Examples**

Beispiel 1: Therapeutische Implikation BRAF Variante
  

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der
> Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG
> Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als
> Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde
> nichts ergänzt und nichts weggelassen.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-therapeutische-implikation-1`](Observation-mii-exa-molgen-therapeutische-implikation-1.html) — Beispiel 1: Therapeutische Implikation BRAF Variante
