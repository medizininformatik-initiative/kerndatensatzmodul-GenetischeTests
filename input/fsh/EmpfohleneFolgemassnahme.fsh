Profile: MII_PR_MolGen_EmpfohleneFolgemassnahme
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation
Id: mii-pr-molgen-empfohlene-folgemassnahme
Title: "MII PR MolGen Empfohlene Folgemaßnahme"
Description: "Das Profil dieser Task Ressource beschreibt die empfohlenen Folgemaßnahmen."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme"

// MS elements with German translations
* status MS
* status ^short = "Status"
* status ^definition = "Status der empfohlenen Maßnahme"
* insert Translation(status ^short, de-DE, Status)
* insert Translation(status ^definition, de-DE, Status der empfohlenen Maßnahme)

* intent MS
* intent ^short = "Absicht"
* intent ^definition = "Die Absicht der Aufgabe wie z.B. Vorschlag"
* insert Translation(intent ^short, de-DE, Absicht)
* insert Translation(intent ^definition, de-DE, Die Absicht der Aufgabe wie z.B. Vorschlag)

* code MS
* code ^short = "Code"
* code ^definition = "Code der empfohlenen Maßnahme"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^definition, de-DE, Code der empfohlenen Maßnahme)

* for 1.. MS
* for only Reference(Patient)
* for ^short = "Patient"
* for ^definition = "Der Patient für den die Maßnahme empfohlen wird"
* insert Translation(for ^short, de-DE, Patient)
* insert Translation(for ^definition, de-DE, Der Patient für den die Maßnahme empfohlen wird)

* encounter MS
* encounter ^short = "Kontakt"
* encounter ^definition = "Der Kontakt in dessen Rahmen die Empfehlung ausgesprochen wurde"
* insert Translation(encounter ^short, de-DE, Kontakt)
* insert Translation(encounter ^definition, de-DE, Der Kontakt in dessen Rahmen die Empfehlung ausgesprochen wurde)

* reasonCode MS
* reasonCode ^short = "Begründung"
* reasonCode ^definition = "Kodierte Begründung für die Empfehlung"
* insert Translation(reasonCode ^short, de-DE, Begründung)
* insert Translation(reasonCode ^definition, de-DE, Kodierte Begründung für die Empfehlung)

* reasonReference MS
* reasonReference only Reference(MII_PR_MolGen_TherapeutischeImplikation)
* reasonReference ^short = "Referenz zur Begründung"
* reasonReference ^definition = "Referenz zur therapeutischen Implikation die diese Empfehlung begründet"
* insert Translation(reasonReference ^short, de-DE, Referenz zur Begründung)
* insert Translation(reasonReference ^definition, de-DE, Referenz zur therapeutischen Implikation die diese Empfehlung begründet)

Mapping: MolGen-EmpfohleneFolgemassnahme
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_EmpfohleneFolgemassnahme
* code -> "mide-dataelement-1724" "Empfehlungen (Therapie, Allg.)"
* code -> "mide-dataelement-1443" "Beratung"

Instance: mii-exa-molgen-folgemassnahme-1
InstanceOf: mii-pr-molgen-empfohlene-folgemassnahme
Usage: #example
Title: "BRAF Empfohlene Folgemaßnahme"
Description: "Beispiel für empfohlene Folgemaßnahme abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS."
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme)
* meta.profile[+] = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation|3.0.0"
* basedOn = Reference(servicerequest/example)
* status = TaskStatus#requested
* intent = $RequestIntent#proposal
* code = $LNC#LA14020-4 "Genetic counseling recommended"
* description = "Genetische Beratung empfohlen mit Dr. Rosalind Franklin"
* for = Reference(mii-exa-molgen-patient)
* reasonReference = Reference(mii-exa-molgen-therapeutische-implikation-1)

Instance: mii-exa-molgen-folgemassnahme-brca1
InstanceOf: mii-pr-molgen-empfohlene-folgemassnahme
Usage: #example
Title: "Empfohlene Folgemaßnahme bei BRCA1 Variante"
Description: "Beispiel für empfohlene Folgemaßnahme abgeleitet von genetischer Variante im BRCA1 Gen an Hand von NGS."
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme)
* meta.profile[+] = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation|3.0.0"
* basedOn = Reference(mii-exa-molgen-anforderung-trurisk-panel)
* status = TaskStatus#requested
* intent = $RequestIntent#proposal
* code = $LNC#LA14020-4 "Genetic counseling recommended"
* description = "Eine genetische Beratung hinsichtlich einer gezielten Testung leiblicher Familienmitglieder wird empfohlen."
* for = Reference(mii-exa-molgen-patient-brca1)