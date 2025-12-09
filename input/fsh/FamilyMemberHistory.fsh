Profile: MII_PR_MolGen_Familienanamnese
Parent: FamilyMemberHistory
Id: mii-pr-molgen-familienanamnese
Title: "MII PR MolGen Familienanamnese"
Description: "Dieses Profil beschreibt die Familienanamnese eines Patienten im Kontext von genetischen Analysen."
* insert Publisher
* insert PR_CS_VS_Version
//* ^status = #draft

// MS elements with German translations
* status MS
* status ^short = "Status"
* status ^definition = "Status der Familienanamnese"
* insert Translation(status ^short, de-DE, Status)
* insert Translation(status ^definition, de-DE, Status der Familienanamnese)

* patient MS
* patient ^short = "Patient"
* patient ^definition = "Der Patient zu dem die Familienanamnese gehört"
* insert Translation(patient ^short, de-DE, Patient)
* insert Translation(patient ^definition, de-DE, Der Patient zu dem die Familienanamnese gehört)

* date MS
* date ^short = "Datum"
* date ^definition = "Datum der Erfassung der Familienanamnese"
* insert Translation(date ^short, de-DE, Datum)
* insert Translation(date ^definition, de-DE, Datum der Erfassung der Familienanamnese)

* relationship MS
* relationship ^short = "Verwandtschaftsbeziehung"
* relationship ^definition = "Die Art der Verwandtschaft zum Patienten"
* insert Translation(relationship ^short, de-DE, Verwandtschaftsbeziehung)
* insert Translation(relationship ^definition, de-DE, Die Art der Verwandtschaft zum Patienten)

* relationship.coding ^slicing.discriminator.type = #pattern
* relationship.coding ^slicing.discriminator.path = "$this"
* relationship.coding ^slicing.rules = #open
* relationship.coding contains snomed 1..1 and v3-RoleCode 0..1
* relationship.coding[snomed] from MII_VS_MolGen_FamilyMember_SNOMED (extensible)
* relationship.coding[snomed] ^patternCoding.system = "http://snomed.info/sct"
* relationship.coding[snomed].extension ^slicing.discriminator.type = #value
* relationship.coding[snomed].extension ^slicing.discriminator.path = "url"
* relationship.coding[snomed].extension ^slicing.rules = #open
* relationship.coding[snomed].extension contains
    MII_EX_MolGen_Verwandtschaftsgrad named Verwandtschaftsgrad 0..1 MS and
    MII_EX_MolGen_Verwandtschaftsverhaeltnis named Verwandtschaftsverhaeltnis 0..1 MS and
    MII_EX_MolGen_FamiliareLinie named FamiliareLinie 0..1 MS

* relationship.coding[snomed].extension[Verwandtschaftsgrad] ^short = "Verwandtschaftsgrad"
* relationship.coding[snomed].extension[Verwandtschaftsgrad] ^definition = "Der Grad der Blutsverwandtschaft wie z.B. ersten oder zweiten Grades"
* insert Translation(relationship.coding[snomed].extension[Verwandtschaftsgrad] ^short, de-DE, Verwandtschaftsgrad)
* insert Translation(relationship.coding[snomed].extension[Verwandtschaftsgrad] ^definition, de-DE, Der Grad der Blutsverwandtschaft wie z.B. ersten oder zweiten Grades)

* relationship.coding[snomed].extension[Verwandtschaftsverhaeltnis] ^short = "Verwandtschaftsverhältnis"
* relationship.coding[snomed].extension[Verwandtschaftsverhaeltnis] ^definition = "Das spezifische Verwandtschaftsverhältnis wie z.B. Elternteil oder Geschwister"
* insert Translation(relationship.coding[snomed].extension[Verwandtschaftsverhaeltnis] ^short, de-DE, Verwandtschaftsverhältnis)
* insert Translation(relationship.coding[snomed].extension[Verwandtschaftsverhaeltnis] ^definition, de-DE, Das spezifische Verwandtschaftsverhältnis wie z.B. Elternteil oder Geschwister)

