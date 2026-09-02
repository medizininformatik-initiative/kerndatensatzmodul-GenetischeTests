# Security and Privacy - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

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

> **This section is not yet written — decision taken, content outstanding.** The Simplifier guide this module was migrated from carries no security or privacy narrative at all, so there was nothing to migrate here.The template offers a default text for modules with no aspects of their own ("this module carries no data category that raises security or privacy aspects of its own"). **That default was deliberately NOT adopted**, because for a molecular genetics module it would be untrue: the module carries genetic sequence data, which is special-category data, is inherently re-identifying even after pseudonymisation, and carries information about blood relatives who are not the data subject and have not consented.Writing the real analysis is a domain-author task, not a migration task, so it is left open here rather than guessed at. It must be completed before the first release: at minimum the data categories and their sensitivity, the re-identification risk that profile-level pseudonymisation does not remove, the familial implications, and any security- or privacy-related SHALL/SHOULD/MAY requirements this module places on implementers, each with the risk it addresses.

