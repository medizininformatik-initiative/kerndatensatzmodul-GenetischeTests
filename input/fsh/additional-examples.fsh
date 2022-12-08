// additional examples without profiles in this module

Instance: mii-exa-molgen-patient
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

Instance: mii-exa-molgen-practitioner-lab
InstanceOf: Practitioner
Usage: #example
* active = true
* name.use = #official
* name.text = "Dr. Daniel Schmidt"
* name.family = "Schmidt"
* name.given = "Daniel"
* name.prefix = "Dr."

Instance: mii-exa-molgen-practitioner-physician
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
* subject = Reference(mii-exa-molgen-patient)

Instance: mii-exa-molgen-device-sequencer
InstanceOf: Device
Usage: #example
* status = #active
* manufacturer = "Illumina"
* deviceName.name = "MiSeq"
* deviceName.type = DeviceNameType#manufacturer-name

Instance: mii-exa-molgen-specimen-2
InstanceOf: https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore
Usage: #example
* status = #available
* type = SCT#445295009 "Blood specimen with edetic acid (specimen)"
* subject = Reference(mii-exa-molgen-patient-2)
* receivedTime = "2021-11-24"
* collection.collectedDateTime = "2021-11-23"
* identifier.system = "https://www.charite.de/fhir/sid/bioproben"
* identifier.value = "specimen_02"

Instance: mii-exa-molgen-patient-2
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
Instance: mii-exa-molgen-device-sequencer-2
InstanceOf: Device
Usage: #example
* status = #active
* manufacturer = "Illumina"
* deviceName.name = "NovaSeq 6000-Sequencer"
* deviceName.type = DeviceNameType#manufacturer-name

Instance: mii-exa-molgen-chargeitem-ebm-21
InstanceOf: http://fhir.de/StructureDefinition/chargeitem-de-ebm
Usage: #example
* status = #billable
* code = EBM#11513 "Postnatale Mutationssuche zum Nachweis oder Ausschluss einer krankheitsrelevanten oder krankheitsauslösenden konstitutionellen genomischen Mutation"
* subject = Reference(mii-exa-molgen-patient-2)
* quantity.value = 72

Instance: mii-exa-molgen-chargeitem-ebm-22
InstanceOf: http://fhir.de/StructureDefinition/chargeitem-de-ebm
Usage: #example
* status = #billable
* code = EBM#11512 "Gezielter Nachweis oder Ausschluss von krankheitsrelevanten oder krankheitsauslösenden großen Deletionen und/oder Duplikationen"
* subject = Reference(mii-exa-molgen-patient-2)
* quantity.value = 6

Instance: mii-exa-molgen-chargeitem-ebm-23
InstanceOf: http://fhir.de/StructureDefinition/chargeitem-de-ebm
Usage: #example
* status = #billable
* code = EBM#11302 "Zuschlag für Gemeinkosten und die wissenschaftliche ärztliche Beurteilung und Befundung komplexer genetischer Analysen im individuellen klinischen Kontext bei seltenen Erkrankungen"
* subject = Reference(mii-exa-molgen-patient-2)
* quantity.value = 1

Instance: mii-exa-molgen-chargeitem-ebm-24
InstanceOf: http://fhir.de/StructureDefinition/chargeitem-de-ebm
Usage: #example
* status = #billable
* code = EBM#11301 "Grundpauschale humangenetische in-vitro-Diagnostik bei Probeneinsendung"
* subject = Reference(mii-exa-molgen-patient-2)
* quantity.value = 1

