# Release Finalization

Help finalize the release after PR has been merged (Phase 5 of MII Module Release Workflow).

## Your Task

Execute Phase 5: Merge and Tag Release

### Prerequisites Check
1. Verify PR has been merged to main branch
2. Ensure all CI checks passed
3. Confirm you're ready to create the release tag

### Steps

1. **Switch to main branch and pull latest**
   ```
   git checkout main
   git pull origin main
   ```

2. **Verify the version**
   - Read `sushi-config.yaml` to get the version number
   - Confirm with user: "Ready to tag release v{VERSION}?"

3. **Create and push the tag**
   ```
   git tag -a v{VERSION} -m "Release v{VERSION}"
   git push origin v{VERSION}
   ```

4. **Inform about next steps**
   - GitHub Actions will automatically create a draft release
   - User needs to:
     - Phase 6: Publish package on Simplifier and download .tgz
     - Phase 7: Edit GitHub draft release, upload .tgz, and publish
     - Phase 8: Export IG and upload to TMF SharePoint

### Safety

- Only proceed if user explicitly confirms
- Show the tag that will be created before pushing
- Remind about the automatic GitHub release creation

### Post-Tag Actions

After successfully creating the tag:
1. Switch back to dev branch: `git checkout dev`
2. Optionally clean up the release branch if user wants
3. Display the GitHub release URL: `https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/releases`
