Profile: MII_PR_MolGen_Medikationsempfehlung
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/medication-recommendation
Id: mii-pr-molgen-medikationsempfehlung
Title: "MII PR MolGen Medikationsempfehlung"
Description: "Das Profil dieser Task Ressource dient dazu, auf der Grundlage der genetischen Ergebnisse medikamanetöse Maßnahmen vorzuschlagen."
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung"
//* ^status = #draft
* status MS
* intent MS
* code 1.. MS
* for 1.. MS 
* for only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* for only Reference(Patient)
* encounter MS
* reasonCode MS
* reasonReference MS
* reasonReference only Reference(MII_PR_MolGen_TherapeutischeImplikation)

Mapping: MolGen-Medikationsempfehlung
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_Medikationsempfehlung
* -> "mide-dataelement-1724" "Empfehlungen (Therapie, Allg.)"

Instance: mii-exa-molgen-medikationsempfehlung-1
InstanceOf: mii-pr-molgen-medikationsempfehlung
Usage: #example
Title: "BRAF Variante Medikationsempfehlung"
Description: "Beispiel für Medikationsempfehlung abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/medication-recommendation"
* basedOn = Reference(servicerequest/example)
* status = TaskStatus#requested
* intent = RequestIntent#proposal
* code = LNC#LA26421-0 "Consider alternative medication"
* code.text = "Alternative Medikation in Erwägung ziehen"
* for = Reference(mii-exa-molgen-patient)
* reasonReference = Reference(mii-exa-molgen-therapeutische-implikation-1)
