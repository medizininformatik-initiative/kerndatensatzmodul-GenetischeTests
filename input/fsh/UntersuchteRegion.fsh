Profile: MII_PR_MolGen_UntersuchteRegion
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/region-studied
Id: mii-pr-molgen-untersuchte-region
Title: "MII PR MolGen Untersuchte Region"
Description: "Dieses Profil beschreibt die Region oder die Regionen, die im Rahmen dieses Befundberichts untersucht wurden."
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/untersuchte-region"
//* status = #draft
* status MS
* category MS
* code MS
* subject 1.. MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* encounter MS
* component contains transcript-ref-seq 0..1
* component[conclusion-string] MS
* component[gene-studied] MS
* component[gene-mutations] MS
* component[region-description] MS
* component[region-coverage] MS
* component[ranges-examined] MS
* component[genomic-ref-seq] MS
* component[uncallable-regions] MS
* component[transcript-ref-seq] MS
* component[transcript-ref-seq] ^short = "Reference Transcript"
* component[transcript-ref-seq] ^definition = "NCBI's RefSeq ('NM_...'), Ensembl ('ENST...'), and LRG ('LRG...' plus 't1' to indicate transcript)"
* component[transcript-ref-seq].code = LNC#51958-7
* component[transcript-ref-seq].code ^short = "51958-7"
* component[transcript-ref-seq].value[x] 1..
* component[transcript-ref-seq].value[x] only CodeableConcept
* component[transcript-ref-seq].value[x] ^short = "Versioned transcript reference sequence identifier"
* component[transcript-ref-seq].value[x] ^binding.strength = #example
* component[transcript-ref-seq].value[x] ^binding.description = "Multiple bindings acceptable (NCBI or LRG)"


Mapping: MolGen-UntersuchteRegion
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_UntersuchteRegion
* component[gene-studied] -> "mide-dataelement-1400" "Getestete Gene ID"
* component[region-coverage] -> "mide-dataelement-1407" "Read depth/Coverage"
* component[genomic-ref-seq] -> "mide-dataelement-1405" "Referenzsequenz"


Instance: mii-exa-molgen-untersuchte-region-1
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region BRAF"
Description: "Beispiel für untersuchte Region BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/region-studied"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = LNC#53041-0 "DNA region of interest panel"
* subject = Reference(mii-exa-molgen-patient)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* method = LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-1)
* device = Reference(mii-exa-molgen-device-sequencer)
* component[gene-studied].code = LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = HGNC#HGNC:1097 "BRAF"
* component[gene-mutations].code = LNC#36908-2 "Gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal"
* component[gene-mutations].valueCodeableConcept = HGVS#NM_004333.4:c.1799T>A
* component[region-description].code = LNC#81293-3 "Description of ranges of DNA sequences examined"
* component[region-description].valueString = "BRAF: Exon 15 (Codon 600)"
* component[ranges-examined][+].code = LNC#51959-5 "Range(s) of DNA sequence examined"
* component[ranges-examined][=].valueRange.low = 15 UCUM#{Exon} "Exon"
* component[ranges-examined][=].valueRange.high = 15 UCUM#{Exon} "Exon"
* component[ranges-examined][+].code = LNC#51959-5 "Range(s) of DNA sequence examined"
* component[ranges-examined][=].valueRange.low = 582 UCUM#{Codon} "Codon"
* component[ranges-examined][=].valueRange.high = 612 UCUM#{Codon} "Codon"
* component[genomic-ref-seq].code = LNC#48013-7 "Genomic reference sequence [ID]"
* component[genomic-ref-seq].valueCodeableConcept = RefSeq#NM_004333.4

Instance: mii-exa-molgen-untersuchte-region-2-nipbl
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region NIPBL"
Description: "Beispiel für untersuchte Region NIPBL Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/region-studied"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = LNC#53041-0 "DNA region of interest panel"
* subject = Reference(mii-exa-molgen-patient-2)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* method = LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-2)
* device = Reference(mii-exa-molgen-device-sequencer-2)
* component[gene-studied].code = LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = HGNC#HGNC:28862 "NIPBL"
* component[region-description].code = LNC#81293-3 "Description of ranges of DNA sequences examined"
* component[region-description].valueString = "Analyse aller kodierenden Exons der zu untersuchenden Gene einschließlich flankierender intronischer Regionen (mindestens von -3 bis +8)."
* component[genomic-ref-seq].code = LNC#48013-7 "Genomic reference sequence [ID]"
* component[genomic-ref-seq].valueCodeableConcept = RefSeq#NM_133433.4