* relationship.coding[snomed].extension[FamiliareLinie] ^short = "Familiäre Linie"
* relationship.coding[snomed].extension[FamiliareLinie] ^definition = "Die familiäre Linie - mütterlich oder väterlich"
* insert Translation(relationship.coding[snomed].extension[FamiliareLinie] ^short, de-DE, Familiäre Linie)
* insert Translation(relationship.coding[snomed].extension[FamiliareLinie] ^definition, de-DE, Die familiäre Linie - mütterlich oder väterlich)

* relationship.coding[v3-RoleCode] from $v3-RoleCode-vs (extensible)
* relationship.coding[v3-RoleCode] ^patternCoding.system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"

* sex MS
* sex ^short = "Geschlecht"
* sex ^definition = "Das Geschlecht des Familienangehörigen"
* insert Translation(sex ^short, de-DE, Geschlecht)
* insert Translation(sex ^definition, de-DE, Das Geschlecht des Familienangehörigen)

* reasonCode MS
* reasonCode ^short = "Grund der Erhebung"
* reasonCode ^definition = "Der Grund für die Erhebung dieser Familienanamnese"
* insert Translation(reasonCode ^short, de-DE, Grund der Erhebung)
* insert Translation(reasonCode ^definition, de-DE, Der Grund für die Erhebung dieser Familienanamnese)

* reasonCode.coding 1.. MS
* reasonCode.coding ^short = "Kodierung"
* reasonCode.coding ^definition = "Kodierung des Grundes"
* insert Translation(reasonCode.coding ^short, de-DE, Kodierung)
* insert Translation(reasonCode.coding ^definition, de-DE, Kodierung des Grundes)

* reasonCode.coding ^slicing.discriminator.type = #pattern
* reasonCode.coding ^slicing.discriminator.path = "$this"
* reasonCode.coding ^slicing.rules = #open
* reasonCode.coding contains
    icd10-gm 0..1 MS and
    alpha-id 0..1 MS and
    sct 0..1 MS and
    orphanet 0..1 MS

* reasonCode.coding[icd10-gm] from $MII-VS-Diagnose-ICD10GM (required)
* reasonCode.coding[icd10-gm] ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* reasonCode.coding[icd10-gm] ^short = "ICD-10-GM Kodierung"
* reasonCode.coding[icd10-gm] ^definition = "Kodierung nach ICD-10-GM"
* insert Translation(reasonCode.coding[icd10-gm] ^short, de-DE, ICD-10-GM Kodierung)
* insert Translation(reasonCode.coding[icd10-gm] ^definition, de-DE, Kodierung nach ICD-10-GM)

* reasonCode.coding[icd10-gm].system 1.. MS
* reasonCode.coding[icd10-gm].system ^short = "System"
* reasonCode.coding[icd10-gm].system ^definition = "Das Kodesystem ICD-10-GM"
* insert Translation(reasonCode.coding[icd10-gm].system ^short, de-DE, System)
* insert Translation(reasonCode.coding[icd10-gm].system ^definition, de-DE, Das Kodesystem ICD-10-GM)

* reasonCode.coding[icd10-gm].version 1.. MS
* reasonCode.coding[icd10-gm].version ^short = "Version"
* reasonCode.coding[icd10-gm].version ^definition = "Die Version des ICD-10-GM Katalogs"
* insert Translation(reasonCode.coding[icd10-gm].version ^short, de-DE, Version)
* insert Translation(reasonCode.coding[icd10-gm].version ^definition, de-DE, Die Version des ICD-10-GM Katalogs)

* reasonCode.coding[icd10-gm].code 1.. MS
* reasonCode.coding[icd10-gm].code ^short = "Code"
* reasonCode.coding[icd10-gm].code ^definition = "Der ICD-10-GM Code"
* insert Translation(reasonCode.coding[icd10-gm].code ^short, de-DE, Code)
* insert Translation(reasonCode.coding[icd10-gm].code ^definition, de-DE, Der ICD-10-GM Code)

* reasonCode.coding[alpha-id] from $MII-VS-Diagnose-AlphaID (required)
* reasonCode.coding[alpha-id] ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/alpha-id"
* reasonCode.coding[alpha-id] ^short = "Alpha-ID Kodierung"
* reasonCode.coding[alpha-id] ^definition = "Kodierung nach Alpha-ID"
* insert Translation(reasonCode.coding[alpha-id] ^short, de-DE, Alpha-ID Kodierung)
* insert Translation(reasonCode.coding[alpha-id] ^definition, de-DE, Kodierung nach Alpha-ID)

