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

Instance: example-mii-molgen-diagnostische-implikation-1
InstanceOf: sd-mii-modul-molgen-diagnostische-implikation
Usage: #example
Title: "BRAF Variante Diagnostische Implikation"
Description: "Beispiel für diagnostische Implikation abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication"
* status = #final
* category = ObsCat#laboratory "Laboratory"
* code = GenTbd#diagnostic-implication "Diagnostische Implikation"
* subject = Reference(example-mii-molgen-patient)
* performer = Reference(example-mii-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(example-mii-molgen-variante-1)
* component[conclusion-string].code = GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis einer aktivierenden Mutation BRAF V600E"

Instance: example-mii-molgen-diagnostische-implikation-2
InstanceOf: sd-mii-modul-molgen-diagnostische-implikation
Usage: #example
Title: "NIPBL Variante Diagnostische Implikation"
Description: "Beispiel für diagnostische Implikation abgeleitet von genetischer Variante im NIPBL Gen an Hand von WGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication"
* status = #final
* category = ObsCat#laboratory "Laboratory"
* code = GenTbd#diagnostic-implication "Diagnostische Implikation"
* subject = Reference(example-mii-molgen-patient-2)
* performer = Reference(example-mii-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(example-mii-molgen-variante-2)
* component[conclusion-string].code = GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis einer pathogenen Variante im NIPBL-Gen in heterozygoter Form."
* component[clinical-significance].code = LNC#53037-8 "Genetic variation clinical significance [Imp]"
* component[clinical-significance].valueCodeableConcept = LNC#LA6668-3 "Pathogenic"
* component[mode-of-inheritance].code = GenTbd#condition-inheritance //CS updaten, wenn gen-reporting v2.0
* component[mode-of-inheritance].valueCodeableConcept = HPO#HP:0000006 "Autosomal dominant inheritance"
* component[associated-phenotype].code = LNC#81259-4 "Associated phenotype"
* component[associated-phenotype].valueCodeableConcept = SCT#40354009 "De Lange syndrome (disorder)"
