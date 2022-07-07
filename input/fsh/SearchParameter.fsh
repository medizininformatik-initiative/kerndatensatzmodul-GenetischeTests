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