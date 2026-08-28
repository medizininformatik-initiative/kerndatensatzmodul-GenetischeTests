// ─────────────────────────────────────────────────────────────────────────────
// Ported from kerndatensatz-basis (main): input/fsh/rulesets/extension-context.fsh
//
// Declares where an Extension may be used. Repeat the insert for each allowed
// context, e.g. in input/fsh/extensions/MII_EX_<Module>_<Name>.fsh:
//   * insert ExtensionContext(Patient.address)
// Nothing module-specific, hence no placeholders.
// ─────────────────────────────────────────────────────────────────────────────

RuleSet: ExtensionContext(path)
* ^context[+].type = #element
* ^context[=].expression = "{path}"
