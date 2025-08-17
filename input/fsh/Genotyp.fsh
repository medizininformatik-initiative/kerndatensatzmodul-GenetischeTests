Profile: MII_PR_MolGen_Genotyp
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype
Id: mii-pr-molgen-genotyp
Title: "MII PR MolGen Genotyp"
Description: "Dieses Profil beschreibt die Feststellung eines bestimmten Genotyps auf der Grundlage einer oder mehrerer Varianten oder Haplotypen."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp"

* status MS
* category MS
* code MS
* subject 1.. MS
* subject only Reference(Patient or Group)
* encounter MS
* value[x] MS
* derivedFrom MS
* component MS
* component[conclusion-string] MS
* component[gene-studied] MS
* component[cytogenetic-location] MS
* component[reference-sequence-assembly] MS

Mapping: MolGen-Genotyp
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_Genotyp
* component[gene-studied] -> "mide-dataelement-1400" "Getestete Gene ID"
* component[cytogenetic-location] -> "mide-dataelement-1434" "Zytogenetische Lokalisierung (Lokus)"
* component[reference-sequence-assembly] -> "mide-dataelement-1788" "Referenzgenom"

Instance: mii-exa-molgen-genotyp-1
InstanceOf: mii-pr-molgen-genotyp
Usage: #example
Title: "Genotyp BRAF"
Description: "Beispiel für Genotyp BRAF Gen."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#84413-4 "Genotype display name"
* subject = Reference(mii-exa-molgen-patient)
* valueCodeableConcept.text = "BRAF rs113488022 T>A"
* method = $LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-1)
* device = Reference(mii-exa-molgen-device-sequencer)
* derivedFrom = Reference(mii-exa-molgen-variante-1)
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:1097 "BRAF"
* component[cytogenetic-location].code = $LNC#48001-2 "Cytogenetic (chromosome) location"
* component[cytogenetic-location].valueCodeableConcept = $ChromLoc#7q34

Instance: mii-exa-molgen-genotyp-2
InstanceOf: mii-pr-molgen-genotyp
Usage: #example
Title: "Genotyp NIPBL"
Description: "Beispiel für Genotyp NIPBL Gen."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#84413-4 "Genotype display name"
* subject = Reference(mii-exa-molgen-patient-2)
* valueCodeableConcept.text = "NIPBL Variante c.2207del p.(Pro736Glnfs*58) (heterozygot)"
* method = $LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-2)
* device = Reference(mii-exa-molgen-device-sequencer-2)
* derivedFrom = Reference(mii-exa-molgen-variante-2)
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:28862 "NIPBL"
* component[cytogenetic-location].code = $LNC#48001-2 "Cytogenetic (chromosome) location"
* component[cytogenetic-location].valueCodeableConcept = $ChromLoc#7q34

Instance: mii-exa-molgen-genotyp-brca1
InstanceOf: mii-pr-molgen-genotyp
Usage: #example
Title: "Genotyp BRCA1"
Description: "Beispiel für Genotyp BRCA1 Gen."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#84413-4 "Genotype display name"
* subject = Reference(mii-exa-molgen-patient-brca1)
* valueCodeableConcept.text = "BRCA1, c.5266dup, p.(Gln1756Profs*74)"
* method = $LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-brca1)
* device = Reference(mii-exa-molgen-device-sequencer-nextseq)
* derivedFrom = Reference(mii-exa-molgen-variante-brca1)
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:1100 "BRCA1"
* component[cytogenetic-location].code = $LNC#48001-2 "Cytogenetic (chromosome) location"
* component[cytogenetic-location].valueCodeableConcept = $ChromLoc#17q21.31