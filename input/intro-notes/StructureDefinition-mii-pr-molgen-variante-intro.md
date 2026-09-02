<!-- TODO:REVIEW machine translation of input/translations/de/intro-notes/StructureDefinition-mii-pr-molgen-variante-intro.md - reviewed at Gate C -->
<!-- Migrated from the Simplifier guide TechnischeImplementierung/GenetischeBefunde/Variante-Observation.page.md
     (source tree implementation-guides/ImplementationGuide-2026.x-DE, commit 79eaf41, migration 2026-08-28).
     Simplifier directives are resolved according to references/fql-crosswalk.md. -->

---

#### Description

This profile allows a complete description of the variant found, using properties from a wide range of testing methods.

* As the nomenclature for Observation.component:cytogenetic-location.valueCodeableConcept, the CodeSystem Cytogenetic (chromosome) location (NCBI/NLM) can be used, for which no canonical URL exists so far, but an OID `urn:oid:2.16.840.1.113883.6.335` from the HL7 Version 2.5.1 Implementation Guide: Laboratory Results Interface.

* The description of complex variants, e.g. the representation of 'Compound Heterozygous', is done via two Variant instances, as described 
[here](http://hl7.org/fhir/uv/genomics-reporting/sequencing.html#representing-compound-heterozygotes)

#### Recommendation on reference sequences

For the unambiguous and interoperable representation of variants using HGVS nomenclature, the use of **MANE (Matched Annotation from NCBI and EMBL-EBI)** transcripts is recommended:

* **MANE Select**: The preferred transcript for each gene - represents the biologically most relevant isoform
* **MANE Plus Clinical**: Additional clinically relevant transcripts, where required for variant interpretation
* **Versioning**: Reference sequences should always be stated with a version number (e.g. `NM_007294.4`, not `NM_007294`)

The use of standardised MANE transcripts offers the following advantages:
- Unambiguous assignment of variants between different laboratories and systems
- Reduction of differences in interpretation through uniform references
- Improved compatibility with international databases (ClinVar, gnomAD)
- Support for cross-site data integration in the MII/NUM context

Example of the correct entry in `component[representative-transcript-ref-seq]`:
```
* component[representative-transcript-ref-seq].valueCodeableConcept.coding.system = "http://www.ncbi.nlm.nih.gov/refseq"
* component[representative-transcript-ref-seq].valueCodeableConcept.coding.code = "NM_007294.4"
* component[representative-transcript-ref-seq].valueCodeableConcept.coding.display = "BRCA1 transcript variant 1, MANE Select"
```

Further information on MANE: https://www.ncbi.nlm.nih.gov/refseq/MANE/

<!-- TODO:REVIEW unresolved FQL metadata block below (url/status/version). references/fql-crosswalk.md says to drop such a block, because the publisher generates that header itself. Carried over verbatim because this task translates only; the same block stands in the German file. The select labels stay German ("Basis") since they sit inside a code block. -->

---

The profile is derived from the profile [Variant](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-variant.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

#### Profile

---
| FHIR element | Logical data set |
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


<!-- The Simplifier example directive that used to render beneath this caption was dropped: the IG Publisher renders each example on its own page. The examples this page referenced are linked in the "Examples" section at the end. -->
**Examples**

Example 1: Variant BRAF

---

Example of the Device referenced in the previous example

---

Example 2: Variant NIPBL

---

Example of the Device referenced in the previous Example 2

---

Example 3: Copy number variant in the SMO gene

---

Example 4: Variant BRCA1

---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Examples

> **Written by the migration, not carried from the source.** The Simplifier guide
> rendered these examples inline on this page; the IG Publisher renders each one on
> its own page instead, so they are listed here as links, in the order the source had
> them and with the captions it gave them. Nothing was added or dropped.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-variante-1`](Observation-mii-exa-molgen-variante-1.html) — Example 1: Variant BRAF
- [`mii-exa-molgen-device-sequencer`](Device-mii-exa-molgen-device-sequencer.html) — Example of the Device referenced in the example above
- [`mii-exa-molgen-variante-2`](Observation-mii-exa-molgen-variante-2.html) — Example 2: Variant NIPBL
- [`mii-exa-molgen-device-sequencer-2`](Device-mii-exa-molgen-device-sequencer-2.html) — Example of the Device referenced in example 2 above
- [`mii-exa-molgen-variante-cnv-4`](Observation-mii-exa-molgen-variante-cnv-4.html) — Example 3: Copy number variant in the SMO gene
- [`mii-exa-molgen-variante-brca1`](Observation-mii-exa-molgen-variante-brca1.html) — Example 4: Variant BRCA1
