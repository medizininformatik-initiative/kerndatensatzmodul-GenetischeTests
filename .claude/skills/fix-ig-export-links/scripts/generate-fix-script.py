#!/usr/bin/env python3
"""
Generate fix-links.sh script from module configuration.

Reads .claude/config.json from the module repository and generates a customized
fix-links.sh script based on the module's dependencies and settings.

Usage:
  cd /path/to/kerndatensatzmodul-<module>
  python3 /path/to/this/script/generate-fix-script.py
"""

import json
import os
import sys
from datetime import datetime
from pathlib import Path

def load_module_config():
    """Load ig_export configuration from .claude/config.json"""
    config_path = Path(".claude/config.json")

    if not config_path.exists():
        print("ERROR: .claude/config.json not found in current directory", file=sys.stderr)
        print("Run this script from the module root directory", file=sys.stderr)
        sys.exit(1)

    with open(config_path) as f:
        config = json.load(f)

    if "ig_export" not in config:
        print("ERROR: ig_export configuration not found in .claude/config.json", file=sys.stderr)
        sys.exit(1)

    return config["ig_export"]

def validate_config(config):
    """Validate required configuration fields"""
    required = ["module_id", "package_name", "canonical_base", "guide_name", "resource_prefix", "dependencies"]

    missing = [field for field in required if field not in config]
    if missing:
        print(f"ERROR: Missing required fields in ig_export config: {', '.join(missing)}", file=sys.stderr)
        sys.exit(1)

    # Validate resource_prefix follows MII convention
    prefix = config["resource_prefix"]
    if not prefix.startswith("mii-"):
        print(f"WARNING: resource_prefix '{prefix}' doesn't follow MII convention (should start with 'mii-')", file=sys.stderr)

def generate_dependency_fixes(dependencies, step_start=3):
    """Generate sed commands for each dependency"""
    fixes = []
    step_num = step_start

    # Standard dependencies (German base profiles, MII modules)
    for package, version in dependencies.items():
        # Skip HL7 core packages (already handled in template)
        if package in ["hl7.fhir.r4.core", "hl7.terminology.r4"]:
            continue

        # Determine package display name
        if "de.basisprofil" in package:
            display_name = "German base profiles"
        elif "kerndatensatz" in package:
            # Extract module name from package
            parts = package.split(".")
            if len(parts) >= 4:
                module_name = parts[-1].replace("-", " ").title()
                display_name = f"MII {module_name} module"
            else:
                display_name = f"MII module ({package})"
        else:
            display_name = package

        fix_section = f"""
# =============================================================================
# Step {step_num}: Fix {display_name} links
# =============================================================================
echo "{step_num}. Fixing {display_name} links..."

# StructureDefinition links
sed -i '' 's|https://simplifier.net/resolve?scope=package:{package}@[^&]*&filepath=package/StructureDefinition-\\([^.#"]*\\)\\.json[^"]*|https://simplifier.net/packages/{package}/{version}/files/package/StructureDefinition-\\1.json|g' *.html
sed -i '' 's|resolve?scope=package:{package}@[^&]*&filepath=package/StructureDefinition-\\([^.#"]*\\)\\.json[^"]*|https://simplifier.net/packages/{package}/{version}/files/package/StructureDefinition-\\1.json|g' *.html

# ValueSet links
sed -i '' 's|https://simplifier.net/resolve?scope=package:{package}@[^&]*&filepath=package/ValueSet-\\([^.#"]*\\)\\.json[^"]*|https://simplifier.net/packages/{package}/{version}/files/package/ValueSet-\\1.json|g' *.html
sed -i '' 's|resolve?scope=package:{package}@[^&]*&filepath=package/ValueSet-\\([^.#"]*\\)\\.json[^"]*|https://simplifier.net/packages/{package}/{version}/files/package/ValueSet-\\1.json|g' *.html

# CodeSystem links
sed -i '' 's|https://simplifier.net/resolve?scope=package:{package}@[^&]*&filepath=package/CodeSystem-\\([^.#"]*\\)\\.json[^"]*|https://simplifier.net/packages/{package}/{version}/files/package/CodeSystem-\\1.json|g' *.html

# Extension links
sed -i '' 's|https://simplifier.net/resolve?scope=package:{package}@[^&]*&filepath=package/Extension-\\([^.#"]*\\)\\.json[^"]*|https://simplifier.net/packages/{package}/{version}/files/package/Extension-\\1.json|g' *.html
"""
        fixes.append(fix_section)
        step_num += 1

    return "\n".join(fixes), step_num

def generate_core_module_fixes(config):
    """Generate fixes for MII core module canonical links (diagnose, prozedur, etc.)"""
    # Only generate if base module is in dependencies
    dependencies = config.get("dependencies", {})
    base_version = dependencies.get("de.medizininformatikinitiative.kerndatensatz.base")

    if not base_version:
        return ""

    package_name = config["package_name"]

    return f"""
# =============================================================================
# Step N: Fix MII Core module canonical links
# =============================================================================
echo "N. Fixing MII Core module canonical links..."

# MII Diagnose -> kerndatensatz.base package
sed -i '' "s|'/resolve?&scope=package:{package_name}@[^&]*&canonical=https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose'|'https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/{base_version}/files/package/StructureDefinition-mii-pr-diagnose-condition.json'|g" *.html
sed -i '' "s|/resolve?&amp;scope=package:{package_name}@[^&]*&amp;canonical=https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose|https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/{base_version}/files/package/StructureDefinition-mii-pr-diagnose-condition.json|g" *.html

# MII Prozedur -> kerndatensatz.base package
sed -i '' "s|'/resolve?&scope=package:{package_name}@[^&]*&canonical=https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure'|'https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/{base_version}/files/package/StructureDefinition-mii-pr-prozedur-procedure.json'|g" *.html
sed -i '' "s|/resolve?&amp;scope=package:{package_name}@[^&]*&amp;canonical=https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure|https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/{base_version}/files/package/StructureDefinition-mii-pr-prozedur-procedure.json|g" *.html
"""

