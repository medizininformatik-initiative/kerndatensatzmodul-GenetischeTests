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
* reasonCode = SCT#447886005 "Adenocarcinoma of anorectum (disorder)"
* condition[0].code = SCT#830150003 "Malignant melanoma with B-Raf proto-oncogene, serine/threonine kinase V600E mutation (disorder)"
* condition[=].contributedToDeath = true

