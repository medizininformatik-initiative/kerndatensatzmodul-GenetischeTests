Profile: SD_MII_MolGen_EmpfohleneFolgemassnahme
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/task-rec-followup
Id: sd-mii-modul-molgen-empfohlene-folgemassnahme
Title: "SD MII MolGen Empfohlene Folgemaßnahme"
Description: "Das Profil dieser Task Ressource beschreibt die empfohlenen Folgemaßnahmen."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme"
* ^status = #draft
* for MS 
* for only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* for only Reference(Patient)
* reasonReference only Reference(SD_MII_MolGen_TherapeutischeImplikation)

Mapping: MolGen-EmpfohleneFolgemassnahme
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_EmpfohleneFolgemassnahme
* code -> "mide-dataelement-1724" "Empfehlungen (Therapie, Allg.)"
* code -> "mide-dataelement-1443" "Beratung"