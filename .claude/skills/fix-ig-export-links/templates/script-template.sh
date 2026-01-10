#!/bin/bash
# Fix broken Simplifier resolve links in MII {{MODULE_NAME_DISPLAY}} IG export
# Package: {{PACKAGE_NAME}}
# Canonical: {{CANONICAL_BASE}}
# Generated: {{GENERATION_DATE}}

set -e
echo "Fixing MII {{MODULE_NAME_DISPLAY}} IG export links..."
echo ""

# =============================================================================
# Step 1: Fix FHIR R4 Core links (filepath pattern)
# =============================================================================
echo "1. Fixing FHIR R4 Core links..."

# StructureDefinition links
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.r4.core@4.0.1&filepath=package/StructureDefinition-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/R4/\1.html|g' *.html
sed -i '' 's|/resolve?scope=package:hl7.fhir.r4.core@4.0.1&amp;filepath=package/StructureDefinition-\([^.]*\)\.json|https://hl7.org/fhir/R4/\1.html|g' *.html

# ValueSet links
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.r4.core@4.0.1&filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/R4/valueset-\1.html|g' *.html

# CodeSystem links
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.r4.core@4.0.1&filepath=package/CodeSystem-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/R4/codesystem-\1.html|g' *.html

# With &amp; encoding
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.r4.core@4.0.1&amp;filepath=package/StructureDefinition-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/R4/\1.html|g' *.html
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.r4.core@4.0.1&amp;filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/R4/valueset-\1.html|g' *.html
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.r4.core@4.0.1&amp;filepath=package/CodeSystem-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/R4/codesystem-\1.html|g' *.html

# =============================================================================
# Step 2: Fix HL7 Terminology (THO) links
# =============================================================================
echo "2. Fixing HL7 Terminology (THO) links..."

