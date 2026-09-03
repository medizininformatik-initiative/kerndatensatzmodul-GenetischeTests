# Publish to Simplifier Command

## Usage
```
/publish-simplifier [VERSION]
```

## Your Task
Publish the FHIR package to Simplifier.net using either the web interface or CLI tools.

### Step 1: Pick the right tarball — READ THIS FIRST

There are two candidates and only one of them is publishable.

| Source | Publishable? |
| --- | --- |
| The `package.tgz` attached to the GitHub draft release | **NO** |
| The tarball from `/build-package` (Restore/Bake/Pack) | yes |

The draft release's asset is the IG Publisher's CI-build output. It carries
`"notForPublication": true` and `"url": "file:///home/runner/work/…"` — a runner path.
`go-publish.yml` rejects exactly that:

```
and ((.notForPublication // false) == false)
→ "::error::Invalid publishable package metadata"
```

That asset is the buildability gate's evidence, not a distributable. `go-publish`
builds its own package in publication mode. If you publish to Simplifier by hand,
build the tarball with `/build-package` and check its manifest first:

```bash
tar -xOzf ${PACKAGE_NAME}-${VERSION}.tgz package/package.json | \
  jq '{name, version, canonical, type, license, author, notForPublication}'
```

`notForPublication` must be absent or false, `canonical` must be set, and `version`
must match the tag. A manifest missing `canonical` or `license` was shipped once
already — see the 2026-09-03 repair.

### Step 1b: Pre-publish Checks
1. Verify the tarball exists in the project root (built by `/build-package`)
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
  --project medizininformatikinitiative-modulmolekulargenetischerbefundbericht \
  --version [VERSION] \
  --path ${PACKAGE_NAME}-${VERSION}.tgz
```

**Option B: Using Firely Terminal (alternative)**
```bash
fhir publish \
  --project medizininformatikinitiative-modulmolekulargenetischerbefundbericht \
  --version [VERSION]
```

**Option C: Manual Upload Instructions**
If CLI tools unavailable, provide step-by-step manual instructions:
1. Navigate to https://simplifier.net/medizininformatikinitiative-modulmolekulargenetischerbefundbericht
2. Click "Upload" or "New Version"
3. Select the tarball built by `/build-package` in the project root
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
2. The git tag is NOT created here — it already exists. `v<VERSION>` on `main` is what
   triggers `module-release.yml` and produces the draft release, and that happens
   BEFORE any publication. Creating a tag at this point would be a second, conflicting
   one.
3. Update documentation to reference new version
4. Notify team/community if applicable

### Step 6: Report Results
Provide summary:
```
## Simplifier Publication Summary
**Package**: de.medizininformatikinitiative.kerndatensatz.molgen
**Version**: [VERSION]
**Status**: ✅ Published | ❌ Failed
**URL**: https://simplifier.net/medizininformatikinitiative-modulmolekulargenetischerbefundbericht/~packages
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
