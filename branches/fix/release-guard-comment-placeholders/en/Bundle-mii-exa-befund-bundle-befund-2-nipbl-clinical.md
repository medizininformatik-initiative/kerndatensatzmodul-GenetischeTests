# mii-exa-befund-bundle-befund-2-nipbl-clinical - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-exa-befund-bundle-befund-2-nipbl-clinical**

## Example Bundle: mii-exa-befund-bundle-befund-2-nipbl-clinical



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "mii-exa-befund-bundle-befund-2-nipbl-clinical",
  "type" : "transaction",
  "timestamp" : "2022-11-21T14:44:00+01:00",
  "entry" : [{
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-patient-2",
    "resource" : {
      "resourceType" : "Patient",
      "id" : "mii-exa-molgen-patient-2",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Patient_mii-exa-molgen-patient-2\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Patient mii-exa-molgen-patient-2</b></p><a name=\"mii-exa-molgen-patient-2\"> </a><a name=\"hcmii-exa-molgen-patient-2\"> </a><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</p><hr/><table class=\"grid\"><tr><td style=\"background-color: #f3f5da\" title=\"Known status of Patient\">Deceased:</td><td colspan=\"3\">false</td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Other Id (see the one above)\">Other Id:</td><td colspan=\"3\">Gesetzliche Krankenversicherung/Z900211002 (use: official, )</td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Ways to contact the Patient\">Contact Detail</td><td colspan=\"3\">Anna-Louisa-Karsch Str. 2 Berlin DE-BE 10178 DE </td></tr></table></div></div>"
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
        "value" : "146314909",
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
        "value" : "Z900211002",
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
        "family" : "Müller",
        "_family" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/humanname-own-name",
            "valueString" : "Müller"
          }]
        },
        "given" : ["Melanie", "Marie"]
      }],
      "gender" : "female",
      "birthDate" : "2021-09-19",
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
      "url" : "Patient/mii-exa-molgen-patient-2"
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
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-condition-nipbl-clinical",
    "resource" : {
      "resourceType" : "Condition",
      "id" : "mii-exa-molgen-condition-nipbl-clinical",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Condition_mii-exa-molgen-condition-nipbl-clinical\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Condition mii-exa-molgen-condition-nipbl-clinical</b></p><a name=\"mii-exa-molgen-condition-nipbl-clinical\"> </a><a name=\"hcmii-exa-molgen-condition-nipbl-clinical\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"https://medizininformatik-initiative.github.io/kerndatensatz-basis/2027.0.0-ballot.rc1/StructureDefinition-mii-pr-diagnose-condition.html\">MII PR Diagnose Condition</a></p></div><p><b>clinicalStatus</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/condition-clinical active}\">Active</span></p><p><b>verificationStatus</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/condition-ver-status confirmed}\">Confirmed</span></p><p><b>code</b>: <span title=\"Codes:{http://fhir.de/CodeSystem/bfarm/icd-10-gm Q87.1}, {http://www.omim.org 122470}\">Angeborene Fehlbildungssyndrome, die vorwiegend mit Kleinwuchs einhergehen</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>onset</b>: 2021-09-19 --&gt; (ongoing)</p><p><b>recordedDate</b>: 2022-03-06 07:36:00+0100</p><p><b>recorder</b>: <a href=\"Practitioner-mii-exa-molgen-practitioner-physician.html\">Practitioner Dr. Linda Rubens(official)</a></p><p><b>asserter</b>: <a href=\"Practitioner-mii-exa-molgen-practitioner-physician.html\">Practitioner Dr. Linda Rubens(official)</a></p><h3>Evidences</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Detail</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"DiagnosticReport-mii-exa-molgen-befundbericht-2.html\">Diagnostic Report for 'Genetic analysis report' for '-&gt;Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))'</a></td></tr></table></div></div>"
      },
      "clinicalStatus" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
          "code" : "active"
        }]
      },
      "verificationStatus" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
          "code" : "confirmed"
        }]
      },
      "code" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit",
            "valueCoding" : {
              "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT",
              "code" : "G"
            }
          }],
          "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
          "version" : "2021",
          "code" : "Q87.1",
          "display" : "Angeborene Fehlbildungssyndrome, die vorwiegend mit Kleinwuchs einhergehen"
        },
        {
          "system" : "http://www.omim.org",
          "code" : "122470",
          "display" : "Cornelia de Lange syndrome 1"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "onsetPeriod" : {
        "start" : "2021-09-19",
        "_start" : {
          "extension" : [{
            "url" : "http://fhir.de/StructureDefinition/lebensphase",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "255407002",
                "display" : "Neonatal (qualifier value)"
              }]
            }
          }]
        }
      },
      "recordedDate" : "2022-03-06T07:36:00+01:00",
      "recorder" : {
        "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
      },
      "asserter" : {
        "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
      },
      "evidence" : [{
        "detail" : [{
          "reference" : "DiagnosticReport/mii-exa-molgen-befundbericht-2"
        }]
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "Condition/mii-exa-molgen-condition-nipbl-clinical"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-phenotypic-feature-1",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "mii-exa-molgen-phenotypic-feature-1",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Observation_mii-exa-molgen-phenotypic-feature-1\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation mii-exa-molgen-phenotypic-feature-1</b></p><a name=\"mii-exa-molgen-phenotypic-feature-1\"> </a><a name=\"hcmii-exa-molgen-phenotypic-feature-1\"> </a><p><b>status</b>: Final</p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/observation-category exam}\">Exam</span></p><p><b>code</b>: <span title=\"Codes:{http://human-phenotype-ontology.org HP:0000527}\">Long eyelashes</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>effective</b>: 2022-03-13 09:30:00+0100</p><p><b>performer</b>: <a href=\"Practitioner-mii-exa-molgen-practitioner-physician.html\">Practitioner Dr. Linda Rubens(official)</a></p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA9633-4}\">Present</span></p></div></div>"
      },
      "status" : "final",
      "category" : [{
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "exam"
        }]
      }],
      "code" : {
        "coding" : [{
          "system" : "http://human-phenotype-ontology.org",
          "code" : "HP:0000527",
          "display" : "Long eyelashes"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "effectiveDateTime" : "2022-03-13T09:30:00+01:00",
      "performer" : [{
        "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
      }],
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "LA9633-4",
          "display" : "Present"
        }]
      }
    },
    "request" : {
      "method" : "PUT",
      "url" : "Observation/mii-exa-molgen-phenotypic-feature-1"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-phenotypic-feature-2",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "mii-exa-molgen-phenotypic-feature-2",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Observation_mii-exa-molgen-phenotypic-feature-2\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation mii-exa-molgen-phenotypic-feature-2</b></p><a name=\"mii-exa-molgen-phenotypic-feature-2\"> </a><a name=\"hcmii-exa-molgen-phenotypic-feature-2\"> </a><p><b>status</b>: Final</p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/observation-category exam}\">Exam</span></p><p><b>code</b>: <span title=\"Codes:{http://human-phenotype-ontology.org HP:0001518}\">Small for gestational age</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>effective</b>: 2022-03-13 09:30:00+0100</p><p><b>performer</b>: <a href=\"Practitioner-mii-exa-molgen-practitioner-physician.html\">Practitioner Dr. Linda Rubens(official)</a></p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA9633-4}\">Present</span></p></div></div>"
      },
      "status" : "final",
      "category" : [{
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "exam"
        }]
      }],
      "code" : {
        "coding" : [{
          "system" : "http://human-phenotype-ontology.org",
          "code" : "HP:0001518",
          "display" : "Small for gestational age"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "effectiveDateTime" : "2022-03-13T09:30:00+01:00",
      "performer" : [{
        "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
      }],
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "LA9633-4",
          "display" : "Present"
        }]
      }
    },
    "request" : {
      "method" : "PUT",
      "url" : "Observation/mii-exa-molgen-phenotypic-feature-2"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-phenotypic-feature-3",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "mii-exa-molgen-phenotypic-feature-3",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Observation_mii-exa-molgen-phenotypic-feature-3\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation mii-exa-molgen-phenotypic-feature-3</b></p><a name=\"mii-exa-molgen-phenotypic-feature-3\"> </a><a name=\"hcmii-exa-molgen-phenotypic-feature-3\"> </a><p><b>status</b>: Final</p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/observation-category exam}\">Exam</span></p><p><b>code</b>: <span title=\"Codes:{http://human-phenotype-ontology.org HP:0000252}\">Microcephaly</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>effective</b>: 2022-03-13 09:30:00+0100</p><p><b>performer</b>: <a href=\"Practitioner-mii-exa-molgen-practitioner-physician.html\">Practitioner Dr. Linda Rubens(official)</a></p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA9633-4}\">Present</span></p></div></div>"
      },
      "status" : "final",
      "category" : [{
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "exam"
        }]
      }],
      "code" : {
        "coding" : [{
          "system" : "http://human-phenotype-ontology.org",
          "code" : "HP:0000252",
          "display" : "Microcephaly"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "effectiveDateTime" : "2022-03-13T09:30:00+01:00",
      "performer" : [{
        "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
      }],
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "LA9633-4",
          "display" : "Present"
        }]
      }
    },
    "request" : {
      "method" : "PUT",
      "url" : "Observation/mii-exa-molgen-phenotypic-feature-3"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-phenotypic-feature-4",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "mii-exa-molgen-phenotypic-feature-4",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Observation_mii-exa-molgen-phenotypic-feature-4\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation mii-exa-molgen-phenotypic-feature-4</b></p><a name=\"mii-exa-molgen-phenotypic-feature-4\"> </a><a name=\"hcmii-exa-molgen-phenotypic-feature-4\"> </a><p><b>status</b>: Final</p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/observation-category exam}\">Exam</span></p><p><b>code</b>: <span title=\"Codes:{http://human-phenotype-ontology.org HP:0003560}\">Muscular dystrophy</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>effective</b>: 2022-03-13 09:30:00+0100</p><p><b>performer</b>: <a href=\"Practitioner-mii-exa-molgen-practitioner-physician.html\">Practitioner Dr. Linda Rubens(official)</a></p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA9633-4}\">Present</span></p></div></div>"
      },
      "status" : "final",
      "category" : [{
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "exam"
        }]
      }],
      "code" : {
        "coding" : [{
          "system" : "http://human-phenotype-ontology.org",
          "code" : "HP:0003560",
          "display" : "Muscular dystrophy"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "effectiveDateTime" : "2022-03-13T09:30:00+01:00",
      "performer" : [{
        "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
      }],
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "LA9633-4",
          "display" : "Present"
        }]
      }
    },
    "request" : {
      "method" : "PUT",
      "url" : "Observation/mii-exa-molgen-phenotypic-feature-4"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-befundbericht-2",
    "resource" : {
      "resourceType" : "DiagnosticReport",
      "id" : "mii-exa-molgen-befundbericht-2",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht|2027.0.0-ballot.rc1",
        "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report|3.0.0"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"DiagnosticReport_mii-exa-molgen-befundbericht-2\"> </a><p class=\"res-header-id\"><b>Generated Narrative: DiagnosticReport mii-exa-molgen-befundbericht-2</b></p><a name=\"mii-exa-molgen-befundbericht-2\"> </a><a name=\"hcmii-exa-molgen-befundbericht-2\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profiles: <a href=\"StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.html\">MII PR MolGen Molekulargenetischer Befundbericht</a> version: 2027.0.0-ballot.rc1, <a href=\"http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-report.html\">Genomic Report</a> version: 3.0.0</p></div><h2><span title=\"Codes:{http://loinc.org 51969-4}\">Genetic analysis report</span> (<span title=\"Codes:{http://terminology.hl7.org/CodeSystem/v2-0074 GE}\">Genetics</span>) </h2><table class=\"grid\"><tr><td>Subject</td><td>Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</td></tr><tr><td>Performer</td><td> <a href=\"Practitioner-mii-exa-molgen-practitioner-lab.html\">Practitioner Dr. Daniel Schmidt(official)</a></td></tr></table><p><b>Report Details</b></p><table class=\"grid\"><tr><td><b>Code</b></td><td><b>Value</b></td><td><b>Flags</b></td><td><b>Relevant Time</b></td></tr><tr><td><a href=\"Observation-mii-exa-molgen-diagnostische-implikation-2.html\"><span title=\"Codes:{http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs diagnostic-implication}\">Diagnostic Implication</span></a></td><td/><td>Final</td><td>2022-03-16</td></tr><tr><td><a href=\"Observation-mii-exa-molgen-variante-2.html\"><span title=\"Codes:{http://loinc.org 69548-6}\">Genetic variant assessment</span></a></td><td><span title=\"Codes:{http://loinc.org LA9633-4}\">Present</span></td><td>Final</td><td>2022-03-16</td></tr></table><p>Nachweis der pathogenen Variante c.2207del p.(Pro736Glnfs*58) (heterozygot) im NIPBL-Gen.</p></div></div>"
      },
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
        "valueRelatedArtifact" : {
          "type" : "citation",
          "citation" : "Gillis LA, McCallum J, Kaur M, DeScipio C, Yaeger D, Mariani A, Kline AD, Li HH, Devoto M, Jackson LG, Krantz ID. NIPBL mutational analysis in 120 individuals with Cornelia de Lange syndrome and evaluation of genotype-phenotype correlations. Am J Hum Genet. 2004 Oct;75(4):610-23. doi: 10.1086/424698. Epub 2004 Aug 18. PMID: 15318302; PMCID: PMC1182048.",
          "url" : "https://pubmed.ncbi.nlm.nih.gov/15318302/"
        }
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
        "valueRelatedArtifact" : {
          "type" : "citation",
          "citation" : "Kawauchi S, Calof AL, Santos R, Lopez-Burks ME, Young CM, Hoang MP, Chua A, Lao T, Lechner MS, Daniel JA, Nussenzweig A, Kitzes L, Yokomori K, Hallgrimsson B, Lander AD. Multiple organ system defects and transcriptional dysregulation in the Nipbl(+/-) mouse, a model of Cornelia de Lange Syndrome. PLoS Genet. 2009 Sep;5(9):e1000650. doi: 10.1371/journal.pgen.1000650. Epub 2009 Sep 18. PMID: 19763162; PMCID: PMC2730539.",
          "url" : "https://pubmed.ncbi.nlm.nih.gov/19763162/"
        }
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
        "valueRelatedArtifact" : {
          "type" : "citation",
          "citation" : "Huisman SA, Redeker EJ, Maas SM, Mannens MM, Hennekam RC. High rate of mosaicism in individuals with Cornelia de Lange syndrome. J Med Genet. 2013 May;50(5):339-44. doi: 10.1136/jmedgenet-2012-101477. Epub 2013 Mar 15. PMID: 23505322.",
          "url" : "https://pubmed.ncbi.nlm.nih.gov/23505322/"
        }
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
        "valueRelatedArtifact" : {
          "type" : "citation",
          "citation" : "Kline AD, Moss JF, Selicorni A, Bisgaard AM, Deardorff MA, Gillett PM, Ishman SL, Kerr LM, Levin AV, Mulder PA, Ramos FJ, Wierzba J, Ajmone PF, Axtell D, Blagowidow N, Cereda A, Costantino A, Cormier-Daire V, FitzPatrick D, Grados M, Groves L, Guthrie W, Huisman S, Kaiser FJ, Koekkoek G, Levis M, Mariani M, McCleery JP, Menke LA, Metrena A, O'Connor J, Oliver C, Pie J, Piening S, Potter CJ, Quaglio AL, Redeker E, Richman D, Rigamonti C, Shi A, Tümer Z, Van Balkom IDC, Hennekam RC. Diagnosis and management of Cornelia de Lange syndrome: first international consensus statement. Nat Rev Genet. 2018 Oct;19(10):649-666. doi: 10.1038/s41576-018-0031-0. PMID: 29995837; PMCID: PMC7136165.",
          "url" : "https://pubmed.ncbi.nlm.nih.gov/29995837/"
        }
      },
      {
        "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report-note",
        "valueAnnotation" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/annotation-code",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "116148004",
                "display" : "Molecular genetics procedure (procedure)"
              }]
            }
          }],
          "text" : "Gen-Panel zusammengestellt nach den aktuellen Empfehlungen des Deutschen Konsortiums für erblichen Brust- und Eierstockkrebs sowie der ClinGen Breast/Ovarian Cancer Working Group (Lee et al. 2019, PMID: 30504931). Nach DNA-Extraktion wurden alle kodierenden Exons der zu untersuchenden Gene einschließlich flankierender intronischer Regionen (mindestens von -3 bis +8) angereichert (Custom Panel V02, IDT) und auf einem Illumina NextSeq 500-, NextSeq 550- oder NovaSeq 6000-Sequencer sequenziert. Zur Verifizierung der DNA-Probe wurden 14 SNPs (Single Nucleotide Polymorphism) mittels kompetitiver allelspezifischer PCR unter Verwendung fluoreszenzmarkierter Primer amplifiziert (StepOnePlus System, ThermoFisher Scientific) und analysiert (StepOnePlus software für Genotyping Experiments) und die Ergebnisse mit den Daten der NGS-Analyse verglichen (megSAP). Der Abgleich der ermittelten DNA-Sequenz erfolgte mit den in den Gendatenbanken niedergelegten Sequenzen: BRCA1 - NCBI Reference Sequence NM_007294.2, BRCA2 - ensembl ENST00000380152, ATM - NCBI Reference Sequence NM_000051.3, BARD1 - ENST00000260947.4, BRIP1 - NCBI Reference Sequence NM_032043.2, CDH1 - ensembl ENST00000261769, CHEK2 - NCBI Reference Sequence NM_007194.3, PALB2 - ensembl ENST00000261584, PTEN -  NCBI Reference Sequence NM_000214.4, RAD51C - ensembl ENST00000337432, RAD51D - ensembl ENST00000345365,  STK11 -  ensembl ENST00000326873.7 und TP53 - ensembl ENST00000269305. Es wurden außerdem Varianten nachgewiesen, die nach heutigem Wissensstand als Normvarianten ohne pathologische Bedeutung zu werten sind."
        }
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo",
        "valueReference" : {
          "reference" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-21"
        }
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo",
        "valueReference" : {
          "reference" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-22"
        }
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo",
        "valueReference" : {
          "reference" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-23"
        }
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo",
        "valueReference" : {
          "reference" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-24"
        }
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo",
        "valueReference" : {
          "reference" : "Condition/mii-exa-molgen-bundle-befund-2-nipbl-condition-lab"
        }
      }],
      "basedOn" : [{
        "reference" : "ServiceRequest/mii-exa-molgen-anforderung-2"
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
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "performer" : [{
        "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
      }],
      "specimen" : [{
        "reference" : "Specimen/mii-exa-molgen-specimen-2"
      }],
      "result" : [{
        "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-2"
      },
      {
        "reference" : "Observation/mii-exa-molgen-variante-2"
      }],
      "conclusion" : "Nachweis der pathogenen Variante c.2207del p.(Pro736Glnfs*58) (heterozygot) im NIPBL-Gen."
    },
    "request" : {
      "method" : "PUT",
      "url" : "DiagnosticReport/mii-exa-molgen-befundbericht-2"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-anforderung-2",
    "resource" : {
      "resourceType" : "ServiceRequest",
      "id" : "mii-exa-molgen-anforderung-2",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test|2027.0.0-ballot.rc1"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"ServiceRequest_mii-exa-molgen-anforderung-2\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ServiceRequest mii-exa-molgen-anforderung-2</b></p><a name=\"mii-exa-molgen-anforderung-2\"> </a><a name=\"hcmii-exa-molgen-anforderung-2\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.html\">MII PR MolGen Anforderung genetischer Test</a> version: 2027.0.0-ballot.rc1</p></div><p><b>identifier</b>: <code>https://www.charite.de/fhir/auftragsnummern</code>/gen_test_02</p><p><b>status</b>: Active</p><p><b>intent</b>: Order</p><p><b>category</b>: <span title=\"Codes:{http://snomed.info/sct 108252007}\">Laboratory procedure (procedure)</span></p><p><b>code</b>: <span title=\"Codes:{http://snomed.info/sct 405825005}, {http://loinc.org 40428-5}, {http://www.genenames.org/geneId HGNC:28862}\">Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom (MIM122470),autosomal dominanter Erbgang</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>authoredOn</b>: 2022-03-16</p><p><b>requester</b>: <a href=\"Practitioner-mii-exa-molgen-practitioner-physician.html\">Practitioner Dr. Linda Rubens(official)</a></p><p><b>reasonCode</b>: <span title=\"Codes:{http://snomed.info/sct 395507008}\">Premature infant (finding)</span>, <span title=\"Codes:{http://snomed.info/sct 276610007}, {http://human-phenotype-ontology.org HP:0001518}\">Low birth weight infant (disorder)</span>, <span title=\"Codes:{http://snomed.info/sct 431265009}, {http://human-phenotype-ontology.org HP:0000252}\">Fetal microcephaly (disorder)</span>, <span title=\"Codes:{http://snomed.info/sct 137511000119103}, {http://human-phenotype-ontology.org HP:0003560}\">Carrier of muscular dystrophy (finding)</span>, <span title=\"Codes:{http://human-phenotype-ontology.org HP:0000527}\">Long eyelashes</span></p><p><b>reasonReference</b>: </p><ul><li><a href=\"Observation-mii-exa-molgen-phenotypic-feature-1.html\">Observation Long eyelashes</a></li><li><a href=\"Observation-mii-exa-molgen-phenotypic-feature-2.html\">Observation Small for gestational age</a></li><li><a href=\"Observation-mii-exa-molgen-phenotypic-feature-3.html\">Observation Microcephaly</a></li><li><a href=\"Observation-mii-exa-molgen-phenotypic-feature-4.html\">Observation Muscular dystrophy</a></li></ul><p><b>specimen</b>: <a href=\"Specimen-mii-exa-molgen-specimen-2.html\">Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_02; status = available; type = Blood specimen with edetic acid (specimen); receivedTime = 2021-11-24</a></p></div></div>"
      },
      "identifier" : [{
        "system" : "https://www.charite.de/fhir/auftragsnummern",
        "value" : "gen_test_02"
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
        },
        {
          "system" : "http://loinc.org",
          "code" : "40428-5",
          "display" : "NIPBL gene targeted mutation analysis in Blood or Tissue by Molecular genetics method"
        },
        {
          "system" : "http://www.genenames.org/geneId",
          "code" : "HGNC:28862",
          "display" : "NIPBL"
        }],
        "text" : "Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom (MIM122470),autosomal dominanter Erbgang"
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "authoredOn" : "2022-03-16",
      "requester" : {
        "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
      },
      "reasonCode" : [{
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "395507008",
          "display" : "Premature infant (finding)"
        }]
      },
      {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "276610007",
          "display" : "Low birth weight infant (disorder)"
        },
        {
          "system" : "http://human-phenotype-ontology.org",
          "code" : "HP:0001518",
          "display" : "Small for gestational age"
        }]
      },
      {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "431265009",
          "display" : "Fetal microcephaly (disorder)"
        },
        {
          "system" : "http://human-phenotype-ontology.org",
          "code" : "HP:0000252",
          "display" : "Microcephaly"
        }]
      },
      {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "137511000119103",
          "display" : "Carrier of muscular dystrophy (finding)"
        },
        {
          "system" : "http://human-phenotype-ontology.org",
          "code" : "HP:0003560",
          "display" : "Muscular dystrophy"
        }]
      },
      {
        "coding" : [{
          "system" : "http://human-phenotype-ontology.org",
          "code" : "HP:0000527",
          "display" : "Long eyelashes"
        }]
      }],
      "reasonReference" : [{
        "reference" : "Observation/mii-exa-molgen-phenotypic-feature-1"
      },
      {
        "reference" : "Observation/mii-exa-molgen-phenotypic-feature-2"
      },
      {
        "reference" : "Observation/mii-exa-molgen-phenotypic-feature-3"
      },
      {
        "reference" : "Observation/mii-exa-molgen-phenotypic-feature-4"
      }],
      "specimen" : [{
        "reference" : "Specimen/mii-exa-molgen-specimen-2"
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "ServiceRequest/mii-exa-molgen-anforderung-2"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-chargeitem-ebm-21",
    "resource" : {
      "resourceType" : "ChargeItem",
      "id" : "mii-exa-molgen-chargeitem-ebm-21",
      "meta" : {
        "profile" : ["http://fhir.de/StructureDefinition/chargeitem-de-ebm"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"ChargeItem_mii-exa-molgen-chargeitem-ebm-21\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ChargeItem mii-exa-molgen-chargeitem-ebm-21</b></p><a name=\"mii-exa-molgen-chargeitem-ebm-21\"> </a><a name=\"hcmii-exa-molgen-chargeitem-ebm-21\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&amp;canonical=http://fhir.de/StructureDefinition/chargeitem-de-ebm\">ChargeItem für EBM-Ziffer als Abrechnungsposition</a></p></div><p><b>status</b>: Billable</p><p><b>code</b>: <span title=\"Codes:{https://fhir.kbv.de/NamingSystem/KBV_NS_Base_EBM 11513}\">Postnatale Mutationssuche zum Nachweis oder Ausschluss einer krankheitsrelevanten oder krankheitsauslösenden konstitutionellen genomischen Mutation</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>quantity</b>: 72</p></div></div>"
      },
      "status" : "billable",
      "code" : {
        "coding" : [{
          "system" : "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_EBM",
          "code" : "11513",
          "display" : "Postnatale Mutationssuche zum Nachweis oder Ausschluss einer krankheitsrelevanten oder krankheitsauslösenden konstitutionellen genomischen Mutation"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "quantity" : {
        "value" : 72
      }
    },
    "request" : {
      "method" : "PUT",
      "url" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-21"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-chargeitem-ebm-22",
    "resource" : {
      "resourceType" : "ChargeItem",
      "id" : "mii-exa-molgen-chargeitem-ebm-22",
      "meta" : {
        "profile" : ["http://fhir.de/StructureDefinition/chargeitem-de-ebm"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"ChargeItem_mii-exa-molgen-chargeitem-ebm-22\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ChargeItem mii-exa-molgen-chargeitem-ebm-22</b></p><a name=\"mii-exa-molgen-chargeitem-ebm-22\"> </a><a name=\"hcmii-exa-molgen-chargeitem-ebm-22\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&amp;canonical=http://fhir.de/StructureDefinition/chargeitem-de-ebm\">ChargeItem für EBM-Ziffer als Abrechnungsposition</a></p></div><p><b>status</b>: Billable</p><p><b>code</b>: <span title=\"Codes:{https://fhir.kbv.de/NamingSystem/KBV_NS_Base_EBM 11512}\">Gezielter Nachweis oder Ausschluss von krankheitsrelevanten oder krankheitsauslösenden großen Deletionen und/oder Duplikationen</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>quantity</b>: 6</p></div></div>"
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
    },
    "request" : {
      "method" : "PUT",
      "url" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-22"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-chargeitem-ebm-23",
    "resource" : {
      "resourceType" : "ChargeItem",
      "id" : "mii-exa-molgen-chargeitem-ebm-23",
      "meta" : {
        "profile" : ["http://fhir.de/StructureDefinition/chargeitem-de-ebm"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"ChargeItem_mii-exa-molgen-chargeitem-ebm-23\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ChargeItem mii-exa-molgen-chargeitem-ebm-23</b></p><a name=\"mii-exa-molgen-chargeitem-ebm-23\"> </a><a name=\"hcmii-exa-molgen-chargeitem-ebm-23\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&amp;canonical=http://fhir.de/StructureDefinition/chargeitem-de-ebm\">ChargeItem für EBM-Ziffer als Abrechnungsposition</a></p></div><p><b>status</b>: Billable</p><p><b>code</b>: <span title=\"Codes:{https://fhir.kbv.de/NamingSystem/KBV_NS_Base_EBM 11302}\">Zuschlag für Gemeinkosten und die wissenschaftliche ärztliche Beurteilung und Befundung komplexer genetischer Analysen im individuellen klinischen Kontext bei seltenen Erkrankungen</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>quantity</b>: 1</p></div></div>"
      },
      "status" : "billable",
      "code" : {
        "coding" : [{
          "system" : "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_EBM",
          "code" : "11302",
          "display" : "Zuschlag für Gemeinkosten und die wissenschaftliche ärztliche Beurteilung und Befundung komplexer genetischer Analysen im individuellen klinischen Kontext bei seltenen Erkrankungen"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "quantity" : {
        "value" : 1
      }
    },
    "request" : {
      "method" : "PUT",
      "url" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-23"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-chargeitem-ebm-24",
    "resource" : {
      "resourceType" : "ChargeItem",
      "id" : "mii-exa-molgen-chargeitem-ebm-24",
      "meta" : {
        "profile" : ["http://fhir.de/StructureDefinition/chargeitem-de-ebm"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"ChargeItem_mii-exa-molgen-chargeitem-ebm-24\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ChargeItem mii-exa-molgen-chargeitem-ebm-24</b></p><a name=\"mii-exa-molgen-chargeitem-ebm-24\"> </a><a name=\"hcmii-exa-molgen-chargeitem-ebm-24\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&amp;canonical=http://fhir.de/StructureDefinition/chargeitem-de-ebm\">ChargeItem für EBM-Ziffer als Abrechnungsposition</a></p></div><p><b>status</b>: Billable</p><p><b>code</b>: <span title=\"Codes:{https://fhir.kbv.de/NamingSystem/KBV_NS_Base_EBM 11301}\">Grundpauschale humangenetische in-vitro-Diagnostik bei Probeneinsendung</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>quantity</b>: 1</p></div></div>"
      },
      "status" : "billable",
      "code" : {
        "coding" : [{
          "system" : "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_EBM",
          "code" : "11301",
          "display" : "Grundpauschale humangenetische in-vitro-Diagnostik bei Probeneinsendung"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "quantity" : {
        "value" : 1
      }
    },
    "request" : {
      "method" : "PUT",
      "url" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-24"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-specimen-2",
    "resource" : {
      "resourceType" : "Specimen",
      "id" : "mii-exa-molgen-specimen-2",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Specimen_mii-exa-molgen-specimen-2\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Specimen mii-exa-molgen-specimen-2</b></p><a name=\"mii-exa-molgen-specimen-2\"> </a><a name=\"hcmii-exa-molgen-specimen-2\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.biobank@2026.0.1&amp;canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-biobank/StructureDefinition/SpecimenCore\">MII PR Biobank Specimen Bioprobe Core</a></p></div><p><b>identifier</b>: <code>https://www.charite.de/fhir/sid/bioproben</code>/specimen_02</p><p><b>status</b>: Available</p><p><b>type</b>: <span title=\"Codes:{http://snomed.info/sct 445295009}\">Blood specimen with edetic acid (specimen)</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>receivedTime</b>: 2021-11-24</p><h3>Collections</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Collected[x]</b></td></tr><tr><td style=\"display: none\">*</td><td>2021-11-23</td></tr></table></div></div>"
      },
      "identifier" : [{
        "system" : "https://www.charite.de/fhir/sid/bioproben",
        "value" : "specimen_02"
      }],
      "status" : "available",
      "type" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "445295009",
          "display" : "Blood specimen with edetic acid (specimen)"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "receivedTime" : "2021-11-24",
      "collection" : {
        "collectedDateTime" : "2021-11-23"
      }
    },
    "request" : {
      "method" : "PUT",
      "url" : "Specimen/mii-exa-molgen-specimen-2"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-device-sequencer-2",
    "resource" : {
      "resourceType" : "Device",
      "id" : "mii-exa-molgen-device-sequencer-2",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Device_mii-exa-molgen-device-sequencer-2\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Device mii-exa-molgen-device-sequencer-2</b></p><a name=\"mii-exa-molgen-device-sequencer-2\"> </a><a name=\"hcmii-exa-molgen-device-sequencer-2\"> </a><p><b>status</b>: Active</p><p><b>manufacturer</b>: Illumina</p><h3>DeviceNames</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Name</b></td><td><b>Type</b></td></tr><tr><td style=\"display: none\">*</td><td>NovaSeq 6000-Sequencer</td><td>Manufacturer name</td></tr></table></div></div>"
      },
      "status" : "active",
      "manufacturer" : "Illumina",
      "deviceName" : [{
        "name" : "NovaSeq 6000-Sequencer",
        "type" : "manufacturer-name"
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "Device/mii-exa-molgen-device-sequencer-2"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-diagnostische-implikation-2",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "mii-exa-molgen-diagnostische-implikation-2",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation|2027.0.0-ballot.rc1",
        "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication|3.0.0"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Observation_mii-exa-molgen-diagnostische-implikation-2\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation mii-exa-molgen-diagnostische-implikation-2</b></p><a name=\"mii-exa-molgen-diagnostische-implikation-2\"> </a><a name=\"hcmii-exa-molgen-diagnostische-implikation-2\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profiles: <a href=\"StructureDefinition-mii-pr-molgen-diagnostische-implikation.html\">MII PR MolGen Diagnostische Implikation</a> version: 2027.0.0-ballot.rc1, <a href=\"http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html\">Diagnostic Implication</a> version: 3.0.0</p></div><p><b>Related artifact</b>: No display for RelatedArtifact  (type: citation; citation: Richards et al., Genet Med. 2015; 17:405-24; url: https://doi.org/10.1038/gim.2015.30)</p><p><b>status</b>: Final</p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/observation-category laboratory}\">Laboratory</span>, <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/v2-0074 GE}\">Genetics</span></p><p><b>code</b>: <span title=\"Codes:{http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs diagnostic-implication}\">Diagnostic Implication</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>effective</b>: 2022-03-16</p><p><b>performer</b>: <a href=\"Practitioner-mii-exa-molgen-practitioner-lab.html\">Practitioner Dr. Daniel Schmidt(official)</a></p><p><b>derivedFrom</b>: <a href=\"Observation-mii-exa-molgen-variante-2.html\">Observation Genetic variant assessment</a></p><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs conclusion-string}\">Conclusion Text</span></p><p><b>value</b>: Nachweis einer pathogenen Variante im NIPBL-Gen in heterozygoter Form.</p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 53037-8}\">Genetic variation clinical significance [Imp]</span></p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA6668-3}\">Pathogenic</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs condition-inheritance}\">Condition Inheritance</span></p><p><b>value</b>: <span title=\"Codes:{http://human-phenotype-ontology.org HP:0000006}\">Autosomal dominant inheritance</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 81259-4}\">Associated phenotype</span></p><p><b>value</b>: <span title=\"Codes:{http://snomed.info/sct 40354009}\">De Lange syndrome (disorder)</span></p></blockquote></div></div>"
      },
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact",
        "valueRelatedArtifact" : {
          "type" : "citation",
          "citation" : "Richards et al., Genet Med. 2015; 17:405-24",
          "url" : "https://doi.org/10.1038/gim.2015.30"
        }
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
          "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
          "code" : "diagnostic-implication",
          "display" : "Diagnostic Implication"
        }]
      },
      "subject" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "effectiveDateTime" : "2022-03-16",
      "performer" : [{
        "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
      }],
      "derivedFrom" : [{
        "reference" : "Observation/mii-exa-molgen-variante-2"
      }],
      "component" : [{
        "code" : {
          "coding" : [{
            "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
            "code" : "conclusion-string"
          }]
        },
        "valueString" : "Nachweis einer pathogenen Variante im NIPBL-Gen in heterozygoter Form."
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
            "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
            "code" : "condition-inheritance"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://human-phenotype-ontology.org",
            "code" : "HP:0000006",
            "display" : "Autosomal dominant inheritance"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "81259-4",
            "display" : "Associated phenotype"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "40354009",
            "display" : "De Lange syndrome (disorder)"
          }]
        }
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "Observation/mii-exa-molgen-diagnostische-implikation-2"
    }
  },
  {
    "fullUrl" : "https://www.medizininformatik-initiative.de/fhir/mii-exa-molgen-variante-2",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "mii-exa-molgen-variante-2",
      "meta" : {
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante|2027.0.0-ballot.rc1",
        "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant|3.0.0"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"en\" lang=\"en\"><hr/><p><b>English</b></p><hr/><a name=\"Observation_mii-exa-molgen-variante-2\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation mii-exa-molgen-variante-2</b></p><a name=\"mii-exa-molgen-variante-2\"> </a><a name=\"hcmii-exa-molgen-variante-2\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profiles: <a href=\"StructureDefinition-mii-pr-molgen-variante.html\">MII PR MolGen Variante</a> version: 2027.0.0-ballot.rc1, <a href=\"http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-variant.html\">Variant</a> version: 3.0.0</p></div><p><b>basedOn</b>: <a href=\"ServiceRequest-mii-exa-molgen-anforderung-2.html\">ServiceRequest Molecular genetic test (procedure)</a></p><p><b>status</b>: Final</p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/observation-category laboratory}\">Laboratory</span>, <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/v2-0074 GE}\">Genetics</span></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 69548-6}\">Genetic variant assessment</span></p><p><b>subject</b>: <a href=\"Patient-mii-exa-molgen-patient-2.html\">Melanie Marie Müller (official) Female, DoB: 2021-09-19 ( Medical record number (use: usual, ))</a></p><p><b>effective</b>: 2022-03-16</p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA9633-4}\">Present</span></p><p><b>method</b>: <span title=\"Codes:{http://loinc.org LA26398-0}, {http://loinc.org 86206-0}\">Sequencing</span></p><p><b>specimen</b>: <a href=\"Specimen-mii-exa-molgen-specimen-2.html\">Specimen: identifier = https://www.charite.de/fhir/sid/bioproben#specimen_02; status = available; type = Blood specimen with edetic acid (specimen); receivedTime = 2021-11-24</a></p><p><b>device</b>: <a href=\"Device-mii-exa-molgen-device-sequencer-2.html\">Device: status = active; manufacturer = Illumina</a></p><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48018-6}\">Gene studied [ID]</span></p><p><b>value</b>: <span title=\"Codes:{http://www.genenames.org/geneId HGNC:28862}\">NIPBL</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 51958-7}\">Transcript reference sequence [ID]</span></p><p><b>value</b>: <span title=\"Codes:{http://www.ncbi.nlm.nih.gov/refseq NM_133433.4}\">NM_133433.4</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 47999-8}\">DNA region name [Identifier]</span></p><p><b>value</b>: Exon #10</p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48004-6}\">DNA change (c.HGVS)</span></p><p><b>value</b>: <span title=\"Codes:{http://varnomen.hgvs.org NM_133433.4:c.2207del}\">NM_133433.4:c.2207del</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48005-3}\">Amino acid change (pHGVS)</span></p><p><b>value</b>: <span title=\"Codes:{http://varnomen.hgvs.org p.(Pro736Glnfs*58)}\">p.(Pro736Glnfs*58)</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 53034-5}\">Allelic state</span></p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA6706-1}\">Heterozygous</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48019-4}\">DNA change type</span></p><p><b>value</b>: <span title=\"Codes:{http://sequenceontology.org SO:0000159}\">Deletion</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48001-2}\">Cytogenetic (chromosome) location</span></p><p><b>value</b>: <span title=\"Codes:{urn:oid:2.16.840.1.113883.6.335 5p13.2}\">5p13.2</span></p></blockquote><blockquote><p><b>component</b></p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 81252-9}\">Discrete genetic variant</span></p><p><b>value</b>: <span title=\"Codes:{http://www.ncbi.nlm.nih.gov/clinvar 1076298}, {http://www.ncbi.nlm.nih.gov/clinvar VCV001076298.1}\">1076298</span></p></blockquote></div></div>"
      },
      "basedOn" : [{
        "reference" : "ServiceRequest/mii-exa-molgen-anforderung-2"
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
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "effectiveDateTime" : "2022-03-16",
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
        },
        {
          "system" : "http://loinc.org",
          "code" : "86206-0",
          "display" : "Whole genome sequence analysis in Blood or Tissue by Molecular genetics method"
        }]
      },
      "specimen" : {
        "reference" : "Specimen/mii-exa-molgen-specimen-2"
      },
      "device" : {
        "reference" : "Device/mii-exa-molgen-device-sequencer-2"
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
            "code" : "HGNC:28862",
            "display" : "NIPBL"
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
            "code" : "NM_133433.4"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "47999-8",
            "display" : "DNA region name [Identifier]"
          }]
        },
        "valueString" : "Exon #10"
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "48004-6",
            "display" : "DNA change (c.HGVS)"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://varnomen.hgvs.org",
            "code" : "NM_133433.4:c.2207del"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "48005-3",
            "display" : "Amino acid change (pHGVS)"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://varnomen.hgvs.org",
            "code" : "p.(Pro736Glnfs*58)"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "53034-5",
            "display" : "Allelic state"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "LA6706-1",
            "display" : "Heterozygous"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "48019-4",
            "display" : "DNA change type"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://sequenceontology.org",
            "code" : "SO:0000159",
            "display" : "Deletion"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "48001-2",
            "display" : "Cytogenetic (chromosome) location"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "urn:oid:2.16.840.1.113883.6.335",
            "code" : "5p13.2"
          }]
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "81252-9",
            "display" : "Discrete genetic variant"
          }]
        },
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://www.ncbi.nlm.nih.gov/clinvar",
            "code" : "1076298"
          },
          {
            "system" : "http://www.ncbi.nlm.nih.gov/clinvar",
            "code" : "VCV001076298.1"
          }]
        }
      }]
    },
    "request" : {
      "method" : "PUT",
      "url" : "Observation/mii-exa-molgen-variante-2"
    }
  }]
}

```
