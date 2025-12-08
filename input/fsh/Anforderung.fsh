Profile: MII_PR_MolGen_AnforderungGenetischerTest
Parent: ServiceRequest
Id: mii-pr-molgen-anforderung-genetischer-test
Title: "MII PR MolGen Anforderung genetischer Test"
Description: "Der Laborauftrag oder die Anfrage, die die Durchführung des genetischen Tests auslöst."
* insert Publisher
* insert PR_CS_VS_Version
* ^status = #active
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
//* ^status = #draft
* basedOn MS
* code MS
* code.text ^alias[+] = "Anforderungstext"
* subject MS
* subject only Reference(Patient or Group)
* encounter MS
* authoredOn MS
* authoredOn ^alias[+] = "Datum der Anforderung"
* requester MS
* requester only Reference(Practitioner or PractitionerRole or Organization)
* requester ^alias[+] = "Anforderer"
* reasonCode MS
* reasonCode ^alias[+] = "Indikation"
* reasonReference MS 
* supportingInfo MS
* supportingInfo ^slicing.discriminator.type = #profile
* supportingInfo ^slicing.discriminator.path = "resolve()"
* supportingInfo ^slicing.rules = #open
* supportingInfo contains familienanamnese 0..*
* supportingInfo[familienanamnese] only Reference(mii-pr-molgen-familienanamnese)
* note MS
* note ^alias[+] = "Anforderungstext"

Mapping: MolGen-Anforderung
Id: MII-KDS
Title: "MII KDS Mapping"
Source: MII_PR_MolGen_AnforderungGenetischerTest
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

Instance: mii-exa-molgen-anforderung-1
InstanceOf: mii-pr-molgen-anforderung-genetischer-test
Usage: #example
Title: "Anforderung BRAF Genetische Testung"
Description: "Beispiel für Anforderung für genetische Testung auf genetische Variante im BRAF Gen an Hand von NGS."
//* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/servicerequest"
* status = #active
* intent = #order
* category = $SCT#108252007 "Laboratory procedure (procedure)"
* code.coding[0] = $SCT#405825005 "Molecular genetic test (procedure)"
* code.coding[+] = $LNC#53844-7 "BRAF gene targeted mutation analysis in Blood or Tissue by Molecular genetics method"
* code.coding[+] = $HGNC#HGNC:1097 "BRAF"
* code.text = "BRAF: Exon 15 (Codon 600)"
* subject = Reference(mii-exa-molgen-patient)
* authoredOn = "2022-04-07"
* requester = Reference(mii-exa-molgen-practitioner-physician)
* reasonCode = $SCT#447886005 "Adenocarcinoma of anorectum (disorder)"
* specimen = Reference(mii-exa-molgen-specimen-1)
* supportingInfo[familienanamnese] = Reference(mii-exa-molgen-family-member-history-1)

Instance: mii-exa-molgen-anforderung-2
InstanceOf: mii-pr-molgen-anforderung-genetischer-test
Usage: #example
Title: "Anforderung Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom"
Description: "Beispiel für Anforderung für genetische Testung auf pathogene Variante im NIPBL Gen."
* identifier.system = "https://www.charite.de/fhir/auftragsnummern"
* identifier.value = "gen_test_02"
* status = #active
* intent = #order
* category = $SCT#108252007 "Laboratory procedure (procedure)"
* code.coding[0] = $SCT#405825005 "Molecular genetic test (procedure)"
* code.coding[+] = $LNC#40428-5 "NIPBL gene targeted mutation analysis in Blood or Tissue by Molecular genetics method"
* code.coding[+] = $HGNC#HGNC:28862 "NIPBL"
* code.text = "Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom (MIM122470),autosomal dominanter Erbgang"
* subject = Reference(mii-exa-molgen-patient-2)
* authoredOn = "2022-03-16"
* requester = Reference(mii-exa-molgen-practitioner-physician)
* specimen = Reference(mii-exa-molgen-specimen-2)
* reasonCode[0] = $SCT#395507008 "Premature infant (finding)"
* reasonCode[1].coding[0] = $SCT#276610007 "Low birth weight infant (disorder)"
* reasonCode[1].coding[1] = $HPO#HP:0001518 "Small for gestational age"
* reasonCode[2].coding[0] = $SCT#431265009 "Fetal microcephaly (disorder)"
* reasonCode[2].coding[1] = $HPO#HP:0000252 "Microcephaly"
* reasonCode[3].coding[0] = $SCT#137511000119103 "Carrier of muscular dystrophy (finding)"
* reasonCode[3].coding[1] = $HPO#HP:0003560 "Muscular dystrophy"
* reasonCode[4] = $HPO#HP:0000527 "Long eyelashes"
* reasonReference[0] = Reference(mii-exa-molgen-phenotypic-feature-1)
* reasonReference[1] = Reference(mii-exa-molgen-phenotypic-feature-2)
* reasonReference[2] = Reference(mii-exa-molgen-phenotypic-feature-3)
* reasonReference[3] = Reference(mii-exa-molgen-phenotypic-feature-4)

Instance: mii-exa-molgen-anforderung-trurisk-panel
InstanceOf: mii-pr-molgen-anforderung-genetischer-test
Usage: #example
Title: "Anforderung Molekulargenetische Diagnose Familiäre Belastung für Brust- und Eierstockkrebs"
Description: "Beispiel für Anforderung für genetische Testung bei Familiärer Belastung für Brust- und Eierstockkrebs."
* identifier.system = "https://www.charite.de/fhir/auftragsnummern"
* identifier.value = "gen_test_03"
* status = #active
* intent = #order
* category = $SCT#108252007 "Laboratory procedure (procedure)"
* code.coding[0] = $SCT#405825005 "Molecular genetic test (procedure)"
* code.text = "Panelanalyse TruRisk®-V3 mit NGS basierter CNV-Analyse Bestimmung des Polygenen Risikoscores (PRS) für Brustkrebs"
* subject = Reference(mii-exa-molgen-patient-brca1)
* authoredOn = "2022-11-01"
* requester = Reference(mii-exa-molgen-practitioner-physician)
* specimen = Reference(mii-exa-molgen-specimen-brca1)
* reasonCode[0] = $SCT#429740004 "Family history of malignant neoplasm of breast (situation)"
* reasonCode[1] = $SCT#430705002 "Family history of malignant neoplasm of ovary (situation)"
* reasonCode[2] = $ORPHA#145 "Hereditary breast and ovarian cancer syndrome"
* reasonCode[3] = $OMIM#604370 "BREAST-OVARIAN CANCER, FAMILIAL, SUSCEPTIBILITY TO, 1; BROVCA1"
