# fix-ig-export-links Canonical Skill

**Status:** Architecture defined, implementation in progress

## Architecture

**Generator Pattern:** This skill generates module-specific bash scripts from configuration rather than maintaining separate static scripts per module.

```
┌─────────────────────────────────────────────────────────┐
│ Module: kerndatensatzmodul-onkologie                    │
├─────────────────────────────────────────────────────────┤
│ .claude/config.json                                     │
│   └── ig_export: { module_id, canonical_base, ... }    │
│                                                         │
│ .claude/skills/fix-ig-export-links/  (sync'd from      │
│   ├── SKILL.md                        mii-kds-dev)     │
│   ├── scripts/                                          │
│   │   └── fix-links.sh  ← GENERATED from config        │
│   └── templates/                                        │
│       └── script-template.sh  ← Template with params   │
└─────────────────────────────────────────────────────────┘
```

## Benefits

1. **Single source of truth**: One skill logic for all modules
2. **Config-driven**: Module differences in config, not code
3. **Maintainable**: Update template once, regenerate for all modules
4. **Adaptable**: IG structure changes only require template updates
5. **Testable**: Config validation before script generation

## Workflow

### Initial Setup (per module)

1. Add `ig_export` config to module's `.claude/config.json`
2. Sync skill from mii-kerndatensatz-dev
3. Run skill to generate `fix-links.sh`

### Using the Skill

1. Download IG export from Simplifier
2. Extract ZIP file
3. Run generated `fix-links.sh` in extracted directory
4. Verify remaining links are intentional

### Maintenance

**When dependencies change:**
- Update module config → regenerate script

**When IG structure changes:**
- Update template in mii-kds-dev → sync to modules → regenerate scripts

## Implementation Status

- ✅ Architecture defined
- ✅ Config schema documented
- ✅ SKILL.md created with instructions
- ✅ Script template created (templates/script-template.sh)
- ✅ Generator implementation complete (scripts/generate-fix-script.py)
- ⏳ Extract configs from existing 4 modules (next step)
- ⏳ Testing across 5 modules (pending)
- ⏳ Sync to modules (pending)

## Required Config Schema

See SKILL.md for complete schema. Minimum required:

```json
{
  "ig_export": {
    "module_id": "onkologie",
    "package_name": "de.medizininformatikinitiative.kerndatensatz.onkologie",
    "canonical_base": "https://...modul-onko",
    "guide_name": "mii-ig-modul-onkologie-v2026-de",
    "resource_prefix": "mii-pr-onko",
    "dependencies": {
      "hl7.fhir.r4.core": "4.0.1",
      "hl7.terminology.r4": "7.0.0",
      ...
    }
  }
}
```

## Files

- `SKILL.md` - Instructions for using the skill (config → script → run)
- `README.md` - This file (architecture documentation)
- `templates/script-template.sh` - Parameterized bash script template (TODO)
- `scripts/` - Generated scripts go here (one per module, generated on-demand)

## Migration Path

Current modules have static scripts. Migration:

1. Extract config from existing scripts → `.claude/config.json`
2. Sync canonical skill from mii-kds-dev
3. Generate script from config
4. Compare generated vs existing (should be equivalent)
5. Replace existing with generated
6. Document in CATALOG.md

## Version History

- **v1.0.0** (2026-01-10): Architecture defined, config schema documented
- **v1.1.0** (planned): Template + generator implementation
- **v2.0.0** (planned): Deployed to all 5 modules

---

Tracked in: kds-dz8
Canonical source: mii-kerndatensatz-dev