Instance: mii-exa-befund-bundle-1
InstanceOf: Bundle
Usage: #example
* type = #transaction
* timestamp = "2022-07-14T12:11:00+01:00"
* entry[0].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-molekulargenetischer-befundbericht-1"
* entry[=].resource = mii-exa-molgen-molekulargenetischer-befundbericht-1
* entry[=].request.method = #POST
* entry[=].request.url = "DiagnosticReport"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-medikationsempfehlung-1"
* entry[=].resource = mii-exa-molgen-medikationsempfehlung-1
* entry[=].request.method = #POST
* entry[=].request.url = "Task"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-folgemassnahme-1"
* entry[=].resource = mii-exa-molgen-folgemassnahme-1
* entry[=].request.method = #POST
* entry[=].request.url = "Task"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-family-member-history-1"
* entry[=].resource = mii-exa-molgen-family-member-history-1
* entry[=].request.method = #POST
* entry[=].request.url = "FamilyMemberHistory"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-anforderung-1"
* entry[=].resource = mii-exa-molgen-anforderung-1
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-patient"
* entry[=].resource = mii-exa-molgen-patient
* entry[=].request.method = #POST
* entry[=].request.url = "Patient"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-practitioner-lab"
* entry[=].resource = mii-exa-molgen-practitioner-lab
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/example-mii-molgen-specimen-1"
* entry[=].resource = example-mii-molgen-specimen-1
* entry[=].request.method = #POST
* entry[=].request.url = "Specimen"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-diagnostische-implikation-1"
* entry[=].resource = mii-exa-molgen-diagnostische-implikation-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-therapeutische-implikation-1"
* entry[=].resource = mii-exa-molgen-therapeutische-implikation-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-variante-1"
* entry[=].resource = mii-exa-molgen-variante-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-untersuchte-region-1"
* entry[=].resource = mii-exa-molgen-untersuchte-region-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-genotyp-1"
* entry[=].resource = mii-exa-molgen-genotyp-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-mutationslast-1"
* entry[=].resource = mii-exa-molgen-mutationslast-1
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-device-sequencer"
* entry[=].resource = mii-exa-molgen-device-sequencer
* entry[=].request.method = #POST
* entry[=].request.url = "Device"
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-practitioner-physician"
* entry[=].resource = mii-exa-molgen-practitioner-physician
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"

Instance: mii-exa-molgen-specimen-brca1
InstanceOf: https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore
Usage: #example
* status = #available
* type = SCT#127457009 "Tissue specimen from breast (specimen)"
* subject = Reference(mii-exa-molgen-patient-brca1)
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

Instance: mii-exa-molgen-bundle-fam-his-breast-ovar-can
InstanceOf: Bundle
Usage: #example
* type = #transaction
* timestamp = "2022-11-04T13:47:00+01:00"
* insert Bundle(mii-exa-molgen-patient-brca1, Patient)
* insert Bundle(mii-exa-molgen-molekulargenetischer-befundbericht-trurisk-panel, DiagnosticReport)
* insert Bundle(mii-exa-molgen-folgemassnahme-brca1, Task)
* insert Bundle(mii-exa-molgen-prs-brca1, RiskAssessment)
* insert Bundle(mii-exa-molgen-anforderung-trurisk-panel, ServiceRequest)
* insert Bundle(mii-exa-molgen-practitioner-lab, Practitioner)
* insert Bundle(mii-exa-molgen-specimen-brca1, Specimen)
* insert Bundle(mii-exa-molgen-device-sequencer-nextseq, Device)
* insert Bundle(mii-exa-molgen-ergebnis-zusammenfassung-trurisk-panel, Observation)
* insert Bundle(mii-exa-molgen-variante-brca1, Observation)
* insert Bundle(mii-exa-molgen-diagnostische-implikation-brca1, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-ATM, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BRCA1, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BARD1, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BRCA2, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BRIP1, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-CDH1, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-CHECK2, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-MLH1, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-MSH2, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-MSH6, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-PALB2, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-PMS2, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-PTEN, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-RAD51C, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-RAD51D, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-TP53, Observation)

