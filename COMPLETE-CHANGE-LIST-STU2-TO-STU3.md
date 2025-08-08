# Complete Change List: MII MolGen STU2 to STU3 Migration

## Overview
This document provides a complete list of changes when migrating from Clinical Genomics Reporting STU2 to STU3, including both upstream changes from HL7 and specific changes in the MII MolGen module.

---

## 1. REMOVED Profiles and Elements

### 1.1 Profiles Completely Removed

| Profile | STU2 Name | Migration Path |
|---------|-----------|----------------|
| **UntersuchteRegion** | `mii-pr-molgen-untersuchte-region` | → Use `GenomicStudy` + `GenomicStudyAnalysis` |
| **ErgebnisZusammenfassung** | `mii-pr-molgen-ergebnis-zusammenfassung` | → Use `DiagnosticReport.conclusionCode` |
| **Overall Interpretation** | (from upstream CG STU2) | → Use `DiagnosticReport.conclusionCode` |

### 1.2 Elements/Components Removed

| Parent Profile | Removed Element | Reason | Alternative |
|----------------|-----------------|---------|-------------|
| **Variante** | `component[amino-acid-change-type]` | Redundant | Use molecular consequence |
| **Variante** | `component[molecular-consequence]` | Moved to new profile | Use `MolekulareKonsequenz` profile |
| **DiagnostischeImplikation** | `component[functional-effect]` | Moved to new profile | Use `MolekulareKonsequenz` profile |
| **MolekulargenetischerBefundbericht** | `result[overall]` slice | Profile removed | Use `conclusionCode` |
| **MolekulargenetischerBefundbericht** | `result[region-studied]` slice | Profile removed | Use `extension[genomic-study]` |
| **MolekulargenetischerBefundbericht** | `extension[region-studied]` | Replaced | Use `extension[genomic-study]` |
| **Mikrosatelliteninstabilitaet** | `component[conclusion-string]` | Parent change | Inherited from molecular-biomarker |
| **Mutationslast** | `component[conclusion-string]` | Parent change | Inherited from molecular-biomarker |
| **TherapeutischeImplikation** | `component[prognosis]` | Removed | Not needed |

---

## 2. NEW Profiles

| Profile | Name | Purpose | Parent |
|---------|------|---------|--------|
| **GenomicStudy** | `mii-pr-molgen-genomic-study` | Overall genomic study container | `genomic-study` (CG STU3) |
| **GenomicStudyAnalysis** | `mii-pr-molgen-genomic-study-analysis` | Specific analysis/assay details | `genomic-study-analysis` (CG STU3) |
| **MolekulareKonsequenz** | `mii-pr-molgen-molekulare-konsequenz` | Molecular consequences of variants | `molecular-consequence` (CG STU3) |
| **MolecularBiomarker** | (upstream) | Base for biomarkers | New in CG STU3 |

---

## 3. RENAMED Elements

### 3.1 Variante Profile Components

| STU2 Name | STU3 Name | Type |
|-----------|-----------|------|
| `component[coding-hgvs]` | `component[representative-coding-hgvs]` | Rename |
| `component[transcript-ref-seq]` | `component[representative-transcript-ref-seq]` | Rename |
| `component[protein-hgvs]` | `component[representative-protein-hgvs]` | Rename |

### 3.2 Extensions

| Context | STU2 Name | STU3 Name |
|---------|-----------|-----------|
| **MolekulargenetischerBefundbericht** | `extension[genomics-artifact]` | `extension[workflow-relatedArtifact]` |
| **MolekulargenetischerBefundbericht** | `extension[genomics-file]` | `extension[workflow-relatedArtifact]` (merged) |
| **MolekulargenetischerBefundbericht** | `extension[genomics-risk-assessment]` | `extension[genomic-risk-assessment]` |
| **DiagnostischeImplikation** | `extension[genomic-artifact]` | `extension[workflow-relatedArtifact]` |
| **TherapeutischeImplikation** | `component[predicted-therapeutic-implication]` | `component[therapeutic-implication]` |

---

## 4. CHANGED Profile Inheritance

| Profile | STU2 Parent | STU3 Parent | Impact |
|---------|-------------|-------------|--------|
| **MolekulargenetischerBefundbericht** | `genomics-report` | `genomic-report` | Name change (no 's') |
| **Mikrosatelliteninstabilitaet** | `Observation` | `molecular-biomarker` | New parent profile |
| **Mutationslast** | `Observation` | `molecular-biomarker` | New parent profile |

---

## 5. STRUCTURAL Changes

### 5.1 UntersuchteRegion → GenomicStudy Migration

**STU2 Structure:**
```
UntersuchteRegion (Observation)
├── component[gene-studied]
├── component[region-description]
├── component[region-coverage]
├── component[genomic-ref-seq]
└── component[transcript-ref-seq]
```

**STU3 Structure:**
```
GenomicStudy (Procedure)
└── analysis → GenomicStudyAnalysis (Procedure)
    └── extension[regions]
        ├── extension[description]
        ├── extension[studied] (multiple)
        ├── extension[called] (optional)
        └── extension[uncalled] (optional)
```

