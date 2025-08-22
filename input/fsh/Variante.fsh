Profile: MII_PR_MolGen_Variante
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant
Id: mii-pr-molgen-variante
Title: "MII PR MolGen Variante"
Description: "Dieses Profil ermöglicht eine vollständige Beschreibung der gefundenen Variante unter Verwendung von Eigenschaften aus einer Vielzahl von Testmethoden."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
* status MS
* category MS
* code MS
* subject 1.. MS
* subject only Reference(Patient or Group)
* value[x] MS
* method MS
* specimen MS
* device MS
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains dna-region 0..* and gene-fusion 0..1 and detection-limit 0..1
* component[conclusion-string] MS
* component[gene-studied] MS
* component[cytogenetic-location] MS
* component[reference-sequence-assembly] MS
* component[representative-coding-hgvs] MS
* component[genomic-hgvs] MS
//* component[cytogenomic-nomenclature] MS
* component[genomic-ref-seq] MS
* component[representative-transcript-ref-seq] MS
* component[exact-start-end] MS
* component[inner-start-end] MS
* component[outer-start-end] MS
//* component[coordinate-system] MS
* component[ref-allele] MS
* component[alt-allele] MS
* component[coding-change-type] MS
* component[genomic-source-class] MS
* component[sample-allelic-frequency] MS
* component[allelic-read-depth] MS
* component[allelic-state] MS
* component[variant-inheritance] MS
* component[variation-code] MS
* component[chromosome-identifier] MS
* component[representative-protein-hgvs] MS
//* component[amino-acid-change-type] MS
//* component[molecular-consequence] MS
* component[copy-number] MS
* component[variant-confidence-status] MS
* component[dna-region] MS
* component[dna-region].code = $LNC#47999-8
* component[dna-region].code ^short = "47999-8"
* component[dna-region] ^short = "DNA region name [Identifier]"
* component[dna-region] ^definition = "A human readable name for the region of interest. Typically Exon #, Intron # or other."
* component[dna-region].value[x] only string
* component[dna-region].value[x] 1..1
* component[gene-fusion] MS
* component[gene-fusion].code = $LNC#95123-6
* component[gene-fusion] ^short = "Gene fusion transcript details in Blood or Tissue by Molecular genetics method Narrative"
* component[gene-fusion].value[x] only CodeableConcept 
* component[gene-fusion].value[x] ^short = "HGNC recommends for products of gene translocations or fusions (format GENESYMBOL1::GENESYMBOL2) and readthrough transcripts (format GENESYMBOL1-GENESYMBOL2)"
* component[gene-fusion].value[x] 1..1
* component[gene-fusion].value[x] from http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgnc-vs (extensible)
* component[detection-limit] MS
* component[detection-limit].code = $LNC#87706-8
* component[detection-limit] ^short = "Laboratory device Detection limit"
* component[detection-limit].value[x] only Quantity
* component[detection-limit].value[x] ^short = "Usually reported as percentage."


Mapping: MolGen-Variante
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_Variante
* component[gene-studied] -> "mide-dataelement-1400" "Getestete Gene ID"

