// additional examples without profiles in this module

Instance: example-mii-molgen-patient
InstanceOf: Patient
Usage: #example
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
* identifier[0].use = #usual
* identifier[=].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[=].system = "https://www.medizininformatik-initiative.de/fhir/sid/patienten"
* identifier[=].value = "42285243"
* identifier[=].assigner.display = "Charité - Universitätsmedizin Berlin"
* identifier[=].assigner.identifier.system = "https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier"
* identifier[=].assigner.identifier.value = "Charité"
* identifier[+].use = #official
* identifier[=].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[=].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[=].value = "Z234567890"
* identifier[=].assigner.identifier.use = #official
* identifier[=].assigner.identifier.value = "109519005"
* identifier[=].assigner.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[+].use = #secondary
* identifier[=].type = http://fhir.de/CodeSystem/identifier-type-de-basis#PKV
* identifier[=].value = "123456"
* identifier[=].assigner.display = "Signal Iduna"
* name[0].use = #official
* name[=].family = "Van-der-Dussen"
* name[=].family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[=].family.extension.valueString = "Van-der-Dussen"
* name[=].given[0] = "Maja"
* name[=].given[+] = "Julia"
* name[=].prefix = "Prof. Dr. med."
* name[=].prefix.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
* name[=].prefix.extension.valueCode = #AC
* name[+].use = #maiden
* name[=].family = "Haffer"
* gender = #female
* birthDate = "1968-09-19"
* deceasedBoolean = false
* address.type = #both
* address.line = "Anna-Louisa-Karsch Str. 2"
* address.city = "Berlin"
* address.state = "DE-BE"
* address.postalCode = "10178"
* address.country = "DE"

Instance: example-mii-molgen-practitioner-lab
InstanceOf: Practitioner
Usage: #example
* active = true
* name.use = #official
* name.text = "Dr. Daniel Schmidt"
* name.family = "Schmidt"
* name.given = "Daniel"
* name.prefix = "Dr."

Instance: example-mii-molgen-practitioner-physician
InstanceOf: Practitioner
Usage: #example
* active = true
* name.use = #official
* name.text = "Dr. Linda Rubens"
* name.family = "Rubens"
* name.given = "Linda"
* name.prefix = "Dr."

Instance: example-mii-molgen-specimen-1
InstanceOf: https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore
Usage: #example
* type = SCT#128159001 "Tissue specimen from colon (specimen)"
* collection.collectedDateTime = "2022-03-24T12:44:00+01:00"
* collection.bodySite = SCT#71854001 "Colon structure (body structure)"
* identifier.system = "https://biobank.uk-musterstadt.de/fhir/sid/proben"
* identifier.value = "5432"
* status = #available
* subject = Reference(example-mii-molgen-patient)

Instance: example-mii-molgen-device-sequencer
InstanceOf: Device
Usage: #example
* status = #active
* manufacturer = "Illumina"
* deviceName.name = "MiSeq"
* deviceName.type = DeviceNameType#manufacturer-name

Instance: example-mii-molgen-specimen-2
InstanceOf: https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore
Usage: #example
* status = #available
* type = SCT#445295009 "Blood specimen with edetic acid (specimen)"
* subject = Reference(example-mii-molgen-patient)
* receivedTime = "2021-11-24"
* collection.collectedDateTime = "2021-11-23"
* identifier.system = "https://www.charite.de/fhir/sid/bioproben"
* identifier.value = "specimen_02"

Instance: example-mii-molgen-patient-2
InstanceOf: Patient
Usage: #example
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
* identifier[0].use = #usual
* identifier[=].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[=].system = "https://www.charite.de/fhir/sid/patienten"
* identifier[=].value = "146314909"
* identifier[=].assigner.display = "Charité - Universitätsmedizin Berlin"
* identifier[=].assigner.identifier.system = "https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier"
* identifier[=].assigner.identifier.value = "Charité"
* identifier[+].use = #official
* identifier[=].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[=].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[=].value = "Z900211002"
* identifier[=].assigner.identifier.use = #official
* identifier[=].assigner.identifier.value = "109519005"
* identifier[=].assigner.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* name[0].use = #official
* name[=].family = "Müller"
* name[=].family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[=].family.extension.valueString = "Müller"
* name[=].given[0] = "Melanie"
* name[=].given[+] = "Marie"
* gender = #female
* birthDate = "2021-09-19"
* deceasedBoolean = false
* address.type = #both
* address.line = "Anna-Louisa-Karsch Str. 2"
* address.city = "Berlin"
* address.state = "DE-BE"
* address.postalCode = "10178"
* address.country = "DE"

//Illumina NovaSeq 6000-Sequencer
Instance: example-mii-molgen-device-sequencer-2
InstanceOf: Device
Usage: #example
* status = #active
* manufacturer = "Illumina"
* deviceName.name = "NovaSeq 6000-Sequencer"
* deviceName.type = DeviceNameType#manufacturer-name

Instance: example-mii-molgen-chargeitem-ebm-21
InstanceOf: http://fhir.de/StructureDefinition/chargeitem-de-ebm
Usage: #example
Title: "example-mii-molgen-chargeitem-ebm-21"
Description: "Beispiel für Dokumentation einer erbrachten Leistung gemäß EBM-Katalog"
* status = #billable
* code = EBM#11513 "Postnatale Mutationssuche zum Nachweis oder Ausschluss einer krankheitsrelevanten oder krankheitsauslösenden konstitutionellen genomischen Mutation"
* subject = Reference(example-mii-molgen-patient-2)
* quantity.value = 72

