Instance: sp-mii-molgen-servicerequest-reasoncode
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/ServiceRequest-ReasonCode"
* name = "SP_MII_MolGen_ServiceRequest_ReasonCode"
* status = #draft
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für ServiceRequest.reasonCode"
* code = #reason-code
* base = #ServiceRequest
* type = #token
* expression = "ServiceRequest.reasonCode"

Instance: sp-mii-molgen-servicerequest-reasonreference
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/ServiceRequest-ReasonReference"
* name = "SP_MII_MolGen_ServiceRequest_ReasonReference"
* status = #draft
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für ServiceRequest.reasonReference"
* code = #reason-reference
* base = #ServiceRequest
* type = #reference
* expression = "ServiceRequest.reasonReference"
* target[+] = #Condition
* target[+] = #Observation
* target[+] = #DiagnosticReport
* target[+] = #DocumentReference

Instance: sp-mii-molgen-task-reasoncode
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-ReasonCode"
* name = "SP_MII_MolGen_Task_ReasonCode"
* status = #draft
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für Task.reasonCode"
* code = #reason-code
* base = #Task
* type = #token
* expression = "Task.reasonCode"

Instance: sp-mii-molgen-task-reasonreference
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-ReasonReference"
* name = "SP_MII_MolGen_Task_ReasonReference"
* status = #draft
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für Task.reasonReference"
* code = #reason-reference
* base = #Task
* type = #reference
* expression = "Task.reasonReference"
* target[0] = #Observation

Instance: sp-mii-molgen-task-for
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/Task-For"
* name = "SP_MII_MolGen_Task_For"
* status = #draft
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für Task.for"
* code = #reason-reference
* base = #Task
* type = #reference
* expression = "Task.for"
* target[0] = #Patient

Instance: sp-mii-molgen-familymemberhistory-reasoncode
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/FamilyMemberHistory-ReasonCode"
* name = "SP_MII_MolGen_FamilyMemberHistory_ReasonCode"
* status = #draft
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für FamilyMemberHistory.reasonCode"
* code = #reason-code
* base = #FamilyMemberHistory
* type = #token
* expression = "FamilyMemberHistory.reasonCode"

Instance: sp-mii-molgen-familymemberhistory-reasonreference
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/FamilyMemberHistory-ReasonReference"
* name = "SP_MII_MolGen_FamilyMemberHistory_ReasonReference"
* status = #draft
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für FamilyMemberHistory.reasonReference"
* code = #reason-reference
* base = #FamilyMemberHistory
* type = #reference
* expression = "FamilyMemberHistory.reasonReference"
* target[0] = #Condition
* target[+] = #Observation
* target[+] = #DiagnosticReport
* target[+] = #DocumentReference
* target[+] = #AllergyIntolerance
* target[+] = #QuestionnaireResponse

Instance: sp-mii-molgen-familymemberhistory-condition
InstanceOf: SearchParameter
Usage: #definition
* url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molgen/SearchParameter/FamilyMemberHistory-Condition"
* name = "SP_MII_MolGen_FamilyMemberHistory_Condition"
* status = #draft
* experimental = false
* date = "2022-07-07"
* description = "Suchparameter für FamilyMemberHistory.condition.code"
* code = #condition
* base = #FamilyMemberHistory
* type = #token
* expression = "FamilyMemberHistory.condition.code"