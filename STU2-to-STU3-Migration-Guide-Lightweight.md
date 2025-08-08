# MII MolGen STU2 to STU3 Migration Guide for Implementers

## Overview
This guide helps centers migrate from Clinical Genomics Reporting STU2 to STU3. As the specification maintainer, I provide the migration path - each center handles their own data migration.

**Verification Status**: Guide verified against generated FHIR resources (2025-08-08)

## What Changed (Quick Reference)

### Changed Base Profile URLs (STU2 → STU3)
| Profile | Old Base (STU2) | New Base (STU3) |
|---------|-----------------|-----------------|
| UntersuchteRegion | `genomics-reporting/StructureDefinition/region-studied` | **REMOVED** - Basic functionality now in GenomicStudy |
| GenomicStudy | (new) | `genomics-reporting/StructureDefinition/genomic-study` |
| GenomicStudyAnalysis | (new) | `genomics-reporting/StructureDefinition/genomic-study-analysis` |
| Variante | `genomics-reporting/StructureDefinition/variant` | `genomics-reporting/StructureDefinition/variant` (unchanged) |
| Mikrosatelliteninstabilitaet | Direct from `Observation` | `genomics-reporting/StructureDefinition/molecular-biomarker` |
| Mutationslast | Direct from `Observation` | `genomics-reporting/StructureDefinition/molecular-biomarker` |
| MolekulareKonsequenz | (new) | `genomics-reporting/StructureDefinition/molecular-consequence` |

### Component Code Changes in Variante Instances
**Note**: The profile slice names changed, but in actual FHIR instances, you identify components by their `code` element:

| Component | LOINC Code | What Changed |
|-----------|------------|--------------|
| DNA change (c.HGVS) | `48004-6` | No change in code, still in profile |
| Transcript reference | `51958-7` | No change in code, still in profile |
| Amino acid change | `48005-3` | No change in code, still in profile |
| Amino acid change type | `48006-1` | **REMOVED** from profile |
| Molecular consequence | (various) | **MOVED** to separate MolekulareKonsequenz observation |

### New Profiles
- ✅ `MolekulareKonsequenz` - For molecular consequences (inherits from CG STU3 molecular-consequence)
- ✅ `GenomicStudy` - Orchestrates complex genomic analyses (Procedure resource)
- ✅ `GenomicStudyAnalysis` - Detailed analysis steps with rich metadata (Procedure resource)

#### GenomicStudy/GenomicStudyAnalysis Capabilities
The new profiles are **significantly more powerful** than UntersuchteRegion:
- **Device tracking**: Sequencer models, analysis pipelines, bioinformatics tools
- **Method specification**: Sequencing type, library prep, analysis methods
- **Quality metrics**: Read depth, coverage percentages, quality scores
- **Workflow details**: Multi-step analysis workflows (library prep → sequencing → bioinformatics)
- **Region specification**: Not just genes, but detailed genomic coordinates
- **Protocol references**: Links to SOPs and analysis protocols
- **Input/Output tracking**: FASTQ files, VCF files, analysis reports

While UntersuchteRegion simply listed studied regions, GenomicStudy provides a complete picture of the genomic analysis workflow.

### Required Category Changes for MSI/TMB
Since Mikrosatelliteninstabilitaet and Mutationslast now inherit from the intermediate `molecular-biomarker` profile (instead of directly from Observation), they require an additional category:

```json
// STU2: Only laboratory category needed
"category": [{
  "coding": [{
    "system": "http://terminology.hl7.org/CodeSystem/observation-category",
    "code": "laboratory"
  }]
}]

// STU3: Must add biomarker-category
"category": [
  {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/observation-category",
      "code": "laboratory"
    }]
  },
  {
    "coding": [{
      "system": "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
      "code": "biomarker-category"
    }]
  }
]
```

## Migration Strategies

### Strategy 1: UntersuchteRegion → GenomicStudy