Instance: example-mii-molgen-chargeitem-ebm-22
InstanceOf: http://fhir.de/StructureDefinition/chargeitem-de-ebm
Usage: #example
Title: "example-mii-molgen-chargeitem-ebm-22"
Description: "Beispiel für Dokumentation einer erbrachten Leistung gemäß EBM-Katalog"
* status = #billable
* code = EBM#11512 "Gezielter Nachweis oder Ausschluss von krankheitsrelevanten oder krankheitsauslösenden großen Deletionen und/oder Duplikationen"
* subject = Reference(example-mii-molgen-patient-2)
* quantity.value = 6

Instance: example-mii-molgen-chargeitem-ebm-23
InstanceOf: http://fhir.de/StructureDefinition/chargeitem-de-ebm
Usage: #example
Title: "example-mii-molgen-chargeitem-ebm-23"
Description: "Beispiel für Dokumentation einer erbrachten Leistung gemäß EBM-Katalog"
* status = #billable
* code = EBM#11302 "Zuschlag für Gemeinkosten und die wissenschaftliche ärztliche Beurteilung und Befundung komplexer genetischer Analysen im individuellen klinischen Kontext bei seltenen Erkrankungen"
* subject = Reference(example-mii-molgen-patient-2)
* quantity.value = 1

Instance: example-mii-molgen-chargeitem-ebm-24
InstanceOf: http://fhir.de/StructureDefinition/chargeitem-de-ebm
Usage: #example
Title: "example-mii-molgen-chargeitem-ebm-24"
Description: "Beispiel für Dokumentation einer erbrachten Leistung gemäß EBM-Katalog"
* status = #billable
* code = EBM#11301 "Grundpauschale humangenetische in-vitro-Diagnostik bei Probeneinsendung"
* subject = Reference(example-mii-molgen-patient-2)
* quantity.value = 1

Instance: befund-bundle-1
InstanceOf: Bundle
Usage: #example
* type = #transaction
* timestamp = "2022-07-14T12:11:00+01:00"
* entry[0].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-molekulargenetischer-befundbericht-1"
* entry[=].resource = example-mii-molgen-molekulargenetischer-befundbericht-1
* entry[=].request.method = #POST
* entry[=].request.url = "DiagnosticReport"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-medikationsempfehlung-1"
* entry[=].resource = example-mii-molgen-medikationsempfehlung-1
* entry[=].request.method = #POST
* entry[=].request.url = "Task"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-folgemassnahme-1"
* entry[=].resource = example-mii-molgen-folgemassnahme-1
* entry[=].request.method = #POST
* entry[=].request.url = "Task"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-family-member-history-1"
* entry[=].resource = mii-exa-molgen-family-member-history-1
* entry[=].request.method = #POST
* entry[=].request.url = "FamilyMemberHistory"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-anforderung-1"
* entry[=].resource = example-mii-molgen-anforderung-1
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-patient"
* entry[=].resource = example-mii-molgen-patient
* entry[=].request.method = #POST
* entry[=].request.url = "Patient"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-practitioner-lab"
* entry[=].resource = example-mii-molgen-practitioner-lab
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-specimen-1"
* entry[=].resource = example-mii-molgen-specimen-1
* entry[=].request.method = #POST
* entry[=].request.url = "Specimen"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-diagnostische-implikation-1"
* entry[=].resource = example-mii-molgen-diagnostische-implikation-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-therapeutische-implikation-1"
* entry[=].resource = example-mii-molgen-therapeutische-implikation-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-variante-1"
* entry[=].resource = example-mii-molgen-variante-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-untersuchte-region-1"
* entry[=].resource = example-mii-molgen-untersuchte-region-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-genotyp-1"
* entry[=].resource = example-mii-molgen-genotyp-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-mutationslast-1"
* entry[=].resource = example-mii-molgen-mutationslast-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-device-sequencer"
* entry[=].resource = example-mii-molgen-device-sequencer
* entry[=].request.method = #POST
* entry[=].request.url = "Device"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-practitioner-physician"
* entry[=].resource = example-mii-molgen-practitioner-physician
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"

Instance: mii-exa-molgen-specimen-brca1
InstanceOf: https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore
Usage: #example
* status = #available
* type = SCT#127457009 "Tissue specimen from breast (specimen)"
* subject = Reference(example-mii-molgen-patient-2)
* receivedTime = "2022-11-01"
* collection.collectedDateTime = "2022-11-01"
* identifier.system = "https://www.charite.de/fhir/sid/bioproben"
* identifier.value = "specimen_03"

Instance: mii-exa-molgen-patient-brca1
InstanceOf: Patient
Usage: #example
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient"
* identifier[0].use = #usual
* identifier[=].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[=].system = "https://www.charite.de/fhir/sid/patienten"
* identifier[=].value = "9166147031"
* identifier[=].assigner.display = "Charité - Universitätsmedizin Berlin"
* identifier[=].assigner.identifier.system = "https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier"
* identifier[=].assigner.identifier.value = "Charité"
* identifier[+].use = #official
* identifier[=].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[=].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[=].value = "Z977188448"
* identifier[=].assigner.identifier.use = #official
* identifier[=].assigner.identifier.value = "109519005"
* identifier[=].assigner.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* name[0].use = #official
* name[=].family = "Schmidt-Huber"
* name[=].family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[=].family.extension.valueString = "Schmidt"
* name[=].given[0] = "Elisa"
* gender = #female
* birthDate = "1973-03-12"
* deceasedBoolean = false
* address.type = #both
* address.line = "Anna-Louisa-Karsch Str. 2"
* address.city = "Berlin"
* address.state = "DE-BE"
* address.postalCode = "10178"
* address.country = "DE"

Instance: mii-exa-molgen-device-sequencer-nextseq
InstanceOf: Device
Usage: #example
* status = #active
* manufacturer = "Illumina"
* deviceName.name = "NextSeq"
* deviceName.type = DeviceNameType#manufacturer-name