<!-- DEMONSTRATION PAGE — delete it, and its `pages:` entry and menu link, once
     you have taken what you need. It renders THIS scaffold's example profile
     and example instance, so it keeps working until you remove the starter
     artefacts, and then it breaks loudly rather than silently.

     GENERATED. Do not hand-edit: scripts/gen-rendering-demo.py writes both this
     file and its German mirror from one description, so the two cannot drift.

     Every directive below was verified to run without error against
     IG Publisher 2.2.11. Nothing here is Simplifier-specific: FQL does not run
     in an IG-Publisher build. See docs/recipes/render-existing-artifacts.md. -->

The IG Publisher generates a page for every profile, extension, value set and
example in this guide. You do not have to link readers away to them — you can
render the parts that matter **inside** a narrative page, next to the prose that
explains them.

This page shows a working example of **every directive that runs without error
in this scaffold**. Each block gives the source line first, then what it
produces. Copy the line, change the artifact name, delete the page.

<div class="ig-highlight ig-highlight-blue">
<h5>What this page is</h5>
A live demonstration shipped with the module scaffold. Read the source of this
page next to the rendering, copy what you need, then delete the page.
<strong>The step-by-step version is</strong>
<a href="https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/blob/main/docs/recipes/render-existing-artifacts.md"><code>docs/recipes/render-existing-artifacts.md</code></a> in this repository. It lists every file to remove when you delete
this page.
</div>

### 1. Include a generated fragment

During the build the Publisher writes a set of small HTML files — *fragments* —
for every artifact in the guide. The artifact pages you already see are built
from them, and any narrative page can include the same ones.

The name is always `<ResourceType>-<Id>-<code>.xhtml`, built from the artifact's
`Id:`, not from its FSH `Profile:` name. This scaffold's example profile has
`Id: example-patient`, so its element dictionary is:

<pre><code>{% raw %}{% include StructureDefinition-example-patient-dict-key.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-dict-key.xhtml %}

**This build emits 96 fragment codes for this scaffold's two artifacts.**
There is no published list that matches — the
[IG Publisher documentation](https://confluence.hl7.org/spaces/FHIR/pages/35718627/IG+Publisher+Documentation)
says so itself, above its own list: *"Note: as of July 2023, this list is not
comprehensive."* The catalogue below was taken from the build, not from a
document, and each entry is live. Open one to see its include line and its
rendering.

Some are deliberately empty — `history` has nothing to show without Provenance
resources, `experimental-warning` nothing unless the artifact is experimental.
An empty fragment is not an error.

Four of the 96 are listed with their include line but *without* their
rendering. `search-params`, `span`, `spanall` and `pseudo-json` link to targets that only
exist in the artifact-page context — the base-spec pages, `formats.html`, or
anchors the artifact page defines for itself. Embedded in a narrative page
those do not resolve, and the build reports each as a broken link. This is worth knowing
generally: a fragment being generated does not guarantee it can be embedded
anywhere. If your QA report gains broken links after you include one, this is
why.

#### The example profile — 78 codes

<details>
<summary><code>adl</code> — the element list, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-adl.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-adl.xhtml %}

</details>

<details>
<summary><code>adl-all</code> — the element list including inherited rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-adl-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-adl-all.xhtml %}

</details>

<details>
<summary><code>class-table</code> — the profile as a class table</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-class-table.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-class-table.xhtml %}

</details>

<details>
<summary><code>contained-index</code> — index of contained resources</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-contained-index.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-contained-index.xhtml %}

</details>

<details>
<summary><code>crumbs</code> — the breadcrumb trail</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-crumbs.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-crumbs.xhtml %}

</details>

<details>
<summary><code>ctxts</code> — the contexts an extension may be used in</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-ctxts.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-ctxts.xhtml %}

</details>

<details>
<summary><code>dict</code> — the full element dictionary</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-dict.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-dict.xhtml %}

</details>

<details>
<summary><code>dict-active</code> — the dictionary, elements with max cardinality > 0 only</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-dict-active.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-dict-active.xhtml %}

</details>

