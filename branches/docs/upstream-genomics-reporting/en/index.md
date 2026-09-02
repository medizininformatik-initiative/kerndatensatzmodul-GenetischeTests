# Home - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

* [**Table of Contents**](toc.md)
* **Home**

## Home

| | |
| :--- | :--- |
| *Official URL*:https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ImplementationGuide/mii-ig-molgen-de-v2026 | *Version*:2027.0.0-ballot.rc1 |
| Active as of 2026-09-02 | *Computable Name*:MII_IG_MolGen_DE |

### Introduction

This specification describes the FHIR representation of the Core Dataset (CDS) module **Molekulargenetischer Befundbericht** of the Medical Informatics Initiative (MII). It covers the module's use cases and the associated FHIR profiles, extensions and terminology resources in their normative form. The MII Core Dataset enables the standardized secondary use of routine clinical data for medical research.

| | |
| :--- | :--- |
| Date | 2026-09-02 |
| Version | 2027.0.0-ballot.rc1 (CalVer`YYYY.n.n`) |
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
* **[Dependencies](ImplementationGuide-mii-ig-molgen-de-v2026.md)** — the ImplementationGuide resource with the dependency table, cross-version analysis and copyright statements.

### Related guides

This module is part of the MII Core Dataset; the other KDS modules and their dependencies are described at [medizininformatik-initiative.de](https://www.medizininformatik-initiative.de/). How this module relates to the other MII modules is described in the [Guidance for Implementers](implementer-guidance.md).

> [TODO: Name your module's formal dependencies (see `dependencies` in `sushi-config.yaml`) and any related guides.]

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

