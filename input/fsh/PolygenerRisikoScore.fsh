Profile: MII_PR_MolGen_PolygenerRisikoScore
Parent: RiskAssessment
Id: mii-pr-molgen-polygener-risiko-score
Title: "MII PR MolGen Polygener Risiko Score"
Description: "Profil für Polygenen Risiko Score"
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score"
//* ^status = #draft

// MS elements with German translations
* identifier MS
* identifier ^short = "Identifikator"
* identifier ^definition = "Eindeutiger Identifikator für die Risikobewertung"
* insert Translation(identifier ^short, de-DE, Identifikator)
* insert Translation(identifier ^definition, de-DE, Eindeutiger Identifikator für die Risikobewertung)

* status MS
* status ^short = "Status"
* status ^definition = "Status der Risikobewertung"
* insert Translation(status ^short, de-DE, Status)
* insert Translation(status ^definition, de-DE, Status der Risikobewertung)

* code MS //Neoplasm Polygenic Risk Score (Code C158975) NCIt
* code ^short = "Code"
* code ^definition = "Art der Risikobewertung"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^definition, de-DE, Art der Risikobewertung)

* subject only Reference(Patient or Group)
* subject MS
* subject ^short = "Patient"
* subject ^definition = "Der Patient für den die Risikobewertung erstellt wurde"
* insert Translation(subject ^short, de-DE, Patient)
* insert Translation(subject ^definition, de-DE, Der Patient für den die Risikobewertung erstellt wurde)

* encounter MS
* encounter ^short = "Kontakt"
* encounter ^definition = "Der Kontakt in dessen Rahmen die Risikobewertung erstellt wurde"
* insert Translation(encounter ^short, de-DE, Kontakt)
* insert Translation(encounter ^definition, de-DE, Der Kontakt in dessen Rahmen die Risikobewertung erstellt wurde)

* occurrence[x] MS
* occurrence[x] ^short = "Zeitpunkt"
* occurrence[x] ^definition = "Zeitpunkt oder Zeitraum der Risikobewertung"
* insert Translation(occurrence[x] ^short, de-DE, Zeitpunkt)
* insert Translation(occurrence[x] ^definition, de-DE, Zeitpunkt oder Zeitraum der Risikobewertung)

* condition MS
* condition ^short = "Erkrankung"
* condition ^definition = "Die Erkrankung für die das Risiko bewertet wird"
* insert Translation(condition ^short, de-DE, Erkrankung)
* insert Translation(condition ^definition, de-DE, Die Erkrankung für die das Risiko bewertet wird)

* basis MS
* basis ^short = "Grundlage"
* basis ^definition = "Die Grundlagen auf denen die Risikobewertung basiert wie z.B. genetische Varianten"
* insert Translation(basis ^short, de-DE, Grundlage)
* insert Translation(basis ^definition, de-DE, Die Grundlagen auf denen die Risikobewertung basiert wie z.B. genetische Varianten)

* prediction MS
* prediction ^short = "Vorhersage"
* prediction ^definition = "Die vorhergesagten Risiken"
* insert Translation(prediction ^short, de-DE, Vorhersage)
* insert Translation(prediction ^definition, de-DE, Die vorhergesagten Risiken)
* prediction.extension contains mii-ex-molgen-risk-assessment-einflussfaktor named whenCodeableConcept 0..1 MS
* prediction.extension[whenCodeableConcept] ^short = "Einflussfaktor"
* prediction.extension[whenCodeableConcept] ^definition = "Zusätzlicher Einflussfaktor für die Risikoberechnung"
* insert Translation(prediction.extension[whenCodeableConcept] ^short, de-DE, Einflussfaktor)
* insert Translation(prediction.extension[whenCodeableConcept] ^definition, de-DE, Zusätzlicher Einflussfaktor für die Risikoberechnung)

* prediction.outcome MS
* prediction.outcome ^short = "Ergebnis"
* prediction.outcome ^definition = "Das vorhergesagte Ergebnis oder die Erkrankung"
* insert Translation(prediction.outcome ^short, de-DE, Ergebnis)
* insert Translation(prediction.outcome ^definition, de-DE, Das vorhergesagte Ergebnis oder die Erkrankung)

* prediction.probability[x] MS
* prediction.probability[x] ^short = "Wahrscheinlichkeit"
* prediction.probability[x] ^definition = "Die quantitative Wahrscheinlichkeit des Risikos"
* insert Translation(prediction.probability[x] ^short, de-DE, Wahrscheinlichkeit)
* insert Translation(prediction.probability[x] ^definition, de-DE, Die quantitative Wahrscheinlichkeit des Risikos)

* prediction.qualitativeRisk MS
* prediction.qualitativeRisk ^short = "Qualitatives Risiko"
* prediction.qualitativeRisk ^definition = "Die qualitative Einschätzung des Risikos wie z.B. hoch oder niedrig"
* insert Translation(prediction.qualitativeRisk ^short, de-DE, Qualitatives Risiko)
* insert Translation(prediction.qualitativeRisk ^definition, de-DE, Die qualitative Einschätzung des Risikos wie z.B. hoch oder niedrig)

* prediction.relativeRisk MS
* prediction.relativeRisk ^short = "Relatives Risiko"
* prediction.relativeRisk ^definition = "Das relative Risiko im Vergleich zur Normalbevölkerung"
* insert Translation(prediction.relativeRisk ^short, de-DE, Relatives Risiko)
* insert Translation(prediction.relativeRisk ^definition, de-DE, Das relative Risiko im Vergleich zur Normalbevölkerung)

* prediction.when[x] MS
* prediction.when[x] ^short = "Zeitrahmen"
* prediction.when[x] ^definition = "Der Zeitrahmen für den die Vorhersage gilt"
* insert Translation(prediction.when[x] ^short, de-DE, Zeitrahmen)
* insert Translation(prediction.when[x] ^definition, de-DE, Der Zeitrahmen für den die Vorhersage gilt)

Extension: MII_EX_MolGen_RiskAssessment_Einflussfaktor
Id: mii-ex-molgen-risk-assessment-einflussfaktor
Title: "MII EX MolGen RiskAssessment Einflussfaktor"
Description: "Die Extension erweitert RiskAssessment.prediction um die Möglichkeit, weitere ausschlaggebende Faktoren mit Einfluss auf die Risikoberechnung anzugeben."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor"
//* ^status = #draft
* ^context[0].type = #element
* ^context[=].expression = "RiskAssessment.prediction"
* value[x] only CodeableConcept

Instance: mii-exa-molgen-prs-brca1
InstanceOf: mii-pr-molgen-polygener-risiko-score
Usage: #example
Title: "Polygener Risiko Score BRCA1 Variante"
Description: "Beispiel für Polygenen Risiko Score bei Variante BRCA1"
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score)
* status = #final
* subject = Reference(mii-exa-molgen-patient-2)
* occurrenceDateTime = "2022-11-01"
* basis = Reference(mii-exa-molgen-variante-brca1)
* prediction.outcome = $SCT#718220008 "Hereditary breast and ovarian cancer syndrome (disorder)"
* prediction.qualitativeRisk = RiskProbability#high "High likelihood"
* prediction.extension[whenCodeableConcept].valueCodeableConcept = $SCT#414152003 "European (ethnic group)"
* prediction.extension[whenCodeableConcept].valueCodeableConcept.text = "Der verwendete Polygene Risikoscore wurde bisher nur für die europäische Bevölkerung bei Brustkrebs validiert."