<details>
<summary><code>dict-diff</code> — the dictionary for differential elements</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-dict-diff.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-dict-diff.xhtml %}

</details>

<details>
<summary><code>dict-key</code> — the dictionary for key elements</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-dict-key.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-dict-key.xhtml %}

</details>

<details>
<summary><code>dict-ms</code> — the dictionary for must-support elements</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-dict-ms.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-dict-ms.xhtml %}

</details>

<details>
<summary><code>diff</code> — the Differential tab table</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-diff.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-diff.xhtml %}

</details>

<details>
<summary><code>diff-all</code> — the differential including inherited rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-diff-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-diff-all.xhtml %}

</details>

<details>
<summary><code>diff-bindings</code> — differential with binding columns</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-diff-bindings.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-diff-bindings.xhtml %}

</details>

<details>
<summary><code>diff-bindings-all</code> — differential with binding columns, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-diff-bindings-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-diff-bindings-all.xhtml %}

</details>

<details>
<summary><code>diff-obligations</code> — differential with obligation columns</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-diff-obligations.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-diff-obligations.xhtml %}

</details>

<details>
<summary><code>diff-obligations-all</code> — differential with obligation columns, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-diff-obligations-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-diff-obligations-all.xhtml %}

</details>

<details>
<summary><code>eview</code> — the element view</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-eview.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-eview.xhtml %}

</details>

<details>
<summary><code>eview-all</code> — the element view, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-eview-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-eview-all.xhtml %}

</details>

<details>
<summary><code>expansion</code> — value set expansions used by the profile</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-expansion.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-expansion.xhtml %}

</details>

<details>
<summary><code>experimental-warning</code> — the experimental-artifact banner (empty when not experimental)</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-experimental-warning.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-experimental-warning.xhtml %}

</details>

<details>
<summary><code>grid</code> — the grid view of the structure</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-grid.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-grid.xhtml %}

</details>

<details>
<summary><code>header</code> — the artifact identification header</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-header.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-header.xhtml %}

</details>

<details>
<summary><code>history</code> — change history from Provenance resources (empty when there are none)</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-history.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-history.xhtml %}

</details>

<details>
<summary><code>html</code> — the resource narrative</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-html.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-html.xhtml %}

</details>

<details>
<summary><code>inv</code> — the invariant summary</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-inv.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-inv.xhtml %}

</details>

<details>
<summary><code>inv-diff</code> — invariants introduced by the differential</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-inv-diff.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-inv-diff.xhtml %}

</details>

<details>
<summary><code>inv-key</code> — key invariants</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-inv-key.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-inv-key.xhtml %}

</details>

<details>
<summary><code>ip-statements</code> — intellectual-property statements</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-ip-statements.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-ip-statements.xhtml %}

</details>

<details>
<summary><code>json-html</code> — the JSON, syntax-highlighted</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-json-html.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-json-html.xhtml %}

</details>

<details>
<summary><code>json-schema</code> — a JSON Schema for the structure</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-json-schema.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-json-schema.xhtml %}

</details>

<details>
<summary><code>maps</code> — the element mappings</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-maps.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-maps.xhtml %}

</details>

<details>
<summary><code>maturity</code> — the maturity banner</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-maturity.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-maturity.xhtml %}

</details>

<details>
<summary><code>obligations</code> — the obligations table</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-obligations.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-obligations.xhtml %}

</details>

<details>
<summary><code>obligations-all</code> — the obligations table, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-obligations-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-obligations-all.xhtml %}

</details>

<details>
<summary><code>other-versions</code> — links to other versions</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-other-versions.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-other-versions.xhtml %}

</details>

<details>
<summary><code>pseudo-json</code> — a JSON template of the snapshot</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-pseudo-json.xhtml %}{% endraw %}</code></pre>

<p><em>Not embedded here: this fragment links every element to a dictionary anchor on the artifact page that the artifact page does not define, and carries eight binding links whose target is null. It is correct on the artifact page; inside a narrative page the links resolve against the wrong directory and the build reports them as broken. The include line itself is still valid.</em></p>

</details>