Instance: mii-exa-molgen-variante-1
InstanceOf: mii-pr-molgen-variante
Usage: #example
Title: "BRAF Variante"
Description: "Beispiel für genetische Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant"
* basedOn = Reference(mii-exa-molgen-anforderung-1)
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#69548-6 "Genetic variant assessment"
* subject = Reference(mii-exa-molgen-patient)
* valueCodeableConcept = $LNC#LA9633-4 "Present"
* method = $LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-1)
* device = Reference(mii-exa-molgen-device-sequencer)
//* derivedFrom = Reference(mii-exa-molgen-untersuchte-region-1)
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:1097 "BRAF"
* component[genomic-ref-seq].code = $LNC#48013-7 "Genomic reference sequence [ID]"
* component[genomic-ref-seq].valueCodeableConcept = $RefSeq#NM_004333.4
* component[dna-region][+].code = $LNC#47999-8 "DNA region name [Identifier]"
* component[dna-region][=].valueString = "Exon #15"
* component[dna-region][+].code = $LNC#47999-8 "DNA region name [Identifier]"
* component[dna-region][=].valueString = "Codon #582 - #612"
* component[representative-coding-hgvs].code = $LNC#48004-6 "DNA change (c.HGVS)"
* component[representative-coding-hgvs].valueCodeableConcept = $HGVS#NM_004333.4:c.1799T>A
* component[representative-protein-hgvs].code = $LNC#48005-3 "Amino acid change (pHGVS)"
* component[representative-protein-hgvs].valueCodeableConcept = $HGVS#p.(Val600Glu)
* component[sample-allelic-frequency].code = $LNC#81258-6 "Sample variant allelic frequency [NFr]"
* component[sample-allelic-frequency].valueQuantity = 30.25 '%'
* component[cytogenetic-location].code = $LNC#48001-2 "Cytogenetic (chromosome) location"
* component[cytogenetic-location].valueCodeableConcept = $ChromLoc#7q34
* component[coding-change-type].code = $LNC#48019-4 "DNA change type"
* component[coding-change-type].valueCodeableConcept = $SO#SO:1000008 "point_mutation"
//* component[amino-acid-change-type].code = $LNC#48006-1 "Amino acid change [Type]"
//* component[amino-acid-change-type].valueCodeableConcept = $LNC#LA6698-0 "Missense"
* component[variation-code].code = $LNC#81252-9 "Discrete genetic variant"
* component[variation-code].valueCodeableConcept = $dbSNP#rs113488022

Instance: mii-exa-molgen-variante-2
InstanceOf: mii-pr-molgen-variante
Usage: #example
Title: "NIPBL Variante"
Description: "Beispiel für genetische Variante im NIPBL Gen an Hand von WGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant"
* basedOn = Reference(mii-exa-molgen-anforderung-2)
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#69548-6 "Genetic variant assessment"
* subject = Reference(mii-exa-molgen-patient-2)
* valueCodeableConcept = $LNC#LA9633-4 "Present"
* method.coding[0] = $LNC#LA26398-0 "Sequencing"
* method.coding[1] = $LNC#86206-0 "Whole genome sequence analysis in Blood or Tissue by Molecular genetics method"
* specimen = Reference(mii-exa-molgen-specimen-2)
* device = Reference(mii-exa-molgen-device-sequencer-2)
//* derivedFrom = Reference(mii-exa-molgen-untersuchte-region-1)
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:28862 "NIPBL"
* component[representative-transcript-ref-seq].valueCodeableConcept = $RefSeq#NM_133433.4
* component[dna-region][+].code = $LNC#47999-8 "DNA region name [Identifier]"
* component[dna-region][=].valueString = "Exon #10"
* component[representative-coding-hgvs].code = $LNC#48004-6 "DNA change (c.HGVS)"
* component[representative-coding-hgvs].valueCodeableConcept = $HGVS#NM_133433.4:c.2207del
* component[representative-protein-hgvs].code = $LNC#48005-3 "Amino acid change (pHGVS)"
* component[representative-protein-hgvs].valueCodeableConcept = $HGVS#p.(Pro736Glnfs*58)
* component[allelic-state].code = $LNC#53034-5 "Allelic state"
* component[allelic-state].valueCodeableConcept = $LNC#LA6706-1 "Heterozygous"
* component[coding-change-type].code = $LNC#48019-4 "DNA change type"
* component[coding-change-type].valueCodeableConcept = $SO#SO:0000159 "Deletion"
//* component[amino-acid-change-type].code = $LNC#48006-1 "Amino acid change [Type]"
//* component[amino-acid-change-type].valueCodeableConcept = $LNC#LA6694-9 "Frameshift"
* component[cytogenetic-location].code = $LNC#48001-2 "Cytogenetic (chromosome) location"
* component[cytogenetic-location].valueCodeableConcept = $ChromLoc#5p13.2
* component[variation-code].code = $LNC#81252-9 "Discrete genetic variant"
* component[variation-code].valueCodeableConcept.coding[0] = $ClinVarVID#1076298
* component[variation-code].valueCodeableConcept.coding[1] = $ClinVarVID#VCV001076298.1

