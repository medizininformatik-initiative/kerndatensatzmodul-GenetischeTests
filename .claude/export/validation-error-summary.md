# Validation Error Summary (139 errors total)

Generated from CI run: https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/actions/runs/19761817909

## Error Categories

### 1. LOINC Filter Errors (44 errors) ⚠️ SUPPRESS
- **Error**: "There is no declared filter called LIST on code system http://loinc.org"
- **Cause**: Terminology server doesn't support LIST filter operation
- **Action**: Add to advisor.json suppression

### 2. CapabilityStatement Extension Errors (7 errors) 🔧 FIX
- **Error**: Extension `capabilitystatement-expectation` not allowed on `.rest.resource.profile`
- **Cause**: Using extension on wrong element (should be on supportedProfile, not profile)
- **Action**: Fix CapabilityStatement.fsh

### 3. ICD-10 Unknown Codes (7 errors) 🔧 FIX
- **C22.1**: 5 occurrences - Hepatocellular carcinoma
- **C16.9**: 2 occurrences - Stomach, unspecified
- **Cause**: Codes not in terminology server's ICD-10-GM version
- **Action**: Update to valid codes or suppress if codes are valid in newer versions

### 4. Wrong Display Names (12 errors) ⚠️ SUPPRESS/FIX
- LOINC #94077-5: Using "Whole exome sequence" instead of "Tumor mutation burden"
- LOINC #93044-6: Using "Variant confidence" instead of "Level of evidence"
- SNOMED #706689003: Using "Nucleic acid extraction" instead of "Application program"
- LOINC #LA26811-2: Using "Hybridization-based capture" instead of "Computational analysis"
- LOINC #LA26806-2: Using "Computational analysis" instead of "GRCh38"
- tbd-codes-cs #molecular-consequence: Using "Molekulare Konsequenz" instead of "Molecular Consequence"
- **Action**: Fix display names or add display-hints extension

### 5. Biomarker Slice Matching (6 errors) 🔧 FIX
- **3x**: biomarker + tumor-mutation-burden
- **3x**: biomarker + microsatellite-instability
- **Cause**: DiagnosticReport.result slices not discriminating properly
- **Action**: Sharpen slice discriminators in DiagnosticReport profile

### 6. MIME Type Errors (10 errors) 🔧 FIX
- **application/gzip**: 4 errors
- **text/plain**: 4 errors
- **image/png**: 2 errors
- **Cause**: System URI not provided (missing `urn:ietf:rfc:3986` system)
- **Action**: Add system to MIME type codings

### 7. Unknown Codes (17 errors) 🔧 FIX/SUPPRESS
- **GENOMIC** in v3-ObservationValue: 4 errors (should be valid code)
- **HGNC fusion format** (HGNC:3689::HGNC:2697): 3 errors (fusion genes)
- **ORPHA:145**: 2 errors (Orphanet code not found)
- **SNOMED #234123001**: 2 errors (code not found)
- **BED** in v3-ObservationValue: 1 error
- **high** in tbd-codes-cs: 1 error
- **Action**: Verify codes or suppress if valid

### 8. Example URLs Not Allowed (8 errors) 🔧 FIX
- example.org URLs in examples:
  - coverage_wes_2024001.png
  - sample_R1.fastq.gz
  - sample_R2.fastq.gz
  - agilent_v7_targets.bed
- **Action**: Change to relative URLs or use proper base URL

### 9. HGVS Missing Code (2 errors) 🔧 FIX
- **Error**: "No code provided" for HGVS nomenclature ValueSet
- **Action**: Add HGVS codes to variant components

### 10. Pattern Mismatch (2 errors) 🔧 FIX
- **Error**: Code is 'molecular-consequence' but fixed to 'diagnostic-implication'
- **Cause**: Observation using wrong profile
- **Action**: Update example to use correct profile

## Prioritized Action Plan

### HIGH Priority (Must Fix)
1. CapabilityStatement extension placement (7 errors)
2. Biomarker slice discrimination (6 errors)
3. ICD-10 code validity (7 errors)

### MEDIUM Priority (Should Fix)
4. MIME type system URIs (10 errors)
5. Example URLs (8 errors)
6. Wrong display names (12 errors)
7. Profile/pattern mismatches (2 errors)

### LOW Priority (Can Suppress)
8. LOINC filter errors (44 errors) - Already suppressed
9. Unknown codes if valid in source terminologies

## Summary by Fix Type

- **Suppressible**: ~50 errors (LOINC filter + some display names + valid codes)
- **Code fixes**: ~40 errors (ICD-10, MIME types, example URLs, HGVS)
- **Profile fixes**: ~15 errors (CapabilityStatement, slicing, patterns)
- **Example fixes**: ~34 errors (display names, URLs, profile references)
