---
topic: CodeSystems
---

## {{page-title}}

Dieses Modul verwendet die folgenden CodeSystems für die semantische Kodierung genetischer Befunde.

### Externe CodeSystems

Dieses Modul definiert keine eigenen CodeSystems. Stattdessen werden internationale Standards verwendet:

#### Genetische Nomenklatur

| CodeSystem | Beschreibung | URL |
|------------|--------------|-----|
| HGNC | HUGO Gene Nomenclature Committee | `http://www.genenames.org/geneId` |
| HGVS | Human Genome Variation Society | `http://varnomen.hgvs.org` |
| Sequence Ontology | Sequenz-Ontologie für Varianten | `http://sequenceontology.org` |

#### Klinische Terminologien

| CodeSystem | Beschreibung | URL |
|------------|--------------|-----|
| LOINC | Logical Observation Identifiers Names and Codes | `http://loinc.org` |
| SNOMED CT | Systematized Nomenclature of Medicine | `http://snomed.info/sct` |
| ICD-10-GM | ICD-10 German Modification | `http://fhir.de/CodeSystem/bfarm/icd-10-gm` |
| Orphanet | Seltene Erkrankungen | `http://www.orpha.net` |
| OMIM | Online Mendelian Inheritance in Man | `http://www.omim.org` |
| HPO | Human Phenotype Ontology | `http://human-phenotype-ontology.org` |

#### Referenzsequenzen

| CodeSystem | Beschreibung | URL |
|------------|--------------|-----|
| RefSeq | NCBI Reference Sequences | `http://www.ncbi.nlm.nih.gov/refseq` |
| Ensembl | Ensembl Genome Browser | `http://www.ensembl.org` |
| dbSNP | Single Nucleotide Polymorphism Database | `http://www.ncbi.nlm.nih.gov/snp` |
| ClinVar | Clinical Variant Database | `http://www.ncbi.nlm.nih.gov/clinvar` |

#### HL7 Genomics Reporting

| CodeSystem | Beschreibung | URL |
|------------|--------------|-----|
| TBD Codes | Genomics Reporting Codes | `http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs` |
| Molecular Biomarker Ontology | Biomarker-Kategorien | `http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/molecular-biomarker-ontology-cs` |

### Verwendung

Die korrekte Verwendung der CodeSystems erfolgt über die Profile und deren Binding-Definitionen. Weitere Informationen zu spezifischen Codes finden Sie auf den Unterseiten zu den einzelnen Terminologien.