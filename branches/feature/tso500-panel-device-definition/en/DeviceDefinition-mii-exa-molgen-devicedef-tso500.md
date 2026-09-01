# TruSight Oncology 500 v2 Panel (DeviceDefinition) - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TruSight Oncology 500 v2 Panel (DeviceDefinition)**

## Example DeviceDefinition: TruSight Oncology 500 v2 Panel (DeviceDefinition)

-------

**English**

-------

**identifier**: `https://www.medizininformatik-initiative.de/fhir/sid/panel-catalog`/TSO500-v2

**manufacturer**: Illumina Inc.

### DeviceNames

| | | |
| :--- | :--- | :--- |
| - | **Name** | **Type** |
| * | TruSight Oncology 500 v2 | Model name |

**modelNumber**: 20130527

**type**: Comprehensive genomic profiling capture panel

### Specializations

| | | |
| :--- | :--- | :--- |
| - | **SystemType** | **Version** |
| * | Hybrid capture-based comprehensive genomic profiling panel for solid tumors (RUO) | 523 SNV/Indel genes; 59 CNV genes; 23 DNA rearrangement genes; 55 RNA fusion/splice genes; TMB; MSI; HRD; 1.94 Mb panel size |

**version**: 



## Resource Content

```json
{
  "resourceType" : "DeviceDefinition",
  "id" : "mii-exa-molgen-devicedef-tso500",
  "identifier" : [{
    "system" : "https://www.medizininformatik-initiative.de/fhir/sid/panel-catalog",
    "value" : "TSO500-v2"
  }],
  "manufacturerString" : "Illumina Inc.",
  "deviceName" : [{
    "name" : "TruSight Oncology 500 v2",
    "type" : "model-name"
  }],
  "modelNumber" : "20130527",
  "type" : {
    "text" : "Comprehensive genomic profiling capture panel"
  },
  "specialization" : [{
    "systemType" : "Hybrid capture-based comprehensive genomic profiling panel for solid tumors (RUO)",
    "version" : "523 SNV/Indel genes; 59 CNV genes; 23 DNA rearrangement genes; 55 RNA fusion/splice genes; TMB; MSI; HRD; 1.94 Mb panel size"
  }],
  "_version" : [{
    "value" : "2"
  }]
}

```
