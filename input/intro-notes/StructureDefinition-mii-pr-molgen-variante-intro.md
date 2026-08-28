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

**Search parameters**

<!-- TODO:REVIEW the German source names the "Modul Pathologie-Befund" (pathology report module) here, although this is the molecular genetics module - this looks like a copy-paste error in the source. Translated literally. -->
The following search parameters are relevant for the Pathologie-Befund (pathology report) module, also in combination:

1. The search parameter ```_id``` MUST be supported:

    Examples: 

    ```GET [base]/Observation?_id=example-mii-molgen-variante-1```

    Usage notes: Further information on searching by "_id" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. The search parameter "_profile" MUST be supported:

    Examples:
    
    ```GET [base]/Observation?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante```

    Usage notes: Further information on searching by "_profile" can be found in the [FHIR base specification - section "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. The search parameter "code" MUST be supported:

    Examples:

    ```GET [base]/Observation?code=http://loinc.org|69548-6```

    Usage notes: Further information on searching by "code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

4. The search parameter "subject" MUST be supported:

    Examples:

    ```GET [base]/Observation?subject=Patient/example-mii-molgen-patient```

    Usage notes: Further information on searching by "subject" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. The search parameter "category" MUST be supported:

    Examples:

    ```GET [base]/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory```

    Usage notes: Further information on searching by "category" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

6. The search parameter "encounter" MUST be supported:

    Examples:

    ```GET [base]/Observation?encounter=Encounter/12345```

    Usage notes: Further information on searching by "encounter" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

7. The search parameter "code-value-concept" MUST be supported:

    Examples:

    ```GET [base]/Observation?code-value-concept=http://loinc.org|69548-6$http://loinc.org|LA9633-4```
    
    Usage notes: Further information on searching by "code-value-concept" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

8. The search parameter "code-value-quantity" MUST be supported:

    Examples:

    ```GET [base]/Observation?code-value-quantity=http://loinc.org|82155-3$6http://unitsofmeasure.org|1```
    
    Usage notes: Further information on searching by "code-value-quantity" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).

9. The search parameter "component-code" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-code=http://loinc.org|48018-6```
    
    Usage notes: Further information on searching by "component-code" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

10. The search parameter "component-code-value-concept" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-code-value-concept=http://loinc.org|48018-6$http://www.genenames.org/geneId|HGNC:1097```
    
    Usage notes: Further information on searching by "component-code-value-concept" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).

11. The search parameter "component-code-value-quantity" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-code-value-quantity=http://loinc.org|81258-6$ap30%|http://unitsofmeasure.org|%25```
    
    Usage notes: Further information on searching by "component-code-value-quantity" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).

12. The search parameter "component-value-concept" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-value-concept=http://sequenceontology.org|SO:SO:1000008```
    
    Usage notes: Further information on searching by "component-code-value-concept" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

13. The search parameter "component-value-quantity" MUST be supported:

    Examples:

    ```GET [base]/Observation?component-value-quantity=ap30%|http://unitsofmeasure.org|%25```
    
    Usage notes: Further information on searching by "component-value-quantity" can be found in the [FHIR base specification - section "composite"](http://hl7.org/fhir/search.html#composite).

14. The search parameter "date" MUST be supported:

    Examples:

    ```GET [base]/Observation?date=2022-07-13```
    
    Usage notes: Further information on searching by "date" can be found in the [FHIR base specification - section "date"](http://hl7.org/fhir/R4/search.html#date).

15. The search parameter "derived-from" MUST be supported:

    Examples:

    ```GET [base]/Observation?derived-from=Observation/example-mii-molgen-variante-1```
    
    Usage notes: Further information on searching by "derived-from" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

16. The search parameter "device" MUST be supported:

    Examples:

    ```GET [base]/Observation?device=Device/example-mii-molgen-device-sequencer```
    
    Usage notes: Further information on searching by "device" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

17. The search parameter "specimen" MUST be supported:

    Examples:

    ```GET [base]/Observation?specimen=Specimen/example-mii-molgen-specimen```
    
    Usage notes: Further information on searching by "specimen" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

18. The search parameter "encounter" MUST be supported:

    Examples:

    ```GET [base]/Observation?encounter=Encounter/12345```

    Usage notes: Further information on searching by "encounter" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

19. The search parameter "method" MUST be supported:
    
    Examples:

    ```GET [base]/Observation?method=http://loinc.org|LA26398-0```

    Usage notes: Further information on searching by "method" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

20. The search parameter "patient" MUST be supported:
    
    Examples:

    ```GET [base]/Observation?patient=Patient/example-mii-molgen-patient-2```

    Usage notes: Further information on searching by "patient" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

21. The search parameter "performer" MUST be supported:
    
    Examples:

    ```GET [base]/Observation?performer=Practioner/example-mii-molgen-practitioner-laboratory```

    Usage notes: Further information on searching by "performer" can be found in the [FHIR base specification - section "reference"](http://hl7.org/fhir/R4/search.html#reference).

22. The search parameter "status" MUST be supported:
    
    Examples:

    ```GET [base]/Observation?status=final```

    Usage notes: Further information on searching by "status" can be found in the [FHIR base specification - section "token"](http://hl7.org/fhir/R4/search.html#token).

--- 

<!-- TODO:REVIEW the German source carries example captions with no example rendered beneath them - the Simplifier example directives were dropped during migration. The captions are translated as they stand; nothing was added. -->
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
