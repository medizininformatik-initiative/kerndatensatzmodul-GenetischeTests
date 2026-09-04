# Agilent SureSelect Human All Exon V7 Protocol - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Agilent SureSelect Human All Exon V7 Protocol**

## PlanDefinition: Agilent SureSelect Human All Exon V7 Protocol 

| | |
| :--- | :--- |
| *Offizielle URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/PlanDefinition/mii-exa-molgen-protocol-agilent-sureselect | *Version*:2027.0.0-ballot.rc2 |
| Active Stand: 2026-09-04 | *Maschinenlesbarer Name*:AgilentSureSelectV7 |

 
Target enrichment protocol for whole exome sequencing covering 35.8 Mb of the human exome 

-------

**German**

-------

* **Actions: **: **Url: **
  * : [Agilent SureSelect Human All Exon V7 Kit Protocol](PlanDefinition-mii-exa-molgen-protocol-agilent-sureselect.md)
* **Actions: **: **Version: **
  * : 2027.0.0-ballot.rc2
* **Actions: **: **Title: **
  * : Agilent SureSelect Human All Exon V7 Kit Protocol
* **Actions: **: **Date: **
  * : 2026-09-04 15:11:34+0000
* **Actions: **: **Publisher: **
  * : Medizininformatik-Initiative
* **Actions: **: **Description: **
  * : Target enrichment protocol for whole exome sequencing covering 35.8 Mb of the human exome
* **Actions: **: **Jurisdiction: **
  * : DE



## Resource Content

```json
{
  "resourceType" : "PlanDefinition",
  "id" : "mii-exa-molgen-protocol-agilent-sureselect",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/PlanDefinition/mii-exa-molgen-protocol-agilent-sureselect",
  "version" : "2027.0.0-ballot.rc2",
  "name" : "AgilentSureSelectV7",
  "title" : "Agilent SureSelect Human All Exon V7 Kit Protocol",
  "type" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/plan-definition-type",
      "code" : "protocol",
      "display" : "Protocol"
    }]
  },
  "status" : "active",
  "date" : "2026-09-04T15:11:34+00:00",
  "publisher" : "Medizininformatik-Initiative",
  "contact" : [{
    "name" : "Medizininformatik-Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    },
    {
      "system" : "email",
      "value" : "info@medizininformatik-initiative.de"
    }]
  }],
  "description" : "Target enrichment protocol for whole exome sequencing covering 35.8 Mb of the human exome",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "action" : [{
    "title" : "DNA Fragmentation",
    "description" : "Fragment genomic DNA to 150-200bp using Covaris"
  },
  {
    "title" : "Library Preparation",
    "description" : "End repair, A-tailing, adapter ligation"
  },
  {
    "title" : "Hybridization",
    "description" : "Hybridize with SureSelect baits for 24 hours at 65°C"
  },
  {
    "title" : "Capture",
    "description" : "Streptavidin bead capture and washing"
  },
  {
    "title" : "Amplification",
    "description" : "PCR amplification of captured library"
  }]
}

```
