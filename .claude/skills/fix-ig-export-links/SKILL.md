---
name: fix-ig-export-links
description: Fix broken Simplifier resolve links in downloaded MII Implementation Guide exports. Use when downloading an IG from Simplifier and links are broken, preparing an IG export for offline use, or making links work both locally and on the official MII page. Handles MII MolGen profile canonical links, FHIR R4 core links, Clinical Genomics links, HL7 Terminology links, German base profiles, and artifacts/package/ paths.
---

# Fix IG Export Links

Fix broken `/resolve?` links in Simplifier IG exports to work offline and on official MII pages.

## Link Categories and Targets

| Category | Source Pattern | Target |
|----------|---------------|--------|
| **MII MolGen Canonical** | `/resolve?&scope=...molgen...&canonical=https://...modul-molgen/...` | `https://simplifier.net/resolve?canonical=...&fhirVersion=R4` |
| **FHIR R4 Base** (Basis column) | `/resolve?&scope=...&canonical=http://hl7.org/fhir/StructureDefinition/...` | `https://hl7.org/fhir/R4/....html` |
| **FHIR R4 Core** (filepath) | `simplifier.net/resolve?...hl7.fhir.r4.core...filepath=...` | `https://hl7.org/fhir/R4/...` |
| **Clinical Genomics STU3** | `simplifier.net/resolve?...genomics-reporting@3.0.0...` | `https://hl7.org/fhir/uv/genomics-reporting/STU3/...` |
| **HL7 Terminology (THO)** | `simplifier.net/resolve?...hl7.terminology.r4...` | `https://terminology.hl7.org/...` |
| **German base profiles** | `simplifier.net/resolve?...de.basisprofil.r4...` | `https://simplifier.net/packages/de.basisprofil.r4/.../files/...` |
| **MII base ValueSets** | `simplifier.net/resolve?...kerndatensatz.base...` | `https://simplifier.net/packages/.../files/...` |
| **artifacts/package/** | `artifacts/package/` | `artifacts/fsh-generated/resources/` |
| **.page.md broken link** | `Extensions/Familienanamnese-Extensions.page.md` | Correct HTML page |

## Procedure

1. Download and extract the IG ZIP from Simplifier to a working directory
2. Navigate to the extracted directory containing HTML files
3. Run the fix script:
   ```bash
   cd /path/to/extracted-ig
   bash /path/to/fix-links.sh
   ```
4. Verify remaining resolve links (should only be intentional Simplifier links):
   ```bash
   grep -c "resolve?" *.html | grep -v ":0$"
   ```

## Script Location

The fix script is located at: `.claude/skills/fix-ig-export-links/scripts/fix-links.sh`

## Technical Notes

### HTML Encoding Variants
The script handles two encoding patterns:
- **Single-quoted href with `&`**: Used in FQL canonical box tables (`href='...'`)
- **Double-quoted href with `&amp;`**: Used elsewhere (`href="..."`)

### Link Pattern Types
- **`?canonical=`**: Links to profile canonical URLs (should resolve via Simplifier)
- **`?filepath=`**: Links to package files (should resolve to official spec URLs)

### Expected Remaining Links
After running the script, these Simplifier resolve links are intentional:
- MII MolGen profile canonical URLs → `https://simplifier.net/resolve?canonical=...&fhirVersion=R4`
- CapabilityStatement canonical → remains as Simplifier resolve

## Example Usage

```bash
# Extract the downloaded IG
unzip "MII-Modul-MolekulargenetischerBefundbericht-v2026-DE@current.zip" -d ig-export

# Run the fix script
cd ig-export
bash ~/.claude/skills/fix-ig-export-links/scripts/fix-links.sh

# Verify - count should show only intentional Simplifier links
grep -o "simplifier.net/resolve" *.html | wc -l
```
