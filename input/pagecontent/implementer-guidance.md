<!-- TODO:REVIEW machine translation of input/translations/de/pagecontent/implementer-guidance.md - reviewed at Gate C -->
<!-- markdownlint-disable MD041 -->
<!-- Source: kerndatensatz-basis input/pagecontent/implementer-guidance.md.
     German mirror: input/translations/de/pagecontent/implementer-guidance.md. -->
<!-- Migriert aus dem Simplifier-Leitfaden KontextimGesamtprojektBezgezuanderenModulen.page.md, Referenzen.page.md, TechnischeImplementierung/GenetischeBefunde/Haplotype-Observation.page.md, TechnischeImplementierung/GenetischeBefunde/Sequence-Phase-Relationship---Observation.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

Technical guidance for DIC implementers on implementing the profiles of the **Molekulargenetischer Befundbericht** module (ETL from primary systems, FHIR API, validation).

<!-- TODO:REVIEW The template scaffold's TODO box ("Describe the technical
     implementation steps for your module") was removed. The migrated source
     pages describe the relations to other modules, the references and two
     upstream profiles — but no ETL steps in the narrow sense. If an ETL
     description is required, it is still missing. -->

### Context within the Overall Project and Relations to Other Modules

#### Relation to the Person Module

The assignment of the results of the report to a patient specified in the order
for the report, as well as the assignment of the orderer (healthcare provider)
of the report and of the contact person at the performing laboratory, is done
via references from the MOLEKULARGENETISCHER BEFUNDBERICHT module to the
[PERSON](https://simplifier.net/mii-basismodul-person-2024) module.

#### Relation to the Biospecimen Module

For capturing the characteristics of the specimen used for the analysis, the
MOLEKULARGENETISCHER BEFUNDBERICHT module references the
[BIOBANK](https://simplifier.net/medizininformatikinitiative-modulbiobank)
module.

#### Relation to the Encounter Module

The molecular genetic tests are ordered on the basis of a patient presenting to
a healthcare provider (*encounter*) and are referenced via the
[FALL](https://simplifier.net/medizininformatikinitiative-modulfall) module.

#### Relation to the Pathology Report Module

Molecular genetic tests can be ordered on the basis of conspicuous results of an
existing pathology report. That report should then be referenced as
supportingInfo via the
[Pathologiebefund](https://simplifier.net/medizininformatikinitiative-modulpathologie)
module.

#### Relation to the Oncology Module

The module uses the variant profile of the oBDS. In the cancer registry data
there are two data elements (description and characteristic of a genetic
variant), where the description of the variant is not structured in HGVS format
but given as free text. Sites have the option here of taking the variant
directly from the oBDS or, where possible, of enriching it with further locally
available structured information. Further information can be found in the
[Modul Onkologie](https://simplifier.net/medizininformatikinitiative-modulonkologie).

#### Relation to the Molecular Tumor Board Module

The
[KDS-Modul Molekulares Tumorboard](https://simplifier.net/mii-erweiterungsmodul-molekulares-tumorboard)
uses this module as the basis for modelling a next generation sequencing report,
in particular for representing the various variants and molecular biomarkers.

#### Relation to the Rare Diseases Module

The new
[Modul Seltene Erkrankungen](https://simplifier.net/mii-modul-seltene-erkrankungen)
has no profiles of its own for molecular genetic investigations, but refers to
this module for the representation of molecular genetic data, in particular
because the requirements for genetic diagnostics of rare diseases were already
taken into account when the Molekulargenetischer Befundbericht module was
created.

### Upstream Profiles from HL7 Genomics Reporting

<!-- TODO:REVIEW This grouping heading and the following lead-in sentence were
     added editorially, to implement the requirement that the two profiles below
     are not profiled by this module. The statement itself comes from the source
     pages ("stammt aus" / "entspricht ... aus HL7 Genomics Reporting
     Implementation Guide STU3"). -->

The following two profiles come from the
[HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/)
and are not profiled by this module itself. They are described here because they
are used together with this module's profiles when implementing genetic reports.

#### Haplotype (Observation)

This profile describes the determination of a particular haplotype on the basis
of one or more variants.

Canonical: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype

<!-- TODO:REVIEW The link target in the following sentence ends in ".html.html"
     in the source page and is therefore presumably broken. Taken over
     unchanged, because link targets must not be altered in this migration. -->

The profile
[Haplotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-haplotype.html)
comes from the
[HL7 Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

##### Profile

<!-- TODO:REVIEW The right-hand cells name elements of the German logical model
     ("Methoden.Getestete Gene", "Ergebnisse.Veränderungen.Zytogenetische
     Lokalisierung") and are left untranslated, because they are element paths,
     not prose. -->

| FHIR element | Logical dataset |
|---|---|
| Observation.component:gene-studied | Methoden.Getestete Gene |
| Observation.component:CytogenicLocation | Ergebnisse.Veränderungen.Zytogenetische Lokalisierung |

#### Sequence Phase Relationship (Observation)

Indicates whether two variants are in a cis (same strand) or trans (opposite
strand) relationship to each other.

The profile corresponds to
[Sequence Phase Relationship](http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship)
from the
[HL7 Genomics Reporting Implementation Guide STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/).

##### Terminology

###### CodeSystem

**Sequence Phase Relationship CodeSystem**

[SequencePhaseRelationshipCS](http://hl7.org/fhir/uv/genomics-reporting/STU3/CodeSystem-sequence-phase-relationship-cs.html)

###### ValueSet

**Sequence Phase Relationship ValueSet**

[seq-phase-relationship](http://hl7.org/fhir/uv/genomics-reporting/STU3/ValueSet-sequence-phase-relationship-vs.html)

### References

#### Publications

**Main publication on this Implementation Guide:**

Stellmach C, Sass J, Auber B, Boeker M, Wienker T, Heidel AJ, Benary M,
Schumacher S, Ossowski S, Klauschen F, Möller Y, Schmutzler R, Ustjanzew A,
Werner P, Tomczak A, Hölter T, Thun S. **Creation of a structured molecular
genomics report for Germany as a local adaption of HL7's Genomic Reporting
Implementation Guide**. *J Am Med Inform Assoc*. 2023 Apr 20;30(6):1179-1189.
doi: 10.1093/jamia/ocad061. PMID: 37080557; PMCID: PMC10198526.

Available at: [https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/](https://pmc.ncbi.nlm.nih.gov/articles/PMC10198526/)

#### Technical Specifications

The FHIR profiles were created taking into account and applying the
[Genomics Reporting Implementation Guide](https://hl7.org/fhir/uv/genomics-reporting/STU3/)
(STU3) of HL7 International. Most profiles inherit directly from the STU3
profiles and extend them with specific requirements of the Medical Informatics
Initiative.