* reasonCode.coding[alpha-id].system 1.. MS
* reasonCode.coding[alpha-id].system ^short = "System"
* reasonCode.coding[alpha-id].system ^definition = "Das Kodesystem Alpha-ID"
* insert Translation(reasonCode.coding[alpha-id].system ^short, de-DE, System)
* insert Translation(reasonCode.coding[alpha-id].system ^definition, de-DE, Das Kodesystem Alpha-ID)

* reasonCode.coding[alpha-id].code 1.. MS
* reasonCode.coding[alpha-id].code ^short = "Code"
* reasonCode.coding[alpha-id].code ^definition = "Der Alpha-ID Code"
* insert Translation(reasonCode.coding[alpha-id].code ^short, de-DE, Code)
* insert Translation(reasonCode.coding[alpha-id].code ^definition, de-DE, Der Alpha-ID Code)

* reasonCode.coding[sct] from $MII-VS-Diagnose-SCT (required)
* reasonCode.coding[sct] ^patternCoding.system = "http://snomed.info/sct"
* reasonCode.coding[sct] ^short = "SNOMED CT Kodierung"
* reasonCode.coding[sct] ^definition = "Kodierung nach SNOMED CT"
* insert Translation(reasonCode.coding[sct] ^short, de-DE, SNOMED CT Kodierung)
* insert Translation(reasonCode.coding[sct] ^definition, de-DE, Kodierung nach SNOMED CT)

* reasonCode.coding[sct].system 1.. MS
* reasonCode.coding[sct].system ^short = "System"
* reasonCode.coding[sct].system ^definition = "Das Kodesystem SNOMED CT"
* insert Translation(reasonCode.coding[sct].system ^short, de-DE, System)
* insert Translation(reasonCode.coding[sct].system ^definition, de-DE, Das Kodesystem SNOMED CT)

* reasonCode.coding[sct].code 1.. MS
* reasonCode.coding[sct].code ^short = "Code"
* reasonCode.coding[sct].code ^definition = "Der SNOMED CT Code"
* insert Translation(reasonCode.coding[sct].code ^short, de-DE, Code)
* insert Translation(reasonCode.coding[sct].code ^definition, de-DE, Der SNOMED CT Code)

* reasonCode.coding[orphanet] from $MII-VS-Diagnose-Orphanet (required)
* reasonCode.coding[orphanet] ^patternCoding.system = "http://www.orpha.net"
* reasonCode.coding[orphanet] ^short = "Orphanet Kodierung"
* reasonCode.coding[orphanet] ^definition = "Kodierung nach Orphanet für seltene Erkrankungen"
* insert Translation(reasonCode.coding[orphanet] ^short, de-DE, Orphanet Kodierung)
* insert Translation(reasonCode.coding[orphanet] ^definition, de-DE, Kodierung nach Orphanet für seltene Erkrankungen)

* reasonCode.coding[orphanet].system 1.. MS
* reasonCode.coding[orphanet].system ^short = "System"
* reasonCode.coding[orphanet].system ^definition = "Das Kodesystem Orphanet"
* insert Translation(reasonCode.coding[orphanet].system ^short, de-DE, System)
* insert Translation(reasonCode.coding[orphanet].system ^definition, de-DE, Das Kodesystem Orphanet)

* reasonCode.coding[orphanet].code 1.. MS
* reasonCode.coding[orphanet].code ^short = "Code"
* reasonCode.coding[orphanet].code ^definition = "Der Orphanet Code"
* insert Translation(reasonCode.coding[orphanet].code ^short, de-DE, Code)
* insert Translation(reasonCode.coding[orphanet].code ^definition, de-DE, Der Orphanet Code)

* reasonReference MS
* reasonReference ^short = "Referenz zum Grund"
* reasonReference ^definition = "Referenz zu einer Condition die den Grund der Familienanamnese beschreibt"
* insert Translation(reasonReference ^short, de-DE, Referenz zum Grund)
* insert Translation(reasonReference ^definition, de-DE, Referenz zu einer Condition die den Grund der Familienanamnese beschreibt)

