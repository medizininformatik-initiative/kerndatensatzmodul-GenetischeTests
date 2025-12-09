Profile: MII_PR_MolGen_Mikrosatelliteninstabilitaet
Parent: MII_PR_MolGen_MolekularerBiomarker
Id: mii-pr-molgen-mikrosatelliteninstabilitaet
Title: "MII PR MolGen Mikrosatelliteninstabilität"
Description: "Mikrosatelliteninstabilität (MSI) ist ein Zustand genetischer Hypermutabilität (Neigung zu Mutationen), der aus einer gestörten DNA-Mismatch-Reparatur (MMR) resultiert. Das Profil basiert auf dem CG STU3 MolecularBiomarker-Profil"
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mikrosatelliteninstabilitaet"

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
* code ^definition = "Code zur Identifizierung der Mikrosatelliteninstabilität"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^definition, de-DE, Code zur Identifizierung der Mikrosatelliteninstabilität)

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
* value[x] ^definition = "Das Ergebnis der MSI-Bestimmung wie z.B. stabil oder instabil"
* insert Translation(value[x] ^short, de-DE, Ergebniswert)
* insert Translation(value[x] ^definition, de-DE, Das Ergebnis der MSI-Bestimmung wie z.B. stabil oder instabil)

Mapping: MolGen-Mikrosatelliteninstabilitaet
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_Mikrosatelliteninstabilitaet
* valueCodeableConcept -> "mide-dataelement-2013" "Mikrosatelliteninstabilität"

Instance: mii-exa-molgen-mikrosatelliteninstabilitaet-1
InstanceOf: mii-pr-molgen-mikrosatelliteninstabilitaet
Usage: #example
Title: "Mikrosatelliteninstabilität"
Description: "Beispiel für Mikrosatelliteninstabilität in Tumorprobe."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/msi"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* category[mbCategory] = http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs#biomarker-category "A characterization of a given biomarker observation."
* code = $LNC#81695-9 "Microsatellite instability [Interpretation] in Cancer specimen Qualitative"
* subject = Reference(mii-exa-molgen-patient)
* valueCodeableConcept = $LNC#LA14122-8 "Stable"
* specimen = Reference(mii-exa-molgen-specimen-1)
