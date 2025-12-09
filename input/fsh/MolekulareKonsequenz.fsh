Profile: MII_PR_MolGen_MolekulareKonsequenz
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-consequence
Id: mii-pr-molgen-molekulare-konsequenz
Title: "MII PR MolGen Molekulare Konsequenz"
Description: "Dieses Profil beschreibt den Zusammenhang von bestimmten Varianten, Haplotypen oder Genotypen und bestimmten Konsequenzen auf molekularer Ebene."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekulare-konsequenz"

// MS elements with German translations
* extension[workflow-relatedArtifact] MS
* extension[workflow-relatedArtifact] ^short = "Verknüpfte Artefakte"
* extension[workflow-relatedArtifact] ^definition = "Verknüpfte Literatur oder andere Artefakte wie Zitationen"
* insert Translation(extension[workflow-relatedArtifact] ^short, de-DE, Verknüpfte Artefakte)
* insert Translation(extension[workflow-relatedArtifact] ^definition, de-DE, Verknüpfte Literatur oder andere Artefakte wie Zitationen)

* category MS
* category ^short = "Kategorie"
* category ^definition = "Klassifizierung der Beobachtungsart"
* insert Translation(category ^short, de-DE, Kategorie)
* insert Translation(category ^definition, de-DE, Klassifizierung der Beobachtungsart)

* code MS
* code ^short = "Code"
* code ^definition = "Code zur Identifizierung der molekularen Konsequenz"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^definition, de-DE, Code zur Identifizierung der molekularen Konsequenz)

* subject MS
* subject only Reference(Patient or Group)
* subject ^short = "Patient"
* subject ^definition = "Der Patient auf den sich die Beobachtung bezieht"
* insert Translation(subject ^short, de-DE, Patient)
* insert Translation(subject ^definition, de-DE, Der Patient auf den sich die Beobachtung bezieht)

* effective[x] MS
* effective[x] ^short = "Zeitpunkt der Beobachtung"
* effective[x] ^definition = "Klinisch relevanter Zeitpunkt der Beobachtung"
* insert Translation(effective[x] ^short, de-DE, Zeitpunkt der Beobachtung)
* insert Translation(effective[x] ^definition, de-DE, Klinisch relevanter Zeitpunkt der Beobachtung)

* issued MS
* issued ^short = "Freigabedatum"
* issued ^definition = "Datum und Uhrzeit der Freigabe"
* insert Translation(issued ^short, de-DE, Freigabedatum)
* insert Translation(issued ^definition, de-DE, Datum und Uhrzeit der Freigabe)

* encounter MS
* encounter ^short = "Kontakt"
* encounter ^definition = "Der Kontakt in dessen Rahmen die Beobachtung gemacht wurde"
* insert Translation(encounter ^short, de-DE, Kontakt)
* insert Translation(encounter ^definition, de-DE, Der Kontakt in dessen Rahmen die Beobachtung gemacht wurde)

* derivedFrom MS
* derivedFrom ^short = "Abgeleitet von"
* derivedFrom ^definition = "Referenzen zu den Varianten von denen diese Konsequenz abgeleitet ist"
* insert Translation(derivedFrom ^short, de-DE, Abgeleitet von)
* insert Translation(derivedFrom ^definition, de-DE, Referenzen zu den Varianten von denen diese Konsequenz abgeleitet ist)

* derivedFrom[variant] only Reference(MII_PR_MolGen_Variante)

* component MS
* component ^short = "Komponenten"
* component ^definition = "Einzelne Komponenten der molekularen Konsequenz"
* insert Translation(component ^short, de-DE, Komponenten)
* insert Translation(component ^definition, de-DE, Einzelne Komponenten der molekularen Konsequenz)

//* component[predicted-phenotype] MS
* component[conclusion-string] MS
* component[conclusion-string] ^short = "Schlussfolgerung - Text"
* component[conclusion-string] ^definition = "Textuelle Zusammenfassung der molekularen Konsequenz"
* insert Translation(component[conclusion-string] ^short, de-DE, Schlussfolgerung - Text)
* insert Translation(component[conclusion-string] ^definition, de-DE, Textuelle Zusammenfassung der molekularen Konsequenz)

* component[evidence-level] MS
* component[evidence-level] ^short = "Evidenzlevel"
* component[evidence-level] ^definition = "Das Evidenzlevel für die molekulare Konsequenz"
* insert Translation(component[evidence-level] ^short, de-DE, Evidenzlevel)
* insert Translation(component[evidence-level] ^definition, de-DE, Das Evidenzlevel für die molekulare Konsequenz)

* component[clinical-significance] MS
* component[clinical-significance] ^short = "Klinische Signifikanz"
* component[clinical-significance] ^definition = "Die klinische Signifikanz der Variante"
* insert Translation(component[clinical-significance] ^short, de-DE, Klinische Signifikanz)
* insert Translation(component[clinical-significance] ^definition, de-DE, Die klinische Signifikanz der Variante)

* component[functional-effect] MS
* component[functional-effect] ^short = "Funktioneller Effekt"
* component[functional-effect] ^definition = "Der funktionelle Effekt der Variante auf das Genprodukt"
* insert Translation(component[functional-effect] ^short, de-DE, Funktioneller Effekt)
* insert Translation(component[functional-effect] ^definition, de-DE, Der funktionelle Effekt der Variante auf das Genprodukt)
// * component[mode-of-inheritance] MS

