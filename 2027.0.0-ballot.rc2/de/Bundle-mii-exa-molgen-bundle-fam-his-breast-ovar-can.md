# mii-exa-molgen-bundle-fam-his-breast-ovar-can - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* [**Artefaktübersicht**](artifacts.md)
* **mii-exa-molgen-bundle-fam-his-breast-ovar-can**

## Beispiel Bundle: mii-exa-molgen-bundle-fam-his-breast-ovar-can



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "mii-exa-molgen-bundle-fam-his-breast-ovar-can",
  "type" : "transaction",
  "timestamp" : "2022-11-04T13:47:00+01:00",
  "entry" : [{
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-patient-brca1",
    "resource" : {
      "resourceType" : "Patient",
      "id" : "mii-exa-molgen-patient-brca1",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Patient_mii-exa-molgen-patient-brca1\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Patient mii-exa-molgen-patient-brca1</b></p><a name=\"mii-exa-molgen-patient-brca1\"> </a><a name=\"hcmii-exa-molgen-patient-brca1\"> </a><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, ))</p><hr/><table class=\"grid\"><tr><td style=\"background-color: #f3f5da\" title=\"Known status of Patient\">Deceased:</td><td colspan=\"3\">false</td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Other Id (see the one above)\">Other Id:</td><td colspan=\"3\">Gesetzliche Krankenversicherung/Z977188448 (use: official, )</td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Ways to contact the Patient\">Contact Detail</td><td colspan=\"3\">Anna-Louisa-Karsch Str. 2 Berlin DE-BE 10178 DE </td></tr></table></div></div>"
      },
      "identifier" : [{
        "use" : "usual",
        "type" : {
          "coding" : [{
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "MR"
          }]
        },
        "system" : "https://www.charite.de/fhir/sid/patienten",
        "value" : "9166147031",
        "assigner" : {
          "identifier" : {
            "system" : "https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier",
            "value" : "Charité"
          },
          "display" : "Charité - Universitätsmedizin Berlin"
        }
      },
      {
        "use" : "official",
        "type" : {
          "coding" : [{
            "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
            "code" : "GKV"
          }]
        },
        "system" : "http://fhir.de/sid/gkv/kvid-10",
        "value" : "Z977188448",
        "assigner" : {
          "identifier" : {
            "use" : "official",
            "system" : "http://fhir.de/sid/arge-ik/iknr",
            "value" : "109519005"
          }
        }
      }],
      "name" : [{
        "use" : "official",
        "family" : "Schmidt-Huber",
        "_family" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/humanname-own-name",
            "valueString" : "Schmidt"
          }]
        },
        "given" : ["Elisa"]
      }],
      "gender" : "female",
      "birthDate" : "1973-03-12",
      "deceasedBoolean" : false,
      "address" : [{
        "type" : "both",
        "line" : ["Anna-Louisa-Karsch Str. 2"],
        "city" : "Berlin",
        "state" : "DE-BE",
        "postalCode" : "10178",
        "country" : "DE"
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "Patient/mii-exa-molgen-patient-brca1"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-befundbericht-trurisk-panel",
    "resource" : {
      "resourceType" : "DiagnosticReport",
      "id" : "mii-exa-molgen-befundbericht-trurisk-panel",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht|2027.0.0-ballot.rc2",
        "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report|3.0.0"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"DiagnosticReport_mii-exa-molgen-befundbericht-trurisk-panel\"> </a><p class=\"res-header-id\"><b>Generated Narrative: DiagnosticReport mii-exa-molgen-befundbericht-trurisk-panel</b></p><a name=\"mii-exa-molgen-befundbericht-trurisk-panel\"> </a><a name=\"hcmii-exa-molgen-befundbericht-trurisk-panel\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profiles: <a href=\"StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.html\">MII PR MolGen Molekulargenetischer Befundbericht</a> version: 2027.0.0-ballot.rc2, <a href=\"http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-report.html\">Genomic Report</a> version: 3.0.0</p></div><h2><span title=\"Codes:{http://loinc.org 51969-4}\">Genetic analysis report</span> (<span title=\"Codes:{http://terminology.hl7.org/CodeSystem/v2-0074 GE}\">Genetics</span>) </h2><table class=\"grid\"><tr><td>Subject</td><td>Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, ))</td></tr><tr><td>Performer</td><td> <a href=\"Practitioner-mii-exa-molgen-practitioner-lab.html\">Practitioner Dr. Daniel Schmidt(official)</a></td></tr></table><p><b>Report Details</b></p><table class=\"grid\"><tr><td><b>Code</b></td><td><b>Value</b></td><td><b>Flags</b></td><td><b>Relevant Time</b></td></tr><tr><td><a href=\"Observation-mii-exa-molgen-variante-brca1.html\"><span title=\"Codes:{http://loinc.org 69548-6}\">Genetic variant assessment</span></a></td><td><span title=\"Codes:{http://loinc.org LA9633-4}\">Present</span></td><td>Final</td><td>2022-11-01</td></tr><tr><td><a href=\"Observation-mii-exa-molgen-diagnostische-implikation-brca1.html\"><span title=\"Codes:{http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs diagnostic-implication}\">Diagnostic Implication</span></a></td><td/><td>Final</td><td>2022-11-01</td></tr></table><p>Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt.</p></div></div>"
      },
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
        "valueRelatedArtifact" : {
          "type" : "citation",
          "citation" : "Plon SE, Eccles DM, Easton D, Foulkes WD, Genuardi M, Greenblatt MS, Hogervorst FB, Hoogerbrugge N, Spurdle AB, Tavtigian SV; IARC Unclassified Genetic Variants Working Group. Sequence variant classification and reporting: recommendations for improving the interpretation of cancer susceptibility genetic test results. Hum Mutat. 2008 Nov;29(11):1282-91. doi: 10.1002/humu.20880. PMID: 18951446; PMCID: PMC3075918.",
          "url" : "https://doi.org/10.1002/humu.20880"
        }
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
        "valueRelatedArtifact" : {
          "type" : "citation",
          "citation" : "Rhiem K, Auber B, Briest S, Dikow N, Ditsch N, Dragicevic N, Grill S, Hahnen E, Horvath J, Jaeger B, Kast K, Kiechle M, Leinert E, Morlot S, Püsken M, Schäfer D, Schott S, Schroeder C, Siebers-Renelt U, Solbach C, Weber-Lassalle N, Witzel I, Zeder-Göß C, Schmutzler RK. Consensus Recommendations of the German Consortium for Hereditary Breast and Ovarian Cancer. Breast Care (Basel). 2022 Apr;17(2):199-207. doi: 10.1159/000516376. Epub 2021 Jul 19. PMID: 35702495; PMCID: PMC9149395.",
          "url" : "https://doi.org/10.1159%2F000516376"
        }
      },
      {
        "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-reference",
        "valueReference" : {
          "reference" : "Procedure/mii-exa-molgen-genomic-study-trurisk-panel"
        }
      },
      {
        "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action",
        "valueReference" : {
          "reference" : "Task/mii-exa-molgen-folgemassnahme-brca1"
        }
      },
      {
        "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-risk-assessment",
        "valueReference" : {
          "reference" : "RiskAssessment/mii-exa-molgen-prs-brca1"
        }
      }],
      "basedOn" : [{
        "reference" : "ServiceRequest/mii-exa-molgen-anforderung-trurisk-panel"
      }],
      "status" : "final",
      "category" : [{
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
          "code" : "GE",
          "display" : "Genetics"
        }]
      }],
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "51969-4",
          "display" : "Genetic analysis report"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-brca1"
      },
      "performer" : [{
        "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
      }],
      "specimen" : [{
        "reference" : "Specimen/mii-exa-molgen-specimen-brca1"
      }],
      "result" : [{
        "reference" : "Observation/mii-exa-molgen-variante-brca1"
      },
      {
        "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-brca1"
      }],
      "conclusion" : "Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt."
    },
    "request" : {
      "method" : "PUT",
      "url" : "DiagnosticReport/mii-exa-molgen-befundbericht-trurisk-panel"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-folgemassnahme-brca1",
    "resource" : {
      "resourceType" : "Task",
      "id" : "mii-exa-molgen-folgemassnahme-brca1",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme|2027.0.0-ballot.rc2",
        "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation|3.0.0"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Task_mii-exa-molgen-folgemassnahme-brca1\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Task mii-exa-molgen-folgemassnahme-brca1</b></p><a name=\"mii-exa-molgen-folgemassnahme-brca1\"> </a><a name=\"hcmii-exa-molgen-folgemassnahme-brca1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profiles: <a href=\"StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.html\">MII PR MolGen Empfohlene Folgemaßnahme</a> version: 2027.0.0-ballot.rc2, <a href=\"http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-followup-recommendation.html\">Followup Recommendation</a> version: 3.0.0</p></div><p><b>basedOn</b>: <a href=\"ServiceRequest-mii-exa-molgen-anforderung-trurisk-panel.html\">ServiceRequest Molecular genetic test (procedure)</a></p><p><b>status</b>: Requested</p><p><b>intent</b>: proposal</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org LA14020-4}\">Genetic counseling recommended</span></p><p><b>description</b>: Eine genetische Beratung hinsichtlich einer gezielten Testung leiblicher Familienmitglieder wird empfohlen.</p><p><b>for</b>: <a href=\"Patient-mii-exa-molgen-patient-brca1.html\">Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, ))</a></p></div></div>"
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
    },
    "request" : {
      "method" : "PUT",
      "url" : "Task/mii-exa-molgen-folgemassnahme-brca1"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-prs-brca1",
    "resource" : {
      "resourceType" : "RiskAssessment",
      "id" : "mii-exa-molgen-prs-brca1",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score|2027.0.0-ballot.rc2"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"RiskAssessment_mii-exa-molgen-prs-brca1\"> </a><p class=\"res-header-id\"><b>Generated Narrative: RiskAssessment mii-exa-molgen-prs-brca1</b></p><a name=\"mii-exa-molgen-prs-brca1\"> </a><a name=\"hcmii-exa-molgen-prs-brca1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-mii-pr-molgen-polygener-risiko-score.html\">MII PR MolGen Polygener Risiko Score</a> version: 2027.0.0-ballot.rc2</p></div><p><b>status</b>: Final</p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>occurrence</b>: 2022-11-01</p><p><b>basis</b>: <a href=\"Observation-mii-exa-molgen-variante-brca1.html\">Observation Genetic variant assessment</a></p><h3>Predictions</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Extension</b></td><td><b>Outcome</b></td><td><b>QualitativeRisk</b></td></tr><tr><td style=\"display: none\">*</td><td/><td><span title=\"Codes:{http://snomed.info/sct 718220008}\">Hereditary breast and ovarian cancer syndrome (disorder)</span></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/risk-probability high}\">High likelihood</span></td></tr></table></div></div>"
      },
      "status" : "final",
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "occurrenceDateTime" : "2022-11-01",
      "basis" : [{
        "reference" : "Observation/mii-exa-molgen-variante-brca1"
      }],
      "prediction" : [{
        "extension" : [{
          "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "414152003",
              "display" : "European (ethnic group)"
            }],
            "text" : "Der verwendete Polygene Risikoscore wurde bisher nur für die europäische Bevölkerung bei Brustkrebs validiert."
          }
        }],
        "outcome" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "718220008",
            "display" : "Hereditary breast and ovarian cancer syndrome (disorder)"
          }]
        },
        "qualitativeRisk" : {
          "coding" : [{
            "system" : "http://terminology.hl7.org/CodeSystem/risk-probability",
            "code" : "high",
            "display" : "High likelihood"
          }]
        }
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "RiskAssessment/mii-exa-molgen-prs-brca1"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-anforderung-trurisk-panel",
    "resource" : {
      "resourceType" : "ServiceRequest",
      "id" : "mii-exa-molgen-anforderung-trurisk-panel",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test|2027.0.0-ballot.rc2"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"ServiceRequest_mii-exa-molgen-anforderung-trurisk-panel\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ServiceRequest mii-exa-molgen-anforderung-trurisk-panel</b></p><a name=\"mii-exa-molgen-anforderung-trurisk-panel\"> </a><a name=\"hcmii-exa-molgen-anforderung-trurisk-panel\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.html\">MII PR MolGen Anforderung genetischer Test</a> version: 2027.0.0-ballot.rc2</p></div><p><b>identifier</b>: <code>https://www.charite.de/fhir/auftragsnummern</code>/gen_test_03</p><p><b>status</b>: Active</p><p><b>intent</b>: Order</p><p><b>category</b>: <span title=\"Codes:{http://snomed.info/sct 108252007}\">Laboratory procedure (procedure)</span></p><p><b>code</b>: <span title=\"Codes:{http://snomed.info/sct 405825005}\">Panelanalyse TruRisk®-V3 mit NGS basierter CNV-Analyse Bestimmung des Polygenen Risikoscores (PRS) für Brustkrebs</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-brca1.html\">Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, ))</a></p><p><b>authoredOn</b>: 2022-11-01</p><p><b>requester</b>: <a href=\"Practitioner-mii-exa-molgen-practitioner-physician.html\">Practitioner Dr. Linda Rubens(official)</a></p><p><b>reasonCode</b>: <span title=\"Codes:{http://snomed.info/sct 429740004}\">Family history of malignant neoplasm of breast (situation)</span>, <span title=\"Codes:{http://snomed.info/sct 430705002}\">Family history of malignant neoplasm of ovary (situation)</span>, <span title=\"Codes:{http://www.orpha.net 145}\">Hereditary breast and/or ovarian cancer syndrome</span>, <span title=\"Codes:{http://www.omim.org 604370}\">BREAST-OVARIAN CANCER, FAMILIAL, SUSCEPTIBILITY TO, 1; BROVCA1</span></p><p><b>specimen</b>: <a href=\"Specimen-mii-exa-molgen-specimen-brca1.html\">Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_03; status = available; type = Tissue specimen from breast (specimen); receivedTime = 2022-11-01</a></p></div></div>"
      },
      "identifier" : [{
        "system" : "https://www.charite.de/fhir/auftragsnummern",
        "value" : "gen_test_03"
      }],
      "status" : "active",
      "intent" : "order",
      "category" : [{
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "108252007",
          "display" : "Laboratory procedure (procedure)"
        }]
      }],
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "405825005",
          "display" : "Molecular genetic test (procedure)"
        }],
        "text" : "Panelanalyse TruRisk®-V3 mit NGS basierter CNV-Analyse Bestimmung des Polygenen Risikoscores (PRS) für Brustkrebs"
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-brca1"
      },
      "authoredOn" : "2022-11-01",
      "requester" : {
        "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
      },
      "reasonCode" : [{
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "429740004",
          "display" : "Family history of malignant neoplasm of breast (situation)"
        }]
      },
      {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "430705002",
          "display" : "Family history of malignant neoplasm of ovary (situation)"
        }]
      },
      {
        "coding" : [{
          "system" : "http://www.orpha.net",
          "code" : "145",
          "display" : "Hereditary breast and/or ovarian cancer syndrome"
        }]
      },
      {
        "coding" : [{
          "system" : "http://www.omim.org",
          "code" : "604370",
          "display" : "BREAST-OVARIAN CANCER, FAMILIAL, SUSCEPTIBILITY TO, 1; BROVCA1"
        }]
      }],
      "specimen" : [{
        "reference" : "Specimen/mii-exa-molgen-specimen-brca1"
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "ServiceRequest/mii-exa-molgen-anforderung-trurisk-panel"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-practitioner-lab",
    "resource" : {
      "resourceType" : "Practitioner",
      "id" : "mii-exa-molgen-practitioner-lab",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Practitioner_mii-exa-molgen-practitioner-lab\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Practitioner mii-exa-molgen-practitioner-lab</b></p><a name=\"mii-exa-molgen-practitioner-lab\"> </a><a name=\"hcmii-exa-molgen-practitioner-lab\"> </a><p><b>active</b>: true</p><p><b>name</b>: Dr. Daniel Schmidt(Official)</p></div></div>"
      },
      "active" : true,
      "name" : [{
        "use" : "official",
        "text" : "Dr. Daniel Schmidt",
        "family" : "Schmidt",
        "given" : ["Daniel"],
        "prefix" : ["Dr."]
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "Practitioner/mii-exa-molgen-practitioner-lab"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-practitioner-physician",
    "resource" : {
      "resourceType" : "Practitioner",
      "id" : "mii-exa-molgen-practitioner-physician",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Practitioner_mii-exa-molgen-practitioner-physician\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Practitioner mii-exa-molgen-practitioner-physician</b></p><a name=\"mii-exa-molgen-practitioner-physician\"> </a><a name=\"hcmii-exa-molgen-practitioner-physician\"> </a><p><b>active</b>: true</p><p><b>name</b>: Dr. Linda Rubens(Official)</p></div></div>"
      },
      "active" : true,
      "name" : [{
        "use" : "official",
        "text" : "Dr. Linda Rubens",
        "family" : "Rubens",
        "given" : ["Linda"],
        "prefix" : ["Dr."]
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "Practitioner/mii-exa-molgen-practitioner-physician"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-specimen-brca1",
    "resource" : {
      "resourceType" : "Specimen",
      "id" : "mii-exa-molgen-specimen-brca1",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Specimen_mii-exa-molgen-specimen-brca1\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Specimen mii-exa-molgen-specimen-brca1</b></p><a name=\"mii-exa-molgen-specimen-brca1\"> </a><a name=\"hcmii-exa-molgen-specimen-brca1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.biobank@2027.0.0-ballot.rc2&amp;canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore\">MII PR Biobank Specimen Bioprobe Core</a></p></div><p><b>identifier</b>: <code>https://www.charite.de/fhir/sid/bioproben</code>/specimen_03</p><p><b>status</b>: Available</p><p><b>type</b>: <span title=\"Codes:{http://snomed.info/sct 127457009}\">Tissue specimen from breast (specimen)</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-brca1.html\">Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, ))</a></p><p><b>receivedTime</b>: 2022-11-01</p><h3>Collections</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Collected[x]</b></td></tr><tr><td style=\"display: none\">*</td><td>2022-11-01</td></tr></table></div></div>"
      },
      "identifier" : [{
        "system" : "https://www.charite.de/fhir/sid/bioproben",
        "value" : "specimen_03"
      }],
      "status" : "available",
      "type" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "127457009",
          "display" : "Tissue specimen from breast (specimen)"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-brca1"
      },
      "receivedTime" : "2022-11-01",
      "collection" : {
        "collectedDateTime" : "2022-11-01"
      }
    },
    "request" : {
      "method" : "PUT",
      "url" : "Specimen/mii-exa-molgen-specimen-brca1"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-device-sequencer-nextseq",
    "resource" : {
      "resourceType" : "Device",
      "id" : "mii-exa-molgen-device-sequencer-nextseq",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Device_mii-exa-molgen-device-sequencer-nextseq\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Device mii-exa-molgen-device-sequencer-nextseq</b></p><a name=\"mii-exa-molgen-device-sequencer-nextseq\"> </a><a name=\"hcmii-exa-molgen-device-sequencer-nextseq\"> </a><p><b>status</b>: Active</p><p><b>manufacturer</b>: Illumina</p><h3>DeviceNames</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Name</b></td><td><b>Type</b></td></tr><tr><td style=\"display: none\">*</td><td>NextSeq</td><td>Manufacturer name</td></tr></table></div></div>"
      },
      "status" : "active",
      "manufacturer" : "Illumina",
      "deviceName" : [{
        "name" : "NextSeq",
        "type" : "manufacturer-name"
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "Device/mii-exa-molgen-device-sequencer-nextseq"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-variante-brca1",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "mii-exa-molgen-variante-brca1",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante|2027.0.0-ballot.rc2",
        "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant|3.0.0"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Observation_mii-exa-molgen-variante-brca1\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation mii-exa-molgen-variante-brca1</b></p><a name=\"mii-exa-molgen-variante-brca1\"> </a><a name=\"hcmii-exa-molgen-variante-brca1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profiles: <a href=\"StructureDefinition-mii-pr-molgen-variante.html\">MII PR MolGen Variante</a> version: 2027.0.0-ballot.rc2, <a href=\"http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-variant.html\">Variant</a> version: 3.0.0</p></div><p><b>basedOn</b>: <a href=\"ServiceRequest-mii-exa-molgen-anforderung-trurisk-panel.html\">ServiceRequest Molecular genetic test (procedure)</a></p><p><b>status</b>: Final</p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/observation-category laboratory}\">Laboratory</span>, <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/v2-0074 GE}\">Genetics</span></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 69548-6}\">Genetic variant assessment</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-brca1.html\">Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, ))</a></p><p><b>effective</b>: 2022-11-01</p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA9633-4}\">Present</span></p><p><b>method</b>: <span title=\"Codes:{http://loinc.org LA26398-0}\">Sequencing</span></p><p><b>specimen</b>: <a href=\"Specimen-mii-exa-molgen-specimen-brca1.html\">Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_03; status = available; type = Tissue specimen from breast (specimen); receivedTime = 2022-11-01</a></p><p><b>device</b>: <a href=\"Device-mii-exa-molgen-device-sequencer-nextseq.html\">Device: status = active; manufacturer = Illumina</a></p><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48018-6}\">Gene studied [ID]</span></p><p><b>value</b>: <span title=\"Codes:{http://www.genenames.org/geneId HGNC:1100}\">BRCA1</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48001-2}\">Cytogenetic (chromosome) location</span></p><p><b>value</b>: <span title=\"Codes:{urn:oid:2.16.840.1.113883.6.335 17q21.31}\">17q21.31</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48004-6}\">DNA change (c.HGVS)</span></p><p><b>value</b>: <span title=\"Codes:{http://varnomen.hgvs.org NM_007294.3:c.5266dupC}\">NM_007294.3:c.5266dupC</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 51958-7}\">Transcript reference sequence [ID]</span></p><p><b>value</b>: <span title=\"Codes:{http://www.ncbi.nlm.nih.gov/refseq NM_007294.3}\">NM_007294.3</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48019-4}\">DNA change type</span></p><p><b>value</b>: <span title=\"Codes:{http://sequenceontology.org SO:1000035}\">Duplication</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 82121-5}\">Allelic read depth</span></p><p><b>value</b>: 50 Abdeckung der Fragmente<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  code1 = '1')</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 81252-9}\">Discrete genetic variant</span></p><p><b>value</b>: <span title=\"Codes:{http://www.ncbi.nlm.nih.gov/projects/SNP rs80357906}\">rs80357906</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48000-4}\">Chromosome [Identifier] in Blood or Tissue by Molecular genetics method</span></p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA21270-6}\">Chromosome 17</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48005-3}\">Amino acid change (pHGVS)</span></p><p><b>value</b>: <span title=\"Codes:{http://varnomen.hgvs.org p.Gln1756Profs}\">p.Gln1756Profs</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 87706-8}\">Laboratory device Detection limit</span></p><p><b>value</b>: &gt;95 %<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  code% = '%')</span></p></blockquote></div></div>"
      },
      "basedOn" : [{
        "reference" : "ServiceRequest/mii-exa-molgen-anforderung-trurisk-panel"
      }],
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
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
          "code" : "GE"
        }]
      }],
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "69548-6",
          "display" : "Genetic variant assessment"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-brca1"
      },
      "effectiveDateTime" : "2022-11-01",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "LA9633-4",
          "display" : "Present"
        }]
      },
      "method" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "LA26398-0",
          "display" : "Sequencing"
        }]
      },
      "specimen" : {
        "reference" : "Specimen/mii-exa-molgen-specimen-brca1"
      },
      "device" : {
        "reference" : "Device/mii-exa-molgen-device-sequencer-nextseq"
      },
      "component" : [{
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "48018-6",
            "display" : "Gene studied [ID]"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://www.genenames.org/geneId",
            "code" : "HGNC:1100",
            "display" : "BRCA1"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "48001-2"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "urn:oid:2.16.840.1.113883.6.335",
            "code" : "17q21.31"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "48004-6"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://varnomen.hgvs.org",
            "code" : "NM_007294.3:c.5266dupC"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "51958-7"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://www.ncbi.nlm.nih.gov/refseq",
            "code" : "NM_007294.3"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "48019-4"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://sequenceontology.org",
            "code" : "SO:1000035",
            "display" : "Duplication"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "82121-5"
          }]
        },
        "valueQuantity" : {
          "value" : 50,
          "unit" : "Abdeckung der Fragmente",
          "system" : "http://unitsofmeasure.org",
          "code" : "1"
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "81252-9"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://www.ncbi.nlm.nih.gov/projects/SNP",
            "code" : "rs80357906"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "48000-4"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "LA21270-6",
            "display" : "Chromosome 17"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "48005-3"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://varnomen.hgvs.org",
            "code" : "p.Gln1756Profs"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "87706-8"
          }]
        },
        "valueQuantity" : {
          "value" : 95,
          "comparator" : ">",
          "unit" : "%",
          "system" : "http://unitsofmeasure.org",
          "code" : "%"
        }
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "Observation/mii-exa-molgen-variante-brca1"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-diagnostische-implikation-brca1",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "mii-exa-molgen-diagnostische-implikation-brca1",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation|2027.0.0-ballot.rc2",
        "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication|3.0.0"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Observation_mii-exa-molgen-diagnostische-implikation-brca1\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation mii-exa-molgen-diagnostische-implikation-brca1</b></p><a name=\"mii-exa-molgen-diagnostische-implikation-brca1\"> </a><a name=\"hcmii-exa-molgen-diagnostische-implikation-brca1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profiles: <a href=\"StructureDefinition-mii-pr-molgen-diagnostische-implikation.html\">MII PR MolGen Diagnostische Implikation</a> version: 2027.0.0-ballot.rc2, <a href=\"http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html\">Diagnostic Implication</a> version: 3.0.0</p></div><p><b>status</b>: Final</p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/observation-category laboratory}\">Laboratory</span>, <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/v2-0074 GE}\">Genetics</span></p><p><b>code</b>: <span title=\"Codes:{http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs diagnostic-implication}\">Diagnostic Implication</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-brca1.html\">Elisa Schmidt-Huber (official) Female, DoB: 1973-03-12 ( Medical record number (use: usual, ))</a></p><p><b>effective</b>: 2022-11-01</p><p><b>performer</b>: <a href=\"Practitioner-mii-exa-molgen-practitioner-lab.html\">Practitioner Dr. Daniel Schmidt(official)</a></p><p><b>derivedFrom</b>: <a href=\"Observation-mii-exa-molgen-variante-brca1.html\">Observation Genetic variant assessment</a></p><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs conclusion-string}\">Conclusion Text</span></p><p><b>value</b>: Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt</p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 53037-8}\">Genetic variation clinical significance [Imp]</span></p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA6668-3}\">Pathogenic</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 81259-4}\">Associated phenotype</span></p><p><b>value</b>: <span title=\"Codes:{http://human-phenotype-ontology.org HP:0003002}, {http://human-phenotype-ontology.org HP:0100615}\">Breast carcinoma</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 93044-6}\">Level of evidence</span></p><p><b>value</b>: <span title=\"Codes:{http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/clinvar-evidence-level-custom-cs 2-star}\">2 star</span></p></blockquote></div></div>"
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
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
          "code" : "GE"
        }]
      }],
      "code" : {
        "coding" : [{
          "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
          "code" : "diagnostic-implication",
          "display" : "Diagnostic Implication"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-brca1"
      },
      "effectiveDateTime" : "2022-11-01",
      "performer" : [{
        "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
      }],
      "derivedFrom" : [{
        "reference" : "Observation/mii-exa-molgen-variante-brca1"
      }],
      "component" : [{
        "code" : {
          "coding" : [{
            "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
            "code" : "conclusion-string"
          }]
        },
        "valueString" : "Nachweis heterozygoter Sequenzveränderung, die zum Funktionsverlust führt"
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "53037-8",
            "display" : "Genetic variation clinical significance [Imp]"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "LA6668-3",
            "display" : "Pathogenic"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "81259-4"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://human-phenotype-ontology.org",
            "code" : "HP:0003002",
            "display" : "Breast carcinoma"
          },
          {
            "system" : "http://human-phenotype-ontology.org",
            "code" : "HP:0100615",
            "display" : "Ovarian neoplasm"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "93044-6"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/clinvar-evidence-level-custom-cs",
            "code" : "2-star",
            "display" : "2 star"
          }]
        }
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "Observation/mii-exa-molgen-diagnostische-implikation-brca1"
    }
  }]
}

```
