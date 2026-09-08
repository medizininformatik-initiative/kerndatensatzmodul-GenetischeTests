# mii-exa-molgen-anforderung-srcc - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-anforderung-srcc**

## Beispiel ServiceRequest: mii-exa-molgen-anforderung-srcc

-------

**German**

-------

Profile: [MII PR MolGen Anforderung genetischer Test](StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.md) version: 2027.0.0-ballot.rc2

**identifier**: `https://www.charite.de/fhir/auftragsnummern`/7B369EB0

**status**: Active

**intent**: Order

**category**: Laboratory procedure (procedure)

**code**: Molekulargenetische Untersuchung (Stufendiagnostik) der relevanten Gene

**subject**: [Anonymous Patient Male, DoB: 1986-01 ( pseudonymized (use: usual, ))](Patient-mii-exa-molgen-patient-srcc.md)

**authoredOn**: 2022-11-30

**requester**: [Practitioner Dr. Linda Rubens(official)](Practitioner-mii-exa-molgen-practitioner-physician.md)

**reasonCode**: Eigenanamnese: Siegelringkarzinom des Magens, diffus wachsend, Mutter an Brustkrebs verstorben

**specimen**: [Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#00070024; status = available; type = Blood specimen with edetic acid (specimen); receivedTime = 2022-11-30](Specimen-mii-exa-molgen-specimen-srcc.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "mii-exa-molgen-anforderung-srcc",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test|2027.0.0-ballot.rc2"]
  },
  "identifier" : [{
    "system" : "https://www.charite.de/fhir/auftragsnummern",
    "value" : "7B369EB0"
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
    "text" : "Molekulargenetische Untersuchung (Stufendiagnostik) der relevanten Gene"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-srcc"
  },
  "authoredOn" : "2022-11-30",
  "requester" : {
    "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
  },
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "87737001",
      "display" : "Signet ring cell carcinoma"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2024",
      "code" : "C16.9",
      "display" : "Bösartige Neubildung: Magen, nicht näher bezeichnet"
    }],
    "text" : "Eigenanamnese: Siegelringkarzinom des Magens, diffus wachsend"
  },
  {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "429740004",
      "display" : "Family history of malignant neoplasm of breast (situation)"
    }],
    "text" : "Mutter an Brustkrebs verstorben"
  }],
  "specimen" : [{
    "reference" : "Specimen/mii-exa-molgen-specimen-srcc"
  }]
}

```
