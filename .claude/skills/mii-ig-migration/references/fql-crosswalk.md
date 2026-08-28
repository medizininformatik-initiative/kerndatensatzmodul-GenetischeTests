# Simplifier and FQL directives → HL7 IG Publisher crosswalk

Simplifier renders narrative pages with its own directive syntax, including FQL query blocks. The
IG Publisher renders them with Jekyll/Liquid over fragments it generates itself. Migration means
translating between the two, and this file is the mapping plus the reasoning behind it.

## The authoritative rule file

The machine-readable rules are [`fql-rules.tsv`](fql-rules.tsv), tab-separated as
`LABEL ⟶ ERE pattern ⟶ recommendation`. The scanner `scripts/fql-scan.sh` reads **only** that
file, so the table below is documentation and the TSV is the contract.

**Extend it by hand** when a directive is not covered: add one line with a unique label, an ERE
pattern (write curly braces as `\{ \}` so egrep does not read them as an interval), and a
recommendation. The scanner reports uncovered directive-shaped lines as `[UNKNOWN]`, which is the
prompt to add a rule rather than to ignore the line.

Two constraints on patterns, both learned by getting them wrong: ERE has **no lookahead**, so keep
patterns non-overlapping or a single finding is counted twice; and the second pass only skips lines
a specific rule already matched, keyed on `file:line`.

## Mapping table

| Simplifier / FQL | HL7 IG Publisher equivalent |
| --- | --- |
| `{{page-title}}` | remove — the title comes from the template's page set and `input/includes/menu.xml` |
| `{{index:root}}` | remove — the table of contents and navigation are generated |
| `{{pagelink: …, hint: MII_PR_X}}` | `[Text](StructureDefinition-mii-pr-x.html)` (hint = artefact `name` → `id`) |
| `{{link:<id>}}` | artefact link `[Text](<Type>-<id>.html)` |
| `{{render:<image>}}` (png/jpg/svg…) | copy the image into `input/images/`. With the module template **> v0.4.0** a plain Markdown image `![Alt](file.png)` is safe: the template's CSS block-centers and width-caps content images (opt back into a float with `class="float"` raw HTML). On **older** templates wrap it in raw HTML — `<div style="text-align: center;"><img src="file" alt="…" style="max-width: 100%;"/></div>` — because their base CSS floats `p > img` (text wraps beside it) and caps no width |
| `{{render:<canonical>}}` (resource) | usually remove — the artefact page is generated. EXCEPTION: on `capability-statements.md` render the CS INLINE via `{% lang-fragment CapabilityStatement-<id>-html.xhtml %}` (the `-html` fragment is the rendered narrative; the bare `<id>.xhtml` does not exist and fails Jekyll — measured 2026-08-20). Spec §9b |
| `{{tree}}` / `{{tree, expand}}` | the `-snapshot` fragment (or `-dict` / `-diff`) |
| `{{xml}}` | **prefer a link to the artefact page**; when an inline rendering is genuinely needed: the `-xml-html` fragment |
| `{{json}}` | **prefer a link to the artefact page**; inline: the `-json-html` fragment |
| `<fql … for differential.element select id, short>` | element table: the `-dict` fragment |
| `<fql>` metadata (url/status/version) | drop it — the publisher generates the header |
| FQL code block (`@` plus a fenced block) | treat as `<fql>` |
| `<tabs>` / `<tab>` (rendering/XML/JSON) | when the vendored template ships `includes/structure-tabs.html` (module template > v0.4.0): the parameterized include — one line, renders Structure/Differential/XML/JSON as real tabs on the narrative page, `lang="de"` in the German mirror. Otherwise **prefer a link to the artefact page**, which renders the same views as tabs like the official FHIR specification pages; sequential inline fragments are the last resort |