* condition MS
* condition ^short = "Erkrankung"
* condition ^definition = "Erkrankung des Familienangehörigen"
* insert Translation(condition ^short, de-DE, Erkrankung)
* insert Translation(condition ^definition, de-DE, Erkrankung des Familienangehörigen)

* condition.code MS
* condition.code ^short = "Erkrankungscode"
* condition.code ^definition = "Kodierte Darstellung der Erkrankung"
* insert Translation(condition.code ^short, de-DE, Erkrankungscode)
* insert Translation(condition.code ^definition, de-DE, Kodierte Darstellung der Erkrankung)

* condition.code.coding 1.. MS
* condition.code.coding ^short = "Kodierung"
* condition.code.coding ^definition = "Kodierung der Erkrankung"
* insert Translation(condition.code.coding ^short, de-DE, Kodierung)
* insert Translation(condition.code.coding ^definition, de-DE, Kodierung der Erkrankung)

* condition.code.coding ^slicing.discriminator.type = #pattern
* condition.code.coding ^slicing.discriminator.path = "$this"
* condition.code.coding ^slicing.rules = #open
* condition.code.coding contains
    icd10-gm 0..1 MS and
    alpha-id 0..1 MS and
    sct 0..1 MS and
    orphanet 0..1 MS

* condition.code.coding[icd10-gm] only $ICD10GM-Coding
* condition.code.coding[icd10-gm] from $MII-VS-Diagnose-ICD10GM (required)
* condition.code.coding[icd10-gm] ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* condition.code.coding[icd10-gm] ^short = "ICD-10-GM Kodierung"
* condition.code.coding[icd10-gm] ^definition = "Kodierung nach ICD-10-GM"
* insert Translation(condition.code.coding[icd10-gm] ^short, de-DE, ICD-10-GM Kodierung)
* insert Translation(condition.code.coding[icd10-gm] ^definition, de-DE, Kodierung nach ICD-10-GM)

* condition.code.coding[icd10-gm].system 1.. MS
* condition.code.coding[icd10-gm].system ^short = "System"
* condition.code.coding[icd10-gm].system ^definition = "Das Kodesystem ICD-10-GM"
* insert Translation(condition.code.coding[icd10-gm].system ^short, de-DE, System)
* insert Translation(condition.code.coding[icd10-gm].system ^definition, de-DE, Das Kodesystem ICD-10-GM)

* condition.code.coding[icd10-gm].version 1.. MS
* condition.code.coding[icd10-gm].version ^short = "Version"
* condition.code.coding[icd10-gm].version ^definition = "Die Version des ICD-10-GM Katalogs"
* insert Translation(condition.code.coding[icd10-gm].version ^short, de-DE, Version)
* insert Translation(condition.code.coding[icd10-gm].version ^definition, de-DE, Die Version des ICD-10-GM Katalogs)

* condition.code.coding[icd10-gm].code 1.. MS
* condition.code.coding[icd10-gm].code ^short = "Code"
* condition.code.coding[icd10-gm].code ^definition = "Der ICD-10-GM Code"
* insert Translation(condition.code.coding[icd10-gm].code ^short, de-DE, Code)
* insert Translation(condition.code.coding[icd10-gm].code ^definition, de-DE, Der ICD-10-GM Code)

* condition.code.coding[alpha-id] only $AlphaID-Coding
* condition.code.coding[alpha-id] from $MII-VS-Diagnose-AlphaID (required)
* condition.code.coding[alpha-id] ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/alpha-id"
* condition.code.coding[alpha-id] ^short = "Alpha-ID Kodierung"
* condition.code.coding[alpha-id] ^definition = "Kodierung nach Alpha-ID"
* insert Translation(condition.code.coding[alpha-id] ^short, de-DE, Alpha-ID Kodierung)
* insert Translation(condition.code.coding[alpha-id] ^definition, de-DE, Kodierung nach Alpha-ID)

* condition.code.coding[alpha-id].system 1.. MS
* condition.code.coding[alpha-id].system ^short = "System"
* condition.code.coding[alpha-id].system ^definition = "Das Kodesystem Alpha-ID"
* insert Translation(condition.code.coding[alpha-id].system ^short, de-DE, System)
* insert Translation(condition.code.coding[alpha-id].system ^definition, de-DE, Das Kodesystem Alpha-ID)

