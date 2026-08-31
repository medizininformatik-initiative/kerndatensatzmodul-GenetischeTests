# Page-structure advice

**This report PROPOSES and never edits a module.** It reads the source and target repositories read-only; its only writes are this report and the page-map v2 TSV (`--map`) - the map is the PRIMARY output and the contract step 5 consumes, this report is its rendering. Every routing row below is the branch the MEASUREMENTS support - a human (or the skill at step 5) decides and applies it.

| Input | Value |
| --- | --- |
| source repo | `/private/tmp/claude-501/-Users-thome-code-fhir-profiling-kerndatensatzmodul-GenetischeTests/2998cab9-2458-4f3b-82e2-67071c5997f0/scratchpad/source-unmigrated` |
| target repo | `.` |
| routing table | `/Users/thome/code/fhir-profiling/kerndatensatzmodul-GenetischeTests/.claude/skills/mii-ig-migration/references/routing-table.tsv` (17 patterns) |
| Gate 0 preflight | `/Users/thome/code/fhir-profiling/kerndatensatzmodul-GenetischeTests/migration-log/preflight-analysis.json` |
| artefact census | fsh-generated/resources (134 resources; cross-checked by Gate 0's generated_crosscheck) |
| page map | `migration-log/page-map.tsv` |
| generated | 2026-08-28T13:30:28Z |
| script | `page-structure-advice.py` v1.3.0 |

Contract limits in force: menu total <= 33, dropdown children <= 10, top level <= 8, menu depth <= 2; size gate at > 2500 words, > 4 merged sources, or ANY repeated heading title; hub at >= 3 children.

## 1. Source page tree

The tree is taken from the FIRST of four inputs that yields pages: **(a)** the `pages:` block of the source `sushi-config.yaml`, **(b)** the authoritative Simplifier guide tree under `implementation-guides/` (spec 5.1a), **(c)** a flat count of `input/pagecontent/*.md`.

**Input used: (b) the Simplifier guide tree `implementation-guides/ImplementationGuide-2026.x-DE`, walked from its `toc.yaml`.**

### 1.0 Simplifier guide trees found

Every tree under `implementation-guides/` is listed - the choice is never made silently. Dispositions follow spec 5.1a: #1 authoritative, #2 parallel-language harvest seed, #3 historical/shared retained, #4 unrecognized.

| Guide tree | Title | Version (dir name) | Version (guide.yaml) | Lang | `*.page.md` on disk | Disposition |
| --- | --- | --- | --- | --- | ---: | --- |
| `ImplementationGuide-1.x` | Medizininformatik Initiative - Modul Molekulargenetischer Befundbericht - ImplementationGuide | 1.x | 1.x | - | 0 | historical version tree - retain unchanged, Gate-D retirement set (5.1a #3) |
| `ImplementationGuide-2025.x-DE` | MII IG Modul Molekulargenetischer Befundbericht v2025 | 2025.x | 2025.0.0 | DE | 0 | historical version tree - retain unchanged, Gate-D retirement set (5.1a #3) |
| `ImplementationGuide-2026.x-DE` | Medizininformatik Initiative - ImplementationGuide - Modul Molekulargenetischer Befundbericht v2026 | 2026.x | 2026.0.4 | DE | 41 | **AUTHORITATIVE** - steps 5.4/5.5 operate on this tree |

**Chosen: `ImplementationGuide-2026.x-DE`** - HUMAN OVERRIDE: --guide-tree ImplementationGuide-2026.x-DE (the spec 5.1a ranking below was not applied).

The module's narrative language read from `sushi-config.yaml` `language:` is **DE**.

**A human can override this choice**: re-run with `--guide-tree <directory name>`. The ranking above is evidence, not a verdict - confirm it against the rendered IG and record it in the inventory (Gate B reviews it).

### 1.1 Depth histogram

Walked from `implementation-guides/ImplementationGuide-2026.x-DE/toc.yaml`: an entry whose `filename` ends in `.page.md` is a page, any other `filename` is a sub-directory holding its own `toc.yaml`. A sub-directory is a LEVEL, not a page, so every page of one directory shares one level (that is how Simplifier renders a folder), and the levels are shifted so the shallowest page sits at level 1 - this guide's root `toc.yaml` lists only a folder, which adds no page level. Routing still needs a page parent, so each directory is represented by its `Index.page.md` and its remaining pages plus its sub-folders' representatives become that page's children; a parent may therefore share its children's level.

| Level | Pages | Share |
| --- | ---: | ---: |
| 1 | 6 | 15% |
| 2 | 6 | 15% |
| 3 | 29 | 71% |
| **total** | **41** | 100% |

Maximum depth used: **3**. Total words across the 41 source pages: **16594**. Pages in `input/pagecontent/`: **0**.

### 1.2 Parent-child tree

```
`- Hauptseite  `MIIIGModulMolekulargenetischerBefundbericht/Index.page.md`
   |- Beschreibung Modul Molekulargenetischer Befundbericht  `MIIIGModulMolekulargenetischerBefundbericht/BeschreibungModulMolekulargenetischerBefundbericht.page.md`
   |- Kontext im Gesamtprojekt Bezug zu anderen Modulen  `MIIIGModulMolekulargenetischerBefundbericht/KontextimGesamtprojektBezgezuanderenModulen.page.md`
   |- Referenzen  `MIIIGModulMolekulargenetischerBefundbericht/Referenzen.page.md`
   |- Release Notes  `MIIIGModulMolekulargenetischerBefundbericht/ReleaseNotes.page.md`
   |- Qualitätsbericht  `MIIIGModulMolekulargenetischerBefundbericht/Qualitaetsbericht.page.md`
   |- Übersicht  `MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/Index.page.md`
   |  |- UML-Diagramme  `MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/UML.page.md`
   |  |- Beschreibung von Szenarien  `MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md`
   |  `- Datensätze inkl. Beschreibungen  `MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/Datenstzeinkl.Beschreibungen.page.md`
   `- Index  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md`
      |- Capability Statement  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/CapabilityStatement.page.md`
      |- Index  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Workflow/Index.page.md`
      |  |- Anforderung ServiceRequest  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Workflow/Anforderung-ServiceRequest.page.md`
      |  `- Befundbericht DiagnosticReport  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Workflow/Befundbericht-DiagnosticReport.page.md`
      |- Index  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Index.page.md`
      |  |- Variante Observation  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Variante-Observation.page.md`
      |  |- Genotyp Observation  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Genotyp---Observation.page.md`
      |  |- Haplotype Observation  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Haplotype-Observation.page.md`
      |  `- Sequence Phase Relationship Observation  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Sequence-Phase-Relationship---Observation.page.md`
      |- Index  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md`
      |  |- Diagnostische Implikation Observation  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/DiagnostischeImplikation-Observation.page.md`
      |  |- Therapeutische Implikation Observation  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/TherapeutischeImplikation-Observation.page.md`
      |  `- Molekulare Konsequenz Observation  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/MolekulareKonsequenz-Observation.page.md`
      |- Index  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Index.page.md`
      |  |- Mutationslast Observation  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Mutationslast-Observation.page.md`
      |  |- Mikrosatelliteninstabilität Observation  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Mikrosatelliteninstabilitt-Observation.page.md`
      |  `- Polygener Risiko Score RiskAssessment  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Polygener-Risiko-Score---RiskAssessment.page.md`
      |- Index  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/Index.page.md`
      |  |- Medikationsempfehlung Task  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/Medikationsempfehlung-Task.page.md`
      |  `- Empfohlene Folgemaßnahme Task  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/EmpfohleneFolgemanahme-Task.page.md`
      |- Index  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/Index.page.md`
      |  |- Genomic Study Procedure  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/GenomicStudy-Procedure.page.md`
      |  `- Genomic Study Analysis Procedure  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/GenomicStudyAnalysis-Procedure.page.md`
      |- Index  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Familienanamnese/Index.page.md`
      |  |- Familienanamnese FamilyMemberHistory  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Familienanamnese/Familienanamnese---FamilyMemberHistory.page.md`
      |  `- Extensions  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Familienanamnese/Familienanamnese-Extensions.page.md`
      `- Index  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Index.page.md`
         |- MII ValueSets  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/MII-ValueSets.page.md`
         |- Clinical Genomics  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/ClinicalGenomics.page.md`
         `- Externe Terminologien  `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Terminologien.page.md`
```

## 2. Target page measurements

Words = whitespace tokens after removing HTML comments, table separator rows and the markup characters `>`, `|`, `*`, `_`, `` ` ``. Headings, list items, table cells and fenced code all count: the gate measures what the reader has to traverse. Repeated titles are compared case-sensitively; each repeat costs one publisher-appended anchor (`-2`, `-3`, ...). Merged sources are the distinct `<!-- source: X.md -->` section markers the migration itself left behind.

| Page | Words | h2 | h3 | h4 | other h | Repeated titles | Anchor collisions | Merged sources | Size gate |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| `ImplementationGuide-mii-ig-molgen-de-v2026.md` | 286 | 0 | 5 | 0 | 0 | 0 | 0 | 0 | ok |
| `capability-statements.md` | 32 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `changes.md` | 562 | 0 | 1 | 1 | 1 | 0 | 0 | 0 | ok |
| `code-systems.md` | 149 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `downloads.md` | 326 | 0 | 0 | 7 | 0 | 0 | 0 | 0 | ok |
| `examples.md` | 44 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | ok |
| `extensions.md` | 122 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `guidance.md` | 131 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | ok |
| `implementer-guidance.md` | 33 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | ok |
| `index.md` | 478 | 0 | 9 | 0 | 0 | 0 | 0 | 0 | ok |
| `logical-models.md` | 34 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `metadata.md` | 2199 | 0 | 1 | 7 | 1 | 0 | 0 | 0 | ok |
| `operations.md` | 105 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `profiles.md` | 78 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | ok |
| `rendering-artifacts.md` | 3933 | 0 | 8 | 3 | 0 | 0 | 0 | 0 | **TRIPS** - 3933 words > 2500 |
| `researcher-guidance.md` | 112 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `search-parameters.md` | 113 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `security-and-privacy.md` | 444 | 0 | 0 | 3 | 0 | 0 | 0 | 0 | ok |
| `translationinfo.md` | 80 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | ok |
| `uml-diagrams.md` | 43 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | ok |
| `value-sets.md` | 179 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | ok |
| `version-history.md` | 549 | 0 | 0 | 6 | 0 | 0 | 0 | 0 | ok |

### 2.1 Pages that trip the size gate

- **`rendering-artifacts.md`** - 3933 words > 2500.
  - rule 5: re-run routing preferring branches 1 and 2, or split.

## 3. Menu budget

Clickable entries are the menu's real destinations: every `<li><a>` except the dropdown toggles, which only repeat their first child's href.

| Metric | Measured | Contract limit | Headroom |
| --- | ---: | ---: | ---: |
| total clickable entries | 26 | 33 | 7 |
| widest dropdown (Artifacts) | 11 | 10 | -1 |
| top-level entries | 7 | 8 | 1 |
| menu depth used | 2 | 2 | 0 |

| Dropdown | Children | Free (of 10) |
| --- | ---: | ---: |
| Guidance | 5 | 5 |
| Conformance | 5 | 5 |
| Artifacts | 11 | -1 |
| Metadata | 2 | 8 |

After the proposals in section 4: total 6 free, top level 0 free, freest dropdown Metadata (8 free).

## 4. Routing proposal (spec 9d/9e)

One row per source page. The branch number is the spec's; the measurement column is the number that forced it. Branch-4 rows state the presentation (4a) and the visibility (4b), and, where a menu entry fits, the remaining budget after it. `Words` is the source page's own size, counted the same way as the target pages in section 2.

| # | Source page | Lvl | Children | Words | Branch | Proposed destination | Measurement |
| ---: | --- | ---: | ---: | ---: | --- | --- | --- |
| 1 | `MIIIGModulMolekulargenetischerBefundbericht/Index.page.md` | 1 | 7 | 599 | 3 merge into agreed page | index.md | agreed page named 'index' exists in the target |
| 2 | `MIIIGModulMolekulargenetischerBefundbericht/BeschreibungModulMolekulargenetischerBefundbericht.page.md` | 1 | 0 | 1185 | 3 merge into agreed page | index.md | semantic match 'beschreibungmodul' -> index (routing-table) |
| 3 | `MIIIGModulMolekulargenetischerBefundbericht/KontextimGesamtprojektBezgezuanderenModulen.page.md` | 1 | 0 | 293 | 3 merge into agreed page | implementer-guidance.md | semantic match 'kontextimgesamtprojekt' -> implementer-guidance (routing-table) |
| 4 | `MIIIGModulMolekulargenetischerBefundbericht/Referenzen.page.md` | 1 | 0 | 120 | 3 merge into agreed page | implementer-guidance.md | semantic match 'referenzen' -> implementer-guidance (routing-table) |
| 5 | `MIIIGModulMolekulargenetischerBefundbericht/ReleaseNotes.page.md` | 1 | 0 | 1627 | 3 merge into agreed page | changes.md | semantic match 'releasenotes' -> changes (routing-table) |
| 6 | `MIIIGModulMolekulargenetischerBefundbericht/Qualitaetsbericht.page.md` | 1 | 0 | 274 | 4 own page | own page (merged page), MENU entry (top level); total 26->27, top level 7->8; remaining after: total 6 free, top level 0 free, freest dropdown Metadata (8 free) | no artefact anchor; no agreed page; 0 child page(s) |
| 7 | `MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/Index.page.md` | 2 | 3 | 251 | 4 own page | own page (HUB), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/Index.page.md (its host has no menu entry) <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | no artefact anchor; no agreed page; 3 child page(s) |
| 8 | `MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/UML.page.md` | 2 | 0 | 77 | 3 merge into agreed page | uml-diagrams.md | semantic match 'uml' -> uml-diagrams (routing-table) |
| 9 | `MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md` | 2 | 0 | 517 | 3 merge into agreed page | guidance.md | semantic match 'szenarien' -> guidance (routing-table) |
| 10 | `MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/Datenstzeinkl.Beschreibungen.page.md` | 2 | 0 | 123 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/Index.page.md (its host has no menu entry) | no artefact anchor; no agreed page; 0 child page(s) |
| 11 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md` | 2 | 9 | 205 | 4 own page | own page (HUB), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/Index.page.md (its host has no menu entry) <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | no artefact anchor; no agreed page; 9 child page(s) |
| 12 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/CapabilityStatement.page.md` | 2 | 0 | 86 | 3 merge into agreed page | capability-statements.md | semantic match 'capabilitystatement' -> capability-statements (routing-table) |
| 13 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Workflow/Index.page.md` | 3 | 2 | 137 | 2 section on index page | h3/h4 section on profiles.md <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | 2 children, 2 anchoring distinct artefacts (StructureDefinition) |
| 14 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Workflow/Anforderung-ServiceRequest.page.md` | 3 | 0 | 449 | 1 intro-note | input/intro-notes/StructureDefinition-mii-pr-molgen-anforderung-genetischer-test-intro.md | tokens match on mii-pr-molgen-anforderung-genetischer-test (1 candidate artefact) |
| 15 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Workflow/Befundbericht-DiagnosticReport.page.md` | 3 | 0 | 756 | 1 intro-note | input/intro-notes/StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht-intro.md | tokens match on mii-pr-molgen-molekulargenetischer-befundbericht (1 candidate artefact) |
| 16 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Index.page.md` | 3 | 4 | 201 | 2 section on index page | h3/h4 section on profiles.md <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | 4 children, 2 anchoring distinct artefacts (StructureDefinition) |
| 17 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Variante-Observation.page.md` | 3 | 0 | 1006 | 1 intro-note | input/intro-notes/StructureDefinition-mii-pr-molgen-variante-intro.md | tokens match on mii-pr-molgen-variante (1 candidate artefact) |
| 18 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Genotyp---Observation.page.md` | 3 | 0 | 758 | 1 intro-note | input/intro-notes/StructureDefinition-mii-pr-molgen-genotyp-intro.md | tokens match on mii-pr-molgen-genotyp (1 candidate artefact) |
| 19 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Haplotype-Observation.page.md` | 3 | 0 | 685 | 2 section on index page | h3/h4 section on profiles.md | child of family overview MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Index.page.md (no anchor of its own) |
| 20 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Sequence-Phase-Relationship---Observation.page.md` | 3 | 0 | 107 | 2 section on index page | h3/h4 section on profiles.md | child of family overview MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Index.page.md (no anchor of its own) |
| 21 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md` | 3 | 3 | 178 | 4 own page | own page (HUB), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md (its host has no menu entry) <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | no artefact anchor; no agreed page; 3 child page(s) |
| 22 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/DiagnostischeImplikation-Observation.page.md` | 3 | 0 | 756 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md (its host has no menu entry) | no artefact anchor; no agreed page; 0 child page(s) |
| 23 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/TherapeutischeImplikation-Observation.page.md` | 3 | 0 | 726 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md (its host has no menu entry) | no artefact anchor; no agreed page; 0 child page(s) |
| 24 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/MolekulareKonsequenz-Observation.page.md` | 3 | 0 | 376 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md (its host has no menu entry) | no artefact anchor; no agreed page; 0 child page(s) |
| 25 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Index.page.md` | 3 | 3 | 175 | 2 section on index page | h3/h4 section on profiles.md <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | 3 children, 2 anchoring distinct artefacts (StructureDefinition) |
| 26 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Mutationslast-Observation.page.md` | 3 | 0 | 701 | 1 intro-note | input/intro-notes/StructureDefinition-mii-pr-molgen-mutationslast-intro.md | tokens match on mii-pr-molgen-mutationslast (1 candidate artefact) |
| 27 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Mikrosatelliteninstabilitt-Observation.page.md` | 3 | 0 | 704 | 2 section on index page | h3/h4 section on profiles.md | child of family overview MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Index.page.md (no anchor of its own) |
| 28 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Polygener-Risiko-Score---RiskAssessment.page.md` | 3 | 0 | 159 | 1 intro-note | input/intro-notes/StructureDefinition-mii-pr-molgen-polygener-risiko-score-intro.md | tokens match on mii-pr-molgen-polygener-risiko-score (1 candidate artefact) |
| 29 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/Index.page.md` | 3 | 2 | 115 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md (its host has no menu entry) <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | no artefact anchor; no agreed page; 2 child page(s) |
| 30 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/Medikationsempfehlung-Task.page.md` | 3 | 0 | 372 | 1 intro-note | input/intro-notes/StructureDefinition-mii-pr-molgen-medikationsempfehlung-intro.md | tokens match on mii-pr-molgen-medikationsempfehlung (1 candidate artefact) |
| 31 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/EmpfohleneFolgemanahme-Task.page.md` | 3 | 0 | 375 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/Index.page.md (its host has no menu entry) | no artefact anchor; no agreed page; 0 child page(s) |
| 32 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/Index.page.md` | 3 | 2 | 183 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md (its host has no menu entry) <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | no artefact anchor; no agreed page; 2 child page(s) |
| 33 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/GenomicStudy-Procedure.page.md` | 3 | 0 | 348 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/Index.page.md (its host has no menu entry) | no artefact anchor; no agreed page; 0 child page(s) |
| 34 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/GenomicStudyAnalysis-Procedure.page.md` | 3 | 0 | 358 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/Index.page.md (its host has no menu entry) | no artefact anchor; no agreed page; 0 child page(s) |
| 35 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Familienanamnese/Index.page.md` | 3 | 2 | 156 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md (its host has no menu entry) <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | no artefact anchor; no agreed page; 2 child page(s) |
| 36 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Familienanamnese/Familienanamnese---FamilyMemberHistory.page.md` | 3 | 0 | 414 | 1 intro-note | input/intro-notes/StructureDefinition-mii-pr-molgen-familienanamnese-intro.md | tokens match on mii-pr-molgen-familienanamnese (1 candidate artefact) |
| 37 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Familienanamnese/Familienanamnese-Extensions.page.md` | 3 | 0 | 293 | 1 intro-note | input/intro-notes/StructureDefinition-mii-pr-molgen-familienanamnese-intro.md | tokens match on mii-pr-molgen-familienanamnese (1 candidate artefact) |
| 38 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Index.page.md` | 3 | 3 | 155 | 4 own page | own page (HUB), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md (its host has no menu entry) <br>_(folder landing page - NOT matched against the target's index.md or an artefact id; routed by its own children)_ | no artefact anchor; no agreed page; 3 child page(s) |
| 39 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/MII-ValueSets.page.md` | 3 | 0 | 65 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Index.page.md (its host has no menu entry) | no artefact anchor; no agreed page; 0 child page(s) |
| 40 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/ClinicalGenomics.page.md` | 3 | 0 | 236 | 4 own page | own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Index.page.md (its host has no menu entry) | no artefact anchor; no agreed page; 0 child page(s) |
| 41 | `MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Terminologien.page.md` | 3 | 0 | 293 | 3 merge into agreed page | code-systems.md | semantic match 'terminologien' -> code-systems (routing-table) |

Branch totals: 1 intro-note = 9, 2 section on index page = 6, 3 merge into agreed page = 9, 4 own page = 17.

## 5. Report queue 1 items

The menu budget forced a ToC-nesting where a menu entry was otherwise warranted. Allocation below is first-come-first-served in source document order; the human may spend the budget differently.

- MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/Index.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/Datenstzeinkl.Beschreibungen.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/DiagnostischeImplikation-Observation.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/TherapeutischeImplikation-Observation.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/MolekulareKonsequenz-Observation.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/Index.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/EmpfohleneFolgemanahme-Task.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/Index.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/GenomicStudy-Procedure.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/GenomicStudyAnalysis-Procedure.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Familienanamnese/Index.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Index.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/MII-ValueSets.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.
- MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/ClinicalGenomics.page.md - nested under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Index.page.md because that host got no menu entry of its own; giving this page one directly would put it at menu depth 3 > 2, so it only becomes visible if the human buys the host a top-level entry first.

Size-gate trips (rule 5) needing a routing re-run or a split:

- `rendering-artifacts.md` - 3933 words > 2500.

## 6. Suggested `5.4c page-routing` run-log lines

One per source page (union pages included), ready for the migration run log. The `5.4c page-routing` step IS the advice run that GENERATES the page map (`--map`) - the map is machine-written, never hand-written; these lines are only its run-log form.

```
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/Index.page.md	branch=3	index.md	agreed page named 'index' exists in the target
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/BeschreibungModulMolekulargenetischerBefundbericht.page.md	branch=3	index.md	semantic match 'beschreibungmodul' -> index (routing-table)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/KontextimGesamtprojektBezgezuanderenModulen.page.md	branch=3	implementer-guidance.md	semantic match 'kontextimgesamtprojekt' -> implementer-guidance (routing-table)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/Referenzen.page.md	branch=3	implementer-guidance.md	semantic match 'referenzen' -> implementer-guidance (routing-table)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/ReleaseNotes.page.md	branch=3	changes.md	semantic match 'releasenotes' -> changes (routing-table)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/Qualitaetsbericht.page.md	branch=4	own page (merged page), MENU entry (top level); total 26->27, top level 7->8; remaining after: total 6 free, top level 0 free, freest dropdown Metadata (8 free)	no artefact anchor; no agreed page; 0 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/Index.page.md	branch=4	own page (HUB), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 3 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/UML.page.md	branch=3	uml-diagrams.md	semantic match 'uml' -> uml-diagrams (routing-table)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md	branch=3	guidance.md	semantic match 'szenarien' -> guidance (routing-table)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/Datenstzeinkl.Beschreibungen.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/Anwendungsfaelle-Informationsmodell/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 0 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md	branch=4	own page (HUB), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 9 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/CapabilityStatement.page.md	branch=3	capability-statements.md	semantic match 'capabilitystatement' -> capability-statements (routing-table)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Workflow/Index.page.md	branch=2	h3/h4 section on profiles.md	2 children, 2 anchoring distinct artefacts (StructureDefinition)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Workflow/Anforderung-ServiceRequest.page.md	branch=1	input/intro-notes/StructureDefinition-mii-pr-molgen-anforderung-genetischer-test-intro.md	tokens match on mii-pr-molgen-anforderung-genetischer-test (1 candidate artefact)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Workflow/Befundbericht-DiagnosticReport.page.md	branch=1	input/intro-notes/StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht-intro.md	tokens match on mii-pr-molgen-molekulargenetischer-befundbericht (1 candidate artefact)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Index.page.md	branch=2	h3/h4 section on profiles.md	4 children, 2 anchoring distinct artefacts (StructureDefinition)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Variante-Observation.page.md	branch=1	input/intro-notes/StructureDefinition-mii-pr-molgen-variante-intro.md	tokens match on mii-pr-molgen-variante (1 candidate artefact)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Genotyp---Observation.page.md	branch=1	input/intro-notes/StructureDefinition-mii-pr-molgen-genotyp-intro.md	tokens match on mii-pr-molgen-genotyp (1 candidate artefact)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Haplotype-Observation.page.md	branch=2	h3/h4 section on profiles.md	child of family overview MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Index.page.md (no anchor of its own)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Sequence-Phase-Relationship---Observation.page.md	branch=2	h3/h4 section on profiles.md	child of family overview MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeBefunde/Index.page.md (no anchor of its own)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md	branch=4	own page (HUB), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 3 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/DiagnostischeImplikation-Observation.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 0 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/TherapeutischeImplikation-Observation.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 0 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/MolekulareKonsequenz-Observation.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/GenetischeImplikationen/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 0 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Index.page.md	branch=2	h3/h4 section on profiles.md	3 children, 2 anchoring distinct artefacts (StructureDefinition)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Mutationslast-Observation.page.md	branch=1	input/intro-notes/StructureDefinition-mii-pr-molgen-mutationslast-intro.md	tokens match on mii-pr-molgen-mutationslast (1 candidate artefact)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Mikrosatelliteninstabilitt-Observation.page.md	branch=2	h3/h4 section on profiles.md	child of family overview MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Index.page.md (no anchor of its own)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/MolekulareBiomarker/Polygener-Risiko-Score---RiskAssessment.page.md	branch=1	input/intro-notes/StructureDefinition-mii-pr-molgen-polygener-risiko-score-intro.md	tokens match on mii-pr-molgen-polygener-risiko-score (1 candidate artefact)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/Index.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 2 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/Medikationsempfehlung-Task.page.md	branch=1	input/intro-notes/StructureDefinition-mii-pr-molgen-medikationsempfehlung-intro.md	tokens match on mii-pr-molgen-medikationsempfehlung (1 candidate artefact)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/EmpfohleneFolgemanahme-Task.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Therapieempfehlungen/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 0 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/Index.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 2 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/GenomicStudy-Procedure.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 0 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/GenomicStudyAnalysis-Procedure.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Methodik/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 0 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Familienanamnese/Index.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 2 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Familienanamnese/Familienanamnese---FamilyMemberHistory.page.md	branch=1	input/intro-notes/StructureDefinition-mii-pr-molgen-familienanamnese-intro.md	tokens match on mii-pr-molgen-familienanamnese (1 candidate artefact)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Familienanamnese/Familienanamnese-Extensions.page.md	branch=1	input/intro-notes/StructureDefinition-mii-pr-molgen-familienanamnese-intro.md	tokens match on mii-pr-molgen-familienanamnese (1 candidate artefact)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Index.page.md	branch=4	own page (HUB), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 3 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/MII-ValueSets.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 0 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/ClinicalGenomics.page.md	branch=4	own page (merged page), pages:-NESTED under MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Index.page.md (its host has no menu entry)	no artefact anchor; no agreed page; 0 child page(s)
5.4c page-routing	MIIIGModulMolekulargenetischerBefundbericht/TechnischeImplementierung/Terminologie/Terminologien.page.md	branch=3	code-systems.md	semantic match 'terminologien' -> code-systems (routing-table)
5.4c page-routing	map rows=43 retired=2 coverage=ok	map=migration-log/page-map.tsv
```

## 7. Page map (v2) and coverage

The page map is the CONTRACT of the narrative migration: this run generates and validates it, step 5 consumes ONLY it, step 8 checks against it. Columns: `source_page`, `target` (repo-relative path or `RETIRED`), `reason`, `branch` (spec 9e 1-4; 5 = RETIRED), `measure`. One row per page of the source page universe - the authoritative guide tree UNION `input/pagecontent` UNION on-disk pages no toc lists.

Rows: **43** total - 41 routed source pages (41 from the primary tree, 0 union pages outside it) and 2 RETIRED guide-tree summary row(s).

### 7.2 RETIRED guide trees

| Tree | Reason |
| --- | --- |
| `ImplementationGuide-1.x/**` | historical version tree - retain unchanged, Gate-D retirement set (5.1a #3) |
| `ImplementationGuide-2025.x-DE/**` | historical version tree - retain unchanged, Gate-D retirement set (5.1a #3) |

### 7.3 Coverage validation

Universe re-derived from disk: **41** page(s). Every one needs a row with a non-empty target; every RETIRED row needs a reason. The exit code reports the result (0 covered, 1 not).

**Covered.** All 41 universe pages have a target row; every RETIRED row carries a reason.

## 8. M9 optional-page / other-bucket proposal (Gate 0 census)

Counts: generated_crosscheck.counts (fsh-generated/resources). Rule (spec 9a): count 0 -> REMOVE the optional page, count > 0 -> KEEP and fill it; artefacts are never deleted to force a removal. Each proposal is a `5.4a` run-log line and a HUMAN decision - this table only measures.

| Optional page | Census key | Count | Proposal |
| --- | --- | ---: | --- |
| `extensions.md` | `extensions` | 5 | **KEEP** (fill it, delete the banner + OPTIONAL-PAGE marker in both languages) |
| `search-parameters.md` | `searchparameters` | 6 | **KEEP** (fill it, delete the banner + OPTIONAL-PAGE marker in both languages) |
| `operations.md` | `operations` | 0 | **REMOVE** per the template's docs/optional-pages.md procedure |
| `value-sets.md` | `valuesets` | 4 | **KEEP** (fill it, delete the banner + OPTIONAL-PAGE marker in both languages) |
| `code-systems.md` | `codesystems` | 0 | **REMOVE** per the template's docs/optional-pages.md procedure |
| `researcher-guidance.md` | - | - | no artefact count decides it - source narrative does (human decision) |
| `metadata.md` | - | - | no artefact count decides it - source narrative does (human decision) |

Artefact types in the census's OTHER bucket - each has NO template page and needs its own named placement (its own `5.4a` line; a type nobody placed is a queue-1 item):

| `artifacts.other` type | Count | Proposed placement |
| --- | ---: | --- |
| PlanDefinition | 1 | h3/h4 section on `artifacts.md` |

Declared-vs-generated mismatches Gate 0 reports (2) - the GENERATED counts above are the authoritative ones: `examples` 159->99, `other:PlanDefinition` 0->1.

