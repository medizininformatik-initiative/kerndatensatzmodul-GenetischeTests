Profile: SD_MII_MolGen_EmpfohleneFolgemassnahme
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation
Id: sd-mii-modul-molgen-empfohlene-folgemassnahme
Title: "SD MII MolGen Empfohlene Folgemaßnahme"
Description: "Das Profil dieser Task Ressource beschreibt die empfohlenen Folgemaßnahmen."
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme"
* ^status = #draft
* status MS
* intent MS
* code MS
* for 1.. MS 
* for only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* for only Reference(Patient)
* encounter MS
* reasonCode MS
* reasonReference MS
* reasonReference only Reference(SD_MII_MolGen_TherapeutischeImplikation)

Mapping: MolGen-EmpfohleneFolgemassnahme
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_EmpfohleneFolgemassnahme
* code -> "mide-dataelement-1724" "Empfehlungen (Therapie, Allg.)"
* code -> "mide-dataelement-1443" "Beratung"

Instance: example-mii-molgen-folgemassnahme-1
InstanceOf: sd-mii-modul-molgen-empfohlene-folgemassnahme
Usage: #example
Title: "BRAF Empfohlene Folgemaßnahme"
Description: "Beispiel für empfohlene Folgemaßnahme abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation"
* basedOn = Reference(servicerequest/example)
* status = TaskStatus#requested
* intent = RequestIntent#proposal
* code = LNC#LA14020-4 "Genetic counseling recommended"
* description = "Genetische Beratung empfohlen mit Dr. Rosalind Franklin"
* for = Reference(example-mii-molgen-patient)
* reasonReference = Reference(example-mii-molgen-therapeutische-implikation-1)

Instance: mii-exa-molgen-folgemassnahme-brca1
InstanceOf: sd-mii-modul-molgen-empfohlene-folgemassnahme
Usage: #example
Title: "Empfohlene Folgemaßnahme bei BRCA1 Variante"
Description: "Beispiel für empfohlene Folgemaßnahme abgeleitet von genetischer Variante im BRCA1 Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation"
* basedOn = Reference(mii-exa-molgen-anforderung-trurisk-panel)
* status = TaskStatus#requested
* intent = RequestIntent#proposal
* code = LNC#LA14020-4 "Genetic counseling recommended"
* description = "Eine genetische Beratung hinsichtlich einer gezielten Testung leiblicher Familienmitglieder wird empfohlen."
* for = Reference(mii-exa-molgen-patient-brca1)