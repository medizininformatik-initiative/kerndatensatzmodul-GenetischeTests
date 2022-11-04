Profile: MII_PR_MolGen_ErgebnisZusammenfassung
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/overall-interpretation
Id: mii-pr-modul-molgen-ergebnis-zusammenfassung
Title: "MII PR MolGen Ergebnis Zusammenfassung"
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
Source: MII_PR_MolGen_ErgebnisZusammenfassung
* value[x] -> "mide-dataelement-1414" "Zusammenfassung"
* component[conclusion-string] -> "mide-dataelement-1414" "Zusammenfassung"

Instance: mii-exa-molgen-ergebnis-zusammenfassung-1
InstanceOf: mii-pr-modul-molgen-ergebnis-zusammenfassung
Usage: #example
Title: "Ergebnis Zusammenfassung Befund-1"
Description: "Beispiel zusammenfassendes Ergebnis"
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/overall-interpretation"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = LNC#51968-6
* subject = Reference(example-mii-molgen-patient)
* valueCodeableConcept = LNC#LA6576-8 "Positive"
* component[conclusion-string].valueString = "BRAF p.V600E Mutation liegt vor. Bitte Therapieoption mit einem BRAF-Inhibitor prüfen."

// 04 docx
Instance: mii-exa-molgen-ergebnis-zusammenfassung-trurisk-panel
InstanceOf: mii-pr-modul-molgen-ergebnis-zusammenfassung
Usage: #example
Title: "Ergebnis Zusammenfassung Befund "
Description: "Beispiel zusammenfassendes Ergebnis bei BRCA1 Variante bei Familiärer Belastung für Brust- und Eierstockkrebs"
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/overall-interpretation"
* status = #final
* category[labCategory] = ObsCat#laboratory "Laboratory"
* code = LNC#51968-6
* subject = Reference(mii-exa-molgen-patient-brca1)
* valueCodeableConcept = LNC#LA6576-8 "Positive"
* component[conclusion-string].valueString = "Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt"