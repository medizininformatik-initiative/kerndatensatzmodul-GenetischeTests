Extension: SD_MII_MolGen_EmpfohleneMassnahme
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/RecommendedAction
Id: sd-mii-modul-molgen-empfohlene-massnahme
Title: "SD MII MolGen Empfohlene Maßnahme"
Description: "Die Extension verweist auf eine vorgeschlagene Maßnahme, die auf der Grundlage der Ergebnisse des Befundberichts empfohlen wird."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme"
* value[x] only Reference(SD_MII_MolGen_Medikationsempfehlung)

Mapping: MolGen-EmpfohleneMassnahme
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_EmpfohleneMassnahme