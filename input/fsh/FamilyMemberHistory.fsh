Profile: SD_Familienanamnese
Parent: FamilyMemberHistory
Id: sd-familienanamnese
Title: "SD MII MolGen Familienanamnese"
Description: "Dieses Profil beschreibt die Familienanamnese eines Patienten im Kontext von genetischen Analysen."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese"
* patient only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* date MS
* relationship MS
* relationship.coding ^slicing.discriminator.type = #pattern
* relationship.coding ^slicing.discriminator.path = "$this"
* relationship.coding ^slicing.rules = #open
* relationship.coding contains snomed 1..1
* relationship.coding[snomed] from VS_FamilyMember_SNOMED (required)
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

Instance: example-mii-molgen-family-member-history-1
InstanceOf: sd-familienanamnese
Usage: #example
* status = #completed
* patient = Reference(example-mii-molgen-patient)
* date = "2022-04-07"
* relationship.coding[snomed] = SCT#72705000 "Mother (person)"
* sex.coding[0] = AdminGender#female
* sex.coding[+] = SCT#248152002 "Female (finding)"
* deceasedBoolean = true
* reasonCode.coding[sct] = SCT#447886005 "Adenocarcinoma of anorectum (disorder)"
* condition[0].code.coding[sct] = SCT#830150003 "Malignant melanoma with B-Raf proto-oncogene, serine/threonine kinase V600E mutation (disorder)"
* condition[=].contributedToDeath = true

