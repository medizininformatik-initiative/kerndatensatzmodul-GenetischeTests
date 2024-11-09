Extension: MII_EX_MolGen_EmpfohleneMassnahme
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action
Id: mii-ex-molgen-empfohlene-massnahme
Title: "MII EX MolGen Empfohlene Maßnahme"
Description: "Die Extension verweist auf eine vorgeschlagene Maßnahme, die auf der Grundlage der Ergebnisse des Befundberichts empfohlen wird."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active

* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme"
//* ^status = #draft
* value[x] only Reference(MII_PR_MolGen_Medikationsempfehlung or MII_PR_MolGen_EmpfohleneFolgemassnahme)

Mapping: MolGen-EmpfohleneMassnahme
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_EX_MolGen_EmpfohleneMassnahme