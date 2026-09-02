# Anleitung für Implementierende - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Anleitung**](guidance.md)
* **Anleitung für Implementierende**

## Anleitung für Implementierende

Technische Hinweise für DIZ-Implementierende zur Umsetzung der Profile des Moduls **Molekulargenetischer Befundbericht** (ETL aus Primärsystemen, FHIR-API, Validierung).

### Kontext im Gesamtprojekt und Bezüge zu anderen Modulen

#### Beziehung zum Modul Person

Die Zuordnung der Ergebnisse des Befundes zu einem/einer PatientIn, der/die in der Anforderung des Befundes spezifiert wird, sowie die Zuordnung des/der AnforderIn (GesundheitsdienstleisterIn) des Befundes und der Ansprechsperson am durchführenden Labor erfolgt über Referenzen vom Modul MOLEKULARGENETISCHER BEFUNDBERICHT zum MODUL [PERSON](https://simplifier.net/mii-basismodul-person-2024).

#### Beziehung zum Modul Bioproben

Das Modul MOLEKULARGENETISCHER BEFUNDBERICHT referenziert für die Erfassung der Charakteristika der zur Analyse verwendeten Probe das Modul [BIOBANK](https://simplifier.net/medizininformatikinitiative-modulbiobank).

#### Beziehung zum Modul Fall

Die Anforderung der molekulargenetischen Tests erfolgt auf Grundlage der Vorstellung eines/einer PatientIn bei einem/einer GesundheitsdienstleisterIn (**encounter**) und wird referenziert über das Modul [FALL](https://simplifier.net/medizininformatikinitiative-modulfall).

#### Beziehung zum Modul Pathologiebefund

Molekulargenetische Tests können auf Basis von auffälligen Ergebnissen eines vorliegenden Pathologiebefundes angefordert werden. Dieser sollte dann als supportingInfo referenziert werden über das Modul [Pathologiebefund](https://simplifier.net/medizininformatikinitiative-modulpathologie).

#### Beziehung zum Modul Onkologie

Das Modul nutzt die Varianten-Profil des oBDS. In den Krebsregisterdaten gibt es zwei Datenelemente (Beschreibung und Ausprägung einer Genetischen Variante), wobei die Beschreibung der Variante nicht strukturiert im HGVS-Format, sondern als Freitext erfolgt. Die Standorte haben hier die Möglichkeit, die Variante direkt aus dem oBDS zu übernehmen oder nach Möglichkeit mit weiteren lokal verfügbaren strukturierten Informationen anzureichern. Weitere Informationen finden sich im [Modul Onkologie](https://simplifier.net/medizininformatikinitiative-modulonkologie).

#### Beziehung zum Modul Molekulares Tumorboard

Das [KDS-Modul Molekulares Tumorboard](https://simplifier.net/mii-erweiterungsmodul-molekulares-tumorboard) nutzt dieses Modul als Grundlage für die Modellierung eines NextGenerationSequencing-Reports, insbesondere zur Darstellung der verschiedenen Varianten und molekularen Biomarker.

#### Beziehung zum Modul Seltene Erkrankungen

Das neue [Modul Seltene Erkrankungen](https://simplifier.net/mii-modul-seltene-erkrankungen) besitzt keine eigenständigen Profile für molekulargenetische Untersuchungen, sondern verweist bei der Darstellung von molekulargenetischen Daten auf dieses Modul, insbesondere weil die Anforderungen für Gendiagnostik seltener Erkrankungen bereits bei der Erstellung des Moduls Molekulargenetischer Befundbericht berücksichtigt wurden.

### Upstream-Profile aus HL7 Genomics Reporting

Die folgenden beiden Profile stammen aus dem [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/) und werden von diesem Modul nicht eigenständig profiliert. Sie werden hier beschrieben, weil sie bei der Umsetzung genetischer Befunde gemeinsam mit den Profilen dieses Moduls verwendet werden.

#### Haplotype (Observation)

Dieses Profil beschreibt die Feststellung eines bestimmten Haplotyps auf der Grundlage einer oder mehrerer Varianten.

Canonical: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype

Das Profil [Haplotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-haplotype.html) stammt aus dem [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

##### Profil

| | |
| :--- | :--- |
| Observation.component:gene-studied | Methoden.Getestete Gene |
| Observation.component:CytogenicLocation | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung |

#### Sequence Phase Relationship (Observation)

Zeigt an, ob zwei Varianten in Cis- (gleicher Strang) oder Trans- (entgegengesetzter Strang) Beziehung zueinander stehen.

Das Profil entspricht [Sequence Phase Relationship](http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship) aus dem [HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

##### Terminologie

###### CodeSystem

**Sequence Phase Relationship CodeSystem**

[SequencePhaseRelationshipCS](http://hl7.org/fhir/uv/genomics-reporting/STU3/CodeSystem-sequence-phase-relationship-cs.html)

###### ValueSet

**Sequence Phase Relationship ValueSet**

[seq-phase-relationship](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-sequence-phase-relationship-vs.html)

### Referenzen

#### Publikationen

**Hauptpublikation zu diesem Implementation Guide:**

Stellmach C, Sass J, Auber B, Boeker M, Wienker T, Heidel AJ, Benary M, Schumacher S, Ossowski S, Klauschen F, Möller Y, Schmutzler R, Ustjanzew A, Werner P, Tomczak A, Hölter T, Thun S. **Creation of a structured molecular genomics report for Germany as a local adaption of HL7's Genomic Reporting Implementation Guide**. **J Am Med Inform Assoc**. 2023 Apr 20;30(6):1179-1189. doi: 10.1093/jamia/ocad061. PMID: 37080557; PMCID: PMC10198526.

Verfügbar unter: [https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/](https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/)

#### Technische Spezifikationen

Die FHIR Profile wurden unter Berücksichtigung und Anwendung des [Genomics Reporting Implementation Guide](https://hl7.org/fhir/uv/genomics-reporting/STU3/) (STU3) von HL7 International erstellt. Die meisten Profile erben direkt von den STU3-Profilen und erweitern diese um spezifische Anforderungen der Medizininformatik-Initiative.

