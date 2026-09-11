// ─────────────────────────────────────────────────────────────────────────────
// Ported from kerndatensatz-basis (main): input/fsh/rulesets/crmi.fsh
//
// CRMI (Canonical Resource Management Infrastructure) metadata rulesets. The IG
// itself claims the CRMI shareable/publishable/computable ImplementationGuide
// profiles in sushi-config.yaml (`meta.profile`); these rulesets make the
// individual artifacts claim the matching CRMI profiles and carry the same
// metadata. The hl7.fhir.uv.crmi dependency in sushi-config.yaml is what makes
// them resolvable.
//
// Use CARET paths (`^…`) for resources declared with a FSH keyword — Profile,
// Extension, Logical, ValueSet, CodeSystem. Use INSTANCE paths for `InstanceOf:`
// resources such as CapabilityStatement or Parameters; those RuleSets carry the
// `…Instance` suffix.
//
// basis literals replaced by this repository's placeholders:
//   "2019+ Medical Informatics Initiative (MII)" → "2021+ …"
//   the basis artifact-author contact email      → thomas.debertshaeuser@charite.de
// The approval date and the artifact topic stay RuleSet PARAMETERS (as in
// basis); pass 2026-01-02 / C17457 at the call site.
// ─────────────────────────────────────────────────────────────────────────────

// ── Resource-independent version policy ──────────────────────────────────────

RuleSet: CRMIVersionPolicyStrict
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy"
* ^extension[=].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes#package "Package"

RuleSet: CRMIVersionPolicyStrictInstance
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy"
* extension[=].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes#package "Package"

// ── Copyright label ──────────────────────────────────────────────────────────
// basis notes that there is currently no resource type in the module where
// artifact-copyrightLabel is useful (and that the R5 cross-version extension is
// preferable where applicable) — the RuleSets are kept so a module that needs
// them does not re-invent the wording.

RuleSet: CRMICopyrightLabel
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-copyrightLabel"
* ^extension[=].valueString = "2021+ Medical Informatics Initiative (MII)"

RuleSet: CRMICopyrightLabelInstance
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-copyrightLabel"
* extension[=].valueString = "2021+ Medical Informatics Initiative (MII)"

// ── Approval date (StructureDefinition, CapabilityStatement, IG) ─────────────
// Call with the module's approval date, e.g. `insert CRMIApprovalDate(2026-01-02)`.

RuleSet: CRMIApprovalDate(approvalDate)
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/resource-approvalDate"
* ^extension[=].valueDate = "{approvalDate}"

RuleSet: CRMIApprovalDateInstance(approvalDate)
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/resource-approvalDate"
* extension[=].valueDate = "{approvalDate}"

// ── Artifact topic (StructureDefinition, CapabilityStatement, IG, CS, VS) ────
// MII codes module topics with the NCI Thesaurus. Call with the system and the
// module's topic code, e.g.
//   insert CRMIArtifactTopic(http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl, C17457)
// Repeat the insert for each topic of the module.

RuleSet: CRMIArtifactTopic(system, code)
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-topic"
* ^extension[=].valueCodeableConcept.coding[+] = {system}#{code}

RuleSet: CRMIArtifactTopicInstance(system, code)
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-topic"
* extension[=].valueCodeableConcept.coding[+] = {system}#{code}

// ── Artifact contributors ────────────────────────────────────────────────────
// Author = the module author (thomas.debertshaeuser@charite.de). Editor / reviewer /
// endorser are the MII-wide governance bodies and apply to every KDS module —
// the same values sushi-config.yaml sets on the IG resource. Adjust only if your
// module's governance differs.

RuleSet: CRMIArtifactContributors
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-author"
* ^extension[=].valueContactDetail.name = "Thomas Debertshäuser"
* ^extension[=].valueContactDetail.telecom[+].system = #email
* ^extension[=].valueContactDetail.telecom[=].value = "thomas.debertshaeuser@charite.de"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-editor"
* ^extension[=].valueContactDetail.name = "Taskforce Core Data Set"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-reviewer"
* ^extension[=].valueContactDetail.name = "Interoperability Working Group"
* ^extension[=].valueContactDetail.telecom[+].system = #url
* ^extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-reviewer"
* ^extension[=].valueContactDetail.name = "National Steering Committee"
* ^extension[=].valueContactDetail.telecom[+].system = #url
* ^extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-endorser"
* ^extension[=].valueContactDetail.name = "Interoperability Working Group"
* ^extension[=].valueContactDetail.telecom[+].system = #url
* ^extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-endorser"
* ^extension[=].valueContactDetail.name = "National Steering Committee"
* ^extension[=].valueContactDetail.telecom[+].system = #url
* ^extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"

