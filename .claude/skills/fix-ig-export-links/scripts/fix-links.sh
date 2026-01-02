#!/bin/bash
# Fix broken Simplifier resolve links in MII MolGen IG export

set -e
echo "Fixing MII MolGen IG export links..."

# Step 1: Fix artifacts/package/ -> artifacts/fsh-generated/resources/
echo "1. Fixing artifacts/package/ paths..."
sed -i '' 's|artifacts/package/|artifacts/fsh-generated/resources/|g' *.html

# Step 2: Fix MII MolGen profile canonical links - convert relative /resolve? to https://simplifier.net/resolve?
echo "2. Fixing MII MolGen profile canonical links..."
# Pattern: /resolve?&scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@VERSION&canonical=https://...
# Replace with: https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@VERSION&canonical=https://...&fhirVersion=R4
# Single-quoted href with regular & (canonical box FQL table) - capture and preserve the version
sed -i '' "s|'/resolve?&scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@\([^&]*\)&canonical=\(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/[^']*\)'|'https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@\1\&canonical=\2\&fhirVersion=R4'|g" *.html
# Double-quoted href with &amp; (HTML entity) - capture and preserve the version
sed -i '' "s|/resolve?&amp;scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@\([^&]*\)&amp;canonical=\(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/[^\"]*\)|https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@\1\&amp;canonical=\2\&amp;fhirVersion=R4|g" *.html

# Step 3: Fix FHIR R4 core links (both &amp; and & variants)
echo "3. Fixing FHIR R4 core links..."
# Full URL with regular & - StructureDefinition
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.r4.core@4.0.1&filepath=package/StructureDefinition-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/R4/\1.html|g' *.html
# Full URL with regular & - ValueSet
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.r4.core@4.0.1&filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/R4/valueset-\1.html|g' *.html
# Full URL with regular & - CodeSystem
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.r4.core@4.0.1&filepath=package/CodeSystem-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/R4/codesystem-\1.html|g' *.html
# Relative URL with &amp; (HTML entity)
sed -i '' 's|/resolve?scope=package:hl7.fhir.r4.core@4.0.1&amp;filepath=package/StructureDefinition-\([^.]*\)\.json|https://hl7.org/fhir/R4/\1.html|g' *.html

