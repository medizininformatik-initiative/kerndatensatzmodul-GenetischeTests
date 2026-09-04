<!-- TODO:REVIEW machine translation of input/translations/de/pagecontent/logical-models.md - reviewed at Gate C -->
<!-- markdownlint-disable MD041 -->
<!-- Migriert aus dem Simplifier-Leitfaden Anwendungsfaelle-Informationsmodell/Datenstzeinkl.Beschreibungen.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->
<!-- Source: kerndatensatz-basis input/pagecontent/logical-models.md.
     German mirror: input/translations/de/pagecontent/logical-models.md. -->
### Logical Models

The logical data models of the **Molekulargenetischer Befundbericht** module describe the domain dataset independently of its concrete FHIR representation.

#### Datasets and their descriptions

The data elements in the **Indication / Request** area describe the objective of the requested examination and the relevant context, including previously performed tests and, where applicable, already known familial predispositions.

The data elements described in the **Methods** section cover sequence-based analytical methods.

Based on the analysis, statements about the results obtained are made in **Results**.

Finally, the results are evaluated and interpreted in the **Interpretation / Expert opinion** area.

The thematic grouping **Other / Formal** holds additional remarks, information about the laboratory performing the test, and billing-relevant data.

#### The module's logical model

[LogicalModelMolGen](StructureDefinition-LogicalModelMolGen.html)

The complete list of dataset elements with their path and the corresponding explanation is available in the element dictionary on the artifact page of the logical model; the IG Publisher generates that view automatically from the StructureDefinition.

<!-- TODO:REVIEW The Simplifier source page produced two FQL tables here: (1) name/canonical of the
     logical model - dropped, because the IG Publisher renders the artifact header itself;
     (2) a table "Datensatz (path) / Erklaerung (definition)" over differential.element - replaced
     by the pointer above to the artifact page's element dictionary, which renders exactly those two
     columns. Check at Gate C whether the -dict fragment should be included inline instead. -->
#### Domain model

The class diagram below shows the same model as an overview: which domain concepts exist,
how they relate, and — in the notes along the edge — which FHIR artefacts of this module
realise them. It is deliberately implementation-agnostic: data types and cardinalities
here are orientation, not obligation. What binds is what the [profiles](profiles.html)
state.

<img src="MII_MolGen_LogicalModel_Domain_en.svg"
     alt="Domain model of the Molekulargenetischer Befundbericht module: report, request with indication, methods, results with alterations and molecular biomarkers, interpretation and laboratory, with their relationships and the mapping to FHIR artefacts"
     style="width: 100%; max-width: 1400px; margin: 20px 0;" />

The source is kept as PlantUML in the repository. It is split into a language-neutral
structure (`input/images-source/logical-model-domain.iuml`) and one label file per
language, so the German and English renderings cannot drift apart structurally.
