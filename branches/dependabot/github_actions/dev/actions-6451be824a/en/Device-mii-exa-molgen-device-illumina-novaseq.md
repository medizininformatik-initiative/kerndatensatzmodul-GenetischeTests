# Illumina NovaSeq 6000 Sequencer - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Illumina NovaSeq 6000 Sequencer**

## Example Device: Illumina NovaSeq 6000 Sequencer

-------

**English**

-------

**identifier**: `https://www.medizininformatik-initiative.de/fhir/sid/lab-devices`/NOVASEQ-6000-SN12345

**status**: Active

**manufacturer**: Illumina Inc.

**serialNumber**: SN12345

### DeviceNames

| | | |
| :--- | :--- | :--- |
| - | **Name** | **Type** |
| * | NovaSeq 6000 Sequencing System | Model name |

**modelNumber**: NovaSeq 6000

**type**: Medical laboratory analyzer



## Resource Content

```json
{
  "resourceType" : "Device",
  "id" : "mii-exa-molgen-device-illumina-novaseq",
  "identifier" : [{
    "system" : "https://www.medizininformatik-initiative.de/fhir/sid/lab-devices",
    "value" : "NOVASEQ-6000-SN12345"
  }],
  "status" : "active",
  "manufacturer" : "Illumina Inc.",
  "serialNumber" : "SN12345",
  "deviceName" : [{
    "name" : "NovaSeq 6000 Sequencing System",
    "type" : "model-name"
  }],
  "modelNumber" : "NovaSeq 6000",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "30234008",
      "display" : "Medical laboratory analyzer"
    }]
  }
}

```
