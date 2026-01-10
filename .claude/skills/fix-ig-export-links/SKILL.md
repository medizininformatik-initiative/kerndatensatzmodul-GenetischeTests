---
name: fix-ig-export-links
description: Generate and run scripts to fix broken Simplifier resolve links in MII Implementation Guide exports. This skill reads module configuration and generates a customized fix script for each MII KDS module. Use when downloading an IG from Simplifier and links are broken, preparing an IG export for offline use, or making links work both locally and on official MII pages.
---

# Fix IG Export Links (Canonical Version)

**Architecture:** This skill generates module-specific fix scripts based on configuration.

## How It Works

1. **Read module config** from `.claude/config.json` or `CLAUDE.md`
2. **Generate customized script** at `.claude/skills/fix-ig-export-links/scripts/fix-links.sh`
3. **Run script** on downloaded IG export
4. **Verify** remaining links are intentional

## Required Module Configuration

Your module's `.claude/config.json` must define:

```json
{
  "ig_export": {
    "module_id": "onkologie",
    "package_name": "de.medizininformatikinitiative.kerndatensatz.onkologie",
    "canonical_base": "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko",
    "guide_name": "mii-ig-modul-onkologie-v2026-de",
    "resource_prefix": "mii-pr-onko",
    "dependencies": {
      "hl7.fhir.r4.core": "4.0.1",
      "hl7.terminology.r4": "7.0.0",
      "de.basisprofil.r4": "1.5.4",
      "de.medizininformatikinitiative.kerndatensatz.base": "2026.0.0",
      "de.medizininformatikinitiative.kerndatensatz.medikation": "2026.0.0",
      "de.medizininformatikinitiative.kerndatensatz.molgen": "2026.0.4"
    },
    "special_dependencies": {
      "genomics_reporting": {
        "package": "hl7.fhir.uv.genomics-reporting",
        "version": "3.0.0",
        "url_base": "https://hl7.org/fhir/uv/genomics-reporting/STU3/"
      }
    }
  }
}
```

### Configuration Fields

| Field | Description | Example |
|-------|-------------|---------|
| `module_id` | Short module identifier | `"onkologie"`, `"seltene"`, `"mtb"` |
| `package_name` | Full FHIR package name | `"de.medizininformatikinitiative.kerndatensatz.onkologie"` |
| `canonical_base` | Module canonical URL base | `"https://...modul-onko"` |
| `guide_name` | Implementation guide name | `"mii-ig-modul-onkologie-v2026-de"` |
| `resource_prefix` | Resource ID prefix | `"mii-pr-onko"` (profiles), `"mii-vs-onko"` (ValueSets) |
| `dependencies` | FHIR package dependencies with versions | Object mapping package → version |
| `special_dependencies` | Non-standard dependencies (e.g., genomics) | Optional object |

## Link Categories Fixed

The generated script fixes these link patterns:

### Always Fixed (All Modules)
- **FHIR R4 Core** → `https://hl7.org/fhir/R4/...`
- **HL7 Terminology (THO)** → `https://terminology.hl7.org/...`
- **German base profiles** → Simplifier packages
- **MII Base Module** → Simplifier packages

### Module-Specific (Based on Dependencies)
- MII module dependencies (medikation, molgen, onkologie, etc.) → Simplifier packages
- Special dependencies (genomics-reporting, etc.) → Configured URL bases
- Internal artifacts (profiles, ValueSets, CodeSystems, Extensions) → Module-specific canonical URLs

### HTML Encoding Variants
- Single-quoted `href='...'` with `&`
- Double-quoted `href="..."` with `&amp;`

## Procedure

### Step 1: Generate the Fix Script

Run the generator from your module root:

```bash
# From module root (e.g., kerndatensatzmodul-onkologie/)
cd /path/to/kerndatensatzmodul-<module>

# Run generator
python3 /path/to/mii-kerndatensatz-dev/.claude/skills/fix-ig-export-links/scripts/generate-fix-script.py
```

Or if the skill is already synced to your module:

```bash
python3 .claude/skills/fix-ig-export-links/scripts/generate-fix-script.py
```

**What the generator does:**
1. Reads `ig_export` config from `.claude/config.json`
2. Validates required fields are present
3. Loads template from `templates/script-template.sh`
4. Generates dependency-specific sed commands
5. Fills in all placeholders (module ID, canonical URLs, prefixes, etc.)
6. Writes `fix-links.sh` to `.claude/skills/fix-ig-export-links/scripts/`
7. Makes script executable (`chmod +x`)

**Expected output:**
```
MII IG Export Links Fix Script Generator
==================================================

Module: onkologie
Package: de.medizininformatikinitiative.kerndatensatz.onkologie
Canonical: https://www.medizininformatik-initiative.de/fhir/ext/modul-onko
Dependencies: 6

Generating fix-links.sh...
✓ Generated: .claude/skills/fix-ig-export-links/scripts/fix-links.sh

Next steps:
1. Download IG export from Simplifier
2. Extract ZIP file
3. Run: cd <extracted-dir> && bash /path/to/fix-links.sh
4. Verify: grep -c 'resolve?' *.html | grep -v ':0$'
```

### Step 2: Download and Extract IG

```bash
# Download from Simplifier
# Example: MII-IG-Onkologie-DE-v2026@current.zip

# Extract
unzip "MII-IG-Onkologie-DE-v2026@current.zip" -d ig-export
cd ig-export
```

### Step 3: Run the Generated Script

```bash
# Run from extracted IG directory
bash /path/to/module/.claude/skills/fix-ig-export-links/scripts/fix-links.sh
```

### Step 4: Verify

