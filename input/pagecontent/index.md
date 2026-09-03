<!-- TODO:REVIEW machine translation of input/translations/de/pagecontent/index.md - reviewed at Gate C -->
<!-- markdownlint-disable MD041 -->
<!--
  HOME PAGE — English is the IG's DEFAULT language, so this file is the source.
  Structure follows the standard MII module IG page set (kerndatensatz-basis
  input/pagecontent/index.md). The German translation of this page lives at
  input/translations/de/pagecontent/index.md — keep both in step.
-->
<!-- Migriert aus dem Simplifier-Leitfaden Index.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

### Introduction

This specification describes the FHIR representation of the Core Dataset (CDS)
module **Molekulargenetischer Befundbericht** of the Medical Informatics Initiative (MII). It
covers the module's use cases and the associated FHIR profiles, extensions and
terminology resources in their normative form. The MII Core Dataset enables the
standardized secondary use of routine clinical data for medical research.

<!-- TODO:REVIEW The migrated source page gives 2025-12-19 as the publication
     date, the template scaffold gives 2026-01-02. The scaffold value is used
     here. Also to be checked: the "(CalVer YYYY.n.n)" parenthesis in the
     version row comes from the template and reads as an authoring hint rather
     than a publication statement. -->

| Publication |               |
|-------------|---------------|
| Date        | 2026-09-02 |
| Version     | 2027.0.0-ballot.rc1 (CalVer `YYYY.n.n`) |
| Status      | active        |
| Realm       | DE            |

### Target audience

<div class="ig-highlight ig-highlight-blue">
<h5>Implementers</h5>
<p>Data Integration Centers (DIC), software developers and system architects building FHIR-based solutions.<br/>
→ see <a href="profiles.html">Profiles</a> and <a href="logical-models.html">Logical Models</a>.</p>
</div>

<div class="ig-highlight ig-highlight-green">
<h5>Researchers</h5>
<p>Scientists using KDS data for medical research.<br/>
→ see <a href="guidance.html">Guidance</a>.</p>
</div>

### Contents

- **[Guidance](guidance.html)** — getting started and domain notes.
- **Conformance** — the KDS-wide conformance rules (requirements language,
  Must Support, handling missing data) are maintained centrally by the
  [Meta module](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Conformance);
  the module-specific [Security and Privacy](security-and-privacy.html)
  considerations are part of this guide.
- **[Profiles](profiles.html)** and the further
  **[artifact pages](artifacts.html)** — the technical artifacts.
- **[Examples](examples.html)** — example instances.
- **[Dependencies](ImplementationGuide-mii-ig-molgen.html)** — the
  ImplementationGuide resource with the dependency table, cross-version
  analysis and copyright statements.

### Related guides

This module is part of the MII Core Dataset; the other KDS modules and their
dependencies are described at
[medizininformatik-initiative.de](https://www.medizininformatik-initiative.de/).
How this module relates to the other MII modules is described in the
[Guidance for Implementers](implementer-guidance.html).

<!-- TODO:REVIEW This TODO box stays open: the migrated source page contains no
     listing of the formal package dependencies. Content must not be invented
     here. -->

More FHIR implementation guides can be found in the official
**[FHIR IG Registry](https://fhir.org/guides/registry/)** (source:
[`FHIR/ig-registry`](https://github.com/FHIR/ig-registry)).

### Imprint

This guide was created within the Medical Informatics Initiative and is subject,
by its governance process, to the coordination procedure of the Interoperability
Forum and the technical committees of HL7 Germany.

### Contact

Questions about this publication can be asked on the HL7 FHIR Zulip
[chat.fhir.org](https://chat.fhir.org) in the `german/mi-initiative` stream, or
on the MII Zulip [mii.zulipchat.com](https://mii.zulipchat.com/) in the
`MII-Kerndatensatz` stream.
Comments and issues are welcome as *Issues* on
[GitHub](https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/issues).

Contacts for the domain content of this module:

* Sylvia Thun, Berlin Institute of Health at Charité (BIH)
* Thomas Debertshäuser, Berlin Institute of Health at Charité (BIH)
* Julian Saß, Berlin Institute of Health at Charité (BIH)
* Karoline Buckow, TMF – Technologie- und Methodenplattform für die vernetzte medizinische Forschung e.V.
* Franziska Klepka, TMF – Technologie- und Methodenplattform für die vernetzte medizinische Forschung e.V.

### Authors (in alphabetical order)

<!-- TODO:REVIEW The order is taken unchanged from the source page; it is not
     consistently alphabetical (among others "Kirsten Toralf",
     "Stefan Fröhling"). Do not re-sort without domain sign-off. -->

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

This work is licensed under the
[Creative Commons Attribution 4.0 International License (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

For the usage rights of the underlying FHIR technology, see the FHIR base
specification.

Some of the code systems used are published and maintained by other
organizations; the copyright of the respective publishers applies.

### Disclaimer

The content of this document is public. Please note that parts of this
document are based on FHIR version R4, which is copyrighted by
HL7 International.

Although this publication was prepared with the greatest care, the authors
cannot accept any liability for direct or indirect damage that may arise from
the content of this specification.

<!-- TODO:REVIEW The migrated section "Navigation und Inhaltsverzeichnis" of the
     Simplifier home page was not carried over: it duplicates the template's
     navigation menus and the "Contents" section above, its entries were not
     markdown links, and it pointed at the dropped STU2 profiles
     ErgebnisZusammenfassung and UntersuchteRegion. If individual jump targets
     are to be kept, add them here. -->
