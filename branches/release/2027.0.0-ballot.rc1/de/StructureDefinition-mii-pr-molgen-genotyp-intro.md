<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/GenetischeBefunde/Genotyp---Observation.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Dieses Profil beschreibt die Feststellung eines bestimmten Genotyps auf der Grundlage einer oder mehrerer Varianten oder Haplotypen.

Als Nomenklatur für Observation.component:cytogenetic-location.valueCodeableConcept kann das CodeSystem Cytogenetic (chromosome) location (NCBI/NLM) verwendet werden für das bislang keine Canonical URl existiert, aber eine OID `urn:oid:2.16.840.1.113883.6.335` aus HL7 Version 2.5.1 Implementation Guide: Laboratory Results Interface.

---

Das Profil ist abgeleitet vom Profil [Genotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genotype.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profil

---
| FHIR-Element | Logischer Datensatz |
|---|---|
| Observation.component:gene-studied | Methoden.Getestete Gene |
| Observation.component:CytogenicLocation | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung |
| Observation.component:RefSequenceAssembly | Ergebnisse.Veränderungen.Referenzgenom |
| Observation.device | Methoden.Geräte / Software / Kits |
| Observation.method | Methoden.Methode | 
| Observation.performer | Weiteres.Labor / Institution/ Ansprechpartner |

--- 

**Examples**

Beispiel 1: BRAF
 

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der
> Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG
> Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als
> Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde
> nichts ergänzt und nichts weggelassen.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-genotyp-1`](Observation-mii-exa-molgen-genotyp-1.html) — Beispiel 1: BRAF
