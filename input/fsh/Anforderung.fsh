Profile: SD_MII_MolGen_AnforderungGenetischerTest
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/servicerequest
Id: sd-mii-modul-molgen-anforderung-gentischer-test
Title: "SD MII MolGen Anforderung genetischer Test"
Description: "Der Laborauftrag oder die Anfrage, die die Durchführung des genetischen Tests auslöst."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
* basedOn MS
* code MS
* subject MS
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* authoredOn MS
* requester MS
* reasonCode MS
* reasonReference MS 
* supportingInfo MS
* note MS

Mapping: MolGen-Anforderung
Id: MII-KDS
Title: "MII KDS Mapping"
Source: SD_MII_MolGen_AnforderungGenetischerTest
* -> "mide-dataelement-1733" "Indikation / Anforderung"
* requester -> "mide-dataelement-1746" "Anforderer"
* reasonCode -> "mide-dataelement-1736" "Indikation"
* reasonReference -> "mide-dataelement-1744" "Ergebnisse vorheriger Tests"
* reasonReference -> "mide-dataelement-1745" "Bereichtsverweis"
* supportingInfo -> "mide-dataelement-1738" "Aktueller Gesundheitszustand"
* supportingInfo -> "mide-dataelement-1739" "Krankengeschichte Patient"
* supportingInfo -> "mide-dataelement-1740" "Krankengeschichte Familie"
* supportingInfo -> "mide-dataelement-1741" "Anlageträger"
* basedOn -> "mide-dataelement-1742" "Zuvor durchgeführte Tests Methode"
* basedOn -> "mide-dataelement-1743" "Zuvor durchgeführte Tests Gen"
* code -> "mide-dataelement-1761" "Zu testende Gene, ID"
* code -> "mide-dataelement-1704" "Einheitlicher Bewertungsmaßstab"
* note -> "mide-dataelement-1763" "Anforderungstext"
* authoredOn -> "mide-dataelement-1766" "Datum der Anforderung"



