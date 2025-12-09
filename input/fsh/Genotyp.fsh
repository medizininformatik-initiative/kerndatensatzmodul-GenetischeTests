Profile: MII_PR_MolGen_Genotyp
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype
Id: mii-pr-molgen-genotyp
Title: "MII PR MolGen Genotyp"
Description: "Dieses Profil beschreibt die Feststellung eines bestimmten Genotyps auf der Grundlage einer oder mehrerer Varianten oder Haplotypen."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp"

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
* code ^definition = "Code zur Identifizierung des Genotyps"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^definition, de-DE, Code zur Identifizierung des Genotyps)

* subject 1.. MS
* subject only Reference(Patient or Group)
* subject ^short = "Patient"
* subject ^definition = "Der Patient auf den sich der Genotyp bezieht"
* insert Translation(subject ^short, de-DE, Patient)
* insert Translation(subject ^definition, de-DE, Der Patient auf den sich der Genotyp bezieht)

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

* value[x] MS
* value[x] ^short = "Ergebniswert"
* value[x] ^definition = "Der Genotyp als kodierter Wert oder Text"
* insert Translation(value[x] ^short, de-DE, Ergebniswert)
* insert Translation(value[x] ^definition, de-DE, Der Genotyp als kodierter Wert oder Text)

* derivedFrom MS
* derivedFrom ^short = "Abgeleitet von"
* derivedFrom ^definition = "Die Varianten oder Haplotypen von denen der Genotyp abgeleitet wurde"
* insert Translation(derivedFrom ^short, de-DE, Abgeleitet von)
* insert Translation(derivedFrom ^definition, de-DE, Die Varianten oder Haplotypen von denen der Genotyp abgeleitet wurde)

* component MS
* component ^short = "Komponenten"
* component ^definition = "Einzelne Komponenten des Genotyps"
* insert Translation(component ^short, de-DE, Komponenten)
* insert Translation(component ^definition, de-DE, Einzelne Komponenten des Genotyps)

* component[conclusion-string] MS
* component[conclusion-string] ^short = "Schlussfolgerung - Text"
* component[conclusion-string] ^definition = "Textuelle Zusammenfassung des Genotyps"
* insert Translation(component[conclusion-string] ^short, de-DE, Schlussfolgerung - Text)
* insert Translation(component[conclusion-string] ^definition, de-DE, Textuelle Zusammenfassung des Genotyps)

* component[gene-studied] MS
* component[gene-studied] ^short = "Untersuchtes Gen"
* component[gene-studied] ^definition = "Das untersuchte Gen identifiziert durch HGNC-ID"
* insert Translation(component[gene-studied] ^short, de-DE, Untersuchtes Gen)
* insert Translation(component[gene-studied] ^definition, de-DE, Das untersuchte Gen identifiziert durch HGNC-ID)

* component[cytogenetic-location] MS
* component[cytogenetic-location] ^short = "Zytogenetische Lokalisation"
* component[cytogenetic-location] ^definition = "Chromosomale Position in Bandennomenklatur"
* insert Translation(component[cytogenetic-location] ^short, de-DE, Zytogenetische Lokalisation)
* insert Translation(component[cytogenetic-location] ^definition, de-DE, Chromosomale Position in Bandennomenklatur)

* component[reference-sequence-assembly] MS
* component[reference-sequence-assembly] ^short = "Referenzgenom-Assembly"
* component[reference-sequence-assembly] ^definition = "Die verwendete Referenzgenom-Version"
* insert Translation(component[reference-sequence-assembly] ^short, de-DE, Referenzgenom-Assembly)
* insert Translation(component[reference-sequence-assembly] ^definition, de-DE, Die verwendete Referenzgenom-Version)

Mapping: MolGen-Genotyp
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_Genotyp
* component[gene-studied] -> "mide-dataelement-1400" "Getestete Gene ID"
* component[cytogenetic-location] -> "mide-dataelement-1434" "Zytogenetische Lokalisierung (Lokus)"
* component[reference-sequence-assembly] -> "mide-dataelement-1788" "Referenzgenom"

Instance: mii-exa-molgen-genotyp-1
InstanceOf: mii-pr-molgen-genotyp
Usage: #example
Title: "Genotyp BRAF"
Description: "Beispiel für Genotyp BRAF Gen."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#84413-4 "Genotype display name"
* subject = Reference(mii-exa-molgen-patient)
* effectiveDateTime = "2022-04-07"
* valueCodeableConcept.text = "BRAF rs113488022 T>A"
* method = $LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-1)
* device = Reference(mii-exa-molgen-device-sequencer)
* derivedFrom = Reference(mii-exa-molgen-variante-1)
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:1097 "BRAF"
* component[cytogenetic-location].code = $LNC#48001-2 "Cytogenetic (chromosome) location"
* component[cytogenetic-location].valueCodeableConcept = $ChromLoc#7q34

Instance: mii-exa-molgen-genotyp-2
InstanceOf: mii-pr-molgen-genotyp
Usage: #example
Title: "Genotyp NIPBL"
Description: "Beispiel für Genotyp NIPBL Gen."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#84413-4 "Genotype display name"
* subject = Reference(mii-exa-molgen-patient-2)
* effectiveDateTime = "2022-03-16"
* valueCodeableConcept.text = "NIPBL Variante c.2207del p.(Pro736Glnfs*58) (heterozygot)"
* method = $LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-2)
* device = Reference(mii-exa-molgen-device-sequencer-2)
* derivedFrom = Reference(mii-exa-molgen-variante-2)
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:28862 "NIPBL"
* component[cytogenetic-location].code = $LNC#48001-2 "Cytogenetic (chromosome) location"
* component[cytogenetic-location].valueCodeableConcept = $ChromLoc#7q34

Instance: mii-exa-molgen-genotyp-brca1
InstanceOf: mii-pr-molgen-genotyp
Usage: #example
Title: "Genotyp BRCA1"
Description: "Beispiel für Genotyp BRCA1 Gen."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#84413-4 "Genotype display name"
* subject = Reference(mii-exa-molgen-patient-brca1)
* effectiveDateTime = "2022-11-01"
* valueCodeableConcept.text = "BRCA1, c.5266dup, p.(Gln1756Profs*74)"
* method = $LNC#LA26398-0 "Sequencing"
* specimen = Reference(mii-exa-molgen-specimen-brca1)
* device = Reference(mii-exa-molgen-device-sequencer-nextseq)
* derivedFrom = Reference(mii-exa-molgen-variante-brca1)
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:1100 "BRCA1"
* component[cytogenetic-location].code = $LNC#48001-2 "Cytogenetic (chromosome) location"
* component[cytogenetic-location].valueCodeableConcept = $ChromLoc#17q21.31