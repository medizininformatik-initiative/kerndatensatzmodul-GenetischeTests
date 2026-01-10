---
name: mii-testdata-contribution
description: Guide for contributing test data to the MII (Medizininformatik-Initiative) testdata repository. Use when adding new module test data, understanding testdata repository patterns, creating transaction bundles, or adapting existing module examples for the testdata repo. Triggers on requests like "add testdata for module X", "create test bundle", "contribute to mii-testdata", or "adapt examples for testdata repo".
---

# MII Testdata Contribution

Guide for contributing FHIR test data to the centralized MII testdata repository.

## Repository Overview

**Repository**: https://github.com/medizininformatik-initiative/mii-testdata
**Structure**: `kds-testdata/input/fsh/`

## Directory Structure

```
kds-testdata/input/fsh/
├── Bundle.fsh                    # Master bundle definitions + AddBundleEntry RuleSet
├── aliases.fsh                   # Shared aliases
├── test-data-label.fsh           # TestDataLabel RuleSet
├── modul-{module-name}/          # Module-specific test data
│   ├── {Module}Aliases.fsh       # Module-specific aliases
│   └── {ResourceType}.fsh        # Instance definitions
```

## Naming Convention

```
mii-exa-test-data-{module}-{resource-type}-{number}[-variant]
```

Examples:
- `mii-exa-test-data-patient-1`
- `mii-exa-test-data-onko-diagnose-1`
- `mii-exa-test-data-molgen-variante-1`

## Required RuleSets

### TestDataLabel
All instances must include the HTEST security label:
```fsh
* insert TestDataLabel
```

### AddBundleEntry
For adding resources to transaction bundles:
```fsh
* insert AddBundleEntry(mii-exa-test-data-{resource}-1, {ResourceType})
```

## Transaction Bundle Pattern

```fsh
Instance: mii-exa-test-data-bundle-{module}-{number}
InstanceOf: Bundle
Usage: #example
Description: "Bundle: {description}"
* insert TestDataLabel
* type = #transaction
* timestamp = "2025-01-03T10:00:00+01:00"

// Infrastructure resources first
* insert AddBundleEntry(mii-exa-test-data-patient-1, Patient)
* insert AddBundleEntry(mii-exa-test-data-organization-1, Organization)

// Then domain-specific resources
* insert AddBundleEntry(mii-exa-test-data-{module}-{resource}-1, {ResourceType})
```

## Workflow: Adding Module Test Data

### Phase 1: Build Coverage Index

Before creating test data, build an index of what needs coverage.

#### 1.1 Extract MS Elements from Profiles

For each profile in the source module, extract Must-Support elements from the differential:

```bash
# From StructureDefinition JSON (after sushi build in source module)
for sd in fsh-generated/resources/StructureDefinition-mii-pr-*.json; do
  echo "=== $(basename $sd .json) ==="
  jq -r '.differential.element[] | select(.mustSupport == true) | .path' "$sd"
done
```

**Note**: The differential only shows MS elements defined in *this* profile. Parent profiles (MII KDS base, German base profiles, FHIR core) may have additional MS elements, bindings, and cardinality constraints. These inherited constraints will surface when running SUSHI and the validator.

#### 1.2 Extract SearchParameters

```bash
# List all SearchParameters and their target paths
for sp in fsh-generated/resources/SearchParameter-*.json; do
  jq -r '[.name, .expression] | @tsv' "$sp"
done
```

#### 1.3 Create Coverage Tracking Table

Create a temporary tracking table (markdown or spreadsheet):

```markdown
| Profile | MS Element | SearchParam | Instance | Status |
|---------|------------|-------------|----------|--------|
| MII_PR_Onko_Diagnose | code.coding[icd10-gm] | diagnosis-code | -1 | pending |
| MII_PR_Onko_Diagnose | subject | - | -1 | pending |
| MII_PR_Onko_TNM | valueCodeableConcept | tnm-t | -1 | pending |
```

### Phase 2: Create Test Data

1. **Create branch**: `git checkout -b feature/add-{module}-testdata`
2. **Add dependency** to `sushi-config.yaml`:
   ```yaml
   dependencies:
     de.medizininformatikinitiative.kerndatensatz.{module}: {version}
   ```
3. **Create module directory**: `mkdir -p kds-testdata/input/fsh/modul-{module}`
4. **Create aliases file** with module-specific CodeSystems/ValueSets
5. **Create instance files** - populate MS elements, update tracking table
6. **Create transaction bundle** that includes all instances

### Phase 3: Verify and Submit

1. **Run SUSHI**: `cd kds-testdata && sushi .`
2. **Review coverage table** - ensure all MS elements and SearchParams covered
3. **Submit PR** - CI/CD pipeline runs FHIR Validator

## Adapting Existing Module Examples

When the source module already has examples (`mii-exa-*` instances):

1. **Analyze existing examples**: Check profile coverage against MS index
2. **Adapt naming**: `mii-exa-{module}-{name}` → `mii-exa-test-data-{module}-{name}-1`
3. **Add TestDataLabel**: Insert `* insert TestDataLabel`
4. **Update references**: Point to testdata instances
5. **Fill gaps**: Create new instances for uncovered MS elements

## Coverage Requirements

| Requirement | Description |
|-------------|-------------|
| **Profile Coverage** | At least one instance per published profile |
| **MS Element Coverage** | Every MS element populated in at least one instance |
| **SearchParam Coverage** | Every SearchParameter's target path populated |
| **Reference Integrity** | All references resolve within the bundle |

## SearchParameter Type Requirements

| Type | Test Data Requirement |
|------|----------------------|
| `token` | Populate `code` + `system` in coding element |
| `reference` | Include referenced resource in bundle |
| `date` | Use valid FHIR date format |
| `string` | Populate with searchable text |
| `quantity` | Include `value` + `unit` + `system` |
| `composite` | All component elements in same instance |

## Common Issues

### Alias Conflicts
Check `aliases.fsh` before adding new aliases to avoid redefinition errors.

### Reference Resolution
All referenced resources must exist in the bundle. Use consistent instance IDs.

### Invariant Satisfaction
Some profiles have invariants requiring specific data patterns. Create multiple instances if needed to satisfy conflicting invariant paths.

## Local Validation

Run SUSHI locally before submitting PR:

```bash
cd kds-testdata
sushi .
```

FHIR Validator runs automatically in CI/CD pipeline after PR submission.
