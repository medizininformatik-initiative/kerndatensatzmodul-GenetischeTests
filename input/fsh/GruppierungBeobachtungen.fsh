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
* hasMember[grouper-ref] only Reference(SD_MII_MolGen_GruppierungBeobachtungen)
* hasMember[overall] only Reference(SD_MII_MolGen_ErgebnisZusammenfassung)
* hasMember[diagnostic-implication] only Reference(SD_MII_MolGen_DiagnostischeImplikation)
* hasMember[therapeutic-implication] only Reference(SD_MII_MolGen_TherapeutischeImplikation)
* hasMember[variant] only Reference(SD_MII_MolGen_Variante)

Mapping: MolGen-Gruppierung
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_GruppierungBeobachtungen