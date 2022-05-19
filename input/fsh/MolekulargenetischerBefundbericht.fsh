Profile: SD_MII_MolGen_MolekulargenetischerBefundbericht
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-report
Id: sd-mii-modul-molgen-molekulargenetischer-befundbericht
Title: "SD MII MolGen Molekulargenetischer Befundbericht"
Description: "Der DiagnosticReport ist zentraler Bestandteil aller genetischen Befundberichte und enthält Metadaten über den gesamten Bericht sowie alle relevanten Informationen, die im Rahmen der molekulargenetischen Analyse gefunden wurden."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
* ^status = #draft
* extension[recommended-action] only SD_MII_MolGen_EmpfohleneMassnahme
* status ^alias[+] = "Berichtstatus"
* status MS
* subject MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* issued MS
* issued ^alias[+] = "Datum des Berichtes"
* performer MS
* performer ^alias[+] = "Labor / Institution/ Ansprechpartner"
* resultsInterpreter MS
* resultsInterpreter ^alias[+] = "Labor / Institution/ Ansprechpartner"
* result MS
* result contains tumor-mutation-burden 0..*
//* result[gen-grouper] only Reference(SD_MII_MolGen_GruppierungBeobachtungen)
* result[overall] only Reference(SD_MII_MolGen_ErgebnisZusammenfassung)
* result[diagnostic-implication] only Reference(SD_MII_MolGen_DiagnostischeImplikation)
* result[therapeutic-implication] only Reference(SD_MII_MolGen_TherapeutischeImplikation)
* result[variant] only Reference(SD_MII_MolGen_Variante)
* result[region-studied] only Reference(SD_MII_MolGen_UntersuchteRegion)
* result[tumor-mutation-burden] only Reference(SD_MII_MolGen_Mutationslast)
* media MS

Mapping: MolGen-Befundbericht
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_MolekulargenetischerBefundbericht
* -> "mide-dataelement-1371" "Molekulargenetischer Befundbericht"
* status -> "mide-dataelement-1448" "Berichtstatus"
* issued -> "mide-dataelement-1452" "Datum des Berichtes"
* performer -> "mide-dataelement-1453" "Labor / Institution/ Ansprechpartner"
* resultsInterpreter -> "mide-dataelement-1453" "Labor / Institution/ Ansprechpartner"
* media -> "mide-dataelement-1698" "Daten"
* media -> "mide-dataelement-1447" "Anhänge"

Instance: example-mii-molgen-molekulargenetischer-befundbericht-1
InstanceOf: sd-mii-modul-molgen-molekulargenetischer-befundbericht
Usage: #example
Title: "Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom"
Description: "Beispiel für molekulargenetischen Befund BRAF mutiert bei colorektalem Adenokarzniom."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-report"
* extension[RecommendedAction][+].valueReference = Reference(example-mii-molgen-medikationsempfehlung-1)
* extension[RecommendedAction][+].valueReference = Reference(example-mii-molgen-folgemassnahme-1)
* extension[supportingInfo].valueReference = Reference(example-mii-molgen-family-member-history-1)
* basedOn = Reference(example-mii-molgen-anforderung-1)
* status = DiagRepStatus#final
* category = v2-0074#GE "Genetics"
* code = LNC#51969-4 "Genetic analysis report"
* subject = Reference(example-mii-molgen-patient)
* performer = Reference(example-mii-molgen-practitioner-lab)
* specimen = Reference(example-mii-molgen-specimen)
//* result[gen-grouper] = Reference(example-mii-molgen-gruppierung-beobachtungen-1)
* result[diagnostic-implication] = Reference(example-mii-molgen-diagnostische-implikation-1)
* result[therapeutic-implication] = Reference(example-mii-molgen-therapeutische-implikation-1)
* result[variant] = Reference(example-mii-molgen-variante-1)
* result[region-studied] = Reference(example-mii-molgen-untersuchte-region-1)
* result[genotype] = Reference(example-mii-molgen-genotyp-1)
* result[tumor-mutation-burden] = Reference(example-mii-molgen-mutationslast-1)
* conclusion = "BRAF p.V600E Mutation liegt vor. Bitte Therapieoption mit einem BRAF-Inhibitor prüfen."