* condition.code.coding[alpha-id].code 1.. MS
* condition.code.coding[alpha-id].code ^short = "Code"
* condition.code.coding[alpha-id].code ^definition = "Der Alpha-ID Code"
* insert Translation(condition.code.coding[alpha-id].code ^short, de-DE, Code)
* insert Translation(condition.code.coding[alpha-id].code ^definition, de-DE, Der Alpha-ID Code)

* condition.code.coding[sct] from $MII-VS-Diagnose-SCT (required)
* condition.code.coding[sct] ^patternCoding.system = "http://snomed.info/sct"
* condition.code.coding[sct] ^short = "SNOMED CT Kodierung"
* condition.code.coding[sct] ^definition = "Kodierung nach SNOMED CT"
* insert Translation(condition.code.coding[sct] ^short, de-DE, SNOMED CT Kodierung)
* insert Translation(condition.code.coding[sct] ^definition, de-DE, Kodierung nach SNOMED CT)

* condition.code.coding[sct].system 1.. MS
* condition.code.coding[sct].system ^short = "System"
* condition.code.coding[sct].system ^definition = "Das Kodesystem SNOMED CT"
* insert Translation(condition.code.coding[sct].system ^short, de-DE, System)
* insert Translation(condition.code.coding[sct].system ^definition, de-DE, Das Kodesystem SNOMED CT)

* condition.code.coding[sct].code 1.. MS
* condition.code.coding[sct].code ^short = "Code"
* condition.code.coding[sct].code ^definition = "Der SNOMED CT Code"
* insert Translation(condition.code.coding[sct].code ^short, de-DE, Code)
* insert Translation(condition.code.coding[sct].code ^definition, de-DE, Der SNOMED CT Code)

* condition.code.coding[orphanet] from $MII-VS-Diagnose-Orphanet (required)
* condition.code.coding[orphanet] ^patternCoding.system = "http://www.orpha.net"
* condition.code.coding[orphanet] ^short = "Orphanet Kodierung"
* condition.code.coding[orphanet] ^definition = "Kodierung nach Orphanet für seltene Erkrankungen"
* insert Translation(condition.code.coding[orphanet] ^short, de-DE, Orphanet Kodierung)
* insert Translation(condition.code.coding[orphanet] ^definition, de-DE, Kodierung nach Orphanet für seltene Erkrankungen)

* condition.code.coding[orphanet].system 1.. MS
* condition.code.coding[orphanet].system ^short = "System"
* condition.code.coding[orphanet].system ^definition = "Das Kodesystem Orphanet"
* insert Translation(condition.code.coding[orphanet].system ^short, de-DE, System)
* insert Translation(condition.code.coding[orphanet].system ^definition, de-DE, Das Kodesystem Orphanet)

* condition.code.coding[orphanet].code 1.. MS
* condition.code.coding[orphanet].code ^short = "Code"
* condition.code.coding[orphanet].code ^definition = "Der Orphanet Code"
* insert Translation(condition.code.coding[orphanet].code ^short, de-DE, Code)
* insert Translation(condition.code.coding[orphanet].code ^definition, de-DE, Der Orphanet Code)

Extension: MII_EX_MolGen_Verwandtschaftsgrad
Id: mii-ex-molgen-verwandtschaftsgrad
Title: "MII EX Mol Gen Verwandtschaftsgrad"
Description: "Extension erlaubt die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen."
* insert Publisher
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
* insert PR_CS_VS_Version

* $SCT#125678001 "First degree blood relative (person)"
* $SCT#699110007 "Second degree blood relative (person)"

Extension: MII_EX_MolGen_Verwandtschaftsverhaeltnis
Id: mii-ex-molgen-verwandtschaftsverhaeltnis
Title: "MII EX MolGen Verwandtschaftsverhaeltnis"
Description: "Extension erlaubt die Angabe eines Verwandtschaftsverhältnisses zwischen Patient und Familienangehörigen."
* insert Publisher
* insert PR_CS_VS_Version

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
* insert PR_CS_VS_Version

