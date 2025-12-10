Profile: MII_PR_MolGen_Variante
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant
Id: mii-pr-molgen-variante
Title: "MII PR MolGen Variante"
Description: "Dieses Profil ermöglicht eine vollständige Beschreibung der gefundenen Variante unter Verwendung von Eigenschaften aus einer Vielzahl von Testmethoden."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"

// MS elements with German translations
* status MS
* status ^short = "Status"
* status ^definition = "Status der Beobachtung"
* insert Translation(status ^short, de-DE, Status)
* insert Translation(status ^definition, de-DE, Status der Beobachtung)

* category MS
* category ^short = "Kategorie"
* category ^definition = "Klassifizierung der Beobachtungsart"
* insert Translation(category ^short, de-DE, Kategorie)
* insert Translation(category ^definition, de-DE, Klassifizierung der Beobachtungsart)

* code MS
* code ^short = "Code"
* code ^definition = "Code zur Identifizierung der Varianten-Beobachtung"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^definition, de-DE, Code zur Identifizierung der Varianten-Beobachtung)

* subject 1.. MS
* subject only Reference(Patient or Group)
* subject ^short = "Patient oder Proband"
* subject ^definition = "Der Patient oder die Gruppe auf die sich die Variante bezieht"
* insert Translation(subject ^short, de-DE, Patient oder Proband)
* insert Translation(subject ^definition, de-DE, Der Patient oder die Gruppe auf die sich die Variante bezieht)

* effective[x] MS
* effective[x] ^short = "Zeitpunkt der Beobachtung"
* effective[x] ^definition = "Klinisch relevanter Zeitpunkt oder Zeitraum der Beobachtung"
* insert Translation(effective[x] ^short, de-DE, Zeitpunkt der Beobachtung)
* insert Translation(effective[x] ^definition, de-DE, Klinisch relevanter Zeitpunkt oder Zeitraum der Beobachtung)

* issued MS
* issued ^short = "Freigabedatum"
* issued ^definition = "Datum und Uhrzeit der Freigabe der Beobachtung"
* insert Translation(issued ^short, de-DE, Freigabedatum)
* insert Translation(issued ^definition, de-DE, Datum und Uhrzeit der Freigabe der Beobachtung)

* value[x] MS
* value[x] ^short = "Ergebniswert"
* value[x] ^definition = "Das Ergebnis der Variantenanalyse - vorhanden oder abwesend"
* insert Translation(value[x] ^short, de-DE, Ergebniswert)
* insert Translation(value[x] ^definition, de-DE, Das Ergebnis der Variantenanalyse - vorhanden oder abwesend)

* method MS
* method ^short = "Methode"
* method ^definition = "Die verwendete Untersuchungsmethode"
* insert Translation(method ^short, de-DE, Methode)
* insert Translation(method ^definition, de-DE, Die verwendete Untersuchungsmethode)

* specimen MS
* specimen ^short = "Probe"
* specimen ^definition = "Die untersuchte Probe"
* insert Translation(specimen ^short, de-DE, Probe)
* insert Translation(specimen ^definition, de-DE, Die untersuchte Probe)

* device MS
* device ^short = "Gerät"
* device ^definition = "Das verwendete Analysegerät"
* insert Translation(device ^short, de-DE, Gerät)
* insert Translation(device ^definition, de-DE, Das verwendete Analysegerät)

* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains dna-region 0..* and gene-fusion 0..1 and detection-limit 0..1

* component[conclusion-string] MS
* component[conclusion-string] ^short = "Schlussfolgerung - Text"
* component[conclusion-string] ^definition = "Textuelle Zusammenfassung oder Schlussfolgerung zur Variante"
* insert Translation(component[conclusion-string] ^short, de-DE, Schlussfolgerung - Text)
* insert Translation(component[conclusion-string] ^definition, de-DE, Textuelle Zusammenfassung oder Schlussfolgerung zur Variante)

* component[gene-studied] MS
* component[gene-studied] ^short = "Untersuchtes Gen"
* component[gene-studied] ^definition = "Das untersuchte Gen identifiziert durch HGNC-ID"
* insert Translation(component[gene-studied] ^short, de-DE, Untersuchtes Gen)
* insert Translation(component[gene-studied] ^definition, de-DE, Das untersuchte Gen identifiziert durch HGNC-ID)

* component[cytogenetic-location] MS
* component[cytogenetic-location] ^short = "Zytogenetische Lokalisation"
* component[cytogenetic-location] ^definition = "Chromosomale Position der Variante in Bandennomenklatur"
* insert Translation(component[cytogenetic-location] ^short, de-DE, Zytogenetische Lokalisation)
* insert Translation(component[cytogenetic-location] ^definition, de-DE, Chromosomale Position der Variante in Bandennomenklatur)

