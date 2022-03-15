Profile: SD_MII_MolGen_UntersuchteRegion
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/region-studied
Id: sd-mii-modul-molgen-untersuchte-region
Title: "SD MII MolGen Untersuchte Region"
Description: "Dieses Profil beschreibt die Region oder die Regionen, die im Rahmen dieses Befundberichts untersucht wurden."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/untersuchte-region"
* ^status = #draft
* subject MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* component[gene-studied] MS
* component[region-coverage] MS
* component[genomic-ref-seq] MS


Mapping: MolGen-UntersuchteRegion
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_UntersuchteRegion
* component[gene-studied] -> "mide-dataelement-1400" "Getestete Gene ID"
* component[region-coverage] -> "mide-dataelement-1407" "Read depth/Coverage"
* component[genomic-ref-seq] -> "mide-dataelement-1405" "Referenzsequenz"


Instance: example-mii-molgen-untersuchte-region-1
InstanceOf: sd-mii-modul-molgen-untersuchte-region
Usage: #example
Title: "Untersuchte Region BRAF"
Description: "Beispiel für untersuchte Region BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/region-studied"
* status = #final
* category = ObsCat#laboratory "Laboratory"
* code = LNC#53041-0 "DNA region of interest panel"
* subject = Reference(Patient/example)
* performer = Reference(Practitioner/example)
* method = LNC#LA26398-0 "Sequencing"
* specimen = Reference(Specimen/tbd)
* device = Reference(Device/MiSeq)
* component[gene-studied].code = LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = HGNC#HGNC:1097 "BRAF"
* component[gene-mutations].code = LNC#36908-2 "Gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal"
* component[gene-mutations].valueCodeableConcept = HGVS#NM_004333.4:c.1799T>A
* component[region-description].code = LNC#81293-3 "Description of ranges of DNA sequences examined"
* component[region-description].valueString = "BRAF: Exon 15 (Codon 600)"
* component[ranges-examined][+].code = LNC#51959-5 "Range(s) of DNA sequence examined"
* component[ranges-examined][=].valueRange.low = 15 UCUM#{Exon} "Codon"
* component[ranges-examined][=].valueRange.high = 15 UCUM#{Exon} "Codon"
* component[ranges-examined][+].code = LNC#51959-5 "Range(s) of DNA sequence examined"
* component[ranges-examined][=].valueRange.low = 582 UCUM#{Codon} "Codon"
* component[ranges-examined][=].valueRange.high = 612 UCUM#{Codon} "Codon"
* component[genomic-ref-seq].code = LNC#48013-7 "Genomic reference sequence [ID]"
* component[genomic-ref-seq].valueCodeableConcept = RefSeq#NM_004333.4


