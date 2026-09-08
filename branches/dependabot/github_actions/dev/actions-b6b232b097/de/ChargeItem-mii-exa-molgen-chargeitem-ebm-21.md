# mii-exa-molgen-chargeitem-ebm-21 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-chargeitem-ebm-21**

## Beispiel ChargeItem: mii-exa-molgen-chargeitem-ebm-21

-------

**German**

-------

Profile: [ChargeItem für EBM-Ziffer als Abrechnungsposition](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.de/StructureDefinition/chargeitem-de-ebm)

**status**: Billable

**code**: Postnatale Mutationssuche zum Nachweis oder Ausschluss einer krankheitsrelevanten oder krankheitsauslösenden konstitutionellen genomischen Mutation

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**quantity**: 72



## Resource Content

```json
{
  "resourceType" : "ChargeItem",
  "id" : "mii-exa-molgen-chargeitem-ebm-21",
  "meta" : {
    "profile" : ["http://fhir.de/StructureDefinition/chargeitem-de-ebm"]
  },
  "status" : "billable",
  "code" : {
    "coding" : [{
      "system" : "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_EBM",
      "code" : "11513",
      "display" : "Postnatale Mutationssuche zum Nachweis oder Ausschluss einer krankheitsrelevanten oder krankheitsauslösenden konstitutionellen genomischen Mutation"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "quantity" : {
    "value" : 72
  }
}

```
