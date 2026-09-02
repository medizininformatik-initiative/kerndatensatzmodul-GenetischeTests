<!-- markdownlint-disable MD041 -->
<!-- Split from the former combined search-parameters-and-operations.md per the
     TF-KDS-agreed menu structure (one page per artifact type).
     The per-parameter explanations below replace the search-parameter blocks that
     used to be repeated on all 14 profile intro pages; those were removed on
     2026-09-02 because they duplicated the CapabilityStatement, drifted from it,
     and named the wrong module. This page and the CapabilityStatement are now the
     only places search parameters are stated.
     German mirror: input/translations/de/pagecontent/search-parameters.md. -->

### Search Parameters

This page lists the search parameters implementers can rely on for the
**Molekulargenetischer Befundbericht** module. It has two parts: the parameters this
module **defines itself**, each explained below, and the complete set a conformant
server **must support**, which the CapabilityStatement declares.

Both parts are derived from the built artifacts, not maintained by hand — the
CapabilityStatement and the SearchParameter resources are the normative source.

#### Search parameters defined by this module

Clinical Genomics STU3 carries several data elements in **extensions** rather than in
the base resource. The FHIR base search parameters cannot see into an extension, so
these six elements would be unsearchable without a parameter of their own. Each one
below names the element it reaches, the reason the base parameters do not, and a
worked query.

In the examples, `[base]` is the server's FHIR base URL.

##### `genomic-study` — from a report back to the study that produced it

Finds the reports produced by a given genomic study. `DiagnosticReport.result` points
at the *observations*; the study itself hangs off the report in the
`genomic-study-reference` extension, which no base parameter reaches.

| | |
|---|---|
| Base / type / target | `DiagnosticReport` · `reference` · `Procedure` |
| Expression | `DiagnosticReport.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-reference').value` |
| Artifact | [mii-sp-molgen-diagnostic-report-genomic-study](SearchParameter-mii-sp-molgen-diagnostic-report-genomic-study.html) |

```
GET [base]/DiagnosticReport?genomic-study=Procedure/mii-exa-molgen-genomic-study-tso500
```

##### `recommended-action` — reports carrying a given follow-up recommendation

Finds the reports that recommend a particular follow-up action — a confirmatory test,
a family investigation, a therapy recommendation. The action is a `Task` referenced
from the `recommended-action` extension, so it is not reachable through
`DiagnosticReport.result`.

| | |
|---|---|
| Base / type / target | `DiagnosticReport` · `reference` · `Task` |
| Expression | `DiagnosticReport.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action').value` |
| Artifact | [mii-sp-molgen-diagnostic-report-recommended-action](SearchParameter-mii-sp-molgen-diagnostic-report-recommended-action.html) |

```
GET [base]/DiagnosticReport?recommended-action=Task/mii-exa-molgen-folgemassnahme-1
```

##### `regions-studied` — telling "not found" apart from "not looked for"

The one parameter here with clinical consequence rather than convenience. A report
that does not mention a variant in *BRCA1* means nothing until you know whether
*BRCA1* was examined at all. The examined regions sit in the `studied`
sub-extension of `genomic-study-analysis-regions`; this parameter is what lets a
query establish coverage.

| | |
|---|---|
| Base / type | `Procedure` · `token` |
| Expression | `Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions').extension.where(url='studied').value` |
| Artifact | [mii-sp-molgen-genomic-study-analysis-regions-studied](SearchParameter-mii-sp-molgen-genomic-study-analysis-regions-studied.html) |

```
GET [base]/Procedure?regions-studied=http://www.genenames.org/geneId|HGNC:1100
```

##### `method-type` — analyses by the method applied

Finds analyses by the sequencing or genotyping method used — sequencing, DNA hybridization,
computational analysis. The method determines what the analysis can
and cannot detect, which is why it is searchable in its own right. It sits in the
`genomic-study-analysis-method-type` extension; `Procedure.code` carries the
procedure, not the method.

| | |
|---|---|
| Base / type | `Procedure` · `token` |
| Expression | `Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type').value` |
| Artifact | [mii-sp-molgen-genomic-study-analysis-method](SearchParameter-mii-sp-molgen-genomic-study-analysis-method.html) |

