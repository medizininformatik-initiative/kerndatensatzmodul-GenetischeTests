Alias: $exp = http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation

RuleSet: SupportResource (resource, expectation)
* rest.resource[+].type = #{resource}
* rest.resource[=].extension[0].url = $exp
* rest.resource[=].extension[0].valueCode = {expectation}

RuleSet: Profile (profile, expectation)
* rest.resource[=].profile[+] = "{profile}"
* rest.resource[=].profile[=].extension[0].url = $exp
* rest.resource[=].profile[=].extension[0].valueCode = {expectation}

RuleSet: SupportProfile (profile, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].supportedProfile[+] = "{profile}"
* rest.resource[=].supportedProfile[=].extension[0].url = $exp
* rest.resource[=].supportedProfile[=].extension[0].valueCode = {expectation}

RuleSet: SupportInteraction (interaction, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].interaction[+].code = {interaction}
* rest.resource[=].interaction[=].extension[0].url = $exp
* rest.resource[=].interaction[=].extension[0].valueCode = {expectation}

RuleSet: SupportSearchParam (name, canonical, type, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].searchParam[+].name = "{name}"
* rest.resource[=].searchParam[=].definition = "{canonical}"
* rest.resource[=].searchParam[=].type = {type}
* rest.resource[=].searchParam[=].extension[0].url = $exp
* rest.resource[=].searchParam[=].extension[0].valueCode = {expectation}

Instance: mii-cps-molgen-capabilitystatement
InstanceOf: CapabilityStatement
Usage: #definition
* insert SP_Publisher
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/CapabilityStatement/metadata"
* name = "MII_CPS_MolGen_CapabilityStatement"
* title = "MII CPS MolGen CapabilityStatement"
* status = #active
* experimental = false
* date = "2022-07-07"
* publisher = "Medizininformatik Initiative"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.medizininformatik-initiative.de"
* description = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul MolGen der Medizininformatik Initiative zu implementieren."
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest.mode = #server