```bash
# Check remaining resolve links (should only be intentional Simplifier links)
grep -c "resolve?" *.html | grep -v ":0$"

# Expected: Only module canonical URLs remain as Simplifier resolve links
grep -o "simplifier.net/resolve" *.html | wc -l
```

## Expected Remaining Links

After running the script, these Simplifier resolve links are **intentional**:
- Module profile/ValueSet/CodeSystem canonical URLs → `https://simplifier.net/resolve?canonical=...&fhirVersion=R4`
- CapabilityStatement canonical → Simplifier resolve

These link to Simplifier for up-to-date profile documentation.

## Technical Notes

### Link Pattern Types
- **`?canonical=`**: Links to profile canonical URLs (resolved via Simplifier for module resources)
- **`?filepath=`**: Links to package files (converted to official spec URLs or Simplifier packages)

### Script Generation Logic

The skill generates sed commands based on:
1. **Module canonical pattern**: `scope=...${module_id}...canonical=${canonical_base}/...` → Simplifier resolve
2. **Dependency patterns**: For each dependency, create sed rules for its filepath patterns
3. **Internal artifacts**: Based on `resource_prefix`, fix paths to local HTML or Simplifier canonical

### Validation

The skill validates config before generating:
- Required fields present
- canonical_base is a valid URL
- Dependencies is a non-empty object
- resource_prefix follows MII naming convention (mii-pr-*, mii-vs-*, etc.)

## Example Configurations

### Simple Module (molgen)
```json
{
  "ig_export": {
    "module_id": "molgen",
    "package_name": "de.medizininformatikinitiative.kerndatensatz.molgen",
    "canonical_base": "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen",
    "guide_name": "mii-modul-molekulargenetischer-befundbericht-v2026-de",
    "resource_prefix": "mii-pr-molgen",
    "dependencies": {
      "hl7.fhir.r4.core": "4.0.1",
      "hl7.terminology.r4": "7.0.0",
      "de.basisprofil.r4": "1.5.4",
      "de.medizininformatikinitiative.kerndatensatz.base": "2026.0.0"
    },
    "special_dependencies": {
      "genomics_reporting": {
        "package": "hl7.fhir.uv.genomics-reporting",
        "version": "3.0.0",
        "url_base": "https://hl7.org/fhir/uv/genomics-reporting/STU3/"
      }
    }
  }
}
```

### Complex Module (mtb - many dependencies)
```json
{
  "ig_export": {
    "module_id": "mtb",
    "package_name": "de.medizininformatikinitiative.kerndatensatz.molekulares-tumorboard",
    "canonical_base": "https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb",
    "guide_name": "mii-ig-mtb-v2026-de",
    "resource_prefix": "mii-pr-mtb",
    "dependencies": {
      "hl7.fhir.r4.core": "4.0.1",
      "hl7.terminology.r4": "7.0.0",
      "de.basisprofil.r4": "1.5.4",
      "de.medizininformatikinitiative.kerndatensatz.base": "2026.0.0",
      "de.medizininformatikinitiative.kerndatensatz.medikation": "2026.0.0",
      "de.medizininformatikinitiative.kerndatensatz.molgen": "2026.0.4",
      "de.medizininformatikinitiative.kerndatensatz.onkologie": "2026.0.0",
      "de.medizininformatikinitiative.kerndatensatz.patho": "2026.0.0",
      "de.medizininformatikinitiative.kerndatensatz.biobank": "2026.0.0",
      "de.medizininformatikinitiative.kerndatensatz.consent": "2025.0.4",
      "de.medizininformatikinitiative.kerndatensatz.studie": "2026.0-ballot"
    },
    "special_dependencies": {
      "genomics_reporting": {
        "package": "hl7.fhir.uv.genomics-reporting",
        "version": "3.0.0",
        "url_base": "https://hl7.org/fhir/uv/genomics-reporting/STU3/"
      }
    }
  }
}
```

## Maintenance

### Updating for New Dependencies

When a module adds a new dependency:
1. Add to `dependencies` in config
2. Regenerate script by running this skill
3. Test on sample IG export

### Updating for New Link Patterns

If new broken link patterns are discovered:
1. Update script template in mii-kerndatensatz-dev
2. Sync skill to all modules
3. Regenerate scripts

### IG Structure Changes

**CRITICAL:** When the IG Publisher changes its output structure or link generation logic, this skill must be updated.

**Common trigger events:**
- IG Publisher version upgrade (e.g., 1.5.x → 1.6.x)
- SUSHI version upgrade changing output format
- Simplifier export format changes
- New HTML encoding patterns
- New dependency package patterns

**Update workflow:**
1. Download sample IG export with new structure
2. Identify what link patterns changed
3. Update skill logic in mii-kerndatensatz-dev
4. Test on all 5 modules
5. Sync to all modules
6. Document changes in CATALOG.md

**Testing after IG structure changes:**
- Test with recent IG exports from all 5 modules
- Verify no regression (old patterns still work)
- Verify new patterns are fixed correctly
- Check remaining link count is reasonable

## Syncing to Modules

**Source of truth:** `mii-kerndatensatz-dev/.claude/skills/fix-ig-export-links/`

**Sync to a module:**
```bash
rsync -av \
  /path/to/mii-kerndatensatz-dev/.claude/skills/fix-ig-export-links/ \
  /path/to/kerndatensatzmodul-<module>/.claude/skills/fix-ig-export-links/
```

After syncing, regenerate the fix script to pick up new logic.

## Version Tracking

See `mii-kerndatensatz-dev/CATALOG.md` for version history and sync status across modules.

---

**Canonical Version:** v1.0.0 (2026-01-10)
**Maintained in:** mii-kerndatensatz-dev
**Deployed to:** molgen, seltene, onkologie, proms, mtb
