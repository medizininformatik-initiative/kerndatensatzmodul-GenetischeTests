<!-- markdownlint-disable MD041 -->
<!-- Split from the former combined search-parameters-and-operations.md per the
     TF-KDS-agreed menu structure (one page per artifact type).
     German mirror: input/translations/de/pagecontent/search-parameters.md. -->

### Search Parameters

This page lists the search parameters implementers can rely on for the
**Molekulargenetischer Befundbericht** module. It has two parts: the parameters this
module **defines itself**, and the complete set a conformant server **must support**,
which the CapabilityStatement declares.

Both tables are derived from the built artifacts, not maintained by hand — the
CapabilityStatement and the SearchParameter resources are the normative source.

#### Search parameters defined by this module

These 6 parameters address elements that the base FHIR search parameters do not
reach, because they sit in Clinical Genomics extensions. Their FHIRPath expressions
are on the linked artifact pages.

| Code | Base | Type | Artifact |
|---|---|---|---|
| `genomic-study` | DiagnosticReport | `reference` | [mii-sp-molgen-diagnostic-report-genomic-study](SearchParameter-mii-sp-molgen-diagnostic-report-genomic-study.html) |
| `recommended-action` | DiagnosticReport | `reference` | [mii-sp-molgen-diagnostic-report-recommended-action](SearchParameter-mii-sp-molgen-diagnostic-report-recommended-action.html) |
| `device` | Procedure | `reference` | [mii-sp-molgen-genomic-study-analysis-device](SearchParameter-mii-sp-molgen-genomic-study-analysis-device.html) |
| `method-type` | Procedure | `token` | [mii-sp-molgen-genomic-study-analysis-method](SearchParameter-mii-sp-molgen-genomic-study-analysis-method.html) |
| `regions-studied` | Procedure | `token` | [mii-sp-molgen-genomic-study-analysis-regions-studied](SearchParameter-mii-sp-molgen-genomic-study-analysis-regions-studied.html) |
| `specimen` | Procedure | `reference` | [mii-sp-molgen-genomic-study-analysis-specimen](SearchParameter-mii-sp-molgen-genomic-study-analysis-specimen.html) |

#### Search parameters a conformant server must support

The CapabilityStatement [MII_CPS_MolGen_CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.html)
declares 103 search parameters across 7 resource types. `_id`, `_lastUpdated` and
`_profile` are required on every resource type so that instances can be retrieved by
identity, by modification time and by the profile they claim.

| Resource | Search parameters supported |
|---|---|
| `ServiceRequest` | `_id`, `_lastUpdated`, `_profile`, `code`, `based-on`, `subject`, `authored`, `requester`, `reason-code`, `reason-reference` |
| `DiagnosticReport` | `_id`, `_lastUpdated`, `_profile`, `status`, `category`, `code`, `subject`, `encounter`, `date`, `issued`, `performer`, `results-interpreter`, `specimen`, `result`, `conclusion`, `media` |
| `Observation` | `_id`, `_lastUpdated`, `_profile`, `based-on`, `category`, `code`, `code-value-concept`, `code-value-date`, `code-value-quantity`, `code-value-string`, `component-code`, `component-code-value-concept`, `component-code-value-quantity`, `component-data-absent-reason`, `component-value-concept`, `component-value-quantity`, `data-absent-reason`, `date`, `derived-from`, `device`, `encounter`, `focus`, `has-member`, `identifier`, `method`, `part-of`, `patient`, `performer`, `specimen`, `status`, `subject`, `value-concept`, `value-date`, `value-quantity`, `value-string` |
| `Procedure` | `_id`, `_lastUpdated`, `_profile`, `status`, `subject`, `encounter`, `performer`, `date` |
| `RiskAssessment` | `_id`, `_lastUpdated`, `_profile`, `subject`, `performer`, `date` |
| `Task` | `_id`, `_lastUpdated`, `_profile`, `based-on`, `code`, `encounter`, `focus`, `intent`, `patient`, `performer`, `requester`, `status`, `subject`, `reason-code`, `reason-reference`, `for` |
| `FamilyMemberHistory` | `_id`, `_lastUpdated`, `_profile`, `code`, `date`, `identifier`, `patient`, `relationship`, `sex`, `status`, `reason-code`, `reason-reference` |

For the expectation attached to each entry (`SHALL` / `SHOULD` / `MAY`) and for the
supported interactions, read the CapabilityStatement itself — it carries them per
parameter, and this page does not repeat them.
