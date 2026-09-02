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
