# mii-exa-molgen-chargeitem-ebm-24 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-chargeitem-ebm-24**

## Beispiel ChargeItem: mii-exa-molgen-chargeitem-ebm-24

-------

**German**

-------

Profile: [ChargeItem für EBM-Ziffer als Abrechnungsposition](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.de/StructureDefinition/chargeitem-de-ebm)

**status**: Billable

**code**: Grundpauschale humangenetische in-vitro-Diagnostik bei Probeneinsendung

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**quantity**: 1



## Resource Content

```json
{
  "resourceType" : "ChargeItem",
  "id" : "mii-exa-molgen-chargeitem-ebm-24",
  "meta" : {
    "profile" : ["http://fhir.de/StructureDefinition/chargeitem-de-ebm"]
  },
  "status" : "billable",
  "code" : {
    "coding" : [{
      "system" : "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_EBM",
      "code" : "11301",
      "display" : "Grundpauschale humangenetische in-vitro-Diagnostik bei Probeneinsendung"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "quantity" : {
    "value" : 1
  }
}

```
