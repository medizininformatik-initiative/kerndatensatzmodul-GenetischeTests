# mii-exa-molgen-anforderung-fgfr2-fusion - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-anforderung-fgfr2-fusion**

## Beispiel ServiceRequest: mii-exa-molgen-anforderung-fgfr2-fusion

-------

**German**

-------

Profile: [MII PR MolGen Anforderung genetischer Test](StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.md) version: 2027.0.0-ballot.rc2

**identifier**: `https://www.charite.de/fhir/auftragsnummern`/PRK4QE59A

**status**: Active

**intent**: Order

**category**: Laboratory procedure (procedure)

**code**: Therapierelevante genetische Veränderungen bei Intrahepatischem Gallengangskarzinom

**subject**: [Anonymous Patient Female, DoB: 1964-05 ( pseudonymized (use: usual, ))](Patient-mii-exa-molgen-patient-fgfr2-fusion.md)

**authoredOn**: 2022-11-30

**requester**: [Practitioner Dr. Linda Rubens(official)](Practitioner-mii-exa-molgen-practitioner-physician.md)

**reasonCode**: Intrahepatic bile duct carcinoma (disorder)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "mii-exa-molgen-anforderung-fgfr2-fusion",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test|2027.0.0-ballot.rc2"]
  },
  "identifier" : [{
    "system" : "https://www.charite.de/fhir/auftragsnummern",
    "value" : "PRK4QE59A"
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
    "text" : "Therapierelevante genetische Veränderungen bei Intrahepatischem Gallengangskarzinom"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-fgfr2-fusion"
  },
  "authoredOn" : "2022-11-30",
  "requester" : {
    "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
  },
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "109842005",
      "display" : "Intrahepatic bile duct carcinoma (disorder)"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2024",
      "code" : "C22.1",
      "display" : "Intrahepatisches Gallengangskarzinom"
    }]
  }]
}

```
