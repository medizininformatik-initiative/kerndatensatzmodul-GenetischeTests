# Profile and Example Tracking - MII Genetic Testing Module

## Overview
This document tracks the status of all FHIR profiles, examples, and their relationships for the MII Genetic Testing (Molekulargenetischer Befundbericht) module.

## Current Status Summary
- **Profiles**: 15 active profiles, 2 commented out
- **Examples**: ~129 instances total
- **Major Changes**: Migration from CG STU2 to STU3, profile restructuring

## Profile Status Matrix

| Profile | Status | Parent Profile | Must Support Elements | Examples | Logical Model Mapping | Notes |
|---------|--------|----------------|----------------------|----------|----------------------|-------|
| **MII_PR_MolGen_AnforderungGenetischerTest** | ✅ Active | ServiceRequest | ✓ | mii-exa-molgen-anforderung-* | ✓ | Request for genetic testing |
| **MII_PR_MolGen_DiagnostischeImplikation** | ✅ Active | CG STU3 diagnostic-implication | ✓ | mii-exa-molgen-diagnostische-implikation-* | ✓ | Disease risk assessment |
| **MII_PR_MolGen_EmpfohleneFolgemassnahme** | ✅ Active | Task | ✓ | mii-exa-molgen-folgemassnahme-* | ✓ | Follow-up recommendations |
| **MII_PR_MolGen_ErgebnisZusammenfassung** | ❌ Commented Out | N/A | N/A | ❌ Commented | ❌ Removed | Redundant - use GenomicReport.conclusion |
| **MII_PR_MolGen_Familienanamnese** | ✅ Active | FamilyMemberHistory | ✓ | mii-exa-molgen-family-member-history-* | ✓ | Family history |
| **MII_PR_MolGen_GenomicStudy** | ✅ Active | GenomicStudy | ✓ | mii-exa-molgen-genomic-study-* | ⚠️ Needs Update | NEW: Study metadata |
| **MII_PR_MolGen_GenomicStudyAnalysis** | ✅ Active | GenomicStudyAnalysis | ✓ | TBD | ⚠️ Needs Update | NEW: Analysis details |
| **MII_PR_MolGen_Genotyp** | ✅ Active | CG STU3 genotype | ✓ | mii-exa-molgen-genotyp-* | ✓ | Genotype information |
| **MII_PR_MolGen_Medikationsempfehlung** | ✅ Active | CG STU3 medication-recommendation | ✓ | mii-exa-molgen-medikationsempfehlung-* | ✓ | Medication recommendations |
| **MII_PR_MolGen_Mikrosatelliteninstabilitaet** | ✅ Active | CG STU3 molecular-biomarker | ✓ | mii-exa-molgen-mikrosatelliteninstabilitaet-* | ✓ | MSI status |
| **MII_PR_MolGen_MolekulareKonsequenz** | ✅ Active | CG STU3 molecular-consequence | ✓ | mii-exa-molgen-molekulare-konsequenz-* | ⚠️ Needs Update | NEW: Molecular consequence |
| **MII_PR_MolGen_MolekulargenetischerBefundbericht** | ✅ Active | CG STU3 genomics-report | ✓ | mii-exa-molgen-molekulargenetischer-befundbericht-* | ⚠️ Needs Update | Main diagnostic report |
| **MII_PR_MolGen_Mutationslast** | ✅ Active | CG STU3 molecular-biomarker | ✓ | mii-exa-molgen-mutationslast-* | ✓ | Tumor mutation burden |
| **MII_PR_MolGen_PolygenerRisikoScore** | ✅ Active | RiskAssessment | ✓ | mii-exa-molgen-prs-* | ✓ | Polygenic risk score |
| **MII_PR_MolGen_TherapeutischeImplikation** | ✅ Active | CG STU3 therapeutic-implication | ✓ | mii-exa-molgen-therapeutische-implikation-* | ✓ | Therapeutic implications |
| **MII_PR_MolGen_UntersuchteRegion** | ❌ Commented Out | N/A | N/A | ❌ All commented | ❌ Removed | Replaced by GenomicStudy/Analysis |
| **MII_PR_MolGen_Variante** | ✅ Active | CG STU3 variant | ✓ | mii-exa-molgen-variante-* | ⚠️ Needs Update | Genetic variants |

## Major Changes in 2026.0.0-alpha

### CG STU2 → STU3 Migration
- **New Profiles**: MolekulareKonsequenz, GenomicStudy, GenomicStudyAnalysis
- **Removed Profiles**: ErgebnisZusammenfassung, UntersuchteRegion
- **Updated Parents**: All observation profiles now inherit from CG STU3 equivalents

### Profile Changes Summary
1. **DiagnostischeImplikation**: 
   - Replaced `extension[genomic-artifact]` with `extension[workflow-relatedArtifact]`
   - Moved `component[functional-effect]` to MolecularConsequence
   
2. **MolekulargenetischerBefundbericht**:
   - Now inherits from `genomic-report` (not `genomics-report`)
   - Removed `[overall]` slice
   - Combined extensions for artifacts and files into `[workflow-relatedArtifact]`
   - Updated extension names

