# Simplifier Publishing (Phase 6)

Guide for publishing the package to Simplifier (Phase 6 of MII Module Release Workflow).

## Usage

```
/release-simplifier
```

## Your Task

Help the user through Simplifier package publishing process.

### Prerequisites Check

1. Verify release has been tagged on GitHub
2. Ensure `package.json` has correct version and description
3. Push changes to GitHub (auto-syncs to Simplifier)

### Web UI Workflow (Primary Method)

Use the Simplifier web interface for publishing:

1. Push to GitHub → auto-syncs to Simplifier
2. Navigate to: https://simplifier.net/medizininformatikinitiative-modulomics
3. Go to **Project Settings → Packages**
4. Click **"Bake"** and enter:
   - Version number (from `package.json`)
   - Description (from `package.json`)
   - Release notes
5. Click **"Publish"**

**WARNING**: Published packages are PERMANENT and cannot be removed from the registry.

### After Publishing

1. Verify package appears at: https://packages.simplifier.net/de.medizininformatikinitiative.kerndatensatz.molgen
2. Download the `.tgz` package for GitHub release upload
3. Proceed to Phase 7: `/release-github` (if that command exists)
4. Record package URL for documentation

---

### Alternative: CLI Workflow (Requires Firely Terminal License)

**Note**: The CLI workflow requires a separate Firely Terminal license (different from Simplifier license). If you get "Unauthorized: You do not have a license" errors, use the Web UI method above.

#### Prerequisites for CLI
- Firely Terminal license (check with `fhir license`)
- Login: `fhir login email=<email> password=<password>`

#### Step 1: Login to Firely Terminal (if needed)
```bash
fhir login email=<email> password=<password>
```
Credentials can be stored in `.env` file (already in `.gitignore`).

#### Step 2: Link Project (one-time setup)
```bash
fhir project link <project-urlkey> --strategy TakeLocal
```
For this project: `fhir project link medizininformatikinitiative-modulomics --strategy TakeLocal`

#### Step 3: Update package.json
Update version and description in `package.json`:
- `version`: Release version (e.g., "2026.0.0")
- `description`: Release notes content (supports markdown)

**Important**: The `description` field should include:
1. Link to IG Release Notes page
2. Summary of key changes

Example description format:
```
# MII Molekulargenetischer Befundbericht 2026.0.0

[Full Release Notes](https://simplifier.net/guide/MII-IG-MolGen-DE-v2026/MIIIGModulMolGen/Release-Notes)

## Summary
- Key change 1
- Key change 2
```

**Single Source of Truth**: The IG Release Notes page at `implementation-guides/.../Release-Notes.page.md` should be the authoritative source. Copy its content to `package.json` description for Simplifier registry visibility.

#### Step 4: Build Package
```bash
fhir pack
```
This runs the bake pipeline from `package.bake.yaml` and creates:
- `.bake/` folder with intermediate output
- `.tgz` package file in project root

#### Step 5: Publish to Registry
```bash
fhir publish-package <package-name>.tgz
```
Example: `fhir publish-package de.medizininformatikinitiative.kerndatensatz.molgen.2026.0.0.tgz`

**WARNING**: Published packages are PERMANENT and cannot be removed from the registry.

### Key Files

- `package.json` - version, description, dependencies
- `package.bake.yaml` - bake pipeline configuration (defines package structure)
- `.simplifier/` - project link metadata
- `.env` - Simplifier credentials (gitignored)

### Bake Pipeline Configuration

The `package.bake.yaml` defines:
- JSON conversion from FSH
- Snapshot generation for StructureDefinitions
- Filtering conformance resources (status='active')
- Moving examples to `/package/examples`
- Creating package index

### Troubleshooting

Common issues:
- **"Unauthorized: You do not have a license"**: CLI requires Firely Terminal license; use Web UI instead
- **"Not logged in"**: Run `fhir login`
- **"Not a project folder"**: Run `fhir project link` first
- **Slow `to-json` step**: First run downloads dependencies, subsequent runs are faster
- **Version already exists**: Package versions are immutable, use a different version
- **Dependencies not resolving**: Check `package.json` dependencies match available packages
- **Validation errors**: Check SUSHI build output first

### Notes

- Local bake uses local `package.json` (not synced from Simplifier)
- Baking and publishing are separate workflows
- Description/release notes in registry come from `package.json` description
- `.bake`, `.simplifier`, and `*.tgz` are gitignored
