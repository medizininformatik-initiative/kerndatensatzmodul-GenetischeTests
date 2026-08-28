<!-- Migriert aus dem Simplifier-Leitfaden KontextimGesamtprojektBezgezuanderenModulen.page.md, Referenzen.page.md, TechnischeImplementierung/GenetischeBefunde/Haplotype-Observation.page.md, TechnischeImplementierung/GenetischeBefunde/Sequence-Phase-Relationship---Observation.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->


### Kontext im Gesamtprojekt und Bezüge zu anderen Modulen

#### Kontext im Gesamtprojekt / Bezüge zu anderen Modulen

##### Beziehung zum Modul Person ###
Die Zuordnung der Ergebnisse des Befundes zu einem/einer PatientIn, der/die in der Anforderung des Befundes spezifiert wird, sowie die Zuordnung des/der AnforderIn (GesundheitsdienstleisterIn) des Befundes und der Ansprechsperson am durchführenden Labor erfolgt über Referenzen vom Modul MOLEKULARGENETISCHER BEFUNDBERICHT zum MODUL [PERSON](https://simplifier.net/mii-basismodul-person-2024).

##### Beziehung zum Modul Bioproben ###
Das Modul MOLEKULARGENETISCHER BEFUNDBERICHT referenziert für die Erfassung der Charakteristika der zur Analyse verwendeten Probe das Modul [BIOBANK](https://simplifier.net/medizininformatikinitiative-modulbiobank) .

##### Beziehung zum Modul Fall ###
Die Anforderung der molekulargenetischen Tests erfolgt auf Grundlage der Vorstellung eines/einer PatientIn bei einem/einer GesundheitsdienstleisterIn (*encounter*) und wird referenziert über das Modul [FALL](https://simplifier.net/medizininformatikinitiative-modulfall) .

##### Beziehung zum Modul Pathologiebefund ###
Molekulargenetische Tests können auf Basis von auffälligen Ergebnissen eines vorliegenden Pathologiebefundes angefordert werden. Dieser sollte dann als supportingInfo referenziert werden über das Modul [Pathologiebefund](https://simplifier.net/medizininformatikinitiative-modulpathologie).

##### Beziehung zum Modul Onkologie ###
Das Modul nutzt die Varianten-Profil des oBDS. In den Krebsregisterdaten gibt es zwei Datenelemente (Beschreibung und Ausprägung einer Genetischen Variante), wobei die Beschreibung der Variante nicht strukturiert im HGVS-Format, sondern als Freitext erfolgt. Die Standorte haben hier die Möglichkeit, die Variante direkt aus dem oBDS zu übernehmen oder nach Möglichkeit mit weiteren lokal verfügbaren strukturierten Informationen anzureichern. Weitere Informationen finden sich im [Modul Onkologie](https://simplifier.net/medizininformatikinitiative-modulonkologie).

##### Beziehung zum Modul Molekulares Tumorboard ###
Das [KDS-Modul Molekulares Tumorboard](https://simplifier.net/mii-erweiterungsmodul-molekulares-tumorboard) nutzt dieses Modul als Grundlage für die Modellierung eines NextGenerationSequencing-Reports, insbesondere zur Darstellung der verschiedenen Varianten und molekularen Biomarker.

##### Beziehung zum Modul Seltene Erkrankungen ###
Das neue [Modul Seltene Erkrankungen](https://simplifier.net/mii-modul-seltene-erkrankungen) besitzt keine eigenständigen Profile für molekulargenetische Untersuchungen, sondern verweist bei der Darstellung von molekulargenetischen Daten auf dieses Modul, insbesondere weil die Anforderungen für Gendiagnostik seltener Erkrankungen bereits bei der Erstellung des Moduls Molekulargenetischer Befundbericht berücksichtigt wurden.


### Referenzen

##### Publikationen

**Hauptpublikation zu diesem Implementation Guide:**

Stellmach C, Sass J, Auber B, Boeker M, Wienker T, Heidel AJ, Benary M, Schumacher S, Ossowski S, Klauschen F, Möller Y, Schmutzler R, Ustjanzew A, Werner P, Tomczak A, Hölter T, Thun S. **Creation of a structured molecular genomics report for Germany as a local adaption of HL7's Genomic Reporting Implementation Guide**. *J Am Med Inform Assoc*. 2023 Apr 20;30(6):1179-1189. doi: 10.1093/jamia/ocad061. PMID: 37080557; PMCID: PMC10198526.

Verfügbar unter: [https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/](https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/)

##### Technische Spezifikationen

Die FHIR Profile wurden unter Berücksichtigung und Anwendung des [Genomics Reporting Implementation Guide](https://hl7.org/fhir/uv/genomics-reporting/STU3/) (STU3) von HL7 International erstellt. Die meisten Profile erben direkt von den STU3-Profilen und erweitern diese um spezifische Anforderungen der Medizininformatik-Initiative.


### Haplotype (Observation)

#### Observation

Dieses Profil beschreibt die Feststellung eines bestimmten Haplotyps auf der Grundlage einer oder mehrerer Varianten.

Canonical: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype

---

Das Profil [Haplotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-haplotype.html.html) stammt aus [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

---

##### Profil

---
| FHIR-Element | Logischer Datensatz |
|---|---|
| Observation.component:gene-studied | Methoden.Getestete Gene |
| Observation.component:CytogenicLocation | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung |

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

 

---


### Sequence Phase Relationship (Observation)

#### Beschreibung

Zeigt an, ob zwei Varianten in Cis- (gleicher Strang) oder Trans- (entgegengesetzter Strang) Beziehung zueinander stehen.

---

#### Profil

---

#### Terminologie

##### CodeSystem

**Sequence Phase Relationship CodeSystem**

[SequencePhaseRelationshipCS](http://hl7.org/fhir/uv/genomics-reporting/STU3/CodeSystem-SequencePhaseRelationshipCS.html)

##### ValueSet

**Sequence Phase Relationship ValueSet**

[seq-phase-relationship](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-seq-phase-relationship.html)

---

#### Referenzen

Das Profil entspricht [Sequence Phase Relationship](http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship) aus [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).