RuleSet: CRMIArtifactContributorsInstance
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-author"
* extension[=].valueContactDetail.name = "Thomas Debertshäuser"
* extension[=].valueContactDetail.telecom[+].system = #email
* extension[=].valueContactDetail.telecom[=].value = "thomas.debertshaeuser@charite.de"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-editor"
* extension[=].valueContactDetail.name = "Taskforce Core Data Set"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-reviewer"
* extension[=].valueContactDetail.name = "Interoperability Working Group"
* extension[=].valueContactDetail.telecom[+].system = #url
* extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-reviewer"
* extension[=].valueContactDetail.name = "National Steering Committee"
* extension[=].valueContactDetail.telecom[+].system = #url
* extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-endorser"
* extension[=].valueContactDetail.name = "Interoperability Working Group"
* extension[=].valueContactDetail.telecom[+].system = #url
* extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-endorser"
* extension[=].valueContactDetail.name = "National Steering Committee"
* extension[=].valueContactDetail.telecom[+].system = #url
* extension[=].valueContactDetail.telecom[=].value = "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"

// ── StructureDefinition ──────────────────────────────────────────────────────

RuleSet: CRMIShareableStructureDefinition
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"

RuleSet: CRMIPublishableStructureDefinition
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"

RuleSet: CRMIKnowledgeCapabilitiesStructureDefinition
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #shareable
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #publishable

RuleSet: CRMIArtifactUsageLogicalModel
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-usage"
* ^extension[=].valueMarkdown = "Use this logical model as the module-specific information model for the Medical Informatics Initiative core dataset. The model describes clinically or administratively relevant information in a domain-oriented form and provides a bridge between the conceptual content specification and the corresponding technical FHIR profiles. It is a pattern for describing the intended content model and is not intended to be exchanged as a concrete FHIR resource instance. Implementers should use it to understand the scope, semantics, and structure of the module before applying the related FHIR profiles and mappings."

RuleSet: CRMIArtifactUsageProfile
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-usage"
* ^extension[=].valueMarkdown = "Use this profile as the technical FHIR representation of the corresponding Medical Informatics Initiative logical model. The profile constrains a base FHIR resource for the MII module context by specifying how elements are used, which elements are required or not used, which extensions and terminology bindings apply, and how the resource maps to the module-specific content model. Implementers should produce and consume resource instances that conform to this profile when exchanging data for the corresponding MII module."

RuleSet: CRMIArtifactUsageExtension
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-usage"
* ^extension[=].valueMarkdown = "Use this extension to exchange data for content of the corresponding Medical Informatics Initiative logical model that is not represented in the FHIR core resource structure."

// ── CapabilityStatement ──────────────────────────────────────────────────────

RuleSet: CRMIShareableCapabilityStatement
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecapabilitystatement"

RuleSet: CRMIPublishableCapabilityStatement
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecapabilitystatement"

RuleSet: CRMIKnowledgeCapabilitiesCapabilityStatement
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* extension[=].valueCode = #shareable
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* extension[=].valueCode = #publishable

RuleSet: CRMIArtifactUsageCapabilityStatement
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-usage"
* extension[=].valueMarkdown = "Use this CapabilityStatement to determine the minimum RESTful server capabilities required for a system that implements the corresponding module of the Medical Informatics Initiative core dataset. It lists the FHIR resource types and MII profiles that SHALL be supported, together with required interactions, supported formats, and search parameters for read and search access. Systems claiming conformance to the module are expected to implement the listed capabilities according to the stated conformance expectations."

// ── CodeSystem ───────────────────────────────────────────────────────────────

RuleSet: CRMIShareableCodeSystem
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecodesystem"

RuleSet: CRMIPublishableCodeSystem
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecodesystem"

RuleSet: CRMIKnowledgeCapabilitiesCodeSystem
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #shareable
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #publishable

RuleSet: CRMIKnowledgeCapabilitiesCodeSystemPublishable
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #publishable

// ── ValueSet ─────────────────────────────────────────────────────────────────

RuleSet: CRMIShareableValueSet
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset"