### 5.2 ErgebnisZusammenfassung Integration

**STU2:**
- Separate `Observation` resource
- Referenced from `DiagnosticReport.result`

**STU3:**
- No separate resource
- Data moved to `DiagnosticReport.conclusionCode`
- Text moved to `DiagnosticReport.conclusion`

---

## 6. CARDINALITY Changes

| Element | STU2 | STU3 | Impact |
|---------|------|------|--------|
| **DiagnosticReport.conclusionCode** | 0..* | 0..* | Now holds ErgebnisZusammenfassung data |
| **DiagnosticReport.extension[genomic-study]** | N/A | 0..* | New extension |

---

## 7. VALUE SET and BINDING Changes

| Profile | Element | Change |
|---------|---------|--------|
| **MolekulareKonsequenz** | `component[functional-effect]` | Now uses Sequence Ontology codes |
| **All profiles** | Status codes | Must use full FHIR URIs |

---

## 8. OPERATIONAL Changes

### 8.1 New Required Extensions

| Profile | Extension | Purpose |
|---------|-----------|---------|
| **MolekulargenetischerBefundbericht** | `extension[genomic-study]` | Links to GenomicStudy |
| **GenomicStudyAnalysis** | `extension[regions]` | Contains studied regions |

### 8.2 Deprecated Patterns

| Pattern | Status | Alternative |
|---------|--------|-------------|
| Using `result[region-studied]` | Deprecated | Use `extension[genomic-study]` |
| Separate ErgebnisZusammenfassung | Deprecated | Use conclusionCode |
| component[molecular-consequence] in Variante | Deprecated | Use MolekulareKonsequenz |

---

## 9. MIGRATION Priority

### High Priority (Breaking Changes)
1. ✅ Remove all UntersuchteRegion references
2. ✅ Migrate ErgebnisZusammenfassung data
3. ✅ Update Variante component names
4. ✅ Create GenomicStudy/GenomicStudyAnalysis resources

### Medium Priority (Structural Changes)
1. ⚠️ Update profile inheritance for Mikrosatelliteninstabilitaet/Mutationslast
2. ⚠️ Move molecular consequences to new profile
3. ⚠️ Update extension names

### Low Priority (Cleanup)
1. ℹ️ Remove deprecated components
2. ℹ️ Update documentation references
3. ℹ️ Clean up unused slices

---

## 10. VALIDATION Checkpoints

### Must Pass
- [ ] No references to `untersuchte-region`
- [ ] No references to `ergebnis-zusammenfassung`
- [ ] All Variante components use new names
- [ ] GenomicStudy created for each analysis

### Should Pass
- [ ] Extension names updated
- [ ] Profile inheritance correct
- [ ] Molecular consequences in separate resources

### Nice to Have
- [ ] Consistent use of new patterns
- [ ] Clean migration metadata
- [ ] Updated documentation

---

## 11. EXAMPLE Transformations

### Example 1: UntersuchteRegion → GenomicStudy

```json
// STU2
{
  "resourceType": "Observation",
  "meta": {"profile": ["mii-pr-molgen-untersuchte-region"]},
  "component": [{
    "code": {"coding": [{"code": "48018-6"}]},
    "valueCodeableConcept": {"coding": [{"code": "HGNC:1097"}]}
  }]
}

// STU3 (creates 2 resources)
{
  "resourceType": "Procedure",
  "meta": {"profile": ["mii-pr-molgen-genomic-study"]},
  "analysis": [{"reference": "Procedure/analysis-1"}]
}
{
  "resourceType": "Procedure",
  "id": "analysis-1",
  "meta": {"profile": ["mii-pr-molgen-genomic-study-analysis"]},
  "extension": [{
    "url": "...genomic-study-analysis-regions",
    "extension": [{
      "url": "studied",
      "valueCodeableConcept": {"coding": [{"code": "HGNC:1097"}]}
    }]
  }]
}
```

### Example 2: Component Rename

```json
// STU2
"component": [{
  "code": "coding-hgvs",
  "valueCodeableConcept": {...}
}]

// STU3
"component": [{
  "code": "representative-coding-hgvs",
  "valueCodeableConcept": {...}
}]
```

---

## 12. TIMELINE Considerations

| Phase | Timeframe | Action |
|-------|-----------|--------|
| **Immediate** | Now | Fix breaking changes |
| **Short-term** | 1-2 months | Structural updates |
| **Medium-term** | 3-6 months | Complete migration |
| **Long-term** | 6+ months | Optimization and cleanup |

---

## References

- [HL7 Clinical Genomics STU3 Change Log](https://hl7.org/fhir/uv/genomics-reporting/STU3/changes.html)
- [MII MolGen Release Notes v2026.0.0](./ReleaseNotes.md)
- [FHIR R4.0.1 Specification](http://hl7.org/fhir/R4/)

---

**Document Version**: 1.0  
**Last Updated**: 2025-08-08  
**Maintainer**: MII MolGen Team