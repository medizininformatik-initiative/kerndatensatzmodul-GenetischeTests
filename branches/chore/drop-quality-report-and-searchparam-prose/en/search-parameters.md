# Search Parameters - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* **Search Parameters**

## Search Parameters

### Search Parameters

This page lists the search parameters implementers can rely on for the **Molekulargenetischer Befundbericht** module. It has two parts: the parameters this module **defines itself**, and the complete set a conformant server **must support**, which the CapabilityStatement declares.

Both tables are derived from the built artifacts, not maintained by hand — the CapabilityStatement and the SearchParameter resources are the normative source.

#### Search parameters defined by this module

These 6 parameters address elements that the base FHIR search parameters do not reach, because they sit in Clinical Genomics extensions. Their FHIRPath expressions are on the linked artifact pages.

| | | | |
| :--- | :--- | :--- | :--- |
| `genomic-study` | DiagnosticReport | `reference` | [mii-sp-molgen-diagnostic-report-genomic-study](SearchParameter-mii-sp-molgen-diagnostic-report-genomic-study.md) |
| `recommended-action` | DiagnosticReport | `reference` | [mii-sp-molgen-diagnostic-report-recommended-action](SearchParameter-mii-sp-molgen-diagnostic-report-recommended-action.md) |
| `device` | Procedure | `reference` | [mii-sp-molgen-genomic-study-analysis-device](SearchParameter-mii-sp-molgen-genomic-study-analysis-device.md) |
| `method-type` | Procedure | `token` | [mii-sp-molgen-genomic-study-analysis-method](SearchParameter-mii-sp-molgen-genomic-study-analysis-method.md) |
| `regions-studied` | Procedure | `token` | [mii-sp-molgen-genomic-study-analysis-regions-studied](SearchParameter-mii-sp-molgen-genomic-study-analysis-regions-studied.md) |
| `specimen` | Procedure | `reference` | [mii-sp-molgen-genomic-study-analysis-specimen](SearchParameter-mii-sp-molgen-genomic-study-analysis-specimen.md) |

#### Search parameters a conformant server must support

The CapabilityStatement [MII_CPS_MolGen_CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md) declares 103 search parameters across 7 resource types. `_id`, `_lastUpdated` and `_profile` are required on every resource type so that instances can be retrieved by identity, by modification time and by the profile they claim.

| | |
| :--- | :--- |
| `ServiceRequest` | `_id`,`_lastUpdated`,`_profile`,`code`,`based-on`,`subject`,`authored`,`requester`,`reason-code`,`reason-reference` |
| `DiagnosticReport` | `_id`,`_lastUpdated`,`_profile`,`status`,`category`,`code`,`subject`,`encounter`,`date`,`issued`,`performer`,`results-interpreter`,`specimen`,`result`,`conclusion`,`media` |
| `Observation` | `_id`,`_lastUpdated`,`_profile`,`based-on`,`category`,`code`,`code-value-concept`,`code-value-date`,`code-value-quantity`,`code-value-string`,`component-code`,`component-code-value-concept`,`component-code-value-quantity`,`component-data-absent-reason`,`component-value-concept`,`component-value-quantity`,`data-absent-reason`,`date`,`derived-from`,`device`,`encounter`,`focus`,`has-member`,`identifier`,`method`,`part-of`,`patient`,`performer`,`specimen`,`status`,`subject`,`value-concept`,`value-date`,`value-quantity`,`value-string` |
| `Procedure` | `_id`,`_lastUpdated`,`_profile`,`status`,`subject`,`encounter`,`performer`,`date` |
| `RiskAssessment` | `_id`,`_lastUpdated`,`_profile`,`subject`,`performer`,`date` |
| `Task` | `_id`,`_lastUpdated`,`_profile`,`based-on`,`code`,`encounter`,`focus`,`intent`,`patient`,`performer`,`requester`,`status`,`subject`,`reason-code`,`reason-reference`,`for` |
| `FamilyMemberHistory` | `_id`,`_lastUpdated`,`_profile`,`code`,`date`,`identifier`,`patient`,`relationship`,`sex`,`status`,`reason-code`,`reason-reference` |

For the expectation attached to each entry (`SHALL` / `SHOULD` / `MAY`) and for the supported interactions, read the CapabilityStatement itself — it carries them per parameter, and this page does not repeat them.

