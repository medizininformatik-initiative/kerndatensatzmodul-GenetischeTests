<!-- TODO:REVIEW machine translation of input/translations/de/pagecontent/uml-diagrams.md - reviewed at Gate C -->
<!-- markdownlint-disable MD041 -->
<!-- Migriert aus dem Simplifier-Leitfaden Anwendungsfaelle-Informationsmodell/UML.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->
<!-- Source: kerndatensatz-basis input/pagecontent/uml-diagrams.md.
     German mirror: input/translations/de/pagecontent/uml-diagrams.md. -->

UML overviews of the data models of the **Molekulargenetischer Befundbericht** module and their relationships. Editable sources (e.g. PlantUML) belong in `input/images-source/`, the rendered images in `input/images/`.

### UML class diagram of the information model

As a more abstract version of an information model, and to make the relationships between the domain concepts clearer, a UML class diagram was created on the basis of the specifications in ART-DECOR. Concepts represented as groups in ART-DECOR are modelled as classes of their own, which are connected by association relationships here. This logical model only serves to represent the data elements and their descriptions. The data types and cardinalities used are not to be considered binding; that is settled definitively by the FHIR profiles.

![UML-Modell](UML_MolGenBefund2.JPG)

The module’s **domain model** — the same concepts as a class diagram, with the mapping to
FHIR artefacts — is on the [Logical Models](logical-models.html) page.
