<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/GenetischeBefunde/Variante-Observation.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Dieses Profil ermöglicht eine vollständige Beschreibung der gefundenen Variante unter Verwendung von Eigenschaften aus einer Vielzahl von Testmethoden.

* Als Nomenklatur für Observation.component:cytogenetic-location.valueCodeableConcept kann das CodeSystem Cytogenetic (chromosome) location (NCBI/NLM) verwendet werden für das bislang keine Canonical URl existiert, aber eine OID `urn:oid:2.16.840.1.113883.6.335` aus HL7 Version 2.5.1 Implementation Guide: Laboratory Results Interface.

* Die Beschreibung komplexer Varianten, z.B. die Abbildung von 'Compound Heterozygous', erfolgt über zwei Variant Instanzen, wie 
[hier](http://hl7.org/fhir/uv/genomics-reporting/sequencing.html#representing-compound-heterozygotes) beschrieben

#### Empfehlung zu Referenzsequenzen

Für die eindeutige und interoperable Darstellung von Varianten mittels HGVS-Nomenklatur wird die Verwendung von **MANE (Matched Annotation from NCBI and EMBL-EBI)** Transkripten empfohlen:

* **MANE Select**: Das bevorzugte Transkript für jedes Gen - repräsentiert die biologisch relevanteste Isoform
* **MANE Plus Clinical**: Zusätzliche klinisch relevante Transkripte, wenn für die Varianteninterpretation erforderlich
* **Versionierung**: Referenzsequenzen sollten immer mit Versionsnummer angegeben werden (z.B. `NM_007294.4`, nicht `NM_007294`)

Die Verwendung standardisierter MANE-Transkripte bietet folgende Vorteile:
- Eindeutige Zuordnung von Varianten zwischen verschiedenen Laboren und Systemen
- Reduzierung von Interpretationsunterschieden durch einheitliche Referenzen
- Verbesserte Kompatibilität mit internationalen Datenbanken (ClinVar, gnomAD)
- Unterstützung der standortübergreifenden Datenintegration im MII/NUM-Kontext

Beispiel für die korrekte Angabe in `component[representative-transcript-ref-seq]`:
```
* component[representative-transcript-ref-seq].valueCodeableConcept.coding.system = "http://www.ncbi.nlm.nih.gov/refseq"
* component[representative-transcript-ref-seq].valueCodeableConcept.coding.code = "NM_007294.4"
* component[representative-transcript-ref-seq].valueCodeableConcept.coding.display = "BRCA1 transcript variant 1, MANE Select"
```

Weitere Informationen zu MANE: https://www.ncbi.nlm.nih.gov/refseq/MANE/

---

Das Profil ist abgeleitet vom Profil [Variant](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-variant.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profil

---
| FHIR-Element | Logischer Datensatz |
|---|---|
| Observation.method | Methoden.Methode |
| Observation.device | Methoden.Geräte / Software / Kits |
| Observation.note | Methoden.Limitierungen/Bemerkungen |
| Observation.component:gene-studied | Methoden.Getestete Gene |
| Observation.component:transcript-ref-seq | Ergebnisse.Veränderungen.Transcript-ID |
| Observation.component:coding-hgvs | Ergebnisse.Veränderungen.DNA Veränderung |
| Observation.component:protein-hgvs | Ergebnisse.Veränderungen.Veränderung auf Proteinebene |
| Observation.component:genomic-hgvs | Ergebnisse.Veränderungen.Genomische DNA Veränderung | 
| Observation.component:reference-sequence-assembly | Ergebnisse.Veränderungen.Referenzgenom |
| Observation.component:coding-change-type | Ergebnisse.Veränderungen.DNA Mutationstyp |
| Observation.component:amino-acid-change-type | Ergebnisse.Veränderungen.Mutationskonsequenz (funktionell) |
| Observation.component:sample-allelic-frequency | Ergebnisse.Veränderungen.Proben-Allelfrequenz |
| Observation.component:genomic-source-class | Ergebnisse.Veränderungen.Ursprung der Variante |
| Observation.component:cytogenetic-location | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung |
| Observation.component:copy-number | Ergebnisse.Kopienzahlvariationen |
| Observation.component:transcript-ref-seq | Methoden.Referenzsequenz |
| Observation.component:allelic-read-depth | Methoden.Read depth/Coverage |
| Observation.component:dna-region | Methoden.Intron spanning/IVS |
| Observation.component:exact-start-end | Methoden.Start- und Endnukleotid |
| Observation.derivedFrom | Ergebnisse.Daten |
| Observation.component:chromosome-identifier | Ergebnisse.Veränderungen.Chromosom |
| Observation.component:alt-allele| Ergebnisse.Veränderungen.Alt Allel |
| Observation.component:ref-allele| Ergebnisse.Veränderungen.Ref Allel |
| Observation.component:dna-region | Ergebnisse.Veränderungen.Exon |
| Observation.component.variation-code | Ergebnisse.Veränderungen.Varianten ID | 
| Observation.status | Weiteres.Berichtstatus |
| Observation.component:detection-limit | Methoden.Sensitivität/Detektionslimit |
 
---


**Examples**

Beispiel 1: Variante BRAF

---

Beispiel für das im vorherigen Beispiel referenzierte Device

---

Beispiel 2: Variante NIPBL

---

Beispiel für das im vorherigen Beispiel 2 referenzierte Device

---

Beispiel 3: Copy Number Variant im SMO Gen

---

Beispiel 4: Variante BRCA1

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der
> Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG
> Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als
> Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde
> nichts ergänzt und nichts weggelassen.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-variante-1`](Observation-mii-exa-molgen-variante-1.html) — Beispiel 1: Variante BRAF
- [`mii-exa-molgen-device-sequencer`](Device-mii-exa-molgen-device-sequencer.html) — Beispiel für das im vorherigen Beispiel referenzierte Device
- [`mii-exa-molgen-variante-2`](Observation-mii-exa-molgen-variante-2.html) — Beispiel 2: Variante NIPBL
- [`mii-exa-molgen-device-sequencer-2`](Device-mii-exa-molgen-device-sequencer-2.html) — Beispiel für das im vorherigen Beispiel 2 referenzierte Device
- [`mii-exa-molgen-variante-cnv-4`](Observation-mii-exa-molgen-variante-cnv-4.html) — Beispiel 3: Copy Number Variant im SMO Gen
- [`mii-exa-molgen-variante-brca1`](Observation-mii-exa-molgen-variante-brca1.html) — Beispiel 4: Variante BRCA1