* component[reference-sequence-assembly] MS
* component[reference-sequence-assembly] ^short = "Referenzgenom-Assembly"
* component[reference-sequence-assembly] ^definition = "Die verwendete Referenzgenom-Version wie z.B. GRCh37 oder GRCh38"
* insert Translation(component[reference-sequence-assembly] ^short, de-DE, Referenzgenom-Assembly)
* insert Translation(component[reference-sequence-assembly] ^definition, de-DE, Die verwendete Referenzgenom-Version wie z.B. GRCh37 oder GRCh38)

* component[representative-coding-hgvs] MS
* component[representative-coding-hgvs] ^short = "DNA-Änderung c.HGVS"
* component[representative-coding-hgvs] ^definition = "Die cDNA-Änderung in HGVS-Nomenklatur auf Transkriptebene"
* insert Translation(component[representative-coding-hgvs] ^short, de-DE, DNA-Änderung c.HGVS)
* insert Translation(component[representative-coding-hgvs] ^definition, de-DE, Die cDNA-Änderung in HGVS-Nomenklatur auf Transkriptebene)

* component[genomic-hgvs] MS
* component[genomic-hgvs] ^short = "Genomische DNA-Änderung g.HGVS"
* component[genomic-hgvs] ^definition = "Die genomische DNA-Änderung in HGVS-Nomenklatur"
* insert Translation(component[genomic-hgvs] ^short, de-DE, Genomische DNA-Änderung g.HGVS)
* insert Translation(component[genomic-hgvs] ^definition, de-DE, Die genomische DNA-Änderung in HGVS-Nomenklatur)

//* component[cytogenomic-nomenclature] MS
* component[genomic-ref-seq] MS
* component[genomic-ref-seq] ^short = "Genomische Referenzsequenz"
* component[genomic-ref-seq] ^definition = "Die genomische Referenzsequenz-ID wie z.B. NC_000007.14"
* insert Translation(component[genomic-ref-seq] ^short, de-DE, Genomische Referenzsequenz)
* insert Translation(component[genomic-ref-seq] ^definition, de-DE, Die genomische Referenzsequenz-ID wie z.B. NC_000007.14)

* component[representative-transcript-ref-seq] MS
* component[representative-transcript-ref-seq] ^short = "Transkript-Referenzsequenz"
* component[representative-transcript-ref-seq] ^definition = "Die Transkript-Referenzsequenz-ID wie z.B. NM_004333.4"
* insert Translation(component[representative-transcript-ref-seq] ^short, de-DE, Transkript-Referenzsequenz)
* insert Translation(component[representative-transcript-ref-seq] ^definition, de-DE, Die Transkript-Referenzsequenz-ID wie z.B. NM_004333.4)

* component[exact-start-end] MS
* component[exact-start-end] ^short = "Exakte Start-End-Position"
* component[exact-start-end] ^definition = "Die exakten genomischen Koordinaten der Variante - Start und Ende"
* insert Translation(component[exact-start-end] ^short, de-DE, Exakte Start-End-Position)
* insert Translation(component[exact-start-end] ^definition, de-DE, Die exakten genomischen Koordinaten der Variante - Start und Ende)

* component[inner-start-end] MS
* component[inner-start-end] ^short = "Innere Start-End-Position"
* component[inner-start-end] ^definition = "Der innere Bereich bei strukturellen Varianten"
* insert Translation(component[inner-start-end] ^short, de-DE, Innere Start-End-Position)
* insert Translation(component[inner-start-end] ^definition, de-DE, Der innere Bereich bei strukturellen Varianten)

* component[outer-start-end] MS
* component[outer-start-end] ^short = "Äußere Start-End-Position"
* component[outer-start-end] ^definition = "Der äußere Bereich bei strukturellen Varianten"
* insert Translation(component[outer-start-end] ^short, de-DE, Äußere Start-End-Position)
* insert Translation(component[outer-start-end] ^definition, de-DE, Der äußere Bereich bei strukturellen Varianten)

//* component[coordinate-system] MS
* component[ref-allele] MS
* component[ref-allele] ^short = "Referenz-Allel"
* component[ref-allele] ^definition = "Die Nukleotidsequenz des Referenz-Allels"
* insert Translation(component[ref-allele] ^short, de-DE, Referenz-Allel)
* insert Translation(component[ref-allele] ^definition, de-DE, Die Nukleotidsequenz des Referenz-Allels)

