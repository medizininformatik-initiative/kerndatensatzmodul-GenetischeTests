# Release Preparation Command

You are helping prepare a new release for the MII Molekulargenetischer Befundbericht module following the official MII Module Release Workflow.

## Usage

```
/release-prepare <VERSION>
```

Example: `/release-prepare 2026.0.0-rc.2`

The VERSION parameter is optional. If not provided, ask the user for it.

## Your Task

Execute Phase 1-3 of the MII Module Release Workflow:

### Phase 1: Create Release Branch
1. Check current git status - ensure working tree is clean
2. Ensure you're on the `dev` branch
3. Get VERSION from command arguments, or ask user if not provided (format: `YYYY.0.0-rc.X` or `YYYY.0.0`)
4. Validate version format matches `YYYY.0.0` or `YYYY.0.0-rc.X` or `YYYY.0.0-ballot`
5. Create a new branch named `release/v{VERSION}` from dev

### Phase 2: Update Version Information

Update version numbers in these files:

1. **package.json**: Update the `version` field
2. **sushi-config.yaml**: Update the `version` parameter (may already be done)
3. **qc/custom.rules.yaml**: Add the new version to the `version-filled` predicate list (line 25)
4. **input/fsh/rulesets/version.fsh**: Update version (may already be done via PR_CS_VS_Version RuleSet)

IMPORTANT: Read each file first to verify current state before making changes.

### Phase 3: Prepare Release Notes

1. Search for existing release notes or CHANGELOG files
2. Check git log for changes since last release: `git log --oneline v{LAST_VERSION}..HEAD` (if previous tag exists)
3. Generate a draft of release notes highlighting:
   - New features
   - Bug fixes
   - Breaking changes
   - Updated dependencies
4. Present release notes to user for review

### Phase 4: Create TODO Checklist

Use TodoWrite to create a comprehensive checklist:
- Version updates completed
- Release branch created
- Release notes prepared
- Ready to create PR
- Waiting for CI validation
- Ready to merge
- Ready to tag release

### Safety Checks

Before starting:
- Verify no uncommitted changes: `git status --porcelain`
- Verify on dev branch: `git branch --show-current`
- Pull latest changes: `git pull origin dev`

After all changes:
- Show summary of all modified files
- Create a single atomic commit with message: `chore: Prepare release v{VERSION}`
- Ask user if they want to push the release branch

## Context

The MII Module Release Workflow has 8 phases total. This command handles phases 1-3 (automated preparation). The remaining phases require manual intervention:
- Phase 4: Create PR and wait for CI
- Phase 5: Merge and tag
- Phase 6-8: Simplifier publishing and IG export (manual)

Refer to: https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Module-Release-Workflow
