# Empfohlene Folgemaßnahme bei BRCA1 Variante - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Empfohlene Folgemaßnahme bei BRCA1 Variante**

## Beispiel Task: Empfohlene Folgemaßnahme bei BRCA1 Variante

-------

**German**

-------

Profils: [MII PR MolGen Empfohlene Folgemaßnahme](StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.md) version: 2027.0.0-ballot.rc1, [Followup Recommendation](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-followup-recommendation.html) version: 3.0.0

**basedOn**: [ServiceRequest Panelanalyse TruRisk®-V3 mit NGS basierter CNV-Analyse Bestimmung des Polygenen Risikoscores (PRS) für Brustkrebs](ServiceRequest-mii-exa-molgen-anforderung-trurisk-panel.md)

**status**: Requested

**intent**: proposal

**code**: Genetic counseling recommended

**description**: Eine genetische Beratung hinsichtlich einer gezielten Testung leiblicher Familienmitglieder wird empfohlen.

**for**: [Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Krankenaktennummer: 9166147031 (use: usual))](Patient-mii-exa-molgen-patient-brca1.md)



## Resource Content

```json
{
  "resourceType" : "Task",
  "id" : "mii-exa-molgen-folgemassnahme-brca1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme|2027.0.0-ballot.rc1",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation|3.0.0"]
  },
  "basedOn" : [{
    "reference" : "ServiceRequest/mii-exa-molgen-anforderung-trurisk-panel"
  }],
  "status" : "requested",
  "intent" : "proposal",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA14020-4",
      "display" : "Genetic counseling recommended"
    }]
  },
  "description" : "Eine genetische Beratung hinsichtlich einer gezielten Testung leiblicher Familienmitglieder wird empfohlen.",
  "for" : {
    "reference" : "Patient/mii-exa-molgen-patient-brca1"
  }
}

```
