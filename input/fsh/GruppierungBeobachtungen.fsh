Profile: SD_MII_MolGen_GruppierungBeobachtungen
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/grouper
Id: sd-mii-modul-molgen-gruppierung-beobachtungen
Title: "SD MII MolGen Gruppierung Beobachtungen"
Description: "Mit diesem Profil können genetische Beobachtungen auf verschiedene Weise organisiert und gruppiert werden."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/gruppierung-beobachtungen"
* ^status = #draft
* subject MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* hasMember contains tumor-mutation-burden 0..*
* hasMember[grouper-ref] only Reference(SD_MII_MolGen_GruppierungBeobachtungen)
* hasMember[overall] only Reference(SD_MII_MolGen_ErgebnisZusammenfassung)
* hasMember[diagnostic-implication] only Reference(SD_MII_MolGen_DiagnostischeImplikation)
* hasMember[therapeutic-implication] only Reference(SD_MII_MolGen_TherapeutischeImplikation)
* hasMember[variant] only Reference(SD_MII_MolGen_Variante)
* hasMember[tumor-mutation-burden] only Reference(SD_MII_MolGen_Mutationslast)

Mapping: MolGen-Gruppierung
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_GruppierungBeobachtungen

Instance: example-mii-molgen-gruppierung-beobachtungen-1
InstanceOf: sd-mii-modul-molgen-gruppierung-beobachtungen
Usage: #example
Title: "Molekulargentischer Befund 1: BRAF Beobachtungen"
Description: "Beispiel für gruppierte Beobachtungen bezüglich BRAF."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/grouper"
* status = #final
* category = ObsCat#laboratory "Laboratory"
* code = GenTbd#grouper "Beobachtungen Gruppiert"
* code.text = "BRAF Beobachtungen gruppiert"
* subject = Reference(Patient/example)
* hasMember[diagnostic-implication] = Reference(example-mii-molgen-diagnostische-implikation-1)
* hasMember[therapeutic-implication] = Reference(example-mii-molgen-therapeutische-implikation-1)
* hasMember[variant] = Reference(example-mii-molgen-variante-1)
* hasMember[region-studied] = Reference(example-mii-molgen-untersuchte-region-1)
* hasMember[tumor-mutation-burden] = Reference(example-mii-molgen-mutationslast-1)