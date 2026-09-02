# mii-param-molgen-manifest - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mii-param-molgen-manifest**

## Parameters: mii-param-molgen-manifest



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "mii-param-molgen-manifest",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-manifestparameters"]
  },
  "parameter" : [{
    "name" : "system-version",
    "valueCanonical" : "http://snomed.info/sct|http://snomed.info/sct/900000000000207008/version/20250701"
  },
  {
    "name" : "system-version",
    "valueCanonical" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Resource-id|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Resource-profile|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/clinical-code|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/ServiceRequest-based-on|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/ServiceRequest-subject|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/ServiceRequest-authored|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/ServiceRequest-requester|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasoncode|2027.0.0-ballot.rc3"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-servicerequest-reasonreference|2027.0.0-ballot.rc3"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/DiagnosticReport|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-status|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-category|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-subject|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/clinical-encounter|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/clinical-date|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-issued|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-performer|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-results-interpreter|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-specimen|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-result|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-conclusion|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-media|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-GenomicStudy|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-RecommendedAction|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Observation|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-based-on|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-category|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-code-value-concept|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-code-value-date|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-code-value-quantity|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-code-value-string|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-component-code|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-component-code-value-concept|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-component-code-value-quantity|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-component-data-absent-reason|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-component-value-concept|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-component-value-quantity|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-data-absent-reason|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-derived-from|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-device|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-focus|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-has-member|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/clinical-identifier|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-method|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-part-of|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/clinical-patient|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-performer|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-specimen|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-status|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-subject|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-value-concept|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-value-date|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-value-quantity|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Observation-value-string|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Procedure|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Procedure-status|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Procedure-performer|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Device|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-MethodType|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-RegionsStudied|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Specimen|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/RiskAssessment|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/RiskAssessment-subject|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/RiskAssessment-performer|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Task|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Task-based-on|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Task-code|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Task-encounter|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Task-focus|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Task-intent|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Task-patient|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Task-performer|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Task-requester|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Task-status|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/Task-subject|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-reasoncode|2027.0.0-ballot.rc3"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-reasonreference|2027.0.0-ballot.rc3"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-task-for|2027.0.0-ballot.rc3"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/FamilyMemberHistory-relationship|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/FamilyMemberHistory-sex|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/SearchParameter/FamilyMemberHistory-status|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-familymemberhistory-reasoncode|2027.0.0-ballot.rc3"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/SearchParameter/mii-sp-meta-familymemberhistory-reasonreference|2027.0.0-ballot.rc3"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareableimplementationguide|2.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishableimplementationguide|2.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-implementationguide|2.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mutationslast|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekulare-konsequenz|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mikrosatelliteninstabilitaet|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Element|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Extension|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Patient|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Specimen|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Condition|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/DocumentReference|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Practitioner|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/PractitionerRole|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Organization|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/RelatedPerson|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Device|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/ChargeItem|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/evidence-level-example-vs|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/condition-inheritance-mode-vs|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Media|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/diagnostic-report-status|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-familiaere-linie|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-verwandtschaftsgrad|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-verwandtschaftsverhaeltnis|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/DomainResource|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/all-languages|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Group|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/languages|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/observation-secondaryFinding|5.3.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/bodySite|5.3.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact|5.3.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-risk-assessment|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/CarePlan|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/DeviceRequest|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/MedicationRequest|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/NutritionOrder|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/MedicationAdministration|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/MedicationDispense|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/MedicationStatement|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Immunization|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/ImagingStudy|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/observation-category|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/observation-codes|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Resource|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Encounter|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/CareTeam|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/data-absent-reason|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/observation-interpretation|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/coded-annotation|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/body-site|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/observation-methods|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/DeviceMetric|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/SimpleQuantity|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/referencerange-meaning|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/referencerange-appliesto|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/MolecularSequence|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-biomarker|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/workflow-relatedArtifactComponent|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/followup-recommendation|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/ActivityDefinition|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/performer-role|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/HealthcareService|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Location|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Coverage|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/ClaimResponse|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Provenance|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://terminology.hl7.org/ValueSet/v3-FamilyMember|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ValueSet/mii-vs-molgen-family-member-snomed|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsgrad|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-ex-molgen-familiare-linie|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://terminology.hl7.org/ValueSet/v3-PersonalRelationshipRoleType|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-icd10gm|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-alphaid|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/diagnoses-sct|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/ValueSet/mii-vs-diagnose-orphanet|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://fhir.de/StructureDefinition/CodingICD10GM|1.6.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen|1.6.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://fhir.de/StructureDefinition/seitenlokalisation|1.6.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit|1.6.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://fhir.de/StructureDefinition/CodingAlphaID|1.6.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-change-type|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-genome-build|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-genomic-source-class|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-title|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-focus|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-metrics|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-protocol-performed|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-input|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-output|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/PlanDefinition|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/procedure-not-performed-reason|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/procedure-category|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/procedure-code|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/procedure-reason|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/procedure-outcome|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Composition|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/condition-code|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/procedure-followup|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/device-action|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Medication|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/Substance|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/device-kind|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-referrer-ext|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/genomic-study-type-vs|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgnc-vs|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/medication-recommendation|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekularer-biomarker|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/molecular-biomarker-code-vs|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/molecular-biomarker-category-vs|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-consequence|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/hgvs-vs|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/molecular-consequence-vs|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/functional-effect-vs|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report-note|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo|5.3.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-reference|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/hla-genotyping-results-allele-database|5.3.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/StructureDefinition/hla-genotyping-results-glstring|5.3.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/diagnostic-service-sections|4.0.1"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/report-codes|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/ValueSet/clinical-findings|4.0.1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor|2027.0.0-ballot.rc1"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/genetic-therapeutic-implications-vs|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/medication-assessed-reference|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapy-assessed-reference|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/dna-change-type-vs|3.0.0"
  },
  {
    "name" : "default-valueset-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/ValueSet/variant-confidence-status-vs|3.0.0"
  },
  {
    "name" : "default-canonical-version",
    "valueCanonical" : "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/repeat-motif-order|3.0.0"
  }]
}

```
