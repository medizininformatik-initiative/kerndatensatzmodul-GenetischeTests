Profile: MII_PR_MolGen_GenomicStudy
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study
Id: mii-pr-molgen-genomic-study
Title: "MII PR MolGen Genomic Study "
Description: "Genomic Study ist ein Profil, dass die Durchführung von übergeorndenten molekulargenetischen Untersuchungen (Studies) beschreibt. Einzelne Assays werden dann als GenomicStudyAnalysis abgebildet. Es ist vom GenomicStudy-Profils aus dem Genomics Reporting IG abgeleitet ."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active

//* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"

Mapping: MolGen-GenomicStudy
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_GenomicStudy

Instance: mii-exa-molgen-genomic-study-1
InstanceOf: mii-pr-molgen-genomic-study
Title: "Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom"
Description: "Beispiel für molekulargenetischen Befund BRAF mutiert bei colorektalem Adenokarzniom."
* status = #completed
* subject = Reference(mii-exa-molgen-patient)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(mii-exa-molgen-genomic-study-analysis-braf)

Instance: mii-exa-molgen-genomic-study-analysis-braf
InstanceOf: mii-pr-molgen-genomic-study-analysis
Title: "Genomic Study Analysis BRAF"
Description: "Analyse der BRAF Region mittels NGS"
* status = #completed
* subject = Reference(mii-exa-molgen-patient)
* extension[specimen].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen"
* extension[specimen].valueReference = Reference(mii-exa-molgen-specimen-1)
* extension[device].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device"
* extension[device].extension[device].url = "device"
* extension[device].extension[device].valueReference = Reference(mii-exa-molgen-device-sequencer)
* extension[method-type].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type"
* extension[method-type].valueCodeableConcept = $LNC#LA26398-0 "Sequencing"
* extension[regions].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions"
* extension[regions].extension[description].url = "description"
* extension[regions].extension[description].valueString = "BRAF: Exon 15 (Codon 600)"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:1097 "BRAF"

Instance: mii-exa-molgen-genomic-study-trurisk-panel
InstanceOf: mii-pr-molgen-genomic-study
Title: "Genomic Study TruRisk Panel v3"
Description: "Genomische Studie für TruRisk Panel v3"
* status = #completed
* subject = Reference(mii-exa-molgen-patient-brca1)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(mii-exa-molgen-genomic-study-analysis-trurisk-panel)

Instance: mii-exa-molgen-genomic-study-analysis-trurisk-panel
InstanceOf: mii-pr-molgen-genomic-study-analysis
Title: "Genomic Study Analysis TruRisk Panel v3"
Description: "NGS-Analyse des TruRisk Panel v3 für erblichen Brust- und Eierstockkrebs"
* status = #completed
* subject = Reference(mii-exa-molgen-patient-brca1)
* extension[specimen].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen"
* extension[specimen].valueReference = Reference(mii-exa-molgen-specimen-brca1)
* extension[device].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device"
* extension[device].extension[device].url = "device"
* extension[device].extension[device].valueReference = Reference(mii-exa-molgen-device-sequencer-nextseq)
* extension[method-type].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type"
* extension[method-type].valueCodeableConcept = $LNC#LA26398-0 "Sequencing"
* extension[regions].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions"
* extension[regions].extension[description].url = "description"
* extension[regions].extension[description].valueString = "TruRisk Panel v3: Alle kodierenden Exons der Core-Gene für erblichen Brust- und Eierstockkrebs"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:795 "ATM"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:1100 "BRCA1"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:952 "BARD1"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:1101 "BRCA2"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:1190 "BRIP1"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:1748 "CDH1"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:16627 "CHEK2"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:7127 "MLH1"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:7325 "MSH2"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:7329 "MSH6"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:26144 "PALB2"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:9122 "PMS2"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:9588 "PTEN"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:9820 "RAD51C"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:9823 "RAD51D"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:11998 "TP53"

Instance: mii-exa-molgen-genomic-study-cornelia-de-lange
InstanceOf: mii-pr-molgen-genomic-study
Title: "Genomic Study Cornelia de Lange Panel"
Description: "Genomische Studie für Cornelia de Lange-Syndrom Panel"
* status = #completed
* subject = Reference(mii-exa-molgen-patient-2)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(mii-exa-molgen-genomic-study-analysis-cornelia-de-lange)

