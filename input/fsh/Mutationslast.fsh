Profile: MII_PR_MolGen_Mutationslast
Parent: MII_PR_MolGen_MolekularerBiomarker
Id: mii-pr-molgen-mutationslast
Title: "MII PR MolGen Mutationslast"
Description: "Dieses Profil beschreibt die Gesamtzahl der in der DNA von Krebszellen gefundenen Mutationen."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mutationslast"

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
* code ^definition = "Code zur Identifizierung der Mutationslast"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^definition, de-DE, Code zur Identifizierung der Mutationslast)

* subject 1.. MS
* subject only Reference(Patient or Group)
* subject ^short = "Patient"
* subject ^definition = "Der Patient auf den sich die Beobachtung bezieht"
* insert Translation(subject ^short, de-DE, Patient)
* insert Translation(subject ^definition, de-DE, Der Patient auf den sich die Beobachtung bezieht)

* encounter MS
* encounter ^short = "Kontakt"
* encounter ^definition = "Der Kontakt in dessen Rahmen die Beobachtung gemacht wurde"
* insert Translation(encounter ^short, de-DE, Kontakt)
* insert Translation(encounter ^definition, de-DE, Der Kontakt in dessen Rahmen die Beobachtung gemacht wurde)

* value[x] MS
* value[x] ^short = "Ergebniswert"
* value[x] ^definition = "Der numerische Wert der Mutationslast in Mutationen pro Megabase"
* insert Translation(value[x] ^short, de-DE, Ergebniswert)
* insert Translation(value[x] ^definition, de-DE, Der numerische Wert der Mutationslast in Mutationen pro Megabase)

* specimen MS
* specimen ^short = "Probe"
* specimen ^definition = "Die untersuchte Tumorprobe"
* insert Translation(specimen ^short, de-DE, Probe)
* insert Translation(specimen ^definition, de-DE, Die untersuchte Tumorprobe)

* component MS
* component ^short = "Komponenten"
* component ^definition = "Einzelne Komponenten der Beobachtung"
* insert Translation(component ^short, de-DE, Komponenten)
* insert Translation(component ^definition, de-DE, Einzelne Komponenten der Beobachtung)
//* component[conclusion-string] MS

Mapping: MolGen-Mutationslast
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_Mutationslast
* valueQuantity -> "mide-dataelement-2012" "Mutationslast"

Instance: mii-exa-molgen-mutationslast-1
InstanceOf: mii-pr-molgen-mutationslast
Usage: #example
Title: "Beispiel Mutationslast in Tumorprobe"
Description: "Beispiel für Mutationslast in Tumorprobe."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/tmb"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* category[mbCategory] = http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs#biomarker-category "A characterization of a given biomarker observation."
* code = $LNC#94076-7 "Mutations/Megabase [# Ratio] in Tumor"
* subject = Reference(mii-exa-molgen-patient)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* valueQuantity = 12 $UCUM#1/1000000{Base} "Mutations/Megabase"
* specimen = Reference(mii-exa-molgen-specimen-1)