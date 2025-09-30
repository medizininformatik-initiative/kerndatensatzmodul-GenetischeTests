Profile: MII_PR_MolGen_MolekularerBiomarker
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-biomarker
Id: mii-pr-molgen-molekularer-biomarker
Title: "MII PR MolGen Molekulare Biomarker"
Description: "Dieses Profil beschreibt molekulare Biomarker, z.B. genübergreifende Biomarker wie Tumormutationslast (TMB) oder Mikrosatelliteninstabilität (MSI). Es ist ein abstraktes Profil, konkrete Biomarker-Profile erben davon."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekularer-biomarker"

* category MS
* code MS
* subject MS 
* subject only Reference(Patient or Group)
* encounter MS
* derivedFrom MS
* derivedFrom[variant] only Reference(MII_PR_MolGen_Variante)
* component MS
* component[gene-studied] MS
* component[biomarker-category] MS

/*Mapping: MolGen-MolekulareKonsequenz
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_MolekulareKonsequenz
* component[evidence-level] -> "mide-dataelement-1720" "Clinical Annotation Level Of Evidence"
* component[clinical-significance] -> "mide-dataelement-2015" "Klinische Signifikanz"
*/
