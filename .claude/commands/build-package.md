# Build Package Command

## Usage
```
/build-package [OPTIONS]
```

## Your Task
Build a FHIR package tarball from the current IG project using Firely Bake and optionally publish to package registry.

**Module Configuration**: This command reads module-specific configuration from `.claude/config.json` (`ig_export` section).

**CRITICAL**: Use `fhir bake` to create package structure, NOT `npm pack`. The npm pack approach packages the entire repository instead of just FHIR resources.

### Step 1: Load Module Configuration

Read configuration from `.claude/config.json`:

```bash
# Extract required values from config
PACKAGE_NAME=$(jq -r '.ig_export.package_name' .claude/config.json)
VERSION=$(jq -r '.ig_export.version' .claude/config.json)
RESOURCE_PREFIX=$(jq -r '.ig_export.resource_prefix' .claude/config.json)
MODULE_ID=$(jq -r '.ig_export.module_id' .claude/config.json)

echo "Building package: $PACKAGE_NAME version $VERSION"
```

**Fallback if jq not available**: Read from `sushi-config.yaml` directly.

### Step 2: Pre-build Checks
1. Verify current directory is project root
2. Check for required files:
   - `sushi-config.yaml`
   - `package.bake.yaml`
   - `input/fsh/` directory
3. Check git status to ensure clean state or warn about uncommitted changes
4. Verify version AND dependencies match between `.claude/config.json` and
   `sushi-config.yaml`. `.claude/config.json` is not read by any build tool, so it
   drifts silently — it was four fields behind on 2026-09-03. The tarball is named
   from it, so a stale version produces a correctly built package under the wrong
   name. `sushi-config.yaml` is the source of truth; correct the config, not it.

### Step 3: Clean Previous Build Artifacts
Clean output directories to ensure fresh build:
```bash
rm -rf output/ staging/ .bake/
```

### Step 4a: Restore Dependencies — REQUIRED BEFORE BAKE

```bash
fhir restore
```

Downloads every package from `sushi-config.yaml` into the shared cache. Snapshot
generation needs the base definitions; skipping this produces StructureDefinitions
with missing or wrong snapshots, and the IG then renders incomplete profile trees.

`fhir restore` exits non-zero and prints `[CircularReference]`, `[OutOfRange]` and
`[Outdated]` lines even on a good run. Those describe version references *inside*
third-party packages and are not actionable here. Judge the result by whether the
packages are in the cache, not by the exit code:

```bash
python3 -c "
import yaml, os
for k, v in yaml.safe_load(open('sushi-config.yaml'))['dependencies'].items():
    print(('OK  ' if os.path.isdir(os.path.expanduser(f'~/.fhir/packages/{k}#{v}')) else 'MISS'), f'{k}#{v}')
"
```

Do not run other FHIR tools at the same time: `~/.fhir/packages` has no locking, and
concurrent access corrupts reads.

### Step 4b: Run Firely Bake to Build Package Structure

```bash
fhir bake package.bake.yaml --input fsh-generated/resources
```

**`--input fsh-generated/resources` is required.** Without it bake reads the repo
root and picks up the wrong tree — since the template migration the generated
resources live in `fsh-generated/resources/`, not under `input/`.

### Step 4c: Add the Manifest — bake does NOT do this

```bash
cp package.json .bake/package/package.json
```

`package.bake.yaml` has a `manifest` step reading `files: package.json`, but it
resolves against the *input* folder. With `--input fsh-generated/resources` there is
no `package.json` there, so bake silently produces a package without one — and a
FHIR package without `package/package.json` is invalid. Verify:

```bash
test -f .bake/package/package.json && echo "manifest OK" || echo "MANIFEST MISSING"
```

Then check that snapshots were actually generated (this is what Step 4a buys):

```bash
python3 -c "
import glob, json
sd = [f for f in glob.glob('.bake/package/*.json') if 'StructureDefinition' in f]
n = sum(1 for f in sd if 'snapshot' in json.load(open(f)))
print(f'StructureDefinitions: {len(sd)}, with snapshot: {n}')
"
```

`with snapshot` must equal the total. Anything less means Step 4a did not do its job.

**Expected Output**:
- `.bake/package/` directory created
- JSON files organized:
  - Conformance resources (StructureDefinition, ValueSet, SearchParameter, etc.) at package root
  - Example instances in `examples/` subdirectory
  - package.json at root

**Example Output**:
```
info: Firely Bake v1.x.x
info: Loading package.bake.yaml...
info: Processing to-json action...
info: Processing generate-snapshots action...
info: Processing move-conformance-resources action...
info: Processing move-examples action...
info: Package structure created in .bake/package/
```

### Step 5: Create Package Tarball
Create a tarball from the built package structure using config values:

```bash
COPYFILE_DISABLE=1 tar -czf ${PACKAGE_NAME}-${VERSION}.tgz -C .bake package/
```

**`COPYFILE_DISABLE=1` is required on macOS.** Without it tar writes an AppleDouble
`._*` sidecar next to every file, which lands in the published package.

**Example for molgen 2027.0.0-ballot.rc1**:
```bash
COPYFILE_DISABLE=1 tar -czf de.medizininformatikinitiative.kerndatensatz.molgen-2027.0.0-ballot.rc1.tgz -C .bake package/
```

