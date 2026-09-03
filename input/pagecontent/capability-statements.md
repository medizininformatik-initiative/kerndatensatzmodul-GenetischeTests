<!-- TODO:REVIEW machine translation of input/translations/de/pagecontent/capability-statements.md - reviewed at Gate C -->
<!-- markdownlint-disable MD041 -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/CapabilityStatement.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->
<!-- Source: kerndatensatz-basis input/pagecontent/capability-statements.md.
     German mirror: input/translations/de/pagecontent/capability-statements.md. -->
### Capability Statements

The CapabilityStatements of the **Molekulargenetischer Befundbericht** module describe the expected server/client capabilities (supported resources and interactions).

To enable decentralized data analysis through the German Health Research Data Portal (Deutsches Forschungsdatenportal für Gesundheit) of the Medical Informatics Initiative, the [capabilities interaction](https://www.hl7.org/fhir/http.html#capabilities) SHALL be supported, so that the FHIR server exposes a CapabilityStatement at `[BASE-URL]/metadata`. That CapabilityStatement SHALL state which profiles — including their version — and which search parameters are supported.

The following lists the content that SHALL be stated in the CapabilityStatement. In addition, conformance to the CapabilityStatement below SHALL be declared in the respective CapabilityStatement instance under [`CapabilityStatement.instantiates`](https://www.hl7.org/fhir/capabilitystatement-definitions.html#CapabilityStatement.instantiates).

Canonical: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/CapabilityStatement/metadata`

[mii-cps-molgen-capabilitystatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.html)

#### Supported profiles and their expectation

The rendered CapabilityStatement above lists the supported profiles as links but
**does not show the expectation attached to each one** — the IG Publisher omits it.
The table below therefore restates them. It is generated from the built
CapabilityStatement, so it cannot drift from the artifact.

| Resource | Profile | Expectation |
|---|---|---|
| `DiagnosticReport` | [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.html) | `SHALL` |
| `FamilyMemberHistory` | [MII PR MolGen Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.html) | `SHALL` |
| `Observation` | [MII PR MolGen Diagnostische Implikation](StructureDefinition-mii-pr-molgen-diagnostische-implikation.html) | `SHALL` |
| `Observation` | [MII PR MolGen Mikrosatelliteninstabilität](StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet.html) | `SHALL` |
| `Observation` | [MII PR MolGen Molekulare Konsequenz](StructureDefinition-mii-pr-molgen-molekulare-konsequenz.html) | `SHALL` |
| `Observation` | [MII PR MolGen Molekularer Biomarker](StructureDefinition-mii-pr-molgen-molekularer-biomarker.html) | `SHALL` |
| `Observation` | [MII PR MolGen Mutationslast](StructureDefinition-mii-pr-molgen-mutationslast.html) | `SHALL` |
| `Observation` | [MII PR MolGen Therapeutische Implikation](StructureDefinition-mii-pr-molgen-therapeutische-implikation.html) | `SHALL` |
| `Observation` | [MII PR MolGen Variante](StructureDefinition-mii-pr-molgen-variante.html) | `SHALL` |
| `Procedure` | [MII PR MolGen Genomic Study Analysis](StructureDefinition-mii-pr-molgen-genomic-study-analysis.html) | `SHALL` |
| `Procedure` | [MII PR MolGen Genomic Study](StructureDefinition-mii-pr-molgen-genomic-study.html) | `SHALL` |
| `RiskAssessment` | [MII PR MolGen Polygener Risiko Score](StructureDefinition-mii-pr-molgen-polygener-risiko-score.html) | `SHALL` |
| `ServiceRequest` | [MII PR MolGen Anforderung genetischer Test](StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.html) | `SHALL` |
| `Task` | [MII PR MolGen Empfohlene Folgemaßnahme](StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.html) | `SHALL` |
| `Task` | [MII PR MolGen Medikationsempfehlung](StructureDefinition-mii-pr-molgen-medikationsempfehlung.html) | `SHALL` |
| `Observation` | [MII PR MolGen Genotyp](StructureDefinition-mii-pr-molgen-genotyp.html) | `MAY` |
| `Observation` | [haplotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-haplotype.html) | `MAY` |
| `Observation` | [sequence-phase-relationship](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-sequence-phase-relationship.html) | `MAY` |

`SHALL` means a conformant server must support the profile; `MAY` means it is
specified for those who exchange this data, but no server is obliged to produce it.

#### Why three profiles are `MAY`

Of the eighteen supported profiles, fifteen carry `SHALL` and three carry `MAY`:
`genotyp`, `haplotype` and `sequence-phase-relationship`.

All three state something about **alleles as a whole** rather than about a single
finding: which alleles sit at a locus, which variants travel together, and whether
two variants sit on the same copy of a chromosome. Many laboratories never derive
these — they report the variants and stop. Requiring them with `SHALL` would oblige
implementers to produce data they do not have.

`MAY` says the useful thing instead: whoever does exchange genotypes, haplotypes or
phase relationships uses these profiles rather than inventing their own. The
mandatory core of this module is the report itself, the variants, and the
implications drawn from them.

Two of the three — `haplotype` and `sequence-phase-relationship` — are not profiled
by this module at all; they are used as they come from Clinical Genomics STU3 and are
described under [Implementer Guidance](implementer-guidance.html).
