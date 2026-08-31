# Retired Simplifier guide trees — do not edit

These directories are the module's **previous** Implementation Guide sources, as
they were authored for and rendered by Simplifier. They are kept as history.

**The live narrative is no longer here.** Since the 2026-08-28 migration onto the
[MII KDS module template](https://github.com/medizininformatik-initiative/mii-kds-module-template),
the guide is built by the HL7 IG Publisher from:

| Live location | What it holds |
| --- | --- |
| `input/pagecontent/` | the narrative pages, English (the rendering default language) |
| `input/translations/de/pagecontent/` | the German mirror of those pages |
| `input/intro-notes/` and `input/translations/de/intro-notes/` | the per-profile texts rendered on top of each generated artifact page |
| `input/images/` | the images those pages reference |

Editing a file under `implementation-guides/` changes nothing in the rendered
guide. If you find content here that is missing from the live page set, that is a
migration gap — report it rather than editing here.

## What is in each tree

| Tree | Version | Role |
| --- | --- | --- |
| `ImplementationGuide-2026.x-DE/` | 2026.0.4 | **the authoritative source of the migration** — all 41 of its pages were routed into the live page set |
| `ImplementationGuide-2025.x-DE/` | 2025.0.0 | prior release, retained unchanged |
| `ImplementationGuide-1.x/` | 1.x | first release, retained unchanged |

Which old page became which new page is recorded, page by page with a reason, in
[`migration-log/page-map.tsv`](../migration-log/page-map.tsv); the walkable
side-by-side view is
[`migration-log/comparison-table.md`](../migration-log/comparison-table.md).

Retiring these trees for good is a Gate-D decision (release governance), not a
technical one — see the migration report.
