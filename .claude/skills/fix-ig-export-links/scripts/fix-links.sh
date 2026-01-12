#!/bin/bash
# Fix broken Simplifier resolve links in MII Molgen IG export
# Package: de.medizininformatikinitiative.kerndatensatz.molgen
# Canonical: https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen
# Generated: 2026-01-10 12:30:13

set -e
echo "Fixing MII Molgen IG export links..."
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


# =============================================================================
# Step 3: Fix German base profiles links
# =============================================================================
echo "3. Fixing German base profiles links..."

# StructureDefinition links
sed -i '' 's|https://simplifier.net/resolve?scope=package:de.basisprofil.r4@[^&]*&filepath=package/StructureDefinition-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/package/StructureDefinition-\1.json|g' *.html
sed -i '' 's|resolve?scope=package:de.basisprofil.r4@[^&]*&filepath=package/StructureDefinition-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/package/StructureDefinition-\1.json|g' *.html

# ValueSet links
sed -i '' 's|https://simplifier.net/resolve?scope=package:de.basisprofil.r4@[^&]*&filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/package/ValueSet-\1.json|g' *.html
sed -i '' 's|resolve?scope=package:de.basisprofil.r4@[^&]*&filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/package/ValueSet-\1.json|g' *.html

# CodeSystem links
sed -i '' 's|https://simplifier.net/resolve?scope=package:de.basisprofil.r4@[^&]*&filepath=package/CodeSystem-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/package/CodeSystem-\1.json|g' *.html

# Extension links
sed -i '' 's|https://simplifier.net/resolve?scope=package:de.basisprofil.r4@[^&]*&filepath=package/Extension-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/package/Extension-\1.json|g' *.html


# =============================================================================
# Step 4: Fix MII Base module links
# =============================================================================
echo "4. Fixing MII Base module links..."

# StructureDefinition links
sed -i '' 's|https://simplifier.net/resolve?scope=package:de.medizininformatikinitiative.kerndatensatz.base@[^&]*&filepath=package/StructureDefinition-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/StructureDefinition-\1.json|g' *.html
sed -i '' 's|resolve?scope=package:de.medizininformatikinitiative.kerndatensatz.base@[^&]*&filepath=package/StructureDefinition-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/StructureDefinition-\1.json|g' *.html

# ValueSet links
sed -i '' 's|https://simplifier.net/resolve?scope=package:de.medizininformatikinitiative.kerndatensatz.base@[^&]*&filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/ValueSet-\1.json|g' *.html
sed -i '' 's|resolve?scope=package:de.medizininformatikinitiative.kerndatensatz.base@[^&]*&filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/ValueSet-\1.json|g' *.html

# CodeSystem links
sed -i '' 's|https://simplifier.net/resolve?scope=package:de.medizininformatikinitiative.kerndatensatz.base@[^&]*&filepath=package/CodeSystem-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/CodeSystem-\1.json|g' *.html

# Extension links
sed -i '' 's|https://simplifier.net/resolve?scope=package:de.medizininformatikinitiative.kerndatensatz.base@[^&]*&filepath=package/Extension-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/Extension-\1.json|g' *.html


# =============================================================================
# Step N: Fix FHIR R4 base StructureDefinition links (canonical box basis column)
# =============================================================================
echo "5. Fixing FHIR R4 base StructureDefinition links (canonical box)..."

# Single-quoted href with regular & (canonical box FQL table)
sed -i '' "s|'/resolve?&scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@[^&]*&canonical=http://hl7.org/fhir/StructureDefinition/\([^']*\)'|'https://hl7.org/fhir/R4/\1.html'|g" *.html

# Double-quoted href with &amp; (HTML entity)
sed -i '' "s|/resolve?&amp;scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@[^&]*&amp;canonical=http://hl7.org/fhir/StructureDefinition/\([^\"]*\)|https://hl7.org/fhir/R4/\1.html|g" *.html

# Also fix FHIR ValueSet canonical references
sed -i '' "s|'/resolve?&scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@[^&]*&canonical=http://hl7.org/fhir/ValueSet/\([^']*\)'|'https://hl7.org/fhir/R4/valueset-\1.html'|g" *.html
sed -i '' "s|/resolve?&amp;scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@[^&]*&amp;canonical=http://hl7.org/fhir/ValueSet/\([^\"]*\)|https://hl7.org/fhir/R4/valueset-\1.html|g" *.html

# =============================================================================
# Step N+1: Fix MII Molgen profile canonical links (canonical box)
# =============================================================================
echo "6. Fixing MII Molgen profile canonical links..."

# Convert relative /resolve? to https://simplifier.net/resolve? with fhirVersion
# Single-quoted href with regular &
sed -i '' "s|'/resolve?&scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@\([^&]*\)&canonical=\(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/[^']*\)'|'https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@\1\&canonical=\2\&fhirVersion=R4'|g" *.html

