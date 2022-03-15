Profile: SD_MII_MolGen_EmpfohleneFolgemassnahme
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/task-rec-followup
Id: sd-mii-modul-molgen-empfohlene-folgemassnahme
Title: "SD MII MolGen Empfohlene Folgemaßnahme"
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