<details>
<summary><code>pseudo-ttl</code> — a Turtle template of the snapshot</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-pseudo-ttl.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-pseudo-ttl.xhtml %}

</details>

<details>
<summary><code>pseudo-xml</code> — an XML template of the snapshot</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-pseudo-xml.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-pseudo-xml.xhtml %}

</details>

<details>
<summary><code>sd-changes</code> — changes against the previous version</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-sd-changes.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-sd-changes.xhtml %}

</details>

<details>
<summary><code>sd-use-context</code> — the use contexts</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-sd-use-context.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-sd-use-context.xhtml %}

</details>

<details>
<summary><code>sd-xref</code> — where this structure is referenced</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-sd-xref.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-sd-xref.xhtml %}

</details>

<details>
<summary><code>search-params</code> — search parameters that apply</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-search-params.xhtml %}{% endraw %}</code></pre>

<p><em>Not embedded here: this fragment links to the base-spec resource pages (patient.html, person.html, practitioner.html, …). It is correct on the artifact page; inside a narrative page the links resolve against the wrong directory and the build reports them as broken. The include line itself is still valid.</em></p>

</details>

<details>
<summary><code>shex</code> — a ShEx schema for the structure</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-shex.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-shex.xhtml %}

</details>

<details>
<summary><code>snapshot</code> — the Snapshot tab table</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot.xhtml %}

</details>

<details>
<summary><code>snapshot-all</code> — the snapshot, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-all.xhtml %}

</details>

<details>
<summary><code>snapshot-bindings</code> — the snapshot with binding columns</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-bindings.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-bindings.xhtml %}

</details>

<details>
<summary><code>snapshot-bindings-all</code> — the snapshot with binding columns, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-bindings-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-bindings-all.xhtml %}

</details>

<details>
<summary><code>snapshot-by-key</code> — the snapshot ordered by key</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-key.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-key.xhtml %}

</details>

<details>
<summary><code>snapshot-by-key-all</code> — ordered by key, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-key-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-key-all.xhtml %}

</details>

<details>
<summary><code>snapshot-by-key-bindings</code> — ordered by key, with bindings</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-key-bindings.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-key-bindings.xhtml %}

</details>

<details>
<summary><code>snapshot-by-key-bindings-all</code> — ordered by key, with bindings, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-key-bindings-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-key-bindings-all.xhtml %}

</details>

<details>
<summary><code>snapshot-by-key-obligations</code> — ordered by key, with obligations</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-key-obligations.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-key-obligations.xhtml %}

</details>

<details>
<summary><code>snapshot-by-key-obligations-all</code> — ordered by key, with obligations, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-key-obligations-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-key-obligations-all.xhtml %}

</details>

<details>
<summary><code>snapshot-by-mustsupport</code> — the snapshot restricted to must-support</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-mustsupport.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-mustsupport.xhtml %}

</details>

<details>
<summary><code>snapshot-by-mustsupport-all</code> — must-support view, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-mustsupport-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-mustsupport-all.xhtml %}

</details>

<details>
<summary><code>snapshot-by-mustsupport-bindings</code> — must-support view with bindings</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-mustsupport-bindings.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-mustsupport-bindings.xhtml %}

</details>

<details>
<summary><code>snapshot-by-mustsupport-bindings-all</code> — must-support view with bindings, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-mustsupport-bindings-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-mustsupport-bindings-all.xhtml %}

</details>

<details>
<summary><code>snapshot-by-mustsupport-obligations</code> — must-support view with obligations</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-mustsupport-obligations.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-mustsupport-obligations.xhtml %}

</details>

<details>
<summary><code>snapshot-by-mustsupport-obligations-all</code> — must-support view with obligations, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-by-mustsupport-obligations-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-by-mustsupport-obligations-all.xhtml %}

</details>

<details>
<summary><code>snapshot-obligations</code> — the snapshot with obligation columns</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-obligations.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-obligations.xhtml %}

</details>

<details>
<summary><code>snapshot-obligations-all</code> — the snapshot with obligation columns, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-snapshot-obligations-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-snapshot-obligations-all.xhtml %}

</details>