* $SCT#75226009 "Natural child (person)"
* $SCT#13646006 "Natural parent (person)"
* $SCT#60614009 "Natural brother (person)"
* $SCT#73678001 "Natural sister (person)"
* $SCT#45929001 "Half-brother (person)"
* $SCT#2272004 "Half-sister (person)"
* $SCT#62296006 "Natural grandfather (person)"
* $SCT#17945006 "Natural grandmother (person)"

Extension: MII_EX_MolGen_FamiliareLinie
Id: mii-ex-molgen-familiare-linie
Title: "MII EX MolGen Familiare Linie"
Description: "Extension erlaubt die Angabe der familiären Linie zwischen Patient und Familienangehörigen."
* insert Publisher
* insert PR_CS_VS_Version

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
* insert PR_CS_VS_Version

* $SCT#72705000 "Mother (person)"
* $SCT#66839005 "Father (person)"

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
* relationship.coding[snomed] = $SCT#72705000 "Mother (person)"
* relationship.coding[v3-RoleCode] = $v3-RoleCode-cs#MTH "mother"
* sex.coding[0] = $AdminGender#female
* sex.coding[+] = $SCT#248152002 "Female (finding)"
* deceasedBoolean = true
* reasonCode.coding[sct] = $SCT#447886005 "Adenocarcinoma of anorectum (disorder)"
* condition[0].code.coding[sct] = $SCT#830150003 "Malignant melanoma with B-Raf proto-oncogene, serine/threonine kinase V600E mutation (disorder)"
* condition[=].contributedToDeath = true

Instance: mii-exa-molgen-family-member-history-2
InstanceOf: mii-pr-molgen-familienanamnese
Usage: #example
* status = #completed
* patient = Reference(mii-exa-molgen-patient)
* date = "2022-11-08"
* relationship.coding[snomed] = $SCT#394858009 "Paternal grandmother (person)"
* relationship.coding[snomed].extension[Verwandtschaftsgrad].valueCoding = $SCT#699110007 "Second degree blood relative (person)"
* relationship.coding[snomed].extension[Verwandtschaftsverhaeltnis].valueCoding = $SCT#17945006 "Natural grandmother (person)"
* relationship.coding[snomed].extension[FamiliareLinie].valueCoding = $SCT#66839005 "Father (person)"
* relationship.coding[v3-RoleCode] = $v3-RoleCode-cs#PGRMTH "paternal grandmother"
* sex.coding[0] = $AdminGender#female
* sex.coding[+] = $SCT#248152002 "Female (finding)"
* deceasedBoolean = true

Instance: mii-exa-molgen-family-member-history-diabetes
InstanceOf: mii-pr-molgen-familienanamnese
Usage: #example
Title: "Family History - Father with Type 2 Diabetes"
Description: "Example of family member history documenting father's Type 2 diabetes mellitus (ICD-10: E11.9)"
* status = #completed
* patient = Reference(mii-exa-molgen-patient)
* date = "2024-01-15"
* relationship.coding[snomed] = $SCT#9947008 "Natural father (person)"
* relationship.coding[snomed].extension[Verwandtschaftsgrad].valueCoding = $SCT#125678001 "First degree blood relative (person)"
* relationship.coding[snomed].extension[Verwandtschaftsverhaeltnis].valueCoding = $SCT#13646006 "Natural parent (person)"
* relationship.coding[snomed].extension[FamiliareLinie].valueCoding = $SCT#66839005 "Father (person)"
* relationship.coding[v3-RoleCode] = $v3-RoleCode-cs#FTH "father"
* sex.coding[0] = $AdminGender#male
* sex.coding[+] = $SCT#248153007 "Male (finding)"
* deceasedBoolean = false
* ageAge.value = 68
* ageAge.unit = "years"
* ageAge.system = $UCUM
* ageAge.code = #a
* condition[0].code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* condition[=].code.coding[icd10-gm].version = "2024"
* condition[=].code.coding[icd10-gm].code = #E11.9
* condition[=].code.coding[icd10-gm].display = "Diabetes mellitus, Typ 2: Ohne Komplikationen"
* condition[=].code.coding[sct] = $SCT#44054006 "Diabetes mellitus type 2 (disorder)"
* condition[=].onsetAge.value = 55
* condition[=].onsetAge.unit = "years"
* condition[=].onsetAge.system = $UCUM
* condition[=].onsetAge.code = #a

