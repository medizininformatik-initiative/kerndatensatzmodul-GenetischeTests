Profile: MII_PR_MolGen_DiagnostischeImplikation
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication
Id: mii-pr-molgen-diagnostische-implikation
Title: "MII PR MolGen Diagnostische Implikation"
Description: "Dieses Profil beschreibt den Zusammenhang zwischen einem oder mehreren Genotyp/Haplotyp/Varianten und Beweisen für oder gegen eine bestimmte Krankheit."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"

* extension[workflow-relatedArtifact] MS
* category MS
* code MS
* subject MS 
* subject only Reference(Patient or Group)
* encounter MS
* derivedFrom MS
* derivedFrom[variant] only Reference(MII_PR_MolGen_Variante)
* component MS
* component[predicted-phenotype] MS
* component[conclusion-string] MS
* component[evidence-level] MS
* component[clinical-significance] MS
* component[mode-of-inheritance] MS

Mapping: MolGen-DiagnostischeImplikation
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_DiagnostischeImplikation
* component[evidence-level] -> "mide-dataelement-1720" "Clinical Annotation Level Of Evidence"
* component[clinical-significance] -> "mide-dataelement-2015" "Klinische Signifikanz"

Instance: mii-exa-molgen-diagnostische-implikation-1
InstanceOf: mii-pr-molgen-diagnostische-implikation
Usage: #example
Title: "BRAF Variante Diagnostische Implikation"
Description: "Beispiel für diagnostische Implikation abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#diagnostic-implication "Diagnostische Implikation"
* subject = Reference(mii-exa-molgen-patient)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-1)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis einer aktivierenden Mutation BRAF V600E"

Instance: mii-exa-molgen-diagnostische-implikation-2
InstanceOf: mii-pr-molgen-diagnostische-implikation
Usage: #example
Title: "NIPBL Variante Diagnostische Implikation"
Description: "Beispiel für diagnostische Implikation abgeleitet von genetischer Variante im NIPBL Gen an Hand von WGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication"
* extension[workflow-relatedArtifact].url = "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact"
* extension[workflow-relatedArtifact].valueRelatedArtifact.type = $RelArtType#citation "Citation"
* extension[workflow-relatedArtifact].valueRelatedArtifact.citation = "Richards et al., Genet Med. 2015; 17:405-24"
* extension[workflow-relatedArtifact].valueRelatedArtifact.url = "https://doi.org/10.1038/gim.2015.30"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#diagnostic-implication "Diagnostische Implikation"
* subject = Reference(mii-exa-molgen-patient-2)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-2)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis einer pathogenen Variante im NIPBL-Gen in heterozygoter Form."
* component[clinical-significance].code = $LNC#53037-8 "Genetic variation clinical significance [Imp]"
* component[clinical-significance].valueCodeableConcept = $LNC#LA6668-3 "Pathogenic"
* component[mode-of-inheritance].code = $GenTbd#condition-inheritance //CS updaten, wenn gen-reporting v2.0
* component[mode-of-inheritance].valueCodeableConcept = $HPO#HP:0000006 "Autosomal dominant inheritance"
* component[predicted-phenotype].code = $LNC#81259-4 "Associated phenotype"
* component[predicted-phenotype].valueCodeableConcept = $SCT#40354009 "De Lange syndrome (disorder)"


// CNV (17.pdf)
Instance: mii-exa-molgen-diagnostische-implikation-cnv-4
InstanceOf: mii-pr-molgen-diagnostische-implikation
Usage: #example
Title: "CNV SMO Diagnostische Implikation"
Description: "Beispiel für diagnostische Implikation abgeleitet von Copy Number Variante im SMO Gen."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication"
//* extension[workflow-relatedArtifact].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/workflow-relatedArtifact"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.type = $RelArtType#citation "Citation"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.citation = "Richards et al., Genet Med. 2015; 17:405-24"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/25741868/"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#diagnostic-implication "Diagnostische Implikation"
* subject = Reference(mii-exa-molgen-patient-2)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-cnv-4)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "onkogene Veränderung "
* component[clinical-significance].code = $LNC#53037-8 "Genetic variation clinical significance [Imp]"
* component[clinical-significance].valueCodeableConcept = $LNC#LA26332-9 "Likely pathogenic"

// 04 docx
Instance: mii-exa-molgen-diagnostische-implikation-brca1
InstanceOf: mii-pr-molgen-diagnostische-implikation
Usage: #example
Title: "Diagnostische Implikation BRCA1 Variante"
Description: "Beispiel für diagnostische Implikation abgeleitet von SNP im BRCA1."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication"
//* extension[workflow-relatedArtifact].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/workflow-relatedArtifact"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.type = $RelArtType#citation "Citation"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.citation = "Richards et al., Genet Med. 2015; 17:405-24"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/25741868/"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#diagnostic-implication "Diagnostische Implikation"
* subject = Reference(mii-exa-molgen-patient-brca1)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-brca1)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt"
* component[clinical-significance].code = $LNC#53037-8 "Genetic variation clinical significance [Imp]"
* component[clinical-significance].valueCodeableConcept = $LNC#LA6668-3 "Pathogenic"
* component[predicted-phenotype].valueCodeableConcept.coding[0] = $HPO#HP:0003002 "Breast carcinoma"
* component[predicted-phenotype].valueCodeableConcept.coding[+] = $HPO#HP:0100615 "Ovarian neoplasm"
* component[evidence-level].valueCodeableConcept = $ClinVarEvLv#2-star "2 star"