# Step 4: Fix Clinical Genomics STU3 links (both & and &amp; variants)
echo "4. Fixing Clinical Genomics STU3 links..."
# Full URL with regular & (StructureDefinition)
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.uv.genomics-reporting@3.0.0&filepath=package/StructureDefinition-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-\1.html|g' *.html
# Full URL with regular & (ValueSet)
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.uv.genomics-reporting@3.0.0&filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-\1.html|g' *.html
# Full URL with regular & (CodeSystem)
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.fhir.uv.genomics-reporting@3.0.0&filepath=package/CodeSystem-\([^.#"]*\)\.json[^"]*|https://hl7.org/fhir/uv/genomics-reporting/STU3/CodeSystem-\1.html|g' *.html
# Relative URL with &amp;
sed -i '' 's|/resolve?scope=package:hl7.fhir.uv.genomics-reporting@3.0.0&amp;filepath=package/StructureDefinition-\([^.]*\)\.json|https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-\1.html|g' *.html
sed -i '' "s|/resolve?&amp;scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@[^&]*&amp;canonical=http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/\([^'\"]*\)|https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-\1.html|g" *.html

# Step 4b: Fix HL7 Terminology (THO) links
echo "4b. Fixing HL7 Terminology links..."
# CodeSystem links to THO
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.terminology.r4@[^&]*&filepath=package/CodeSystem-\([^.#"]*\)\.json[^"]*|https://terminology.hl7.org/CodeSystem-\1.html|g' *.html
# NamingSystem links to THO
sed -i '' 's|https://simplifier.net/resolve?scope=package:hl7.terminology.r4@[^&]*&filepath=package/NamingSystem-\([^.#"]*\)\.json[^"]*|https://terminology.hl7.org/NamingSystem-\1.html|g' *.html

# Step 5: Fix FHIR R4 base StructureDefinition links (canonical box basis column)
echo "5. Fixing FHIR R4 base StructureDefinition links..."
# Single-quoted href with regular & (canonical box FQL table)
sed -i '' "s|'/resolve?&scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@[^&]*&canonical=http://hl7.org/fhir/StructureDefinition/\([^']*\)'|'https://hl7.org/fhir/R4/\1.html'|g" *.html
# Double-quoted href with &amp; (HTML entity)
sed -i '' "s|/resolve?&amp;scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@[^&]*&amp;canonical=http://hl7.org/fhir/StructureDefinition/\([^\"]*\)|https://hl7.org/fhir/R4/\1.html|g" *.html

# Step 6: Fix German base profile links (de.basisprofil.r4)
echo "6. Fixing German base profile links..."
# These should redirect to Simplifier with the correct package version
sed -i '' 's|https://simplifier.net/resolve?scope=package:de.basisprofil.r4@[^&]*&filepath=package/StructureDefinition-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/package/StructureDefinition-\1.json|g' *.html
sed -i '' 's|https://simplifier.net/resolve?scope=package:de.basisprofil.r4@[^&]*&filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/package/ValueSet-\1.json|g' *.html

# Step 7: Fix MII base ValueSet links (de.medizininformatikinitiative.kerndatensatz.base)
echo "7. Fixing MII base ValueSet links..."
sed -i '' 's|https://simplifier.net/resolve?scope=package:de.medizininformatikinitiative.kerndatensatz.base@[^&]*&filepath=package/ValueSet-\([^.#"]*\)\.json[^"]*|https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/ValueSet-\1.json|g' *.html

# Step 8: Fix internal MII MolGen profile references to local IG pages
echo "8. Fixing internal MII MolGen profile references..."
# These are references from one profile to another within the same IG (e.g., supportingInfo, derivedFrom)
# Map artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-*.json to local HTML pages
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-diagnostische-implikation\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-GenetischeImplikationen-DiagnostischeImplikation-Observation.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-therapeutische-implikation\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-GenetischeImplikationen-TherapeutischeImplikation-Observation.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-variante\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-GenetischeBefunde-Variante-Observation.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-genotyp\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-GenetischeBefunde-Genotyp---Observation.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-Workflow-Befundbericht-DiagnosticReport.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-anforderung-genetischer-test\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-Workflow-Anforderung-ServiceRequest.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-familienanamnese\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-Familienanamnese-Familienanamnese---FamilyMemberHistory.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-Therapieempfehlungen-EmpfohleneFolgemanahme-Task.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-medikationsempfehlung\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-Therapieempfehlungen-Medikationsempfehlung-Task.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-MolekulareBiomarker-Mikrosatelliteninstabilitt-Observation.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-mutationslast\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-MolekulareBiomarker-Mutationslast-Observation.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-polygener-risiko-score\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-MolekulareBiomarker-Polygener-Risiko-Score---RiskAssessment.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-genomic-study\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-Methodik-GenomicStudy-Procedure.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-genomic-study-analysis\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-Methodik-GenomicStudyAnalysis-Procedure.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-molekularer-biomarker\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-MolekulareBiomarker.html|g' *.html
# Additional profiles
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-haplotype\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-GenetischeBefunde-Haplotype-Observation.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-sequence-phase-relationship\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-GenetischeBefunde-Sequence-Phase-Relationship---Observation.html|g' *.html
sed -i '' 's|artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-molekulare-konsequenz\.json|MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-GenetischeImplikationen-MolekulareKonsequenz-Observation.html|g' *.html

# Step 9: Fix .page.md broken link
echo "9. Fixing .page.md broken link..."
sed -i '' 's|href="Extensions/Familienanamnese-Extensions.page.md"|href="MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-Familienanamnese-Familienanamnese-Extensions.html"|g' *.html

echo ""
echo "Done!"