<details>
<summary><code>span</code> — the profiles this profile refers to</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-span.xhtml %}{% endraw %}</code></pre>

<p><em>Not embedded here: this fragment links to formats.html and the help16.png icon. It is correct on the artifact page; inside a narrative page the links resolve against the wrong directory and the build reports them as broken. The include line itself is still valid.</em></p>

</details>

<details>
<summary><code>spanall</code> — profiles and base resources it refers to</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-spanall.xhtml %}{% endraw %}</code></pre>

<p><em>Not embedded here: this fragment links to formats.html and the help16.png icon. It is correct on the artifact page; inside a narrative page the links resolve against the wrong directory and the build reports them as broken. The include line itself is still valid.</em></p>

</details>

<details>
<summary><code>status</code> — the status banner</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-status.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-status.xhtml %}

</details>

<details>
<summary><code>summary</code> — the artifact summary</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-summary.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-summary.xhtml %}

</details>

<details>
<summary><code>summary-all</code> — the artifact summary, all rows</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-summary-all.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-summary-all.xhtml %}

</details>

<details>
<summary><code>summary-table</code> — the summary as a table</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-summary-table.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-summary-table.xhtml %}

</details>

<details>
<summary><code>tx</code> — terminology notes, snapshot, all elements</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-tx.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-tx.xhtml %}

</details>

<details>
<summary><code>tx-diff</code> — terminology notes, differential</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-tx-diff.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-tx-diff.xhtml %}

</details>

<details>
<summary><code>tx-diff-must-support</code> — terminology notes, differential, must-support only</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-tx-diff-must-support.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-tx-diff-must-support.xhtml %}

</details>

<details>
<summary><code>tx-key</code> — terminology notes for key elements</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-tx-key.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-tx-key.xhtml %}

</details>

<details>
<summary><code>tx-must-support</code> — terminology notes, must-support only</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-tx-must-support.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-tx-must-support.xhtml %}

</details>

<details>
<summary><code>typename</code> — the type name</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-typename.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-typename.xhtml %}

</details>

<details>
<summary><code>uses</code> — what uses this structure</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-uses.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-uses.xhtml %}

</details>

<details>
<summary><code>validate</code> — validation guidance</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-validate.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-validate.xhtml %}

</details>

<details>
<summary><code>validation</code> — the validation result</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-validation.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-validation.xhtml %}

</details>

<details>
<summary><code>xml-html</code> — the XML, syntax-highlighted</summary>

<pre><code>{% raw %}{% include StructureDefinition-example-patient-xml-html.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-patient-xml-html.xhtml %}

</details>


#### The example instance — 10 codes

Instances get a much smaller set: the views that only make sense for a
*definition* (snapshot, differential, dictionary, invariants) do not exist here.

<details>
<summary><code>contained-index</code> — index of contained resources</summary>

<pre><code>{% raw %}{% include Patient-ExamplePatientInstance-contained-index.xhtml %}{% endraw %}</code></pre>

{% include Patient-ExamplePatientInstance-contained-index.xhtml %}

</details>

<details>
<summary><code>history</code> — change history from Provenance resources (empty when there are none)</summary>

<pre><code>{% raw %}{% include Patient-ExamplePatientInstance-history.xhtml %}{% endraw %}</code></pre>

{% include Patient-ExamplePatientInstance-history.xhtml %}

</details>

<details>
<summary><code>html</code> — the resource narrative</summary>

<pre><code>{% raw %}{% include Patient-ExamplePatientInstance-html.xhtml %}{% endraw %}</code></pre>

{% include Patient-ExamplePatientInstance-html.xhtml %}

</details>

<details>
<summary><code>ip-statements</code> — intellectual-property statements</summary>

<pre><code>{% raw %}{% include Patient-ExamplePatientInstance-ip-statements.xhtml %}{% endraw %}</code></pre>

{% include Patient-ExamplePatientInstance-ip-statements.xhtml %}

</details>

<details>
<summary><code>json-html</code> — the JSON, syntax-highlighted</summary>

<pre><code>{% raw %}{% include Patient-ExamplePatientInstance-json-html.xhtml %}{% endraw %}</code></pre>

