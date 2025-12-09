Profile: MII_PR_MolGen_TherapeutischeImplikation
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication
Id: mii-pr-molgen-therapeutische-implikation
Title: "MII PR MolGen Therapeutische Implikation"
Description: "Dieses Profil beschreibt den möglichen Einfluss genetischer Merkmale auf eine medikamentöse oder nicht-medikamentöse Therapie."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation"

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
* code ^definition = "Code zur Identifizierung der therapeutischen Implikation"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^definition, de-DE, Code zur Identifizierung der therapeutischen Implikation)

* subject 1.. MS
* subject only Reference(Patient or Group)
* subject ^short = "Patient"
* subject ^definition = "Der Patient auf den sich die therapeutische Implikation bezieht"
* insert Translation(subject ^short, de-DE, Patient)
* insert Translation(subject ^definition, de-DE, Der Patient auf den sich die therapeutische Implikation bezieht)

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

* derivedFrom[variant] MS
* derivedFrom[variant] only Reference(MII_PR_MolGen_Variante)
* derivedFrom[variant] ^short = "Abgeleitet von Variante"
* derivedFrom[variant] ^definition = "Die genetische Variante von der diese Implikation abgeleitet wurde"
* insert Translation(derivedFrom[variant] ^short, de-DE, Abgeleitet von Variante)
* insert Translation(derivedFrom[variant] ^definition, de-DE, Die genetische Variante von der diese Implikation abgeleitet wurde)

* component MS
* component ^short = "Komponenten"
* component ^definition = "Einzelne Komponenten der therapeutischen Implikation"
* insert Translation(component ^short, de-DE, Komponenten)
* insert Translation(component ^definition, de-DE, Einzelne Komponenten der therapeutischen Implikation)

* component[conclusion-string] MS
* component[conclusion-string] ^short = "Schlussfolgerung - Text"
* component[conclusion-string] ^definition = "Textuelle Zusammenfassung der therapeutischen Implikation"
* insert Translation(component[conclusion-string] ^short, de-DE, Schlussfolgerung - Text)
* insert Translation(component[conclusion-string] ^definition, de-DE, Textuelle Zusammenfassung der therapeutischen Implikation)

//* component[prognosis] MS
* component[evidence-level] MS
* component[evidence-level] ^short = "Evidenzlevel"
* component[evidence-level] ^definition = "Das Evidenzlevel für die therapeutische Empfehlung"
* insert Translation(component[evidence-level] ^short, de-DE, Evidenzlevel)
* insert Translation(component[evidence-level] ^definition, de-DE, Das Evidenzlevel für die therapeutische Empfehlung)

* component[phenotypic-treatment-context] MS
* component[phenotypic-treatment-context] ^short = "Phänotypischer Behandlungskontext"
* component[phenotypic-treatment-context] ^definition = "Der phänotypische oder krankheitsbezogene Kontext der Behandlung"
* insert Translation(component[phenotypic-treatment-context] ^short, de-DE, Phänotypischer Behandlungskontext)
* insert Translation(component[phenotypic-treatment-context] ^definition, de-DE, Der phänotypische oder krankheitsbezogene Kontext der Behandlung)

* component[medication-assessed] MS
* component[medication-assessed] ^short = "Bewertete Medikation"
* component[medication-assessed] ^definition = "Die bewertete Medikation für die therapeutische Empfehlung"
* insert Translation(component[medication-assessed] ^short, de-DE, Bewertete Medikation)
* insert Translation(component[medication-assessed] ^definition, de-DE, Die bewertete Medikation für die therapeutische Empfehlung)

* component[therapy-assessed] MS
* component[therapy-assessed] ^short = "Bewertete Therapie"
* component[therapy-assessed] ^definition = "Die bewertete nicht-medikamentöse Therapie"
* insert Translation(component[therapy-assessed] ^short, de-DE, Bewertete Therapie)
* insert Translation(component[therapy-assessed] ^definition, de-DE, Die bewertete nicht-medikamentöse Therapie)

* component[therapeutic-implication] MS
* component[therapeutic-implication] ^short = "Art der therapeutischen Implikation"
* component[therapeutic-implication] ^definition = "Die Art der therapeutischen Implikation wie z.B. Sensitivität oder Resistenz"
* insert Translation(component[therapeutic-implication] ^short, de-DE, Art der therapeutischen Implikation)
* insert Translation(component[therapeutic-implication] ^definition, de-DE, Die Art der therapeutischen Implikation wie z.B. Sensitivität oder Resistenz)

Mapping: MolGen-TherapeutischeImplikation
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_TherapeutischeImplikation
* -> "mide-dataelement-1724" "Empfehlungen (Therapie, Allg.)"
* component[evidence-level] -> "mide-dataelement-1720" "Clinical Annotation Level Of Evidence"

Instance: mii-exa-molgen-therapeutische-implikation-1
InstanceOf: mii-pr-molgen-therapeutische-implikation
Usage: #example
Title: "BRAF Variante Therapeutische Implikation"
Description: "Beispiel für therapeutische Implikation abgeleitet von genetische Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#therapeutic-implication "Therapeutic Implication"
* subject = Reference(mii-exa-molgen-patient)
* effectiveDateTime = "2022-04-07"
* performer = Reference(mii-exa-molgen-practitioner-lab)
* derivedFrom[variant] = Reference(mii-exa-molgen-variante-1)
* component[conclusion-string].code = $GenTbd#conclusion-string
* component[conclusion-string].valueString = "Nachweis einer aktivierenden Mutation BRAF V600E. Triple-Therapie mit einem EGFR-Antikörper sowie einem BRAF- und einem MEK- Inhibitor prüfen."
* component[medication-assessed][+].code = $LNC#51963-7 "Medication assessed [ID]"
* component[medication-assessed][=].valueCodeableConcept.coding[0] = $ATC#L01EC "B-Raf serine-threonine kinase (BRAF) inhibitors"
* component[medication-assessed][=].valueCodeableConcept.coding[1] = $SCT#703645005 "Product containing B-Raf inhibitor (product)"
* component[medication-assessed][=].valueCodeableConcept.text = "BRAF Inhibitor"
* component[medication-assessed][+].code = $LNC#51963-7 "Medication assessed [ID]"
* component[medication-assessed][=].valueCodeableConcept.coding[0] = $ATC#L01FE "EGFR (Epidermal Growth Factor Receptor) inhibitors"
* component[medication-assessed][+].code = $LNC#51963-7 "Medication assessed [ID]"
* component[medication-assessed][=].valueCodeableConcept = $ATC#L01EE "Mitogen-activated protein kinase (MEK) inhibitors"