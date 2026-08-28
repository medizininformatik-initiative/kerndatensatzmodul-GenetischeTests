# kerndatensatzmodul-GenetischeTests

**MII Kerndatensatz-Modul Molekulargenetischer Befundbericht** — FHIR
Implementation Guide of the Medical Informatics Initiative (MII) for molecular
genetic findings: variants, molecular consequences, diagnostic and therapeutic
implications, molecular biomarkers, and the genomic study that produced them.

| | |
| --- | --- |
| Package | `de.medizininformatikinitiative.kerndatensatz.molgen` |
| Canonical | `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen` |
| Version | 2026.0.4 (MII CalVer `YYYY.n.n`) |
| FHIR | R4 (4.0.1) |

## Building the guide

This repository was migrated onto the
[MII KDS module template](https://github.com/medizininformatik-initiative/mii-kds-module-template)
and renders with the shared
[MII IG template](https://github.com/medizininformatik-initiative/ig-template-mii-kds),
which `ig.ini` references by URL — the IG Publisher fetches it at build time.

```sh
npx --yes fsh-sushi@3.20.0 .
curl -L -o publisher.jar \
  https://github.com/HL7/fhir-ig-publisher/releases/download/2.3.2/publisher.jar
java -Xmx6g -jar publisher.jar -ig ig.ini
```

Then open `output/index.html` (English) or `output/de/index.html` (German).
The dev container (VS Code → *Reopen in Container*) brings Java, Node, SUSHI,
Jekyll and Graphviz — see
[`docs/recipes/first-build-in-devcontainer.md`](docs/recipes/first-build-in-devcontainer.md).

## Where things are

| Path | What it holds |
| --- | --- |
| `input/fsh/` | The FSH sources — profiles, extensions, value sets, examples, the logical model |
| `input/pagecontent/` | The narrative pages (English, the default rendering language) |
| `input/translations/de/` | The German mirrors of those pages, plus the page-title catalogue |
| `input/intro-notes/` | Per-artifact introductions rendered on top of the generated artifact pages |
| `implementation-guides/` | The previous Simplifier guide trees, retained as history |
| `migration-log/` | The record of the migration onto the module template |
| `docs/` | Recipes and conventions inherited from the module template |

## Getting help

- **FHIR and profiling questions** — HL7 FHIR Zulip <https://chat.fhir.org>,
  stream `german/mi-initiative`.
- **MII coordination** — MII Zulip <https://mii.zulipchat.com/>, stream
  `MII-Kerndatensatz`.
- **Issues** — <https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/issues>
