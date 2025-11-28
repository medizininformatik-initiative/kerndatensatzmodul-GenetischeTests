# Code Verification Results

## ✅ VALID Codes (Can Suppress Validation Errors)

### ICD-10-GM Codes
- **C22.1**: ✅ VALID - "Intrahepatisches Gallengangskarzinom"
  - Used in: fgfr2-fusion examples
  - Action: SUPPRESS validation error (terminology server issue)

- **C16.9**: ✅ VALID - "Bösartige Neubildung: Magen, nicht näher bezeichnet"
  - Action: SUPPRESS validation error (terminology server issue)

### Orphanet Codes
- **145** (without prefix): ✅ VALID - "Hereditary breast and/or ovarian cancer syndrome"
  - Found in terminology server version 2025
  - Used in: Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.json, ServiceRequest-mii-exa-molgen-anforderung-trurisk-panel.json

## ❌ INVALID Codes (Must Fix)

### Orphanet Format Error
- **ORPHA:145**: ❌ WRONG FORMAT
  - Should be: `"code": "145"` (without ORPHA: prefix)
  - System is already: `http://www.orpha.net`
  - Files to fix:
    - Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.json
    - ServiceRequest-mii-exa-molgen-anforderung-trurisk-panel.json
  - **Action**: FIX - remove "ORPHA:" prefix

### SNOMED Code
- **234123001**: ❌ NOT FOUND in SNOMED CT (version 20250701)
  - **Action**: Need to find correct SNOMED code or remove

### v3-ObservationValue Codes
- **GENOMIC**: ❌ NOT FOUND in v3-ObservationValue CodeSystem
  - Used in: Bundle-mii-exa-molgen-bundle-comprehensive-wes.json, DocumentReference
  - **Action**: Need to verify correct code system (might be wrong system URI)

- **BED**: ❌ NOT FOUND in v3-ObservationValue
  - **Action**: Need to verify correct code system

## 🔍 Needs Further Investigation

### HGNC Fusion Notation
- **HGNC:3689::HGNC:2697**: Format for fusion genes (double colon)
  - Standard HGNC fusion notation
  - Terminology server may not support $lookup for fusion genes
  - **Recommendation**: Check if this is expected format, likely SUPPRESS

### tbd-codes-cs
- **high**: Unknown code in tbd-codes-cs v3.0.0
  - **Action**: Verify if this exists in Clinical Genomics Reporting STU3

## Summary

| Category | Valid | Invalid | Needs Investigation |
|----------|-------|---------|-------------------|
| ICD-10-GM | 2 | 0 | 0 |
| Orphanet | 1 (wrong format) | 0 | 0 |
| SNOMED CT | 0 | 1 | 0 |
| v3-ObservationValue | 0 | 2 | 0 |
| HGNC | 0 | 0 | 1 |
| tbd-codes-cs | 0 | 0 | 1 |

## Recommended Actions

### Immediate Fixes
1. Change `ORPHA:145` → `145` in 2 files
2. Remove or replace SNOMED #234123001
3. Investigate GENOMIC/BED code system (might need different system URI)

### Suppressions to Add
```json
{
  "suppress": [
    "Unknown code 'C22.1' in the CodeSystem 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'",
    "Unknown code 'C16.9' in the CodeSystem 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'",
    "Unknown code 'HGNC:*::HGNC:*' in the CodeSystem 'http://www.genenames.org/geneId'"
  ]
}
```
