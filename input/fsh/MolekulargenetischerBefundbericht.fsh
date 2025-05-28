Profile: MII_PR_MolGen_MolekulargenetischerBefundbericht
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report
Id: mii-pr-molgen-molekulargenetischer-befundbericht
Title: "MII PR MolGen Molekulargenetischer Befundbericht"
Description: "Der DiagnosticReport ist zentraler Bestandteil aller genetischen Befundberichte und enthält Metadaten über den gesamten Bericht sowie alle relevanten Informationen, die im Rahmen der molekulargenetischen Analyse gefunden wurden."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active

* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
* extension[recommended-action] MS
* extension[recommended-action] only MII_EX_MolGen_EmpfohleneMassnahme
* extension[supporting-info] MS
* extension[coded-note] MS
* extension[genomic-risk-assessment] MS
* extension[workflow-relatedArtifact] MS
//* extension[genomics-file] MS
* status ^alias[+] = "Berichtstatus"
* status MS
* subject 1.. MS 
* subject only Reference(Patient or Group)
* encounter MS
* issued MS
* issued ^alias[+] = "Datum des Berichtes"
* performer MS
* performer ^alias[+] = "Labor / Institution/ Ansprechpartner"
* resultsInterpreter MS
* resultsInterpreter ^alias[+] = "Labor / Institution/ Ansprechpartner"
* specimen MS
* result MS
* result contains 
    tumor-mutation-burden 0..* and
    microsatellite-instability 0..*
//* result[gen-grouper] only Reference(SD_MII_MolGen_GruppierungBeobachtungen)
* result[diagnostic-implication] MS
* result[diagnostic-implication] only Reference(MII_PR_MolGen_DiagnostischeImplikation)
* result[therapeutic-implication] MS
* result[therapeutic-implication] only Reference(MII_PR_MolGen_TherapeutischeImplikation)
* result[variant] MS
* result[variant] only Reference(MII_PR_MolGen_Variante)
//* result[region-studied] MS
//* result[region-studied] only Reference(MII_PR_MolGen_UntersuchteRegion)
* result[tumor-mutation-burden] MS
* result[tumor-mutation-burden] only Reference(MII_PR_MolGen_Mutationslast)
* result[genotype] MS
* result[genotype] only Reference(MII_PR_MolGen_Genotyp)
* result[microsatellite-instability] MS
* result[microsatellite-instability] only Reference(MII_PR_MolGen_Mikrosatelliteninstabilitaet)
* result[sequence-phase-relation] MS
* result[haplotype] MS
* media MS
* conclusion MS
* conclusionCode MS

Mapping: MolGen-Befundbericht
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_MolekulargenetischerBefundbericht
* -> "mide-dataelement-1371" "Molekulargenetischer Befundbericht"
* status -> "mide-dataelement-1448" "Berichtstatus"
* issued -> "mide-dataelement-1452" "Datum des Berichtes"
* performer -> "mide-dataelement-1453" "Labor / Institution/ Ansprechpartner"
* resultsInterpreter -> "mide-dataelement-1453" "Labor / Institution/ Ansprechpartner"
* media -> "mide-dataelement-1698" "Daten"
* media -> "mide-dataelement-1447" "Anhänge"

