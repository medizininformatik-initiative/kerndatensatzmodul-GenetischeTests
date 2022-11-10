Profile: MII_PR_MolGen_TherapeutischeImplikation
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication
Id: mii-pr-molgen-therapeutische-implikation
Title: "MII PR MolGen Therapeutische Implikation"
Description: "Dieses Profil beschreibt den möglichen Einfluss genetischer Merkmale auf eine medikamentöse oder nicht-medikamentöse Therapie."
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation"
* ^status = #draft
* status MS
* category MS
* code MS
* subject 1.. MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* encounter MS
* derivedFrom MS
* derivedFrom[variant] MS
* derivedFrom[variant] only Reference(MII_PR_MolGen_Variante)
* component MS
* component[conclusion-string] MS
* component[prognosis] MS
* component[evidence-level] MS
* component[phenotypic-treatment-context] MS
* component[medication-assessed] MS
* component[therapy-assessed] MS
* component[predicted-therapeutic-implication] MS

Mapping: MolGen-TherapeutischeImplikation
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_TherapeutischeImplikation
* -> "mide-dataelement-1724" "Empfehlungen (Therapie, Allg.)"
* component[evidence-level] -> "mide-dataelement-1720" "Clinical Annotation Level Of Evidence"

Instance: mii-exa-molgen-therapeutische-implikation-1
InstanceOf: mii-pr-molgen-therapeutische-implikation
Usage: #example
Title: "BRAF Variante Therapeutische Implikation"
Description: "Beispiel für therapeutische Implikation abgeleitet von genetische Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = GenTbd#therapeutic-implication "Therapeutische Implikation"
* subject = Reference(mii-exa-molgen-patient)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-1)
* component[conclusion-string].code = GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis einer aktivierenden Mutation BRAF V600E. Triple-Therapie mit einem EGFR-Antikörper sowie einem BRAF- und einem MEK- Inhibitor prüfen."
* component[medication-assessed][+].code = LNC#51963-7 "Medication assessed [ID]"
* component[medication-assessed][=].valueCodeableConcept.coding[0] = ATC#L01EC "B-Raf serine-threonine kinase (BRAF) inhibitors"
* component[medication-assessed][=].valueCodeableConcept.coding[1] = SCT#703645005 "Product containing B-Raf inhibitor (product)"
* component[medication-assessed][=].valueCodeableConcept.text = "BRAF Inhibitor"
* component[medication-assessed][+].code = LNC#51963-7 "Medication assessed [ID]"
* component[medication-assessed][=].valueCodeableConcept.coding[0] = ATC#L01FE "EGFR (Epidermal Growth Factor Receptor) inhibitors"
* component[medication-assessed][+].code = LNC#51963-7 "Medication assessed [ID]"
* component[medication-assessed][=].valueCodeableConcept = ATC#L01EE "Mitogen-activated protein kinase (MEK) inhibitors"