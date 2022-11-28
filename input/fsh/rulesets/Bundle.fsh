RuleSet: Bundle(resource, url)
* entry[+].fullUrl = "https://www.medizininformatik-initiative.de/fhir/{resource}"
* entry[=].resource = {resource}
* entry[=].request.method = #PUT
* entry[=].request.url = "{url}/{resource}"
