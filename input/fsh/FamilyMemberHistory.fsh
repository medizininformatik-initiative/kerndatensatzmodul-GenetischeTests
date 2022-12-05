Profile: MII_PR_MolGen_Familienanamnese
Parent: FamilyMemberHistory
Id: mii-pr-molgen-familienanamnese
Title: "MII PR MolGen Familienanamnese"
Description: "Dieses Profil beschreibt die Familienanamnese eines Patienten im Kontext von genetischen Analysen."
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese"
//* ^status = #draft
* status MS
* patient MS
* patient only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* date MS
* relationship MS
* relationship.coding ^slicing.discriminator.type = #pattern
* relationship.coding ^slicing.discriminator.path = "$this"
* relationship.coding ^slicing.rules = #open
* relationship.coding contains snomed 1..1 and v3-RoleCode 0..1
* relationship.coding[snomed] from MII_VS_MolGen_FamilyMember_SNOMED (required)
* relationship.coding[snomed] ^patternCoding.system = "http://snomed.info/sct"
* relationship.coding[snomed].extension ^slicing.discriminator.type = #value
* relationship.coding[snomed].extension ^slicing.discriminator.path = "url"
* relationship.coding[snomed].extension ^slicing.rules = #open
* relationship.coding[snomed].extension contains
    MII_EX_MolGen_Verwandtschaftsgrad named Verwandtschaftsgrad 0..1 MS and
    MII_EX_MolGen_Verwandtschaftsverhaeltnis named Verwandtschaftsverhaeltnis 0..1 MS and
    MII_EX_MolGen_FamiliareLinie named FamiliareLinie 0..1 MS
* relationship.coding[v3-RoleCode] from v3-RoleCode-vs (required)
* relationship.coding[v3-RoleCode] ^patternCoding.system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* sex MS
* reasonCode MS
* reasonCode.coding 1.. MS
* reasonCode.coding ^slicing.discriminator.type = #pattern
* reasonCode.coding ^slicing.discriminator.path = "$this"
* reasonCode.coding ^slicing.rules = #open
* reasonCode.coding contains
    icd10-gm 0..1 MS and
    alpha-id 0..1 MS and
    sct 0..1 MS and
    orphanet 0..1 MS
* reasonCode.coding[icd10-gm] only ICD10GM-Coding
* reasonCode.coding[icd10-gm] from ICD10GM-VS (required)
* reasonCode.coding[icd10-gm] ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* reasonCode.coding[icd10-gm].system 1.. MS
* reasonCode.coding[icd10-gm].version 1.. MS
* reasonCode.coding[icd10-gm].code 1.. MS
* reasonCode.coding[alpha-id] only AlphaID-Coding
* reasonCode.coding[alpha-id] from AlphaID-VS (required)
* reasonCode.coding[alpha-id] ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/alpha-id"
* reasonCode.coding[alpha-id].system 1.. MS
* reasonCode.coding[alpha-id].code 1.. MS
* reasonCode.coding[sct] from SCT-Diagnoses-VS (required)
* reasonCode.coding[sct] ^patternCoding.system = "http://snomed.info/sct"
* reasonCode.coding[sct].system 1.. MS
* reasonCode.coding[sct].code 1.. MS
* reasonCode.coding[orphanet] ^patternCoding.system = "http://www.orpha.net"
* reasonCode.coding[orphanet].system 1.. MS
* reasonCode.coding[orphanet].code 1.. MS
* reasonReference MS
* condition MS
* condition.code MS
* condition.code.coding 1.. MS
* condition.code.coding ^slicing.discriminator.type = #pattern
* condition.code.coding ^slicing.discriminator.path = "$this"
* condition.code.coding ^slicing.rules = #open
* condition.code.coding contains
    icd10-gm 0..1 MS and
    alpha-id 0..1 MS and
    sct 0..1 MS and
    orphanet 0..1 MS
* condition.code.coding[icd10-gm] only ICD10GM-Coding
* condition.code.coding[icd10-gm] from ICD10GM-VS (required)
* condition.code.coding[icd10-gm] ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* condition.code.coding[icd10-gm].system 1.. MS
* condition.code.coding[icd10-gm].version 1.. MS
* condition.code.coding[icd10-gm].code 1.. MS
* condition.code.coding[alpha-id] only AlphaID-Coding
* condition.code.coding[alpha-id] from AlphaID-VS (required)
* condition.code.coding[alpha-id] ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/alpha-id"
* condition.code.coding[alpha-id].system 1.. MS
* condition.code.coding[alpha-id].code 1.. MS
* condition.code.coding[sct] from SCT-Diagnoses-VS (required)
* condition.code.coding[sct] ^patternCoding.system = "http://snomed.info/sct"
* condition.code.coding[sct].system 1.. MS
* condition.code.coding[sct].code 1.. MS
* condition.code.coding[orphanet] ^patternCoding.system = "http://www.orpha.net"
* condition.code.coding[orphanet].system 1.. MS
* condition.code.coding[orphanet].code 1.. MS