// NIPBL
Instance: mii-exa-molgen-bundle-befund-2-nipbl
InstanceOf: Bundle
Usage: #example
* type = #transaction
* timestamp = "2022-11-21T14:44:00+01:00"
* insert Bundle(mii-exa-molgen-patient-2, Patient)
* insert Bundle(mii-exa-molgen-molekulargenetischer-befundbericht-2, DiagnosticReport)
* insert Bundle(mii-exa-molgen-anforderung-2, ServiceRequest)
* insert Bundle(mii-exa-molgen-chargeitem-ebm-21, ChargeItem)
* insert Bundle(mii-exa-molgen-chargeitem-ebm-22, ChargeItem)
* insert Bundle(mii-exa-molgen-chargeitem-ebm-23, ChargeItem)
* insert Bundle(mii-exa-molgen-chargeitem-ebm-24, ChargeItem)
* insert Bundle(mii-exa-molgen-practitioner-lab, Practitioner)
* insert Bundle(mii-exa-molgen-practitioner-physician, Practitioner)
* insert Bundle(mii-exa-molgen-specimen-2, Specimen)
* insert Bundle(mii-exa-molgen-diagnostische-implikation-2, Observation)
* insert Bundle(mii-exa-molgen-variante-2, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-nipbl, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-hdac8, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-rad21, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-smc1a, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-smc3, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-tp63, Observation)
* insert Bundle(mii-exa-molgen-bundle-befund-2-nipbl-condition-lab, Condition)

Instance: mii-exa-molgen-bundle-befund-2-nipbl-condition-lab
InstanceOf: Condition
Usage: #example
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#provisional
* code.coding[0].extension[0].url = "http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit"
* code.coding[=].extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT#V
* code.coding[=].version = "2021"
* code.coding[=] = http://fhir.de/CodeSystem/bfarm/icd-10-gm#Q87.1 "Angeborene Fehlbildungssyndrome, die vorwiegend mit Kleinwuchs einhergehen"
* code.coding[1] = OMIM#122470 "Cornelia de Lange syndrome 1"
* subject = Reference(mii-exa-molgen-patient-2)
* recorder = Reference(mii-exa-molgen-practitioner-lab)
* asserter = Reference(mii-exa-molgen-practitioner-lab)
//* encounter = Reference(Patient/12345)
//* onsetPeriod.start = "2019-09-26T12:45:00+01:00"
//* onsetPeriod.end = "2020-03-25T13:00:00+01:00"
* recordedDate = "2022-03-05T10:49:00+01:00"

Instance: mii-exa-molgen-condition-nipbl-clinical
InstanceOf: Condition
Usage: #example
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* code.coding[0].extension[0].url = "http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit"
* code.coding[=].extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT#G
* code.coding[=].version = "2021"
* code.coding[=] = http://fhir.de/CodeSystem/bfarm/icd-10-gm#Q87.1 "Angeborene Fehlbildungssyndrome, die vorwiegend mit Kleinwuchs einhergehen"
* code.coding[1] = OMIM#122470 "Cornelia de Lange syndrome 1"
* subject = Reference(mii-exa-molgen-patient-2)
//* encounter = Reference(Patient/12345)
* recorder = Reference(mii-exa-molgen-practitioner-physician)
* asserter = Reference(mii-exa-molgen-practitioner-physician)
* onsetPeriod.start = "2021-09-19"
* onsetPeriod.start.extension.url = "http://fhir.de/StructureDefinition/lebensphase"
* onsetPeriod.start.extension.valueCoding = SCT#255407002 "Neonatal (qualifier value)"
* recordedDate = "2022-03-06T07:36:00+01:00"
* evidence.detail = Reference(mii-exa-molgen-molekulargenetischer-befundbericht-2)

Instance: mii-exa-molgen-phenotypic-feature-1
InstanceOf: Observation
Usage: #example
//* meta.profile = "https://github.com/phenopackets/core-ig/StructureDefinition/PhenotypicFeature"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* code = HPO#HP:0000527 "Long eyelashes"
* effectiveDateTime = "2022-03-13T09:30:00+01:00"
* subject = Reference(mii-exa-molgen-patient-2)
* valueCodeableConcept = LNC#LA9633-4 "Present"
* performer = Reference(mii-exa-molgen-practitioner-physician)

