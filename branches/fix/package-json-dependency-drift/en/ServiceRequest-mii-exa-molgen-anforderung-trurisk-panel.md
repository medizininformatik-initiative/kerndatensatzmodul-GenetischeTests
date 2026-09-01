# Anforderung Molekulargenetische Diagnose Familiäre Belastung für Brust- und Eierstockkrebs - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Anforderung Molekulargenetische Diagnose Familiäre Belastung für Brust- und Eierstockkrebs**

## Example ServiceRequest: Anforderung Molekulargenetische Diagnose Familiäre Belastung für Brust- und Eierstockkrebs

-------

**English**

-------

Profile: [MII PR MolGen Anforderung genetischer Test](StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.md) version: 2026.0.4

**identifier**: `https://www.charite.de/fhir/auftragsnummern`/gen_test_03

**status**: Active

**intent**: Order

**category**: Laboratory procedure (procedure)

**code**: Panelanalyse TruRisk®-V3 mit NGS basierter CNV-Analyse Bestimmung des Polygenen Risikoscores (PRS) für Brustkrebs

**subject**: [Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient-brca1.md)

**authoredOn**: 2022-11-01

**requester**: [Practitioner Dr. Linda Rubens(official)](Practitioner-mii-exa-molgen-practitioner-physician.md)

**reasonCode**: Family history of malignant neoplasm of breast (situation), Family history of malignant neoplasm of ovary (situation), Hereditary breast and/or ovarian cancer syndrome, BREAST-OVARIAN CANCER, FAMILIAL, SUSCEPTIBILITY TO, 1; BROVCA1

**specimen**: [Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_03; status = available; type = Tissue specimen from breast (specimen); receivedTime = 2022-11-01](Specimen-mii-exa-molgen-specimen-brca1.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "mii-exa-molgen-anforderung-trurisk-panel",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test|2026.0.4"]
  },
  "identifier" : [{
    "system" : "https://www.charite.de/fhir/auftragsnummern",
    "value" : "gen_test_03"
  }],
  "status" : "active",
  "intent" : "order",
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "108252007",
      "display" : "Laboratory procedure (procedure)"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "405825005",
      "display" : "Molecular genetic test (procedure)"
    }],
    "text" : "Panelanalyse TruRisk®-V3 mit NGS basierter CNV-Analyse Bestimmung des Polygenen Risikoscores (PRS) für Brustkrebs"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-brca1"
  },
  "authoredOn" : "2022-11-01",
  "requester" : {
    "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
  },
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "429740004",
      "display" : "Family history of malignant neoplasm of breast (situation)"
    }]
  },
  {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "430705002",
      "display" : "Family history of malignant neoplasm of ovary (situation)"
    }]
  },
  {
    "coding" : [{
      "system" : "http://www.orpha.net",
      "code" : "145",
      "display" : "Hereditary breast and/or ovarian cancer syndrome"
    }]
  },
  {
    "coding" : [{
      "system" : "http://www.omim.org",
      "code" : "604370",
      "display" : "BREAST-OVARIAN CANCER, FAMILIAL, SUSCEPTIBILITY TO, 1; BROVCA1"
    }]
  }],
  "specimen" : [{
    "reference" : "Specimen/mii-exa-molgen-specimen-brca1"
  }]
}

```