* component[alt-allele] MS
* component[alt-allele] ^short = "Alternatives Allel"
* component[alt-allele] ^definition = "Die Nukleotidsequenz des alternativen - mutierten - Allels"
* insert Translation(component[alt-allele] ^short, de-DE, Alternatives Allel)
* insert Translation(component[alt-allele] ^definition, de-DE, Die Nukleotidsequenz des alternativen - mutierten - Allels)

* component[coding-change-type] MS
* component[coding-change-type] ^short = "DNA-Änderungstyp"
* component[coding-change-type] ^definition = "Der Typ der DNA-Änderung wie z.B. Substitution oder Deletion"
* insert Translation(component[coding-change-type] ^short, de-DE, DNA-Änderungstyp)
* insert Translation(component[coding-change-type] ^definition, de-DE, Der Typ der DNA-Änderung wie z.B. Substitution oder Deletion)

* component[genomic-source-class] MS
* component[genomic-source-class] ^short = "Genomische Herkunftsklasse"
* component[genomic-source-class] ^definition = "Die Herkunft der Variante wie z.B. somatisch oder Keimbahn"
* insert Translation(component[genomic-source-class] ^short, de-DE, Genomische Herkunftsklasse)
* insert Translation(component[genomic-source-class] ^definition, de-DE, Die Herkunft der Variante wie z.B. somatisch oder Keimbahn)

* component[sample-allelic-frequency] MS
* component[sample-allelic-frequency] ^short = "Allelfrequenz in der Probe"
* component[sample-allelic-frequency] ^definition = "Die Häufigkeit des varianten Allels in der untersuchten Probe"
* insert Translation(component[sample-allelic-frequency] ^short, de-DE, Allelfrequenz in der Probe)
* insert Translation(component[sample-allelic-frequency] ^definition, de-DE, Die Häufigkeit des varianten Allels in der untersuchten Probe)

* component[allelic-read-depth] MS
* component[allelic-read-depth] ^short = "Allelische Lesetiefe"
* component[allelic-read-depth] ^definition = "Die Anzahl der Reads die das Allel unterstützen"
* insert Translation(component[allelic-read-depth] ^short, de-DE, Allelische Lesetiefe)
* insert Translation(component[allelic-read-depth] ^definition, de-DE, Die Anzahl der Reads die das Allel unterstützen)

* component[allelic-state] MS
* component[allelic-state] ^short = "Allelstatus"
* component[allelic-state] ^definition = "Der Allelstatus wie z.B. heterozygot oder homozygot"
* insert Translation(component[allelic-state] ^short, de-DE, Allelstatus)
* insert Translation(component[allelic-state] ^definition, de-DE, Der Allelstatus wie z.B. heterozygot oder homozygot)

* component[variant-inheritance] MS
* component[variant-inheritance] ^short = "Varianten-Vererbung"
* component[variant-inheritance] ^definition = "Die Vererbungsart der Variante wie z.B. maternal oder paternal"
* insert Translation(component[variant-inheritance] ^short, de-DE, Varianten-Vererbung)
* insert Translation(component[variant-inheritance] ^definition, de-DE, Die Vererbungsart der Variante wie z.B. maternal oder paternal)

* component[variation-code] MS
* component[variation-code] ^short = "Varianten-Code"
* component[variation-code] ^definition = "Eindeutiger Identifikator der Variante aus externen Datenbanken wie z.B. ClinVar oder dbSNP"
* insert Translation(component[variation-code] ^short, de-DE, Varianten-Code)
* insert Translation(component[variation-code] ^definition, de-DE, Eindeutiger Identifikator der Variante aus externen Datenbanken wie z.B. ClinVar oder dbSNP)

* component[chromosome-identifier] MS
* component[chromosome-identifier] ^short = "Chromosom"
* component[chromosome-identifier] ^definition = "Das betroffene Chromosom"
* insert Translation(component[chromosome-identifier] ^short, de-DE, Chromosom)
* insert Translation(component[chromosome-identifier] ^definition, de-DE, Das betroffene Chromosom)

* component[representative-protein-hgvs] MS
* component[representative-protein-hgvs] ^short = "Aminosäure-Änderung p.HGVS"
* component[representative-protein-hgvs] ^definition = "Die Aminosäure-Änderung in HGVS-Nomenklatur auf Proteinebene"
* insert Translation(component[representative-protein-hgvs] ^short, de-DE, Aminosäure-Änderung p.HGVS)
* insert Translation(component[representative-protein-hgvs] ^definition, de-DE, Die Aminosäure-Änderung in HGVS-Nomenklatur auf Proteinebene)

