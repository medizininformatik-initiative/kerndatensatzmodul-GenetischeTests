# Beispiel Mutationslast in Tumorprobe - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **Beispiel Mutationslast in Tumorprobe**

## Beispiel Observation: Beispiel Mutationslast in Tumorprobe

-------

**German**

-------

Profiles: [MII PR MolGen Mutationslast](StructureDefinition-mii-pr-molgen-mutationslast.md) version: 2027.0.0-ballot.rc1, [http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/tmb|3.0.0](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.meta@2027.0.0-ballot.rc3&canonical=http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/tmb|3.0.0)

**status**: Final

**category**: Laboratory, A characterization of a given biomarker observation.

**code**: Mutations/Megabase [# Ratio] in Tumor

**subject**: [Maja Julia Van-der-Dussen (official) Female, DoB: 1968-09-19 ( Krankenaktennummer (use: usual, ))](Patient-mii-exa-molgen-patient.md)

**performer**: [Practitioner Dr. Daniel Schmidt(official)](Practitioner-mii-exa-molgen-practitioner-lab.md)

**value**: 12 Mutations/Megabase (Details: UCUM code1/1000000{Base} = '1/1000000{Base}')

**specimen**: [Specimen: identifier = https://biobank.uk-musterstadt.de/fhir/sid/proben#5432; status = available; type = Tissue specimen from colon (specimen)](Specimen-mii-exa-molgen-specimen-1.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "mii-exa-molgen-mutationslast-1",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mutationslast|2027.0.0-ballot.rc1",
    "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/tmb|3.0.0"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "laboratory",
      "display" : "Laboratory"
    }]
  },
  {
    "coding" : [{
      "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
      "code" : "biomarker-category",
      "display" : "A characterization of a given biomarker observation."
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "94076-7",
      "display" : "Mutations/Megabase [# Ratio] in Tumor"
    }]
  },
  "subject" : {
    "reference" : "Patient/mii-exa-molgen-patient"
  },
  "performer" : [{
    "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
  }],
  "valueQuantity" : {
    "value" : 12,
    "unit" : "Mutations/Megabase",
    "system" : "http://unitsofmeasure.org",
    "code" : "1/1000000{Base}"
  },
  "specimen" : {
    "reference" : "Specimen/mii-exa-molgen-specimen-1"
  }
}

```
