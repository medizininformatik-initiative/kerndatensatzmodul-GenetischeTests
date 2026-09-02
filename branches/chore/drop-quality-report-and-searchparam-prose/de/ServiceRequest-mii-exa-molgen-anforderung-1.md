# Anforderung BRAF Genetische Testung - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Anforderung BRAF Genetische Testung**

## Beispiel ServiceRequest: Anforderung BRAF Genetische Testung

-------

**German**

-------

Profile: [MII PR MolGen Anforderung genetischer Test](StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.md) version: 2026.0.4

**status**: Active

**intent**: Order

**category**: Laboratory procedure (procedure)

**code**: BRAF: Exon 15 (Codon 600)

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**authoredOn**: 2022-04-07

**requester**: [Practitioner Dr. Linda Rubens(official)](Practitioner-mii-exa-molgen-practitioner-physician.md)

**reasonCode**: Adenocarcinoma of anorectum (disorder)

**supportingInfo**: [FamilyMemberHistory: status = completed; date = 2022-04-07; relationship = Mother (person); sex = Female (finding); deceased[x] = true; reasonCode = Adenocarcinoma of anorectum (disorder)](FamilyMemberHistory-mii-exa-molgen-family-member-history-1.md)

**specimen**: [Specimen: identifier = https://biobank.uk-musterstadt.de/fhir/sid/proben#5432; status = available; type = Tissue specimen from colon (specimen)](Specimen-mii-exa-molgen-specimen-1.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "mii-exa-molgen-anforderung-1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test|2026.0.4"]
  },
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
      "code" : "53844-7",
      "display" : "BRAF gene targeted mutation analysis in Blood or Tissue by Molecular genetics method"
    },
    {
      "system" : "http://www.genenames.org/geneId",
      "code" : "HGNC:1097",
      "display" : "BRAF"
    }],
    "text" : "BRAF: Exon 15 (Codon 600)"
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "authoredOn" : "2022-04-07",
  "requester" : {
    "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
  },
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "447886005",
      "display" : "Adenocarcinoma of anorectum (disorder)"
    }]
  }],
  "supportingInfo" : [{
    "reference" : "FamilyMemberHistory/mii-exa-molgen-family-member-history-1"
  }],
  "specimen" : [{
    "reference" : "Specimen/mii-exa-molgen-specimen-1"
  }]
}

```