3. **Mikrosatelliteninstabilitaet** & **Mutationslast**:
   - Now inherit from STU3 Molecular Biomarker
   - Removed `component[conclusion-string]`

4. **Variante**:
   - Renamed multiple components (added "representative-" prefix)
   - Removed `component[amino-acid-change-type]`
   - Moved `component[molecular-consequence]` to separate profile

5. **TherapeutischeImplikation**:
   - Removed `component[prognosis]`
   - Renamed `component[predicted-therapeutic-implication]` to `component[therapeutic-implication]`

## Example Status

### Transaction Bundles
| Bundle | Status | Core Resources | Profile Examples | Region Examples |
|--------|--------|----------------|------------------|-----------------|
| **mii-exa-befund-bundle-1-braf** | ✅ Active | Patient, Practitioners | ✓ | ❌ Commented out |
| **mii-exa-molgen-bundle-fam-his-breast-ovar-can** | ✅ Active | BRCA1 patient | ✓ | ❌ All regions commented |
| **mii-exa-molgen-bundle-befund-2-nipbl** | ✅ Active | NIPBL patient | ✓ | ❌ All regions commented |
| **mii-exa-befund-bundle-befund-2-nipbl-clinical** | ✅ Active | Clinical context | ✓ | ❌ Regions commented |
| **mii-exa-befund-bundle-befund-srcc** | ✅ Active | SRCC patient | ✓ | ❌ All regions commented |
| **mii-exa-befund-bundle-befund-fgfr2-fusion** | ✅ Active | FGFR2 patient | ✓ | N/A |

### Individual Examples Status
- **Core Examples**: ✅ Most examples updated for STU3
- **UntersuchteRegion Examples**: ❌ All commented out (replaced by GenomicStudy)
- **ErgebnisZusammenfassung Examples**: ❌ All commented out (profile removed)

## Logical Model Mapping Status

| Component | Status | Notes |
|-----------|--------|-------|
| **Base Logical Model** | ✅ Complete | Main logical model exists |
| **Variante Mappings** | ⚠️ Needs Update | Component renaming requires mapping updates |
| **MolekulareKonsequenz Mappings** | ❌ Missing | New profile needs logical model integration |
| **GenomicStudy Mappings** | ❌ Missing | New profiles need logical model entries |
| **DiagnostischeImplikation Mappings** | ⚠️ Needs Update | Extension changes require mapping updates |

## Six Core Components Consistency Check

### 1. Logical Model
- ✅ **Base Model**: Complete
- ⚠️ **Updates Needed**: New profiles (GenomicStudy, MolekulareKonsequenz)
- ⚠️ **Mappings**: Component renaming in Variante needs updates

### 2. FHIR Mappings
- ⚠️ **Status**: Outdated due to STU3 migration
- ❌ **Missing**: New profile mappings
- ⚠️ **Updates Needed**: Extension path changes

### 3. Profile Definitions
- ✅ **Status**: Most profiles updated for STU3
- ✅ **Active Profiles**: 15 of 17 profiles active

### 4. IG Documentation
- ⚠️ **Status**: Needs updates for STU3 changes
- ❌ **Missing**: Documentation for new profiles
- ⚠️ **Updates Needed**: Component descriptions, examples

### 5. SearchParameters
- ⚠️ **Status**: May need updates for new components
- ❌ **Review Needed**: GenomicStudy search parameters
- ⚠️ **Component Searches**: Variante component renaming impact

### 6. CapabilityStatement
- ✅ **Status**: Updated for new profiles
- ✅ **Added**: GenomicStudy, GenomicStudyAnalysis, MolekulareKonsequenz, PolygenerRisikoScore profiles
- ✅ **Removed**: ErgebnisZusammenfassung, UntersuchteRegion (commented profiles)
- ✅ **Version**: Updated to 2026.0.0-alpha

## Immediate Tasks Required

### High Priority
1. **Update Logical Model**: Add mappings for new profiles (GenomicStudy, MolekulareKonsequenz)
2. **Fix Component Mappings**: Update Variante component name mappings  
3. ✅ **Update CapabilityStatement**: Add new profiles with #SHALL expectation (COMPLETED)
4. **Create GenomicStudy Examples**: Replace commented UntersuchteRegion examples

### Medium Priority
1. **Update SearchParameters**: Review and add for new profiles
2. **Update IG Documentation**: Document STU3 migration changes
3. **Bundle Verification**: Ensure all bundles compile with new profiles
4. **Example Validation**: Test all examples against updated profiles

### Low Priority
1. **Release Notes**: Complete documentation of all changes
2. **Migration Guide**: Document STU2→STU3 upgrade path
3. **Example Optimization**: Create realistic clinical scenarios

## Dependencies and Blockers

- **CG STU3 Package**: Dependency on Clinical Genomics STU3 package
- **MII Core Modules**: Dependencies on person, diagnose, biobank modules
- **Terminology Updates**: LOINC, SNOMED CT, HGNC code updates

## Notes
- UntersuchteRegion examples: ~60+ examples commented out, need GenomicStudy replacements
- Bundle integrity: All transaction bundles maintain core resources but miss regional data
- Example count: Significant reduction due to commented profiles/examples
- Testing: Full validation pipeline needed after logical model updates