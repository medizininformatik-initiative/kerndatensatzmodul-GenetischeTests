# Home - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Table of Contents**](toc.md)
* **Home**

## Home

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ImplementationGuide/mii-ig-molgen | *Version*:2027.0.0-ballot.rc2 |
| Active as of 2026-09-04 | *Computable Name*:MII_IG_MolGen |

### Introduction

This specification describes the FHIR representation of the Core Dataset (CDS) module **Molekulargenetischer Befundbericht** of the Medical Informatics Initiative (MII). It covers the module's use cases and the associated FHIR profiles, extensions and terminology resources in their normative form. The MII Core Dataset enables the standardized secondary use of routine clinical data for medical research.

| | |
| :--- | :--- |
| Date | 2026-09-04 |
| Version | 2027.0.0-ballot.rc2 (CalVer`YYYY.n.n`) |
| Status | active |
| Realm | DE |

### Target audience

##### Implementers

Data Integration Centers (DIC), software developers and system architects building FHIR-based solutions.
 → see [Profiles](profiles.md) and [Logical Models](logical-models.md).

##### Researchers

Scientists using KDS data for medical research.
 → see [Guidance](guidance.md).

### Contents

* **[Guidance](guidance.md)** — getting started and domain notes.
* **Conformance** — the KDS-wide conformance rules (requirements language, Must Support, handling missing data) are maintained centrally by the [Meta module](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Conformance); the module-specific [Security and Privacy](security-and-privacy.md) considerations are part of this guide.
* **[Profiles](profiles.md)** and the further **[artifact pages](artifacts.md)** — the technical artifacts.
* **[Examples](examples.md)** — example instances.
* **[Dependencies](ImplementationGuide-mii-ig-molgen.md)** — the ImplementationGuide resource with the dependency table, cross-version analysis and copyright statements.

### Related guides

This module is part of the MII Core Dataset; the other KDS modules and their dependencies are described at [medizininformatik-initiative.de](https://www.medizininformatik-initiative.de/). How this module relates to the other MII modules is described in the [Guidance for Implementers](implementer-guidance.md).

This guide builds on the following packages. The table is taken from `dependencies:` in `sushi-config.yaml`, so it cannot drift from what the build actually resolves:

| | | |
| :--- | :--- | :--- |
| `hl7.fhir.uv.genomics-reporting` | `3.0.0` | HL7 Clinical Genomics Reporting STU3 — the international base every genetic profile here derives from |
| `de.medizininformatikinitiative.kerndatensatz.meta` | `2027.0.0-ballot.rc3` | MII core dataset Meta module — provenance and the shared search parameters |
| `de.basisprofil.r4` | `1.6.0` | German base profiles — identifiers, addresses, coverage |
| `de.medizininformatikinitiative.kerndatensatz.base` | `2027.0.0-ballot.rc1` | MII core dataset Base module — Patient, Encounter and the cross-module foundations |
| `de.medizininformatikinitiative.kerndatensatz.biobank` | `2027.0.0-ballot.rc2` | MII core dataset Biobank module — the Specimen profiles the genomic studies reference |
| `hl7.terminology.r4` | `7.3.0` | HL7 Terminology — the code systems the FHIR core specification relies on |
| `hl7.fhir.uv.crmi` | `2.0.0` | Canonical Resource Management Infrastructure — declares how this guide versions its artifacts |
| `hl7.fhir.uv.extensions.r4` | `5.3.0` | HL7 extension pack |

More FHIR implementation guides can be found in the official **[FHIR IG Registry](https://fhir.org/guides/registry/)** (source: [`FHIR/ig-registry`](https://github.com/FHIR/ig-registry)).

### Imprint

This guide was created within the Medical Informatics Initiative and is subject, by its governance process, to the coordination procedure of the Interoperability Forum and the technical committees of HL7 Germany.

### Contact

Questions about this publication can be asked on the HL7 FHIR Zulip [chat.fhir.org](https://chat.fhir.org) in the `german/mi-initiative` stream, or on the MII Zulip [mii.zulipchat.com](https://mii.zulipchat.com/) in the `MII-Kerndatensatz` stream. Comments and issues are welcome as **Issues** on [GitHub](https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/issues).

Contacts for the domain content of this module:

* Sylvia Thun, Berlin Institute of Health at Charité (BIH)
* Thomas Debertshäuser, Berlin Institute of Health at Charité (BIH)
* Julian Saß, Berlin Institute of Health at Charité (BIH)
* Karoline Buckow, TMF – Technologie- und Methodenplattform für die vernetzte medizinische Forschung e.V.
* Franziska Klepka, TMF – Technologie- und Methodenplattform für die vernetzte medizinische Forschung e.V.

### Authors (in alphabetical order)

* Alexander Zautke (HL7 Deutschland)
* Andrew Heidel (SMITH)
* Anna Trelinska-Finger (HiGHmed)
* Arsenij Ustjanzew (MIRACUM)
* Bernd Auber (HiGHmed)
* Brigitte Schlegelberger (HiGHmed)
* Caroline Stellmach (BIH at Charité)
* Franziska Klepka (MII-Koordinationsstelle)
* Frederick Klauschen (Charité)
* Julian Saß (BIH at Charité)
* Karoline Buckow (MII-Koordinationsstelle)
* Kirsten Toralf (SMITH)
* Manuela Benary (Charité)
* Martin Boeker (DIFUTURE)
* Michael Krawczak (HiGHmed)
* Oliver Kohlbacher (DIFUTURE)
* Patrick Werner (MOLIT Institut gGmbH)
* Simon Schumacher (HiGHmed)
* Sylvia Thun (Charité)
* Stefan Fröhling (GenomDE)
* Stephan Ossowski (DIFUTURE)
* Thomas Debertshäuser (BIH at Charité)
* Thomas Wienker (GenomDE)
* Yvonne Möller (GenomDE)

### Copyright and License

Copyright © 2022+: TMF e. V., Charlottenstraße 42, 10117 Berlin

This work is licensed under the [Creative Commons Attribution 4.0 International License (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

For the usage rights of the underlying FHIR technology, see the FHIR base specification.

Some of the code systems used are published and maintained by other organizations; the copyright of the respective publishers applies.

### Disclaimer

The content of this document is public. Please note that parts of this document are based on FHIR version R4, which is copyrighted by HL7 International.

Although this publication was prepared with the greatest care, the authors cannot accept any liability for direct or indirect damage that may arise from the content of this specification.

