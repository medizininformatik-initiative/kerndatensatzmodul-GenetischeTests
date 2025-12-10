# Build Package Command

## Usage
```
/build-package [OPTIONS]
```

## Execution Mode
**IMPORTANT**: This is a build command. Execute all steps directly without asking for confirmation:
- Do NOT ask "should I check if X exists?" - just check it
- Do NOT ask "should I run sushi?" - just run it
- Do NOT ask "should I read the config?" - just read it
- Proceed through all steps automatically, only stop on actual errors

## Your Task
Build a FHIR package from the current IG project using SUSHI and optionally publish to Simplifier.

### Step 1: Pre-build Checks
1. Verify current directory is project root
2. Check for required files:
   - `sushi-config.yaml`
   - `input/fsh/` directory
3. Check git status to ensure clean state or warn about uncommitted changes
4. Get current version from `sushi-config.yaml`

### Step 2: Run SUSHI Compilation
1. Execute SUSHI to compile FSH to FHIR:
   ```bash
   sushi .
   ```
2. Capture output and check for errors
3. Report compilation statistics:
   - Profiles generated
   - ValueSets created
   - Examples produced
   - Any errors or warnings

### Step 3: Package Creation
If SUSHI succeeds:
1. Locate the generated package in `fsh-generated/resources/`
2. Check for `package.tgz` or create it if needed
3. Verify package contents:
   - package.json
   - All StructureDefinitions
   - All ValueSets and CodeSystems
   - All examples

### Step 4: Quality Checks (Optional)
Run validation using Firely Terminal (if installed):
```bash
fhir validate fsh-generated/resources/ImplementationGuide-*.json \
  --version 4.0.1 \
  --tx https://termserv.mii.medizininformatik-initiative.de/fhir
```

### Step 5: Package Information
Display package summary:
```
## Package Build Summary
**Package**: [name]
**Version**: [version]
**Status**: [releaseLabel]
**Resources**:
  - Profiles: X
  - ValueSets: Y
  - CodeSystems: Z
  - Examples: W
**Size**: [package size]
**Location**: fsh-generated/resources/
```

### Step 6: Next Steps Suggestions
Ask user if they want to:
- Publish to Simplifier (trigger `/publish-simplifier`)
- Create GitHub release
- Run full IG Publisher build
- Update QA documentation

## Options (Parse from command)
- `--skip-validation`: Skip FHIR validation step
- `--publish`: Automatically publish to Simplifier after build
- `--version X.Y.Z`: Override version from config

## Error Handling
- If SUSHI fails, show detailed error messages
- Suggest fixes for common errors
- Don't proceed to validation if compilation fails
- Use TodoWrite for tracking fixes if multiple errors found
