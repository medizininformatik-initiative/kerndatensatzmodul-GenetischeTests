Profile: MII_PR_MolGen_GenomicStudy
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study
Id: mii-pr-molgen-genomic-study
Title: "MII PR MolGen Genomic Study"
Description: "Genomic Study ist ein Profil, dass die Durchführung von übergeorndenten molekulargenetischen Untersuchungen (Studies) beschreibt. Einzelne Assays werden dann als GenomicStudyAnalysis abgebildet. Es ist vom GenomicStudy-Profils aus dem Genomics Reporting IG abgeleitet ."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active

// MS elements with German translations
* code MS
* code ^short = "Art der genomischen Untersuchung"
* code ^definition = "Art der genomischen oder molekulargenetischen Untersuchung die durchgeführt wurde"
* insert Translation(code ^short, de-DE, Art der genomischen Untersuchung)
* insert Translation(code ^definition, de-DE, Art der genomischen oder molekulargenetischen Untersuchung die durchgeführt wurde)

* reasonReference MS
* reasonReference ^short = "Anforderung/Indikation für die genetische Untersuchung"
* reasonReference ^definition = "Referenz zur ServiceRequest-Ressource die die Anforderung für diese genetische Studie darstellt"
* insert Translation(reasonReference ^short, de-DE, Anforderung/Indikation für die genetische Untersuchung)
* insert Translation(reasonReference ^definition, de-DE, Referenz zur ServiceRequest-Ressource die die Anforderung für diese genetische Studie darstellt)

* performed[x] MS
* performed[x] ^short = "Zeitpunkt oder Zeitraum der Durchführung"
* performed[x] ^definition = "Zeitpunkt oder Zeitraum in dem die genetische Studie durchgeführt wurde"
* insert Translation(performed[x] ^short, de-DE, Zeitpunkt oder Zeitraum der Durchführung)
* insert Translation(performed[x] ^definition, de-DE, Zeitpunkt oder Zeitraum in dem die genetische Studie durchgeführt wurde)

* subject MS
* subject ^short = "Patient/Proband der Untersuchung"
* subject ^definition = "Referenz zum Patienten oder Probanden für den die genetische Studie durchgeführt wurde"
* insert Translation(subject ^short, de-DE, Patient/Proband der Untersuchung)
* insert Translation(subject ^definition, de-DE, Referenz zum Patienten oder Probanden für den die genetische Studie durchgeführt wurde)

* encounter MS
* encounter ^short = "Fallbezug der Untersuchung"
* encounter ^definition = "Referenz zum Behandlungsfall in dessen Kontext die genetische Studie durchgeführt wurde"
* insert Translation(encounter ^short, de-DE, Fallbezug der Untersuchung)
* insert Translation(encounter ^definition, de-DE, Referenz zum Behandlungsfall in dessen Kontext die genetische Studie durchgeführt wurde)

* status MS
* status ^short = "Status der genetischen Studie"
* status ^definition = "Aktueller Status der genetischen Studie wie z.B. registered oder completed oder cancelled"
* insert Translation(status ^short, de-DE, Status der genetischen Studie)
* insert Translation(status ^definition, de-DE, Aktueller Status der genetischen Studie wie z.B. registered oder completed oder cancelled)

* extension[genomic-study-analysis] MS
* extension[genomic-study-analysis] ^short = "Durchgeführte Analysen"
* extension[genomic-study-analysis] ^definition = "Referenzen zu den einzelnen GenomicStudyAnalysis-Ressourcen die die spezifischen Analysen und Assays dieser Studie beschreiben"
* insert Translation(extension[genomic-study-analysis] ^short, de-DE, Durchgeführte Analysen)
* insert Translation(extension[genomic-study-analysis] ^definition, de-DE, Referenzen zu den einzelnen GenomicStudyAnalysis-Ressourcen die die spezifischen Analysen und Assays dieser Studie beschreiben)

//* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"

Mapping: MolGen-GenomicStudy
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_GenomicStudy

Instance: mii-exa-molgen-genomic-study-1
InstanceOf: mii-pr-molgen-genomic-study
Title: "Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom"
Description: "Beispiel für molekulargenetischen Befund BRAF mutiert bei colorektalem Adenokarzniom."
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study)
* status = #completed
* subject = Reference(mii-exa-molgen-patient)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(mii-exa-molgen-genomic-study-analysis-braf)

Instance: mii-exa-molgen-genomic-study-analysis-braf
InstanceOf: mii-pr-molgen-genomic-study-analysis
Title: "Genomic Study Analysis BRAF"
Description: "Analyse der BRAF Region mittels NGS"
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis)
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
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study)
* status = #completed
* subject = Reference(mii-exa-molgen-patient-brca1)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(mii-exa-molgen-genomic-study-analysis-trurisk-panel)

Instance: mii-exa-molgen-genomic-study-analysis-trurisk-panel
InstanceOf: mii-pr-molgen-genomic-study-analysis
Title: "Genomic Study Analysis TruRisk Panel v3"
Description: "NGS-Analyse des TruRisk Panel v3 für erblichen Brust- und Eierstockkrebs"
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis)
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
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:20473 "BRIP1"
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
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study)
* status = #completed
* subject = Reference(mii-exa-molgen-patient-2)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(mii-exa-molgen-genomic-study-analysis-cornelia-de-lange)