{% include Patient-ExamplePatientInstance-json-html.xhtml %}

</details>

<details>
<summary><code>maturity</code> — the maturity banner</summary>

<pre><code>{% raw %}{% include Patient-ExamplePatientInstance-maturity.xhtml %}{% endraw %}</code></pre>

{% include Patient-ExamplePatientInstance-maturity.xhtml %}

</details>

<details>
<summary><code>status</code> — the status banner</summary>

<pre><code>{% raw %}{% include Patient-ExamplePatientInstance-status.xhtml %}{% endraw %}</code></pre>

{% include Patient-ExamplePatientInstance-status.xhtml %}

</details>

<details>
<summary><code>validate</code> — validation guidance</summary>

<pre><code>{% raw %}{% include Patient-ExamplePatientInstance-validate.xhtml %}{% endraw %}</code></pre>

{% include Patient-ExamplePatientInstance-validate.xhtml %}

</details>

<details>
<summary><code>validation</code> — the validation result</summary>

<pre><code>{% raw %}{% include Patient-ExamplePatientInstance-validation.xhtml %}{% endraw %}</code></pre>

{% include Patient-ExamplePatientInstance-validation.xhtml %}

</details>

<details>
<summary><code>xml-html</code> — the XML, syntax-highlighted</summary>

<pre><code>{% raw %}{% include Patient-ExamplePatientInstance-xml-html.xhtml %}{% endraw %}</code></pre>

{% include Patient-ExamplePatientInstance-xml-html.xhtml %}

</details>


#### Cross-artifact lists — 8 forms

These are generated per profile rather than per view, and list the examples,
test plans and test scripts attached to it.

<details>
<summary><code>StructureDefinition-example-list-all-example-patient</code></summary>

<pre><code>{% raw %}{% include StructureDefinition-example-list-all-example-patient.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-list-all-example-patient.xhtml %}

</details>

<details>
<summary><code>StructureDefinition-example-list-example-patient</code></summary>

<pre><code>{% raw %}{% include StructureDefinition-example-list-example-patient.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-list-example-patient.xhtml %}

</details>

<details>
<summary><code>StructureDefinition-example-table-all-example-patient</code></summary>

<pre><code>{% raw %}{% include StructureDefinition-example-table-all-example-patient.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-table-all-example-patient.xhtml %}

</details>

<details>
<summary><code>StructureDefinition-example-table-example-patient</code></summary>

<pre><code>{% raw %}{% include StructureDefinition-example-table-example-patient.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-example-table-example-patient.xhtml %}

</details>

<details>
<summary><code>StructureDefinition-testplan-list-example-patient</code></summary>

<pre><code>{% raw %}{% include StructureDefinition-testplan-list-example-patient.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-testplan-list-example-patient.xhtml %}

</details>

<details>
<summary><code>StructureDefinition-testplan-table-example-patient</code></summary>

<pre><code>{% raw %}{% include StructureDefinition-testplan-table-example-patient.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-testplan-table-example-patient.xhtml %}

</details>

<details>
<summary><code>StructureDefinition-testscript-list-example-patient</code></summary>

<pre><code>{% raw %}{% include StructureDefinition-testscript-list-example-patient.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-testscript-list-example-patient.xhtml %}

</details>

<details>
<summary><code>StructureDefinition-testscript-table-example-patient</code></summary>

<pre><code>{% raw %}{% include StructureDefinition-testscript-table-example-patient.xhtml %}{% endraw %}</code></pre>

{% include StructureDefinition-testscript-table-example-patient.xhtml %}

</details>


### 2. Embed part of an example instance

The <code>{%! fragment %}</code> tag renders an instance held in this guide and
can narrow it with FHIRPath, so the reader sees only the element under
discussion — useful when an example is long and one field is the point.

The syntax is `[ResourceType]/[id] [format] [filters]`. The format must be one
of `json`, `xml`, `ttl` or `fml`; anything else is an error. The id is the
instance id, and the resource must exist in this guide.

<pre><code>{%! fragment Patient/ExamplePatientInstance JSON BASE:name %}</code></pre>