```
GET [base]/Procedure?method-type=http://loinc.org|LA26398-0
```

##### `specimen` — analyses performed on a given specimen

Finds the analyses run on a particular specimen, for example to see everything derived
from one tumour block. `Procedure` has no base `specimen` search parameter at all in
R4; the reference sits in the `genomic-study-analysis-specimen` extension.

| | |
|---|---|
| Base / type / target | `Procedure` · `reference` · `Specimen` |
| Expression | `Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen').value` |
| Artifact | [mii-sp-molgen-genomic-study-analysis-specimen](SearchParameter-mii-sp-molgen-genomic-study-analysis-specimen.html) |

```
GET [base]/Procedure?specimen=Specimen/mii-exa-molgen-specimen-ffpe-tumor
```

##### `device` — analyses run on a given instrument

Finds the analyses produced by a particular sequencer or analytical device. This is
the trace back to the instrument, which matters when a platform is recalled,
recalibrated or found to misbehave on a class of variants. The device sits in the
`genomic-study-analysis-device` extension.

| | |
|---|---|
| Base / type / target | `Procedure` · `reference` · `Device` |
| Expression | `Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device').value` |
| Artifact | [mii-sp-molgen-genomic-study-analysis-device](SearchParameter-mii-sp-molgen-genomic-study-analysis-device.html) |

```
GET [base]/Procedure?device=Device/mii-exa-molgen-device-tso500-lot
```

#### Search parameters a conformant server must support

The CapabilityStatement [MII_CPS_MolGen_CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.html)
declares 110 search parameters across 7 resource types — the 6 above and 104 taken
from the FHIR base specification. `_id`, `_lastUpdated` and `_profile` are required on
every resource type so that instances can be retrieved by identity, by modification
time and by the profile they claim.

| Resource | Search parameters supported |
|---|---|
| `ServiceRequest` | `_id`, `_lastUpdated`, `_profile`, `code`, `based-on`, `subject`, `authored`, `requester`, `reason-code`, `reason-reference` |
| `DiagnosticReport` | `_id`, `_lastUpdated`, `_profile`, `status`, `category`, `code`, `subject`, `encounter`, `date`, `issued`, `performer`, `results-interpreter`, `specimen`, `result`, `conclusion`, `media`, `genomic-study`, `recommended-action` |
| `Observation` | `_id`, `_lastUpdated`, `_profile`, `based-on`, `category`, `code`, `code-value-concept`, `code-value-date`, `code-value-quantity`, `code-value-string`, `component-code`, `component-code-value-concept`, `component-code-value-quantity`, `component-data-absent-reason`, `component-value-concept`, `component-value-quantity`, `data-absent-reason`, `date`, `derived-from`, `device`, `encounter`, `focus`, `has-member`, `identifier`, `method`, `part-of`, `patient`, `performer`, `specimen`, `status`, `subject`, `value-concept`, `value-date`, `value-quantity`, `value-string` |
| `Procedure` | `_id`, `_lastUpdated`, `_profile`, `status`, `code`, `subject`, `encounter`, `performer`, `date`, `device`, `method-type`, `regions-studied`, `specimen` |
| `RiskAssessment` | `_id`, `_lastUpdated`, `_profile`, `subject`, `performer`, `date` |
| `Task` | `_id`, `_lastUpdated`, `_profile`, `based-on`, `code`, `encounter`, `focus`, `intent`, `patient`, `performer`, `requester`, `status`, `subject`, `reason-code`, `reason-reference`, `for` |
| `FamilyMemberHistory` | `_id`, `_lastUpdated`, `_profile`, `code`, `date`, `identifier`, `patient`, `relationship`, `sex`, `status`, `reason-code`, `reason-reference` |

`Procedure.code` distinguishes a GenomicStudy from a GenomicStudyAnalysis — both are
`Procedure`, and without the code they cannot be told apart server-side.

For the expectation attached to each entry (`SHALL` / `SHOULD` / `MAY`) and for the
supported interactions, read the CapabilityStatement itself — it carries them per
parameter, and this page does not repeat them.