Instance: example-mii-molgen-molekulargenetischer-befundbericht-2
InstanceOf: sd-mii-modul-molgen-molekulargenetischer-befundbericht
Usage: #example
Title: "Molekulargentischer Befund 2: Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom autosomal dominanter Erbgang"
Description: "Beispiel für molekulargenetischen Befund Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom autosomal dominanter Erbgang."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-report"
* extension[genomics-artifact][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact"
* extension[genomics-artifact][=].valueRelatedArtifact.type = RelArtType#citation "Citation"
* extension[genomics-artifact][=].valueRelatedArtifact.citation = "Gillis LA, McCallum J, Kaur M, DeScipio C, Yaeger D, Mariani A, Kline AD, Li HH, Devoto M, Jackson LG, Krantz ID. NIPBL mutational analysis in 120 individuals with Cornelia de Lange syndrome and evaluation of genotype-phenotype correlations. Am J Hum Genet. 2004 Oct;75(4):610-23. doi: 10.1086/424698. Epub 2004 Aug 18. PMID: 15318302; PMCID: PMC1182048."
* extension[genomics-artifact][=].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/15318302/"
* extension[genomics-artifact][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact"
* extension[genomics-artifact][=].valueRelatedArtifact.type = RelArtType#citation "Citation"
* extension[genomics-artifact][=].valueRelatedArtifact.citation = "Kawauchi S, Calof AL, Santos R, Lopez-Burks ME, Young CM, Hoang MP, Chua A, Lao T, Lechner MS, Daniel JA, Nussenzweig A, Kitzes L, Yokomori K, Hallgrimsson B, Lander AD. Multiple organ system defects and transcriptional dysregulation in the Nipbl(+/-) mouse, a model of Cornelia de Lange Syndrome. PLoS Genet. 2009 Sep;5(9):e1000650. doi: 10.1371/journal.pgen.1000650. Epub 2009 Sep 18. PMID: 19763162; PMCID: PMC2730539."
* extension[genomics-artifact][=].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/19763162/"
* extension[genomics-artifact][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact"
* extension[genomics-artifact][=].valueRelatedArtifact.type = RelArtType#citation "Citation"
* extension[genomics-artifact][=].valueRelatedArtifact.citation = "Huisman SA, Redeker EJ, Maas SM, Mannens MM, Hennekam RC. High rate of mosaicism in individuals with Cornelia de Lange syndrome. J Med Genet. 2013 May;50(5):339-44. doi: 10.1136/jmedgenet-2012-101477. Epub 2013 Mar 15. PMID: 23505322."
* extension[genomics-artifact][=].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/23505322/"
* extension[genomics-artifact][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact"
* extension[genomics-artifact][=].valueRelatedArtifact.type = RelArtType#citation "Citation"
* extension[genomics-artifact][=].valueRelatedArtifact.citation = "Kline AD, Moss JF, Selicorni A, Bisgaard AM, Deardorff MA, Gillett PM, Ishman SL, Kerr LM, Levin AV, Mulder PA, Ramos FJ, Wierzba J, Ajmone PF, Axtell D, Blagowidow N, Cereda A, Costantino A, Cormier-Daire V, FitzPatrick D, Grados M, Groves L, Guthrie W, Huisman S, Kaiser FJ, Koekkoek G, Levis M, Mariani M, McCleery JP, Menke LA, Metrena A, O'Connor J, Oliver C, Pie J, Piening S, Potter CJ, Quaglio AL, Redeker E, Richman D, Rigamonti C, Shi A, Tümer Z, Van Balkom IDC, Hennekam RC. Diagnosis and management of Cornelia de Lange syndrome: first international consensus statement. Nat Rev Genet. 2018 Oct;19(10):649-666. doi: 10.1038/s41576-018-0031-0. PMID: 29995837; PMCID: PMC7136165."
* extension[genomics-artifact][=].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/29995837/"
* basedOn = Reference(example-mii-molgen-anforderung-2)
* status = DiagRepStatus#final
* category = v2-0074#GE "Genetics"
* code = LNC#51969-4 "Genetic analysis report"
* subject = Reference(example-mii-molgen-patient-2)
* performer = Reference(example-mii-molgen-practitioner-lab)
//* specimen = Reference(example-mii-molgen-specimen)
//* result[gen-grouper] = Reference(example-mii-molgen-gruppierung-beobachtungen-2-nipbl)
* result[diagnostic-implication] = Reference(example-mii-molgen-diagnostische-implikation-2)
* result[variant] = Reference(example-mii-molgen-variante-2)
* result[region-studied][+] = Reference(example-mii-molgen-untersuchte-region-2-nipbl)
* result[region-studied][+] = Reference(example-mii-molgen-untersuchte-region-2-hdac8)
* result[region-studied][+] = Reference(example-mii-molgen-untersuchte-region-2-rad21)
* result[region-studied][+] = Reference(example-mii-molgen-untersuchte-region-2-smc1a)
* result[region-studied][+] = Reference(example-mii-molgen-untersuchte-region-2-smc3)
* result[region-studied][+] = Reference(example-mii-molgen-untersuchte-region-2-tp63)
* conclusion = "Nachweis der pathogenen Variante c.2207del p.(Pro736Glnfs*58) (heterozygot) im NIPBL-Gen."