Instance: mii-exa-molgen-molekulargenetischer-befundbericht-1
InstanceOf: mii-pr-molgen-molekulargenetischer-befundbericht
Usage: #example
Title: "Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom"
Description: "Beispiel für molekulargenetischen Befund BRAF mutiert bei colorektalem Adenokarzniom."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-report"
* extension[RecommendedAction][+].valueReference = Reference(mii-exa-molgen-medikationsempfehlung-1)
* extension[RecommendedAction][+].valueReference = Reference(mii-exa-molgen-folgemassnahme-1)
* extension[supportingInfo].valueReference = Reference(mii-exa-molgen-family-member-history-1)
* basedOn = Reference(mii-exa-molgen-anforderung-1)
* status = DiagRepStatus#final
* category[Genetics] = v2-0074#GE "Genetics"
* code = LNC#51969-4 "Genetic analysis report"
* subject = Reference(mii-exa-molgen-patient)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* specimen = Reference(mii-exa-molgen-specimen-1)
//* result[gen-grouper] = Reference(mii-exa-molgen-gruppierung-beobachtungen-1)
//result[overall] = Reference(mii-exa-molgen-ergebnis-zusammenfassung-1)
* result[diagnostic-implication] = Reference(mii-exa-molgen-diagnostische-implikation-1)
* result[therapeutic-implication] = Reference(mii-exa-molgen-therapeutische-implikation-1)
* result[variant] = Reference(mii-exa-molgen-variante-1)
//* result[region-studied] = Reference(mii-exa-molgen-untersuchte-region-1)
* result[genotype] = Reference(mii-exa-molgen-genotyp-1)
* result[tumor-mutation-burden] = Reference(mii-exa-molgen-mutationslast-1)
* result[microsatellite-instability] = Reference(mii-exa-molgen-mikrosatelliteninstabilitaet-1)
* conclusion = "BRAF p.V600E Mutation liegt vor. Bitte Therapieoption mit einem BRAF-Inhibitor prüfen."

