Profile: SD_MII_MolGen_DiagnostischeImplikation
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication
Id: sd-mii-modul-molgen-diagnostische-implikation
Title: "SD MII MolGen Diagnostische Implikation"
Description: "Dieses Profil beschreibt den Zusammenhang zwischen einem oder mehreren Genotyp/Haplotyp/Varianten und Beweisen für oder gegen eine bestimmte Krankheit."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"
* ^status = #draft
* subject MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* derivedFrom[variant] only Reference(SD_MII_MolGen_Variante)
* component[evidence-level] MS
* component[clinical-significance] MS

Mapping: MolGen-DiagnostischeImplikation
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_DiagnostischeImplikation
* component[evidence-level] -> "mide-dataelement-1720" "Clinical Annotation Level Of Evidence"
* component[clinical-significance] -> "mide-dataelement-2015" "Klinische Signifikanz"