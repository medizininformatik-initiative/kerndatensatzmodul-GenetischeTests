Profile: SD_MII_MolGen_Variante
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant
Id: sd-mii-molgen-variante
Title: "SD MII MolGen Variante"
Description: "Dieses Profil ermöglicht eine vollständige Beschreibung der gefundenen Variante unter Verwendung von Eigenschaften aus einer Vielzahl von Testmethoden."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains dna-region 0..*
* component[dna-region].code = LNC#47999-8
* component[dna-region].code ^short = "47999-8"
* component[dna-region] ^short = "DNA region name [Identifier]"
* component[dna-region] ^definition = "A human readable name for the region of interest. Typically Exon #, Intron # or other."
* component[dna-region].value[x] only string
* component[dna-region].value[x] 1..1

Mapping: MolGen-Variante
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_Variante

Instance: example-mii-molgen-variante-1
InstanceOf: sd-mii-molgen-variante
Usage: #example
Title: "BRAF Variante"
Description: "Beispiel für genetische Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant"
* status = #final
* category = ObsCat#laboratory "Laboratory"
* code = LNC#69548-6 "Genetic variant assessment"
* subject = Reference(Patient/example)
* valueCodeableConcept = LNC#LA9633-4 "Present"
* method = LNC#LA26398-0 "Sequencing"
* specimen = Reference(Specimen/tbd)
* device = Reference(Device/MiSeq)
* component[gene-studied].code = LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = HGNC#HGNC:1097 "BRAF"
* component[genomic-ref-seq].code = LNC#48013-7 "Genomic reference sequence [ID]"
* component[genomic-ref-seq].valueCodeableConcept = RefSeq#NM_004333.4
* component[dna-region][+].code = LNC#47999-8 "DNA region name [Identifier]"
* component[dna-region][=].valueString = "Exon #15"
* component[dna-region][+].code = LNC#47999-8 "DNA region name [Identifier]"
* component[dna-region][=].valueString = "Codon #582 - #612"
* component[dna-chg].code = LNC#48004-6 "DNA change (c.HGVS)"
* component[dna-chg].valueCodeableConcept = HGVS#NM_004333.4:c.1799T>A
* component[amino-acid-chg].code = LNC#48005-3 "Amino acid change (pHGVS)"
* component[amino-acid-chg].valueCodeableConcept = HGVS#p.Val600Glu
* component[sample-allelic-frequency].code = LNC#81258-6 "Sample variant allelic frequency [NFr]"
* component[sample-allelic-frequency].valueQuantity = 30.25 '%'
* component[CytogenicLocation].code = LNC#48001-2 "Cytogenetic (chromosome) location"
* component[CytogenicLocation].valueCodeableConcept = ChromLoc#7q34
* component[dna-chg-type].code = LNC#48019-4 "DNA change type"
* component[dna-chg-type].valueCodeableConcept = SO#SO:1000008 "point_mutation"
* component[amino-acid-chg-type].code = LNC#48006-1 "Amino acid change [Type]"
* component[amino-acid-chg-type].valueCodeableConcept = LNC#LA6698-0 "Missense"
* component[variation-code].code = LNC#81252-9 "Discrete genetic variant"
* component[variation-code].valueCodeableConcept = dbSNP#rs113488022