Instance: mii-exa-molgen-molekulargenetischer-befundbericht-2
InstanceOf: mii-pr-molgen-molekulargenetischer-befundbericht
Usage: #example
Title: "Molekulargentischer Befund 2: Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom autosomal dominanter Erbgang"
Description: "Beispiel für molekulargenetischen Befund Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom autosomal dominanter Erbgang."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-report"
* extension[workflow-relatedArtifact][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.type = RelArtType#citation "Citation"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.citation = "Gillis LA, McCallum J, Kaur M, DeScipio C, Yaeger D, Mariani A, Kline AD, Li HH, Devoto M, Jackson LG, Krantz ID. NIPBL mutational analysis in 120 individuals with Cornelia de Lange syndrome and evaluation of genotype-phenotype correlations. Am J Hum Genet. 2004 Oct;75(4):610-23. doi: 10.1086/424698. Epub 2004 Aug 18. PMID: 15318302; PMCID: PMC1182048."
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/15318302/"
* extension[workflow-relatedArtifact][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.type = RelArtType#citation "Citation"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.citation = "Kawauchi S, Calof AL, Santos R, Lopez-Burks ME, Young CM, Hoang MP, Chua A, Lao T, Lechner MS, Daniel JA, Nussenzweig A, Kitzes L, Yokomori K, Hallgrimsson B, Lander AD. Multiple organ system defects and transcriptional dysregulation in the Nipbl(+/-) mouse, a model of Cornelia de Lange Syndrome. PLoS Genet. 2009 Sep;5(9):e1000650. doi: 10.1371/journal.pgen.1000650. Epub 2009 Sep 18. PMID: 19763162; PMCID: PMC2730539."
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/19763162/"
* extension[workflow-relatedArtifact][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.type = RelArtType#citation "Citation"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.citation = "Huisman SA, Redeker EJ, Maas SM, Mannens MM, Hennekam RC. High rate of mosaicism in individuals with Cornelia de Lange syndrome. J Med Genet. 2013 May;50(5):339-44. doi: 10.1136/jmedgenet-2012-101477. Epub 2013 Mar 15. PMID: 23505322."
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/23505322/"
* extension[workflow-relatedArtifact][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.type = RelArtType#citation "Citation"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.citation = "Kline AD, Moss JF, Selicorni A, Bisgaard AM, Deardorff MA, Gillett PM, Ishman SL, Kerr LM, Levin AV, Mulder PA, Ramos FJ, Wierzba J, Ajmone PF, Axtell D, Blagowidow N, Cereda A, Costantino A, Cormier-Daire V, FitzPatrick D, Grados M, Groves L, Guthrie W, Huisman S, Kaiser FJ, Koekkoek G, Levis M, Mariani M, McCleery JP, Menke LA, Metrena A, O'Connor J, Oliver C, Pie J, Piening S, Potter CJ, Quaglio AL, Redeker E, Richman D, Rigamonti C, Shi A, Tümer Z, Van Balkom IDC, Hennekam RC. Diagnosis and management of Cornelia de Lange syndrome: first international consensus statement. Nat Rev Genet. 2018 Oct;19(10):649-666. doi: 10.1038/s41576-018-0031-0. PMID: 29995837; PMCID: PMC7136165."
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/29995837/"
* extension[coded-note][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report-note"
* extension[coded-note][=].valueAnnotation.extension[code].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/annotation-code"
* extension[coded-note][=].valueAnnotation.extension[code].valueCodeableConcept = SCT#116148004 "Molecular genetics procedure (procedure)"
* extension[coded-note][=].valueAnnotation.text = "Gen-Panel zusammengestellt nach den aktuellen Empfehlungen des Deutschen Konsortiums für erblichen Brust- und Eierstockkrebs sowie der ClinGen Breast/Ovarian Cancer Working Group (Lee et al. 2019, PMID: 30504931). Nach DNA-Extraktion wurden alle kodierenden Exons der zu untersuchenden Gene einschließlich flankierender intronischer Regionen (mindestens von -3 bis +8) angereichert (Custom Panel V02, IDT) und auf einem Illumina NextSeq 500-, NextSeq 550- oder NovaSeq 6000-Sequencer sequenziert. Zur Verifizierung der DNA-Probe wurden 14 SNPs (Single Nucleotide Polymorphism) mittels kompetitiver allelspezifischer PCR unter Verwendung fluoreszenzmarkierter Primer amplifiziert (StepOnePlus System, ThermoFisher Scientific) und analysiert (StepOnePlus software für Genotyping Experiments) und die Ergebnisse mit den Daten der NGS-Analyse verglichen (megSAP). Der Abgleich der ermittelten DNA-Sequenz erfolgte mit den in den Gendatenbanken niedergelegten Sequenzen: BRCA1 - NCBI Reference Sequence NM_007294.2, BRCA2 - ensembl ENST00000380152, ATM - NCBI Reference Sequence NM_000051.3, BARD1 - ENST00000260947.4, BRIP1 - NCBI Reference Sequence NM_032043.2, CDH1 - ensembl ENST00000261769, CHEK2 - NCBI Reference Sequence NM_007194.3, PALB2 - ensembl ENST00000261584, PTEN -  NCBI Reference Sequence NM_000214.4, RAD51C - ensembl ENST00000337432, RAD51D - ensembl ENST00000345365,  STK11 -  ensembl ENST00000326873.7 und TP53 - ensembl ENST00000269305. Es wurden außerdem Varianten nachgewiesen, die nach heutigem Wissensstand als Normvarianten ohne pathologische Bedeutung zu werten sind."
* extension[supporting-info][+].url = "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo"
* extension[supporting-info][=].valueReference = Reference(mii-exa-molgen-chargeitem-ebm-21)
* extension[supporting-info][+].url = "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo"
* extension[supporting-info][=].valueReference = Reference(mii-exa-molgen-chargeitem-ebm-22)
* extension[supporting-info][+].url = "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo"
* extension[supporting-info][=].valueReference = Reference(mii-exa-molgen-chargeitem-ebm-23)
* extension[supporting-info][+].url = "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo"
* extension[supporting-info][=].valueReference = Reference(mii-exa-molgen-chargeitem-ebm-24)
* extension[supporting-info][+].url = "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo"
* extension[supporting-info][=].valueReference = Reference(mii-exa-molgen-bundle-befund-2-nipbl-condition-lab)
* basedOn = Reference(mii-exa-molgen-anforderung-2)
* status = DiagRepStatus#final
* category[Genetics] = v2-0074#GE "Genetics"
* code[+] = LNC#51969-4 "Genetic analysis report"
* subject = Reference(mii-exa-molgen-patient-2)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* specimen = Reference(mii-exa-molgen-specimen-2)
//* result[gen-grouper] = Reference(mii-exa-molgen-gruppierung-beobachtungen-2-nipbl)
* result[diagnostic-implication] = Reference(mii-exa-molgen-diagnostische-implikation-2)
* result[variant] = Reference(mii-exa-molgen-variante-2)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-2-nipbl)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-2-hdac8)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-2-rad21)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-2-smc1a)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-2-smc3)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-2-tp63)
* conclusion = "Nachweis der pathogenen Variante c.2207del p.(Pro736Glnfs*58) (heterozygot) im NIPBL-Gen."

