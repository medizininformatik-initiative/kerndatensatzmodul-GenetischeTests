Profile: SD_MII_MolGen_TherapeutischeImplikation
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication
Id: sd-mii-modul-molgen-therapeutische-implikation
Title: "SD MII MolGen Therapeutische Implikation"
Description: "Dieses Profil beschreibt den möglichen Einfluss genetischer Merkmale auf eine medikamentöse oder nicht-medikamentöse Therapie."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation"
* ^status = #draft
* subject MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* derivedFrom[variant] only Reference(SD_MII_MolGen_Variante)
* component[evidence-level] MS

Mapping: MolGen-TherapeutischeImplikation
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_TherapeutischeImplikation
* -> "mide-dataelement-1724" "Empfehlungen (Therapie, Allg.)"
* component[evidence-level] -> "mide-dataelement-1720" "Clinical Annotation Level Of Evidence"

Instance: example-mii-molgen-therapeutische-implikation-1
InstanceOf: sd-mii-modul-molgen-therapeutische-implikation
Usage: #example
Title: "BRAF Variante Therapeutische Implikation"
Description: "Beispiel für therapeutische Implikation abgeleitet von genetische Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication"
* status = #final
* category = ObsCat#laboratory "Laboratory"
* code = GenTbd#therapeutic-implication
* subject = Reference(Patient/example)
* performer = Reference(Practitioner/example)
* derivedFrom[variant] = Reference(example-mii-molgen-variante-1)
* component[conclusion-string].code = GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis einer aktivierenden Mutation BRAF V600E. Triple-Therapie mit einem EGFR-Antikörper sowie einem BRAF- und einem MEK- Inhibitor prüfen."
* component[medication-assessed][+].code = LNC#51963-7 "Medication assessed [ID]"
* component[medication-assessed][=].valueCodeableConcept = ATC#L01EC "B-Raf serine-threonine kinase (BRAF) inhibitors"
* component[medication-assessed][+].code = LNC#51963-7 "Medication assessed [ID]"
* component[medication-assessed][=].valueCodeableConcept = ATC#L01FE "EGFR (Epidermal Growth Factor Receptor) inhibitors"
* component[medication-assessed][+].code = LNC#51963-7 "Medication assessed [ID]"
* component[medication-assessed][=].valueCodeableConcept = ATC#L01EE "Mitogen-activated protein kinase (MEK) inhibitors"