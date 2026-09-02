<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/GenetischeImplikationen/MolekulareKonsequenz-Observation.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Dieses Profil beschreibt die molekularen Konsequenzen von genetischen Varianten. Es ist ein neues Profil in STU3, das die downstream-Beschreibung von genetischen Änderungen ermöglicht und aus dem Variante-Profil ausgegliedert wurde.

Das MolekulareKonsequenz-Profil fokussiert auf die funktionellen Auswirkungen von Varianten, während das Variante-Profil sich auf die Beschreibung der Variante selbst konzentriert.

---

Das Profil ist abgeleitet vom Profil [MolecularConsequence](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-consequence.html) aus [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profil

---
| FHIR-Element | Logischer Datensatz |
|---|---|
| Observation.code | Ergebnisse.Veränderungen.Mutationskonsequenz (funktionell) |
| Observation.subject | Probeninformation.Patient |
| Observation.derivedFrom | Referenz zur Variante |
| Observation.component:functional-effect | Ergebnisse.Veränderungen.Mutationskonsequenz (funktionell) |
| Observation.component:feature-consequence | Molekulare Auswirkungen auf Features |
| Observation.status | Weiteres.Berichtstatus |

---


**Examples**

Beispiel 1: MolekulareKonsequenz für BRAF-Variante

---

Beispiel 2: MolekulareKonsequenz für NIPBL-Variante

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der
> Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG
> Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als
> Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde
> nichts ergänzt und nichts weggelassen.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-molekulare-konsequenz-1`](Observation-mii-exa-molgen-molekulare-konsequenz-1.html) — Beispiel 1: MolekulareKonsequenz für BRAF-Variante
- [`mii-exa-molgen-molekulare-konsequenz-2`](Observation-mii-exa-molgen-molekulare-konsequenz-2.html) — Beispiel 2: MolekulareKonsequenz für NIPBL-Variante