// CNV
Instance: mii-exa-molgen-variante-cnv-4
InstanceOf: mii-pr-molgen-variante
Usage: #example
Title: "Variante SMO CNV"
Description: "Beispiel für genetische Copy Number Variante SMO Gen."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant"
//* basedOn = Reference(mii-exa-molgen-anforderung-2)
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#69548-6 "Genetic variant assessment"
* subject = Reference(mii-exa-molgen-patient-2)
* valueCodeableConcept = $LNC#LA9633-4 "Present"
* method.coding[0] = $LNC#LA26398-0 "Sequencing"
* method.text = "Analysepipeline XXX, Auswertungssoftware XXX, Prozessierungssystem XXX"
//* method.coding[1] = $LNC#86206-0 "Whole genome sequence analysis in Blood or Tissue by Molecular genetics method"
//* specimen = Reference(mii-exa-molgen-specimen-2)
//* device = Reference(mii-exa-molgen-device-sequencer-2)
//* derivedFrom = Reference(mii-exa-molgen-untersuchte-region-1)
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:11119 "SMO"
* component[coding-change-type].valueCodeableConcept = $SO#SO:0001742 "copy_number_gain"
* component[copy-number].valueQuantity = 6 $UCUM#1 "1"
* component[dna-region].valueString = "Ex 1-10"
* component[chromosome-identifier].valueCodeableConcept = $LNC#LA21260-7 "Chromosome 7"
* component[cytogenetic-location].valueCodeableConcept = $ChromLoc#7q32.1
* component[sample-allelic-frequency].valueQuantity = 55 $UCUM#% "%"
//* component[molecular-consequence].valueCodeableConcept = $SO#SO:0001458 "unigene_cluster"
* component[detection-limit].valueQuantity.value = 95 
* component[detection-limit].valueQuantity.comparator = #>
* component[detection-limit].valueQuantity.unit = "%"
* component[detection-limit].valueQuantity.system = "http://unitsofmeasure.org"
* component[detection-limit].valueQuantity.code = #%
// cluster?

// 04 docx
// https://www.ncbi.nlm.nih.gov/clinvar/RCV000119097.19/
Instance: mii-exa-molgen-variante-brca1
InstanceOf: mii-pr-molgen-variante
Usage: #example
Title: "Variante BRCA1"
Description: "Beispiel für genetische Variante BRCA1"
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant"
* basedOn = Reference(mii-exa-molgen-anforderung-trurisk-panel)
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#69548-6 "Genetic variant assessment"
* subject = Reference(mii-exa-molgen-patient-brca1)
* valueCodeableConcept = $LNC#LA9633-4 "Present"
* method.coding[0] = $LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-brca1)
* device = Reference(mii-exa-molgen-device-sequencer-nextseq)
//* derivedFrom = Reference(mii-exa-molgen-untersuchte-region-1)
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:1100 "BRCA1"
* component[cytogenetic-location].valueCodeableConcept = $ChromLoc#17q21.31
* component[representative-coding-hgvs].valueCodeableConcept = $HGVS#NM_007294.3:c.5266dupC
* component[representative-transcript-ref-seq].valueCodeableConcept = $RefSeq#NM_007294.3
* component[coding-change-type].valueCodeableConcept = $SO#SO:1000035 "Duplication"
* component[allelic-read-depth].valueQuantity = 50 $UCUM#1 "Abdeckung der Fragmente"
* component[variation-code].valueCodeableConcept = $dbSNP#rs80357906
* component[chromosome-identifier].valueCodeableConcept = $LNC#LA21270-6 "Chromosome 17"
* component[representative-protein-hgvs].valueCodeableConcept = $HGVS#p.Gln1756Profs 
//* component[amino-acid-change-type].valueCodeableConcept = $LNC#LA6694-9 "Frameshift"
* component[detection-limit].valueQuantity.value = 95 
* component[detection-limit].valueQuantity.comparator = #>
* component[detection-limit].valueQuantity.unit = "%"
* component[detection-limit].valueQuantity.system = "http://unitsofmeasure.org"
* component[detection-limit].valueQuantity.code = #%



