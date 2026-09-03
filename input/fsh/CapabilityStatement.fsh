Alias: $exp = http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation

RuleSet: SupportResource (resource, expectation)
* rest.resource[+].type = #{resource}
* rest.resource[=].extension[0].url = $exp
* rest.resource[=].extension[0].valueCode = {expectation}

RuleSet: Profile (profile)
* rest.resource[=].profile[+] = "{profile}"

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
* date = "2024-11-08"
* insert Version
* publisher = "Medizininformatik-Initiative"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.medizininformatik-initiative.de"
* description = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul MolGen der Medizininformatik-Initiative zu implementieren."
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest.mode = #server

// ServiceRequest requirements
* insert SupportResource(ServiceRequest, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/ServiceRequest)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test|2027.0.0-ballot.rc1, #SHALL)
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
* insert SupportSearchParam(reason-code, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasoncode	, #token, #SHALL)
* insert SupportSearchParam(reason-reference, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasonreference	
, #reference, #SHALL)

// DiagnosticReport requirements
* insert SupportResource(DiagnosticReport, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/DiagnosticReport)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht|2027.0.0-ballot.rc1, #SHALL)
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

// Von diesem Modul selbst deklarierte Suchparameter (siehe input/fsh/SearchParameter.fsh).
// Sie erschliessen Elemente in Clinical-Genomics-Extensions, die die FHIR-Basis-Parameter nicht erreichen.
* insert SupportSearchParam(genomic-study, https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-GenomicStudy, #reference, #SHALL)
* insert SupportSearchParam(recommended-action, https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-RecommendedAction, #reference, #SHALL)
* insert SupportResource(Observation, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/Observation)
// Removed: ergebnis-zusammenfassung (replaced by GenomicReport.conclusion)
// Removed: untersuchte-region (replaced by GenomicStudy/Analysis)
// Diese drei Profile tragen den Praefix im Canonical, die uebrigen zwoelf nicht.
// Das ist seit 2026.0.4 so veroeffentlicht und damit feste Identitaet - nicht die
// Profile sind falsch, sondern die Eintraege hier zeigten auf Canonicals, die es
// nicht gibt. Korrigiert 2026-09-02.
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation|2027.0.0-ballot.rc1, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation|2027.0.0-ballot.rc1, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante|2027.0.0-ballot.rc1, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekulare-konsequenz|2027.0.0-ballot.rc1, #SHALL)
// Basisprofil von Mikrosatelliteninstabilitaet und Mutationslast. Es war bisher gar
// nicht deklariert: einem Server wurden die beiden Kinder vorgeschrieben, ihr
// Elternprofil aber verschwiegen. SHALL, konsistent mit den beiden Kindern.
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekularer-biomarker|2027.0.0-ballot.rc1, #SHALL)
// Genotyp ist MAY, nicht SHALL: eine aggregierte Allel-Aussage, die viele Labore gar
// nicht erzeugen. Der verpflichtende Kern dieses Moduls sind Befundbericht, Variante
// und die Implikationen. Wer Genotypen austauscht, nutzt dieses Profil - erzeugen muss
// sie niemand. Entschieden 2026-09-02, zusammen mit haplotype und
// sequence-phase-relationship, mit denen Genotyp fachlich eine Gruppe bildet.
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp|2027.0.0-ballot.rc1, #MAY)
// Zwei Profile aus Clinical Genomics STU3, die dieses Modul unveraendert verwendet und
// nicht selbst profiliert. Beide MAY: sie tragen keine Anforderung des Kerndatensatzes,
// dieses Modul leitet nichts von ihnen ab, und es gibt kein einziges Beispiel dafuer.
// Haplotype stand frueher auf SHALL, was Implementierende zu etwas verpflichtete, das
// der Guide nirgends zeigt; Sequence Phase Relationship war gar nicht deklariert,
// obwohl die Implementiererseite beide als verwendet darstellt. Entschieden 2026-09-02.
* insert SupportProfile(http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype, #MAY)
* insert SupportProfile(http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship, #MAY)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mutationslast|2027.0.0-ballot.rc1, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mikrosatelliteninstabilitaet|2027.0.0-ballot.rc1, #SHALL)
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

// Procedure requirements (for GenomicStudy)
* insert SupportResource(Procedure, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/Procedure)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study|2027.0.0-ballot.rc1, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis|2027.0.0-ballot.rc1, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, #SHALL)
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL)
* insert SupportSearchParam(_profile, http://hl7.org/fhir/SearchParameter/Resource-profile, #uri, #SHALL)
* insert SupportSearchParam(status, http://hl7.org/fhir/SearchParameter/Procedure-status, #token, #SHALL)
// GenomicStudy und GenomicStudyAnalysis sind beide Procedure und werden durch den
// Code unterschieden — ohne diesen Parameter lassen sie sich serverseitig nicht
// trennen. Die frueheren Profil-Intros sagten ihn zu, das CapabilityStatement nicht.
* insert SupportSearchParam(code, http://hl7.org/fhir/SearchParameter/clinical-code, #token, #SHALL)
* insert SupportSearchParam(subject, http://hl7.org/fhir/SearchParameter/clinical-patient, #reference, #SHALL)
* insert SupportSearchParam(encounter, http://hl7.org/fhir/SearchParameter/clinical-encounter, #reference, #SHALL)
* insert SupportSearchParam(performer, http://hl7.org/fhir/SearchParameter/Procedure-performer, #reference, #SHALL)
* insert SupportSearchParam(date, http://hl7.org/fhir/SearchParameter/clinical-date, #date, #SHALL)

// RiskAssessment requirements (for PolygenerRisikoScore)

// Von diesem Modul selbst deklarierte Suchparameter (siehe input/fsh/SearchParameter.fsh).
// Sie erschliessen Elemente in Clinical-Genomics-Extensions, die die FHIR-Basis-Parameter nicht erreichen.
* insert SupportSearchParam(device, https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Device, #reference, #SHALL)
* insert SupportSearchParam(method-type, https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-MethodType, #token, #SHALL)
* insert SupportSearchParam(regions-studied, https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-RegionsStudied, #token, #SHALL)
* insert SupportSearchParam(specimen, https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Specimen, #reference, #SHALL)
* insert SupportResource(RiskAssessment, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/RiskAssessment)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score|2027.0.0-ballot.rc1, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, #SHALL)
* insert SupportSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL)
* insert SupportSearchParam(_profile, http://hl7.org/fhir/SearchParameter/Resource-profile, #uri, #SHALL)
* insert SupportSearchParam(subject, http://hl7.org/fhir/SearchParameter/RiskAssessment-subject, #reference, #SHALL)
* insert SupportSearchParam(performer, http://hl7.org/fhir/SearchParameter/RiskAssessment-performer, #reference, #SHALL)
* insert SupportSearchParam(date, http://hl7.org/fhir/SearchParameter/clinical-date, #date, #SHALL)

// Task requirements
* insert SupportResource(Task, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/Task)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung|2027.0.0-ballot.rc1, #SHALL)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme|2027.0.0-ballot.rc1, #SHALL)
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
* insert SupportSearchParam(reason-code, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-reasoncode, #token, #SHALL)
* insert SupportSearchParam(reason-reference, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-reasonreference, #reference, #SHALL)
* insert SupportSearchParam(for, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-for, #reference, #SHALL)
 
// FamilyMemberHistory requirements
* insert SupportResource(FamilyMemberHistory, #SHALL)
* insert Profile(http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory)
* insert SupportProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese|2027.0.0-ballot.rc1, #SHALL)
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
* insert SupportSearchParam(reason-code, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-familymemberhistory-reasoncode, #token, #SHALL)
* insert SupportSearchParam(reason-reference, https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-familymemberhistory-reasonreference, #reference, #SHALL)