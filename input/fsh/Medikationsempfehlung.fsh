Profile: SD_MII_MolGen_Medikationsempfehlung
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/task-med-chg
Id: sd-mii-modul-molgen-medikationsempfehlung
Title: "SD MII MolGen Medikationsempfehlung"
Description: "Das Profil dieser Task Ressource dient dazu, auf der Grundlage der genetischen Ergebnisse medikamanetöse Maßnahmen vorzuschlagen."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung"
* for MS 
* for only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* for only Reference(Patient)
* reasonReference only Reference(SD_MII_MolGen_TherapeutischeImplikation)

Mapping: MolGen-Medikationsempfehlung
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_Medikationsempfehlung
* -> "mide-dataelement-1724" "Empfehlungen (Therapie, Allg.)"