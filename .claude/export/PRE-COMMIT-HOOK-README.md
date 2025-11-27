# FHIR IG Pre-Commit Hook - Installation & Usage Guide

## Overview

This pre-commit hook automates FHIR Implementation Guide development workflow with intelligent validation that saves development time and catches errors early.

**Key Benefits:**
- ⚡ **Fast**: Only validates changed resources (not all 100+)
- 🎯 **Smart**: Detects when only comments changed
- 🔍 **Complete**: Full terminology validation with TX server
- 💾 **Local**: Validates against your current uncommitted work
- ⏱️ **Time-saving**: Catch errors in 10 seconds vs 50 minutes CI

## Features

### What It Does

1. **Auto-runs SUSHI** before every commit
2. **Auto-stages** generated files in `fsh-generated/`
3. **Detects changes** using git diff of staged files
4. **Validates only changed resources** (profiles, valuesets, etc.)
5. **Uses local IG** (`-ig fsh-generated`) to validate against current work
6. **Connects to terminology server** for terminology validation
7. **Prompts on failure** - decide whether to commit anyway or fix first

### What It Doesn't Do

- ❌ Doesn't validate if only FSH comments changed (smart!)
- ❌ Doesn't validate if terminology server is down (graceful fallback)
- ❌ Doesn't block commits (prompts for confirmation)
- ❌ Doesn't require published IG packages (uses local files)

## Installation

### Prerequisites

1. **SUSHI** - FSH compiler
   ```bash
   npm install -g fsh-sushi
   ```

2. **Java 17+** - For FHIR validator
   ```bash
   java -version  # Should show 17 or higher
   ```

3. **FHIR Validator** - Download latest version
   ```bash
   cd /path/to/your/ig
   curl -L https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -o validator_cli.jar
   ```

4. **Terminology Server** (Optional but recommended)
   - Local HAPI FHIR: `docker run -d -p 3000:8080 hapiproject/hapi:latest`
   - Or use public TX server (slower)

### Setup Steps

1. **Copy the hook to your IG repository**
   ```bash
   cd /path/to/your/ig
   cp pre-commit-hook-export.sh .git/hooks/pre-commit
   chmod +x .git/hooks/pre-commit
   ```

2. **Configure the hook** (edit `.git/hooks/pre-commit`)
   ```bash
   # Adjust these variables at the top of the file:
   VALIDATOR_JAR="validator_cli.jar"           # Path to validator JAR
   FHIR_VERSION="4.0.1"                        # Your FHIR version
   TX_SERVER="http://localhost:3000"           # Your TX server URL
   LOCAL_IG_PATH="fsh-generated"               # Where SUSHI outputs
   ```

3. **Add validator to .gitignore**
   ```bash
   echo "validator_cli.jar" >> .gitignore
   ```

4. **Test it works**
   ```bash
   # Make a small change
   echo "// test" >> input/fsh/YourProfile.fsh

   # Try to commit (hook should run)
   git add input/fsh/YourProfile.fsh
   git commit -m "Test pre-commit hook"
   ```

## Usage

### Normal Commit (with validation)
```bash
git commit -m "Your commit message"
```
Output:
```
Running SUSHI to regenerate files...
✓ SUSHI: 0 errors, 0 warnings
✓ Terminology server found at localhost:3000
Found 2 changed resource(s)
Running local validation...
✓ Local validation passed
✓ Pre-commit checks complete!
```

### Skip Validation (Fast Commit)
```bash
SKIP_VALIDATION=1 git commit -m "WIP: Quick save"
```

### Bypass Hook Entirely
```bash
git commit --no-verify -m "Emergency fix"
```

## Configuration Options

### Terminology Server Options

**Option 1: Local Proxy (Recommended)**
```bash
TX_SERVER="http://localhost:3000"
```

**Option 2: Public HL7 Server**
```bash
TX_SERVER="https://tx.fhir.org/r4"
```

**Option 3: Disable Terminology Validation**
```bash
TX_SERVER=""  # Empty string disables TX validation
```

### Validation Patterns

Control which resource types to validate:
```bash
# Default: Profiles and ValueSets only
VALIDATION_PATTERNS="StructureDefinition-*.json ValueSet-*.json"

# Add CodeSystems
VALIDATION_PATTERNS="StructureDefinition-*.json ValueSet-*.json CodeSystem-*.json"

# Validate everything
VALIDATION_PATTERNS="*.json"

# Profiles only
VALIDATION_PATTERNS="StructureDefinition-*.json"
```

## Troubleshooting

### "SUSHI build failed"
**Problem**: FSH compilation errors
**Solution**: Fix FSH syntax errors before committing
```bash
sushi .  # Run manually to see detailed errors
```

### "Terminology server not reachable"
**Problem**: TX server not running
**Options**:
1. Start your TX server
2. Skip validation: `SKIP_VALIDATION=1 git commit`
3. Use public server: Edit `TX_SERVER` in hook

