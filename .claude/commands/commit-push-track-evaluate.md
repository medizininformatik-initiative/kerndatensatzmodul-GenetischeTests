# Commit, Push, Track CI Validation, and Evaluate Results

Perform the complete workflow of committing, pushing, waiting for CI validation, and analyzing results.

## Instructions

1. **Commit current changes**:
   - Run `git status` and `git diff` to see what will be committed
   - Create a commit with an appropriate message following the repository conventions
   - Include the standard footer with Claude attribution

2. **Push to remote**:
   - Push the commit to the remote repository
   - Note the commit SHA for tracking

3. **Monitor CI validation**:
   - Wait for the GitHub Actions workflow "CI (FHIR Validation)" to complete
   - Poll every 30 seconds for up to 10 minutes
   - **Use `run_in_background: true`** for the polling command to avoid user prompts
   - Use this polling pattern:
   ```bash
   # Get workflow run ID for the commit
   COMMIT_SHA=$(git rev-parse HEAD)
   RUN_ID=$(gh api repos/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/actions/runs \
     --jq ".workflow_runs | map(select(.head_sha == \"$COMMIT_SHA\")) | .[0].id")

   # Poll until complete (use run_in_background for this)
   sleep 30 && gh api repos/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/actions/runs/$RUN_ID \
     --jq '.status + " " + (.conclusion // "null")'
   ```

4. **Download validation artifacts**:
   - Once complete, download the `validation-output` artifact
   - Create output directory with proper variable handling:
   ```bash
   # Create timestamp and directory in one command
   SHORT_SHA=$(git rev-parse --short HEAD)
   TIMESTAMP=$(date +%Y%m%d_%H%M%S)
   OUTDIR=".validation-history/${TIMESTAMP}_${SHORT_SHA}"
   mkdir -p "$OUTDIR"
   gh run download $RUN_ID -n validation-output -D "$OUTDIR"
   ```
   - Save validation.json, validation.html, and txlog.html to the directory

5. **Run the analysis script**:
   ```bash
   # Run analysis with automatic comparison to previous validation
   python3 .claude/scripts/analyze_validation.py "$OUTDIR/validation.json" --output-format markdown
   ```
   - This generates the error report with categorization and comparison
   - Results are displayed in the terminal and saved to the output directory

6. **Expected output format**:
   ```
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   FHIR Validation Report for commit {short_sha}
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

   SUMMARY
   -------
   Current errors: X
   Previous errors: Y
   Change: +/-Z

   ERROR CATEGORIES
   ----------------
   - UNABLE_TO_INFER_CODESYSTEM: N errors
   - Terminology_TX_NoValid_16: N errors
   - [other categories]: N errors

   AFFECTED RESOURCES
   ------------------
   - Questionnaire: N errors
   - Bundle: N errors
   - StructureDefinition: N errors

   FIXED ERRORS (showing up to 20)
   -------------------------------
   [list of fixed error locations and messages]

   NEW ERRORS (showing up to 20)
   -----------------------------
   [list of new error locations and messages]

   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   Results saved to: .validation-history/{path}
   View HTML report: .validation-history/{path}/validation.html
   ```

## Notes

- Results are saved to `.validation-history/` for historical tracking
- Use `gh auth status` to ensure GitHub CLI is authenticated
- The analysis script automatically detects and compares with previous validation runs

## Known/Expected Errors

Many validation errors are **expected** due to terminology server limitations:

### LOINC Answer List Errors
- LOINC Answer Lists (LL*) validation may fail due to terminology server configuration
- These are tracked in `known_errors.txt`

### Suppressions
Some validation warnings are suppressed via `advisor.json`. Check this file if you need to add new suppressions for known issues.
