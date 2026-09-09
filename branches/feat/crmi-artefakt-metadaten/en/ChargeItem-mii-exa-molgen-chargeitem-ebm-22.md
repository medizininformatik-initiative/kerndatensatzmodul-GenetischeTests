# mii-exa-molgen-chargeitem-ebm-22 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-molgen-chargeitem-ebm-22**

## Example ChargeItem: mii-exa-molgen-chargeitem-ebm-22

-------

**English**

-------

Profile: [ChargeItem für EBM-Ziffer als Abrechnungsposition](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.de/StructureDefinition/chargeitem-de-ebm)

**status**: Billable

**code**: Gezielter Nachweis oder Ausschluss von krankheitsrelevanten oder krankheitsauslösenden großen Deletionen und/oder Duplikationen

**subject**: [Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))](Patient-mii-exa-molgen-patient-2.md)

**quantity**: 6



## Resource Content

```json
{
  "resourceType" : "ChargeItem",
  "id" : "mii-exa-molgen-chargeitem-ebm-22",
  "meta" : {
    "profile" : ["http://fhir.de/StructureDefinition/chargeitem-de-ebm"]
  },
  "status" : "billable",
  "code" : {
    "coding" : [{
      "system" : "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_EBM",
      "code" : "11512",
      "display" : "Gezielter Nachweis oder Ausschluss von krankheitsrelevanten oder krankheitsauslösenden großen Deletionen und/oder Duplikationen"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient-2"
  },
  "quantity" : {
    "value" : 6
  }
}

```