RuleSet: CRMIPublishableValueSet
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset"

RuleSet: CRMIComputableValueSet
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-computablevalueset"

RuleSet: CRMIKnowledgeCapabilitiesValueSet
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #shareable
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #publishable
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
* ^extension[=].valueCode = #computable


// ═════════════════════════════════════════════════════════════════════════════
// ANGESCHLOSSEN AM 2026-09-11 — bis dahin lagen alle RuleSets dieser Datei
// ungenutzt herum: 28 Definitionen, null Verwendungen. Der IG beanspruchte CRMI
// über sushi-config.yaml (meta.profile), seine Artefakte trugen davon nichts.
//
// WAS HIER ANGESCHLOSSEN WIRD und warum nur das:
//
//   experimental, version, title, description, url   die fünf Pflichtfelder des
//                                                    Shareable-Anspruchs
//   meta.profile shareable + publishable             der Anspruch selbst
//   cqf-knowledgeCapability                          dasselbe maschinenlesbar
//   artifact-versionPolicy                           Versionierung: package
//   package-source                                   Herkunft, falls die
//                                                    Ressource aus dem Paket
//                                                    gehoben wird
//   resource-effectivePeriod                         ab wann sie gilt
//   artifact-author                                  wer sie verfasst hat
//
// Jede dieser Angaben ist überprüfbar wahr, ohne dass jemand eine Entscheidung
// treffen müsste.
//
//   artifact-editor / -reviewer / -endorser          der MII-Governance-Prozess
//
// Zu den Gremien: das war zunächst als modulspezifische Behauptung eingeschätzt
// und übersprungen worden. Das war falsch. Sowohl kerndatensatz-meta als auch
// kerndatensatz-basis führen exakt dieselben drei Angaben -- Taskforce Core Data
// Set als editor, Interoperability Working Group und National Steering Committee
// als reviewer und endorser. Das ist keine Aussage über dieses Modul, sondern
// über das Verfahren, dem jedes KDS-Modul unterliegt; das Impressum der
// Startseite sagt dasselbe in Prosa.
//
// WAS WEITERHIN NICHT ANGESCHLOSSEN WIRD: resource-approvalDate. Das ist als
// einziges wirklich artefaktspezifisch -- meta setzt es auf genau vier seiner
// 172 Artefakte, basis auf ein anderes Datum. Es bezeichnet einen konkreten
// Freigabetermin, den für dieses Modul niemand benannt hat. Das RuleSet
// CRMIApprovalDate nimmt das Datum als Parameter entgegen und wartet darauf.
//
// ZUR HERKUNFT DER INHALTE: zwölf der Profile dieses Moduls leiten sich von
// HL7 Clinical Genomics Reporting STU3 ab, das selbst keinerlei CRMI-Metadaten
// führt (73 Artefakte, null Ansprüche). CRMI-Metadaten werden nicht vererbt --
// jede StructureDefinition trägt ihre eigenen --, technisch steht dem also
// nichts entgegen. Inhaltlich ist es wichtig: was hier als "author" steht,
// bezieht sich auf die MII-spezifische Einschränkung, NICHT auf das zugrunde
// liegende Modell. Das stammt von der Clinical-Genomics-Arbeitsgruppe von HL7
// und wird im Abschnitt "Danksagung" der Startseite ausdrücklich gewürdigt.
// ═════════════════════════════════════════════════════════════════════════════

// ── Die zwei Sammel-RuleSets, die an den Artefakten eingefügt werden ─────────
// Ein Aufruf je Artefakt, direkt neben `insert PR_CS_VS_Version`.

RuleSet: CRMIBaselineStructureDefinition
* ^experimental = false
* insert CRMIShareableStructureDefinition
* insert CRMIPublishableStructureDefinition
* insert CRMIKnowledgeCapabilitiesStructureDefinition
* insert CRMIVersionPolicyStrict
* insert CRMIArtifactContributors
* insert CRMIPackageSourceDefinitionalResource
* insert CRMIResourceEffectivePeriod

RuleSet: CRMIBaselineValueSet
* ^experimental = false
* insert CRMIShareableValueSet
* insert CRMIPublishableValueSet
* insert CRMIKnowledgeCapabilitiesValueSet
* insert CRMIVersionPolicyStrict
* insert CRMIArtifactContributors
* insert CRMIPackageSourceDefinitionalResource
