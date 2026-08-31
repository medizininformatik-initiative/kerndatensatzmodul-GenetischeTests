<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Terminologie/Index.page.md, TechnischeImplementierung/Terminologie/MII-ValueSets.page.md, TechnischeImplementierung/Terminologie/ClinicalGenomics.page.md, TechnischeImplementierung/Terminologie/Terminologien.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->


### Terminologie

##### Überblick

Die Terminologie-Komponenten definieren die standardisierten Vokabulare für die semantische Interoperabilität genetischer Daten. Die Terminologien sind nach ihrer Herkunft organisiert:

| Seite | Inhalt |
|-------|--------|
| **MII ValueSets** | Eigene ValueSets dieses Moduls (Verwandtschaft, Familienanamnese) |
| **Clinical Genomics** | ValueSets und CodeSystems aus dem HL7 Genomics Reporting IG |
| **Externe Terminologien** | Internationale Standards (LOINC, SNOMED CT, HGNC, etc.) mit Lizenzinformationen |

##### Entscheidungskriterien

| Quelle | Verwendung | Beispiel |
|--------|------------|----------|
| **MII-definiert** | Eigene Anforderungen, keine passende externe Terminologie | Verwandtschaftsgrad, Familiäre Linie |
| **Clinical Genomics** | Genetik-spezifische Konzepte aus dem STU3 Standard | DNA Change Type, Functional Effect |
| **Externe Terminologie** | Etablierte internationale Standards | LOINC, SNOMED CT, HGNC |

##### Binding-Stärken

| Stärke | Bedeutung | Beispiel |
|--------|-----------|----------|
| **Required** | Exakte Übereinstimmung erforderlich | HGVS-Notation |
| **Extensible** | ValueSet erweiterbar bei Bedarf | Diagnose-Codes |
| **Preferred** | Empfohlen aber nicht verpflichtend | - |
| **Example** | Nur als Beispiel, keine Einschränkung | - |

##### Implementierungshinweise

- **Mehrfach-Kodierung**: ICD-10-GM + Orphanet für seltene Erkrankungen
- **Display-Werte**: Immer angeben für Benutzerfreundlichkeit
- **Versionierung**: Terminologie-Versionen dokumentieren (besonders ICD-10-GM Jahresversion)
- **MANE-Transkripte**: Bevorzugt für HGVS-Notationen verwenden


### MII-ValueSets

#### MII ValueSets

Dieses Modul definiert die folgenden eigenen ValueSets für die Interoperabilität genetischer Befundberichte.

##### Family Member (SNOMED)

SNOMED CT Codes für Familienmitglieder im Kontext der Familienanamnese.

[mii-vs-molgen-family-member-snomed](ValueSet-mii-vs-molgen-family-member-snomed.html)

---

##### Verwandtschaftsgrad

Kodierung des Verwandtschaftsgrades für die Familienanamnese.

[mii-vs-molgen-verwandtschaftsgrad](ValueSet-mii-vs-molgen-verwandtschaftsgrad.html)

---

##### Verwandtschaftsverhältnis

Kodierung des Verwandtschaftsverhältnisses (biologisch, rechtlich, etc.).

[mii-vs-molgen-verwandtschaftsverhaeltnis](ValueSet-mii-vs-molgen-verwandtschaftsverhaeltnis.html) <!-- TODO:REVIEW Tippfehler in der Quelle korrigiert: "mii-vs-molgen-verwandtsverhaeltnis" -> "mii-vs-molgen-verwandtschaftsverhaeltnis" (genau ein Kandidat) -->

---

##### Familiäre Linie

Kodierung der familiären Linie (mütterlich, väterlich, etc.).

[mii-vs-molgen-familiaere-linie](ValueSet-mii-vs-molgen-familiaere-linie.html)


### ValueSets aus Clinical Genomics

#### Clinical Genomics Terminologien

Die folgenden ValueSets und CodeSystems werden aus dem [HL7 Clinical Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/) übernommen.

##### CodeSystems

Das Clinical Genomics IG definiert folgende CodeSystems, die in diesem Modul verwendet werden:

| CodeSystem | Beschreibung | Canonical URL |
|------------|--------------|---------------|
| TBD Codes | Temporäre Codes für Genomics Reporting | `http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs` |
| Molecular Biomarker Ontology | Biomarker-Kategorien | `http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/molecular-biomarker-ontology-cs` |

---

##### ValueSets

###### HGNC (Gene Names)

Standardisierte Gen-Symbole und -Namen vom HUGO Gene Nomenclature Committee. HGNC-Gen-IDs werden mit dem Präfix "HGNC:" als Code und dem Gensymbol als Display verwendet.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgnc-vs`

[hgnc-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-hgnc-vs.html)

---

###### HGVS (Sequence Variant Nomenclature)

Human Genome Variation Society Notation für die standardisierte Beschreibung von Sequenzvarianten.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgvs-vs`

[hgvs-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-hgvs-vs.html)

---

###### DNA Change Type

Typen von DNA-Veränderungen basierend auf der Sequence Ontology.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/dna-change-type-vs`

[dna-change-type-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-dna-change-type-vs.html)

---

###### Molecular Consequence

Molekulare Konsequenzen einer Variante auf Transkript- und Proteinebene.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/molecular-consequence-vs`

[molecular-consequence-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-molecular-consequence-vs.html)

---

###### Functional Effect

Funktionelle Auswirkungen einer Variante auf biologische Produkte oder Stoffwechselwege (z.B. Loss of Function, Gain of Function).

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/functional-effect-vs`

[functional-effect-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-functional-effect-vs.html)

---

###### Variant Confidence Status

Konfidenzlevel für die Bewertung einer Variante.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/variant-confidence-status-vs`

