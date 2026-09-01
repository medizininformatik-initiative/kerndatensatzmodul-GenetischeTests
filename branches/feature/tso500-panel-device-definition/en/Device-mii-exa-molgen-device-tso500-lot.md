# TSO500 v2 Kit Lot 20240518 - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TSO500 v2 Kit Lot 20240518**

## Example Device: TSO500 v2 Kit Lot 20240518

-------

**English**

-------

**identifier**: `https://www.medizininformatik-initiative.de/fhir/sid/lab-devices`/TSO500v2-LOT-20240518-A

**definition**: [DeviceDefinition: identifier = https://www.medizininformatik-initiative.de/fhir/sid/panel-catalog#TSO500-v2; manufacturer[x] = Illumina Inc.; modelNumber = 20130527; type = ; version = ](DeviceDefinition-mii-exa-molgen-devicedef-tso500.md)

**status**: Active

**manufacturer**: Illumina Inc.

**expirationDate**: 2026-12-31

**lotNumber**: 20240518-A

**modelNumber**: 20130527

**type**: Comprehensive genomic profiling capture panel (TSO500 v2)



## Resource Content

```json
{
  "resourceType" : "Device",
  "id" : "mii-exa-molgen-device-tso500-lot",
  "identifier" : [{
    "system" : "https://www.medizininformatik-initiative.de/fhir/sid/lab-devices",
    "value" : "TSO500v2-LOT-20240518-A"
  }],
  "definition" : {
    "reference" : "DeviceDefinition/mii-exa-molgen-devicedef-tso500"
  },
  "status" : "active",
  "manufacturer" : "Illumina Inc.",
  "expirationDate" : "2026-12-31",
  "lotNumber" : "20240518-A",
  "modelNumber" : "20130527",
  "type" : {
    "text" : "Comprehensive genomic profiling capture panel (TSO500 v2)"
  }
}

```