def fill_template(config):
    """Fill template with configuration values"""
    # Load template
    template_path = Path(__file__).parent.parent / "templates" / "script-template.sh"

    if not template_path.exists():
        print(f"ERROR: Template not found at {template_path}", file=sys.stderr)
        sys.exit(1)

    with open(template_path) as f:
        template = f.read()

    # Extract config values
    module_id = config["module_id"]
    package_name = config["package_name"]
    canonical_base = config["canonical_base"]
    resource_prefix = config["resource_prefix"]

    # Determine version (use "current" if not specified)
    version = config.get("version", "current")

    # Module display name (capitalize module_id)
    module_name_display = module_id.replace("-", " ").title()

    # Canonical base escaped for sed (escape dots and slashes)
    canonical_base_escaped = canonical_base.replace(".", r"\.").replace("/", r"\/")

    # Resource prefixes for different resource types
    # Most follow pattern: mii-pr-<module>, mii-vs-<module>, etc.
    # But allow customization via config
    prefix_base = resource_prefix  # e.g., "mii-pr-onko"

    # Extract the module part after the resource type
    # Assuming format: mii-<type>-<module>
    parts = prefix_base.split("-")
    if len(parts) >= 3:
        module_part = "-".join(parts[2:])  # Everything after "mii-<type>"
        prefix_profile = f"mii-pr-{module_part}"
        prefix_valueset = f"mii-vs-{module_part}"
        prefix_codesystem = f"mii-cs-{module_part}"
        prefix_extension = f"mii-ex-{module_part}"
    else:
        # Fallback: use resource_prefix as-is
        prefix_profile = resource_prefix
        prefix_valueset = resource_prefix.replace("-pr-", "-vs-")
        prefix_codesystem = resource_prefix.replace("-pr-", "-cs-")
        prefix_extension = resource_prefix.replace("-pr-", "-ex-")

    # Generate dependency fixes
    dependency_fixes, next_step = generate_dependency_fixes(config["dependencies"])

    # Generate core module fixes
    core_module_fixes = generate_core_module_fixes(config)

    # Calculate step numbers for template sections
    step_canonical_box = next_step
    step_module_canonical = next_step + 1
    step_valuesets = next_step + 2
    step_codesystems = next_step + 3
    step_extensions = next_step + 4
    step_profiles = next_step + 5
    step_direct_links = next_step + 6
    step_cleanup = next_step + 7

    # Fill in template placeholders
    replacements = {
        "{{MODULE_NAME_DISPLAY}}": module_name_display,
        "{{MODULE_ID}}": module_id,
        "{{PACKAGE_NAME}}": package_name,
        "{{CANONICAL_BASE}}": canonical_base,
        "{{CANONICAL_BASE_ESCAPED}}": canonical_base_escaped,
        "{{VERSION}}": version,
        "{{RESOURCE_PREFIX_PROFILE}}": prefix_profile,
        "{{RESOURCE_PREFIX_VALUESET}}": prefix_valueset,
        "{{RESOURCE_PREFIX_CODESYSTEM}}": prefix_codesystem,
        "{{RESOURCE_PREFIX_EXTENSION}}": prefix_extension,
        "{{GENERATION_DATE}}": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "{{DEPENDENCY_FIXES}}": dependency_fixes,
        "{{CORE_MODULE_FIXES}}": core_module_fixes,
        "{{STEP_NUMBER_CANONICAL_BOX}}": str(step_canonical_box),
        "{{STEP_NUMBER_MODULE_CANONICAL}}": str(step_module_canonical),
        "{{STEP_NUMBER_VALUESETS}}": str(step_valuesets),
        "{{STEP_NUMBER_CODESYSTEMS}}": str(step_codesystems),
        "{{STEP_NUMBER_EXTENSIONS}}": str(step_extensions),
        "{{STEP_NUMBER_PROFILES}}": str(step_profiles),
        "{{STEP_NUMBER_DIRECT_LINKS}}": str(step_direct_links),
        "{{STEP_NUMBER_CLEANUP}}": str(step_cleanup),
    }

    # Apply all replacements
    result = template
    for placeholder, value in replacements.items():
        result = result.replace(placeholder, value)

    return result

def main():
    print("MII IG Export Links Fix Script Generator")
    print("=" * 50)
    print()

    # Load and validate config
    config = load_module_config()
    validate_config(config)

    print(f"Module: {config['module_id']}")
    print(f"Package: {config['package_name']}")
    print(f"Canonical: {config['canonical_base']}")
    print(f"Dependencies: {len(config['dependencies'])}")
    print()

    # Generate script
    print("Generating fix-links.sh...")
    script_content = fill_template(config)

    # Ensure output directory exists
    output_dir = Path(".claude/skills/fix-ig-export-links/scripts")
    output_dir.mkdir(parents=True, exist_ok=True)

    # Write output
    output_path = output_dir / "fix-links.sh"
    with open(output_path, "w") as f:
        f.write(script_content)

    # Make executable
    os.chmod(output_path, 0o755)

    print(f"✓ Generated: {output_path}")
    print()
    print("Next steps:")
    print("1. Download IG export from Simplifier")
    print("2. Extract ZIP file")
    print(f"3. Run: cd <extracted-dir> && bash {output_path.absolute()}")
    print("4. Verify: grep -c 'resolve?' *.html | grep -v ':0$'")

if __name__ == "__main__":
    main()
