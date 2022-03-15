Profile: SD_MII_MolGen_Medikationsempfehlung
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/task-med-chg
Id: sd-mii-modul-molgen-medikationsempfehlung
Title: "SD MII MolGen Medikationsempfehlung"
Description: "Das Profil dieser Task Ressource dient dazu, auf der Grundlage der genetischen Ergebnisse medikamanetöse Maßnahmen vorzuschlagen."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung"
* ^status = #draft
* for MS 
* for only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* for only Reference(Patient)
* reasonReference only Reference(SD_MII_MolGen_TherapeutischeImplikation)

Mapping: MolGen-Medikationsempfehlung
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_Medikationsempfehlung
* -> "mide-dataelement-1724" "Empfehlungen (Therapie, Allg.)"

Instance: example-mii-molgen-medikationsempfehlung-1
InstanceOf: sd-mii-modul-molgen-medikationsempfehlung
Usage: #example
Title: "BRAF Variante Medikationsempfehlung"
Description: "Beispiel für Medikationsempfehlung abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/task-med-chg"
* basedOn = Reference(servicerequest/example)
* status = TaskStatus#requested
* intent = RequestIntent#proposal
* code = LNC#LA26421-0 "Consider alternative medication"
* code.text = "Alternative Medikation in Erwägung ziehen"
* for = Reference(Patient/example)
* reasonReference = Reference(example-mii-molgen-therapeutische-implikation-1)
