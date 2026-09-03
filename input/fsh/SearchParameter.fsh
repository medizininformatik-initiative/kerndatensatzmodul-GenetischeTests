// Instance: mii-sp-molgen-servicerequest-reasoncode
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/ServiceRequest-ReasonCode"
// * name = "SP_MII_MolGen_ServiceRequest_ReasonCode"
// * status = #active
// * experimental = false
// * date = "2022-07-07"
// * description = "Suchparameter für ServiceRequest.reasonCode"
// * code = #reason-code
// * base = #ServiceRequest
// * type = #token
// * expression = "ServiceRequest.reasonCode"

// Instance: mii-sp-molgen-servicerequest-reasonreference
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/ServiceRequest-ReasonReference"
// * name = "SP_MII_MolGen_ServiceRequest_ReasonReference"
// * status = #active
// * experimental = false
// * date = "2022-07-07"
// * description = "Suchparameter für ServiceRequest.reasonReference"
// * code = #reason-reference
// * base = #ServiceRequest
// * type = #reference
// * expression = "ServiceRequest.reasonReference"
// * target[+] = #Condition
// * target[+] = #Observation
// * target[+] = #DiagnosticReport
// * target[+] = #DocumentReference

// Instance: mii-sp-molgen-task-reasoncode
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-ReasonCode"
// * name = "SP_MII_MolGen_Task_ReasonCode"
// * status = #active
// * experimental = false
// * date = "2022-07-07"
// * description = "Suchparameter für Task.reasonCode"
// * code = #reason-code
// * base = #Task
// * type = #token
// * expression = "Task.reasonCode"

// Instance: mii-sp-molgen-task-reasonreference
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-ReasonReference"
// * name = "SP_MII_MolGen_Task_ReasonReference"
// * status = #active
// * experimental = false
// * date = "2022-07-07"
// * description = "Suchparameter für Task.reasonReference"
// * code = #reason-reference
// * base = #Task
// * type = #reference
// * expression = "Task.reasonReference"
// * target[0] = #Observation

// Instance: mii-sp-molgen-task-for
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-For"
// * name = "SP_MII_MolGen_Task_For"
// * status = #active
// * experimental = false
// * date = "2022-07-07"
// * description = "Suchparameter für Task.for"
// * code = #reason-reference
// * base = #Task
// * type = #reference
// * expression = "Task.for"
// * target[0] = #Patient

// Instance: mii-sp-molgen-familymemberhistory-reasoncode
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/FamilyMemberHistory-ReasonCode"
// * name = "SP_MII_MolGen_FamilyMemberHistory_ReasonCode"
// * status = #active
// * experimental = false
// * date = "2022-07-07"
// * description = "Suchparameter für FamilyMemberHistory.reasonCode"
// * code = #reason-code
// * base = #FamilyMemberHistory
// * type = #token
// * expression = "FamilyMemberHistory.reasonCode"

// Instance: mii-sp-molgen-familymemberhistory-reasonreference
// InstanceOf: SearchParameter
// Usage: #definition
// * insert SP_Publisher
// * url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/FamilyMemberHistory-ReasonReference"
// * name = "SP_MII_MolGen_FamilyMemberHistory_ReasonReference"
// * status = #active
// * experimental = false
// * date = "2022-07-07"
// * description = "Suchparameter für FamilyMemberHistory.reasonReference"
// * code = #reason-reference
// * base = #FamilyMemberHistory
// * type = #reference
// * expression = "FamilyMemberHistory.reasonReference"
// * target[0] = #Condition
// * target[+] = #Observation
// * target[+] = #DiagnosticReport
// * target[+] = #DocumentReference
// * target[+] = #AllergyIntolerance
// * target[+] = #QuestionnaireResponse

// //Instance: mii-sp-molgen-riskassessment-reason-code
// //InstanceOf: SearchParameter
// //Usage: #definition
// //* insert SP_Publisher
// //* insert SearchParam(riskassessment-reason-code, riskassessment-reason-code, Suche auf RiskAssessment ReasonCode, reason-code, RiskAssessment, token, RiskAssessment.reasonCode)

// SearchParameters for GenomicStudy and GenomicStudyAnalysis
Instance: mii-sp-molgen-genomic-study-analysis-specimen
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Specimen"
* name = "SP_MII_MolGen_GenomicStudyAnalysis_Specimen"
* status = #active
* experimental = false
* date = "2024-11-08"
* description = "Finds analyses performed on a given specimen. The specimen sits in the genomic-study-analysis-specimen extension, so the base Procedure.specimen search parameter does not reach it."
* code = #specimen
* base = #Procedure
* type = #reference
* expression = "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen').value"
* target[+] = #Specimen

Instance: mii-sp-molgen-genomic-study-analysis-method
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-MethodType"
* name = "SP_MII_MolGen_GenomicStudyAnalysis_MethodType"
* status = #active
* experimental = false
* date = "2024-11-08"
* description = "Finds analyses by the sequencing or genotyping method applied (for example targeted panel, whole exome, whole genome). The method sits in the genomic-study-analysis-method-type extension, which no base Procedure search parameter reaches."
* code = #method-type
* base = #Procedure
* type = #token
* expression = "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type').value"

Instance: mii-sp-molgen-genomic-study-analysis-regions-studied
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-RegionsStudied"
* name = "SP_MII_MolGen_GenomicStudyAnalysis_RegionsStudied"
* status = #active
* experimental = false
* date = "2024-11-08"
* description = "Finds analyses that actually examined a given gene or genomic region. This is what distinguishes a variant that was not found from a region that was never examined: without it a query cannot tell the two apart. The value sits in the studied sub-extension of genomic-study-analysis-regions."
* code = #regions-studied
* base = #Procedure
* type = #token
* expression = "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions').extension.where(url='studied').value"

Instance: mii-sp-molgen-genomic-study-analysis-device
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Device"
* name = "SP_MII_MolGen_GenomicStudyAnalysis_Device"
* status = #active
* experimental = false
* date = "2024-11-08"
* description = "Finds analyses run on a given sequencer or analytical device, for tracing results back to the instrument that produced them. The device sits in the genomic-study-analysis-device extension, not in Procedure."
* code = #device
* base = #Procedure
* type = #reference
* expression = "Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device').value"
* target[+] = #Device

// SearchParameters for DiagnosticReport extensions
Instance: mii-sp-molgen-diagnostic-report-genomic-study
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-GenomicStudy"
* name = "SP_MII_MolGen_DiagnosticReport_GenomicStudy"
* status = #active
* experimental = false
* date = "2024-11-08"
* description = "Finds the reports produced by a given genomic study, which is the link from the clinical report back to the investigation behind it. The reference sits in the genomic-study-reference extension; DiagnosticReport has no base search parameter for it."
* code = #genomic-study
* base = #DiagnosticReport
* type = #reference
* expression = "DiagnosticReport.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-reference').value"
* target[+] = #Procedure

Instance: mii-sp-molgen-diagnostic-report-recommended-action
InstanceOf: SearchParameter
Usage: #definition
* insert SP_Publisher
* insert Version
* url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-RecommendedAction"
* name = "SP_MII_MolGen_DiagnosticReport_RecommendedAction"
* status = #active
* experimental = false
* date = "2024-11-08"
* description = "Finds the reports that recommend a given follow-up action, such as a confirmatory test or a therapy recommendation. The reference sits in the recommended-action extension and is not reachable through DiagnosticReport.result."
* code = #recommended-action
* base = #DiagnosticReport
* type = #reference
* expression = "DiagnosticReport.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action').value"
* target[+] = #Task