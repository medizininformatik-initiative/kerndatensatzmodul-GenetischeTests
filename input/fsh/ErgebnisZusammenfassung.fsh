Profile: SD_MII_MolGen_ErgebnisZusammenfassung
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/overall-interpretation
Id: sd-mii-modul-molgen-ergebnis-zusammenfassung
Title: "SD MII MolGen Ergbenis Zusammenfassung"
Description: "Mit diesem Profil kann das Labor das zusammenfassende Ergebnis des Tests deklarieren (z. B. Positiv, Negativ, Unbekannt)."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/ergebnis-zusammenfassung"
* ^status = #draft
* status MS
* category MS
* code MS
* subject 1.. MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* encounter MS
* value[x] MS
* component[conclusion-string] MS

Mapping: MolGen-ErgebnisZusammenfassung
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_ErgebnisZusammenfassung
* value[x] -> "mide-dataelement-1414" "Zusammenfassung"
* component[conclusion-string] -> "mide-dataelement-1414" "Zusammenfassung"