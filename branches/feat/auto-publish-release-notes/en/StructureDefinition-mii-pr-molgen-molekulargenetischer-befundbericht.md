# MII PR MolGen Molekulargenetischer Befundbericht - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII PR MolGen Molekulargenetischer Befundbericht**

## Resource Profile: MII PR MolGen Molekulargenetischer Befundbericht 

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht | *Version*:2027.0.0-ballot.rc2 |
| Active as of 2026-09-04 | *Computable Name*:MII_PR_MolGen_MolekulargenetischerBefundbericht |

 
Der DiagnosticReport ist zentraler Bestandteil aller genetischen Befundberichte und enthält Metadaten über den gesamten Bericht sowie alle relevanten Informationen, die im Rahmen der molekulargenetischen Analyse gefunden wurden. 

-------

#### Description

This profile describes the molecular genetic report (molekulargenetischer Befundbericht) of the Medical Informatics Initiative.

-------

The profile is derived from the profile [Genomics Report](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-report.html) of the [HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

For the use case that the EBM billing codes are stated in a report, 
 the [Supporting Information Extension](http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo) is used in DiagnosticReport.extension with a Reference to a ChargeItem resource. 
 A suitable [profile for ChargeItem](http://fhir.de/StructureDefinition/chargeitem-de-ebm) from the German FHIR base profiles can be used.

-------

#### Profile

-------

#### Extensions

**Genomics Artifact**

* Name: Genomics Artifact
* Definition: Captures citations, evidence and other supporting documentation for the observation or the report.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-artifact

-------

**Genomics File**

* Name: Genomics File
* Definition: Used to convey the content of, or links to, files created as part of the testing process. Examples are VCF, BAM, CRAM and other similar files.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-file

-------

**Recommended Action**

* Name: Recommended Action
* Definition: The extension points to a proposed action that is recommended on the basis of the findings of the report.
* url: https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme

-------

**Genomics Risk Assessment**

* Name: Genomics Risk Assessment
* Definition: RiskAssessment as part of a genomic report or observation.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomics-risk-assessment

-------

**Coded Note**

* Name: Coded Note
* Definition: Comments on the report that also carry a coded type.
* url: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report-note

-------

**Supporting Info**

* Name: Supporting Info
* Definition: Further information that could be relevant for this observation.
* url: http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo

-------

| | |
| :--- | :--- |
| DiagnosticReport.status | Weiteres.Berichtstatus |
| DiagnosticReport.issued | Weiteres.Datum des Berichts |
| DiagnosticReport.performer | Weiteres.Labor / Institution/ Ansprechpartner |
| DiagnosticReport.resultsInterpreter | Weiteres.Labor / Institution/ Ansprechpartner |
| DiagnosticReport.media | Ergebnisse.Daten |
| DiagnosticReport.media | Weiteres.Anhänge |
| DiagnosticReport.subject | Probeninformationen.Patient |
| DiagnosticReport.specimen | Probeninformationen.Probe |
| DiagnosticReport.identifier | Weiteres.Bericht ID |
| DiagnosticReport.extension:supporting-info(ChargeItem) | Anforderung.Einheitlicher Bewertungsmaßstab |
| DiagnosticReport.supporting-info | Methoden.Relevante Parameter |

-------

**Examples**

Report 1 BRAF

-------

Report 2 NIPBL

-------

The EBM codes to be billed in Report 2 are recorded separately in ChargeItem resources.

-------

Report 3 Risk-Panel

-------

**Usages:**

* Examples for this Profile: [DiagnosticReport/mii-exa-molgen-befundbericht-1](DiagnosticReport-mii-exa-molgen-befundbericht-1.md), [DiagnosticReport/mii-exa-molgen-befundbericht-2](DiagnosticReport-mii-exa-molgen-befundbericht-2.md), [DiagnosticReport/mii-exa-molgen-befundbericht-comprehensive-wes](DiagnosticReport-mii-exa-molgen-befundbericht-comprehensive-wes.md), [DiagnosticReport/mii-exa-molgen-befundbericht-fgfr2-fusion](DiagnosticReport-mii-exa-molgen-befundbericht-fgfr2-fusion.md)... Show 3 more, [DiagnosticReport/mii-exa-molgen-befundbericht-srcc](DiagnosticReport-mii-exa-molgen-befundbericht-srcc.md), [DiagnosticReport/mii-exa-molgen-befundbericht-trurisk-panel](DiagnosticReport-mii-exa-molgen-befundbericht-trurisk-panel.md) and [DiagnosticReport/mii-exa-molgen-befundbericht-tumorboard-3](DiagnosticReport-mii-exa-molgen-befundbericht-tumorboard-3.md)
* CapabilityStatements using this Profile: [MII CPS MolGen CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.medizininformatikinitiative.kerndatensatz.molgen|current/StructureDefinition/StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.csv), [Excel](../StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.xlsx), [Schematron](../StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-molgen-molekulargenetischer-befundbericht",
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht",
  "version" : "2027.0.0-ballot.rc2",
  "name" : "MII_PR_MolGen_MolekulargenetischerBefundbericht",
  "title" : "MII PR MolGen Molekulargenetischer Befundbericht",
  "status" : "active",
  "date" : "2026-09-04T18:16:30+00:00",
  "publisher" : "Medizininformatik-Initiative",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "Medizininformatik-Initiative"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
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
  "description" : "Der DiagnosticReport ist zentraler Bestandteil aller genetischen Befundberichte und enthält Metadaten über den gesamten Bericht sowie alle relevanten Informationen, die im Rahmen der molekulargenetischen Analyse gefunden wurden.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "MII-KDS",
    "name" : "MII KDS Mapping"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DiagnosticReport",
  "baseDefinition" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "DiagnosticReport",
      "path" : "DiagnosticReport",
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1371",
        "comment" : "Molekulargenetischer Befundbericht"
      }]
    },
    {
      "id" : "DiagnosticReport.extension:recommended-action",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "recommended-action",
      "short" : "Empfohlene Maßnahme",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Empfohlene Maßnahme"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu empfohlenen Folgemaßnahmen oder Medikationsempfehlungen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu empfohlenen Folgemaßnahmen oder Medikationsempfehlungen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.extension:genomic-risk-assessment",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "genomic-risk-assessment",
      "short" : "Genomische Risikobewertung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Genomische Risikobewertung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu einer genomischen Risikobewertung",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu einer genomischen Risikobewertung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.extension:coded-note",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "coded-note",
      "short" : "Kodierte Anmerkung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierte Anmerkung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierte Anmerkungen zum genetischen Bericht",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierte Anmerkungen zum genetischen Bericht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.extension:supporting-info",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "supporting-info",
      "short" : "Unterstützende Informationen",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Unterstützende Informationen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zusätzliche unterstützende Informationen wie Familienanamnese oder Abrechnungsdaten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Zusätzliche unterstützende Informationen wie Familienanamnese oder Abrechnungsdaten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.extension:genomic-study",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "genomic-study",
      "short" : "Genomische Studie",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Genomische Studie"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zur zugehörigen genomischen Studie",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zur zugehörigen genomischen Studie"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.extension:workflow-relatedArtifact",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "workflow-relatedArtifact",
      "short" : "Verknüpfte Artefakte",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verknüpfte Artefakte"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Verknüpfte Literatur oder andere Artefakte wie Zitationen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Verknüpfte Literatur oder andere Artefakte wie Zitationen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.status",
      "path" : "DiagnosticReport.status",
      "short" : "Status",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Status des Befundberichts",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Status des Befundberichts"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "alias" : ["Berichtstatus"],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1448",
        "comment" : "Berichtstatus"
      }]
    },
    {
      "id" : "DiagnosticReport.subject",
      "path" : "DiagnosticReport.subject",
      "short" : "Patient",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Patient auf den sich der Befundbericht bezieht",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Patient auf den sich der Befundbericht bezieht"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient",
        "http://hl7.org/fhir/StructureDefinition/Group"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.encounter",
      "path" : "DiagnosticReport.encounter",
      "short" : "Kontakt",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kontakt"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Kontakt in dessen Rahmen der Bericht erstellt wurde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Der Kontakt in dessen Rahmen der Bericht erstellt wurde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.issued",
      "path" : "DiagnosticReport.issued",
      "short" : "Freigabedatum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Freigabedatum"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Datum und Uhrzeit der Freigabe des Berichts",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Datum und Uhrzeit der Freigabe des Berichts"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "alias" : ["Datum des Berichtes", "Date Issued", "Date Verified"],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1452",
        "comment" : "Datum des Berichtes"
      }]
    },
    {
      "id" : "DiagnosticReport.performer",
      "path" : "DiagnosticReport.performer",
      "short" : "Durchführende Stelle",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Durchführende Stelle"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Das Labor oder die Institution die den Bericht erstellt hat",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Das Labor oder die Institution die den Bericht erstellt hat"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "alias" : ["Labor / Institution/ Ansprechpartner",
      "Service",
      "Practitioner",
      "Department",
      "Company",
      "Authorized by",
      "Director"],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1453",
        "comment" : "Labor / Institution/ Ansprechpartner"
      }]
    },
    {
      "id" : "DiagnosticReport.resultsInterpreter",
      "path" : "DiagnosticReport.resultsInterpreter",
      "short" : "Befundinterpreter",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Befundinterpreter"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die Person oder Organisation die die Ergebnisse interpretiert hat",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die Person oder Organisation die die Ergebnisse interpretiert hat"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "alias" : ["Labor / Institution/ Ansprechpartner", "Reported by"],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1453",
        "comment" : "Labor / Institution/ Ansprechpartner"
      }]
    },
    {
      "id" : "DiagnosticReport.specimen",
      "path" : "DiagnosticReport.specimen",
      "short" : "Probe",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Probe"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die untersuchte Probe",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Die untersuchte Probe"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.result",
      "path" : "DiagnosticReport.result",
      "short" : "Ergebnis",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Ergebnis"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenzen zu den einzelnen Beobachtungsergebnissen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenzen zu den einzelnen Beobachtungsergebnissen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.result:diagnostic-implication",
      "path" : "DiagnosticReport.result",
      "sliceName" : "diagnostic-implication",
      "short" : "Diagnostische Implikation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Diagnostische Implikation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu diagnostischen Implikationen der genetischen Befunde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu diagnostischen Implikationen der genetischen Befunde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.result:therapeutic-implication",
      "path" : "DiagnosticReport.result",
      "sliceName" : "therapeutic-implication",
      "short" : "Therapeutische Implikation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Therapeutische Implikation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu therapeutischen Implikationen der genetischen Befunde",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu therapeutischen Implikationen der genetischen Befunde"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.result:variant",
      "path" : "DiagnosticReport.result",
      "sliceName" : "variant",
      "short" : "Variante",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Variante"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu gefundenen genetischen Varianten",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu gefundenen genetischen Varianten"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.result:sequence-phase-relation",
      "path" : "DiagnosticReport.result",
      "sliceName" : "sequence-phase-relation",
      "short" : "Sequenz-Phasen-Beziehung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Sequenz-Phasen-Beziehung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu Sequenz-Phasen-Beziehungen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu Sequenz-Phasen-Beziehungen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.result:genotype",
      "path" : "DiagnosticReport.result",
      "sliceName" : "genotype",
      "short" : "Genotyp",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Genotyp"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu Genotyp-Ergebnissen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu Genotyp-Ergebnissen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.result:haplotype",
      "path" : "DiagnosticReport.result",
      "sliceName" : "haplotype",
      "short" : "Haplotyp",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Haplotyp"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu Haplotyp-Ergebnissen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu Haplotyp-Ergebnissen"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.result:biomarker",
      "path" : "DiagnosticReport.result",
      "sliceName" : "biomarker",
      "short" : "Biomarker",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Biomarker"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz zu molekularen Biomarkern wie TMB oder MSI",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Referenz zu molekularen Biomarkern wie TMB oder MSI"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekularer-biomarker"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.media",
      "path" : "DiagnosticReport.media",
      "short" : "Medien",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Medien"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Bilder oder andere Medien die zum Bericht gehören",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Bilder oder andere Medien die zum Bericht gehören"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1698",
        "comment" : "Daten"
      },
      {
        "identity" : "MII-KDS",
        "map" : "mide-dataelement-1447",
        "comment" : "Anhänge"
      }]
    },
    {
      "id" : "DiagnosticReport.conclusion",
      "path" : "DiagnosticReport.conclusion",
      "short" : "Schlussfolgerung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Schlussfolgerung"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Textuelle Zusammenfassung der Befundergebnisse",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Textuelle Zusammenfassung der Befundergebnisse"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.conclusionCode",
      "path" : "DiagnosticReport.conclusionCode",
      "short" : "Schlussfolgerungscode",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Schlussfolgerungscode"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodierte Schlussfolgerung des Befundes",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de-DE"
          },
          {
            "url" : "content",
            "valueString" : "Kodierte Schlussfolgerung des Befundes"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    }]
  }
}

```
