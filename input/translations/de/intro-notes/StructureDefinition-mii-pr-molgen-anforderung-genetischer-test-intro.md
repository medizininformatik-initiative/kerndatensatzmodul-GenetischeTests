<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Workflow/Anforderung-ServiceRequest.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Der Laborauftrag oder die Anfrage, die die Durchführung des genetischen Tests auslöst.

In der Anforderung können auch ein oder mehrere bekannte Symptome über das reasonReference Element als ['Phenotypic Features'](https://build.fhir.org/ig/HL7/phenomics-exchange-ig/branches/v0.1.0/StructureDefinition-PhenotypicFeature.html), die in GA4GH's Phenopackets IG profiliert sind, angegeben werden.

#### Profil

---

---
| FHIR-Element | Logischer Datensatz |
|---|---|
| ServiceRequest.reasonCode | Anforderung.Indikation.Indikation |
| ServiceRequest.supportingInfo | Anforderung.Indikation.Gesundheitszustand | 
| ServiceRequest.supportingInfo | Anforderung.Indikation.Anlageträger |
| ServiceRequest.reasonReference | Anforderung.Indikation.Relevante Vorergebnisse |
| ServiceRequest.code | Anforderung.Zu testende Gene |
| ServiceRequest.code.text | Anforderung.Anforderungstext |
| ServiceRequest.authoredOn | Anforderung.Datum der Anforderung |
| ServiceRequest.requester | Anforderung.Anforderer |
| ServiceRequest.note | Anforderung.Anforderung.Anforderungstext |
| ServiceRequest.subject |Anforderung.Probeninformationen.Patient |
| ServiceRequest.supportingInfo | Anforderung.Indikation.Krankengeschichte Familie |

--- 


**Examples**

Anforderung 1 - BRAF

 
---

Beispiel des in der Anforderung 1 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.

---

Anforderung 2 - NIPBL

 
---

Beispiel des in der Anforderung 2 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.

---

Beispiel der Anforderung für das Risk-Panel

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der
> Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG
> Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als
> Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde
> nichts ergänzt und nichts weggelassen.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-anforderung-1`](ServiceRequest-mii-exa-molgen-anforderung-1.html) — Anforderung 1 - BRAF
- [`mii-exa-molgen-specimen-1`](Specimen-mii-exa-molgen-specimen-1.html) — Beispiel des in der Anforderung 1 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.
- [`mii-exa-molgen-anforderung-2`](ServiceRequest-mii-exa-molgen-anforderung-2.html) — Anforderung 2 - NIPBL
- [`mii-exa-molgen-specimen-2`](Specimen-mii-exa-molgen-specimen-2.html) — Beispiel des in der Anforderung 2 referenzierten Specimens (Probe) basierend auf dem Profil des MII Moduls Biobank.