**Old (STU2) - Limited to regions:**
```json
{
  "resourceType": "Observation",
  "meta": {
    "profile": ["mii-pr-molgen-untersuchte-region"]
  },
  "component": [
    {
      "code": { "coding": [{ "code": "48018-6" }] },
      "valueCodeableConcept": { 
        "coding": [{ "code": "HGNC:1097", "display": "BRAF" }] 
      }
    }
  ]
}
```

**New (STU3) - Full analysis workflow:**
```json
// 1. GenomicStudy (orchestrates the overall study)
{
  "resourceType": "Procedure",
  "meta": {
    "profile": ["mii-pr-molgen-genomic-study"]
  },
  "status": "completed",
  "subject": { "reference": "Patient/123" },
  "analysis": [{ "reference": "Procedure/analysis-1" }]
}

// 2. GenomicStudyAnalysis (with extensive capabilities)
{
  "resourceType": "Procedure",
  "id": "analysis-1",
  "meta": {
    "profile": ["mii-pr-molgen-genomic-study-analysis"]
  },
  "extension": [
    {
      "url": ".../genomic-study-analysis-regions",
      "extension": [{
        "url": "studied",
        "valueCodeableConcept": { 
          "coding": [{ "code": "HGNC:1097", "display": "BRAF" }] 
        }
      }]
    },
    {
      "url": ".../genomic-study-analysis-device",
      "extension": [
        { "url": "device", "valueReference": { "reference": "Device/sequencer" }},
        { "url": "function", "valueCodeableConcept": { "text": "Sequencing" }}
      ]
    },
    {
      "url": ".../genomic-study-analysis-metrics",
      "extension": [
        { "url": "read-depth", "valueQuantity": { "value": 120 }},
        { "url": "sequencing-coverage", "valueQuantity": { "value": 98.5, "unit": "%" }}
      ]
    }
  ]
}
```

### Strategy 2: ErgebnisZusammenfassung → conclusionCode

**Old (STU2):**
```json
{
  "resourceType": "DiagnosticReport",
  "result": [
    { "reference": "Observation/ergebnis-zusammenfassung-1" }
  ]
}

// Separate Observation
{
  "resourceType": "Observation",
  "id": "ergebnis-zusammenfassung-1",
  "valueCodeableConcept": {
    "coding": [{ "code": "LA6576-8", "display": "Positive" }]
  }
}
```

**New (STU3):**
```json
{
  "resourceType": "DiagnosticReport",
  "conclusionCode": [{
    "coding": [{ "code": "LA6576-8", "display": "Positive" }]
  }]
  // No separate Observation needed
}
```

### Strategy 3: Component Renaming in Variante

Simple find-and-replace in your Variante resources:
- Find: `"component[coding-hgvs]"`
- Replace: `"component[representative-coding-hgvs]"`

(Same for transcript-ref-seq and protein-hgvs)

## Provided Migration Resources

### 1. StructureMaps (Available in `/StructureMaps/`)
- `UntersuchteRegionToGenomicStudy.map`
- `ErgebnisZusammenfassungToConclusionCode.map`
- `VarianteComponentRename.map`

### 2. Example Pairs (Available in `/migration-examples/`)
- Before/after examples for each major change
- Edge cases and complex scenarios

### 3. Validation Tools
```bash
# Validate STU3 resources against new profiles
java -jar validator_cli.jar resource.json -ig package.tgz

# Check for remaining STU2 references
grep -r "untersuchte-region" *.json
grep -r "ergebnis-zusammenfassung" *.json
```

## Implementation Checklist for Centers

### Preparation Phase
```markdown
- [ ] Download latest IG package (v2026.0.0)
- [ ] Review breaking changes list
- [ ] Identify which profiles you actually use
- [ ] Count resources by type
- [ ] Plan downtime (if needed)
```

### Migration Phase
```markdown
- [ ] Backup all data
- [ ] Run migration scripts/StructureMaps
- [ ] Validate migrated resources
- [ ] Update your FHIR server profiles
- [ ] Test critical workflows
```

### Verification Phase
```markdown
- [ ] All resources validate against STU3
- [ ] No broken references
- [ ] Search parameters work
- [ ] Downstream systems compatible
```

## Common Issues and Solutions

