Profile: MII_PR_MolGen_DiagnostischeImplikation
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication
Id: mii-pr-molgen-diagnostische-implikation
Title: "MII PR MolGen Diagnostische Implikation"
Description: "Dieses Profil beschreibt den Zusammenhang zwischen einem oder mehreren Genotyp/Haplotyp/Varianten und Beweisen für oder gegen eine bestimmte Krankheit."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"

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
* code ^definition = "Code zur Identifizierung der diagnostischen Implikation"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^definition, de-DE, Code zur Identifizierung der diagnostischen Implikation)

* subject MS
* subject only Reference(Patient or Group)
* subject ^short = "Patient"
* subject ^definition = "Der Patient auf den sich die diagnostische Implikation bezieht"
* insert Translation(subject ^short, de-DE, Patient)
* insert Translation(subject ^definition, de-DE, Der Patient auf den sich die diagnostische Implikation bezieht)

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
* derivedFrom ^definition = "Referenzen zu anderen Beobachtungen von denen diese abgeleitet ist"
* insert Translation(derivedFrom ^short, de-DE, Abgeleitet von)
* insert Translation(derivedFrom ^definition, de-DE, Referenzen zu anderen Beobachtungen von denen diese abgeleitet ist)

* derivedFrom[variant] only Reference(MII_PR_MolGen_Variante)

* component MS
* component ^short = "Komponenten"
* component ^definition = "Einzelne Komponenten der diagnostischen Implikation"
* insert Translation(component ^short, de-DE, Komponenten)
* insert Translation(component ^definition, de-DE, Einzelne Komponenten der diagnostischen Implikation)

* component[predicted-phenotype] MS
* component[predicted-phenotype] ^short = "Vorhergesagter Phänotyp"
* component[predicted-phenotype] ^definition = "Der mit der Variante assoziierte vorhergesagte Phänotyp oder Erkrankung"
* insert Translation(component[predicted-phenotype] ^short, de-DE, Vorhergesagter Phänotyp)
* insert Translation(component[predicted-phenotype] ^definition, de-DE, Der mit der Variante assoziierte vorhergesagte Phänotyp oder Erkrankung)

* component[conclusion-string] MS
* component[conclusion-string] ^short = "Schlussfolgerung - Text"
* component[conclusion-string] ^definition = "Textuelle Zusammenfassung der diagnostischen Implikation"
* insert Translation(component[conclusion-string] ^short, de-DE, Schlussfolgerung - Text)
* insert Translation(component[conclusion-string] ^definition, de-DE, Textuelle Zusammenfassung der diagnostischen Implikation)

* component[evidence-level] MS
* component[evidence-level] ^short = "Evidenzlevel"
* component[evidence-level] ^definition = "Das Evidenzlevel für die klinische Signifikanz"
* insert Translation(component[evidence-level] ^short, de-DE, Evidenzlevel)
* insert Translation(component[evidence-level] ^definition, de-DE, Das Evidenzlevel für die klinische Signifikanz)

* component[clinical-significance] MS
* component[clinical-significance] ^short = "Klinische Signifikanz"
* component[clinical-significance] ^definition = "Die klinische Signifikanz der Variante wie z.B. pathogen oder benigne"
* insert Translation(component[clinical-significance] ^short, de-DE, Klinische Signifikanz)
* insert Translation(component[clinical-significance] ^definition, de-DE, Die klinische Signifikanz der Variante wie z.B. pathogen oder benigne)

* component[mode-of-inheritance] MS
* component[mode-of-inheritance] ^short = "Vererbungsmodus"
* component[mode-of-inheritance] ^definition = "Der Vererbungsmodus der assoziierten Erkrankung"
* insert Translation(component[mode-of-inheritance] ^short, de-DE, Vererbungsmodus)
* insert Translation(component[mode-of-inheritance] ^definition, de-DE, Der Vererbungsmodus der assoziierten Erkrankung)

Mapping: MolGen-DiagnostischeImplikation
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_DiagnostischeImplikation
* component[evidence-level] -> "mide-dataelement-1720" "Clinical Annotation Level Of Evidence"
* component[clinical-significance] -> "mide-dataelement-2015" "Klinische Signifikanz"

Instance: mii-exa-molgen-diagnostische-implikation-1
InstanceOf: mii-pr-molgen-diagnostische-implikation
Usage: #example
Title: "BRAF Variante Diagnostische Implikation"
Description: "Beispiel für diagnostische Implikation abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS."
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation)
* meta.profile[+] = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication|3.0.0"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#diagnostic-implication "Diagnostic Implication"
* subject = Reference(mii-exa-molgen-patient)
* effectiveDateTime = "2022-04-07"
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-1)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis einer aktivierenden Mutation BRAF V600E"