# Double-quoted href with &amp;
sed -i '' "s|/resolve?&amp;scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@\([^&]*\)&amp;canonical=\(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/[^\"]*\)|https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@\1\&amp;canonical=\2\&amp;fhirVersion=R4|g" *.html


# =============================================================================
# Step N: Fix MII Core module canonical links
# =============================================================================
echo "N. Fixing MII Core module canonical links..."

# MII Diagnose -> kerndatensatz.base package
sed -i '' "s|'/resolve?&scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@[^&]*&canonical=https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose'|'https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/StructureDefinition-mii-pr-diagnose-condition.json'|g" *.html
sed -i '' "s|/resolve?&amp;scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@[^&]*&amp;canonical=https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose|https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/StructureDefinition-mii-pr-diagnose-condition.json|g" *.html

# MII Prozedur -> kerndatensatz.base package
sed -i '' "s|'/resolve?&scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@[^&]*&canonical=https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure'|'https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/StructureDefinition-mii-pr-prozedur-procedure.json'|g" *.html
sed -i '' "s|/resolve?&amp;scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@[^&]*&amp;canonical=https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure|https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/StructureDefinition-mii-pr-prozedur-procedure.json|g" *.html


# =============================================================================
# Step N+2: Fix internal ValueSet references -> Simplifier resolve (with scope)
# =============================================================================
echo "7. Fixing internal ValueSet references..."

# Generic pattern: artifacts/package/ValueSet-mii-vs-molgen-*.json -> Simplifier resolve with scope
sed -i '' 's|artifacts/package/ValueSet-\(mii-vs-molgen-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4\&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/\1\&fhirVersion=R4|g' *.html

# Also fix artifacts/fsh-generated/resources/ path variant
sed -i '' 's|artifacts/fsh-generated/resources/ValueSet-\(mii-vs-molgen-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4\&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/\1\&fhirVersion=R4|g' *.html

# =============================================================================
# Step N+3: Fix internal CodeSystem references -> Simplifier resolve (with scope)
# =============================================================================
echo "8. Fixing internal CodeSystem references..."

# Generic pattern: artifacts/package/CodeSystem-mii-cs-molgen-*.json -> Simplifier resolve with scope
sed -i '' 's|artifacts/package/CodeSystem-\(mii-cs-molgen-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4\&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/CodeSystem/\1\&fhirVersion=R4|g' *.html

# Also fix artifacts/fsh-generated/resources/ path variant
sed -i '' 's|artifacts/fsh-generated/resources/CodeSystem-\(mii-cs-molgen-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4\&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/CodeSystem/\1\&fhirVersion=R4|g' *.html

# =============================================================================
# Step N+4: Fix internal Extension references -> Simplifier resolve
# =============================================================================
echo "9. Fixing internal Extension references..."

# Fallback: any remaining mii-ex-molgen extensions -> Simplifier resolve (online)
sed -i '' 's|artifacts/package/StructureDefinition-\(mii-ex-molgen-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4\&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/\1\&fhirVersion=R4|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-\(mii-ex-molgen-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4\&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/\1\&fhirVersion=R4|g' *.html

# =============================================================================
# Step N+5: Fallback - Fix any remaining artifacts/package/ paths for profiles
# =============================================================================
echo "10. Fixing remaining artifacts/package/ paths..."

# Generic fallback: any remaining mii-pr-molgen profiles -> Simplifier resolve with scope
sed -i '' 's|artifacts/package/StructureDefinition-\(mii-pr-molgen-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4\&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/\1\&fhirVersion=R4|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-\(mii-pr-molgen-[^.#"]*\)\.json\([^"]*\)|https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4\&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/\1\&fhirVersion=R4|g' *.html

# =============================================================================
# Step N+6: Fix remaining direct MII canonical links (without resolve)
# =============================================================================
echo "11. Fixing remaining direct MII canonical links..."

# Fix any remaining direct href links to MII canonicals that were not caught by FQL
sed -i '' 's|href="https:\/\/www\.medizininformatik-initiative\.de\/fhir\/ext\/modul-molgen/StructureDefinition/\([^"]*\)"|href="https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4\&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/\1\&fhirVersion=R4"|g' *.html

# Fix MII ValueSet direct links
sed -i '' 's|href="https:\/\/www\.medizininformatik-initiative\.de\/fhir\/ext\/modul-molgen/ValueSet/\([^"]*\)"|href="https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4\&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/\1\&fhirVersion=R4"|g' *.html

# Fix MII CodeSystem direct links
sed -i '' 's|href="https:\/\/www\.medizininformatik-initiative\.de\/fhir\/ext\/modul-molgen/CodeSystem/\([^"]*\)"|href="https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4\&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/CodeSystem/\1\&fhirVersion=R4"|g' *.html

# =============================================================================
# Step FINAL-1: Clean up backup files
# =============================================================================
echo "12. Cleaning up backup files..."
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
