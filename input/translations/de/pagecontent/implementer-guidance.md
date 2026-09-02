<!-- markdownlint-disable MD041 -->
<!-- Deutsche Übersetzung von input/pagecontent/implementer-guidance.md. Beide
     Sprachfassungen müssen dieselbe Überschriftenstruktur haben. -->
<!-- Migriert aus dem Simplifier-Leitfaden KontextimGesamtprojektBezgezuanderenModulen.page.md, Referenzen.page.md, TechnischeImplementierung/GenetischeBefunde/Haplotype-Observation.page.md, TechnischeImplementierung/GenetischeBefunde/Sequence-Phase-Relationship---Observation.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

Technische Hinweise für DIZ-Implementierende zur Umsetzung der Profile des Moduls **Molekulargenetischer Befundbericht** (ETL aus Primärsystemen, FHIR-API, Validierung).

<!-- TODO:REVIEW Die TODO-Box des Template-Gerüsts ("Beschreiben Sie die
     technischen Umsetzungsschritte für Ihr Modul") wurde entfernt. Die
     migrierten Quellseiten beschreiben die Bezüge zu anderen Modulen, die
     Referenzen und zwei Upstream-Profile — jedoch keine ETL-Schritte im
     engeren Sinne. Falls eine ETL-Beschreibung gefordert ist, fehlt sie noch. -->

### Kontext im Gesamtprojekt und Bezüge zu anderen Modulen

#### Beziehung zum Modul Person

Die Zuordnung der Ergebnisse des Befundes zu einem/einer PatientIn, der/die in
der Anforderung des Befundes spezifiert wird, sowie die Zuordnung des/der
AnforderIn (GesundheitsdienstleisterIn) des Befundes und der Ansprechsperson am
durchführenden Labor erfolgt über Referenzen vom Modul MOLEKULARGENETISCHER
BEFUNDBERICHT zum MODUL
[PERSON](https://simplifier.net/mii-basismodul-person-2024).

#### Beziehung zum Modul Bioproben

Das Modul MOLEKULARGENETISCHER BEFUNDBERICHT referenziert für die Erfassung der
Charakteristika der zur Analyse verwendeten Probe das Modul
[BIOBANK](https://simplifier.net/medizininformatikinitiative-modulbiobank).

#### Beziehung zum Modul Fall

Die Anforderung der molekulargenetischen Tests erfolgt auf Grundlage der
Vorstellung eines/einer PatientIn bei einem/einer GesundheitsdienstleisterIn
(*encounter*) und wird referenziert über das Modul
[FALL](https://simplifier.net/medizininformatikinitiative-modulfall).

#### Beziehung zum Modul Pathologiebefund

Molekulargenetische Tests können auf Basis von auffälligen Ergebnissen eines
vorliegenden Pathologiebefundes angefordert werden. Dieser sollte dann als
supportingInfo referenziert werden über das Modul
[Pathologiebefund](https://simplifier.net/medizininformatikinitiative-modulpathologie).

#### Beziehung zum Modul Onkologie

Das Modul nutzt die Varianten-Profil des oBDS. In den Krebsregisterdaten gibt es
zwei Datenelemente (Beschreibung und Ausprägung einer Genetischen Variante),
wobei die Beschreibung der Variante nicht strukturiert im HGVS-Format, sondern
als Freitext erfolgt. Die Standorte haben hier die Möglichkeit, die Variante
direkt aus dem oBDS zu übernehmen oder nach Möglichkeit mit weiteren lokal
verfügbaren strukturierten Informationen anzureichern. Weitere Informationen
finden sich im
[Modul Onkologie](https://simplifier.net/medizininformatikinitiative-modulonkologie).

#### Beziehung zum Modul Molekulares Tumorboard

Das
[KDS-Modul Molekulares Tumorboard](https://simplifier.net/mii-erweiterungsmodul-molekulares-tumorboard)
nutzt dieses Modul als Grundlage für die Modellierung eines
NextGenerationSequencing-Reports, insbesondere zur Darstellung der verschiedenen
Varianten und molekularen Biomarker.

#### Beziehung zum Modul Seltene Erkrankungen

Das neue
[Modul Seltene Erkrankungen](https://simplifier.net/mii-modul-seltene-erkrankungen)
besitzt keine eigenständigen Profile für molekulargenetische Untersuchungen,
sondern verweist bei der Darstellung von molekulargenetischen Daten auf dieses
Modul, insbesondere weil die Anforderungen für Gendiagnostik seltener
Erkrankungen bereits bei der Erstellung des Moduls Molekulargenetischer
Befundbericht berücksichtigt wurden.

### Upstream-Profile aus HL7 Genomics Reporting

Dieses Modul baut durchgängig auf
[HL7 Genomics Reporting STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/) auf,
nicht bloß daneben. Aus den gebauten Artefakten ausgezählt:

| Wie das Modul STU3 nutzt | Anzahl |
|---|---|
| Eigene Profile, die direkt von einem STU3-Profil erben | 10 |
| Eigene Profile, die indirekt erben (über MII_PR_MolGen_MolekularerBiomarker) | 2 |
| Eigene Extensions, die von einer STU3-Extension erben | 1 |
| In den Profilen verwendete STU3-Extensions | 12 |
| Gebundene STU3-ValueSets | 3 |
| Aus STU3 übernommene Codesysteme | 2 |

Welches Profil dieses Moduls von welchem STU3-Profil abstammt, steht in der
[Vererbungstabelle auf der Profilseite](profiles.html). **Dieser Abschnitt behandelt
etwas Engeres**: die beiden STU3-Profile, die dieses Modul **unverändert** verwendet,
ohne ein eigenes Profil davon abzuleiten. Genau deshalb haben sie keine Seite unter
[Artefakte](artifacts.html) und werden hier beschrieben.

#### Haplotype (Observation)

Dieses Profil beschreibt die Feststellung eines bestimmten Haplotyps auf der
Grundlage einer oder mehrerer Varianten.

Canonical: `http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype`
· [Profilseite](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-haplotype.html)

Das [CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.html)
deklariert dieses Profil mit `SHALL`; ein konformer Server muss es also unterstützen.

##### Komponenten

STU3 definiert auf diesem Profil fünf Component-Slices. Zwei davon tragen Elemente
des logischen Datensatzes dieses Moduls:

| FHIR-Element | Logischer Datensatz |
|---|---|
| `Observation.component:gene-studied` | Methoden.Getestete Gene |
| `Observation.component:cytogenetic-location` | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung |

Die übrigen drei stehen zur Verfügung, sind aber nicht auf den logischen Datensatz
abgebildet: `conclusion-string`, `reference-sequence-assembly` und
`chromosome-identifier`.

#### Sequence Phase Relationship (Observation)

Zeigt an, ob zwei Varianten in Cis- (gleicher Strang) oder Trans-
(entgegengesetzter Strang) Beziehung zueinander stehen — ob sie also auf derselben
Chromosomenkopie sitzen oder auf verschiedenen. Diese Unterscheidung entscheidet
darüber, ob zwei Varianten in demselben Gen ein Allel betreffen oder beide, und
damit, ob eine rezessive Erkrankung vorliegt.

Canonical: `http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship`
· [Profilseite](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-sequence-phase-relationship.html)

##### Struktur

| Element | Kard. | Inhalt |
|---|---|---|
| `Observation.code` | 1..1 | fest auf LOINC `82120-7` |
| `Observation.value[x]` | 1..1 | die Phasenbeziehung, `required` an das ValueSet unten gebunden |
| `Observation.derivedFrom:variant` | 0..* | die in Beziehung gesetzten Varianten — das Profil [Variante](StructureDefinition-mii-pr-molgen-variante.html) dieses Moduls leitet sich von dem hier referenzierten STU3-Profil ab |
| `Observation.derivedFrom:haplotype` | 0..* | alternativ die in Beziehung gesetzten Haplotypen |

##### Terminologie

| | |
|---|---|
| ValueSet | [`sequence-phase-relationship-vs`](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-sequence-phase-relationship-vs.html), Bindung `required` |
| CodeSystem | [`sequence-phase-relationship-cs`](http://hl7.org/fhir/uv/genomics-reporting/STU3/CodeSystem-sequence-phase-relationship-cs.html) — Canonical `http://terminology.hl7.org/CodeSystem/sequence-phase-relationship-cs`, es gehört also zu HL7 Terminology und wird im STU3-Guide nur mitgerendert |

<!-- DERIVED:no-source source=none gate=B -->
> **Offener Punkt für das Release: Dieses Profil ist im CapabilityStatement nicht
> deklariert.**
> Haplotype ist mit `SHALL` deklariert, Sequence Phase Relationship gar nicht —
> obwohl diese Seite beide als verwendet darstellt. Entweder ist das
> CapabilityStatement unvollständig, oder dieses Profil wird von Implementierenden
> tatsächlich nicht erwartet und die Seite sagt zu viel. Was von beidem zutrifft,
> ist eine Entscheidung der Modulautorinnen und -autoren und lässt sich nicht aus
> den Artefakten ablesen.
{: .ig-highlight .ig-highlight-grey}

### Referenzen

#### Publikationen

**Hauptpublikation zu diesem Implementation Guide:**

Stellmach C, Sass J, Auber B, Boeker M, Wienker T, Heidel AJ, Benary M,
Schumacher S, Ossowski S, Klauschen F, Möller Y, Schmutzler R, Ustjanzew A,
Werner P, Tomczak A, Hölter T, Thun S. **Creation of a structured molecular
genomics report for Germany as a local adaption of HL7's Genomic Reporting
Implementation Guide**. *J Am Med Inform Assoc*. 2023 Apr 20;30(6):1179-1189.
doi: 10.1093/jamia/ocad061. PMID: 37080557; PMCID: PMC10198526.

Verfügbar unter: [https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/](https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/)

#### Technische Spezifikationen

Die FHIR Profile wurden unter Berücksichtigung und Anwendung des
[Genomics Reporting Implementation Guide](https://hl7.org/fhir/uv/genomics-reporting/STU3/)
(STU3) von HL7 International erstellt. Die meisten Profile erben direkt von den
STU3-Profilen und erweitern diese um spezifische Anforderungen der
Medizininformatik-Initiative.
