<!-- TODO:REVIEW machine translation of input/translations/de/pagecontent/qualitaetsbericht.md - reviewed at Gate C -->
<!-- markdownlint-disable MD041 -->
<!-- Migriert aus dem Simplifier-Leitfaden Qualitaetsbericht.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->
<!-- New page; the module template ships no scaffold for it. The page title comes
     from the page set (sushi-config.yaml and input/includes/menu.xml) and is
     deliberately not repeated here.
     German mirror: input/translations/de/pagecontent/qualitaetsbericht.md. -->

### Overview

This module is checked continuously by automated FHIR validation. The validation process uses the HL7 FHIR Validator connected to the MII terminology server.

### Validation status

| Metric | Value |
|--------|-------|
| **Validator version** | FHIR Validator 6.7.x |
| **FHIR version** | R4 (4.0.1) |
| **Terminology server** | MII TX Server |
| **Errors in total** | 57 |
| **Suppressed** | 48 |
| **Actionable** | 9 |

<!-- TODO:REVIEW The figures in the validation status come from the Simplifier state at
     migration time (commit 79eaf41). Update after the first pipeline run on the module
     template. -->

### Known validation errors (suppressed)

The following validation errors are known and are suppressed deliberately:

#### Terminology server limitations

| Error | Description | Status |
|-------|-------------|--------|
| HGNC fusion notation | `Unknown code 'HGNC:3689::HGNC:2697'` | Official notation for fusion genes, not supported by the TX server |
| StructureDefinition language code | `UNABLE_TO_INFER_CODESYSTEM` / `Terminology_TX_NoValid_16` for `de-DE` | Language codes in profile definitions are not recognized |

#### MIME type validation

| Context | MIME types | Description |
|---------|------------|-------------|
| DocumentReference | `application/gzip`, `text/plain` | Raw genomic data (FASTQ, BED) |
| Media | `image/png` | Coverage plots |

These MIME types are valid but are not recognized by the terminology server (`UNABLE_TO_INFER_CODESYSTEM`, `Terminology_TX_NoValid_16`).

#### Suppression configuration

The suppression rules for the HL7 FHIR Java Validator are configured in the file [`advisor.json`](https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/blob/main/advisor.json).

Further information on the advisor framework: [HL7 Confluence - Advisor File](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation#IGPublisherDocumentation-AdvisorFile)

### Validation pipeline

Validation runs automatically on every push via GitHub Actions:

```
CI (FHIR Validation)
├── JAVA_FHIR_VALIDATION (~42 min)
│   └── HL7 FHIR Validator mit TX-Server
└── DOTNET_FHIR_VALIDATION (~2 min)
    └── Firely.Terminal
```

#### Pipeline optimization (experimental)

The Java validation is currently the bottleneck of the CI/CD pipeline. The main causes of the long runtime:

| Phase | Description | Optimization potential |
|-------|-------------|------------------------|
| **Package download** | ~150 MB of FHIR packages (hl7.terminology.r4, genomics-reporting, etc.) | Caching |
| **Snapshot generation** | Building the snapshot elements for all dependencies along the inheritance chain | Already pre-computed in published packages |
| **Validation** | The actual check of the ~130 resources | Incremental validation |

**Current experiment:** the pipeline was extended with FHIR package caching, to reduce the download and parsing time on repeated runs. Results will be evaluated after several runs.

### Open issues

See [GitHub Issues](https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/issues) for open issues and feature requests.
