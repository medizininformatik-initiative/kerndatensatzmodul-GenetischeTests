Profile: SD_MII_MolGen_Genotyp
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype
Id: sd-mii-molgen-genotyp
Title: "SD MII MolGen Genotyp"
Description: "Dieses Profil beschreibt die Feststellung eines bestimmten Genotyps auf der Grundlage einer oder mehrerer Varianten oder Haplotypen."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp"
* ^status = #draft
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)

Mapping: MolGen-Genotyp
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_Genotyp
* component[gene-studied] -> "mide-dataelement-1400" "Getestete Gene ID"
* component[cytogenetic-location] -> "mide-dataelement-1434" "Zytogenetische Lokalisierung (Lokus)"
* component[reference-sequence-assembly] -> "mide-dataelement-1788" "Referenzgenom"

Instance: example-mii-molgen-genotyp-1
InstanceOf: sd-mii-molgen-genotyp
Usage: #example
Title: "Genotyp BRAF"
Description: "Beispiel für Genotyp BRAF Gen."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype"
* status = #final
* category = ObsCat#laboratory "Laboratory"
* code = LNC#84413-4 "Genotype display name"
* subject = Reference(example-mii-molgen-patient)
* valueCodeableConcept.text = "BRAF rs113488022 T>A"
* method = LNC#LA26398-0 "Sequencing"
* specimen = Reference(example-mii-molgen-specimen-1)
* device = Reference(example-mii-molgen-device-sequencer)
* derivedFrom = Reference(example-mii-molgen-variante-1)
* component[gene-studied].code = LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = HGNC#HGNC:1097 "BRAF"
* component[cytogenetic-location].code = LNC#48001-2 "Cytogenetic (chromosome) location"
* component[cytogenetic-location].valueCodeableConcept = ChromLoc#7q34

//Instance: example-mii-molgen-genotyp-2
//InstanceOf: sd-mii-molgen-genotyp
//Usage: #example
//Title: "Genotyp NIPBL"
//Description: "Beispiel für Genotyp NIPBL Gen."
//* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype"
//* status = #final
//* category = ObsCat#laboratory "Laboratory"
//* code = LNC#84413-4 "Genotype display name"
//* subject = Reference(example-mii-molgen-patient-2)
//* valueCodeableConcept.text = "NIPBL Variante c.2207del p.(Pro736Glnfs*58) (heterozygot)"
//* method = LNC#LA26398-0 "Sequencing"
//* specimen = Reference(example-mii-molgen-specimen)
//* device = Reference(example-mii-molgen-device-sequencer-2)
//* derivedFrom = Reference(example-mii-molgen-variante-2)
//* component[gene-studied].code = LNC#48018-6 "Gene studied [ID]"
//* component[gene-studied].valueCodeableConcept = HGNC#HGNC:28862 "NIPBL"
//* component[CytogenicLocation].code = LNC#48001-2 "Cytogenetic (chromosome) location"
//* component[CytogenicLocation].valueCodeableConcept = ChromLoc#7q34