/*Mapping: MolGen-MolekulareKonsequenz
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_MolekulareKonsequenz
* component[evidence-level] -> "mide-dataelement-1720" "Clinical Annotation Level Of Evidence"
* component[clinical-significance] -> "mide-dataelement-2015" "Klinische Signifikanz"
*/
Instance: mii-exa-molgen-molekulare-konsequenz-1
InstanceOf: mii-pr-molgen-molekulare-konsequenz
Usage: #example
Title: "BRAF Variante Molekulare Konsequenz"
Description: "Beispiel für molekulare Konsequenz abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-consequence"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#molecular-consequence "Molecular Consequence"
* subject = Reference(mii-exa-molgen-patient)
* effectiveDateTime = "2022-04-07"
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-1)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis einer aktivierenden Mutation BRAF V600E"

Instance: mii-exa-molgen-molekulare-konsequenz-2
InstanceOf: mii-pr-molgen-molekulare-konsequenz
Usage: #example
Title: "NIPBL Variante Molekulare Konsequenz"
Description: "Beispiel für molekulare Konsequenz abgeleitet von genetischer Variante im NIPBL Gen an Hand von WGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-consequence"
* extension[workflow-relatedArtifact].url = "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact"
* extension[workflow-relatedArtifact].valueRelatedArtifact.type = $RelArtType#citation "Citation"
* extension[workflow-relatedArtifact].valueRelatedArtifact.citation = "Richards et al., Genet Med. 2015; 17:405-24"
* extension[workflow-relatedArtifact].valueRelatedArtifact.url = "https://doi.org/10.1038/gim.2015.30"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#molecular-consequence "Molecular Consequence"
* subject = Reference(mii-exa-molgen-patient-2)
* effectiveDateTime = "2022-03-16"
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-2)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis einer pathogenen Variante im NIPBL-Gen in heterozygoter Form."
* component[clinical-significance].code = $LNC#53037-8 "Genetic variation clinical significance [Imp]"
* component[clinical-significance].valueCodeableConcept = $LNC#LA6668-3 "Pathogenic"
//* component[mode-of-inheritance].code = $GenTbd#condition-inheritance //CS updaten, wenn gen-reporting v2.0
//* component[mode-of-inheritance].valueCodeableConcept = $HPO#HP:0000006 "Autosomal dominant inheritance"
//* component[predicted-phenotype].code = $LNC#81259-4 "Associated phenotype"
//* component[predicted-phenotype].valueCodeableConcept = $SCT#40354009 "De Lange syndrome (disorder)"


// CNV (17.pdf)
Instance: mii-exa-molgen-molekulare-konsequenz-cnv-4
InstanceOf: mii-pr-molgen-molekulare-konsequenz
Usage: #example
Title: "CNV SMO Molekulare Konsequenz"
Description: "Beispiel für molekulare Konsequenz abgeleitet von Copy Number Variante im SMO Gen."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-consequence"
* extension[workflow-relatedArtifact].url = "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact"
* extension[workflow-relatedArtifact].valueRelatedArtifact.type = $RelArtType#citation "Citation"
* extension[workflow-relatedArtifact].valueRelatedArtifact.citation = "Richards et al., Genet Med. 2015; 17:405-24"
* extension[workflow-relatedArtifact].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/25741868/"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#molecular-consequence "Molecular Consequence"
* subject = Reference(mii-exa-molgen-patient-2)
* effectiveDateTime = "2022-03-16"
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-cnv-4)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "onkogene Veränderung mögl. Überexpression"
* component[clinical-significance].code = $LNC#53037-8 "Genetic variation clinical significance [Imp]"
* component[clinical-significance].valueCodeableConcept = $LNC#LA26332-9 "Likely pathogenic"
* component[functional-effect].valueCodeableConcept.coding[+] = $SO#SO:0002315 "increased_gene_product_level"
* component[functional-effect].valueCodeableConcept.coding[+] = $NCIT#C36337 "Messenger RNA Overexpression"
* component[functional-effect].valueCodeableConcept.text = "mögl. Überexpression" // (13581-fach, Rang 1)???

// 04 docx
Instance: mii-exa-molgen-molekulare-konsequenz-brca1
InstanceOf: mii-pr-molgen-molekulare-konsequenz
Usage: #example
Title: "Molekulare Konsequenz BRCA1 Variante"
Description: "Beispiel für molekulare Konsequenz abgeleitet von SNP im BRCA1."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-consequence"
* extension[workflow-relatedArtifact].url = "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact"
* extension[workflow-relatedArtifact].valueRelatedArtifact.type = $RelArtType#citation "Citation"
* extension[workflow-relatedArtifact].valueRelatedArtifact.citation = "Richards et al., Genet Med. 2015; 17:405-24"
* extension[workflow-relatedArtifact].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/25741868/"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#molecular-consequence "Molecular Consequence"
* subject = Reference(mii-exa-molgen-patient-brca1)
* effectiveDateTime = "2022-11-01"
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-brca1)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt"
* component[clinical-significance].code = $LNC#53037-8 "Genetic variation clinical significance [Imp]"
* component[clinical-significance].valueCodeableConcept = $LNC#LA6668-3 "Pathogenic"
* component[functional-effect].valueCodeableConcept = $SO#SO:0002054 "loss_of_function_variant"
* component[functional-effect].valueCodeableConcept.text = "Funktionsverlust des Genprodukts"
* component[evidence-level].valueCodeableConcept = $ClinVarEvLv#2-star "2 star"
