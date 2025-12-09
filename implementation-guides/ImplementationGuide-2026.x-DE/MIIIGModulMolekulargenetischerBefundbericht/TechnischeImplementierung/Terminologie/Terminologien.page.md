---
topic: Terminologien
---

## Externe Terminologien

Dieses Modul verwendet internationale Terminologie-Standards für die semantische Kodierung genetischer Befunde.

### Genetische Nomenklatur

| Terminologie | Beschreibung | URL | Lizenz |
|--------------|--------------|-----|--------|
| **HGNC** | HUGO Gene Nomenclature Committee - standardisierte Gen-Symbole | `http://www.genenames.org/geneId` | [CC0](https://www.genenames.org/about/) |
| **HGVS** | Human Genome Variation Society - Sequenzvarianten-Notation | `http://varnomen.hgvs.org` | Open |
| **ISCN** | International System for Human Cytogenomic Nomenclature | - | Kommerziell |
| **Sequence Ontology** | Ontologie für genomische Annotationen | `http://sequenceontology.org` | [CC BY-SA](http://www.sequenceontology.org/about.html) |

### Klinische Terminologien

| Terminologie | Beschreibung | URL | Lizenz |
|--------------|--------------|-----|--------|
| **LOINC** | Logical Observation Identifiers Names and Codes | `http://loinc.org` | [LOINC License](https://loinc.org/license/) - kostenfrei |
| **SNOMED CT** | Systematized Nomenclature of Medicine | `http://snomed.info/sct` | [NRC Lizenz](https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/_node.html) |
| **ICD-10-GM** | ICD-10 German Modification | `http://fhir.de/CodeSystem/bfarm/icd-10-gm` | BfArM - kostenfrei |
| **Orphanet** | Seltene Erkrankungen | `http://www.orpha.net` | [CC BY 4.0](https://www.orphadata.com/terms-of-use/) |
| **OMIM** | Online Mendelian Inheritance in Man | `http://www.omim.org` | [OMIM License](https://www.omim.org/help/agreement) |
| **HPO** | Human Phenotype Ontology | `http://human-phenotype-ontology.org` | [Custom](https://hpo.jax.org/app/license) - kostenfrei |

### Referenzsequenzen

| Datenbank | Beschreibung | URL | Hinweise |
|-----------|--------------|-----|----------|
| **RefSeq** | NCBI Reference Sequences | `http://www.ncbi.nlm.nih.gov/refseq` | Bevorzugt: MANE Select Transkripte |
| **Ensembl** | Ensembl Genome Browser | `http://www.ensembl.org` | Alternative Transkript-Referenzen |
| **dbSNP** | Single Nucleotide Polymorphism Database | `http://www.ncbi.nlm.nih.gov/snp` | rs-Nummern für bekannte Varianten |
| **ClinVar** | Clinical Variant Database | `http://www.ncbi.nlm.nih.gov/clinvar` | Klinische Variantenbewertungen |
| **COSMIC** | Catalogue of Somatic Mutations in Cancer | `https://cancer.sanger.ac.uk/cosmic` | Somatische Varianten |

### Pharmakogenomik

| Datenbank | Beschreibung | URL | Verwendung |
|-----------|--------------|-----|------------|
| **PharmGKB** | Pharmacogenomics Knowledge Base | `https://www.pharmgkb.org` | Evidenzlevel für Pharmakogenetik |
| **CPIC** | Clinical Pharmacogenetics Implementation Consortium | `https://cpicpgx.org` | Dosierungsempfehlungen |

### MANE (Matched Annotation from NCBI and EMBL-EBI)

Für HGVS-Notationen sollten bevorzugt **MANE Select** Transkripte verwendet werden:

- **MANE Select**: Ein repräsentatives Transkript pro proteinkodierendem Gen
- **MANE Plus Clinical**: Zusätzliche klinisch relevante Transkripte
- **Format**: RefSeq NM_ Identifikatoren mit Versionsnummer (z.B. `NM_007294.4`)
- **Referenz**: [NCBI MANE](https://www.ncbi.nlm.nih.gov/refseq/MANE/)

### Versionierung

| Terminologie | Empfehlung |
|--------------|------------|
| ICD-10-GM | Jahresversion angeben (z.B. 2024) |
| LOINC | Version bei Implementierung dokumentieren |
| SNOMED CT | International Edition + deutsche Erweiterung |
| RefSeq | Transkript-Versionsnummer immer angeben |

### Lizenzhinweise

Die Verwendung einiger Terminologien erfordert Lizenzvereinbarungen:

- **SNOMED CT**: Nutzung in Deutschland über BfArM-Lizenz (NRC)
- **LOINC**: Kostenfreie Registrierung erforderlich
- **OMIM**: Lizenz für kommerzielle Nutzung erforderlich
