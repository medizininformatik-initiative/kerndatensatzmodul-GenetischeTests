# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **MII Kerndatensatz Modul Genetische Tests** - a FHIR Implementation Guide for genetic testing data within the German Medical Informatics Initiative (MII). The project defines FHIR profiles and implementation guidance for molecular genetic data standardization.

## Core Technologies & Architecture

- **FHIR R4 (4.0.1)**: Healthcare interoperability standard
- **FSH (FHIR Shorthand)**: Domain-specific language for authoring FHIR profiles
- **SUSHI**: FSH compiler that generates FHIR resources
- **IG Publisher**: FHIR Implementation Guide publishing tool
- **Jekyll**: Static site generator for documentation

## Development Commands

### Building and Validation
```bash
# Generate FHIR resources from FSH files
sushi

# Build Implementation Guide (calls sushi internally)
./_genonce.sh      # Linux/macOS
./_genonce.bat     # Windows

# Update IG Publisher
./_updatePublisher.sh    # Linux/macOS
./_updatePublisher.bat   # Windows
```

**Note**: User runs `sushi` manually due to timeout considerations. Claude should focus on analysis and fixes rather than compilation commands.

## Code Architecture

### FSH File Organization

The FSH source files are organized in `input/fsh/`:

- **Main profiles**: Core genetic testing profiles
- **rulesets/**: Reusable FSH rule definitions
- **aliases.fsh**: Central alias definitions for code systems and value sets
- **extensions.fsh**: Custom extensions for genetic testing data elements

### Key Profile Patterns

1. **Profile Inheritance**: Most profiles extend MII core modules or German base profiles
2. **Terminology Binding**: Extensive use of genetic testing terminologies (LOINC, SNOMED CT, HGNC, HGVS)
3. **Extensions**: Custom extensions for genetic testing-specific data elements
4. **Slicing**: Complex slicing patterns for supporting multiple code systems
5. **Mapping**: Logical model mapping included in profile definitions

### Naming Conventions

- **Profiles**: `mii-pr-molgen-[domain]-[specific]` (e.g., `mii-pr-molgen-variante`)
- **Code Systems**: `mii-cs-molgen-[domain]` 
- **Value Sets**: `mii-vs-molgen-[domain]`
- **Extensions**: `mii-ex-molgen-[purpose]`

### Dependencies

Key FHIR package dependencies:
- `de.basisprofil.r4`: German base profiles
- `de.medizininformatikinitiative.kerndatensatz.*`: MII core modules
- `hl7.fhir.uv.genomics-reporting`: Clinical Genomics Reporting STU3 (current migration)

## Quality Assurance

### FHIR Validation Management

The project uses systematic validation management to ensure quality:

#### Validation Workflow
1. **Pipeline Validation**: Validation runs in organization-wide pipeline with terminology server (not locally)
2. **Error Tracking**: Use `known_errors.txt` as validation source of truth
3. **Error Suppression**: Configure `advisor.json` for acceptable errors (external dependencies, wontfix items)
4. **Error Extraction**: Use Grep with multiple error patterns for large validation.html files

#### Error Categories
- **Terminology errors**: ValueSet/CodeSystem issues - HIGH priority
- **Example URL errors**: Prohibited example URLs - MEDIUM priority  
- **Invalid resource target type errors**: HIGH priority
- **Profile matching/slicing errors**: MEDIUM priority
- **Code system version errors**: HIGH priority

## Six Core Components Requiring Consistency

**CRITICAL**: After development phase, changes must cascade through all components:

1. **Logical Model** (FSH logical models)
2. **FHIR Mappings** (within logical model)
3. **Profile Definitions** (FSH profiles in `input/fsh/`)
4. **IG Documentation** (Implementation Guide pages)
5. **SearchParameters** (FHIR search capabilities)
6. **CapabilityStatement** (Server capability declarations)

## FHIR Bundle Best Practices

### Transaction Bundle Requirements
- **Bundle Type**: Always use `#transaction` for atomic operations
- **Entry Structure**: Every entry requires:
  - `fullUrl`: Unique resource reference
  - `resource`: The actual FHIR resource instance
  - `request.method = #POST`: HTTP method for resource creation
  - `request.url`: Target resource type (e.g., "Patient", "Observation")
- **Reference Architecture**: Use concrete instances, avoid placeholder references in bundles
- **Status Codes**: Use full URIs for FHIR status codes

### Hybrid Bundle Strategy
For genetic testing modules, use a **hybrid approach**:

#### Individual Examples (Standalone)
- **Location**: Separate FSH files
- **References**: Use placeholder references (`Patient/example`)
- **Purpose**: Profile validation and individual documentation
- **Naming**: Follow pattern `mii-exa-molgen-[profile]-[variant]`

#### Bundle Examples (Transaction)
- **Location**: Bundle FSH files
- **Core Resources**: Create concrete instances:
  - `mii-exa-molgen-bundle-patient`
  - `mii-exa-molgen-bundle-encounter`
- **Profile Examples**: Reference existing individual examples in bundle entries
- **Benefits**: No duplication, clean separation, server-consumable

## Must Support Elements & Search Parameters

### Search Parameter Requirements
When marking elements as Must Support, ensure corresponding search capabilities:

#### Standard FHIR Search Parameters
- `subject`, `patient`, `encounter`: Standard reference searches
- `status`, `code`: Standard token searches
- `focus`: Standard reference searches (for Observations)

#### Custom Search Parameters for Genetic Testing
- **Component-level searches**: Genetic variant components
- **Terminology searches**: HGNC, HGVS value searches
- **Profile-specific searches**: Genetic study references

### Must Support Implementation
Location: `input/fsh/SearchParameter.fsh`

Pattern for genetic testing search parameters:
```fsh
Instance: mii-sp-molgen-variant-component
InstanceOf: SearchParameter
* name = "MII_SP_MolGen_Variant_Component"
* code = #variant-component
* base = #Observation
* type = #composite
* expression = "Observation.component.where(code.coding.system='http://loinc.org')"
```

## CapabilityStatement Management

### Location and Structure
- **File**: `input/fsh/CapabilityStatement.fsh`
- **Purpose**: Declares all supported profiles, interactions, and search parameters

### Profile Integration Pattern
```fsh
// Genetic testing profiles
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-variante, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-diagnostische-implikation, #SHALL)
```

### Update Requirements
For each new profile:
1. **Profile Registration**: Add with `#SHALL` expectation
2. **Search Parameter Coverage**: Include custom search parameters
3. **Resource Type Coverage**: Verify all base resource types covered
4. **Version Consistency**: Update version and date

## Implementation Guide Documentation

### Profile Page Structure
Located in implementation guide directories:

#### Required Sections
1. **Frontmatter**:
   ```yaml
   ---
   parent: 
   topic: ProfileName
   subject: [StructureDefinition URL]
   ---
   ```

2. **Content Structure**:
   - `{{page-title}}` header
   - **Inhalt**: Profile description and clinical context
   - **Verknüpfungen zu anderen Ressourcen**: Resource relationships
   - **Terminologie-Binding**: Binding strength explanation
   - **ValueSet rendering**: For CodeableConcept bindings
   - **Profile metadata**: FQL query for technical details
   - **Beispiele**: JSON examples using `{{json:example-name}}`

### TOC File Management
**CRITICAL**: New folders/files must be added to corresponding `toc.yml` files:

```yaml
- name: "Genetische Varianten"
  filename: "GenetischeVarianten"
```

## Post-Development Verification Workflow

### 1. Bundle Compilation Verification
```bash
# Verify FSH compilation succeeds
sushi

# Check for compilation errors
grep -i "error\|failed" output/build.log
```

### 2. Reference Integrity Check
- **Bundle References**: Verify all individual examples reference bundle core resources
- **IG Page References**: Ensure Implementation Guide pages reference correct instance IDs
- **Cross-Reference Validation**: Check that references point to existing instances

### 3. Profile Coverage Validation
- **CapabilityStatement**: Ensure all new profiles declared with `#SHALL`
- **Search Parameters**: Verify Must Support elements have corresponding search capabilities
- **Logical Model**: Confirm all profiles have corresponding logical model entries

### 4. Terminology Consistency
- **ValueSet Bindings**: Check all CodeSystem/ValueSet references resolve
- **Standard Terminology**: Prefer LOINC/SNOMED CT/HGNC/HGVS over custom codes
- **Binding Validation**: Ensure terminology binding validation passes

### 5. Documentation Completeness
- **IG Pages**: Each profile requires individual Implementation Guide page
- **TOC Files**: All new directories/files added to corresponding `toc.yaml`
- **Bundle Examples**: Transaction bundles demonstrate complete workflows

### 6. Example Validation
- **Reference Matching**: Individual examples must reference bundle core resources
- **Clinical Realism**: Examples represent realistic genetic testing scenarios
- **Bundle Integrity**: Transaction bundles must be server-consumable

## Common Patterns When Editing

1. **Adding new profiles**: Follow naming conventions and include logical model mappings
2. **Terminology updates**: Update both CodeSystem definitions and ValueSets
3. **Profile modifications**: Update examples and ensure compliance with invariants
4. **Version management**: Update version numbers in `sushi-config.yaml`

## File Structure Context

- **input/**: Source files for IG generation
- **fsh-generated/**: Auto-generated FHIR resources from FSH
- **output/**: Generated Implementation Guide HTML
- **implementation-guides/**: Multi-version IG configurations

## Current Project Status (2026.0.0-alpha)

### Major Migration: Clinical Genomics STU2 → STU3
The project is currently migrating from Clinical Genomics Reporting STU2 to STU3, which involves:

#### Profile Changes
- **New Profiles**: MolekulareKonsequenz, GenomicStudy, GenomicStudyAnalysis
- **Removed Profiles**: ErgebnisZusammenfassung, UntersuchteRegion (commented out)
- **Updated Inheritance**: All observation profiles now inherit from CG STU3

#### Component Restructuring
- **Variante**: Component renaming (added "representative-" prefix), moved molecular-consequence
- **DiagnostischeImplikation**: Extension changes, functional-effect moved to MolekulareKonsequenz
- **Mikrosatelliteninstabilitaet/Mutationslast**: Now inherit from molecular-biomarker

#### Example Status
- **Active Examples**: ~70 examples remain active
- **Commented Examples**: ~60+ UntersuchteRegion examples commented out
- **Bundle Status**: Transaction bundles maintained but miss regional data

### Current Blockers
1. **GenomicStudy Examples**: Need replacement for commented UntersuchteRegion examples
2. **Logical Model**: Missing mappings for new profiles (GenomicStudy, MolekulareKonsequenz)
3. **Component Mappings**: Variante component renaming requires mapping updates
4. **CapabilityStatement**: Missing new profiles

### Priority Tasks
- **High**: CapabilityStatement updates, compilation verification
- **Medium**: Logical model updates, SearchParameter review
- **Low**: Example migration (GenomicStudy), documentation updates

## Development Lifecycle

### Pre-Development
1. **Profile Planning**: Align with logical model and existing patterns
2. **Terminology Research**: Check existing LOINC/SNOMED CT/HGNC codes before creating custom
3. **Bundle Architecture**: Plan reference patterns early
4. **STU3 Compatibility**: Ensure new profiles align with Clinical Genomics STU3

### Development Phase
1. **Incremental Validation**: Run `sushi` frequently during development
2. **Reference Tracking**: Maintain consistency between examples and bundles
3. **Documentation Updates**: Update IG pages as profiles evolve
4. **STU3 Migration**: Update parent profiles and component references

### Quality Gates
- **Bundle Compilation**: Verify FSH compilation succeeds with STU3 dependencies
- **Reference Integrity**: Check all cross-references resolve (especially post-STU3)
- **Profile Coverage**: Update CapabilityStatement for new profiles
- **Documentation Completeness**: Verify IG pages and TOC entries
- **Terminology Validation**: Ensure all bindings resolve correctly with STU3