// ServiceRequest requirements
* insert SupportResource(ServiceRequest, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/ServiceRequest, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test|0.9.0-ballot, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, #SHALL)
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL)
* insert SupportSearchParam(_profile, http://hl7.org/fhir/SearchParameter/Resource-profile, #uri, #SHALL)
* insert SupportSearchParam(code, http://hl7.org/fhir/SearchParameter/clinical-code, #token, #SHALL)
* insert SupportSearchParam(based-on, http://hl7.org/fhir/SearchParameter/ServiceRequest-based-on, #reference, #SHALL)
* insert SupportSearchParam(subject, http://hl7.org/fhir/SearchParameter/ServiceRequest-subject, #reference, #SHALL)
* insert SupportSearchParam(authored, http://hl7.org/fhir/SearchParameter/ServiceRequest-authored, #date, #SHALL)
* insert SupportSearchParam(requester, http://hl7.org/fhir/SearchParameter/ServiceRequest-requester, #reference, #SHALL)
* insert SupportSearchParam(reason-code, https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/ServiceRequest-ReasonCode, #token, #SHALL)
* insert SupportSearchParam(reason-reference, https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/ServiceRequest-ReasonReference, #reference, #SHALL)

// DiagnosticReport requirements
* insert SupportResource(DiagnosticReport, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/DiagnosticReport, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht|0.9.0-ballot, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, #SHALL)
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL)
* insert SupportSearchParam(_profile, http://hl7.org/fhir/SearchParameter/Resource-profile, #uri, #SHALL)
* insert SupportSearchParam(status, http://hl7.org/fhir/SearchParameter/DiagnosticReport-status, #token, #SHALL)
* insert SupportSearchParam(category, http://hl7.org/fhir/SearchParameter/DiagnosticReport-category, #token, #SHALL)
* insert SupportSearchParam(code, http://hl7.org/fhir/SearchParameter/clinical-code, #token, #SHALL)
* insert SupportSearchParam(subject, http://hl7.org/fhir/SearchParameter/DiagnosticReport-subject, #reference, #SHALL)
* insert SupportSearchParam(encounter, http://hl7.org/fhir/SearchParameter/clinical-encounter, #reference, #SHALL)
* insert SupportSearchParam(date, http://hl7.org/fhir/SearchParameter/clinical-date, #date, #SHALL)
* insert SupportSearchParam(issued, http://hl7.org/fhir/SearchParameter/DiagnosticReport-issued, #date, #SHALL)
* insert SupportSearchParam(performer, http://hl7.org/fhir/SearchParameter/DiagnosticReport-performer, #reference, #SHALL)
* insert SupportSearchParam(results-interpreter, http://hl7.org/fhir/SearchParameter/DiagnosticReport-results-interpreter, #reference, #SHALL)
* insert SupportSearchParam(specimen, http://hl7.org/fhir/SearchParameter/DiagnosticReport-specimen, #reference, #SHALL)
* insert SupportSearchParam(result, http://hl7.org/fhir/SearchParameter/DiagnosticReport-result, #reference, #SHALL)
* insert SupportSearchParam(conclusion, http://hl7.org/fhir/SearchParameter/DiagnosticReport-conclusion, #token, #SHALL)
* insert SupportSearchParam(media, http://hl7.org/fhir/SearchParameter/DiagnosticReport-media, #reference, #SHALL)

// Observation requirements
* insert SupportResource(Observation, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/Observation, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/ergebnis-zusammenfassung|0.9.0-ballot, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation|0.9.0-ballot, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation|0.9.0-ballot, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante|0.9.0-ballot, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/untersuchte-region|0.9.0-ballot, #SHALL)
* insert SupportProfile(http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp|0.9.0-ballot, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mutationslast|0.9.0-ballot, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mikrosatelliteninstabilitaet|0.9.0-ballot, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, #SHALL)
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL)
* insert SupportSearchParam(_profile, http://hl7.org/fhir/SearchParameter/Resource-profile, #uri, #SHALL)
* insert SupportSearchParam(based-on, http://hl7.org/fhir/SearchParameter/Observation-based-on, #reference, #SHALL)
* insert SupportSearchParam(category, http://hl7.org/fhir/SearchParameter/Observation-category, #token, #SHALL)
* insert SupportSearchParam(code, http://hl7.org/fhir/SearchParameter/clinical-code, #token, #SHALL)
* insert SupportSearchParam(code-value-concept, http://hl7.org/fhir/SearchParameter/Observation-code-value-concept, #composite, #SHALL)
* insert SupportSearchParam(code-value-date, http://hl7.org/fhir/SearchParameter/Observation-code-value-date, #composite, #SHALL)
* insert SupportSearchParam(code-value-quantity, http://hl7.org/fhir/SearchParameter/Observation-code-value-quantity, #composite, #SHALL)
* insert SupportSearchParam(code-value-string, http://hl7.org/fhir/SearchParameter/Observation-code-value-string, #composite, #SHALL)
* insert SupportSearchParam(component-code, http://hl7.org/fhir/SearchParameter/Observation-component-code, #token, #SHALL)
* insert SupportSearchParam(component-code-value-concept, http://hl7.org/fhir/SearchParameter/Observation-component-code-value-concept, #composite, #SHALL)
* insert SupportSearchParam(component-code-value-quantity, http://hl7.org/fhir/SearchParameter/Observation-component-code-value-quantity, #composite, #SHALL)
* insert SupportSearchParam(component-data-absent-reason, http://hl7.org/fhir/SearchParameter/Observation-component-data-absent-reason, #token, #SHALL)
* insert SupportSearchParam(component-value-concept, http://hl7.org/fhir/SearchParameter/Observation-component-value-concept, #token, #SHALL)
* insert SupportSearchParam(component-value-quantity, http://hl7.org/fhir/SearchParameter/Observation-component-value-quantity, #quantity, #SHALL)
* insert SupportSearchParam(data-absent-reason, http://hl7.org/fhir/SearchParameter/Observation-data-absent-reason, #token, #SHALL)
* insert SupportSearchParam(date, http://hl7.org/fhir/SearchParameter/clinical-date, #date, #SHALL)
* insert SupportSearchParam(derived-from, http://hl7.org/fhir/SearchParameter/Observation-derived-from, #reference, #SHALL)
* insert SupportSearchParam(device, http://hl7.org/fhir/SearchParameter/Observation-device, #reference, #SHALL)
* insert SupportSearchParam(encounter, http://hl7.org/fhir/SearchParameter/clinical-encounter, #reference, #SHALL)
* insert SupportSearchParam(focus, http://hl7.org/fhir/SearchParameter/Observation-focus, #reference, #SHALL)
* insert SupportSearchParam(has-member, http://hl7.org/fhir/SearchParameter/Observation-has-member, #reference, #SHALL)
* insert SupportSearchParam(identifier, http://hl7.org/fhir/SearchParameter/clinical-identifier, #token, #SHALL)
* insert SupportSearchParam(method, http://hl7.org/fhir/SearchParameter/Observation-method, #token, #SHALL)
* insert SupportSearchParam(part-of, http://hl7.org/fhir/SearchParameter/Observation-part-of, #reference, #SHALL)
* insert SupportSearchParam(patient, http://hl7.org/fhir/SearchParameter/clinical-patient, #reference, #SHALL)
* insert SupportSearchParam(performer, http://hl7.org/fhir/SearchParameter/Observation-performer, #reference, #SHALL)
* insert SupportSearchParam(specimen, http://hl7.org/fhir/SearchParameter/Observation-specimen, #reference, #SHALL)
* insert SupportSearchParam(status, http://hl7.org/fhir/SearchParameter/Observation-status, #token, #SHALL)
* insert SupportSearchParam(subject, http://hl7.org/fhir/SearchParameter/Observation-subject, #reference, #SHALL)
* insert SupportSearchParam(value-concept, http://hl7.org/fhir/SearchParameter/Observation-value-concept, #token, #SHALL)
* insert SupportSearchParam(value-date, http://hl7.org/fhir/SearchParameter/Observation-value-date, #date, #SHALL)
* insert SupportSearchParam(value-quantity, http://hl7.org/fhir/SearchParameter/Observation-value-quantity, #quantity, #SHALL)
* insert SupportSearchParam(value-string, http://hl7.org/fhir/SearchParameter/Observation-value-string, #string, #SHALL)

// Task requirements
* insert SupportResource(Task, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/Task, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung|0.9.0-ballot, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme|0.9.0-ballot, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, #SHALL)
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL)
* insert SupportSearchParam(_profile, http://hl7.org/fhir/SearchParameter/Resource-profile, #uri, #SHALL)
* insert SupportSearchParam(based-on, http://hl7.org/fhir/SearchParameter/Task-based-on, #reference, #SHALL)
* insert SupportSearchParam(code, http://hl7.org/fhir/SearchParameter/Task-code, #token, #SHALL)
* insert SupportSearchParam(encounter, http://hl7.org/fhir/SearchParameter/Task-encounter, #reference, #SHALL)
* insert SupportSearchParam(focus, http://hl7.org/fhir/SearchParameter/Task-focus, #reference, #SHALL)
* insert SupportSearchParam(intent, http://hl7.org/fhir/SearchParameter/Task-intent, #token, #SHALL)
* insert SupportSearchParam(patient, http://hl7.org/fhir/SearchParameter/Task-patient, #reference, #SHALL)
* insert SupportSearchParam(performer, http://hl7.org/fhir/SearchParameter/Task-performer, #token, #SHALL)
* insert SupportSearchParam(requester, http://hl7.org/fhir/SearchParameter/Task-requester, #reference, #SHALL)
* insert SupportSearchParam(status, http://hl7.org/fhir/SearchParameter/Task-status, #token, #SHALL)
* insert SupportSearchParam(subject, http://hl7.org/fhir/SearchParameter/Task-subject, #reference, #SHALL)
* insert SupportSearchParam(reason-code, https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-ReasonCode, #token, #SHALL)
* insert SupportSearchParam(reason-reference, https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-ReasonReference, #reference, #SHALL)
* insert SupportSearchParam(for, https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-For, #reference, #SHALL)
 
// FamilyMemberHistory requirements
* insert SupportResource(FamilyMemberHistory, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese|0.9.0-ballot, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, #SHALL)
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL)
* insert SupportSearchParam(_profile, http://hl7.org/fhir/SearchParameter/Resource-profile, #uri, #SHALL)
* insert SupportSearchParam(code, http://hl7.org/fhir/SearchParameter/clinical-code, #token, #SHALL)
* insert SupportSearchParam(date, http://hl7.org/fhir/SearchParameter/clinical-date, #date, #SHALL)
* insert SupportSearchParam(identifier, http://hl7.org/fhir/SearchParameter/clinical-identifier, #token, #SHALL)
* insert SupportSearchParam(patient, http://hl7.org/fhir/SearchParameter/clinical-patient, #reference, #SHALL)
* insert SupportSearchParam(relationship, http://hl7.org/fhir/SearchParameter/FamilyMemberHistory-relationship, #token, #SHALL)
* insert SupportSearchParam(sex, http://hl7.org/fhir/SearchParameter/FamilyMemberHistory-sex, #token, #SHALL)
* insert SupportSearchParam(status, http://hl7.org/fhir/SearchParameter/FamilyMemberHistory-status, #token, #SHALL)
* insert SupportSearchParam(reason-code, https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/FamilyMemberHistory-ReasonCode, #token, #SHALL)
* insert SupportSearchParam(reason-reference, https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/FamilyMemberHistory-ReasonReference, #reference, #SHALL)