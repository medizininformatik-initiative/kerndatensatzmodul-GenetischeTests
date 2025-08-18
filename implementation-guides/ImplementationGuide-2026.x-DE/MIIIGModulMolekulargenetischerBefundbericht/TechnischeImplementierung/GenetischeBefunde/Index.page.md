---
topic: GenetischeBefundeIndex
---

#### {{page-title}}

{{index:current}}

### Überblick

Genetische Befunde dokumentieren die identifizierten genetischen Varianten und deren molekulare Eigenschaften. Diese Observation-basierten Profile bilden die faktische Grundlage für die molekulargenetische Diagnostik ohne interpretative Bewertungen.

### Kernprofile

**Variante**: Einzelne genetische Veränderung mit detaillierten molekularen Annotationen.

**Genotyp**: Kombination von Allelen an einem bestimmten Genlocus, wichtig für die Vererbungsanalyse.

**Haplotyp**: Gruppe von gekoppelten genetischen Varianten, die gemeinsam vererbt werden.

**Sequence Phase Relationship**: Beschreibt die Phasenbeziehung zwischen Varianten (cis/trans).

### Wichtige Komponenten der Variante

#### Molekulare Annotation
- HGVS-Notation auf verschiedenen Ebenen (genomisch, Transkript, Protein)
- Referenzsequenzen (bevorzugt MANE-Transkripte)
- Genomische Position (Chromosom, Start, Ende)
- Referenz- und alternative Allele
- Gen-Symbol (HGNC)

#### Allelischer Status
- Zygosität (heterozygot, homozygot, hemizygot)
- Allelfrequenz (VAF - Variant Allele Frequency) in der untersuchten Probe
- Allelic Read Depth (Anzahl der Reads pro Allel)

### Verknüpfungen

- Varianten können zu Genotypen gruppiert werden (`hasMember`)
- Genotypen können Haplotypen bilden
- Alle Befunde referenzieren die zugehörige GenomicStudy über `partOf`
- Interpretationen in den Implikationen verweisen über `derivedFrom` auf diese Befunde

### Abgrenzung

**Nicht in den Befunden enthalten:**
- Pathogenität und klinische Bedeutung → siehe Implikationen
- Coverage und Sequenziertiefe → siehe Methodik (GenomicStudy)
- Qualitätsmetriken → siehe Methodik (GenomicStudyAnalysis)