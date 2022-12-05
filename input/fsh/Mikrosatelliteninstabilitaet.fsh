Profile: MII_PR_MolGen_Mikrosatelliteninstabilitaet
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/msi
Id: mii-pr-molgen-mikrosatelliteninstabilitaet
Title: "MII PR MolGen Mikrosatelliteninstabilität"
Description: "Mikrosatelliteninstabilität (MSI) ist ein Zustand genetischer Hypermutabilität (Neigung zu Mutationen), der aus einer gestörten DNA-Mismatch-Reparatur (MMR) resultiert."
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mikrosatelliteninstabilitaet"
//* ^status = #draft
* status MS
* category MS
* code MS
* subject 1.. MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* encounter MS
* value[x] MS
* component[conclusion-string] MS

Mapping: MolGen-Mikrosatelliteninstabilitaet
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_Mikrosatelliteninstabilitaet
* valueCodeableConcept -> "mide-dataelement-2013" "Mikrosatelliteninstabilität"

Instance: mii-exa-molgen-mikrosatelliteninstabilitaet-1
InstanceOf: mii-pr-molgen-mikrosatelliteninstabilitaet
Usage: #example
Title: "Mikrosatelliteninstabilität"
Description: "Beispiel für Mikrosatelliteninstabilität in Tumorprobe."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/msi"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = LNC#81695-9 "Microsatellite instability [Interpretation] in Cancer specimen Qualitative"
* subject = Reference(mii-exa-molgen-patient)
* valueCodeableConcept = LNC#LA14122-8 "Stable"
* specimen = Reference(mii-exa-molgen-specimen-1)
* component[conclusion-string].code = GenTbd#conclusion-string
* component[conclusion-string].valueString = "Tumor weist ein mikrosatellitenstabiles Wachstum auf."