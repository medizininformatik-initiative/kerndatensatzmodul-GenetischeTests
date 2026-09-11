# Security and Privacy - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc3

* [**Table of Contents**](toc.md)
* **Security and Privacy**

## Security and Privacy

This section addresses security and privacy experts. General requirements are in the FHIR core specification — [Security & Privacy Module](https://build.fhir.org/secpriv-module.html) and the [security checklist](https://build.fhir.org/security.html). This page does not repeat them; it links the overarching data protection framework and states what is **specific to this module**.

#### 1. The overarching data protection concept

The [overarching data protection concept of the Medical Informatics Initiative](https://www.medizininformatik-initiative.de/en/data-protection-concept) governs how patient data may be processed for research across the network of Data Integration Centers: it covers the legal basis (the MII Broad Consent), the roles of the Data Integration Centers and Use & Access Committees, and the cross-site application scenarios (feasibility queries, distributed analyses, data and biosample provision). Everything this module specifies operates inside that framework — this guide adds no processing purpose of its own.

#### 2. De-identification, minimisation and pseudonymisation (DIMP)

How data leaving a Data Integration Center is de-identified in practice is specified by [DIMP (De-Identification — Minimisation — Pseudonymisation)](https://medizininformatik-initiative.github.io/dataportal/data-node/DIMP.html) in the data portal documentation: direct identifiers are removed, data elements not needed by the approved project are dropped, and identifying values are replaced by project-specific pseudonyms (FHIR Pseudonymizer configuration). The profiles of this module describe data **before** DIMP is applied; which elements survive a concrete data release is decided per project by the DIMP configuration, not by this guide.

#### 3. Module-specific aspects

This is the module's own contribution: the security and privacy properties that follow from the **kind of data this module carries**.

##### What data this module carries

The module carries three categories that go beyond ordinary findings.

**Sequence detail.** The [Variante](StructureDefinition-mii-pr-molgen-variante.md) profile carries, among others, the gene studied, HGVS notation at DNA and genomic level, the reference sequence with its assembly, exact as well as inner and outer start-end positions, reference and alternate allele, and the DNA change type. This is not a coded finding; it is a description of the sequence itself.

**The germline/somatic distinction.** The `genomic-source-class` component records whether an alteration is inherited or acquired. Germline findings hold for life and concern blood relatives.

**Data about third parties.** The [Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md) profile carries the relationship, degree of relationship, family line, sex and the reason for recording — about people who are **not the data subject** and who did not consent to their data being recorded.

##### What follows from that

**Re-identifiability survives pseudonymisation.** Pseudonymisation at profile level replaces identifiers. It does not touch the fact that a sufficient number of exact positions with reference and alternate allele singles out a person — against any other sample from that person, and against reference databases. The sequence detail **is** the identifier. This is why the measures described in section 2 are not sufficient here.

**The finding reaches beyond the data subject.** A germline finding says something about parents, siblings and children who were neither asked nor consented. The family history makes that reach explicit.

**The data do not age.** A pseudonym can be changed; a sequence cannot. A disclosure is final.

Genetic data are special categories of personal data within the meaning of Art. 9 GDPR.

##### Requirements of this module

The following address implementers. They add to the general measures in section 2; they do not replace them.

| | | |
| :--- | :--- | :--- |
| **SHALL** | Transmit sequence detail only to recipients whose purpose limitation explicitly covers it | sequence data are themselves an identifier; "as part of the report" does not carry here |
| **SHALL** | Populate`genomic-source-class`wherever the distinction is known | without it, there is no way to tell whether a finding concerns relatives |
| **SHOULD** | For analyses that do not need base-level precision, omit the position elements rather than supplying them | lowers re-identifiability without missing the clinical purpose |
| **SHOULD** | Release family-history data separately from sequence data | combining the two substantially increases what can be inferred about third parties |
| **MAY** | Log access to instances of Variante, Genotyp and Familienanamnese separately | supports investigation where misuse is suspected |

How any of this is enforced technically — access control, logging, consent checking — is decided by each project's DIMP configuration, not by this guide. This module states **what** has to be protected, and why.