Also check the tar path limit — it has bitten this module before:

```bash
tar -tzf $TARBALL | awk 'length>100' | wc -l   # must be 0
```

The tar format caps a path at 100 bytes. Long example ids push
`package/<Type>-<id>.json` over it and the IG Publisher then hard-fails on the
package. Six DiagnosticReport example ids were shortened for exactly this reason.

### Step 6: Verify Package Contents
Verify the package tarball contains the correct structure and resources:

```bash
# Set tarball name from config
TARBALL="${PACKAGE_NAME}-${VERSION}.tgz"

# List tarball contents
tar -tzf $TARBALL | head -20

# Check file count
FILE_COUNT=$(tar -tzf $TARBALL | wc -l)
echo "Total files: $FILE_COUNT"

# Check package size
ls -lh $TARBALL
```

**Module-specific expected counts** (approximate):
| Module | Files | Size (KB) |
|--------|-------|-----------|
| molgen | 130-140 | 350-400 |
| seltene | 150-170 | 400-500 |
| onkologie | 280-320 | 800-1000 |
| proms | 120-140 | 300-400 |
| mtb | 300-350 | 900-1200 |

**Expected Structure**:
```
package/package.json
package/StructureDefinition-${RESOURCE_PREFIX}-*.json
package/ValueSet-*.json
package/SearchParameter-*.json
package/examples/*.json
```

**NO unwanted files**:
- No `.claude/` directory
- No `input/fsh/` source files
- No `implementation-guides/` directory
- No `.git/` or build artifacts

```bash
# Verify no source code in package
tar -tzf $TARBALL | grep -E '\.fsh$|\.claude|input/fsh'

# Should return nothing (exit code 1)
```

### Step 7: Extract and Verify Key Resources
Verify critical resources are present with correct URLs and versions:

```bash
# Extract package to temp location for verification
mkdir -p /tmp/package-verify
tar -xzf $TARBALL -C /tmp/package-verify

# Check package.json
cat /tmp/package-verify/package/package.json | jq -r '.name, .version'
# Expected: $PACKAGE_NAME and $VERSION

# Count resource types
SD_COUNT=$(ls /tmp/package-verify/package/StructureDefinition-*.json 2>/dev/null | wc -l)
VS_COUNT=$(ls /tmp/package-verify/package/ValueSet-*.json 2>/dev/null | wc -l)
EX_COUNT=$(ls /tmp/package-verify/package/examples/*.json 2>/dev/null | wc -l)

echo "StructureDefinitions: $SD_COUNT"
echo "ValueSets: $VS_COUNT"
echo "Examples: $EX_COUNT"

# Cleanup
rm -rf /tmp/package-verify
```

### Step 8: Package Information Summary
Display package build summary using config values:

```
## Package Build Summary
**Package**: $PACKAGE_NAME
**Version**: $VERSION
**Module**: $MODULE_ID
**Tarball**: ${PACKAGE_NAME}-${VERSION}.tgz
**Size**: [actual size from ls -lh]
**Total Files**: $FILE_COUNT
**Resources**:
  - StructureDefinitions: $SD_COUNT
  - ValueSets: $VS_COUNT
  - Examples: $EX_COUNT
**Location**: .bake/package/
**Tarball Location**: ./${PACKAGE_NAME}-${VERSION}.tgz

✓ Package structure verified
✓ No source code in package
✓ Size within expected range for $MODULE_ID module
```

### Step 9: Next Steps Suggestions
Ask user if they want to:
- Publish to FHIR package registry (`fhir publish-package [tarball]`)
- Create GitHub release with package attached
- Test package installation locally
- Verify package in dependent projects

## Options (Parse from command)
- `--skip-verification`: Skip package verification steps
- `--publish`: Automatically publish to package registry after build
- `--version X.Y.Z`: Override version from config (also updates sushi-config.yaml)
- `--dry-run`: Show what would be built without actually building

## Error Handling
- If `.claude/config.json` missing or invalid, fall back to reading `sushi-config.yaml` directly
- If `fhir bake` fails, show detailed error messages
- Warn if package size significantly exceeds module's expected range
- Warn if file count significantly exceeds module's expected range
- Suggest fixes for common errors:
  - Missing `package.bake.yaml`: Check file exists
  - Bake action fails: Check source paths in bake file
  - Wrong package structure: Verify bake configuration
- Use TodoWrite for tracking fixes if multiple errors found

## Common Mistakes to Avoid
❌ **DO NOT** use `npm pack` - packages entire repository
❌ **DO NOT** create tarball from project root
❌ **DO NOT** skip verification steps
❌ **DO NOT** hardcode package names - read from config

✅ **DO** use `fhir bake package.bake.yaml`
✅ **DO** create tarball from `.bake/package/` directory
✅ **DO** verify package size and file count
✅ **DO** check for unwanted source files
✅ **DO** read module config from `.claude/config.json`

## Module-Specific Notes

Each module's `.claude/config.json` provides:
- `package_name`: Full package identifier
- `version`: Current version
- `resource_prefix`: Naming prefix for resources (e.g., `mii-pr-molgen`)
- `module_id`: Short module identifier (e.g., `molgen`, `onko`, `pro`)

This command adapts automatically to any MII module with proper config.
