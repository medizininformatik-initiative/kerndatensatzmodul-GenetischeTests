# Release Finalization

Help finalize the release after PR has been merged (Phase 5-6 of MII Module Release Workflow).

## Your Task

Execute Phase 5-6: Tag Release and Attach Package

### Prerequisites Check
1. Verify PR has been merged to main branch
2. Ensure all CI checks passed
3. Confirm FHIR package has been built locally (`.tgz` file exists)

### Steps

1. **Switch to main branch and pull latest**
   ```bash
   git checkout main
   git pull origin main
   ```

2. **Verify the version**
   - Read `sushi-config.yaml` to get the version number
   - Confirm with user: "Ready to tag release v{VERSION}?"

3. **Create and push the tag**
   ```bash
   git tag v{VERSION}
   git push origin v{VERSION}
   ```

4. **Wait for GitHub Actions**
   - CI validation runs on the tag
   - RELEASE job creates draft release automatically
   - Check status: `gh run list --branch v{VERSION}`

5. **Attach FHIR package to release**
   ```bash
   gh release upload v{VERSION} de.medizininformatikinitiative.kerndatensatz.molgen-{VERSION}.tgz
   ```

   Or if the package is in `.bake/`:
   ```bash
   gh release upload v{VERSION} .bake/de.medizininformatikinitiative.kerndatensatz.molgen-{VERSION}.tgz
   ```

6. **Publish the release**
   - Edit release notes if needed: `gh release edit v{VERSION} --draft=false`
   - Or use GitHub UI to review and publish
   - Publishing triggers Zulip notification automatically

### Safety

- Only proceed if user explicitly confirms
- Show the tag that will be created before pushing
- Verify package file exists before attempting upload

### Post-Tag Actions

After successfully publishing the release:
1. Display the GitHub release URL:
   ```bash
   gh release view v{VERSION} --web
   ```
2. Remind about Simplifier publication (Phase 7)
3. Remind about TMF SharePoint IG export (Phase 8)

### Quick Commands Reference

```bash
# Check release status
gh release list

# View draft release
gh release view v{VERSION}

# Upload package to release
gh release upload v{VERSION} *.tgz

# Publish draft release
gh release edit v{VERSION} --draft=false

# Open release in browser
gh release view v{VERSION} --web
```
