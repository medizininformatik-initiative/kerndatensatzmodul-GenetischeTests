#!/bin/bash
################################################################################
# LOINC Answer Code (LA) Validation Script
################################################################################
#
# This script extracts all LOINC answer codes (LA-*) from FSH-generated
# resources and validates them against a terminology server.
#
# Usage:
#   ./validate-la-codes.sh [terminology-server-url]
#
# Examples:
#   ./validate-la-codes.sh http://localhost:3000
#   ./validate-la-codes.sh https://tx.fhir.org/r4
#
################################################################################

set -e

# Configuration
TX_SERVER="${1:-http://localhost:3000}"
FSH_RESOURCES="fsh-generated/resources"
OUTPUT_FILE="la-code-validation-results.txt"

echo "======================================================================"
echo "LOINC Answer Code (LA) Validation"
echo "======================================================================"
echo "Terminology Server: $TX_SERVER"
echo "Scanning: $FSH_RESOURCES"
echo ""

# Check if TX server is reachable
if ! curl -s -m 5 "$TX_SERVER/metadata" > /dev/null 2>&1; then
    echo "❌ ERROR: Terminology server not reachable at $TX_SERVER"
    echo "   Make sure the server is running and accessible."
    exit 1
fi

echo "✓ Terminology server is reachable"
echo ""

# Extract all LA codes from JSON files
echo "Extracting LA codes from resources..."
LA_CODES=$(grep -roh '"LA[0-9]\+-[0-9]\+"' "$FSH_RESOURCES" | \
           sort -u | \
           tr -d '"')

LA_COUNT=$(echo "$LA_CODES" | wc -l | tr -d ' ')
echo "Found $LA_COUNT unique LA codes"
echo ""

# Clear output file
> "$OUTPUT_FILE"

# Validate each LA code
echo "Validating LA codes against terminology server..."
echo "=====================================================================" >> "$OUTPUT_FILE"
echo "LOINC Answer Code Validation Results" >> "$OUTPUT_FILE"
echo "Generated: $(date)" >> "$OUTPUT_FILE"
echo "Server: $TX_SERVER" >> "$OUTPUT_FILE"
echo "=====================================================================" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

VALID_COUNT=0
INVALID_COUNT=0
ERROR_COUNT=0

while IFS= read -r code; do
    if [ -z "$code" ]; then
        continue
    fi

    echo -n "  Checking $code... "

    # Use CodeSystem/$lookup operation
    TEMP_FILE=$(mktemp)
    HTTP_CODE=$(curl -s -w "%{http_code}" -o "$TEMP_FILE" \
        "$TX_SERVER/CodeSystem/\$lookup?system=http://loinc.org&code=$code" \
        2>&1)
    BODY=$(cat "$TEMP_FILE")
    rm -f "$TEMP_FILE"

    if [ "$HTTP_CODE" = "200" ]; then
        # Check if response contains error
        if echo "$BODY" | grep -q '"severity":"error"'; then
            echo "❌ INVALID"
            echo "❌ $code - INVALID (not found in LOINC)" >> "$OUTPUT_FILE"
            ((INVALID_COUNT++))
        else
            # Extract display name if available
            DISPLAY=$(echo "$BODY" | grep -o '"display":"[^"]*"' | head -1 | cut -d'"' -f4)
            echo "✓ VALID${DISPLAY:+ - $DISPLAY}"
            echo "✓ $code - VALID${DISPLAY:+ - $DISPLAY}" >> "$OUTPUT_FILE"
            ((VALID_COUNT++))
        fi
    else
        echo "⚠ ERROR (HTTP $HTTP_CODE)"
        echo "⚠ $code - ERROR (HTTP $HTTP_CODE)" >> "$OUTPUT_FILE"
        ((ERROR_COUNT++))
    fi

    # Small delay to avoid overwhelming the server
    sleep 0.1

done <<< "$LA_CODES"

# Summary
echo ""
echo "======================================================================"
echo "Validation Summary"
echo "======================================================================"
echo "Total LA codes:    $LA_COUNT"
echo "✓ Valid:           $VALID_COUNT"
echo "❌ Invalid:        $INVALID_COUNT"
echo "⚠ Errors:          $ERROR_COUNT"
echo ""
echo "Detailed results saved to: $OUTPUT_FILE"

# Add summary to output file
echo "" >> "$OUTPUT_FILE"
echo "=====================================================================" >> "$OUTPUT_FILE"
echo "Summary" >> "$OUTPUT_FILE"
echo "=====================================================================" >> "$OUTPUT_FILE"
echo "Total LA codes:    $LA_COUNT" >> "$OUTPUT_FILE"
echo "✓ Valid:           $VALID_COUNT" >> "$OUTPUT_FILE"
echo "❌ Invalid:        $INVALID_COUNT" >> "$OUTPUT_FILE"
echo "⚠ Errors:          $ERROR_COUNT" >> "$OUTPUT_FILE"

# Exit with error if any invalid codes found
if [ $INVALID_COUNT -gt 0 ]; then
    echo ""
    echo "⚠ Found $INVALID_COUNT invalid LA code(s). Check $OUTPUT_FILE for details."
    exit 1
fi

echo ""
echo "✓ All LA codes are valid!"
exit 0
