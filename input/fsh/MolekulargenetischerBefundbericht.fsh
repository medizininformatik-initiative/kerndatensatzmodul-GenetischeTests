Profile: SD_MII_MolGen_MolekulargenetischerBefundbericht
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-report
Id: sd-mii-modul-molgen-molekulargenetischer-befundbericht
Title: "SD MII MolGen Molekulargenetischer Befundbericht"
Description: "Der DiagnosticReport ist zentraler Bestandteil aller genetischen Befundberichte und enthält Metadaten über den gesamten Bericht sowie alle relevanten Informationen, die im Rahmen der molekulargenetischen Analyse gefunden wurden."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
* ^status = #draft
* extension[RecommendedAction] only SD_MII_MolGen_EmpfohleneMassnahme
* status ^alias[+] = "Berichtstatus"
* status MS
* subject MS 
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* issued MS
* issued ^alias[+] = "Datum des Berichtes"
* performer MS
* performer ^alias[+] = "Labor / Institution/ Ansprechpartner"
* resultsInterpreter MS
* resultsInterpreter ^alias[+] = "Labor / Institution/ Ansprechpartner"
* result MS
* result contains tumor-mutation-burden 0..*
* result[gen-grouper] only Reference(SD_MII_MolGen_GruppierungBeobachtungen)
* result[overall] only Reference(SD_MII_MolGen_ErgebnisZusammenfassung)
* result[diagnostic-implication] only Reference(SD_MII_MolGen_DiagnostischeImplikation)
* result[therapeutic-implication] only Reference(SD_MII_MolGen_TherapeutischeImplikation)
* result[variant] only Reference(SD_MII_MolGen_Variante)
* result[region-studied] only Reference(SD_MII_MolGen_UntersuchteRegion)
* result[tumor-mutation-burden] only Reference(SD_MII_MolGen_Mutationslast)
* media MS

Mapping: MolGen-Befundbericht
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_MolekulargenetischerBefundbericht
* -> "mide-dataelement-1371" "Molekulargenetischer Befundbericht"
* status -> "mide-dataelement-1448" "Berichtstatus"
* issued -> "mide-dataelement-1452" "Datum des Berichtes"
* performer -> "mide-dataelement-1453" "Labor / Institution/ Ansprechpartner"
* resultsInterpreter -> "mide-dataelement-1453" "Labor / Institution/ Ansprechpartner"
* media -> "mide-dataelement-1698" "Daten"
* media -> "mide-dataelement-1447" "Anhänge"

Instance: example-mii-molgen-molekulargenetischer-befundbericht-1
InstanceOf: sd-mii-modul-molgen-molekulargenetischer-befundbericht
Usage: #example
Title: "Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom"
Description: "Beispiel für molekulargenetischen Befund BRAF mutiert bei colorektalem Adenokarzniom."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-report"
* extension[RecommendedAction].valueReference = Reference(example-mii-molgen-medikationsempfehlung-1)
* basedOn = Reference(servicerequest/example)
* status = DiagRepStatus#final
* category = v2-0074#GE "Genetics"
* code = LNC#51969-4 "Genetic analysis report"
* subject = Reference(Patient/example)
* performer = Reference(Practitioner/example)
* specimen = Reference(Specimen/example)
* result[diagnostic-implication] = Reference(example-mii-molgen-diagnostische-implikation-1)
* result[therapeutic-implication] = Reference(example-mii-molgen-therapeutische-implikation-1)
* result[variant] = Reference(example-mii-molgen-variante-1)
* result[region-studied] = Reference(example-mii-molgen-untersuchte-region-1)
* conclusion = "BRAF p.V600E Mutation liegt vor. Bitte Therapieoption mit einem BRAF-Inhibitor prüfen."


