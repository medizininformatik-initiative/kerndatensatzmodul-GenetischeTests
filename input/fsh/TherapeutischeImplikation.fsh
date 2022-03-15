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