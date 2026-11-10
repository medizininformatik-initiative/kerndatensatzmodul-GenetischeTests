# Anforderung Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Anforderung Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom**

## Example ServiceRequest: Anforderung Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom

-------

**English**

-------

Profile: [MII PR MolGen Anforderung genetischer Test](StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.md) version: 2027.0.0-ballot.rc1

**identifier**: `https://www.charite.de/fhir/auftragsnummern`/gen_test_02

**status**: Active

**intent**: Order

**category**: Laboratory procedure (procedure)

**code**: Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom (MIM122470),autosomal dominanter Erbgang

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**authoredOn**: 2022-03-16

**requester**: [Practitioner Dr. Linda Rubens(official)](Practitioner-mii-exa-molgen-practitioner-physician.md)

**reasonCode**: Premature infant (finding), Low birth weight infant (disorder), Fetal microcephaly (disorder), Carrier of muscular dystrophy (finding), Long eyelashes

**reasonReference**: 

* [Observation Long eyelashes](Observation-mii-exa-molgen-phenotypic-feature-1.md)
* [Observation Small for gestational age](Observation-mii-exa-molgen-phenotypic-feature-2.md)
* [Observation Microcephaly](Observation-mii-exa-molgen-phenotypic-feature-3.md)
* [Observation Muscular dystrophy](Observation-mii-exa-molgen-phenotypic-feature-4.md)

**specimen**: [Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_02; status = available; type = Blood specimen with edetic acid (specimen); receivedTime = 2021-11-24](Specimen-mii-exa-molgen-specimen-2.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "mii-exa-molgen-anforderung-2",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test|2027.0.0-ballot.rc1"]
  },
  "identifier" : [{
    "system" : "https://www.charite.de/fhir/auftragsnummern",
    "value" : "gen_test_02"
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
    },
    {
      "system" : "http://loinc.org",
      "code" : "40428-5",
      "display" : "NIPBL gene targeted mutation analysis in Blood or Tissue by Molecular genetics method"
    },
    {
      "system" : "http://www.genenames.org/geneId",
      "code" : "HGNC:28862",
      "display" : "NIPBL"
    }],
    "text" : "Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom (MIM122470),autosomal dominanter Erbgang"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "authoredOn" : "2022-03-16",
  "requester" : {
    "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
  },
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "395507008",
      "display" : "Premature infant (finding)"
    }]
  },
  {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "276610007",
      "display" : "Low birth weight infant (disorder)"
    },
    {
      "system" : "http://human-phenotype-ontology.org",
      "code" : "HP:0001518",
      "display" : "Small for gestational age"
    }]
  },
  {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "431265009",
      "display" : "Fetal microcephaly (disorder)"
    },
    {
      "system" : "http://human-phenotype-ontology.org",
      "code" : "HP:0000252",
      "display" : "Microcephaly"
    }]
  },
  {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "137511000119103",
      "display" : "Carrier of muscular dystrophy (finding)"
    },
    {
      "system" : "http://human-phenotype-ontology.org",
      "code" : "HP:0003560",
      "display" : "Muscular dystrophy"
    }]
  },
  {
    "coding" : [{
      "system" : "http://human-phenotype-ontology.org",
      "code" : "HP:0000527",
      "display" : "Long eyelashes"
    }]
  }],
  "reasonReference" : [{
    "reference" : "Observation/mii-exa-molgen-phenotypic-feature-1"
  },
  {
    "reference" : "Observation/mii-exa-molgen-phenotypic-feature-2"
  },
  {
    "reference" : "Observation/mii-exa-molgen-phenotypic-feature-3"
  },
  {
    "reference" : "Observation/mii-exa-molgen-phenotypic-feature-4"
  }],
  "specimen" : [{
    "reference" : "Specimen/mii-exa-molgen-specimen-2"
  }]
}

```