Instance: mii-exa-molgen-diagnostische-implikation-2
InstanceOf: mii-pr-molgen-diagnostische-implikation
Usage: #example
Title: "NIPBL Variante Diagnostische Implikation"
Description: "Beispiel für diagnostische Implikation abgeleitet von genetischer Variante im NIPBL Gen an Hand von WGS."
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation)
* meta.profile[+] = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication|3.0.0"
* extension[workflow-relatedArtifact].url = "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact"
* extension[workflow-relatedArtifact].valueRelatedArtifact.type = $RelArtType#citation "Citation"
* extension[workflow-relatedArtifact].valueRelatedArtifact.citation = "Richards et al., Genet Med. 2015; 17:405-24"
* extension[workflow-relatedArtifact].valueRelatedArtifact.url = "https://doi.org/10.1038/gim.2015.30"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#diagnostic-implication "Diagnostic Implication"
* subject = Reference(mii-exa-molgen-patient-2)
* effectiveDateTime = "2022-03-16"
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-2)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis einer pathogenen Variante im NIPBL-Gen in heterozygoter Form."
* component[clinical-significance].code = $LNC#53037-8 "Genetic variation clinical significance [Imp]"
* component[clinical-significance].valueCodeableConcept = $LNC#LA6668-3 "Pathogenic"
* component[mode-of-inheritance].code = $GenTbd#condition-inheritance //CS updaten, wenn gen-reporting v2.0
* component[mode-of-inheritance].valueCodeableConcept = $HPO#HP:0000006 "Autosomal dominant inheritance"
* component[predicted-phenotype].code = $LNC#81259-4 "Associated phenotype"
* component[predicted-phenotype].valueCodeableConcept = $SCT#40354009 "De Lange syndrome (disorder)"


// CNV (17.pdf)
Instance: mii-exa-molgen-diagnostische-implikation-cnv-4
InstanceOf: mii-pr-molgen-diagnostische-implikation
Usage: #example
Title: "CNV SMO Diagnostische Implikation"
Description: "Beispiel für diagnostische Implikation abgeleitet von Copy Number Variante im SMO Gen."
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation)
* meta.profile[+] = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication|3.0.0"
//* extension[workflow-relatedArtifact].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/workflow-relatedArtifact"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.type = $RelArtType#citation "Citation"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.citation = "Richards et al., Genet Med. 2015; 17:405-24"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/25741868/"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#diagnostic-implication "Diagnostic Implication"
* subject = Reference(mii-exa-molgen-patient-2)
* effectiveDateTime = "2022-03-16"
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-cnv-4)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "onkogene Veränderung "
* component[clinical-significance].code = $LNC#53037-8 "Genetic variation clinical significance [Imp]"
* component[clinical-significance].valueCodeableConcept = $LNC#LA26332-9 "Likely pathogenic"

// 04 docx
Instance: mii-exa-molgen-diagnostische-implikation-brca1
InstanceOf: mii-pr-molgen-diagnostische-implikation
Usage: #example
Title: "Diagnostische Implikation BRCA1 Variante"
Description: "Beispiel für diagnostische Implikation abgeleitet von SNP im BRCA1."
* insert MetaProfile(https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation)
* meta.profile[+] = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication|3.0.0"
//* extension[workflow-relatedArtifact].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/workflow-relatedArtifact"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.type = $RelArtType#citation "Citation"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.citation = "Richards et al., Genet Med. 2015; 17:405-24"
//* extension[workflow-relatedArtifact].valueRelatedArtifact.url = "https://pubmed.ncbi.nlm.nih.gov/25741868/"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#diagnostic-implication "Diagnostic Implication"
* subject = Reference(mii-exa-molgen-patient-brca1)
* effectiveDateTime = "2022-11-01"
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-brca1)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt"
* component[clinical-significance].code = $LNC#53037-8 "Genetic variation clinical significance [Imp]"
* component[clinical-significance].valueCodeableConcept = $LNC#LA6668-3 "Pathogenic"
* component[predicted-phenotype].valueCodeableConcept.coding[0] = $HPO#HP:0003002 "Breast carcinoma"
* component[predicted-phenotype].valueCodeableConcept.coding[+] = $HPO#HP:0100615 "Ovarian neoplasm"
* component[evidence-level].valueCodeableConcept = $ClinVarEvLv#2-star "2 star"