{% fragment Patient/ExamplePatientInstance JSON BASE:name %}

The same subtree as XML:

<pre><code>{%! fragment Patient/ExamplePatientInstance XML BASE:name %}</code></pre>

{% fragment Patient/ExamplePatientInstance XML BASE:name %}

`ttl` and `fml` are accepted by the same check, but neither is demonstrated
here. `ttl` parses and then does not render: the Publisher writes its internal
object into the page —

```
org.hl7.fhir.utilities.turtle.Turtle@7d4f6072
```

— with no error, no warning and no broken link, so nothing but reading the page
catches it. `fml` applies to StructureMaps, and this scaffold has none. Use
`json` or `xml`.

Without a filter you get the whole instance. `ELIDE:` replaces a named element
with `...` instead of removing it, which keeps the shape of the resource visible
while hiding detail:

<pre><code>{%! fragment Patient/ExamplePatientInstance JSON ELIDE:meta %}</code></pre>

{% fragment Patient/ExamplePatientInstance JSON ELIDE:meta %}

There are three filters in total. `BASE:` selects the subtree to show — only one
per fragment. `ELIDE:` replaces an element with `...`, and may be repeated.
`EXCEPT:` keeps a named element inside something otherwise elided, and may carry
its own `BASE:`.

### 3. Query this guide's own artifacts

During the build the Publisher writes `package.db`, a SQLite database of the
guide's own content. Any page can query it and render the result as a table —
this is the IG-Publisher answer to a cross-artifact query:

<pre><code>{%! sql select Name, Description from Resources order by Name %}</code></pre>

{% sql select Name, Description from Resources order by Name %}

`Resources` is the table you will use most. Its columns include `Key`, `Type`,
`Id`, `Web`, `Url`, `Version`, `Status`, `Date`, `Name`, `Title`, `Description`,
`Purpose`, `Copyright`, `Realm`, `derivation` and `kind`. Other tables hold
concepts, designations, extension usage and package metadata. The schema is not
stable between Publisher releases, so open `package.db` from your own build with
any SQLite client and look before relying on a column.

A JSON form of the same tag controls the column titles, the CSS class and how
each column is rendered — `link`, `markdown`, `canonical`, `resource` and
others:

<pre><code>{%! sql {
  "query" : "select Name, Description, Web from Resources order by Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Name", "type" : "link", "source" : "Name", "target" : "Web" },
    { "name" : "Description", "type" : "markdown", "source" : "Description" }
  ]
} %}</code></pre>

{% sql {
  "query" : "select Name, Description, Web from Resources order by Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Name", "type" : "link", "source" : "Name", "target" : "Web" },
    { "name" : "Description", "type" : "markdown", "source" : "Description" }
  ]
} %}

### 4. Query into a variable instead of a table

`sqlToData` runs the same query but hands you the rows instead of rendering
them, so you can lay them out yourself. The first argument names the variable —
the rows also land in `_data/<name>.json` and are reachable as
`site.data.<name>`:

<pre><code>{%! sqlToData artifactCount
  select count(*) as n from Resources
%}</code></pre>

{% sqlToData artifactCount
  select count(*) as n from Resources
%}

This guide contains {{ artifactCount[0].n }} resources. That number came from
the query above, written as <code>{% raw %}{{ artifactCount[0].n }}{% endraw %}</code>.

Because the result is an ordinary Liquid array, you can loop over it:

<pre><code>{%! sqlToData profileList
  select Name, Web from Resources where Type = 'StructureDefinition' order by Name
%}</code></pre>

{% sqlToData profileList
  select Name, Web from Resources where Type = 'StructureDefinition' order by Name
%}

<ul>
{% for p in profileList %}<li><a href="{{ p.Web }}">{{ p.Name }}</a></li>
{% endfor %}</ul>

### 5. Render a JSON file through a template

The <code>{%! json %}</code> tag reads any JSON file in the repository and
renders it through a Liquid template you write. Both paths are relative to the
repository root — the directory holding `ig.ini`. It was built for documenting
test cases, but it works for any JSON you keep alongside the guide.