Instance: mii-exa-molgen-phenotypic-feature-2
InstanceOf: Observation
Usage: #example
//* meta.profile = "https://github.com/phenopackets/core-ig/StructureDefinition/PhenotypicFeature"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* code = HPO#HP:0001518 "Small for gestational age"
* effectiveDateTime = "2022-03-13T09:30:00+01:00"
* subject = Reference(mii-exa-molgen-patient-2)
* valueCodeableConcept = LNC#LA9633-4 "Present"
* performer = Reference(mii-exa-molgen-practitioner-physician)

Instance: mii-exa-molgen-phenotypic-feature-3
InstanceOf: Observation
Usage: #example
//* meta.profile = "https://github.com/phenopackets/core-ig/StructureDefinition/PhenotypicFeature"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* code = HPO#HP:0000252 "Microcephaly"
* effectiveDateTime = "2022-03-13T09:30:00+01:00"
* subject = Reference(mii-exa-molgen-patient-2)
* valueCodeableConcept = LNC#LA9633-4 "Present"
* performer = Reference(mii-exa-molgen-practitioner-physician)

Instance: mii-exa-molgen-phenotypic-feature-4
InstanceOf: Observation
Usage: #example
//* meta.profile = "https://github.com/phenopackets/core-ig/StructureDefinition/PhenotypicFeature"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* code = HPO#HP:0003560 "Muscular dystrophy"
* effectiveDateTime = "2022-03-13T09:30:00+01:00"
* subject = Reference(mii-exa-molgen-patient-2)
* valueCodeableConcept = LNC#LA9633-4 "Present"
* performer = Reference(mii-exa-molgen-practitioner-physician)

Instance: mii-exa-befund-bundle-befund-2-nipbl-clinical
InstanceOf: Bundle
Usage: #example
* type = #transaction
* timestamp = "2022-11-21T14:44:00+01:00"
* insert Bundle(mii-exa-molgen-patient-2, Patient)
* insert Bundle(mii-exa-molgen-practitioner-lab, Practitioner)
* insert Bundle(mii-exa-molgen-practitioner-physician, Practitioner)
* insert Bundle(mii-exa-molgen-condition-nipbl-clinical, Condition)
* insert Bundle(mii-exa-molgen-phenotypic-feature-1, Observation)
* insert Bundle(mii-exa-molgen-phenotypic-feature-2, Observation)
* insert Bundle(mii-exa-molgen-phenotypic-feature-3, Observation)
* insert Bundle(mii-exa-molgen-phenotypic-feature-4, Observation)
* insert Bundle(mii-exa-molgen-molekulargenetischer-befundbericht-2, DiagnosticReport)
* insert Bundle(mii-exa-molgen-anforderung-2, ServiceRequest)
* insert Bundle(mii-exa-molgen-chargeitem-ebm-21, ChargeItem)
* insert Bundle(mii-exa-molgen-chargeitem-ebm-22, ChargeItem)
* insert Bundle(mii-exa-molgen-chargeitem-ebm-23, ChargeItem)
* insert Bundle(mii-exa-molgen-chargeitem-ebm-24, ChargeItem)
* insert Bundle(mii-exa-molgen-specimen-2, Specimen)
* insert Bundle(mii-exa-molgen-device-sequencer-2, Device)
* insert Bundle(mii-exa-molgen-diagnostische-implikation-2, Observation)
* insert Bundle(mii-exa-molgen-variante-2, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-nipbl, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-hdac8, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-rad21, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-smc1a, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-smc3, Observation)
* insert Bundle(mii-exa-molgen-untersuchte-region-2-tp63, Observation)
* insert Bundle(mii-exa-molgen-bundle-befund-2-nipbl-condition-lab, Condition)