[variant-confidence-status-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-variant-confidence-status-vs.html)

---

###### Condition Inheritance Mode

Vererbungsmuster für genetische Erkrankungen (autosomal dominant, rezessiv, X-linked, etc.).

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/condition-inheritance-vs`

[condition-inheritance-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-condition-inheritance-vs.html)

---

###### Evidence Level Examples

Beispielhafte Evidenzlevel-Codes für die Klassifikation von Varianten.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/evidence-level-example-vs`

[evidence-level-example-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-evidence-level-example-vs.html)

---

###### Therapeutic Implication

Therapeutische Implikationen genetischer Varianten.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/therapeutic-implication-vs`

[therapeutic-implication-vs](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-therapeutic-implication-vs.html)

---

###### High/Low Codes

Codes für relative Interpretationen (high, low, normal).

**Canonical:** `http://hl7.org/fhir/ValueSet/observation-interpretation`

[observation-interpretation](http://hl7.org/fhir/R4/valueset-observation-interpretation.html)


### Verwendete Terminologien

#### Externe Terminologien

Dieses Modul verwendet internationale Terminologie-Standards für die semantische Kodierung genetischer Befunde.

##### Genetische Nomenklatur

| Terminologie | Beschreibung | URL | Lizenz |
|--------------|--------------|-----|--------|
| **HGNC** | HUGO Gene Nomenclature Committee - standardisierte Gen-Symbole | `http://www.genenames.org/geneId` | [CC0](https://www.genenames.org/about/) |
| **HGVS** | Human Genome Variation Society - Sequenzvarianten-Notation | `http://varnomen.hgvs.org` | Open |
| **ISCN** | International System for Human Cytogenomic Nomenclature | - | Kommerziell |
| **Sequence Ontology** | Ontologie für genomische Annotationen | `http://sequenceontology.org` | [CC BY-SA](http://www.sequenceontology.org/about.html) |

##### Klinische Terminologien

| Terminologie | Beschreibung | URL | Lizenz |
|--------------|--------------|-----|--------|
| **LOINC** | Logical Observation Identifiers Names and Codes | `http://loinc.org` | [LOINC License](https://loinc.org/license/) - kostenfrei |
| **SNOMED CT** | Systematized Nomenclature of Medicine | `http://snomed.info/sct` | [NRC Lizenz](https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/_node.html) |
| **ICD-10-GM** | ICD-10 German Modification | `http://fhir.de/CodeSystem/bfarm/icd-10-gm` | BfArM - kostenfrei |
| **Orphanet** | Seltene Erkrankungen | `http://www.orpha.net` | [CC BY 4.0](https://www.orphadata.com/terms-of-use/) |
| **OMIM** | Online Mendelian Inheritance in Man | `http://www.omim.org` | [OMIM License](https://www.omim.org/help/agreement) |
| **HPO** | Human Phenotype Ontology | `http://human-phenotype-ontology.org` | [Custom](https://hpo.jax.org/app/license) - kostenfrei |

##### Referenzsequenzen

| Datenbank | Beschreibung | URL | Hinweise |
|-----------|--------------|-----|----------|
| **RefSeq** | NCBI Reference Sequences | `http://www.ncbi.nlm.nih.gov/refseq` | Bevorzugt: MANE Select Transkripte |
| **Ensembl** | Ensembl Genome Browser | `http://www.ensembl.org` | Alternative Transkript-Referenzen |
| **dbSNP** | Single Nucleotide Polymorphism Database | `http://www.ncbi.nlm.nih.gov/snp` | rs-Nummern für bekannte Varianten |
| **ClinVar** | Clinical Variant Database | `http://www.ncbi.nlm.nih.gov/clinvar` | Klinische Variantenbewertungen |
| **COSMIC** | Catalogue of Somatic Mutations in Cancer | `https://cancer.sanger.ac.uk/cosmic` | Somatische Varianten |

##### Pharmakogenomik

| Datenbank | Beschreibung | URL | Verwendung |
|-----------|--------------|-----|------------|
| **PharmGKB** | Pharmacogenomics Knowledge Base | `https://www.pharmgkb.org` | Evidenzlevel für Pharmakogenetik |
| **CPIC** | Clinical Pharmacogenetics Implementation Consortium | `https://cpicpgx.org` | Dosierungsempfehlungen |

##### MANE (Matched Annotation from NCBI and EMBL-EBI)

Für HGVS-Notationen sollten bevorzugt **MANE Select** Transkripte verwendet werden:

- **MANE Select**: Ein repräsentatives Transkript pro proteinkodierendem Gen
- **MANE Plus Clinical**: Zusätzliche klinisch relevante Transkripte
- **Format**: RefSeq NM_ Identifikatoren mit Versionsnummer (z.B. `NM_007294.4`)
- **Referenz**: [NCBI MANE](https://www.ncbi.nlm.nih.gov/refseq/MANE/)

##### Versionierung

| Terminologie | Empfehlung |
|--------------|------------|
| ICD-10-GM | Jahresversion angeben (z.B. 2024) |
| LOINC | Version bei Implementierung dokumentieren |
| SNOMED CT | International Edition + deutsche Erweiterung |
| RefSeq | Transkript-Versionsnummer immer angeben |

##### Lizenzhinweise

Die Verwendung einiger Terminologien erfordert Lizenzvereinbarungen:

- **SNOMED CT**: Nutzung in Deutschland über BfArM-Lizenz (NRC)
- **LOINC**: Kostenfreie Registrierung erforderlich
- **OMIM**: Lizenz für kommerzielle Nutzung erforderlich
