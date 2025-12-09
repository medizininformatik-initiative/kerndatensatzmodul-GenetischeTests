# Publish to Simplifier Command

## Usage
```
/publish-simplifier [VERSION]
```

## Your Task
Publish the FHIR package to Simplifier.net using either the web interface or CLI tools.

### Step 1: Pre-publish Checks
1. Verify package exists in `fsh-generated/resources/` or build it first
2. Get package details:
   - Name from sushi-config.yaml
   - Version from VERSION parameter or sushi-config.yaml
   - Canonical URL
3. Check if package has already been published (version conflict check)

### Step 2: Authentication
Check authentication status:

**If Simplifier CLI is installed:**
```bash
simplifier login
# Or check existing auth
simplifier whoami
```

**If not installed, guide user:**
- Manual upload via https://simplifier.net
- Or install Simplifier CLI:
  ```bash
  dotnet tool install --global Simplifier.CLI
  ```

### Step 3: Package Upload
**Option A: Using Simplifier CLI (if available)**
```bash
# Navigate to project
cd /Users/thome/code/fhir-profiling/kerndatensatzmodul-GenetischeTests

# Publish package
simplifier push \
  --project medizininformatikinitiative-modulomics \
  --version [VERSION] \
  --path fsh-generated/resources/package.tgz
```

**Option B: Using Firely Terminal (alternative)**
```bash
fhir publish \
  --project medizininformatikinitiative-modulomics \
  --version [VERSION]
```

**Option C: Manual Upload Instructions**
If CLI tools unavailable, provide step-by-step manual instructions:
1. Navigate to https://simplifier.net/medizininformatikinitiative-modulomics
2. Click "Upload" or "New Version"
3. Select package.tgz from `fsh-generated/resources/`
4. Confirm version and metadata
5. Publish

### Step 4: Verify Publication
1. Check Simplifier project page
2. Verify version appears in package list
3. Test package installation:
   ```bash
   fhir install de.medizininformatikinitiative.kerndatensatz.molgen@[VERSION]
   ```

### Step 5: Post-publish Actions
1. Update release notes on GitHub
2. Create git tag for the version
3. Update documentation to reference new version
4. Notify team/community if applicable

### Step 6: Report Results
Provide summary:
```
## Simplifier Publication Summary
**Package**: de.medizininformatikinitiative.kerndatensatz.molgen
**Version**: [VERSION]
**Status**: ✅ Published | ❌ Failed
**URL**: https://simplifier.net/medizininformatikinitiative-modulomics/~packages
**Install Command**:
  fhir install de.medizininformatikinitiative.kerndatensatz.molgen@[VERSION]
```

## Important Notes
- Requires Simplifier.net account with project permissions
- Cannot overwrite existing versions (must increment)
- Recommend using semantic versioning
- Consider ballot/rc/release labels appropriately
- Publishing is final - cannot unpublish, only deprecate

## Error Handling
- Authentication failures: Guide to login process
- Version conflicts: Suggest version increment
- Network issues: Retry with --retry flag
- Permission errors: Check project membership
