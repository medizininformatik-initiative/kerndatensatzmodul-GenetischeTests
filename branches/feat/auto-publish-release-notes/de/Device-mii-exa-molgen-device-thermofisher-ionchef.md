# Ion Chef System - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Ion Chef System**

## Beispiel Device: Ion Chef System

-------

**German**

-------

**identifier**: `https://www.medizininformatik-initiative.de/fhir/sid/lab-devices`/IONCHEF-IC12345

**status**: Active

**manufacturer**: Thermo Fisher Scientific

**serialNumber**: IC12345

### DeviceNames

| | | |
| :--- | :--- | :--- |
| - | **Name** | **Type** |
| * | Ion Chef System | Model name |

**modelNumber**: Ion Chef

**type**: Template preparation system (Ion Chef)



## Resource Content

```json
{
  "resourceType" : "Device",
  "id" : "mii-exa-molgen-device-thermofisher-ionchef",
  "identifier" : [{
    "system" : "https://www.medizininformatik-initiative.de/fhir/sid/lab-devices",
    "value" : "IONCHEF-IC12345"
  }],
  "status" : "active",
  "manufacturer" : "Thermo Fisher Scientific",
  "serialNumber" : "IC12345",
  "deviceName" : [{
    "name" : "Ion Chef System",
    "type" : "model-name"
  }],
  "modelNumber" : "Ion Chef",
  "type" : {
    "text" : "Template preparation system (Ion Chef)"
  }
}

```
