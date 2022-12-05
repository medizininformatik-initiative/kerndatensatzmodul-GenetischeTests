Profile: MII_PR_MolGen_Mutationslast
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/tmb
Id: mii-pr-molgen-mutationslast
Title: "MII PR MolGen Mutationslast"
Description: "Dieses Profil beschreibt die Gesamtzahl der in der DNA von Krebszellen gefundenen Mutationen."
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mutationslast"
//* ^status = #draft
* status MS
* category MS
* code MS
* subject 1.. MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* encounter MS
* value[x] MS
* specimen MS
* component MS
* component[conclusion-string] MS

Mapping: MolGen-Mutationslast
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_Mutationslast
* valueQuantity -> "mide-dataelement-2012" "Mutationslast"

Instance: mii-exa-molgen-mutationslast-1
InstanceOf: mii-pr-molgen-mutationslast
Usage: #example
Title: "Beispiel Mutationslast in Tumorprobe"
Description: "Beispiel für Mutationslast in Tumorprobe."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/tmb"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = LNC#94076-7 "Mutations/Megabase [# Ratio] in Tumor"
* subject = Reference(mii-exa-molgen-patient)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* valueQuantity = 12 UCUM#1/1000000{Base} "Mutations/Megabase"
* specimen = Reference(mii-exa-molgen-specimen-1)