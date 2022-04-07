Profile: SD_MII_MolGen_AnforderungGenetischerTest
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/servicerequest
Id: sd-mii-modul-molgen-anforderung-gentischer-test
Title: "SD MII MolGen Anforderung genetischer Test"
Description: "Der Laborauftrag oder die Anfrage, die die Durchführung des genetischen Tests auslöst."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
* ^status = #draft
* basedOn MS
* code MS
* code.text ^alias[+] = "Anforderungstext"
* subject MS
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* authoredOn MS
* authoredOn ^alias[+] = "Datum der Anforderung"
* requester MS
* requester ^alias[+] = "Anforderer"
* reasonCode MS
* reasonCode ^alias[+] = "Indikation"
* reasonReference MS 
* supportingInfo MS
* note MS
* note ^alias[+] = "Anforderungstext"

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
* code.text -> "mide-dataelement-1763" "Anforderungstext"
* note -> "mide-dataelement-1763" "Anforderungstext"
* authoredOn -> "mide-dataelement-1766" "Datum der Anforderung"

Instance: example-mii-molgen-anforderung-1
InstanceOf: sd-mii-modul-molgen-anforderung-gentischer-test
Usage: #example
Title: "Anforderung BRAF Genetische Testung"
Description: "Beispiel für Anforderun für genetische Testung auf genetische Variante im BRAF Gen an Hand von NGS."
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/servicerequest"
* status = #active
* intent = #order
* category = SCT#108252007 "Laboratory procedure (procedure)"
* code.coding[0] = SCT#405825005 "Molecular genetic test (procedure)"
* code.coding[+] = LNC#53844-7 "BRAF gene targeted mutation analysis in Blood or Tissue by Molecular genetics method"
* code.coding[+] = HGNC#HGNC:1097 "BRAF"
* code.text = "BRAF: Exon 15 (Codon 600)"
* subject = Reference(example-mii-molgen-patient)
* authoredOn = "2022-04-07"
* requester = Reference(example-mii-molgen-practitioner-physician)
* reasonCode = SCT#447886005 "Adenocarcinoma of anorectum (disorder)"