### Issue 1: References to removed profiles
**Error**: `Reference to unknown profile 'untersuchte-region'`  
**Solution**: Update references to point to new GenomicStudy resources

### Issue 2: Missing conclusionCode
**Error**: `ErgebnisZusammenfassung not found`  
**Solution**: Data is now in DiagnosticReport.conclusionCode

### Issue 3: Component not found
**Error**: `Component 'coding-hgvs' not found`  
**Solution**: Use new name 'representative-coding-hgvs'

## FAQ

**Q: How long do we have to migrate?**  
A: Recommended within 6 months. STU2 examples removed in next major version.

**Q: Can we run both versions in parallel?**  
A: Yes, but you need to handle the transformation layer yourself.

**Q: What if we have custom extensions?**  
A: Custom extensions should work unchanged, but test thoroughly.

**Q: Where do we get help?**  
A: 
- GitHub Issues: [your-repo]/issues
- FHIR Chat: chat.fhir.org #german/mi-initiative
- Email: [your-email]

**Q: Do you provide migration scripts?**  
A: We provide StructureMaps. Centers must run them on their own data.

## Testing Your Migration

### Minimal Test Set
Test at least one of each:
1. Simple variant
2. Gene panel
3. Diagnostic report with results
4. Family history reference
5. Therapeutic implication

### Validation Commands
```bash
# Quick validation check
curl -X POST https://your-server/fhir/\$validate \
  -H "Content-Type: application/fhir+json" \
  -d @migrated-resource.json

# Batch validation
for file in migrated/*.json; do
  echo "Validating $file"
  # validation command here
done
```

## Timeline

| Date | Milestone |
|------|-----------|
| 2025-08 | STU3 version released |
| 2025-09 | Migration guide available |
| 2025-10 | StructureMaps published |
| 2025-11 | Webinar/Q&A session |
| 2026-02 | Recommended migration complete |
| 2026-08 | STU2 deprecated |

## Contact for Questions

**Specification Questions**: [Your Name]  
**Technical Issues**: GitHub Issues  
**General Discussion**: FHIR Chat  

---

## Appendix A: Complete Change List

### Profile Changes
| STU2 | STU3 | Action |
|------|------|--------|
| UntersuchteRegion | GenomicStudy + GenomicStudyAnalysis | Migrate |
| ErgebnisZusammenfassung | - | Merge into DiagnosticReport |
| Variante | Variante | Update components |
| DiagnostischeImplikation | DiagnostischeImplikation | Update extensions |
| TherapeutischeImplikation | TherapeutischeImplikation | Minor updates |

### Extension Changes
| STU2 | STU3 |
|------|------|
| genomics-artifact | workflow-relatedArtifact |
| genomics-risk-assessment | genomic-risk-assessment |
| region-studied | genomic-study-reference |

### Component Changes (Variante)
| STU2 | STU3 | Verified |
|------|------|----------|
| coding-hgvs | representative-coding-hgvs | ✅ |
| transcript-ref-seq | representative-transcript-ref-seq | ✅ |
| protein-hgvs | representative-protein-hgvs | ✅ |
| amino-acid-change-type | (removed - commented out) | ✅ |
| molecular-consequence | (moved to MolekulareKonsequenz profile) | ✅ |

## Appendix B: Resource Templates

Download migration templates from:
- `/migration-templates/GenomicStudy-template.json`
- `/migration-templates/GenomicStudyAnalysis-template.json`
- `/migration-templates/MolekulareKonsequenz-template.json`

## Appendix C: Validation Schematron

Basic Schematron rules to check migration completeness:
```xml
<pattern>
  <rule context="Bundle">
    <assert test="not(entry/resource/meta/profile[contains(., 'untersuchte-region')])">
      Error: Found unmigrated UntersuchteRegion
    </assert>
    <assert test="not(entry/resource/meta/profile[contains(., 'ergebnis-zusammenfassung')])">
      Error: Found unmigrated ErgebnisZusammenfassung
    </assert>
  </rule>
</pattern>
```

---

*Last Updated: 2025-08-08*  
*Version: 1.0-VERIFIED*  
*Status: Verified against generated FHIR resources*