// switch version of all conformance resources here
RuleSet: Version
* version = "2027.0.0-ballot.rc1"

RuleSet: PR_CS_VS_Version
* ^version = "2027.0.0-ballot.rc1"

RuleSet: MetaProfile(canonical)
* meta.profile[+] = "{canonical}|2027.0.0-ballot.rc1"

// ---- appended from mii-kds-module-template v0.13.0 (rulesets/version.fsh) during the IG-template migration; module definitions win ----
Alias: $artifact-versionAlgorithm = http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm
Alias: $version-algorithm = http://hl7.org/fhir/version-algorithm

// Package provenance (meta.extension) — repeats packageId, version and canonical
// so a resource lifted out of the package still says where it came from.
RuleSet: CRMIPackageSource
* meta.extension[+].url = "http://hl7.org/fhir/StructureDefinition/package-source"
* meta.extension[=].extension[+].url = "packageId"
* meta.extension[=].extension[=].valueId = "de.medizininformatikinitiative.kerndatensatz.molgen"
* meta.extension[=].extension[+].url = "version"
* meta.extension[=].extension[=].valueString = "2027.0.0-ballot.rc1"
* meta.extension[=].extension[+].url = "uri"
* meta.extension[=].extension[=].valueUri = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen"

RuleSet: CRMIPackageSourceDefinitionalResource
* ^meta.extension[+].url = "http://hl7.org/fhir/StructureDefinition/package-source"
* ^meta.extension[=].extension[+].url = "packageId"
* ^meta.extension[=].extension[=].valueId = "de.medizininformatikinitiative.kerndatensatz.molgen"
* ^meta.extension[=].extension[+].url = "version"
* ^meta.extension[=].extension[=].valueString = "2027.0.0-ballot.rc1"
* ^meta.extension[=].extension[+].url = "uri"
* ^meta.extension[=].extension[=].valueUri = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen"

// Resource-independent effective period (StructureDefinition,
// CapabilityStatement, ImplementationGuide). A release stays the valid
// implemented version until a later release replaces it, so basis expresses only
// the applicability START — do not add an end date.
RuleSet: CRMIResourceEffectivePeriod
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod"
* ^extension[=].valuePeriod.start = "2026"

RuleSet: CRMIResourceEffectivePeriodInstance
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod"
* extension[=].valuePeriod.start = "2026"
