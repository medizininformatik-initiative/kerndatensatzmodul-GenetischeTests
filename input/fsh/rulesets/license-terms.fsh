// ─────────────────────────────────────────────────────────────────────────────
// Ported from kerndatensatz-basis (main): input/fsh/rulesets/license-terms.fsh
//
// The machine-readable licence of an artifact, via the CRMI `crmi-license`
// extension on meta. Keep it consistent with `license:` in sushi-config.yaml
// (this template ships CC-BY-4.0, as basis does).
//   * insert LicenseCodeableCCBY40          — caret paths (Profile, VS, CS, …)
//   * insert LicenseCodeableCCBY40Instance  — Instance: … InstanceOf: …
// Verbatim from basis; nothing module-specific, hence no placeholders.
// ─────────────────────────────────────────────────────────────────────────────

Alias: $spdx-license = http://hl7.org/fhir/spdx-license

RuleSet: LicenseCodeableCCBY40
* ^meta.extension[+].url = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license"
* ^meta.extension[=].valueCode = #CC-BY-4.0

RuleSet: LicenseCodeableCCBY40Instance
* meta.extension[+].url = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license"
* meta.extension[=].valueCode = #CC-BY-4.0

RuleSet: LicenseCodeableCC0
* ^meta.extension[+].url = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license"
* ^meta.extension[=].valueCode = #CC0-1.0
