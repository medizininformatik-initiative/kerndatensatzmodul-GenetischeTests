### {{page-title}}

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


@```
from StructureDefinition
where url='https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante'
select Name: name, Canonical: url
```

---

Das Profil ist abgeleitet vom Profil [Variant](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-variant.html) aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

**Diff**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante, diff}}

---
**Snapshot**

{{tree:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante, snapshot}}

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

**Suchparameter**

Folgende Suchparameter sind für das Modul Pathologie-Befund relevant, auch in Kombination:

1. Der Suchparameter ```_id``` MUSS unterstützt werden:

    Beispiele: 

    ```GET [base]/Observation?_id=example-mii-molgen-variante-1```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

2. Der Suchparameter "_profile" MUSS unterstützt werden:

    Beispiele:
    
    ```GET [base]/Observation?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

3. Der Suchparameter "code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?code=http://loinc.org|69548-6```

    Anwendungshinweise: Weitere Informationen zur Suche nach "code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

4. Der Suchparameter "subject" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?subject=Patient/example-mii-molgen-patient```

    Anwendungshinweise: Weitere Informationen zur Suche nach "subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

5. Der Suchparameter "category" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory```

    Anwendungshinweise: Weitere Informationen zur Suche nach "category" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

6. Der Suchparameter "encounter" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?encounter=Encounter/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "encounter" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

7. Der Suchparameter "code-value-concept" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?code-value-concept=http://loinc.org|69548-6$http://loinc.org|LA9633-4```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "code-value-concept" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

8. Der Suchparameter "code-value-quantity" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?code-value-quantity=http://loinc.org|82155-3$6http://unitsofmeasure.org|1```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "code-value-quantity" finden sich in der [FHIR-Basisspezifikation - Abschnitt "composite"](http://hl7.org/fhir/search.html#composite).

9. Der Suchparameter "component-code" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-code=http://loinc.org|48018-6```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "component-code" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

10. Der Suchparameter "component-code-value-concept" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-code-value-concept=http://loinc.org|48018-6$http://www.genenames.org/geneId|HGNC:1097```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "component-code-value-concept" finden sich in der [FHIR-Basisspezifikation - Abschnitt "composite"](http://hl7.org/fhir/search.html#composite).

11. Der Suchparameter "component-code-value-quantity" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-code-value-quantity=http://loinc.org|81258-6$ap30%|http://unitsofmeasure.org|%25```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "component-code-value-quantity" finden sich in der [FHIR-Basisspezifikation - Abschnitt "composite"](http://hl7.org/fhir/search.html#composite).

12. Der Suchparameter "component-value-concept" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-value-concept=http://sequenceontology.org|SO:SO:1000008```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "component-code-value-concept" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

13. Der Suchparameter "component-value-quantity" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?component-value-quantity=ap30%|http://unitsofmeasure.org|%25```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "component-value-quantity" finden sich in der [FHIR-Basisspezifikation - Abschnitt "composite"](http://hl7.org/fhir/search.html#composite).

14. Der Suchparameter "date" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?date=2022-07-13```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "date" finden sich in der [FHIR-Basisspezifikation - Abschnitt "date"](http://hl7.org/fhir/R4/search.html#date).

15. Der Suchparameter "derived-from" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?derived-from=Observation/example-mii-molgen-variante-1```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "derived-from" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

16. Der Suchparameter "device" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?device=Device/example-mii-molgen-device-sequencer```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "device" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

17. Der Suchparameter "specimen" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?specimen=Specimen/example-mii-molgen-specimen```
    
    Anwendungshinweise: Weitere Informationen zur Suche nach "specimen" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

18. Der Suchparameter "encounter" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Observation?encounter=Encounter/12345```

    Anwendungshinweise: Weitere Informationen zur Suche nach "encounter" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

19. Der Suchparameter "method" MUSS unterstützt werden:
    
    Beispiele:

    ```GET [base]/Observation?method=http://loinc.org|LA26398-0```

    Anwendungshinweise: Weitere Informationen zur Suche nach "method" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).

20. Der Suchparameter "patient" MUSS unterstützt werden:
    
    Beispiele:

    ```GET [base]/Observation?patient=Patient/example-mii-molgen-patient-2```

    Anwendungshinweise: Weitere Informationen zur Suche nach "patient" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

21. Der Suchparameter "performer" MUSS unterstützt werden:
    
    Beispiele:

    ```GET [base]/Observation?performer=Practioner/example-mii-molgen-practitioner-laboratory```

    Anwendungshinweise: Weitere Informationen zur Suche nach "performer" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference).

22. Der Suchparameter "status" MUSS unterstützt werden:
    
    Beispiele:

    ```GET [base]/Observation?status=final```

    Anwendungshinweise: Weitere Informationen zur Suche nach "status" finden sich in der [FHIR-Basisspezifikation - Abschnitt "token"](http://hl7.org/fhir/R4/search.html#token).



--- 

**Examples**

Beispiel 1: Variante BRAF

{{json:example-mii-molgen-variante-1}}

---

Beispiel für das im vorherigen Beispiel referenzierte Device

{{json:example-mii-molgen-device-sequencer}}

---

Beispiel 2: Variante NIPBL

{{json:example-mii-molgen-variante-2}}

---

Beispiel für das im vorherigen Beispiel 2 referenzierte Device

{{json:example-mii-molgen-device-sequencer-2}}

---

Beispiel 3: Copy Number Variant im SMO Gen

{{json:example-mii-molgen-variante-cnv-4}}

---

Beispiel 4: Variante BRCA1

{{json:mii-exa-molgen-variante-brca1}}

---