Here it renders this repository's own `publication-request.json`, the file that
drives formal publication:

<pre><code>{%! json publication-request.json demo/rendering-artifacts.liquid %}</code></pre>

{% json publication-request.json demo/rendering-artifacts.liquid %}

The template is five lines and lives at `demo/rendering-artifacts.liquid`.
Delete it together with this page.

### 6. Include the reader's own language

This scaffold is bilingual, and the Publisher writes a `-en` and a `-de` variant
of every fragment. <code>{%! lang-fragment %}</code> picks the one matching the
page being rendered, so a single line serves both languages:

<pre><code>{%! lang-fragment StructureDefinition-example-patient-summary.xhtml %}</code></pre>

{% lang-fragment StructureDefinition-example-patient-summary.xhtml %}

On the English page that resolves to
`StructureDefinition-example-patient-summary-en.xhtml`, on the German page to
`-de`. Use this rather than a plain `include` whenever the fragment contains
prose, otherwise a German reader gets English tables.

### 7. Link to an artifact by name

Triple brackets auto-link an artifact without you writing the URL. Inside go a
resource **name**, a canonical URL, or a FHIR type name:

<pre><code>The profile [[[ExamplePatient]]] constrains [[[Patient]]].</code></pre>

The profile [[[ExamplePatient]]] constrains [[[Patient]]].

The match is on the artifact's `name`, case-insensitively — `ExamplePatient`
here, which is the FSH `Profile:` name, *not* the `Id:` used for fragments. A
name that resolves to nothing is left in the page as `[[~[…]]]`, which is easy
to grep for and does not fail the build.

### 8. Directives with no example here

Four of the Publisher's keywords are not demonstrated above, for reasons worth
knowing before you reach for them.

| Directive | Why there is no example | What it would need |
| --- | --- | --- |
| `{%! uml %}` | **It is broken.** The keyword is registered but has no implementation behind it, so it writes `Error processing command: Internal Error - unknown keyword uml` into your page while the build still reports success | Use `class-diagram` instead |
| `{%! class-diagram %}` | Needs an `input/diagrams/` directory and a logical model to draw; this scaffold has neither | A logical model, plus Graphviz on the build machine |
| `{%! multi-map %}` | Needs a source ValueSet and ConceptMaps to scan; this scaffold defines no terminology | A ValueSet and at least one ConceptMap |
| `{%! dataset %}` | Needs a dataset registered through an IG parameter; without one it throws `Unable to find dataset` | A dataset declared in `sushi-config.yaml` |

Add the artifact each one needs and the directive starts working — none of them
is deprecated. The recipe explains where each is documented, and which are
documented at all.

<div class="ig-highlight ig-highlight-green">
<h5>Showing a directive without running it</h5>
Two escapes appear above, because two engines run in sequence. The Publisher's
own Liquid pass runs <em>before</em> Jekyll and claims eight keywords:
<code>sql</code>, <code>fragment</code>, <code>json</code>,
<code>class-diagram</code>, <code>uml</code>, <code>multi-map</code>,
<code>lang-fragment</code> and <code>dataset</code>. To show one of those
without running it, add an exclamation mark — <code>{%! sql … %}</code>. The
Publisher turns that into a literal itself. Wrapping it in
<code>{% raw %}{% raw %}{% endraw %}</code> does <em>not</em> work, because the
Publisher's pass runs first and does not know what <code>raw</code> means; the
directive executes and its error is written into the page while the build still
reports success.
<br><br>
For a plain Jekyll tag such as <code>{% raw %}{% include %}{% endraw %}</code>
it is the other way round: the Publisher never looks at it, so
<code>{% raw %}{% raw %}{% endraw %}</code> is the correct escape — and the
exclamation mark is a build error, because the Publisher leaves it alone and
Jekyll cannot parse it.
</div>

<div class="ig-highlight ig-highlight-green">
<h5>Before you rely on any of this</h5>
The three families in sections 1 to 3 are documented and stable. Several
neighbouring mechanisms are not — some are implemented but appear in no
documentation, and one is documented but does not run. The recipe lists which is
which, with the primary source for each.
</div>