# CodeSystem links to THO
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.terminology.r4@[^&]*&filepath=package/CodeSystem-\([^.#"]*\)\.json[^"]*|https://terminology.hl7.org/CodeSystem-\1.html|g' *.html
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.terminology.r4@[^&]*&amp;filepath=package/CodeSystem-\([^.#"]*\)\.json[^"]*|https://terminology.hl7.org/CodeSystem-\1.html|g' *.html

# ValueSet links to THO
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.terminology.r4@[^&]*&filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://terminology.hl7.org/ValueSet-\1.html|g' *.html
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.terminology.r4@[^&]*&amp;filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://terminology.hl7.org/ValueSet-\1.html|g' *.html

# NamingSystem links to THO
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.terminology.r4@[^&]*&filepath=package/NamingSystem-\([^.#"]*\)\.json[^"]*|https://terminology.hl7.org/NamingSystem-\1.html|g' *.html

{{DEPENDENCY_FIXES}}

# =============================================================================
# Step N: Fix FHIR R4 base StructureDefinition links (canonical box basis column)
# =============================================================================
echo "{{STEP_NUMBER_CANONICAL_BOX}}. Fixing FHIR R4 base StructureDefinition links (canonical box)..."

# Single-quoted href with regular & (canonical box FQL table)
sed -i '' "s|'/resolve?&scope=package:{{PACKAGE_NAME}}@[^&]*&canonical=http://hl7.org/fhir/StructureDefinition/\([^']*\)'|'https://hl7.org/fhir/R4/\1.html'|g" *.html

# Double-quoted href with &amp; (HTML entity)
sed -i '' "s|/resolve?&amp;scope=package:{{PACKAGE_NAME}}@[^&]*&amp;canonical=http://hl7.org/fhir/StructureDefinition/\([^\"]*\)|https://hl7.org/fhir/R4/\1.html|g" *.html

# Also fix FHIR ValueSet canonical references
sed -i '' "s|'/resolve?&scope=package:{{PACKAGE_NAME}}@[^&]*&canonical=http://hl7.org/fhir/ValueSet/\([^']*\)'|'https://hl7.org/fhir/R4/valueset-\1.html'|g" *.html
sed -i '' "s|/resolve?&amp;scope=package:{{PACKAGE_NAME}}@[^&]*&amp;canonical=http://hl7.org/fhir/ValueSet/\([^\"]*\)|https://hl7.org/fhir/R4/valueset-\1.html|g" *.html

# =============================================================================
# Step N+1: Fix MII {{MODULE_NAME_DISPLAY}} profile canonical links (canonical box)
# =============================================================================
echo "{{STEP_NUMBER_MODULE_CANONICAL}}. Fixing MII {{MODULE_NAME_DISPLAY}} profile canonical links..."

# Convert relative /resolve? to https://simplifier.net/resolve? with fhirVersion
# Single-quoted href with regular &
sed -i '' "s|'/resolve?&scope=package:{{PACKAGE_NAME}}@\([^&]*\)&canonical=\({{CANONICAL_BASE}}/[^']*\)'|'https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@\1\&canonical=\2\&fhirVersion=R4'|g" *.html

# Double-quoted href with &amp;
sed -i '' "s|/resolve?&amp;scope=package:{{PACKAGE_NAME}}@\([^&]*\)&amp;canonical=\({{CANONICAL_BASE}}/[^\"]*\)|https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@\1\&amp;canonical=\2\&amp;fhirVersion=R4|g" *.html

{{CORE_MODULE_FIXES}}

# =============================================================================
# Step N+2: Fix internal ValueSet references -> Simplifier resolve (with scope)
# =============================================================================
echo "{{STEP_NUMBER_VALUESETS}}. Fixing internal ValueSet references..."

# Generic pattern: artifacts/package/ValueSet-{{RESOURCE_PREFIX_VALUESET}}-*.json -> Simplifier resolve with scope
sed -i '' 's|artifacts/package/ValueSet-\({{RESOURCE_PREFIX_VALUESET}}-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@{{VERSION}}\&canonical={{CANONICAL_BASE}}/ValueSet/\1\&fhirVersion=R4|g' *.html

# Also fix artifacts/fsh-generated/resources/ path variant
sed -i '' 's|artifacts/fsh-generated/resources/ValueSet-\({{RESOURCE_PREFIX_VALUESET}}-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@{{VERSION}}\&canonical={{CANONICAL_BASE}}/ValueSet/\1\&fhirVersion=R4|g' *.html

# =============================================================================
# Step N+3: Fix internal CodeSystem references -> Simplifier resolve (with scope)
# =============================================================================
echo "{{STEP_NUMBER_CODESYSTEMS}}. Fixing internal CodeSystem references..."

# Generic pattern: artifacts/package/CodeSystem-{{RESOURCE_PREFIX_CODESYSTEM}}-*.json -> Simplifier resolve with scope
sed -i '' 's|artifacts/package/CodeSystem-\({{RESOURCE_PREFIX_CODESYSTEM}}-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@{{VERSION}}\&canonical={{CANONICAL_BASE}}/CodeSystem/\1\&fhirVersion=R4|g' *.html

# Also fix artifacts/fsh-generated/resources/ path variant
sed -i '' 's|artifacts/fsh-generated/resources/CodeSystem-\({{RESOURCE_PREFIX_CODESYSTEM}}-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@{{VERSION}}\&canonical={{CANONICAL_BASE}}/CodeSystem/\1\&fhirVersion=R4|g' *.html

# =============================================================================
# Step N+4: Fix internal Extension references -> Simplifier resolve
# =============================================================================
echo "{{STEP_NUMBER_EXTENSIONS}}. Fixing internal Extension references..."

# Fallback: any remaining {{RESOURCE_PREFIX_EXTENSION}} extensions -> Simplifier resolve (online)
sed -i '' 's|artifacts/package/StructureDefinition-\({{RESOURCE_PREFIX_EXTENSION}}-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@{{VERSION}}\&canonical={{CANONICAL_BASE}}/StructureDefinition/\1\&fhirVersion=R4|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-\({{RESOURCE_PREFIX_EXTENSION}}-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@{{VERSION}}\&canonical={{CANONICAL_BASE}}/StructureDefinition/\1\&fhirVersion=R4|g' *.html

# =============================================================================
# Step N+5: Fallback - Fix any remaining artifacts/package/ paths for profiles
# =============================================================================
echo "{{STEP_NUMBER_PROFILES}}. Fixing remaining artifacts/package/ paths..."

# Generic fallback: any remaining {{RESOURCE_PREFIX_PROFILE}} profiles -> Simplifier resolve with scope
sed -i '' 's|artifacts/package/StructureDefinition-\({{RESOURCE_PREFIX_PROFILE}}-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@{{VERSION}}\&canonical={{CANONICAL_BASE}}/StructureDefinition/\1\&fhirVersion=R4|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-\({{RESOURCE_PREFIX_PROFILE}}-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@{{VERSION}}\&canonical={{CANONICAL_BASE}}/StructureDefinition/\1\&fhirVersion=R4|g' *.html

# =============================================================================
# Step N+6: Fix remaining direct MII canonical links (without resolve)
# =============================================================================
echo "{{STEP_NUMBER_DIRECT_LINKS}}. Fixing remaining direct MII canonical links..."

# Fix any remaining direct href links to MII canonicals that were not caught by FQL
sed -i '' 's|href="{{CANONICAL_BASE_ESCAPED}}/StructureDefinition/\([^"]*\)"|href="https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@{{VERSION}}\&canonical={{CANONICAL_BASE}}/StructureDefinition/\1\&fhirVersion=R4"|g' *.html

# Fix MII ValueSet direct links
sed -i '' 's|href="{{CANONICAL_BASE_ESCAPED}}/ValueSet/\([^"]*\)"|href="https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@{{VERSION}}\&canonical={{CANONICAL_BASE}}/ValueSet/\1\&fhirVersion=R4"|g' *.html

# Fix MII CodeSystem direct links
sed -i '' 's|href="{{CANONICAL_BASE_ESCAPED}}/CodeSystem/\([^"]*\)"|href="https://simplifier.net/resolve?scope={{PACKAGE_NAME}}@{{VERSION}}\&canonical={{CANONICAL_BASE}}/CodeSystem/\1\&fhirVersion=R4"|g' *.html

# =============================================================================
# Step FINAL-1: Clean up backup files
# =============================================================================
echo "{{STEP_NUMBER_CLEANUP}}. Cleaning up backup files..."
find . -name "*''" -type f -delete 2>/dev/null || true

# =============================================================================
# Done
# =============================================================================
echo ""
echo "Done!"
echo ""
echo "Verify remaining resolve links:"
echo "  grep -c 'resolve?' *.html | grep -v ':0\$' | sort -t: -k2 -rn | head -10"
echo ""
echo "The remaining links should be intentional Simplifier canonical resolves."