Instance: mii-exa-molgen-genomic-study-analysis-cornelia-de-lange
InstanceOf: mii-pr-molgen-genomic-study-analysis
Title: "Genomic Study Analysis Cornelia de Lange Panel"
Description: "NGS-Analyse des Cornelia de Lange-Syndrom Panels"
* status = #completed
* subject = Reference(mii-exa-molgen-patient-2)
* extension[specimen].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen"
* extension[specimen].valueReference = Reference(mii-exa-molgen-specimen-2)
* extension[device].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device"
* extension[device].extension[device].url = "device"
* extension[device].extension[device].valueReference = Reference(mii-exa-molgen-device-sequencer-2)
* extension[method-type].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type"
* extension[method-type].valueCodeableConcept = $LNC#LA26398-0 "Sequencing"
* extension[regions].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions"
* extension[regions].extension[description].url = "description"
* extension[regions].extension[description].valueString = "Cornelia de Lange Panel: Alle kodierenden Exons der Gene NIPBL, HDAC8, RAD21, SMC1A, SMC3, TP63"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:28862 "NIPBL"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:13608 "HDAC8"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:9811 "RAD21"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:11111 "SMC1A"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:2468 "SMC3"
* extension[regions].extension[studied][+].url = "studied"
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:15979 "TP63"

Profile: MII_PR_MolGen_GenomicStudyAnalysis
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis
Id: mii-pr-molgen-genomic-study-analysis
Title: "MII PR MolGen Genomic Study Analysis"
Description: "Genomic Study Analysis ist ein Profil, das die Durchführung von konkreten molekulargenetischen Methoden und Assays beschreibt. Es ist vom GenomicStudyAnalysis-Profil aus dem Genomics Reporting IG abgeleitet. Die Darstellung über GenomicStudyAnalysis ist präziser als die vorherige UntersuchteRegion, da sie eine klare Repräsentation ermöglicht, welche Regionen mit welchem Assay untersucht wurden und welche Bereiche callable bzw. nicht-callable waren. Dies ermöglicht eine genauere Qualitätsbewertung und Interpretation der Ergebnisse, insbesondere bei negativen Befunden."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active

// Fusion

//Instance: mii-exa-molgen-molekulargenetischer-befundbericht-tumorboard-3
//InstanceOf: sd-mii-modul-molgen-molekulargenetischer-befundbericht
//Usage: #example
//Title: "Molekulargentischer Befund 3: Tumorboard Genfusion"
//Description: "Beispiel für molekulargenetischen Befund Tumorboard Genfusion."
//* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-report"
//* extension[RecommendedAction][+].valueReference = Reference(mii-exa-molgen-medikationsempfehlung-1)
//* extension[RecommendedAction][+].valueReference = Reference(mii-exa-molgen-folgemassnahme-1)
//* extension[supportingInfo].valueReference = Reference(mii-exa-molgen-family-member-history-1)
//* basedOn = Reference(mii-exa-molgen-anforderung-1)
//* status = $DiagRepStatus#final
//* category = $v2-0074#GE "Genetics"
//* code = $LNC#51969-4 "Genetic analysis report"
//* subject = Reference(mii-exa-molgen-patient)
//* performer = Reference(mii-exa-molgen-practitioner-lab)
//* specimen = Reference(mii-exa-molgen-specimen-1)
//* result[gen-grouper] = Reference(mii-exa-molgen-gruppierung-beobachtungen-1)
//* result[diagnostic-implication] = Reference(mii-exa-molgen-diagnostische-implikation-1)
//* result[therapeutic-implication] = Reference(mii-exa-molgen-therapeutische-implikation-1)
//* result[variant] = Reference(mii-exa-molgen-variante-1)
//* result[region-studied] = Reference(mii-exa-molgen-untersuchte-region-1)
//* result[genotype] = Reference(mii-exa-molgen-genotyp-1)
//* result[tumor-mutation-burden] = Reference(mii-exa-molgen-mutationslast-1)
//* conclusion = "Nachweises der bekannten treibenden FGFR2-Fusion"