RuleSet: Bundle(resource, url)
* entry[0].fullUrl = "https://www.medizininformatik-initiative.de/fhir/{resource}"
* entry[=].resource = {resource}
* entry[=].request.method = #POST
* entry[=].request.url = "{url}"