//* component[amino-acid-change-type] MS
//* component[molecular-consequence] MS
* component[copy-number] MS
* component[copy-number] ^short = "Kopienzahl"
* component[copy-number] ^definition = "Die Anzahl der Kopien eines genomischen Abschnitts"
* insert Translation(component[copy-number] ^short, de-DE, Kopienzahl)
* insert Translation(component[copy-number] ^definition, de-DE, Die Anzahl der Kopien eines genomischen Abschnitts)

* component[variant-confidence-status] MS
* component[variant-confidence-status] ^short = "Konfidenzstatus der Variante"
* component[variant-confidence-status] ^definition = "Der Vertrauensstatus der Variantendetektion"
* insert Translation(component[variant-confidence-status] ^short, de-DE, Konfidenzstatus der Variante)
* insert Translation(component[variant-confidence-status] ^definition, de-DE, Der Vertrauensstatus der Variantendetektion)

* component[dna-region] MS
* component[dna-region].code = $LNC#47999-8
* component[dna-region].code ^short = "47999-8"
* component[dna-region] ^short = "DNA-Regionsname"
* component[dna-region] ^definition = "Ein lesbarer Name für die untersuchte Region. Typischerweise Exon # oder Intron # oder andere."
* insert Translation(component[dna-region] ^short, de-DE, DNA-Regionsname)
* insert Translation(component[dna-region] ^definition, de-DE, Ein lesbarer Name für die untersuchte Region. Typischerweise Exon # oder Intron # oder andere.)
* component[dna-region].value[x] only string
* component[dna-region].value[x] 1..1

* component[gene-fusion] MS
* component[gene-fusion].code = $LNC#95123-6
* component[gene-fusion] ^short = "Genfusion"
* component[gene-fusion] ^definition = "Details zur Genfusion in Blut oder Gewebe mittels molekulargenetischer Methode"
* insert Translation(component[gene-fusion] ^short, de-DE, Genfusion)
* insert Translation(component[gene-fusion] ^definition, de-DE, Details zur Genfusion in Blut oder Gewebe mittels molekulargenetischer Methode)
* component[gene-fusion].value[x] only CodeableConcept
* component[gene-fusion].value[x] ^short = "HGNC-Format für Genfusionen GENESYMBOL1::GENESYMBOL2 und Readthrough-Transkripte GENESYMBOL1-GENESYMBOL2"
* insert Translation(component[gene-fusion].value[x] ^short, de-DE, HGNC-Format für Genfusionen GENESYMBOL1::GENESYMBOL2 und Readthrough-Transkripte GENESYMBOL1-GENESYMBOL2)
* component[gene-fusion].value[x] 1..1
* component[gene-fusion].value[x] from http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgnc-vs (extensible)

* component[detection-limit] MS
* component[detection-limit].code = $LNC#87706-8
* component[detection-limit] ^short = "Nachweisgrenze"
* component[detection-limit] ^definition = "Die Nachweisgrenze des Laborgeräts"
* insert Translation(component[detection-limit] ^short, de-DE, Nachweisgrenze)
* insert Translation(component[detection-limit] ^definition, de-DE, Die Nachweisgrenze des Laborgeräts)
* component[detection-limit].value[x] only Quantity
* component[detection-limit].value[x] ^short = "Wird üblicherweise als Prozentsatz angegeben"
* insert Translation(component[detection-limit].value[x] ^short, de-DE, Wird üblicherweise als Prozentsatz angegeben)


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
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante)
* meta.profile[+] = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant|3.0.0"
* basedOn = Reference(mii-exa-molgen-anforderung-1)
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#69548-6 "Genetic variant assessment"
* subject = Reference(mii-exa-molgen-patient)
* effectiveDateTime = "2022-04-07"
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
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante)
* meta.profile[+] = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant|3.0.0"
* basedOn = Reference(mii-exa-molgen-anforderung-2)
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#69548-6 "Genetic variant assessment"
* subject = Reference(mii-exa-molgen-patient-2)
* effectiveDateTime = "2022-03-16"
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
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante)
* meta.profile[+] = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant|3.0.0"
//* basedOn = Reference(mii-exa-molgen-anforderung-2)
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#69548-6 "Genetic variant assessment"
* subject = Reference(mii-exa-molgen-patient-2)
* effectiveDateTime = "2022-03-16"
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
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante)
* meta.profile[+] = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant|3.0.0"
* basedOn = Reference(mii-exa-molgen-anforderung-trurisk-panel)
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#69548-6 "Genetic variant assessment"
* subject = Reference(mii-exa-molgen-patient-brca1)
* effectiveDateTime = "2022-11-01"
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