### "Validator not found"
**Problem**: validator_cli.jar missing
**Solution**:
```bash
curl -L https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -o validator_cli.jar
```

### "Validation takes too long"
**Problem**: Validating too many resources
**Solutions**:
1. Reduce `VALIDATION_PATTERNS` (only validate profiles)
2. Use `SKIP_VALIDATION=1` for WIP commits
3. Increase Java heap: `export JAVA_OPTS="-Xmx4g"`

### "Can't find profile definitions"
**Problem**: Validator can't resolve local profiles
**Solution**: Ensure `LOCAL_IG_PATH` points to `fsh-generated` directory

## Advanced Configuration

### Custom Validator Location
```bash
# Global validator installation
VALIDATOR_JAR="/usr/local/bin/validator_cli.jar"

# User home directory
VALIDATOR_JAR="$HOME/.fhir/validator_cli.jar"
```

### Multiple IG Paths
```bash
# Load additional IGs for validation
VALIDATOR_CMD="java -jar $VALIDATOR_JAR \
  $CHANGED_RESOURCES \
  -version $FHIR_VERSION \
  -ig fsh-generated \
  -ig /path/to/another/ig \
  -tx $TX_SERVER"
```

### Custom Validation Levels
```bash
# Add -level parameter to validator command
VALIDATOR_CMD="$VALIDATOR_CMD -level errors"  # Errors only
VALIDATOR_CMD="$VALIDATOR_CMD -level warnings" # Errors + warnings
```

## Exporting to Other Projects

### Quick Install Script
```bash
#!/bin/bash
# install-hook.sh

# Copy to other IG project
cp pre-commit-hook-export.sh /path/to/other/ig/.git/hooks/pre-commit
chmod +x /path/to/other/ig/.git/hooks/pre-commit

# Download validator if not exists
cd /path/to/other/ig
[ ! -f validator_cli.jar ] && curl -L https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -o validator_cli.jar

# Add to gitignore
grep -q "validator_cli.jar" .gitignore || echo "validator_cli.jar" >> .gitignore

echo "✓ Pre-commit hook installed!"
```

### Team Distribution

**Option 1: Via Git Repository**
```bash
# Commit to repo for team (NOT in .git/hooks!)
mkdir -p scripts/git-hooks
cp pre-commit-hook-export.sh scripts/git-hooks/pre-commit
git add scripts/git-hooks/
git commit -m "Add pre-commit hook for team"

# Team members install:
cp scripts/git-hooks/pre-commit .git/hooks/
chmod +x .git/hooks/pre-commit
```

**Option 2: Via Documentation**
Include this README in your IG repository:
```bash
cp PRE-COMMIT-HOOK-README.md docs/DEVELOPMENT.md
git add docs/DEVELOPMENT.md
git commit -m "Add development setup documentation"
```

## Performance Tips

1. **Validate profiles only** (fastest):
   ```bash
   VALIDATION_PATTERNS="StructureDefinition-*.json"
   ```

2. **Use local TX server** (vs public):
   - Local: ~2 seconds per resource
   - Public: ~5-10 seconds per resource

3. **Batch validation** (current implementation):
   - Single JVM startup (~7 seconds)
   - vs Sequential: 7 seconds × N resources

4. **Skip for WIP commits**:
   ```bash
   alias gcwip='SKIP_VALIDATION=1 git commit'
   gcwip -m "WIP: Testing approach"
   ```

## Comparison: With vs Without Hook

### Without Hook
```
Edit FSH → Commit → Push → Wait 50min → CI fails → Fix → Push → Wait 50min...
Total time: 100+ minutes for 2 iterations
```

### With Hook
```
Edit FSH → Commit → Validate (10s) → Fix locally → Commit → Push → CI passes ✓
Total time: 10-20 seconds + 50 minutes (once)
```

**Time saved per development cycle: ~50-90 minutes**

## FAQ

**Q: Does this replace CI validation?**
A: No, it's an early warning system. CI validation is still the final gate.

**Q: Can I commit without validation?**
A: Yes, use `SKIP_VALIDATION=1` or `--no-verify`.

**Q: Will it work on Windows?**
A: Yes, but may require Git Bash or WSL for bash script execution.

**Q: Does it slow down commits?**
A: First commit: ~10 seconds. Subsequent commits with no changes: ~3 seconds (SUSHI only).

**Q: What if my TX server is down?**
A: Hook gracefully skips validation and continues with commit.

**Q: Can I customize validation rules?**
A: Yes, modify the validator command in the hook to add flags like `-level`, `-profile`, etc.

## Support & Contributing

For issues or improvements:
1. Test changes locally first
2. Document configuration changes
3. Share with team via git repository or wiki

## Credits

Developed for FHIR IG development workflows.
Based on best practices from HL7 FHIR community.

## License

MIT License - Free to use, modify, and distribute.