`<Type>` is one of `StructureDefinition`, `CodeSystem`, `ValueSet`, `CapabilityStatement`, …;
`<id>` is the artefact `id`. Fragment views available per StructureDefinition include `snapshot`,
`diff`, `dict`, `snapshot-by-mustsupport`, `bindings`, `obligations`, `inv`, `search-params`,
`maps`, `xml-html` and `json-html`. (**Not** `-xml`: an earlier version of this table named a
`-xml` fragment that publisher 2.2.11 does not generate, and one include of it fails the whole
Jekyll run — verify a fragment exists under `temp/pages/_includes/` before relying on it.) The
publisher generates them under `_includes/`, and the HL7 base template uses the same fragments in
its own layouts — which is why relying on them is safe rather than clever.

Two rendering gotchas, both learned on a real migration: kramdown **IAL attributes on headings**
(`{: #anchor }`) are not applied by the publisher's Jekyll setup — hand-built tables of contents
pointing at such anchors produce broken-link QA errors; rely on the generated heading ids or drop
the mini-TOC. And serialization dumps inlined into narrative pages duplicate what the artefact
page's tabs already show — link instead (see the table above).

The exact `{% include %}` syntax is deliberately **not** written out in this file. See the build
guard below.

## Build guard: no Liquid literals in `pagecontent`

The IG Publisher renders `pagecontent` pages through Jekyll, and **Liquid evaluates `{% … %}` and
`{{ … }}` everywhere — including inside `<!-- … -->` comments.**

- An invalid `{% … %}` — for instance an example `include` written in a comment — **breaks the
  build hard.**
- A `{{ … }}` with unknown content silently becomes an empty string. No error, but it leaks into
  the HTML.

So: in `pagecontent`, including provenance and TODO comments, write **no** Liquid or Simplifier
directive literals. Describe the mechanism in prose. The real `{% include %}` belongs outside
comments, in the page body where it is meant to run.

This matters more on the MII KDS module template than on most, because the template's own files
are full of `{{PLACEHOLDER}}` values that must be replaced before the guide builds at all.

## Replacing FQL query tables

FQL's main use in KDS guides is generating tables over resource contents. There are three
replacements, and choosing between them is a judgement call:

- **Element or dataset table** (FQL `for differential.element select id, short`) → the `-dict`
  fragment, which renders the element dictionary with paths and definitions inline; or a static
  Markdown table when the FQL query was doing something the dictionary does not express.
- **Cross-resource table** (FQL over several resources) → Liquid over `site.data.*`
  (`structuredefinitions.json`, `resources.json`, `artifacts.json`), iterating and emitting table
  rows. The publisher populates those data files, so this is the supported route rather than a
  workaround.
- **Mechanical extraction into a generated static table.** When the FQL query is a pure
  projection of a single resource's own content **and no publisher view renders that content**,
  generate the Markdown table mechanically from the built resource JSON
  (`fsh-generated/resources/…`) at migration time. This is *extraction, not invention* — it does
  not violate the no-fabrication guardrail — but it must be marked: open the table with a
  `GENERATED TABLE` comment naming the source file and fields and saying it must be regenerated
  after resource changes. The canonical case: a logical model's `differential.element.mapping`
  (dataset → FHIR mapping) — the publisher renders LM element mappings **nowhere** (the LM's
  Mappings tab stays empty), so a pointer to the artefact page silently loses the table readers
  relied on. A pointer is only an acceptable replacement when the target page actually shows the
  data — verify that before pointing.

## Procedure

1. **Scan.** `scripts/fql-scan.sh [path…]` lists file, line, directive and recommendation per
   finding; `[UNKNOWN]` marks directives no rule covered.
2. **Transform.** Apply the recommendation per finding. Ambiguous cases — `{{render:<canonical>}}`
   as remove versus include, `<fql>` as `-dict` versus a static table — take professional
   judgement. When in doubt, mark `TODO:REVIEW` and **invent nothing**.
3. **Re-scan.** `scripts/fql-scan.sh --strict` should exit 0, with the only acceptable exception
   being findings deliberately left as marked `TODO:REVIEW`.