Instance: mii-exa-molgen-untersuchte-region-2-hdac8
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region HDAC8"
Description: "Beispiel für untersuchte Region HDAC8 Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/region-studied"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = LNC#53041-0 "DNA region of interest panel"
* subject = Reference(mii-exa-molgen-patient-2)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* method = LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-2)
* device = Reference(mii-exa-molgen-device-sequencer-2)
* component[conclusion-string].code = GenTbd#conclusion-string
* component[conclusion-string].valueString = "Keine pathogene Variante identifiziert."
* component[gene-studied].code = LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = HGNC#HGNC:13315 "HDAC8"
* component[region-description].code = LNC#81293-3 "Description of ranges of DNA sequences examined"
* component[region-description].valueString = "Analyse aller kodierenden Exons der zu untersuchenden Gene einschließlich flankierender intronischer Regionen (mindestens von -3 bis +8)."
* component[genomic-ref-seq].code = LNC#48013-7 "Genomic reference sequence [ID]"
* component[genomic-ref-seq].valueCodeableConcept = RefSeq#NM_078486.2

Instance: mii-exa-molgen-untersuchte-region-2-rad21
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region HDAC8"
Description: "Beispiel für untersuchte Region RAD21 Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/region-studied"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = LNC#53041-0 "DNA region of interest panel"
* subject = Reference(mii-exa-molgen-patient-2)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* method = LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-2)
* device = Reference(mii-exa-molgen-device-sequencer-2)
* component[conclusion-string].code = GenTbd#conclusion-string
* component[conclusion-string].valueString = "Keine pathogene Variante identifiziert."
* component[gene-studied].code = LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = HGNC#HGNC:9811 "RAD21"
* component[region-description].code = LNC#81293-3 "Description of ranges of DNA sequences examined"
* component[region-description].valueString = "Analyse aller kodierenden Exons der zu untersuchenden Gene einschließlich flankierender intronischer Regionen (mindestens von -3 bis +8)."
* component[genomic-ref-seq].code = LNC#48013-7 "Genomic reference sequence [ID]"
* component[genomic-ref-seq].valueCodeableConcept = RefSeq#NM_006265.2

Instance: mii-exa-molgen-untersuchte-region-2-smc1a
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region SMC1A"
Description: "Beispiel für untersuchte Region SMC1A Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/region-studied"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = LNC#53041-0 "DNA region of interest panel"
* subject = Reference(mii-exa-molgen-patient-2)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* method = LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-2)
* device = Reference(mii-exa-molgen-device-sequencer-2)
* component[conclusion-string].code = GenTbd#conclusion-string
* component[conclusion-string].valueString = "Keine pathogene Variante identifiziert."
* component[gene-studied].code = LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = HGNC#HGNC:11111 "SMC1A"
* component[region-description].code = LNC#81293-3 "Description of ranges of DNA sequences examined"
* component[region-description].valueString = "Analyse aller kodierenden Exons der zu untersuchenden Gene einschließlich flankierender intronischer Regionen (mindestens von -3 bis +8)."
* component[genomic-ref-seq].code = LNC#48013-7 "Genomic reference sequence [ID]"
* component[genomic-ref-seq].valueCodeableConcept = RefSeq#NM_006306.3

