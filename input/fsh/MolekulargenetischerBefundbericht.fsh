Profile: MolekulargenetischerBefundbericht
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-report
Id: ProfileMolekulargenetischerBefundbericht
Title: "Profile - DiagnosticReport - Molekulargenetischer Befundbericht"
Description: "Der DiagnosticReport ist zentraler Bestandteil aller genetischen Befundberichte und enthält Metadaten über den gesamten Bericht sowie alle relevanten Informationen, die im Rahmen der molekulargenetischen Analyse gefunden wurden."
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-molekulargenetischer-befundbericht/StructureDefinition/molekulargenetischer-befundbericht"
* ^version = "0.1.0"
* ^status = #draft
* ^publisher = "Medizininformatik Initiative"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.medizininformatik-initiative.de/"
* . ^comment = "MI-I Molekulargenetischer Befundbericht"
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)