Extension: MII_EX_MolGen_Verwandtschaftsgrad
Id: mii-ex-molgen-verwandtschaftsgrad
Title: "MII EX Mol Gen Verwandtschaftsgrad"
Description: "Extension erlaubt die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen."
* insert Publisher
* ^status = #draft
* ^context.type = #element
* ^context.expression = "FamilyMemberHistory.relationship.coding"
* value[x] 1..
* value[x] only Coding
* value[x] from MII_VS_MolGen_Verwandtschaftsgrad (required)

ValueSet: MII_VS_MolGen_Verwandtschaftsgrad
Id: mii-vs-molgen-verwandtschaftsgrad
Title: "MII VS Mol Gen Verwandtschaftsgrad"
Description: "ValueSet für die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen."
* insert Publisher
* ^status = #draft
* SCT#125678001 "First degree blood relative (person)"
* SCT#699110007 "Second degree blood relative (person)"

Extension: MII_EX_MolGen_Verwandtschaftsverhaeltnis
Id: mii-ex-molgen-verwandtschaftsverhaeltnis
Title: "MII EX MolGen Verwandtschaftsverhaeltnis"
Description: "Extension erlaubt die Angabe eines Verwandtschaftsverhältnisses zwischen Patient und Familienangehörigen."
* insert Publisher
* ^status = #draft
* ^context.type = #element
* ^context.expression = "FamilyMemberHistory.relationship.coding"
* value[x] 1..
* value[x] only Coding
* value[x] from MII_VS_MolGen_Verwandtsverhaeltnis (extensible)

ValueSet: MII_VS_MolGen_Verwandtsverhaeltnis
Id: mii-vs-molgen-verwandtschaftsverhaeltnis
Title: "MII VS MolGen Verwandtschaftsverhaeltnis"
Description: "ValueSet für die Angabe eines Verwandtschaftsverhältnis zwischen Patient und Familienangehörigen."
* insert Publisher
* ^status = #draft
* SCT#75226009 "Natural child (person)"
* SCT#13646006 "Natural parent (person)"
* SCT#60614009 "Natural brother (person)"
* SCT#73678001 "Natural sister (person)"
* SCT#45929001 "Half-brother (person)"
* SCT#2272004 "Half-sister (person)"
* SCT#62296006 "Natural grandfather (person)"
* SCT#17945006 "Natural grandmother (person)"

Extension: MII_EX_MolGen_FamiliareLinie
Id: mii-ex-molgen-familiare-linie
Title: "MII EX MolGen Familiare Linie"
Description: "Extension erlaubt die Angabe der familiären Linie zwischen Patient und Familienangehörigen."
* insert Publisher
* ^status = #draft
* ^context.type = #element
* ^context.expression = "FamilyMemberHistory.relationship.coding"
* value[x] 1..
* value[x] only Coding
* value[x] from MII_VS_MolGen_FamiliaereLinie (required)

ValueSet: MII_VS_MolGen_FamiliaereLinie
Id: mii-vs-molgen-familiaere-linie
Title: "MII VS MolGen Familiäre Linie"
Description: "ValueSet für die Angabe der familären Linie zwischen Patient und Familienangehörigen."
* insert Publisher
* ^status = #draft
* SCT#72705000 "Mother (person)"
* SCT#66839005 "Father (person)"

Mapping: MolGen-Familienanamnese
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_Familienanamnese
* -> "mide-dataelement-1740" "Krankengeschichte Familie"

Instance: mii-exa-molgen-family-member-history-1
InstanceOf: mii-pr-molgen-familienanamnese
Usage: #example
* status = #completed
* patient = Reference(mii-exa-molgen-patient)
* date = "2022-04-07"
* relationship.coding[snomed] = SCT#72705000 "Mother (person)"
* relationship.coding[v3-RoleCode] = v3-RoleCode-cs#MTH "mother"
* sex.coding[0] = AdminGender#female
* sex.coding[+] = SCT#248152002 "Female (finding)"
* deceasedBoolean = true
* reasonCode.coding[sct] = SCT#447886005 "Adenocarcinoma of anorectum (disorder)"
* condition[0].code.coding[sct] = SCT#830150003 "Malignant melanoma with B-Raf proto-oncogene, serine/threonine kinase V600E mutation (disorder)"
* condition[=].contributedToDeath = true

Instance: mii-exa-molgen-family-member-history-2
InstanceOf: mii-pr-molgen-familienanamnese
Usage: #example
* status = #completed
* patient = Reference(mii-exa-molgen-patient)
* date = "2022-11-08"
* relationship.coding[snomed] = SCT#394858009 "Paternal grandmother (person)"
* relationship.coding[snomed].extension[Verwandtschaftsgrad].valueCoding = SCT#699110007 "Second degree blood relative (person)"
* relationship.coding[snomed].extension[Verwandtschaftsverhaeltnis].valueCoding = SCT#17945006 "Natural grandmother (person)"
* relationship.coding[snomed].extension[FamiliareLinie].valueCoding = SCT#66839005 "Father (person)"
* relationship.coding[v3-RoleCode] = v3-RoleCode-cs#PGRMTH "paternal grandmother"
* sex.coding[0] = AdminGender#female
* sex.coding[+] = SCT#248152002 "Female (finding)"
* deceasedBoolean = true

