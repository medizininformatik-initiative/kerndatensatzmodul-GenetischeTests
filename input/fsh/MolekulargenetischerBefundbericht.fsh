Profile: SD_MII_MolGen_MolekulargenetischerBefundbericht
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-report
Id: sd-mii-modul-molgen-molekulargenetischer-befundbericht
Title: "SD MII MolGen Molekulargenetischer Befundbericht"
Description: "Der DiagnosticReport ist zentraler Bestandteil aller genetischen Befundberichte und enthält Metadaten über den gesamten Bericht sowie alle relevanten Informationen, die im Rahmen der molekulargenetischen Analyse gefunden wurden."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
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
* result[variant] only Reference(SD_MII_MolGen_Variante)
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
