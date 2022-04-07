Profile: SD_MII_MolGen_Mutationslast
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/tmb
Id: sd-mii-modul-molgen-mutationslast
Title: "SD MII MolGen Mutationslast"
Description: "Dieses Profil beschreibt die Gesamtzahl der in der DNA von Krebszellen gefundenen Mutationen."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mutationslast"
* ^status = #draft
* subject MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)

Mapping: MolGen-Mutationslast
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_Mutationslast
* valueQuantity -> "mide-dataelement-2012" "Mutationslast"

Instance: example-mii-molgen-mutationslast-1
InstanceOf: sd-mii-modul-molgen-mutationslast
Usage: #example
Title: "Beispiel Mutationslast in Tumorprobe"
Description: "Beispiel für Mutationslast in Tumorprobe."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/tmb"
* status = #final
* category = ObsCat#laboratory "Laboratory"
* code = LNC#94076-7 "Mutations/Megabase [# Ratio] in Tumor"
* subject = Reference(example-mii-molgen-patient)
* performer = Reference(example-mii-molgen-practitioner-lab)
* valueQuantity = 12 UCUM#1/1000000{Base} "Mutations/Megabase"
* specimen = Reference(example-mii-molgen-specimen)