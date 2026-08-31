// ─────────────────────────────────────────────────────────────────────────────
// Ported from kerndatensatz-basis (main): input/fsh/rulesets/cps-rules.fsh
// basis literal 2026.0.1 (the pinned supportedProfile version) → 2026.0.4.
//
// Building blocks for a module CapabilityStatement (input/fsh/capabilitystatements/,
// naming MII_CPS_<Module>). They are ORDER-DEPENDENT: `SupportResource` opens a
// resource entry, every `Support…` RuleSet after it applies to that entry via the
// `[=]` (current index) soft-index. Example:
//
//   * insert SupportResource(Patient, #SHALL)
//   * insert SupportProfile(https://…/StructureDefinition/example-patient, #SHALL)
//   * insert SupportInteraction(#read, #SHALL)
//   * insert SupportSearchParam(identifier, http://hl7.org/fhir/SearchParameter/Patient-identifier, #token, #SHALL)
//
// The expectation codes are the FHIR conformance-expectation codes
// (#SHALL | #SHOULD | #MAY | #SHOULD-NOT).
// ─────────────────────────────────────────────────────────────────────────────

RuleSet: SupportSpecialSearchParam (name, type, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].searchParam[+].name = "{name}"
* rest.resource[=].searchParam[=].type = {type}
* rest.resource[=].searchParam[=].extension[0].url = $exp
* rest.resource[=].searchParam[=].extension[0].valueCode = {expectation}
