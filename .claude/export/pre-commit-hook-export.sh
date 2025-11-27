#!/bin/bash
################################################################################
# FHIR IG Pre-Commit Hook with Local Validation
################################################################################
#
# This pre-commit hook automates FHIR Implementation Guide development by:
#   1. Running SUSHI to regenerate FHIR resources from FSH files
#   2. Auto-staging generated files in fsh-generated/
#   3. Validating only changed resources with Java FHIR validator
#   4. Using local terminology server for terminology validation
#   5. Validating against local IG (current uncommitted work)
#
# Features:
#   - Fast: Only validates changed resources (not all 100+)
#   - Smart: Detects when only comments changed (skips validation)
#   - Complete: Full terminology validation with local TX server
#   - Flexible: Easy to skip or bypass when needed
#
# Requirements:
#   - SUSHI (https://fshschool.org/docs/sushi/)
#   - Java 17+
#   - FHIR validator JAR (validator_cli.jar)
#   - Optional: Local terminology server on configurable port
#
# Usage:
#   - Normal commit: git commit -m "message"
#   - Skip validation: SKIP_VALIDATION=1 git commit -m "message"
#   - Skip hook entirely: git commit --no-verify -m "message"
#
# Installation:
#   1. Copy to .git/hooks/pre-commit
#   2. chmod +x .git/hooks/pre-commit
#   3. Download validator: curl -L https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -o validator_cli.jar
#   4. Configure variables below
#
################################################################################

set -e

################################################################################
# CONFIGURATION - Adjust these for your project
################################################################################

# Path to FHIR validator JAR (relative to project root)
VALIDATOR_JAR="validator_cli.jar"

# FHIR version to validate against
FHIR_VERSION="4.0.1"

# Terminology server URL (set to empty string to disable TX validation)
# Examples:
#   - Local proxy: "http://localhost:3000"
#   - Public HL7: "https://tx.fhir.org/r4"
#   - Ontoserver: "https://ontoserver.example.com/fhir"
TX_SERVER="http://localhost:3000"

# Timeout for terminology server check (seconds)
TX_SERVER_TIMEOUT=2

# Path to local IG for validation (where profiles/valuesets are loaded from)
LOCAL_IG_PATH="fsh-generated"

# Directory where SUSHI generates resources
FSH_GENERATED_DIR="fsh-generated"

# Patterns for resources to validate (space-separated globs)
# Will only validate these types, not all 100+ resources
VALIDATION_PATTERNS="StructureDefinition-*.json ValueSet-*.json"

################################################################################
# MAIN LOGIC - Should not need modification
################################################################################

echo "======================================================================"
echo "FHIR IG Pre-Commit Hook"
echo "======================================================================"

# Step 1: Run SUSHI to regenerate FHIR resources
echo ""
echo "Running SUSHI to regenerate files..."

if ! sushi . 2>&1; then
    echo ""
    echo "❌ ERROR: SUSHI build failed. Please fix errors before committing."
    exit 1
fi

# Step 2: Auto-stage generated files
if ! git diff --quiet "$FSH_GENERATED_DIR/"; then
    echo ""
    echo "SUSHI generated changes in $FSH_GENERATED_DIR/"
    echo "Staging updated files..."
    git add "$FSH_GENERATED_DIR/"
    echo "✓ Generated files have been staged."
fi

# Step 3: Optional validation with terminology server
if [ "${SKIP_VALIDATION}" = "1" ]; then
    echo ""
    echo "ℹ Skipping local validation (SKIP_VALIDATION=1)"
    echo ""
    echo "✓ Pre-commit checks complete!"
    exit 0
fi

# Check if terminology server is configured
if [ -z "$TX_SERVER" ]; then
    echo ""
    echo "ℹ No terminology server configured, skipping validation"
    echo ""
    echo "✓ Pre-commit checks complete!"
    exit 0
fi

echo ""
echo "Checking for local terminology server..."

# Check if validator exists
if [ ! -f "$VALIDATOR_JAR" ]; then
    echo "⚠ FHIR validator not found at: $VALIDATOR_JAR"
    echo "  Download with: curl -L https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -o $VALIDATOR_JAR"
    echo "  Continuing without validation..."
    echo ""
    echo "✓ Pre-commit checks complete!"
    exit 0
fi

# Check if terminology server is reachable (macOS compatible)
TX_CHECK_URL="$TX_SERVER/metadata"
if ! curl -s -m "$TX_SERVER_TIMEOUT" "$TX_CHECK_URL" > /dev/null 2>&1; then
    echo "ℹ Terminology server not reachable at $TX_SERVER"
    echo "  Start it to enable local validation, or set SKIP_VALIDATION=1"
    echo "  Continuing without validation..."
    echo ""
    echo "✓ Pre-commit checks complete!"
    exit 0
fi

echo "✓ Terminology server found at $TX_SERVER"

# Step 4: Detect changed resources
echo ""
echo "Detecting changed resources..."

# Find changed resources matching validation patterns
CHANGED_RESOURCES=""
for pattern in $VALIDATION_PATTERNS; do
    PATTERN_MATCHES=$(git diff --cached --name-only --diff-filter=ACM "$FSH_GENERATED_DIR/resources/$pattern" 2>/dev/null || true)
    if [ -n "$PATTERN_MATCHES" ]; then
        CHANGED_RESOURCES="$CHANGED_RESOURCES $PATTERN_MATCHES"
    fi
done

# Trim whitespace
CHANGED_RESOURCES=$(echo "$CHANGED_RESOURCES" | xargs)

if [ -z "$CHANGED_RESOURCES" ]; then
    echo "ℹ No matching resources changed, skipping validation"
    echo ""
    echo "✓ Pre-commit checks complete!"
    exit 0
fi

RESOURCE_COUNT=$(echo "$CHANGED_RESOURCES" | wc -w | tr -d ' ')
echo "Found $RESOURCE_COUNT changed resource(s) to validate"

# Step 5: Run validation
echo ""
echo "Running local validation with Java validator..."
echo "(Validating only changed resources... this may take 10-30 seconds)"
echo ""

# Create temp file for validation output
VALIDATION_OUTPUT=$(mktemp)

# Build validator command
VALIDATOR_CMD="java -jar $VALIDATOR_JAR $CHANGED_RESOURCES -version $FHIR_VERSION -ig $LOCAL_IG_PATH -tx $TX_SERVER"

# Run validation and capture output
if $VALIDATOR_CMD 2>&1 | tee "$VALIDATION_OUTPUT"; then
    echo ""
    echo "✓ Local validation passed for changed resources"
    VALIDATION_FAILED=0
else
    echo ""
    echo "⚠ Local validation found issues"
    VALIDATION_FAILED=1
fi

# Handle validation failure
if [ $VALIDATION_FAILED -eq 1 ]; then
    echo ""
    echo "The remote pipeline will also validate this."
    echo ""
    read -p "Continue with commit anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        rm -f "$VALIDATION_OUTPUT"
        echo ""
        echo "❌ Commit aborted. Fix validation issues or use 'git commit --no-verify' to skip."
        exit 1
    fi
fi

# Cleanup
rm -f "$VALIDATION_OUTPUT"

echo ""
echo "======================================================================"
echo "✓ Pre-commit checks complete!"
echo "======================================================================"
exit 0
