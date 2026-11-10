# Ordering Practitioner - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Ordering Practitioner**

## Beispiel Practitioner: Ordering Practitioner

-------

**German**

-------

**identifier**: `https://www.medizininformatik-initiative.de/fhir/sid/practitioner-ids`/54321

**name**: Klaus Müller 



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "mii-exa-molgen-practitioner-ordering",
  "identifier" : [{
    "system" : "https://www.medizininformatik-initiative.de/fhir/sid/practitioner-ids",
    "value" : "54321"
  }],
  "name" : [{
    "family" : "Müller",
    "given" : ["Klaus"],
    "prefix" : ["Dr."]
  }]
}

```