Instance: mii-exa-molgen-genomic-study-analysis-cornelia-de-lange
InstanceOf: mii-pr-molgen-genomic-study-analysis
Title: "Genomic Study Analysis Cornelia de Lange Panel"
Description: "NGS-Analyse des Cornelia de Lange-Syndrom Panels"
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genomic-study-analysis)
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
* extension[regions].extension[studied][=].valueCodeableConcept = $HGNC#HGNC:13315 "HDAC8"
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

// MS elements with German translations
* extension[specimen] MS
* extension[specimen] ^short = "Untersuchte Probe"
* extension[specimen] ^definition = "Referenz zur Specimen-Ressource die die für diese Analyse verwendete Probe beschreibt"
* insert Translation(extension[specimen] ^short, de-DE, Untersuchte Probe)
* insert Translation(extension[specimen] ^definition, de-DE, Referenz zur Specimen-Ressource die die für diese Analyse verwendete Probe beschreibt)

* extension[device] MS
* extension[device] ^short = "Verwendetes Analysegerät"
* extension[device] ^definition = "Komplexe Extension mit Art des Gerätes und Referenz zum Device wie z.B. Sequenziergerät oder Library Preparation Kit oder bioinformatische Pipelines das für diese Analyse verwendet wurde"
* insert Translation(extension[device] ^short, de-DE, Verwendetes Analysegerät)
* insert Translation(extension[device] ^definition, de-DE, Komplexe Extension mit Art des Gerätes und Referenz zum Device wie z.B. Sequenziergerät oder Library Preparation Kit oder bioinformatische Pipelines das für diese Analyse verwendet wurde)

* extension[method-type] MS
* extension[method-type] ^short = "Analysemethode"
* extension[method-type] ^definition = "Art der durchgeführten Analysemethode wie z.B. Sequenzierung oder PCR oder Array-CGH"
* insert Translation(extension[method-type] ^short, de-DE, Analysemethode)
* insert Translation(extension[method-type] ^definition, de-DE, Art der durchgeführten Analysemethode wie z.B. Sequenzierung oder PCR oder Array-CGH)

* extension[change-type] MS
* extension[change-type] ^short = "Untersuchte Variationstypen"
* extension[change-type] ^definition = "Typen genetischer Veränderungen die mit dieser Analyse untersucht wurden wie z.B. SNV oder CNV oder Strukturvarianten"
* insert Translation(extension[change-type] ^short, de-DE, Untersuchte Variationstypen)
* insert Translation(extension[change-type] ^definition, de-DE, Typen genetischer Veränderungen die mit dieser Analyse untersucht wurden wie z.B. SNV oder CNV oder Strukturvarianten)

* extension[regions] MS
* extension[regions] ^short = "Untersuchte genomische Regionen"
* extension[regions] ^definition = "Komplexe Extension zur Spezifikation der genomischen Regionen - v.a. Gene aber theoretisch erweiterbar durch z.B. Exonangaben - die in dieser Analyse untersucht wurden. Angabe der untersuchten Regionen sowie optional Angabe der callable/non-callable Regions"
* insert Translation(extension[regions] ^short, de-DE, Untersuchte genomische Regionen)
* insert Translation(extension[regions] ^definition, de-DE, Komplexe Extension zur Spezifikation der genomischen Regionen - v.a. Gene aber theoretisch erweiterbar durch z.B. Exonangaben - die in dieser Analyse untersucht wurden. Angabe der untersuchten Regionen sowie optional Angabe der callable/non-callable Regions)

* extension[genome-build] MS
* extension[genome-build] ^short = "Referenzgenom-Version"
* extension[genome-build] ^definition = "Version des verwendeten Referenzgenoms wie z.B. GRCh38 oder hg19"
* insert Translation(extension[genome-build] ^short, de-DE, Referenzgenom-Version)
* insert Translation(extension[genome-build] ^definition, de-DE, Version des verwendeten Referenzgenoms wie z.B. GRCh38 oder hg19)

* extension[focus] MS
* extension[focus] ^short = "Fokus der Analyse"
* extension[focus] ^definition = "Spezifischer Fokus oder Ziel dieser Analyse wie z.B. Referenz auf Krebserkrankung oder erbliche Erkrankung"
* insert Translation(extension[focus] ^short, de-DE, Fokus der Analyse)
* insert Translation(extension[focus] ^definition, de-DE, Spezifischer Fokus oder Ziel dieser Analyse wie z.B. Referenz auf Krebserkrankung oder erbliche Erkrankung)

* extension[title] MS
* extension[title] ^short = "Bezeichnung der Analyse"
* extension[title] ^definition = "Kurze prägnante Bezeichnung oder Titel dieser spezifischen Analyse"
* insert Translation(extension[title] ^short, de-DE, Bezeichnung der Analyse)
* insert Translation(extension[title] ^definition, de-DE, Kurze prägnante Bezeichnung oder Titel dieser spezifischen Analyse)

* extension[metrics] MS
* extension[metrics] ^short = "Qualitätsmetriken"
* extension[metrics] ^definition = "Qualitätsmetriken der Analyse wie z.B. Coverage oder Depth oder Call-Rate"
* insert Translation(extension[metrics] ^short, de-DE, Qualitätsmetriken)
* insert Translation(extension[metrics] ^definition, de-DE, Qualitätsmetriken der Analyse wie z.B. Coverage oder Depth oder Call-Rate)


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