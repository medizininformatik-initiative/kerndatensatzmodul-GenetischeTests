Profile: MII_PR_MolGen_Medikationsempfehlung
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/medication-recommendation
Id: mii-pr-molgen-medikationsempfehlung
Title: "MII PR MolGen Medikationsempfehlung"
Description: "Das Profil dieser Task Ressource dient dazu, auf der Grundlage der genetischen Ergebnisse medikamanetöse Maßnahmen vorzuschlagen."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung"

// MS elements with German translations
* status MS
* status ^short = "Status"
* status ^definition = "Status der Medikationsempfehlung"
* insert Translation(status ^short, de-DE, Status)
* insert Translation(status ^definition, de-DE, Status der Medikationsempfehlung)

* intent MS
* intent ^short = "Absicht"
* intent ^definition = "Die Absicht der Aufgabe wie z.B. Vorschlag"
* insert Translation(intent ^short, de-DE, Absicht)
* insert Translation(intent ^definition, de-DE, Die Absicht der Aufgabe wie z.B. Vorschlag)

* code 1.. MS
* code ^short = "Code"
* code ^definition = "Code der Medikationsempfehlung"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^definition, de-DE, Code der Medikationsempfehlung)

* for 1.. MS
* for only Reference(Patient)
* for ^short = "Patient"
* for ^definition = "Der Patient für den die Medikation empfohlen wird"
* insert Translation(for ^short, de-DE, Patient)
* insert Translation(for ^definition, de-DE, Der Patient für den die Medikation empfohlen wird)

* encounter MS
* encounter ^short = "Kontakt"
* encounter ^definition = "Der Kontakt in dessen Rahmen die Empfehlung ausgesprochen wurde"
* insert Translation(encounter ^short, de-DE, Kontakt)
* insert Translation(encounter ^definition, de-DE, Der Kontakt in dessen Rahmen die Empfehlung ausgesprochen wurde)

* reasonCode MS
* reasonCode ^short = "Begründung"
* reasonCode ^definition = "Kodierte Begründung für die Medikationsempfehlung"
* insert Translation(reasonCode ^short, de-DE, Begründung)
* insert Translation(reasonCode ^definition, de-DE, Kodierte Begründung für die Medikationsempfehlung)

* reasonReference MS
* reasonReference only Reference(MII_PR_MolGen_TherapeutischeImplikation)
* reasonReference ^short = "Referenz zur Begründung"
* reasonReference ^definition = "Referenz zur therapeutischen Implikation die diese Empfehlung begründet"
* insert Translation(reasonReference ^short, de-DE, Referenz zur Begründung)
* insert Translation(reasonReference ^definition, de-DE, Referenz zur therapeutischen Implikation die diese Empfehlung begründet)

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
* intent = $RequestIntent#proposal
* code = $LNC#LA26421-0 "Consider alternative medication"
* code.text = "Alternative Medikation in Erwägung ziehen"
* for = Reference(mii-exa-molgen-patient)
* reasonReference = Reference(mii-exa-molgen-therapeutische-implikation-1)
