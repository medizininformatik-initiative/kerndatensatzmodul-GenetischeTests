Profile: MII_PR_MolGen_MolekularerBiomarker
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-biomarker
Id: mii-pr-molgen-molekularer-biomarker
Title: "MII PR MolGen Molekulare Biomarker"
Description: "Dieses Profil beschreibt molekulare Biomarker, z.B. genübergreifende Biomarker wie Tumormutationslast (TMB) oder Mikrosatelliteninstabilität (MSI). Es ist ein abstraktes Profil, konkrete Biomarker-Profile erben davon."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekularer-biomarker"

// MS elements with German translations
* category MS
* category ^short = "Kategorie"
* category ^definition = "Klassifizierung der Beobachtungsart"
* insert Translation(category ^short, de-DE, Kategorie)
* insert Translation(category ^definition, de-DE, Klassifizierung der Beobachtungsart)

* code MS
* code ^short = "Code"
* code ^definition = "Code zur Identifizierung des Biomarkers"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^definition, de-DE, Code zur Identifizierung des Biomarkers)

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
* derivedFrom ^definition = "Referenzen zu anderen Beobachtungen von denen diese abgeleitet ist"
* insert Translation(derivedFrom ^short, de-DE, Abgeleitet von)
* insert Translation(derivedFrom ^definition, de-DE, Referenzen zu anderen Beobachtungen von denen diese abgeleitet ist)

* derivedFrom[variant] only Reference(MII_PR_MolGen_Variante)

* component MS
* component ^short = "Komponenten"
* component ^definition = "Einzelne Komponenten der Beobachtung"
* insert Translation(component ^short, de-DE, Komponenten)
* insert Translation(component ^definition, de-DE, Einzelne Komponenten der Beobachtung)

* component[gene-studied] MS
* component[gene-studied] ^short = "Untersuchtes Gen"
* component[gene-studied] ^definition = "Das untersuchte Gen"
* insert Translation(component[gene-studied] ^short, de-DE, Untersuchtes Gen)
* insert Translation(component[gene-studied] ^definition, de-DE, Das untersuchte Gen)

* component[biomarker-category] MS
* component[biomarker-category] ^short = "Biomarker-Kategorie"
* component[biomarker-category] ^definition = "Die Kategorie des molekularen Biomarkers"
* insert Translation(component[biomarker-category] ^short, de-DE, Biomarker-Kategorie)
* insert Translation(component[biomarker-category] ^definition, de-DE, Die Kategorie des molekularen Biomarkers)

/*Mapping: MolGen-MolekulareKonsequenz
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_MolekulareKonsequenz
* component[evidence-level] -> "mide-dataelement-1720" "Clinical Annotation Level Of Evidence"
* component[clinical-significance] -> "mide-dataelement-2015" "Klinische Signifikanz"
*/
