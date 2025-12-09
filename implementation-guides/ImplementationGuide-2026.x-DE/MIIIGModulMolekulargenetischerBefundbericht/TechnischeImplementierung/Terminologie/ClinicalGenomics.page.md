---
topic: ClinicalGenomics
---

## Clinical Genomics Terminologien

Die folgenden ValueSets und CodeSystems werden aus dem [HL7 Clinical Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/) übernommen.

### CodeSystems

Das Clinical Genomics IG definiert folgende CodeSystems, die in diesem Modul verwendet werden:

| CodeSystem | Beschreibung | Canonical URL |
|------------|--------------|---------------|
| TBD Codes | Temporäre Codes für Genomics Reporting | `http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs` |
| Molecular Biomarker Ontology | Biomarker-Kategorien | `http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/molecular-biomarker-ontology-cs` |

---

### ValueSets

#### HGNC (Gene Names)

Standardisierte Gen-Symbole und -Namen vom HUGO Gene Nomenclature Committee. HGNC-Gen-IDs werden mit dem Präfix "HGNC:" als Code und dem Gensymbol als Display verwendet.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgnc-vs`

{{render:http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgnc-vs, snapshot}}

---

#### HGVS (Sequence Variant Nomenclature)

Human Genome Variation Society Notation für die standardisierte Beschreibung von Sequenzvarianten.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgvs-vs`

{{render:http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgvs-vs, snapshot}}

---

#### DNA Change Type

Typen von DNA-Veränderungen basierend auf der Sequence Ontology.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/dna-change-type-vs`

{{render:http://hl7.org/fhir/uv/genomics-reporting/ValueSet/dna-change-type-vs}}

---

#### Molecular Consequence

Molekulare Konsequenzen einer Variante auf Transkript- und Proteinebene.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/molecular-consequence-vs`

{{render:http://hl7.org/fhir/uv/genomics-reporting/ValueSet/molecular-consequence-vs}}

---

#### Functional Effect

Funktionelle Auswirkungen einer Variante auf biologische Produkte oder Stoffwechselwege (z.B. Loss of Function, Gain of Function).

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/functional-effect-vs`

{{render:http://hl7.org/fhir/uv/genomics-reporting/ValueSet/functional-effect-vs}}

---

#### Variant Confidence Status

Konfidenzlevel für die Bewertung einer Variante.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/variant-confidence-status-vs`

{{render:http://hl7.org/fhir/uv/genomics-reporting/ValueSet/variant-confidence-status-vs}}

---

#### Condition Inheritance Mode

Vererbungsmuster für genetische Erkrankungen (autosomal dominant, rezessiv, X-linked, etc.).

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/condition-inheritance-vs`

{{render:http://hl7.org/fhir/uv/genomics-reporting/ValueSet/condition-inheritance-vs}}

---

#### Evidence Level Examples

Beispielhafte Evidenzlevel-Codes für die Klassifikation von Varianten.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/evidence-level-example-vs`

{{render:http://hl7.org/fhir/uv/genomics-reporting/ValueSet/evidence-level-example-vs}}

---

#### Therapeutic Implication

Therapeutische Implikationen genetischer Varianten.

**Canonical:** `http://hl7.org/fhir/uv/genomics-reporting/ValueSet/therapeutic-implication-vs`

{{render:http://hl7.org/fhir/uv/genomics-reporting/ValueSet/therapeutic-implication-vs}}

---

#### High/Low Codes

Codes für relative Interpretationen (high, low, normal).

**Canonical:** `http://hl7.org/fhir/ValueSet/observation-interpretation`

{{render:http://hl7.org/fhir/ValueSet/observation-interpretation}}
