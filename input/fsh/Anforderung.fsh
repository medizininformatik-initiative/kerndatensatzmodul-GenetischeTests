Profile: SD_MII_MolGen_AnforderungGenetischerTest
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/servicerequest
Id: sd-mii-modul-molgen-anforderung-gentischer-test
Title: "SD MII MolGen Anforderung genetischer Test"
Description: "Der Laborauftrag oder die Anfrage, die die Durchführung des genetischen Tests auslöst."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* reasonCode MS
* reasonReference MS 

Mapping: MolGen-Anforderung
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_AnforderungGenetischerTest
* -> "mide-dataelement-1733" "Indikation / Anforderung"
* reasonCode -> "mide-dataelement-1736" "Indikation"