//Fusion

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
//* status = DiagRepStatus#final
//* category = v2-0074#GE "Genetics"
//* code = LNC#51969-4 "Genetic analysis report"
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

// 04 docx
Instance: mii-exa-molgen-molekulargenetischer-befundbericht-trurisk-panel
InstanceOf: mii-pr-molgen-molekulargenetischer-befundbericht
Usage: #example
Title: "Molekulargentischer Befund Familiäre Belastung für Brust- und Eierstockkrebs"
Description: "Beispiel für molekulargenetischen Befund einer BRCA1 Variante bei Familiärer Belastung für Brust- und Eierstockkrebs."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-report"
* extension[workflow-relatedArtifact][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.type = RelArtType#citation "Citation"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.citation = "Plon SE, Eccles DM, Easton D, Foulkes WD, Genuardi M, Greenblatt MS, Hogervorst FB, Hoogerbrugge N, Spurdle AB, Tavtigian SV; IARC Unclassified Genetic Variants Working Group. Sequence variant classification and reporting: recommendations for improving the interpretation of cancer susceptibility genetic test results. Hum Mutat. 2008 Nov;29(11):1282-91. doi: 10.1002/humu.20880. PMID: 18951446; PMCID: PMC3075918."
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.url = "https://doi.org/10.1002/humu.20880"
* extension[workflow-relatedArtifact][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.type = RelArtType#citation "Citation"
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.citation = "Rhiem K, Auber B, Briest S, Dikow N, Ditsch N, Dragicevic N, Grill S, Hahnen E, Horvath J, Jaeger B, Kast K, Kiechle M, Leinert E, Morlot S, Püsken M, Schäfer D, Schott S, Schroeder C, Siebers-Renelt U, Solbach C, Weber-Lassalle N, Witzel I, Zeder-Göß C, Schmutzler RK. Consensus Recommendations of the German Consortium for Hereditary Breast and Ovarian Cancer. Breast Care (Basel). 2022 Apr;17(2):199-207. doi: 10.1159/000516376. Epub 2021 Jul 19. PMID: 35702495; PMCID: PMC9149395."
* extension[workflow-relatedArtifact][=].valueRelatedArtifact.url = "https://doi.org/10.1159%2F000516376"
* extension[recommended-action].valueReference = Reference(mii-exa-molgen-folgemassnahme-brca1)
* extension[genomics-risk-assessment].valueReference = Reference(mii-exa-molgen-prs-brca1)
* basedOn = Reference(mii-exa-molgen-anforderung-trurisk-panel)
* status = DiagRepStatus#final
* category[Genetics] = v2-0074#GE "Genetics"
* code[+] = LNC#51969-4 "Genetic analysis report"
* subject = Reference(mii-exa-molgen-patient-brca1)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* specimen = Reference(mii-exa-molgen-specimen-brca1)
//* result[overall] = Reference(mii-exa-molgen-ergebnis-zusammenfassung-trurisk-panel)
* result[variant] = Reference(mii-exa-molgen-variante-brca1)
* result[diagnostic-implication] = Reference(mii-exa-molgen-diagnostische-implikation-brca1)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-ATM)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BRCA1)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BARD1)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BRCA2)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BRIP1)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-CDH1)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-CHECK2)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-MLH1)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-MSH2)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-MSH6)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-PALB2)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-PMS2)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-PTEN)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-RAD51C)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-RAD51D)
//* result[region-studied][+] = Reference(mii-exa-molgen-untersuchte-region-true-risk-panel-v3-TP53)
* conclusion = "Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt."

