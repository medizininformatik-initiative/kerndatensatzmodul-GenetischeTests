<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/GenetischeImplikationen/DiagnostischeImplikation-Observation.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Observation Profil, das einen Zusammenhang zwischen einem oder mehreren Genotyp/Haplotyp/Varianten und Beweisen für oder gegen eine bestimmte Krankheit, einen Zustand oder eine Tumordiagnose angibt.

---

Das Profil ist abgeleitet vom Profil [Diagnostic Implication](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profil

---

| FHIR-Element | Logischer Datensatz |
|---|---|
| Observation.component:predicted-phenotype | Interpretation.Assoziierter Phänotyp |
| Observation.component:evidence-level | Interpretation.Clinical Annotation Level Of Evidence |
| Observation.component:mode-of-inheritance | Interpretation.Vererbungsmodus |
| Observation.component:conclusion-string | Interpretation.Zusammenfassung |
| Observation.component:clinical-significance | Interpretation.Klinische Signifikanz |
| Observation.extension:relatedArtifact | Interpretation.Referenzen | 

--- 


**Examples**

Beispiel 1: Diagnostische Implikation BRAF

  
---

Beispiel 2: Diagnostische Implikation NIPBL

  
---

Beispiel 3: Diagnostische Implikation CNV SMO

 
---

Beispiel 4: Diagnostische Implikation aus Risk-Panel Befund

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der
> Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG
> Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als
> Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde
> nichts ergänzt und nichts weggelassen.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-diagnostische-implikation-1`](Observation-mii-exa-molgen-diagnostische-implikation-1.html) — Beispiel 1: Diagnostische Implikation BRAF
- [`mii-exa-molgen-diagnostische-implikation-2`](Observation-mii-exa-molgen-diagnostische-implikation-2.html) — Beispiel 2: Diagnostische Implikation NIPBL
- [`mii-exa-molgen-diagnostische-implikation-cnv-4`](Observation-mii-exa-molgen-diagnostische-implikation-cnv-4.html) — Beispiel 3: Diagnostische Implikation CNV SMO
- [`mii-exa-molgen-diagnostische-implikation-brca1`](Observation-mii-exa-molgen-diagnostische-implikation-brca1.html) — Beispiel 4: Diagnostische Implikation aus Risk-Panel Befund