Instance: mii-exa-molgen-untersuchte-region-2-smc3
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region SMC3"
Description: "Beispiel für untersuchte Region SMC3 Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/region-studied"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = LNC#53041-0 "DNA region of interest panel"
* subject = Reference(mii-exa-molgen-patient-2)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* method = LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-2)
* device = Reference(mii-exa-molgen-device-sequencer-2)
* component[conclusion-string].code = GenTbd#conclusion-string
* component[conclusion-string].valueString = "Keine pathogene Variante identifiziert."
* component[gene-studied].code = LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = HGNC#HGNC:2468 "SMC3"
* component[region-description].code = LNC#81293-3 "Description of ranges of DNA sequences examined"
* component[region-description].valueString = "Analyse aller kodierenden Exons der zu untersuchenden Gene einschließlich flankierender intronischer Regionen (mindestens von -3 bis +8)."
* component[genomic-ref-seq].code = LNC#48013-7 "Genomic reference sequence [ID]"
* component[genomic-ref-seq].valueCodeableConcept = RefSeq#NM_005445.3

Instance: mii-exa-molgen-untersuchte-region-2-tp63
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region TP63"
Description: "Beispiel für untersuchte Region TP63 Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/region-studied"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = LNC#53041-0 "DNA region of interest panel"
* subject = Reference(mii-exa-molgen-patient-2)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* method = LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-2)
* device = Reference(mii-exa-molgen-device-sequencer-2)
* component[conclusion-string].code = GenTbd#conclusion-string
* component[conclusion-string].valueString = "Keine pathogene Variante identifiziert."
* component[gene-studied].code = LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = HGNC#HGNC:15979 "TP63"
* component[region-description].code = LNC#81293-3 "Description of ranges of DNA sequences examined"
* component[region-description].valueString = "Analyse aller kodierenden Exons der zu untersuchenden Gene einschließlich flankierender intronischer Regionen (mindestens von -3 bis +8)."
* component[genomic-ref-seq].code = LNC#48013-7 "Genomic reference sequence [ID]"
* component[genomic-ref-seq].valueCodeableConcept = RefSeq#NM_003722.4

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-ATM
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 ATM Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 ATM Gen."
* insert Region(HGNC:795, ATM, NM_000051.3)

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BRCA1
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 BRCA1 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 BRCA1 Gen."
* insert Region(HGNC:1100, BRCA1, NM_007294.3)

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BARD1
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 BARD1 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 BARD1 Gen."
* insert Region(HGNC:952, BARD1, NM_000465.3)


Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BRCA2
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 BRCA2 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 BRCA2 Gen."
* insert Region(HGNC:1101, BRCA2, NM_000059.3)

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-BRIP1
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 BRIP1 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 BRIP1 Gen."
* insert Region(HGNC:20473, BRIP1, NM_032043.2)


Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-CDH1
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 CDH1 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 CDH1 Gen."
* insert Region(HGNC:1748, CDH1, NM_004360.3)


Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-CHECK2
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 CHECK2 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 CHECK2 Gen."
* insert Region(HGNC:16627, CHECK2, NM_007194.3)

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-MLH1
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 MLH1 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 MLH1 Gen."
* insert Region(HGNC:7127, MLH1, NM_000249.3) 

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-MSH2
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 MSH2 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 MSH2 Gen."
* insert Region(HGNC:7325, MSH2, NM_000251.2)

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-MSH6
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 MSH6 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 MSH6 Gen."
* insert Region(HGNC:7329, MSH6, NM_000179.2)

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-PALB2
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 PALB2 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 PALB2 Gen."
* insert Region(HGNC:26144, PALB2, NM_024675.3)

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-PMS2
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 PMS2 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 PMS2 Gen."
* insert Region(HGNC:9122, PMS2, NM_000535.5)

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-PTEN
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 PTEN Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 PTEN Gen."
* insert Region(HGNC:9588, PTEN, NM_000314.4)

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-RAD51C
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 RAD51C Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 RAD51C Gen."
* insert Region(HGNC:9820, RAD51C, NM_058216.2)

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-RAD51D
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 RAD51D Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 RAD51D Gen."
* insert Region(HGNC:9823, RAD51D, NM_002878.3)

Instance: mii-exa-molgen-untersuchte-region-true-risk-panel-v3-TP53
InstanceOf: mii-pr-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region True Risk Panel V3 TP53 Gen"
Description: "Beispiel für untersuchte Region True Risk Panel V3 TP53 Gen."
* insert Region(HGNC:11998, TP53, NM_000546.5)