Instance: mii-exa-molgen-family-member-history-retinal
InstanceOf: mii-pr-molgen-familienanamnese
Usage: #example
Title: "Family History - Sister with Retinal Disorder"
Description: "Example of family member history documenting sister's retinal disorder (ICD-10: H35.8)"
* status = #completed
* patient = Reference(mii-exa-molgen-patient)
* date = "2024-02-20"
* relationship.coding[snomed] = $SCT#73678001 "Natural sister (person)"
* relationship.coding[snomed].extension[Verwandtschaftsgrad].valueCoding = $SCT#125678001 "First degree blood relative (person)"
* relationship.coding[snomed].extension[Verwandtschaftsverhaeltnis].valueCoding = $SCT#73678001 "Natural sister (person)"
* relationship.coding[v3-RoleCode] = $v3-RoleCode-cs#SIS "sister"
* sex.coding[0] = $AdminGender#female
* sex.coding[+] = $SCT#248152002 "Female (finding)"
* deceasedBoolean = false
* ageAge.value = 42
* ageAge.unit = "years"
* ageAge.system = $UCUM
* ageAge.code = #a
* condition[0].code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* condition[=].code.coding[icd10-gm].version = "2024"
* condition[=].code.coding[icd10-gm].code = #H35.8
* condition[=].code.coding[icd10-gm].display = "Sonstige näher bezeichnete Affektionen der Netzhaut"
* condition[=].code.coding[sct] = $SCT#95695004 "Degeneration of retina"
* condition[=].onsetAge.value = 38
* condition[=].onsetAge.unit = "years"
* condition[=].onsetAge.system = $UCUM
* condition[=].onsetAge.code = #a
* condition[=].note.text = "Entwicklung einer Makuladegeneration mit progressivem Verlauf"

Instance: mii-exa-molgen-family-member-history-mi
InstanceOf: mii-pr-molgen-familienanamnese
Usage: #example
Title: "Family History - Mother with Myocardial Infarction"
Description: "Example of family member history documenting mother's ST-elevation myocardial infarction (ICD-10: I21.2)"
* status = #completed
* patient = Reference(mii-exa-molgen-patient)
* date = "2024-03-10"
* relationship.coding[snomed] = $SCT#72705000 "Mother (person)"
* relationship.coding[snomed].extension[Verwandtschaftsgrad].valueCoding = $SCT#125678001 "First degree blood relative (person)"
* relationship.coding[snomed].extension[Verwandtschaftsverhaeltnis].valueCoding = $SCT#13646006 "Natural parent (person)"
* relationship.coding[snomed].extension[FamiliareLinie].valueCoding = $SCT#72705000 "Mother (person)"
* relationship.coding[v3-RoleCode] = $v3-RoleCode-cs#MTH "mother"
* sex.coding[0] = $AdminGender#female
* sex.coding[+] = $SCT#248152002 "Female (finding)"
* deceasedAge.value = 71
* deceasedAge.unit = "years"
* deceasedAge.system = $UCUM
* deceasedAge.code = #a
* reasonCode.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* reasonCode.coding[icd10-gm].version = "2024"
* reasonCode.coding[icd10-gm].code = #I21.2
* reasonCode.coding[icd10-gm].display = "Akuter transmuraler Myokardinfarkt an sonstigen Lokalisationen"
* reasonCode.coding[sct] = $SCT#401303003 "Acute ST segment elevation myocardial infarction (disorder)"
* condition[0].code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* condition[=].code.coding[icd10-gm].version = "2024"
* condition[=].code.coding[icd10-gm].code = #I21.2
* condition[=].code.coding[icd10-gm].display = "Akuter transmuraler Myokardinfarkt an sonstigen Lokalisationen"
* condition[=].code.coding[sct] = $SCT#401303003 "Acute ST segment elevation myocardial infarction (disorder)"
* condition[=].contributedToDeath = true
* condition[=].onsetAge.value = 70
* condition[=].onsetAge.unit = "years"
* condition[=].onsetAge.system = $UCUM
* condition[=].onsetAge.code = #a
* condition[=].note.text = "STEMI mit fatalen Komplikationen trotz Akutintervention"


