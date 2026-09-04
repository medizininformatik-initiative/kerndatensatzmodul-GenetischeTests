Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $ObsCat = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $HGNC = http://www.genenames.org/geneId
Alias: $HGVS = http://varnomen.hgvs.org
Alias: $SO = http://sequenceontology.org
Alias: $NCIT = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl
Alias: $RefSeq = http://www.ncbi.nlm.nih.gov/refseq
Alias: $dbSNP = http://www.ncbi.nlm.nih.gov/projects/SNP
Alias: $ISCN = urn:oid:2.16.840.1.113883.6.299
Alias: $ChromLoc = urn:oid:2.16.840.1.113883.6.335
Alias: $GenTbd = http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs
Alias: $VariantConfidenceStatus = http://terminology.hl7.org/CodeSystem/variant-confidence-status-cs
Alias: $ATC = http://www.whocc.no/atc
Alias: $TaskStatus = http://hl7.org/fhir/task-status
Alias: $RequestIntent = http://hl7.org/fhir/request-intent
Alias: $DiagRepStatus = http://hl7.org/fhir/diagnostic-report-status
Alias: $v2-0074 = http://terminology.hl7.org/CodeSystem/v2-0074
Alias: $UCUM = http://unitsofmeasure.org
Alias: $DeviceNameType = http://hl7.org/fhir/device-nametype
Alias: $AdminGender = http://hl7.org/fhir/administrative-gender
Alias: $ICD10GM = http://fhir.de/CodeSystem/bfarm/icd-10-gm
Alias: $ICD10GM-Coding = http://fhir.de/StructureDefinition/CodingICD10GM
Alias: $AlphaID-Coding = http://fhir.de/StructureDefinition/CodingAlphaID

// MII Diagnose Module ValueSets (use these instead of generic de.basisprofil)
Alias: $MII-VS-Diagnose-ICD10GM = https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm
Alias: $MII-VS-Diagnose-AlphaID = https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid
Alias: $MII-VS-Diagnose-SCT = https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct
Alias: $MII-VS-Diagnose-Orphanet = https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet

// Deprecated - use MII-specific ValueSets above
Alias: $ICD10GM-VS = http://fhir.de/ValueSet/bfarm/icd-10-gm
Alias: $AlphaID-VS = http://fhir.de/ValueSet/bfarm/alpha-id
Alias: $SCT-Diagnoses-VS = https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct
Alias: $HPO = http://human-phenotype-ontology.org
Alias: $OMIM = http://www.omim.org
Alias: $ClinVarVID = http://www.ncbi.nlm.nih.gov/clinvar
Alias: $RelArtType = http://hl7.org/fhir/related-artifact-type
Alias: $EBM = https://fhir.kbv.de/NamingSystem/KBV_NS_Base_EBM
Alias: $RiskProbability = http://terminology.hl7.org/CodeSystem/risk-probability
Alias: $ORPHA = http://www.orpha.net
Alias: $ClinVarEvLv = http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/clinvar-evidence-level-custom-cs
Alias: $v3-RoleCode-cs = http://terminology.hl7.org/CodeSystem/v3-RoleCode
Alias: $v3-RoleCode-vs = http://terminology.hl7.org/ValueSet/v3-PersonalRelationshipRoleType



// ---- appended from mii-kds-module-template v0.13.0 (aliases.fsh) during the IG-template migration; module definitions win ----
// UNUSED, kept only so the template's alias set stays recognisable: all 92 SNOMED
// codes in this module are written with $SCT (unversioned, line 2). The version
// that actually binds is the one in input/resources/Parameters-expansion-manifest.json;
// editing the alias below changes nothing. Kept in sync with the manifest so the two
// never contradict each other in a reader's eyes.
Alias: $sct = http://snomed.info/sct|http://snomed.info/sct/900000000000207008/version/20260701
Alias: $sct-no-ver = http://snomed.info/sct

// ── Further code systems used across MII modules ─────────────────────────────
Alias: $loinc = http://loinc.org
Alias: $icd-10 = http://hl7.org/fhir/sid/icd-10
Alias: $icd-10-gm = http://fhir.de/CodeSystem/bfarm/icd-10-gm
Alias: $icd-o-3 = http://terminology.hl7.org/CodeSystem/icd-o-3
Alias: $alpha-id = http://fhir.de/CodeSystem/bfarm/alpha-id
Alias: $alpha-id-vs = http://fhir.de/ValueSet/bfarm/alpha-id
Alias: $ops = http://fhir.de/CodeSystem/bfarm/ops
Alias: $orpha = http://www.orpha.net

// ── HL7 terminology ──────────────────────────────────────────────────────────
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $v3-ObservationValue = http://terminology.hl7.org/CodeSystem/v3-ObservationValue
Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $v3-ActPriority = http://terminology.hl7.org/CodeSystem/v3-ActPriority
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

// ── German base profiles (de.basisprofil.r4, a pinned dependency) ────────────
Alias: $identifier-type-de-basis = http://fhir.de/CodeSystem/identifier-type-de-basis
Alias: $gender-amtlich-de = http://fhir.de/CodeSystem/gender-amtlich-de
Alias: $ags = http://fhir.de/sid/destatis/ags

// ── FHIR core extensions / MII cross-module ──────────────────────────────────
Alias: $data-absent-reason = http://hl7.org/fhir/StructureDefinition/data-absent-reason
Alias: $MII-Reference = https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference

// ── CRMI (hl7.fhir.uv.crmi, a pinned dependency) ─────────────────────────────
// The full basis block. The profiles are claimed via the RuleSets in
// input/fsh/rulesets/crmi.fsh; these aliases let you reference them directly.
Alias: $crmi-license = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license
Alias: $crmi-license-detail = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-licenseDetail
Alias: $crmi-manifestlibrary = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-manifestlibrary
Alias: $crmi-manifestparameters = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-manifestparameters
Alias: $crmi-referenceSource = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-referenceSource
Alias: $crmi-softwaresystem = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-softwaresystem
//Alias: $crmi-artifact-signature = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-artifact-signature
Alias: $crmi-shareableimplementationguide = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareableimplementationguide
Alias: $crmi-publishableimplementationguide = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishableimplementationguide
Alias: $crmi-shareablestructuredefinition = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition
Alias: $crmi-publishablestructuredefinition = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition
Alias: $crmi-shareablevalueset = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset
Alias: $crmi-computablevalueset = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-computablevalueset
Alias: $crmi-publishablevalueset = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset
Alias: $crmi-expandedvalueset = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-expandedvalueset
Alias: $crmi-shareablecodesystem = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecodesystem
Alias: $crmi-publishablecodesystem = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecodesystem
Alias: $crmi-shareablecapabilitystatement = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecapabilitystatement
Alias: $crmi-publishablecapabilitystatement = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecapabilitystatement
Alias: $crmi-shareablesearchparameter = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablesearchparameter
Alias: $crmi-publishablesearchparameter = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablesearchparameter
Alias: $crmi-publishable-bundle = http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishable-bundle
Alias: $crmi-release-version-behavior-codes = http://hl7.org/fhir/uv/crmi/CodeSystem/crmi-release-version-behavior-codes
Alias: $crmi-release-experimental-behavior-codes = http://hl7.org/fhir/uv/crmi/CodeSystem/crmi-release-experimental-behavior-codes
Alias: $crmi-release-version-behavior = http://hl7.org/fhir/uv/crmi/ValueSet/crmi-release-version-behavior
Alias: $crmi-release-experimental-behavior = http://hl7.org/fhir/uv/crmi/ValueSet/crmi-release-experimental-behavior
