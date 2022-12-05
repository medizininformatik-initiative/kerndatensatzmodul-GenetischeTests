Profile: MII_PR_MolGen_PolygenerRisikoScore
Parent: RiskAssessment
Id: mii-pr-molgen-polygener-risiko-score
Title: "MII PR MolGen Polygener Risiko Score"
Description: "Profil für Polygenen Risiko Score"
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score"
//* ^status = #draft
* identifier MS
* status MS
* code MS //Neoplasm Polygenic Risk Score (Code C158975) NCIt
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* subject MS
* encounter MS
* occurrence[x] MS
* condition MS
* basis MS
* prediction MS
  * extension contains mii-ex-molgen-risk-assessment-einflussfaktor named whenCodeableConcept 0..1 MS
  * outcome MS
  * probability[x] MS
  * qualitativeRisk MS
  * relativeRisk MS
  * when[x] MS

Extension: MII_EX_MolGen_RiskAssessment_Einflussfaktor
Id: mii-ex-molgen-risk-assessment-einflussfaktor
Title: "MII EX MolGen RiskAssessment Einflussfaktor"
Description: "Die Extension erweitert RiskAssessment.prediction um die Möglichkeit, weitere ausschlaggebende Faktoren mit Einfluss auf die Risikoberechnung anzugeben."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor"
* ^status = #draft
* ^context[0].type = #element
* ^context[=].expression = "RiskAssessment.prediction"
* value[x] only CodeableConcept

Instance: mii-exa-molgen-prs-brca1
InstanceOf: mii-pr-molgen-polygener-risiko-score
Usage: #example
Title: "Polygener Risiko Score BRCA1 Variante"
Description: "Beispiel für Polygenen Risiko Score bei Variante BRCA1"
* status = #final
* subject = Reference(mii-exa-molgen-patient-2)
* occurrenceDateTime = "2022-11-01"
* basis = Reference(mii-exa-molgen-variante-brca1)
* prediction.outcome = SCT#718220008 "Hereditary breast and ovarian cancer syndrome (disorder)"
* prediction.qualitativeRisk = RiskProbability#high "High likelihood"
* prediction.extension[whenCodeableConcept].valueCodeableConcept = SCT#414152003 "European (ethnic group)"
* prediction.extension[whenCodeableConcept].valueCodeableConcept.text = "Der verwendete Polygene Risikoscore wurde bisher nur für die europäische Bevölkerung bei Brustkrebs validiert und kann daher noch nicht auf andere Ethnizitäten und andere Tumor-Erkrankungen übertragen werden."

