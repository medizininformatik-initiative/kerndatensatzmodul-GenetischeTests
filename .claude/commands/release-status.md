# Release Status Check

Check the current status of the release preparation process.

## Your Task

Provide a comprehensive status report:

### 1. Git Status
- Current branch
- Uncommitted changes
- Recent commits
- Available release branches (list branches matching `release/*`)

### 2. Version Consistency Check

Read and compare versions across:
- `sushi-config.yaml` (line ~12: `version:`)
- `package.json` (line ~3: `"version":`)
- `qc/custom.rules.yaml` (line ~25: version validation list)
- `input/fsh/rulesets/version.fsh` (PR_CS_VS_Version RuleSet)

Report any mismatches.

### 3. Release Branch Status

If on a release branch:
- Check if PR exists (ask user to verify on GitHub)
- Check if CI validation passed (ask user to verify)
- List commits on release branch vs dev

### 4. Release Workflow Checklist

Show which phases are complete:
- [ ] Phase 1: Release branch created
- [ ] Phase 2: Version numbers updated
- [ ] Phase 3: Release notes prepared
- [ ] Phase 4: PR created and CI passed
- [ ] Phase 5: Merged and tagged
- [ ] Phase 6: Published to Simplifier
- [ ] Phase 7: GitHub release finalized
- [ ] Phase 8: IG exported to SharePoint

### 5. Next Steps

Based on current status, recommend the next action(s) to take.
