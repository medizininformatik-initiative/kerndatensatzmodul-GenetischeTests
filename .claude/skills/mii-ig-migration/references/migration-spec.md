# Migration specification — Simplifier MII KDS module IG → MII KDS module template

The full procedure, with an acceptance criterion per step. `SKILL.md` is the operating summary;
this is the normative detail.

Vendor-neutral: it is a task specification, applicable to any tool-capable agent with the
capabilities in §3. The agent **supports and partly automates** the migration; final human review
is mandatory and the agent never publishes.

**Verify the target against the target, not against this file.** Every statement here about the
MII KDS module template was true of the template when this skill was reworked (2026-07-31). The
template moves. Where this file and the checked-out template disagree, the template wins, and
saying so in the migration report is part of the job.

---

## 1. Objective

Move a source guide into the target template's format, structurally conformant to the MII KDS
Meta-Manteldokument (current edition) and to the HL7 IG best practices, bilingual with **English as
the default language and German as the translation**.

That language direction is the single most important thing to re-check on every run. It was
previously German-default, and the reversal is not visible from the source guide.

## 2. Inputs

**Provided by a human — these cannot be derived:**

- `SOURCE_RENDERED_IG_URL` — URL of the rendered Simplifier IG.
- `SOURCE_REPO_URL` — URL of its source GitHub repository.
- **Target `version`** — MII CalVer `YYYY.n.n`, **not** SemVer. The only module-identifying value
  that is a human decision; the default is the source's version.

**Not provided — read from the source:** every other module-identifying value. The agent reads them
and carries them over unchanged. It does not invent them and does not ask.

### 2.1 Module identity — where each value comes from

**Identity is RECOVERED from several sources in a fixed order, and every field is recorded with the
source it came from.** A published KDS module whose repository is bare is not identity-less; it is
identity-*scattered*, and the failure mode this ordering exists to prevent is concluding "a human
must supply everything" after reading one place and finding nothing.

| Tier | Source | Yields | Where |
| --- | --- | --- | --- |
| **C** | repo-local `sushi-config.yaml` | everything it declares — it is what the build reads | §2.1 |
| **P** | the **published package**: manifest + the packaged resources' own `url`s | `packageId`, `version`, `description`, `fhirVersions`, `jurisdiction`, `dependencies`, `canonical` | §2.1.1 |
| **J** | repo `package.json` | `name`, `version`, `canonical`, `title`, `license` where present | §2.1 |
| **I** | the generated `ImplementationGuide` resource | fields absent from C/J | §2.1 |
| **R** | the **source GitHub repository**: README, LICENSE, tags, repo metadata | `license` (real evidence), a `title` candidate, a `description` candidate, release-tag evidence for `version` | §2.1.2 |
| **H** | the **Simplifier project page** | nothing mechanically — a **human reference** for what no machine source carries. The **guide** pages are a different URL space, are server-rendered, and are the narrative harvest source | §2.1.3, §5.1c, §5.1d |
| **T** | the template's own literals and patterns | last resort, and a Gate-A note every time | §2.2 |
| **G** | goFSH's derived `sushi-config.yaml` | **never identity** — recorded only so its disagreement becomes visible | §5.1b.2 |

Higher tier wins **only as a recommendation to the human at Gate A**; a lower tier disagreeing is a
finding, not noise (§2.1.4). Run the recovery in that order — tier P before goFSH, because the `-d`
dependency set comes out of it (§5.1b.1a) — and **never alter existing metadata from a recovered
value, even where the recovery shows that metadata to be inconsistent.**

Read from the `sushi-config.yaml` and `package.json` at the root of `SOURCE_REPO_URL` (§2). Absent a `sushi-config.yaml`, read
`package.json` plus the `ImplementationGuide` resource. **When both files exist and disagree on a
field, `sushi-config.yaml` wins** — it is what the build reads; record the disagreement in the
migration report. (Real case: a `package.json` whose `canonical` carries the IG-resource URL
`…/ImplementationGuide/<id>` instead of the canonical base.)

| Field | Read from | Human input? | Written to |
| --- | --- | --- | --- |
| `id` | `sushi-config: id` | derived — the template pattern `mii-ig-<slug>` applies only when the source has none | `sushi-config: id` |
| module title | `sushi-config: title` / `package.json: title` | derived | `title`, menu, README |
| module abbreviation | existing FSH artefact names (`MII_PR_<Module>_…`) | derived — names stay | FSH `name` / `title` |
| `packageId` | `package.json: name` / `sushi-config: packageId` | derived | `sushi-config: packageId` |
| `canonical` | `sushi-config: canonical` / `package.json: canonical` | derived — **never change** | `sushi-config: canonical` |
| `version` | `sushi-config` / `package.json: version` | **yes — confirm or bump** | `sushi-config: version`, release tag |
| `status` / `releaseLabel` | `sushi-config` | derived (confirm) | `sushi-config` |
| `license` | `sushi-config: license` / `package.json: license` | derived — **never change silently** (§2.2) | `sushi-config: license` |
| `copyrightYear` | `sushi-config: copyrightYear` | derived — fills the template's `{{COPYRIGHT_START_YEAR}}` | `sushi-config: copyrightYear` |
| `dependencies` | `sushi-config: dependencies` (+ `package.json`) | derived — resolve `.x` pins | `sushi-config: dependencies` |
| `publisher` / `contact` | `sushi-config: publisher` | derived | `sushi-config: publisher` |

**Third-tier fallback:** when a field exists in neither `sushi-config.yaml` nor `package.json`,
read it from the generated `ImplementationGuide` resource
(`fsh-generated/resources/ImplementationGuide-*.json`) — real modules lack `id` there
(kerndatensatz-labor) or `title` and `license` (kerndatensatzmodul-person, whose `package.json`
also carries no canonical). A value absent everywhere takes the **template default** and is
recorded as a Gate-A note — never adopted silently.

**Fourth tier — source shape B (§5.1b): the published package.** A Forge-authored repository
commonly has neither a `sushi-config.yaml` nor a `package.json` nor a generated
`ImplementationGuide` resource (`kerndatensatzmodul-consent` has none of the three). The identity
chain above is then empty — but the module is not identity-less, because **a module that was
PUBLISHED ships its identity inside its package tarball**. Read it with §2.1.1 before concluding
that a human must supply everything; that conclusion is right for exactly three fields, not for all
of them. **The `sushi-config.yaml` goFSH writes is not a source of identity** — it carries no `id`,
`name`, `title`, `publisher`, `packageId` or `license`, and its `version` is one arbitrary
artefact's version (measured: `1.0.8` — the `DocumentReference` profile's — while the module's
published version is `2026.0.0`). Reading identity out of it would silently rename and re-version a
published module.

### 2.1.1 Tier P — the published package (authoritative for a published module)

Fetch the package and read its manifest. Two commands, no tooling:

```bash
curl -sfL "https://packages.simplifier.net/<packageId>/<version>" -o pkg.tgz && tar xzf pkg.tgz
cat package/package.json          # the manifest; the resources sit beside it in package/
```

`https://packages.fhir.org/<packageId>/<version>` serves the same packages. Do not run this by
hand: **`scripts/package-identity.sh` performs it and reports every field into the run log**,
including the derivation and the refusals below.

```bash
bash "$SKILL_DIR/scripts/package-identity.sh" \
  --package de.medizininformatikinitiative.kerndatensatz.consent --version 2026.0.0
```

**Where tier P ranks.** It is authoritative for the module's *published identity*, and it is a
**snapshot of one release** — not of the commit being migrated. So:

1. **A repo-local `sushi-config.yaml` still wins** where one exists. It is what the build reads and
   it may legitimately be *ahead* of the last release. Tier P then serves as a **cross-check**, and
   a divergence between the two is reported at Gate A (§2.2) rather than resolved here.
2. **Absent a `sushi-config.yaml`, tier P outranks the repo `package.json` and the generated
   `ImplementationGuide`** for the fields it carries: those are build inputs or build outputs of one
   commit, while the manifest is what consumers actually resolve.
3. **Within the package, the manifest outranks the packaged `ImplementationGuide` resource** for
   every field the manifest carries.
4. **It always outranks goFSH's derived config, the package id's shape, and the rendered guide's
   URL** — none of which is evidence (see the tier-four paragraph above, and §5.1b.2).

**Which version to read.** The one the migrated **source commit** corresponds to, verified against
the resources' own `version` values — *not* `dist-tags.latest` by reflex, and not the highest
version string. The two differ: measured on Consent (2026-08-06), `dist-tags.latest` is `2026.0.0`
while the highest string published is `2026.0.1-rc-3`, a prerelease with a *different* dependency
pin and a *different* `Consent.category` slicing. `package-identity.sh` WARNs `version-above-latest:`
when versions sort above `latest`; resolve it with evidence, and record which release you read.

**What the manifest yields** — measured on
`de.medizininformatikinitiative.kerndatensatz.consent@2026.0.0`:

| Field | Value read | Maps onto |
| --- | --- | --- |
| `name` | `de.medizininformatikinitiative.kerndatensatz.consent` | `packageId` |
| `version` | `2026.0.0` | the module `version` (the default the human confirms, §2) |
| `description` | `KDS Modul Consent Release 2026.0.0` | description / release note |
| `fhirVersions` | `["4.0.1"]` | `fhirVersion` |
| `jurisdiction` | `urn:iso:std:iso:3166#DE` | `jurisdiction` |
| `dependencies` | `hl7.fhir.r4.core@4.0.1`, `de.einwilligungsmanagement@2.0.2` | `dependencies`, and goFSH's `-d` set (§5.1b.2) |
| `author` | `sebastianstubert` | **nothing.** A registry account, not a `publisher` |

A manifest **may** also carry `canonical`, `title`, `license` or `homepage`; MII KDS manifests
measured so far do not. Read what is there, report what is not.

**The canonical, by common prefix.** The manifest above declares none, so derive it from the
**packaged resources' own `url` values**: take each `url`, remove the trailing
`/<ResourceType>/<id>`, and require the remainders to be **unanimous**. Measured on Consent:
**13 of 13** absolute URLs agree on
`https://www.medizininformatik-initiative.de/fhir/modul-consent`.

- **A non-unanimous prefix is a FINDING, not a majority vote.** Report every candidate with its
  count and an example, and take it to Gate A. Two bases in one package is a real condition (a
  module that absorbed another's artefacts); adopting the larger set silently re-homes the smaller
  one, and a changed published canonical breaks every consumer that resolves it — guardrail 1, the
  one mistake that cannot be quietly fixed later. `package-identity.sh` WARNs
  `canonical-not-unanimous:` and exits 1 rather than picking.
- **URLs that are not absolute `http(s)` carry no base** and are excluded *by name*, never
  reshaped. Measured on Consent: two CodeSystems published under
  `urn:oid:2.16.840.1.113883.3.1937.777.24.5.2/.3`, and the packaged `ImplementationGuide` whose
  `url` is the **relative Simplifier guide path** `/guide/mii-ig-modul-consent-2026?version=current`
  — a rendering address, not a canonical base.
- Examples and other resources carrying no `url` at all (measured: the six Consent examples) are
  neither evidence nor a problem; they are reported as not participating.

**What tier P does NOT yield — the genuine Gate-A remainder.** `title`, `license` and `publisher`.
A FHIR package manifest has no field for them, so their absence is a property of the format rather
than of the package, and **no adjacent field substitutes**: `author` is the registry account that
pushed the release. The packaged `ImplementationGuide`, where one exists, may narrow this — on
Consent it yields `name: "MII IG Consent v2026"` (a computer name, not a title) and leaves `title`,
`publisher` and `license` null. Narrow the Gate-A item to what is genuinely missing; do not widen it
back to "everything", and do not fill it from the template's literals (§2.2 — `license` above all).

**Recovered is not applied.** Everything above is *evidence for a human decision*. Existing
metadata — in the module repository, in the FSH, in a manifest — is **never overwritten from a
recovered value**, not even where the recovery shows it to be inconsistent. Report the
inconsistency; let Gate A decide.

**Resolving floating pins** (`1.5.x`, `2025.0.x`): query the FHIR package registry
(`https://packages.fhir.org/<packageId>` or `packages.simplifier.net`) and pick the **highest
release matching the floating pattern**; when the source's CI logs or package cache prove which
concrete version the last build actually used, prefer that evidence. Record the chosen version
AND its evidence source in the migration report (Gate A) — the pick changes validation behavior.

A top-level `language:` value in the source is **not** identity: it belongs to the source's old
single-language setup. The target's language configuration is the template's i18n mechanism
(§4.2, §5.5) — do not carry `language:` over into it.

### 2.1.2 Tier R — the source repository (the only machine source for `license`)

Tier P ends with three fields a FHIR package manifest has no place for: `title`, `license`,
`publisher`. Two of them are not actually unknown, because the repository the migration is already
reading carries evidence for them.

```bash
bash "$SKILL_DIR/scripts/repo-identity.sh" \
  --dir <local-checkout> --repo <owner>/<name> --rendered <rendered-guide-url>
```

| Read | From | Standing |
| --- | --- | --- |
| `license` | the `LICENSE` file's **text**, matched against a conservative SPDX table | **real licence evidence** — the SPDX id of the licence the module is published under |
| `license` | GitHub's own `license.spdx_id` for the same file | a second, independent reading of the same file; recorded separately so a disagreement is visible |
| `title` | the README's **first heading, at any level** | a **candidate**, confirmed at Gate A |
| `description` | the GitHub repository description | a candidate — a repository blurb is not the module's `description` |
| `version` | the release **tags** | evidence for **which release the migrated commit is**: the tag equal to tier P's version is what ties the two together (measured on Consent: tag `2026.0.0` = package version `2026.0.0`) |

- **`license` is the field this tier exists for.** The template ships `license: CC-BY-4.0` as a
  literal, so §2.3's placeholder gate never flags it, and MII modules commonly declare `CC0-1.0`
  (§2.2). A LICENSE file is the difference between carrying a licence over and silently relicensing
  published content. Measured on `kerndatensatzmodul-consent`: the LICENSE text is CC-BY-4.0 and
  GitHub's detection agrees — the same value the template would have defaulted to, **which is a
  finding to record, not a reason it did not need checking**.
- **An unrecognized LICENSE text yields nothing.** `repo-identity.sh` WARNs
  `license-text-unrecognized:` and emits no id. A guessed licence is the worst kind of plausible
  wrong value: legally meaningful, and nobody re-reads it.
- **`publisher` is NOT the GitHub owner.** An account that hosts a repository is not the publishing
  organisation of a conformance artefact — the same reason the registry `author` is not one
  (§2.1.1). The script says so with `not-recoverable-from-a-repository: publisher` and leaves the
  field to a human.
- A rate-limited or unreachable API is reported (`github-api-rate-limited:`) and **never recorded as
  "the repository carries no identity"**; re-run against a local checkout.

### 2.1.3 Tier H — Simplifier: two URL spaces, two different answers

**Read this section before concluding that anything on Simplifier is unreadable.** An earlier
edition of this spec said the platform renders client-side and is therefore not a scrape target.
That was measured on the PROJECT page and generalised to the GUIDE pages, which are a different URL
space and are server-rendered. The generalisation was wrong, and it cost a real migration its
narrative — see §5.1c (finding the guide) and §5.1d (harvesting it), and the correction entry in
`references/provenance.md`.

| URL space | Example | Measured 2026-08-06 | Verdict |
| --- | --- | --- | --- |
| **Project page** | `https://simplifier.net/MedizininformatikInitiative-ModulConsent/` | HTTP 200, ~56 KB, 52 `<script` markers, **no identity metadata in the DOM** | client-rendered application shell — **a human reference, not a scrape target** |
| **Guide root** | `https://simplifier.net/guide/miiigmodulconsent/MIIIGModulConsent?version=2026.0.0` | HTTP 200, **24509 bytes**, **~3.4 k characters of visible text** after stripping script/style, carrying the complete page tree (Release Notes, Beschreibung Modul Consent, Kontext im Gesamtprojekt / Bezüge zu anderen Modulen, Referenzen, Anwendungsfälle / Informationsmodell, …); **23 `href="/guide/…"` links, 18 of them pages** | **SERVER-RENDERED — a real harvest source** (§5.1d) |
| **Guide leaf page** | `…/MIIIGModulConsent/Beschreibung-Modul-Consent?version=2026.0.0` | HTTP 200, **20481 bytes**, **~1.4 k characters of visible text**, `<h1 id="page-title">Beschreibung Modul Consent</h1>` and the real German narrative ("Das MII KDS Modul Consent ist ein Basismodul des Kerndatensatzes (KDS) der Medizininformatik-Initiative (MII). Es setzt auf den publizierten Vorarbeiten der MII Taskforce Consent Umsetzung auf. …") | **SERVER-RENDERED — a real harvest source** (§5.1d) |

**URL shape:** `https://simplifier.net/guide/<guide-key>/<GuideRoot>[/<Page-Slug>]?version=<version>`.
Slugs are de-punctuated — "Anwendungsfälle / Informationsmodell" becomes `AnwendungsflleInformationsmodell`
— so **discover them from the root page's links; never construct them from a title**. A constructed
slug does not 404 loudly; it returns a plausible page.

So, for identity:

- The **project page** yields nothing mechanically. A human reads it at Gate A for the fields no
  machine source carries — `title` as the guide displays it, and `publisher` — and records what they
  read, with the URL as the evidence. `repo-identity.sh --rendered URL` measures that and reports
  `client-rendered-page:` when the page really is one; pointed at a `/guide/` URL it reports
  `server-rendered-guide:` instead and names `guide-harvest.sh`. It still extracts no identity from
  either: a value read out of a rendering that changes tomorrow cannot be re-derived, so an agent
  extracting one would be fabricating with a URL attached (guardrail 3).
- The **guide pages** yield the NARRATIVE, mechanically and verifiably (§5.1d), and they are found
  mechanically too (§5.1c). That is a different question from identity, and the answer to it is yes.

**The general rule this section now carries** (see also §4, guardrail 9): a negative capability
finding — "this cannot be read", "this is not available", "this is not possible" — is only valid for
**the exact artefact it was measured on**. Never generalise one from a sibling URL, a sibling
endpoint or a sibling mechanism, and re-measure before reusing one. This is the second such error in
this skill's history; the first was the claim that the IG Publisher cannot localize page titles,
which §5.5 now disproves with a working recipe.

**This is a statement about the PROJECT page, not about Simplifier.** The package page, the project's
guide listing, the version listing and the guide pages are all server-rendered and are read
mechanically by §5.1c — which is how the guide gets found in the first place when no URL was handed
over. What tier H does not yield is *identity*, and that is unchanged: a `title` or a `publisher`
read off a rendering is still a human's reading, recorded with the URL as evidence.

### 2.1.4 Recording the evidence: the identity ledger and contradictions

**Every recovered field is recorded with its tier and its source**, through the run-log helper:

```bash
bash "$ML" claim 2.1 <action> <field> <value> <tier> "<source>"   # one field, one source
bash "$ML" claims --markdown                                      # the report's identity table
```

`migration-log/identity-claims.tsv` accumulates one row per field per source, and the bundled
`package-identity.sh` and `repo-identity.sh` write theirs automatically. The report's identity
section is generated from it (§10.6), so it cannot claim a value nobody read.

**A second claim for the same field with a different value raises
`identity-contradiction:`** — naming both values with their tiers, and resolving nothing. Real ones
this run has already produced:

| Field | One source | The other | Why it is not settled in a script |
| --- | --- | --- | --- |
| `version` | tier P `2026.0.0` (the published manifest) | tier G `1.0.8` (goFSH's derived config — one profile's version) | preferring either silently re-versions a published module |
| parent pin | source package pins `de.einwilligungsmanagement@2.0.2` | registry `dist-tags.latest` is `2.0.3` | **source evidence wins** (§5.1b.2 step 1) — but the divergence is recorded, because it changes which parent everything is validated against |
| `license` | tier R `CC-BY-4.0` (the LICENSE file) | tier T `CC-BY-4.0` (the template literal) | equal here; had they differed, adopting the template's value would have relicensed the module |

**Contradictions are reported, never silently resolved.** The tier order says which value a human
should probably adopt; adopting it *here* would rename, relicense or re-version a published module
without anybody seeing it happen. `migration-log.sh claims` exits 1 while any field holds two
distinct values, so the same call serves as a CI gate and as the report's input.

### 2.2 When the source and the template disagree

The template prescribes a canonical and a package id derived from a module slug:

```text
canonical:  https://www.medizininformatik-initiative.de/fhir/modul-<slug>
packageId:  de.medizininformatikinitiative.kerndatensatz.<slug>
```

**Those are what a new module gets. A module that is already published keeps its own values.**
Guardrail 1 wins: changing a published canonical breaks every consumer that resolves it, and it is
the one mistake in a migration that cannot be quietly fixed later.

So: report the divergence explicitly, in the migration report and at Gate A, and let a human
decide. Never normalize silently, and never treat the template's placeholder pattern as an
instruction to rewrite existing identity.

**The same rule covers every identity value the template pre-fills as a literal rather than a
`{{...}}` placeholder — `license` above all.** The template ships `license: CC-BY-4.0` as a
literal, so the placeholder gate in §2.3 never touches it, and MII modules commonly declare
`CC0-1.0`. A migration that leaves the template's licence in place has silently relicensed
published content. Read the source's `license`, carry it over, and treat any divergence exactly
like the canonical: report it, raise it at Gate A, let a human decide.

**The LICENSE *file* is reconciled too, mechanically (check F3, §11.3).** A repository commonly
carries both a declared `license` scalar and a LICENSE file, and the two can disagree without any
build noticing. The verifier recognizes the file's text — `Attribution 4.0 International` →
`CC-BY-4.0`, `CC0 1.0 Universal` / `Creative Commons Zero` → `CC0-1.0`, `Apache License` →
`Apache-2.0`, `MIT License` → `MIT` — and compares the recognized id against the declared scalar:
a mismatch is **DIVERGIERT**; a LICENSE file whose text matches none of the known bodies is
**NICHT PRÜFBAR** (a human reads it); an absent file is an ok note, because the scalar then stands
alone. The §2.1 tier evidence (the SPDX id `repo-identity.sh` reads out of the same file) and this
reconciliation are two independent reads of one fact — they must agree.

**One deliberate exception (template ≥ v1.1): `publisher` is template CHROME, not module
identity.** The template sets `publisher: NUM-DIZ` (site root URL) because NUM-DIZ takes over IG
development and maintenance from the MII — the footer's `IG © <year> <publisher>` line names the
maintainer, and TF-KDS decided that surface. Do NOT carry a source publisher over it; the module's
content identity (artifact copyright labels, prose attribution) is untouched. Found on the
2026-08-15 Dokument re-migration: the earlier migration had carried the source's
`Medizininformatik-Initiative` per this section — under template ≥ v1.1 that carry is reverted
(§9a). Update the stale publisher unit in the IG-level `.po` by hand: the title-catalogue
generator is non-destructive and preserves the old unit verbatim.

### 2.3 Placeholders

The template does not build until every `{{...}}` placeholder is replaced, and an unreplaced
placeholder **ships a bogus artefact** rather than failing loudly — for example an invalid
terminology code, which no build error will catch.

The template's `sushi-config.yaml` opens with a header block enumerating its placeholders and
marking which are active on lines the build reads today. Read that block in the checked-out
template; do not work from a list in this file, because the set changes with the template.

Placeholders occur across `sushi-config.yaml`, `ig.ini`, the publication request, the QC rules, the
publication workflow, the narrative pages, the FSH sources including the rulesets library, the
resources directory, and the tests. Filenames are never placeholders — replace contents only.

## 3. Required capabilities

Abstract, so any tool-capable agent can be mapped onto them:

- **Web fetch and extraction** — read and structure the rendered source IG.
- **Repository read** — clone or read the source repository, read-only.
- **File write** — into a working branch of the target repository.
- **Shell execution** — SUSHI, the IG Publisher, and goFSH (**required** for source shape B,
  §5.1b; optional for shape A). A **version-pinned** `npx` invocation satisfies this and is the
  sanctioned form — `npx --yes fsh-sushi@3.20.0`, `npx --yes gofsh@2.6.1` (§5.1b.2). An unpinned
  `npx`, or a bare `sushi`/`gofsh` assumed to be on `PATH`, does not: neither tool is normally
  installed, so a bare invocation is unrunnable on the machine this specification describes.
- **HTTP GET against the FHIR package registry** — to resolve a canonical to `<package>@<version>`
  (§5.1b.2), to resolve floating pins (§2.1), and to **fetch and unpack a published package**
  (`curl` + `tar`) when the repository holds no identity of its own (§2.1.1).
- **Append-only text output** — write and append `migration-log/run.log` in the format of §10, and
  capture the bundled scripts' stdout and stderr into it.
- **Resource-format detection** — parse XML and JSON well enough to decide whether a file is a FHIR
  resource, which is how source shape B is recognized (§5.1b.1).
- **Terminology validation** — optional, against a FHIR terminology server.
- **Version control** — branch and pull request. **No direct push to the default branch.**

`SKILL.md` declares a conservative `allowed-tools` value. That field is experimental and support
varies between agents, so **this list is the normative statement** of what the skill needs; treat
`allowed-tools` as a convenience rather than the contract.

## 4. Guardrails

1. **Canonical URLs and IDs** of existing conformance resources are **not** changed.
2. **Language.** English is the target's default (`i18n-default-lang: en`); German is the
   translation. FHIR artefact identifiers stay English regardless. Verify the parameter in the
   checked-out template on every run. For a German-only source this **inverts the direction**:
   the German text becomes the translation, and the English default pages are produced as
   machine translations of it, each marked `TODO:REVIEW` and reviewed at Gate C — the one
   sanctioned exception to guardrail 4, because every translated page traces to the source page
   it renders.
3. **FHIR version:** R4 (4.0.1).
4. **No fabrication.** Every migrated artefact and narrative section traces to a source URL or
   repository path. Uncertainty is marked `TODO:REVIEW`, never guessed. This extends to
   **dependencies**: a parent profile that cannot be resolved is escalated, never stubbed,
   substituted or snapshot-generated from a guess (§5.1b.4).
5. **Mandatory sections** required by the Manteldokument must be present. See §9 — the mapping onto
   the template's page set is an open question, so this is currently a Gate B check by hand.
6. **Human in the loop.** The gates in §6 are mandatory. The agent does not publish.
7. **Traceability.** Every step emits run-log lines *as it runs*, to `migration-log/run.log` in the
   normative format of **§10**; every assumption and open point reaches
   `migration-log/migration-report.md`, whose protocol section is generated **from** that log
   (§10.6) rather than written from recollection. A step that produced no log line did not happen
   as far as the report is concerned.
8. **Template examples are deleted before migrating** — not merged with the module's real examples.
9. **The default branch is not modified.** Work on a branch; deliver a pull request.
10. **A negative capability finding is only valid for the artefact it was measured on.** "This
    cannot be read", "there is no API for this", "the publisher does not support this" — such a
    claim is recorded **with the exact URL, endpoint or command it was measured against, the date,
    and the numbers**, and it is **never generalised to a sibling** URL, endpoint or mechanism. Before
    acting on a recorded one, re-measure it; before writing one down, ask what *adjacent* thing was
    actually tested. A "not possible" is the most expensive kind of error in this skill, because
    nothing downstream re-checks it: it silently converts a missing capability into a missing
    deliverable. Twice now it has done exactly that — page-title localization, which §5.5 disproves
    with a working recipe, and the Simplifier guide, which §2.1.3, §5.1c and §5.1d disprove with a
    working discovery chain and harvest after the false claim shipped a migration with the template's
    starter pages.

### 4.1 The conditional `de-DE` warning

If the source FSH sets `^language = #de-DE` on resources, the IG Publisher emits a per-resource
language-mismatch warning (resource `de-DE` versus XHTML `de`). It is cosmetic — under BCP 47,
`de-DE` is a subtag of `de` — and an artefact of the i18n feature.

Suppress it by adding an entry with a justifying comment to the module's
`input/ignoreWarnings.txt`, leaving the FSH untouched (guardrail 1). Two details that make the
difference between working and not:

- That file uses **glob matching with `%` wildcards, not regex** (`%text%` = contains,
  case-insensitive).
- The publisher emits the message in German or English depending on JVM locale, so match the
  locale-stable token: `%(de-DE)%`.

## 5. Workflow

### 5.1 Inventory the source

Extract from `SOURCE_RENDERED_IG_URL` and `SOURCE_REPO_URL` the artefact list (profiles,
extensions, value sets, code systems, capability statements, examples) and the narrative structure.

**A rendered IG nobody handed over is still discoverable — run §5.1c first.** From an organization
key and a module name it recovers the package, the project, the guide keys, the published versions
and the page tree, without a credential. The **project page** is client-rendered and yields nothing;
the **guide pages** are server-rendered and yield everything, and treating the first measurement as a
statement about the platform is what once removed both procedures from the specification (§5.1c.2).

**The guide it finds IS mechanically extractable — harvest it (§5.1d).** Simplifier's `/guide/` URL
space is server-rendered: the guide root delivers the whole page tree and each page delivers its
narrative, both without a browser. Only the **project** page (`simplifier.net/<Project>/`) is a
client-rendered shell, and pointing a harvest at it is a setup error the script names as such.
Discovery (§5.1c) and harvest (§5.1d) are two steps of one workflow: pin a published guide version,
then harvest exactly that pin.

**Where a repository does carry the narrative** — a Simplifier project checked into git, with
`implementation-guides/**/toc.yaml` and `*.page.md` — that is the better source: it is the author's
markdown rather than a rendering of it. Take the structure from there, and use the harvest as the
cross-check. Where the repository carries none (source shape B), the harvest **is** the source, and
the fallback below applies only when both are unavailable.

**IG-Publisher-native narrative ranks equally with the Simplifier tree.** A source that authors its
prose in `input/pagecontent/`, `input/intro-notes/` and `input/includes/` (KDS Basis has NO
Simplifier guide at all; its narrative lives nowhere else) is not a degraded case: those files are
the author's markdown exactly as much as `*.page.md` is. And when a repository carries **both** an
`implementation-guides/` tree **and** populated `pagecontent`/`intro-notes` (Onkologie, ICU), do
not pick by rank: compare freshness (`git log -1 -- <dir>` per tree, page-level where the trees
disagree), take the newer as authoritative, and **record which copy won and why as a `decision`
line** — silently preferring one is the same defect class C1 outlawed for stale `fsh-generated/`.
Gate-0's `preflight.narrative_sources` measures exactly this (dual_source + last-commit dates), so
the decision is on the table before any page is migrated.

**If neither can be read** — every hop of §5.1c WARNs rather than guessing, so "nothing" is a
recorded URL and status, not an impression — mark the narrative structure and the rendered-IG
cross-check `TODO:REVIEW` in the inventory and have Gate B supply them by hand, recording WHICH of
the two sources was tried and what it returned. "No narrative found" is a measurement, not a default.

→ Output: `migration-log/source-inventory.json`.
→ **Acceptance:** the inventory is complete and every entry carries its source path.

### 5.1a Multi-guide Simplifier projects

Real modules ship **several** guide trees under `implementation-guides/` — versions × languages
plus shared assets (kerndatensatzmodul-person: `1.x-DE`, `1.x-EN`, `2024.x-DE`, `2024.x-EN`,
`2025.x-DE`, `Common`). One migration, four dispositions:

1. **Authoritative tree** — the highest-version guide in the module's narrative (source) language.
   Confirm against the rendered IG when reachable; record the choice and the trees' versions in
   the inventory (Gate B reviews it). Steps 5.4/5.5 operate on this tree only.
2. **Parallel-language trees** are **harvest seeds** for the target default language — hand over
   to the translation skill's harvest mode instead of machine-translating from scratch. **Stale-
   version caveat:** when the parallel tree's version lags the authoritative one (person: EN =
   2024.x vs DE = 2025.x), every harvested page gets a per-page `TODO:REVIEW` naming both
   versions; currency is checked at Gate C.
3. **Historical version trees** and shared-asset trees (`Common`): retained unchanged, Gate-D
   retirement set. Assets the authoritative tree references are transferred in step 5.4.
4. **Unrecognized top-level directories** anywhere in the repository (e.g. `validator/`): listed
   in the report with a retain/retire proposal — never silently kept or dropped.

→ **Acceptance:** the inventory records every guide tree with name, language, version, page count
and disposition.

### 5.1b Source shape B — deriving the FSH from raw FHIR resources (Path B)

Applies when the source repository carries **no IG scaffolding** (no `sushi-config.yaml`, no
`ig.ini`, no `input/`) but does carry conformance resources as `.xml` and/or `.json`. That is the
normal state of a module authored in **Forge** and published on **Simplifier**, and it is in scope.

**Nested-root check FIRST — root-level absence is not repository-wide absence.** Before declaring
shape B, search for `sushi-config.yaml` or `ig.ini` up to **three directory levels** below the
repository root (skipping `.git`, `node_modules`, `output`, `temp`, `input-cache`). A hit means the
repository IS a SUSHI project whose root simply is not the repository root (measured:
kerndatensatzmodul-strukturdaten nests the entire project — config, `input/`, build scripts — under
`Resources/`): **re-root the migration to that directory**, record it as a `decision` line
(`shape=A (nested at <path>)`), and skip this section. Running goFSH against such a repository
would round-trip machine-derived FSH while the author's actual FSH is discarded — and the N_IN
reconciliation stays green because the counter shares the same root-level blindness. The sibling
analysis skill re-roots the same way and reports the nested root on page one, so Gate 0 already
names the path a migration must choose.
Path B runs **between §5.1a and §5.2**: §5.2 merges the template skeleton with FSH that must already
exist, and §5.3 has nothing to transfer otherwise. Source shape A skips this section entirely.

Path B is **not** scaffolding a project from nothing, which §5.2 and SKILL.md Precondition 2 forbid.
Every line of FSH it produces is derived from a conformance resource the source already ships, and
therefore traces to a source path under guardrail 4.

**Measurement basis for this section:** goFSH **2.6.1** and SUSHI **3.20.0** (node 22), run end to
end against `medizininformatik-initiative/kerndatensatzmodul-consent` — 32 files, 20 conformance
resources (19 XML + 1 JSON) spread over **five** hand-named directories: `ressourcen-profile/`,
`terminologie/codesystems/`, `terminologie/valuesets/`, `searchparameters/`, `examples/` (plus
`figures/`, `README.md`, `LICENSE`). Read-only: nothing is ever written to the
`medizininformatik-initiative` organisation — the resources were fetched with
`gh api repos/<org>/<repo>/tarball` into a scratch directory.

**Toolchain invocation.** Neither tool is normally installed: on the reference machine
`which gofsh` finds nothing, and `npx` is the only route. A **version-pinned `npx` invocation is
the sanctioned form** and satisfies SKILL.md Precondition 5 — `npx --yes gofsh@2.6.1`,
`npx --yes fsh-sushi@3.20.0`. What that precondition protects is an exact, recorded version, and a
pinned `npx` delivers exactly that; an unpinned `npx gofsh` does not and is forbidden. Two traps:
the npm package for SUSHI is **`fsh-sushi`**, not `sushi`, and `allowed-tools` must grant
`Bash(npx:*)` — a grant of `Bash(gofsh:*)` alone does not match an `npx` command line, so an agent
under a strict permission prompt is blocked before it starts.

#### 5.1b.1 Classify the source by content

A file is a FHIR resource if it parses and carries a `resourceType` — directly in JSON, as the root
element name under the `http://hl7.org/fhir` namespace in XML. **Classify by that, never by folder
name:** the folders are hand-chosen and frequently German, and no glob over conventional IG
directory names finds them.

Consequence for §5.1: **the rendered guide's narrative lives on the Simplifier platform, not in
git.** There is no `implementation-guides/**` tree, so the page structure comes from the rendered IG,
and `fql-scan.sh` correctly exits 2 with an empty target set when run on the unmigrated repository.
**That platform narrative is retrievable — §5.1c finds the guide and §5.1d harvests it** (the
project download when credentials exist, otherwise the verified guide harvest). "Not in git" was once read as "not obtainable", and a shape-B
migration shipped the template's starter pages because of it.

**That is not the same as "the repository carries no narrative", and the earlier wording of this
section overclaimed it.** Measured on the reference module: a **43-line German `README.md`** (module
description, contact, contribution and licence notes) and a **126-line markdown mirror of a
CodeSystem**, `terminologie/codesystems/CodeSystem-MiiConsentPolicy.md`, next to the XML it mirrors.
So the classification pass has a third bucket beside "FHIR resource" and "binary asset":
**narrative-bearing text files**. Inventory every one of them with its line count and give it a
recorded disposition — migrated into a page, retained as repository documentation (a `README.md`
usually stays a `README.md`), or superseded by a generated artefact page (the CodeSystem mirror is
rendered by the publisher from the resource itself). A disposition of "none" is a finding, not a
default.

→ **Acceptance:** every file in the repository is classified as FHIR resource, narrative-bearing
text, or binary asset; the resource count is recorded in `migration-log/source-inventory.json`;
every narrative-bearing file has a disposition; and the source shape (A or B) is recorded in the
migration report.

#### 5.1b.1a Recover the identity from the published package — before goFSH

Shape B has no identity in the repository (§2.1, fourth tier), and the conversion below needs one of
its values: the **dependency pins**, which become goFSH's `-d` set. So this runs first, not at
Gate A:

```bash
ML="$SKILL_DIR/scripts/migration-log.sh"
bash "$ML" begin "step 2 — identity from the published package"
bash "$SKILL_DIR/scripts/package-identity.sh" \
  --package <packageId> --version <the release the source commit corresponds to>
```

Call it directly — it emits its own run-log lines through the helper as a library, so
`run --emits-runlog` would duplicate every one of them (same as `gofsh-results.sh`).

- The `packageId` is not always known in advance. Resolve it the same way a foreign parent is
  resolved (§5.1b.2, *Resolving a canonical to `<package>@<version>`*): query the registry for a
  canonical the module's own resources carry. No hit, or more than one, is a Gate-A escalation.
- **Confirm the version against the resources.** The manifest of the *wrong* release yields wrong
  pins. Measured on Consent: release `2026.0.0` and prerelease `2026.0.1-rc-3` differ in their
  parent pin (`2.0.2` vs `2.0.3`) *and* in the `Consent.category` slicing (`:loinc` vs
  `:consentCategory`), so one profile read from the source tells you which you are holding.
- Exit 1 means the package was read but the canonical was **not** unanimous — a Gate-A item, and a
  usable CI gate. Exit 2 means nothing was read; an unfetchable package is not an empty identity.

→ **Acceptance:** the recovered fields, the derived canonical with its `agree=N of N`, and the
fields tier P cannot supply are all in `run.log`; the `-d` set below is taken from the recovered
pins; and **no existing metadata was changed by any of it** (§2.1.1).

#### 5.1b.2 Convert with goFSH

Four commands, and none of them is optional. The conversion is the single most important stage of
Path B, and until this block existed it left **no line in `run.log` at all** — the raw tool output
went to `migration-log/gofsh.log` and nothing else was recorded, so the one stage that can silently
drop 19 of 20 resources was the one stage invisible to a reviewer.

```bash
mkdir -p migration-log
ML="$SKILL_DIR/scripts/migration-log.sh"   # the run-log helper, §10.5
SRC=<source-repo-root>; OUT=<scratch-dir>; GLOG=migration-log/gofsh.log

# (0) Open a run boundary. run.log is append-only across invocations, and this
#     block is re-run whenever the `-d` set changes; without a marker the second
#     run's lines simply continue the first's.
bash "$ML" begin "step 2b — Path B on $SRC"

# (a) Count the INPUTS first, by content and never by folder name (§5.1b.1).
#     Nothing downstream computes this number, and it is the one goFSH's own
#     counts get reconciled against.
N_IN=$(find "$SRC" -type f \( -name '*.json' -o -name '*.xml' \) \
       -exec grep -lE '"resourceType"[[:space:]]*:|xmlns="http://hl7\.org/fhir"' {} + \
       | wc -l | tr -d ' ')
bash "$ML" info 5.1b.2 gofsh-input "counted the conversion inputs by content  inputs=$N_IN src=$SRC"

# (b) Convert. `run` writes the raw tool output to $GLOG -- TRUNCATING it first,
#     so the file holds this invocation only -- logs the command it actually
#     executed, and returns goFSH's real exit status.
bash "$ML" run 5.1b.2 gofsh-convert --raw-log "$GLOG" -- \
  npx --yes gofsh@2.6.1 "$SRC" -o "$OUT" -s file-per-definition -t json-and-xml \
  -d <parent-ig-package>@<version> -d hl7.fhir.r4.core@4.0.1
GOFSH_EXIT=$?

# (c)+(d) Read goFSH's OWN counts back out of that log, labelled, and reconcile
#     them against (a): equal -> one INFO; fewer -> an INFO *and* the mandatory
#     `silent-partial-success:` WARN naming both numbers (§10.4). This is the
#     comparison the `-t` trap below turns on; nothing else performs it.
bash "$SKILL_DIR/scripts/gofsh-results.sh" --log "$GLOG" --inputs "$N_IN" --exit $GOFSH_EXIT
```

Work in a scratch directory outside the module repository. Pin the goFSH version in the command line
itself — that is the record, and `run` copies it verbatim into the log's `cmd=` token.

##### Why (c)+(d) is a bundled script and not three lines of `sed`/`awk`

It **was** three lines of `sed`/`awk`, retyped by each caller, and two defects hid in them. Both
produced a wrong number inside a line that read as entirely normal — the worst failure mode a run log
has, because the reader has nothing to be suspicious of.

1. **The read-back was not re-run-safe.** The parse ran from the FIRST `GoFSH RESULTS` in the raw log
   to end of file, and the raw log was appended to. Re-running the block in the same working
   directory — the ordinary case, an operator adjusting `-d` and repeating the step — left **two**
   tables in one file, and the parse **summed** them: 20 converted became 40, and the reconciliation
   dutifully reported `count-above-expected` against 20 inputs.

   Two fixes were possible, and **both are applied, with one of them primary**: `run` now
   **truncates each raw log per invocation** (§10.5), because a raw log named after one ACTION should
   be the output of the run that produced the run.log lines next to it — that also makes
   `raw_log_lines=` the current run's count rather than the sum of every attempt, and the immediately
   preceding attempt is rolled over to `<ACTION>.prev.log` rather than lost. `gofsh-results.sh`
   **additionally** anchors to the LAST table and WARNs `stale-raw-log:` when it finds more than one,
   so a log assembled some other way (a hand-run `>>`, a restored file) cannot silently produce a
   plausible wrong number either.

2. **The converted count was wrong arithmetic.** It summed the table's cells and dropped only the
   last (Aliases), so **Invariants and Mappings were counted as converted resources** — which the
   inline comment did not say and the code did not show. On the reference module *with* `-d` this was
   invisible, because `-d` drives Mappings to 0; **without** `-d` goFSH reports 12 Mappings, and the
   count came out as 32 against 20 inputs. `gofsh-results.sh` reads each cell **with its label** from
   the table's own header rows and classifies by name:

   | Counted as converted | Never counted |
   | --- | --- |
   | Profiles, Extensions, Logicals, Resources, ValueSets, CodeSystems, Instances | Invariants, Mappings, Aliases |

   Invariants and Mappings are *parts of* a profile — one StructureDefinition contributes many — and
   Aliases are URL shorthands goFSH mints for readability. Counting either compares a per-resource
   input count against a per-fragment output count. A label the script does not model is a **refusal**
   (exit 2), never a guess: a future goFSH layout is a reason to re-measure, not to keep summing.

The script also quotes only the goFSH warnings that bear on **completeness** (`ignor`,
`without corresponding`, `json-only`, `cannot find a definition`, …). Taking the first warning
regardless of relevance put "Encountered 6 definition(s) that were missing an id" next to a ratio it
says nothing about, while the warning that *explains* the ratio — "13 XML definition(s) found without
corresponding JSON definitions … will be ignored" — was never shown.

```text
gofsh-results.sh --log FILE --inputs N [--exit N] [--step S] [--action A]
```

→ **Acceptance for the read-back:** running the block twice in the same directory yields the *same*
counts the second time; and a run without `-d` (Mappings non-zero) still reconciles to the input
count. Measured, both: 20 of 20 on the first and the repeated run; and without `-d`,
`profiles=3 … mappings=12 aliases=14  converted=20` reconciling to `converted 20 of 20 inputs`, where
the old arithmetic produced 32.

**One operational trap when you re-run: clear `$OUT` first.** goFSH refuses a non-empty output
directory and asks for confirmation on the TTY; with no TTY — an agent, CI, a captured shell — it
does not fall back but **fails**: "error Could not use output directory: The current environment
doesn't support interactive reading from TTY", exit 1. That is a loud, correct failure and the
block's `run` reports it as one, after which `gofsh-results.sh` refuses with exit 2 rather than
reporting the *previous* run's table (`setup: no "GoFSH RESULTS" table`). Under the appending raw log
this was precisely the dangerous case: the conversion never ran, and the read-back would still have
found run 1's table in the file and reported a confident `converted 20 of 20`.

`$GLOG` is not decoration: §5.1b.3 reads `migration-log/gofsh.log` as the authoritative name mapping,
so a run that does not write it cannot be post-processed. Note what changed against the older
convention: the raw log is still written, but through `run`, which **preserves goFSH's exit status**
instead of discarding it into a `tee`. The exit status still is not the acceptance signal here — the
counts are, and (d) is where they are compared — but a step whose status is thrown away can no
longer report a failure at all, and that trap cost this specification three of its acceptance
criteria (§10.5).

Measured, both variants of exactly this block on the reference module:

| Variant | Log lines produced |
| --- | --- |
| with `-t json-and-xml` | `converted 20 of 20 inputs  expected=20 actual=20 exit=0` — no WARN |
| without it | `converted 1 of 20 inputs  expected=20 actual=1 exit=0`, immediately followed by `WARN … silent-partial-success: converted 1 of 20 inputs at exit 0` |

##### Assembling the input: point goFSH at the repository root

The reference module keeps its 20 resources in **five** hand-named directories, and §5.1b.1 forbids
finding them by folder name. There is nevertheless no staging step, because **goFSH walks a
directory tree recursively** and ignores everything that is not a FHIR resource.

Measured, all three runs with the same flags and `-d` set:

| Input given to goFSH | Result |
| --- | --- |
| the repository root (5 nested resource dirs, `figures/`, `README.md`, `LICENSE`) | 3 profiles / 3 ValueSets / 3 CodeSystems / 11 instances / 8 aliases, exit 0, 2 warnings |
| a staged flat directory holding all 20 resources | identical counts — and the derived FSH tree is **byte-identical** (`diff -r` clean, `sushi-config.yaml` included) |
| the repository root plus a non-FHIR `package.json` and a non-FHIR `project.xml` | identical counts, FSH byte-identical to the root run; both files silently ignored |

So the procedure is: **give goFSH the repository root**, then reconcile its counts against the §5.1
inventory. Stage a flat directory only for a positive reason, and record it — the two that occur in
practice are a repository that vendors a *foreign* module's resources (a second module, a
`validator/` fixture set) which would otherwise be converted as if they were this module's, and a
selective re-run over a subset while investigating. Staging is a filter, never a workaround for
"goFSH did not find my files": if a resource is missing from the counts, the cause is `-t`
(see below), not the directory depth.

**`-t json-and-xml` is mandatory and its absence fails silently.** goFSH's default is `json-only`
(the values are `json-only`, `xml-only`, `json-and-xml`). Measured without the flag on the Consent
resources: **exit 0**, "0 Errors", **one** resource converted, and only a warning — "13 XML
definition(s) found without corresponding JSON definitions … will be ignored since GoFSH is running
in json-only mode". With the flag, the same input: **3 profiles, 3 value sets, 3 code systems,
11 instances** — 20 in total, matching the 20 inputs — exit 0. The exit code is therefore not
evidence; the artefact counts are.

Quote **goFSH's own 13** when quoting goFSH. The input holds **19** XML files; goFSH's pairing check
counts 13 of them as XML definitions lacking a JSON counterpart, and the difference is six files,
exactly the six `SearchParameter`s. Naming the wrong number in a report is how a reader loses trust
in the rest of it, so state which is which when both appear. Neither is the number the decision turns
on: that is `converted 1 of 20`, which block (d) above emits and WARNs on.

And that WARN is the *only* thing that catches it. Measured end to end on the no-flag run:
`postprocess-gofsh.py` exits 0 reporting "nothing to repair", and SUSHI exits 0 with 0 errors —
because the 19 missing resources cannot fail a check that never sees them. Every downstream signal
is green on a conversion that dropped 95 % of the module.

**Every foreign parent IG is declared with `-d <package>@<version>`.** Discover them from the
resources — the `baseDefinition` of each StructureDefinition and every other canonical pointing
outside the module — and resolve each canonical to its publishing package. goFSH names what it
cannot resolve: "Cannot reliably export top-level caret rules for `MII_PR_Consent_DocumentReference`
because GoFSH cannot find a definition for its parent: `http://fhir.de/ConsentManagement/
StructureDefinition/DocumentReference`. If its parent is from another IG, run GoFSH again declaring
that IG as a dependency." Measured: `-d de.einwilligungsmanagement@2.0.3 -d hl7.fhir.r4.core@4.0.1`
removed both such warnings. Re-run goFSH with the dependencies rather than patching a
dependency-less conversion — the derived output differs (measured: 12 mappings / 14 aliases without,
0 mappings / 8 aliases with), so the two runs are not the same FSH with better warnings. Record the
difference.

##### Resolving a canonical to `<package>@<version>`

`-d` takes a package id and a version, and a Forge-authored repository states **neither**: in the
reference module the string `de.einwilligungsmanagement` appears nowhere, and no version of it does
either. All you have is the canonical in a `baseDefinition`. Resolve it against the **FHIR package
registry**, which indexes packages by the canonicals they publish:

```bash
CANON='http://fhir.de/ConsentManagement/StructureDefinition/DocumentReference'
curl -s "https://packages.fhir.org/catalog?op=find&canonical=$CANON"
#   -> [{"Name":"de.einwilligungsmanagement","Description":"Einwilligungsmanagement Release 2.0.3…",
#        "FhirVersion":"R4"}]
curl -s https://packages.fhir.org/de.einwilligungsmanagement | python3 -m json.tool | head -40
#   -> "dist-tags": {"latest": "2.0.3"}, plus every published version
```

Measured on the reference module (2026-08-05): the **full resource canonical** resolves — the
registry matches on prefix, so trimming the `/StructureDefinition/<id>` tail first is optional, and
the trimmed IG canonical `http://fhir.de/ConsentManagement` returns the same single hit. Query the
registry once **per distinct canonical host+path prefix**, not once per resource.

Picking the version is a judgement, so record it and its evidence (§2.1's floating-pin rule applies
unchanged). **Work the list in order — step 1 is not optional, and `dist-tags.latest` is the
LAST resort, not the first:**

1. **Read the module's own published package first (§2.1.1).** Its manifest declares the pins the
   module was actually published against, and **that is source evidence** — it outranks the parent's
   `dist-tags.latest` under rule 2 below. Until this step existed, a shape-B run reached rule 2 with
   no source evidence *available*, and picked `latest` by default. Measured on Consent: the parent
   pin in `…consent@2026.0.0` is **`de.einwilligungsmanagement@2.0.2`**, while the parent's
   `dist-tags.latest` is **`2.0.3`** — so the reflex answer is the wrong one, by one patch release,
   on the reference module itself. Run:
   `bash "$SKILL_DIR/scripts/package-identity.sh" --package <module-packageId> --version <release>`.
2. Otherwise, if the source repository, its CI logs or a committed package cache name a concrete
   version, that evidence wins — it is what the module was actually authored against.
3. Otherwise take `dist-tags.latest` and **say that that is what you did**. For the reference
   parent that is `2.0.3`, and the registry's own description string ("Einwilligungsmanagement
   Release 2.0.3") corroborates only that `2.0.3` exists — never that this module used it.
4. A canonical that resolves to **no** package, or to more than one, is a Gate-A escalation — name
   it in the report and stop guessing. Never invent a package id from the canonical's shape.

A pin picked under rule 3 and later contradicted by rule 1 is **corrected in the run log and the
report**, with both values and the evidence, and re-run: the `-d` set changes what goFSH resolves.
Nothing in the module's own metadata is rewritten to match (§2.1.1, *Recovered is not applied*).

Re-run goFSH after every change to the `-d` set, and check the unresolved-parent warnings are gone;
that warning, and not the exit code, is the acceptance signal.

**goFSH writes a `sushi-config.yaml` — `sushi init` is not needed, and that file is a starting point,
never identity.** Measured output for Consent: `canonical`, `fhirVersion: 4.0.1`, `FSHOnly: true`,
`applyExtensionMetadataToRoot: false`, `status: active`, `version: 1.0.8`, plus the declared
dependencies. It carries **no** `id`, `name`, `title`, `publisher`, `packageId` or `license`, and its
`version` is one arbitrary profile's version — `1.0.8`, the `DocumentReference` profile's, against
the module's published `2026.0.0`. Identity is read per §2.1 from the authoritative sources —
for a Forge repository that means the **published package**, §2.1.1 — and goFSH's guess is used only
to run SUSHI in the scratch directory, never carried into the module. Its `dependencies` are a
guess too: they are whatever `-d` set the operator passed, so a wrong pin propagates into the file
that looks most like configuration.

→ **Acceptance:** the run's artefact counts reconcile against the §5.1 inventory; no unresolved-parent
warning remains; the goFSH version, the `-d` set and the count difference between the dependency-less
and dependency-declared runs are recorded in the report.

#### 5.1b.3 Mechanical post-processing

SUSHI is run **twice** here, before and after the repair, and both runs are measured into the log.
That before/after pair (41 → 5 on the reference module) is Path B's headline claim and the number a
reviewer most needs; until this block existed it was captured nowhere at all.

```bash
SUSHI="npx --yes fsh-sushi@3.20.0"          # pinned, per §5.1b's toolchain rule

# (a) the baseline, before any repair
bash "$ML" run 5.1b.3 sushi-before --raw-log migration-log/sushi-before.log -- \
  bash -c "cd '$OUT' && $SUSHI ."
S_BEFORE=$?
E_BEFORE=$(grep -oE '[0-9]+ Errors' migration-log/sushi-before.log | tail -1 | cut -d' ' -f1)
bash "$ML" info 5.1b.3 sushi-before \
  "baseline before post-processing  errors=$E_BEFORE exit=$S_BEFORE raw_log=migration-log/sushi-before.log"

# (b) the repair. --emits-runlog: the script already prints §10.2 lines, so its
#     own INFO/WARN/ERROR reach run.log instead of only its raw log.
bash "$ML" run 5.1b.3 postprocess-gofsh --emits-runlog -- \
  python3 "$SKILL_DIR/scripts/postprocess-gofsh.py" "$OUT/input/fsh" --gofsh-log "$GLOG"
PP=$?
bash "$ML" info 5.1b.3 postprocess-gofsh "acceptance: exit status  exit=$PP  (0 required)"

# (c) the same measurement again, and the residual errors named line by line.
#     --expected-nonzero: for shape B this run's non-zero exit is the DOCUMENTED
#     outcome (§5.1b.4), so it is logged as an escalation to be queued, not as a
#     step that failed. The status is still returned verbatim.
bash "$ML" run 5.1b.3 sushi-after --raw-log migration-log/sushi-after.log \
  --expected-nonzero 'shape B: residual unresolvable-parent errors are a Gate-A escalation (§5.1b.4)' -- \
  bash -c "cd '$OUT' && $SUSHI ."
S_AFTER=$?
E_AFTER=$(grep -oE '[0-9]+ Errors' migration-log/sushi-after.log | tail -1 | cut -d' ' -f1)
OLDIFS=$IFS; IFS=$'\n'; RESID=($(grep -E '^error ' migration-log/sushi-after.log | cut -c1-140)); IFS=$OLDIFS
bash "$ML" info 5.1b.3 sushi-after \
  "after post-processing  errors=$E_AFTER exit=$S_AFTER resolved=$(( E_BEFORE - E_AFTER )) raw_log=migration-log/sushi-after.log" \
  "every residual error below is a Gate-A escalation (§5.1b.4), not a defect to work around:" \
  "${RESID[@]}"
```

**SUSHI's exit status is its error count**, so `run` reports `exit=41` before the repair and `exit=5`
after. The first stays an ERROR, and correctly so: its acceptance criterion is not met, and the fix —
"either fix and re-run" — is literally the next line of the block. The second is different. It is the
snapshot blocker, which §5.1b.4 turns into report ① entries rather than a failure to fix, yet `run`'s
generic ERROR text told the reader that this documented, anticipated result "did NOT meet its
acceptance criterion … either fix and re-run or take it to the report's decision queue". A log that describes its
expected outcome as a failure trains its reader to discount every ERROR in it. `--expected-nonzero`
therefore logs that one step as a WARN whose detail begins `anticipated-nonzero-exit:` and whose
continuations state the qualifier — escalated, never ignored, and still a queue entry per §10.6. The
generic ERROR is untouched for every other step, and an `--expected-nonzero` step that exits **0**
says so on its `done` line, so a stale anticipation is visible rather than silently confirmed. What
would *not* be acceptable is either line with nothing in the log naming which five errors they were —
which is why the residual lines are passed as continuations.

**SUSHI's exit status is also eight bits**, and this is the one step where that matters: a status
that IS an error count is truncated modulo 256, so exactly 256 errors exit **0**. Measured: a probe
exiting 256 logged `exit=0` and returned 0, indistinguishable from a clean run. `run` therefore
cross-checks the status against the `N Errors` line in the raw log and WARNs
`exit-status-truncated:` (or `exit-status-disagrees:`) when the two disagree — which is why
`E_BEFORE`/`E_AFTER` above are read out of the log and not taken from `$?`.

`migration-log/gofsh.log` is the file §5.1b.2 wrote; the two stages are a pair and run in that order,
from the same working directory. **Give the script the whole FSH tree**
(`input/fsh`, or the goFSH output root), never a single sub-directory: a code reference is only
repaired once the normalized name has been confirmed against the entity declarations, and those live
in sibling directories — a narrowed `FSH_DIR` turns a repairable reference into a refusal (exit 1)
or, when the tree carries no references at all, into a `silent-partial-success` WARN.

Two defects of the XML sources survive into the FSH. Both are mechanical — neither is a modelling
decision — and both are fatal to SUSHI:

1. **`fhir_comments` rules.** XML comments become assignment rules on a `.fhir_comments` element,
   which is an XML-serialization construct and not a FHIR element: "The element or path you
   referenced does not exist: `status.fhir_comments`". Measured: 53 occurrences in 4 instance files,
   **30 SUSHI errors**. The script preserves each one's text as an FSH `//` comment by default —
   the text is authored source content (in Consent, German annotations explaining each provision) and
   a migration does not silently discard it; `--drop-comments` removes them instead.
2. **Bare system names containing whitespace in code references.** goFSH normalizes a CodeSystem
   name with spaces for the entity declaration and reports it — "has name with whitespace (MII CS
   Consent Policy). Converting whitespace to underscores (MII_CS_Consent_Policy)" — but still emits
   the un-normalized name in the references to it, producing unparseable FSH
   (`… .code = MII CS Consent Policy#2.16…5.3.6 "MDAT erheben"`). SUSHI reports "extraneous input
   'CS'" and "Cannot find definition for Instance: MII". Measured: 39 references in 3 files,
   **6 SUSHI errors**. The repair uses the name goFSH itself reports, applied only after that name
   has been confirmed to exist as a declared entity in the same FSH tree.

This one is the more dangerous defect, and the reason it cannot be left for later: **an FSH parse
error stops SUSHI reading the rest of that file, and SUSHI still exports the instance, silently
truncated.** Measured on the three Consent examples: **1** nested provision each before the repair,
**27 / 6 / 3** after. "It exported" is not "it converted".

The CodeSystem's own `* ^name = "MII CS Consent Policy"` caret rule is **not** touched — it is a real
element value of a published resource (guardrail 1), and SUSHI only warns about it. The script
classifies every occurrence before writing, writes nothing at all when it meets a shape it does not
model (exit 1, occurrences listed), and is idempotent.

→ **Acceptance:** the script exits 0 — **as returned by `run`, not as reported by a `tee` pipeline**;
`npx --yes fsh-sushi@3.20.0 .` in the scratch directory reports no `fhir_comments` error and no FSH
parse error; the exported instances are compared against the source resources for truncation, not
merely counted; and both SUSHI runs, their error counts and the residual errors are in `run.log`.

#### 5.1b.4 Residual blockers — a Gate-A escalation

Path B does **not** by itself produce a clean build, and the specification does not claim it does.
Measured on Consent: **41 SUSHI errors before post-processing, 5 after** — the 36 mechanical ones
resolved, and the remainder the genuine architectural blocker:
`de.einwilligungsmanagement@2.0.3` ships its profiles **without snapshots**, so SUSHI cannot import
them at all ("Structure Definition `http://fhir.de/ConsentManagement/StructureDefinition/
{DocumentReference,DomainReference,Provenance}` is missing a snapshot. Snapshot is required for
import."). That blocks the three profiles and, consequentially, the instances declaring `InstanceOf`
them.

Two options, both **human decisions taken at Gate A**: obtain a snapshot-bearing build of the parent
package — **which §5.1b.5 makes an executable procedure, not a wish** — or record the affected
profiles as blocked and migrate the rest. **Inventing a parent is forbidden** — no local stub, no
substituted base resource, no snapshot generated from a guess (guardrails 1 and 4).

**goFSH-invented ids** are a review-queue item, not an error. Measured: "Encountered 6 definition(s)
that were missing an id", each named, and where no name could be derived goFSH wrote GUID-named files
(`instances/34150a23-b1c8-404f-874f-e042a30435d2.fsh`). Those minted ids become the module's ids, so
they go into the report's ② review queue and are confirmed by a human at Gate A.

→ **Acceptance:** every remaining SUSHI error is named in the migration report as an
unresolvable-parent escalation with its decision option, every invented id and GUID-named file is in
the ② review queue, and no parent has been fabricated.

##### The shape-B qualifier (normative — it overrides every "clean build" criterion below)

Several later acceptance criteria are written around a clean build: "SUSHI runs without error"
(§5.2), "`qa.txt` reports `Errors: 0`" (§5.6), "builds cleanly" (§7), and the same three in SKILL.md.
**Read every one of them through this qualifier when the source shape is B.** Where a foreign parent
package ships no snapshots, a clean build is not reachable by migration alone, and the flat criterion
would mark a correct migration as failed — or, worse, invite someone to fabricate a parent to satisfy
it.

For shape B, "clean" means all four of:

1. **no mechanical error remains** — nothing of the two families §5.1b.3 repairs, and
   `postprocess-gofsh.py` exits 0;
2. **every residual error is named** in the report's ① decision queue, with its resource, its cause
   and its decision options;
3. **a Gate-A decision is recorded** for each (obtain a snapshot-bearing parent build, or migrate
   the rest and record the affected profiles as blocked);
4. **no parent was fabricated** — no stub, no substituted base, no guessed snapshot.

A residual error count that is merely tolerated is not a pass, and neither is a zero reached by
inventing a parent. For source shape A the flat criteria stand unqualified.

#### 5.1b.5 A parent package that ships no snapshots — detect, then generate with a real generator

**Detect it.** The signal is SUSHI's own error, one per parent:

```text
error Structure Definition http://fhir.de/ConsentManagement/StructureDefinition/DocumentReference
      is missing a snapshot. Snapshot is required for import.
```

Confirm it against the package rather than the error text, and do not chase versions blindly:

```bash
bash "$SKILL_DIR/scripts/parent-snapshots.sh" detect \
  --package de.einwilligungsmanagement --version 2.0.2
# -> surveyed  structure_definitions=21 with_snapshot=0 without_snapshot=21
# -> WARN parent-without-snapshots: 21 of 21 …                       exit 1
```

Measured (2026-08-06): **both** `2.0.2` and `2.0.3` ship 21 StructureDefinitions and **0** snapshots
— the package carries differentials only, so **picking a different version does not solve it**. Take
the version from the module's own published package (`2.0.2`), not from `dist-tags.latest` (`2.0.3`):
§2.1.1, source evidence wins. `detect` also reports whether the derivation chain is flat; measured
here, all 21 derive **directly** from R4 core, which does ship snapshots — one differential over a
snapshot-bearing base, in any order.

**THE ABSOLUTE RULE: a snapshot is never hand-rolled or approximated.** Merging a differential onto a
base is full FHIR profile-merging semantics — slicing, cardinality narrowing, type constraints,
element ordering. An approximation produces profiles that *look* generated and are subtly wrong: the
same failure shape as a tool reporting success while emitting garbage, and it would put a fabricated
parent underneath every profile in the module (guardrails 1 and 3). Use a real generator or escalate.

**Generate.** The official HL7 generator is `validator_cli.jar`'s `snapshot` **subcommand** (backed
by `ProfileUtilities`, the same code the IG Publisher uses). Pin it — `latest` moves:

```bash
curl -sL -o validator_cli.jar \
  https://github.com/hapifhir/org.hl7.fhir.core/releases/download/6.10.0/validator_cli.jar   # ~187 MB

bash "$SKILL_DIR/scripts/parent-snapshots.sh" build \
  --package de.einwilligungsmanagement --version 2.0.2 \
  --validator ./validator_cli.jar --install \
  --require http://fhir.de/ConsentManagement/StructureDefinition/DocumentReference \
  --require http://fhir.de/ConsentManagement/StructureDefinition/DomainReference \
  --require http://fhir.de/ConsentManagement/StructureDefinition/Provenance
```

The primitive, if you want it standalone:

```bash
java -jar validator_cli.jar snapshot <sd.json> -version 4.0.1 -tx n/a -ig <package-dir> -output <out.json>
```

**Four measured facts the script encodes, each silent if it is not:**

1. **`snapshot` is a subcommand, not a flag.** `-snapshot` does nothing; `snapshot -help` fails with
   "Unknown option" (the help lives in the top-level `-help`).
2. **Filenames matter.** The validator lowercases the source path and mis-detects the format of any
   name containing `template`: `extension-ConsentManagement-XacmlTemplate.json` fails with
   "Unsupported format for …xacmltemplate.json" while **the identical bytes under another name
   succeed**. Every SD is staged as `sd000.json`, `sd001.json`, … and merged back by `url`.
3. **A batch run aborts at the first failure and silently skips the rest** — which made a healthy
   `QuestionnaireResponse` profile look broken. Invoke once per file, and give `java` `</dev/null`
   in a loop or it eats the loop's stdin.
4. **`-tx n/a`** disables terminology resolution. Correct for structural merging; it also means no
   binding was expanded or checked, and the validator side-installs a few packages into the shared
   FHIR cache as it runs.

**Verify before believing — the check that catches a fake.** A "snapshot" whose element count equals
the **differential's** is the differential wearing the name. `build` refuses any generated file that
does not have **more elements than its own differential** and **at least as many as its base's
snapshot** (`snapshot-implausible:` / `snapshot-below-base:`, refused, never merged). Measured on the
three blocking parents — snapshot / base / differential:

| Profile | snapshot | R4 base | differential |
| --- | --- | --- | --- |
| `DocumentReference` | 61 | 45 | 8 |
| `Provenance` | 65 | 32 | 20 |
| `Consent` | 132 | 57 | 32 |

A differential-only fake would have read 8, 20, 32. This is a **plausibility floor, not a semantic
proof**: the assurance that slices and cardinalities merged correctly comes from using the official
generator, not from these counts.

**A refusal from the generator is evidence about the parent, not a gap to work around.** Measured:
three of the 21 (`TemplateFrame`, `TemplateModule`, `QuestionnaireComposed`) fail with
"…`Questionnaire.item.text.extension:renderingMarkdown.value[x]:valueMarkdown` launches straight into
slicing without the slicing being set up properly first" — the generator correctly refusing a
**malformed upstream differential**. None is a `Parent`/`InstanceOf` target in the Consent FSH, so
none blocks the migration; `--require` is what makes that judgement mechanical, and the exit code
follows the parents the migration is actually blocked on. Do not hand-finish a refused profile: a
module that later derives from one hits the same wall, and that is a Gate-A escalation for the
upstream package's maintainers.

**Install as a NEW cache entry; never over the upstream.** `--install` writes
`~/.fhir/packages/<id>#<version>-snapshots`, stamps the manifest `version` and a description saying
it is a local rebuild, and refuses any destination not ending in `-snapshots` or an existing one
without `--replace`. Upstream `#2.0.2` and `#2.0.3` stay byte-identical — re-verify that after
installing (measured after the reference run: still 0 of 21 snapshots each). The rebuilt files are
re-serialized, so do not diff them against upstream expecting byte equality; only `snapshot` was
added.

**Then re-pin and re-measure.** Point the FSH project at the rebuild —
`de.einwilligungsmanagement: 2.0.2-snapshots` — and run SUSHI again. **The evidence is the error
count before and after, not the script's exit status**; log both (§10). Measured on Consent:
**5 errors → 0**, the three `missing a snapshot` errors and the two consequential
`InstanceOf … not found` errors all gone, no new error, and the three previously blocked artefacts
(`MII_PR_Consent_DocumentReference`, `MII_PR_Consent_Provenance` and their instances) now export.
Expect *more* warnings, not fewer: rules that were silently dropped now resolve and get evaluated.

**Carrying it upstream is a Gate-A decision, and this is where a migration can quietly break CI.**
The rebuilt package exists **only in the local FHIR cache**. A `sushi-config.yaml` pinning
`2.0.2-snapshots` fails to resolve on a clean checkout, in CI, and on every other developer's
machine. Name the option chosen in the report and record it at Gate A:

| Option | What it costs |
| --- | --- |
| a **CI prebuild step** running `parent-snapshots.sh build --install` | the 187 MB generator download per run (cacheable); keeps the rebuild reproducible from source |
| **vendoring** the snapshot-bearing package into the repository | a locally built artefact in version control, which must be labelled as such and re-generated on every parent release |
| publishing it to an **internal registry** | governance: it is a derived artefact of someone else's package, not a release of it |
| **not repinning** — keep the upstream pin, leave the profiles blocked | the migration stays at §5.1b.4's escalation, with the blocked artefacts named |

**The real fix is upstream.** A package published without snapshots is a defect in the publication,
and the durable resolution is the parent's maintainers publishing snapshot-bearing releases. The
procedure above unblocks a migration; it does not make the local rebuild an authority.

### 5.1c Discovering the rendered guide — from a module name to pinned guide pages

**Discovery comes first, the harvest (§5.1d) second.** This section ends with a guide key and a
**pinned, published** version; that pin is what §5.1d harvests. Where a URL was handed over, start at
§5.1d and use this section to verify that the URL names a published version.

**The problem this solves.** §5.1 needs the rendered guide's page structure, and §2 lists
`SOURCE_RENDERED_IG_URL` as human-provided. That is fine when somebody hands over a URL, and useless
when nobody does: the module name is known, the guide key is not, and a guide key does not follow
from anything a human can spell. This section is the **normative procedure that recovers the whole
address from an organization key and a module name**, with no credential at any point.

**Measured 2026-08-06, anonymous, every hop verified against the reference module.** Do not extend
these statements beyond what they say; re-measure before widening any of them.

#### 5.1c.1 The chain — five hops

| Hop | Endpoint | Yields | Measured on the reference |
| --- | --- | --- | --- |
| **1** | `/organization/<org-key>/~projects` | the **authoritative package-id list**, via the `/packages/<packageId>/` hrefs | MII org key `koordinationsstellemii`: HTTP 200, ~142 KB, **23** package ids — base, bildgebung, biobank, consent, diagnose, dokument, fall, icu, kardiologie, laborbefund, medikation, meta, mikrobiologie, molgen, mtb, onkologie, patho, person, pros, prozedur, seltene, studie, symptom |
| **2** | `/packages/<packageId>/latest` | the **project slug**, from the page's `Project <a href="/…">` item | `de.medizininformatikinitiative.kerndatensatz.consent` → `medizininformatikinitiative-modulconsent` |
| **3** | `/<project-slug>/filterprojectguides` — **no tilde** | the project's **guide keys**, as `data-url="/guide/<key>"` **or** `data-url="/guide/<key>?version=current"` (preview/archived guides carry the query; measured across the 23 modules, an extractor anchored on the closing quote silently drops keys — consent 3 of 3, mikrobiologie 2 of 3, person 0 of 3, so stop at `?`, `#` or `"`) | HTTP 200, ~4.7 KB, **3** keys: `mii-ig-modul-consent-2025`, `mii-ig-modul-consent-2026`, `miiigmodulconsent` |
| **4** | `/published-guide/<guide-key>/versions` | the **published versions** with dates and status, and separately the **"Current preview"** | `miiigmodulconsent` → 2026.0.0 (Default, Read-only, Public, 2025-12-18) plus a preview row; `mii-ig-modul-consent-2025` → 2025.0.0 … 2025.0.4 |
| **5** | `/guide/<key>?version=<v>` (root) and `/guide/<key>/<GuideRoot>/<Page-Slug>?version=<v>` (leaf) | the **page tree** — the root is server-rendered and carries every `href="/guide/<key>/…"`; the leaf carries the narrative | root `MIIIGModulConsent` @ 2026.0.0: 18 page links; leaf `Beschreibung-Modul-Consent`: HTTP 200, real German narrative in `div.ig-view-content` |

Hop 1 yields **only** package ids: it exposes neither project slugs nor guide keys, which is why
hops 2 and 3 exist rather than being an optimisation.

**Variants that do NOT work, and are named so nobody re-derives them:** `~filterprojectguides` and
`~guides` both return **200 and yield nothing**, and so does the project page itself. A 200 is not
evidence that an endpoint answered; the extracted count is.

#### 5.1c.2 The project page yields nothing, the guide pages do

**§2.1.3's measurement stands and is narrower than it reads.** The Simplifier **project page** is
client-rendered — HTTP 200, ~56 KB, 52 script markers, no metadata in the DOM — and it is the one
genuine application shell in this chain. Everything else above is **server-rendered** and hands its
content to `curl`: the package page, the guide listing, the version listing, the guide root, the
leaf pages.

**Conflating the two produced an earlier false negative** — "Simplifier is not scrapeable", concluded
from the project page and generalized to the platform, which is why §5.1 once told a reader to give
up on the rendered IG and work from the repository. That fallback survives only for the case where
this chain **and** the harvest (§5.1d) genuinely yield nothing; it is not the starting position.

##### 5.1c.2a One instance is not the class — in BOTH directions

The rule this restates was written down here in one direction only, and the other direction has cost
this specification more. Stated whole:

**A measurement licenses a claim about the artefact it was taken on. Encoding it as normative for a
CLASS of artefacts is a separate act and needs its own evidence.**

- **Negative** — "X cannot be done", measured on one artefact and stated about the platform, the
  format or the tool. It removes a capability, and a claim of impossibility is never re-checked.
- **Positive** — "X has shape S", measured on one instance and encoded as the shape every instance
  has. It keeps running and looks green, which is why it is the more expensive of the two.

Three shipped defects, all of them found by an operator rather than by review:

| # | The claim | Sample it rested on | What a second instance showed |
| --- | --- | --- | --- |
| **a** | how IG page titles localize (§5.5) | first a constant in the publisher's source with **no build at all**, read as "page titles cannot be localized"; then **one** build, of one guide, on one publisher version (2.2.11) | the HL7 `multi-lang-test-ig` on publisher **2.0.13**, with `/fr/` declared in `i18n-lang` but deliberately left out of `translation-sources` as a controlled negative. The impossibility was false; §5.5 now states the mechanism bullet by bullet, each with its own basis, and lends none of them to another |
| **b** | "Simplifier is client-rendered, so nothing is extractable" (§2.1.3) | the **project** page: HTTP 200, ~56 KB, 52 script markers, no identity metadata in the DOM — a real measurement, still true of that URL | the **guide** pages are server-rendered and carry the whole narrative. The generalisation cost this specification the procedure that is now §5.1c |
| **c** | the guide-key attribute shape `data-url="/guide/<key>"` (hop 3) | the Consent guide listing, where **every** key happens to be bare, so an extractor anchored on the closing quote read 3 of 3 | preview and archived guides carry `?version=current` inside that attribute. Measured across all **23** MII modules: consent 3 of 3, **mikrobiologie 2 of 3, person 0 of 3** — keys dropped silently, at exit 0 |

**In every case the single sample was the benign one, and that is the normal case rather than bad
luck.** The first instance to hand is the reference module — the best-maintained, most regular member
of its class, and therefore the one *least* likely to exhibit a variant. **b** and **c** were measured
on the same module on the same day, one in each direction, so the direction is not the diagnosis; the
sample size is.

→ **The operational test, before encoding a shape or a capability as normative here:**

1. **Name the class** the claim is about — this guide, this project, Simplifier, every MII module.
   A claim whose class is left implicit gets generalised by its reader instead of by its author.
2. **Measure it on more than one instance.** One is a hypothesis.
3. **Choose the second instance as the one most likely to differ** — the irregular one (an archived
   or preview guide, the oldest release, the module nobody maintains), never a second page of the
   same artefact. Where the class is small and enumerable, take **all** of it: the 23 MII modules are
   a `for` loop, and running it is what turned **c** from "works" into "drops 1 of 3 keys on two
   modules". Best of all, try a **controlled negative** — an instance where the mechanism should
   *not* work; if it works there too, the mechanism is not the one you think it is.
4. **Record the sample beside the claim**: which instances, which versions, which date, which
   numbers. Every measured statement in this specification carries one, and that is what lets a
   later run re-scope it instead of re-deriving it.
5. **With only one instance available, bound the claim to it and say the generalisation is
   unverified** — a `TODO:REVIEW` or a gate item. Never widen it silently because widening reads
   better. Where a run finds an endpoint empty, record *which URL* returned *what*, never the
   inference; `repo-identity.sh` reports `client-rendered-page:` scoped to the URL it probed for
   exactly this reason.
6. **Claim completeness from counts, never from an exit code.** Defect **c** exited 0 on all 23
   modules; what exposed it was comparing keys extracted against keys present (§10.4).

The general, skill-independent form of this rule — it is an authoring rule, not a FHIR one — is
carried by the catalog's `skill-authoring` skill in its `references/measurement-rule.md`. Changing
one without the other leaves the catalog saying two things.

#### 5.1c.3 Reproducibility — pin a published version, never `current`

**A migration MUST pin a PUBLISHED, READ-ONLY version and record it in the migration report, exactly
as it records the source commit SHA.** Hop 4 distinguishes the two kinds of row for precisely this
reason: **`?version=current` is the live, editable project**, so two runs of the same migration could
harvest different text with nothing in either report showing that they differ.

- Pin the version the listing flags `Default` + `Read-only`, or the one a human chose from it. Record
  the key, the version, its publication date and the URLs harvested.
- A guide that lists **only** a preview cannot be pinned. That is a Gate-B item — a human decides
  whether a version is published first — not a licence to harvest `current`.
- **A guide's version is NOT the module's version, and is never claimed into the identity ledger**
  (§2.1.4). They are different sequences: measured, guide `mii-ig-modul-consent-2025` version
  **2025.0.1** carries package version **2025.0.0**. A version row naming a package pin is reported;
  claiming it would manufacture an `identity-contradiction:` out of two correct numbers.

#### 5.1c.4 Keys and slugs are DISCOVERED, never constructed

Guide keys do not follow from the project name, the package id or the module name, and page slugs do
not follow from the page titles.

- **Measured:** `miiigmodulconsent` exists; the analogously built `miiigmodulperson` **404s**. A key
  is read from hop 3 or it is not used.
- **Measured:** the renderer de-punctuates slugs — *Anwendungsfälle / Informationsmodell* becomes
  `AnwendungsflleInformationsmodell`, *Datensätze inkl. Beschreibungen* becomes
  `Datenstzeinkl.Beschreibungen`. Read every slug from the guide root.
- **The GuideRoot is read too, not derived from the key:** measured, key `miiigmodulconsent` has root
  `MIIIGModulConsent` while key `mii-ig-modul-consent-2025` has root `MII-IG-Modul-Consent`.

A constructed path is a 404 at best and the **wrong page** at worst, and the wrong page is the one
that reaches a report unnoticed.

#### 5.1c.5 The gated alternative — unchanged, opt-in, human

The project download `<project-slug>/$actions/downloading` requires a Simplifier login. **Verified:
all four query variants — none, `?format=zip`, `?scope=project`, `?download=true` — redirect to
`/login?ReturnUrl=…`.** Its status is unchanged by this section: it is an **opt-in human step** a
maintainer may perform and hand over, never a credential mechanism the skill invents, asks for or
stores. The chain above needs no account, so nothing in a normal run depends on it. **How a
human-supplied archive is accepted, logged and preferred over the harvest is §5.1d.1** — this section
only records that the endpoint is gated.

#### 5.1c.6 Running it — `scripts/simplifier-discover.sh`

The chain is bundled, so that a discovery is logged rather than performed in a browser and
remembered. It sources the run-log helper as a library — **call it directly, never through
`run --emits-runlog`** (§10.5).

```bash
bash "$SKILL_DIR/scripts/simplifier-discover.sh" \
  --org koordinationsstellemii --module consent
```

It walks hops 1 → 5, **WARNs at whichever hop yields nothing rather than guessing past it**, and
writes `migration-log/simplifier-guides.tsv` (key, version, flags, date, package pin) plus one
`migration-log/simplifier-pages-<key>-<version>.tsv` per guide (depth, slug path, URL). Options:
`--package`/`--project`/`--guide` enter the chain further down, `--version` pins explicitly.

Measured end to end on Consent (2026-08-06): 23 packages → 1 module match → project
`medizininformatikinitiative-modulconsent` → **3** guide keys → 3 pinned versions (2025.0.4,
2026.0.0, 2026.0.0) → **52** page URLs across the three guides, 18 of them under
`miiigmodulconsent` @ 2026.0.0. Exit 0.

Every refusal is its own greppable WARN token, and each one exits 1 rather than continuing on a
guess — verified by running each branch:

| Token | Fires when | Verified with |
| --- | --- | --- |
| `org-project-list-empty:` / `org-project-list-unreachable:` | hop 1 returned nothing readable | a nonexistent org key → HTTP 404 |
| `module-not-in-org-list:` | no package id matches the module | `--module nichtvorhanden` |
| `module-ambiguous:` | several do — **never** resolved by taking the first or the shortest | `--module kerndatensatz` → 23 candidates listed |
| `package-project-link-absent:` | hop 2 found no project link | — (a package published outside a project) |
| `project-guides-empty:` | hop 3 yielded no key — check the **missing tilde** first | — |
| `guide-key-not-published:` | hop 4 returned 404 — the key was constructed, not discovered | `--guide miiigmodulperson` → 404 |
| `no-published-version:` | hop 4 lists only a preview; nothing is pinned | — |
| `pinned-version-not-published:` | `--version` is absent from the listing — **not** silently replaced | `--version 9.9.9` |
| `guide-pages-empty:` / `guide-root-not-unanimous:` | hop 5 yielded no page, or several roots | — |

→ **Acceptance:** for each guide key carried forward, the report names the key, the **published,
read-only** version, its date, and the page list harvested from it. A report that cites a page
without naming the pinned version it came from does not meet this criterion.

### 5.1d Harvest the narrative from the rendered guide

**Its input is what §5.1c produced** — a guide key and a pinned, published version — or a guide URL a
human handed over, which §5.1c's hop 4 is used to confirm is published rather than `current`.
**Applies whenever the module's narrative is not in its repository** — source shape B above all,
and any shape A whose pages live on the platform rather than in `implementation-guides/**`. It
produces the Markdown that §5.4 maps onto the template's page set. It does **not** decide where the
pages end up: §9's mapping and the language direction (SKILL.md *Language*) do that.

#### The order of sources — most trustworthy first

1. **The authenticated project download (§5.1d.1)** — the project *including its narrative markdown*,
   as the author wrote it. Gated behind a Simplifier login, so a human supplies it. **Prefer it
   whenever credentials exist.**
2. **The guide harvest (§5.1d.2)** — anonymous, verified, and a *rendering*: directives are already
   expanded, `{{tree}}`/`{{render}}` blocks arrive as their output, and a rendered artefact view is
   not the resource it renders.
3. **Nothing** — which in practice means shipping the template's starter pages under the module's
   name. That is what happened once and what this section exists to prevent. It is never an outcome;
   an unreachable source is reported, escalated to Gate B, and named in the report.

**The registry package is not on this list and has not changed its role.** It carries resources and
identity (§2.1.1) and **no narrative**. Its job here is the opposite one: it is what the harvested
set is **VERIFIED AGAINST** — every profile, extension, value set and code system in the package
either has a harvested page or is recorded as having none.

#### 5.1d.1 The authenticated project download (preferred, gated)

`https://simplifier.net/<project-slug>/$actions/downloading` offers a download of the whole project,
narrative markdown included.

**It requires a Simplifier login.** Measured 2026-08-06: anonymous access returns the login page
(HTTP 200, ~22 KB, redirected to `/login?ReturnUrl=…`), not an archive. Probed alternatives —
`$downloads/project.zip` (404), `/ui/packagedownload/downloadfile` (404),
`/packages/<id>/<v>/download` and `/guide/<key>/$download` (both HTML, not archives) — **there is no
verified anonymous project download.** Do not go looking for one on the strength of a URL that looks
plausible; record what you probed and what it returned.

**How a human supplies it — the manual, opt-in path.** Do not invent a credential mechanism, do not
ask for a password, do not store a token anywhere in the repository or the run log:

1. The agent asks for the archive by name, giving the URL above and the project slug, and says why
   (it is the authored markdown rather than a rendering).
2. A human with a Simplifier account signs in **in their own browser**, downloads the archive, and
   places it at a path they name — outside the module repository, like every other scratch input.
3. The agent reads that path, logs `narrative-source=project-download path=<path>` with the
   archive's size and file count, and proceeds. The provenance recorded on each page is the archive
   and the date, not a URL the agent fetched.
4. If no human is available, say so once and fall through to §5.1d.2. **Waiting is not a stop, and a
   gate is not an impossibility** — record `project-download-unavailable: no credentials offered`
   and name it in the report so a later run can do better.

An account is personal, so nothing about it is automated: no stored cookie, no `curl -u`, no
credential in an environment variable, no session replay. The gate is the point.

#### 5.1d.2 The guide harvest (anonymous, verified)

```bash
bash "$SKILL_DIR/scripts/guide-harvest.sh" \
  --guide-url "https://simplifier.net/guide/<guide-key>/<GuideRoot>?version=<version>" \
  --out migration-log/guide-harvest/pagecontent \
  --keep-html migration-log/guide-harvest/html
```

Call it directly — it emits its own run-log lines (like `package-identity.sh`), so wrapping it in
`migration-log.sh run --emits-runlog` duplicates every line.

The procedure it performs, and which an agent without the script performs by hand in the same order:

1. **Fetch the guide root** and record `http=` and `bytes=`. A non-200 is `guide-root-unreachable:`
   and a stop — never "the guide has no pages".
2. **Discover the page tree from the root's own `href` values.** Page links are told from asset
   links by shape, measured: a page is `/guide/<key>/<Root>…`, an asset is
   `/guide/<key>/<version>/files/static/…`. **Slugs are read, never constructed** (§2.1.3). The
   `?version=` from the input URL is carried onto every page URL, so the harvest is pinned; a URL
   with no version raises `unpinned-guide-version:`.
3. **Fetch each discovered page** and isolate its content region: `<div id="preview-content">`,
   found by **depth-scanning `<div>`/`</div>` until the depth returns to zero** — not by a regex to
   the next `</div>`, which truncates at the first nested one and reads as a short page rather than
   as a parse failure. Everything outside that region is chrome: the tree panel, header, footer,
   version picker. **A page without the region is recorded as skipped**, never converted whole —
   chrome mixed into narrative is indistinguishable from narrative downstream.
4. **Convert the region to Markdown** and write it to `--out` with a provenance header naming the
   source URL and the harvest date, plus `TODO:REVIEW`. `--out` has **no default**: the harvested
   tree is §5.4's input, not the template's page set (§9). The header is a plain HTML comment
   carrying no Liquid — Jekyll evaluates `{% … %}` and `{{ … }}` inside comments too (guardrail 8).
5. **Classify each page.** A guide's tree also contains Simplifier's **rendered artefact views** —
   a StructureDefinition's element tree, a CodeSystem's concept table. They are a *rendering of a
   resource the target IG already ships*, and the IG Publisher regenerates them; pasting one into
   `pagecontent` duplicates a generated artefact as hand-maintained prose. They are counted by their
   markup markers inside the region, marked `kind=artefact-view`, and still harvested — the prose
   above the tree is real narrative.
6. **Verify.** Every discovered page is in `migration-log/guide-harvest.tsv` as `harvested` with its
   counts or as `skipped` with a reason; `log_ratio` reconciles discovered against harvested and
   raises the mandatory `silent-partial-success:` WARN when the second is smaller (§10.4).
   Per page, every source text run of ≥ 40 characters is looked for in the produced Markdown and the
   count that did not survive is `missing_runs=` — a WARN, because a hand-rolled converter drops
   content quietly. Losses on an `artefact-view` page use a separate `generated-view-lossy:` token
   so they cannot bury the narrative losses that the `silent-partial-success:` grep is for.

**Exit status:** 0 = every discovered page harvested with no narrative loss; 1 = something was
skipped or came up short — a real result, recorded per page, and a usable CI gate; 2 = setup error.

**Measured end to end on the MII KDS Consent guide, version 2026.0.0 (2026-08-06):** 18 pages
discovered from the root's links, **18 harvested, 0 skipped**, 14 `narrative` and 4 `artefact-view`
(`FHIRProfile/Consent` 239875 characters of visible text, `Provenance` 73477, `DocumentReference`
74149, `Terminologien` 30045, against a narrative page's 81–3662), **0 narrative pages short**,
3 referenced assets recorded for transfer. Page titles come back as the guide displays them —
`Kontext im Gesamtprojekt / Bezüge zu anderen Modulen`, `Anwendungsfälle / Informationsmodell` — and
`beschreibung-modul-consent.md` opens with the module's real first paragraph, "Das MII KDS Modul
Consent ist ein Basismodul des Kerndatensatzes (KDS) der Medizininformatik-Initiative (MII)…".

#### 5.1d.3 After the harvest

- **Verify the harvested set against the published package** (§2.1.1): every packaged conformance
  resource either has a page or is recorded as having none. A module whose guide documents fewer
  artefacts than it ships is a real finding for the report, not a harvest defect.
- **Links and images stay absolute** to `simplifier.net` and the module's own asset hosts, and the
  image URLs are collected in `migration-log/guide-harvest-assets.tsv`. Retargeting the links and
  transferring the assets is part of §5.4's mapping; a link silently pointed at a page that does not
  exist yet is a broken build.
- **The pages are not yet the target's pages.** §9's mapping folds them into the template's **fixed**
  page set — several harvested pages routinely become sections of one template page, and a
  per-profile narrative goes to `input/intro-notes/` (§5.4). One new page per harvested page is the
  failure mode §9 exists to prevent: an extra page is an orphan the menu cannot reach.
- **Language.** A German guide's harvest is the German text. Under the template's English default it
  becomes the *translation* — `input/translations/de/pagecontent/` — with `input/pagecontent/*.md`
  produced as machine translations marked `TODO:REVIEW` and reviewed at Gate C (SKILL.md *Language*).
- **Gate B reviews the harvest**, page by page, against the rendering — including every
  `generated-view-lossy:` page and every `TODO:REVIEW` header.

### 5.2 Create the skeleton

Create the skeleton **in place**: on a working branch of the module's existing repository, vendor
the template and run its first-run bootstrap — do not mint a new repository; the module's history,
issues and consumers stay where they are. (A new repository is a human decision, recorded in the
migration report, never a default.) Replace the placeholders (§2.3) using the identity read in
§2.1 — the licence per §2.2 is carried from the source, not left at the template's literal.
**Delete the template's example artefacts** — at the time of writing
`input/fsh/profiles/example-patient.fsh` and
`input/fsh/instances/example-patient-instance.fsh`; confirm the paths in the template you actually
checked out. **Collision rule for the FSH scaffold:** diff the template's `RuleSet:`/`Alias:`
names against the module's FSH before copying; module definitions win — the module's FSH is never
changed. The resolution granularity differs by file kind: a **shared alias file** (`aliases.fsh`,
or any scaffold file whose definitions both sides contribute to) is resolved **per DEFINITION** —
append only the template definitions the module lacks; every **other** colliding scaffold file is
resolved **per file** — skipped whole. Both the appended-definition list and the skipped-file list
go into the report (SKILL.md step 3 has the known collision set).

**Scaffold filenames are derived from the module ID, never from the repository slug.** Every
scaffold coordinate that embeds the module's name — `ig.ini`'s `ig=` path, the
`ImplementationGuide-<id>` references in pages and includes, the `.po` catalogue name (§5.5) —
uses the `id` read in §2.1, because SUSHI writes
`fsh-generated/resources/ImplementationGuide-<id>.json` from that `id` and from nothing else. A
slug-derived filename builds green right up until the publisher looks for the IG resource and
finds none — the id-vs-slug failure class that check **P5** (§11.4) exists for.

→ **Acceptance:** `npx --yes fsh-sushi@3.20.0 .`, run through the helper so its exit status survives
(`bash "$ML" run 5.2 sushi-skeleton --raw-log migration-log/sushi-skeleton.log -- npx --yes
fsh-sushi@3.20.0 .`), runs without error — **shape B: as qualified in §5.1b.4** — no template
examples remain; no `{{` left unaccounted for; the skipped/appended collision lists are in the
log; `ig.ini`'s `ig=` names a file SUSHI actually writes (P5's subject).

### 5.3 Transfer the artefacts

Move the FSH sources from the source repository. Where only JSON/XML exists, convert with `gofsh`;
for source shape B that conversion and its post-processing already happened in §5.1b, so what moves
here is that output. IDs and URLs unchanged — including the ids goFSH minted for resources that had
none, which are confirmed at Gate A rather than re-minted here. **The transfer is
structure-preserving:** the source's directory layout under `input/fsh/` is carried over, not
reorganized — a reshuffled tree holds the same artefacts and still wrecks every deep link, review
diff and downstream path reference.

→ **Acceptance:** the SUSHI build produces every artefact; **the canonical URL diff against the
source is empty**; and structure preservation is proved at **path level** — `comm -3` over the
sorted repo-relative FSH path lists of source and target is empty apart from scaffold additions
named in the log (counts alone prove nothing about structure).

### 5.4 Migrate the narrative

**Where the narrative comes from is §5.1d** (pointed at the guide §5.1c discovered) — the
repository's own pages where it has them, the authenticated project download where credentials
exist, otherwise the verified guide harvest. **Where each page GOES is not decided here:** this
section performs the mapping **consuming only `migration-log/page-map.tsv`** — the contract §9e
generates and §9f binds, human-reviewed before this step touches it. A source page with no map row
is **not written** (its absence is a coverage failure the generator already refused with exit 1),
and a map row this step leaves unhandled is a defect the report must carry. It never invents a
page, and never creates one page per harvested page — the targets are the template's **fixed**
page set (§9).

Move the Manteldokument content into the page set — **which language goes where is decided by
§4.2**: when the source narrative is not in the target's default language (the normal KDS case:
German source, English default), the source text goes to
`input/translations/<source-lang>/pagecontent/` and the default-language `input/pagecontent/*.md`
are produced as machine translations of it, every page marked `TODO:REVIEW` for Gate C.
Translate Simplifier and FQL directives into IG Publisher equivalents:

```bash
bash "$ML" run 5.4 fql-scan --emits-runlog -- \
  bash "$SKILL_DIR/scripts/fql-scan.sh"            # recursive; findings are informational
bash "$ML" run 5.4 fql-scan-strict --emits-runlog -- \
  bash "$SKILL_DIR/scripts/fql-scan.sh" --strict   # exit 1 on any finding, for CI
```

The scanner prints its scanned-file count and exits 2 on an empty target set — "nothing scanned"
is never "nothing found". Run it through the helper rather than `… | tee -a`, or both of those exit
statuses — the `--strict` gate and the empty-target refusal — are replaced by `tee`'s 0 (§10.5).

Apply the recommendation per finding; the mapping is in `references/fql-crosswalk.md` and the rules
in `references/fql-rules.tsv`. Ambiguous cases take professional judgement; when in doubt mark
`TODO:REVIEW` (guardrail 4).

Respect the Liquid build guard: no `{% … %}` or `{{ … }}` literals in `pagecontent`, including
inside HTML comments. An invalid `{% … %}` breaks the build hard; an unknown `{{ … }}` silently
empties and leaks into the HTML.

→ **Acceptance:** every row of `migration-log/page-map.tsv` is handled — the target written, or the
`RETIRED` reason confirmed — and nothing outside the map was written; every page of the template's
set exists; each mandatory Manteldokument section has its home per the mapping in §9, and any the
source did not supply is listed in the report as a gap rather than silently absent; the scan
reports no `[UNKNOWN]` and no unintentionally remaining directives.

### 5.5 Bilingual setup

- **Narrative pages.** The German translation is a same-named file under
  `input/translations/de/pagecontent/`. These **do** render. (An older convention used sibling files
  `input/pagecontent/<name>-<lang>.md` and reported that pages did not translate. Both are
  obsolete.)
- **Menu.** `input/includes/menu.xml`, with a per-language mirror at
  `input/translations/de/includes/menu.xml`. A `menu:` property in `sushi-config.yaml` generates a
  single untranslatable menu that competes with this and must not be used.
- **Resources.** `.po` supplements under `input/translations/de/`. The publisher generates
  templates for every resource on each build; copy the ones you need and translate the `msgstr`
  lines. **Check the template's own translation recipe for which resource types and fields actually
  render before investing in a supplement** — several do not (ValueSet supplements among them), and
  a supplement for one of those is silently ignored.
- **Page titles.** `input/translations/<lang>/ImplementationGuide-<ig-id>.po`, one
  `#: ImplementationGuide.definition.page.title` unit per distinct title of the `pages:` tree.
  Generate it after the SUSHI run of §5.2, seeded from the two menus:

  ```bash
  bash "$ML" run 5.5 gen-page-title-po --emits-runlog -- \
    python3 "$SKILL_DIR/scripts/gen-page-title-po.py" \
      fsh-generated/resources/ImplementationGuide-<ig-id>.json \
      migration-log/menu-titles-de.txt \
      de input/translations/de/ImplementationGuide-<ig-id>.po
  ```

  Resolve `SKILL_DIR` to the directory holding the skill's `SKILL.md` first; a bare
  `scripts/gen-page-title-po.py` silently runs the *project's* same-named file if it has one.
  See *Mechanism* below — this is **not** a resource supplement and is not subject to the
  supplement type restriction.

  **Producing `migration-log/menu-titles-de.txt`, the seed.** It is a required positional argument
  with no default, so it has to exist before the generator runs. Its format is **one
  `English Title => Deutscher Titel` per line**; blank lines and `#` comments are skipped, and a line
  without the ` => ` separator (spaces on both sides, exactly one occurrence taken as the split) is
  reported as malformed and ignored. The seed is *only* a seed: an existing non-empty `msgstr` in the
  target `.po` wins over it, and a title the seed does not cover is emitted untranslated and named in
  the run summary. There is no obligation to seed at all — **pass `-`** to say deliberately that
  there is no seed. What is forbidden is a path that does not resolve: that is a setup error (exit 2,
  nothing written), never a silent "no seed".

  The two menus are the natural source, because they are structurally mirrored translations of each
  other. Pair their link labels **positionally** — not by `href`, because a dropdown parent and its
  first child share one `href` and pairing on it produces a cross-product:

  ```bash
  mkdir -p migration-log        # shape A never ran §5.1b.2, so it may not exist yet
  labels() { grep -o '<a [^>]*href="[^"]*"[^>]*>[^<]*' "$1" \
             | sed 's/.*"[^>]*>//' | sed 's/[[:space:]]*$//'; }
  labels input/includes/menu.xml                    > migration-log/.menu-en.txt
  labels input/translations/de/includes/menu.xml    > migration-log/.menu-de.txt

  # Same anchor count is the precondition for pairing by position; when it does not
  # hold the menus are not mirrors and the seed would be silently wrong.
  bash "$ML" ratio 5.5 menu-seed paired anchors \
    "$(wc -l < migration-log/.menu-en.txt | tr -d ' ')" \
    "$(wc -l < migration-log/.menu-de.txt | tr -d ' ')"

  paste -d'\t' migration-log/.menu-en.txt migration-log/.menu-de.txt \
    | awk -F'\t' 'NF==2 && $1!="" && $2!="" && $1!=$2 {print $1" => "$2}' \
    | sort -u > migration-log/menu-titles-de.txt
  bash "$ML" info 5.5 menu-seed "wrote the page-title seed  entries=$(wc -l \
    < migration-log/menu-titles-de.txt | tr -d ' ') out=migration-log/menu-titles-de.txt"
  ```

  Measured against the module template's own pair of menus: 27 anchors each, 23 distinct seed
  entries. The seed covers only menu entries, so pages that are not in the menu (Table of Contents,
  Downloads, Translation Information, Metadata Overview) stay untranslated and are named by the
  generator — that is the ② review queue, not a defect in the seed. A module generated from template
  **v0.5.0** can seed from its `input/includes/breadcrumb-titles-de.txt` instead, which is already in
  this exact format; it is likewise incomplete, for the same reason.

  **Regenerating is non-destructive.** The same catalogue is also where the IG's own
  `title`/`description`/`publisher` units, per-artifact units and a gettext header entry live; the
  generator parses an existing file, writes those back verbatim, and lets an existing non-empty
  `msgstr` win over the seed, so a hand translation survives. It reports what it carried over, what
  it dropped (a unit whose title left the `pages:` tree), and every collision where two pages share
  one English title — gettext keys by `msgid`, so those share one unit and cannot be translated
  apart. A seed path that cannot be read is a setup error (exit 2, nothing written); pass `-` to say
  deliberately that there is no seed.

**Mechanism.** Each bullet below carries its own basis; do not lend one bullet's basis to another.

- **Observed on our own build** (IG Publisher 2.2.11, our pin, on the migrated MII KDS *Dokument*
  guide with the breadcrumb override deleted and 23 `page.title` units supplied): the `/de/`
  breadcrumbs render German down to the root label *Inhaltsverzeichnis*, the table-of-contents page
  body renders German, the browser `<title>` renders German, and `temp/pages/_data/pages.json`
  carries a differing `titlelang` per language for all 23 pages (none before). Build health was
  unchanged (SUSHI 0 errors, `qa.txt` at the established `err=7` baseline).
- **Not observed, not tested** on 2.2.11: the left-hand **navigation menu**, and the IG's own
  `description`, `publisher`, `name` and artifact names/descriptions. Do not claim them. Menus have
  their own per-language file (`input/translations/<lang>/includes/menu.xml`) in any case.
- **Read from the publisher source, not proven by our build:** an `ImplementationGuide-<id>.po`
  found under a folder listed in a **`translation-sources`** parameter is imported into the IG
  resource at load time (`PublisherIGLoader` → `importFromTranslations`), and the renderer reads the
  resulting translation extensions into its per-language `titlelang`/`breadcrumblang` maps; this is
  a different code path from resource supplements, whose `TRANSLATION_SUPPLEMENT_RESOURCE_TYPES`
  list (StructureDefinition, CodeSystem, Questionnaire) does not constrain it. This explains the
  observation; it is not the evidence for it. (Over-trusting exactly that constant is what produced
  the earlier false claim that page titles cannot be translated at all — a source constant is a
  hypothesis until a build confirms the outcome.)
- **Corroboration outside our build:** the HL7 reference guide `FHIR/multi-lang-test-ig` (live build
  produced by publisher **2.0.13**, not our pin) renders localized breadcrumbs under `/es/` and
  `/nl/` while `/fr/` — declared in `i18n-lang` but absent from `translation-sources` — is *not*
  localized, a controlled negative for the footgun below. Inside our own organisation, both MII
  template repos already ship such a catalogue on their `dev` branch, and `ig-template-mii-kds`
  records the same mechanism in use by the MII's own `kerndatensatz-basis` module
  (`ImplementationGuide-mii-ig-base.po`), verified 2026-07-30.

Two consequences worth knowing: the authoritative title set is the **SUSHI-generated
ImplementationGuide resource** (it holds the whole tree including the root `toc.html` page and the
pages that are not menu entries — in the Dokument guide the menus covered only 19 of 23 titles), and
an empty `msgstr` is treated by gettext as untranslated, so the publisher falls back to the default
language for that entry alone. **Footgun:** a language declared in `i18n-lang` but absent from every
`translation-sources` parameter has its `.po` files silently ignored — that, and not a publisher
limitation, is the usual cause of English breadcrumbs on a `/de/` page.

**Migration path for existing modules.** Exactly one module-template release — **v0.5.0** — shipped
a template override of `includes/fragment-pagebegin.html` plus
`input/includes/breadcrumb-titles-de.txt`, which rewrite the *rendered* breadcrumb HTML by string
replacement. That override was a misdiagnosis of the publisher's behaviour (it was introduced on the
template's `main` branch, bypassing `dev`, which never carried it) and is being retired; v0.4.0 and
earlier never had it, and the template's `dev` branch carries the correct `.po` instead. So the
catalogue is the only *publisher-level* mechanism for page titles — the override was a second,
*rendering-time* one, and it is going away. A module generated from v0.5.0 should therefore **add an
`ImplementationGuide-<id>.po` and drop the override** in the same change; leaving the override in
place while re-vendoring a newer template reverts its German breadcrumbs to English. The old mapping
file's content is a valid seed for the `.po`; it is not a complete one, because it was generated
from the menus and therefore omits the non-menu pages.

→ **Acceptance:** the IG builds both language variants; translated element texts appear on the
translated artefact pages; no ignored `.po` files were created;
`input/translations/<lang>/ImplementationGuide-<ig-id>.po` exists and carries a page-title unit for
**every** distinct title in the `pages:` tree (the generated ImplementationGuide resource is the
reference set — a unit count below it is a defect), with every empty `msgstr` listed in the report's
② review queue rather than left silent; the target language is present in a `translation-sources`
parameter as well as in `i18n-lang`; and the German breadcrumb is confirmed **on the built output**
(a `/de/` page renders e.g. `Inhaltsverzeichnis / …`), not inferred from the source.

### 5.6 Build and QA

Run SUSHI, then the IG Publisher — both through the run-log helper, so the two numbers this step
exists to produce (SUSHI's error count and `qa.txt`'s `Errors:`) end up in the log rather than only
on someone's terminal. The target pins the publisher, SUSHI and Jekyll versions in its build
workflow's `env:` block, the publisher jar additionally by SHA-256 — **read the pins from there**,
and use them here instead of the versions written below.

```bash
bash "$ML" run 5.6 sushi-build --raw-log migration-log/sushi-build.log -- \
  npx --yes fsh-sushi@3.20.0 .
SUSHI_EXIT=$?
bash "$ML" info 5.6 sushi-build "errors=$(grep -oE '[0-9]+ Errors' migration-log/sushi-build.log \
  | tail -1 | cut -d' ' -f1) exit=$SUSHI_EXIT raw_log=migration-log/sushi-build.log"

bash "$ML" run 5.6 ig-publisher --raw-log migration-log/qa-build.log -- \
  <the publisher invocation pinned in the target's build workflow>
bash "$ML" info 5.6 ig-publisher "qa=$(grep -m1 -E '^(Errors|Warnings|Info)' output/qa.txt) \
  qa_txt=output/qa.txt raw_log=migration-log/qa-build.log"
```

A missing Jekyll on the runner surfaces as `Cannot run program "jekyll"`. Copy `qa.txt`'s summary
line into the log as above: the file itself is build output that may not be committed, and a report
claiming `Errors: 0` needs a log line behind it (§10.6).

**Then measure the target with the same instrument and DIFF the two measurements.** The sibling
skill's `ig-stats.py` writes `migration-log/postflight-analysis.json` (the §9c command, pointed at
the migrated tree), and `scripts/prepost-delta.py` compares it against the Gate-0 pre-flight:

```bash
bash "$ML" run 7 postflight-analysis --emits-runlog -- \
  python3 "$ANALYSIS_SKILL_DIR/scripts/ig-stats.py" analyze . \
    -o migration-log/postflight-analysis.json
bash "$ML" run 7 prepost-delta -- \
  python3 "$SKILL_DIR/scripts/prepost-delta.py" \
    --pre migration-log/preflight-analysis.json --post migration-log/postflight-analysis.json \
    --out migration-log/prepost-delta.md --tsv migration-log/prepost-delta.tsv
```

One row per compared property — the identity fields; the licence `contradictory` flag; the
dependency-injection risk; the artefact counts per class **including the `other` bucket**;
narrative pages, intro notes and translation pages; the directive counts; the dual-source flag —
each carrying pre, post and a verdict `unchanged | improved | REGRESSION | expected-change`.
**Exit 1 means at least one property got WORSE** (licence contradictory `false→true`, injection
risk `false→true`, any artefact count dropped, an identity field changed): that is a **stop to
fix**, never a delta to file. **One exception, and it is measured, not judged:** when the two
measurements' `mode` fields differ (ig-stats' `reduced` raw-resource census against its `static`
FSH-declaration census — the §5.1d shape, where the source repo holds Forge XML and the target holds FSH), the two
census styles classify the same artefacts differently, so every artefact-COUNT difference is
reported as `expected-change` with both modes named, never as a regression — conservation of the
artefacts themselves is §11's C1 question, answered by id, not by count; identity, licence, flag
and directive regressions are unaffected. The TSV mirror (`property⇥pre⇥post⇥verdict`) is what
the report's generator reads.

→ **Acceptance (and then §11, which checks the rest mechanically):** the pre/post delta ran and
reports **no REGRESSION row** (exit 0); `qa.txt` reports `Errors: 0` — **shape B: as qualified in §5.1b.4**, where the
residual errors are the named escalations and every *other* error is still a stop; every example
validates (an example blocked by an unresolvable parent is named, not counted as validated); the
same-module comparison of the catalog's `fhir-ig-analysis` skill (source first, migrated tree
second — equal `packageId` triggers it) reads **IDENTISCH** for identity fields, published artifact
set and canonical URLs, and its narrative per-language table is carried into the report's QA triage.
The IDENTISCH criteria are **not** qualified by shape: they are identity checks, and a DIVERGIERT is
a stop in either shape.

### 5.6a The same-module verification needs a SIBLING SKILL — a checked precondition

§5.6's acceptance criterion and §7's Definition of Done both require the same-module comparison of
the catalog's **`fhir-ig-analysis`** skill. Until now this specification named that skill and never
said how to obtain it, which leaves an operator whose installation does not carry it with three bad
options: skip the check, hand-wave it, or improvise a comparison. All three end with a migration
reported as done on evidence nobody produced.

So the dependency is **detected, and its absence is a loud, actionable WARN**:

```bash
bash "$SKILL_DIR/scripts/sibling-skill-check.sh" --skill-dir "$SKILL_DIR"
```

It resolves the installed-skills root from `--skill-dir` (and, failing that, from the conventional
project- and user-level agent directories), confirms a candidate by reading `name:` out of its
`SKILL.md` rather than trusting the directory name, and reports:

| Outcome | Emits | Exit |
| --- | --- | --- |
| found | INFO naming the resolved path and, where a `skills-lock.json` records one, the ref this project pinned it to | 0 |
| not found | WARN `sibling-skill-unavailable:` carrying **the exact install command, pinned** | 1 |
| pinned ref reads `main`/`master` | additionally WARN `pin-not-taken:` — the lock file is the second, independent way to see that a pin did not apply | 0 or 1 |
| no `--skill-dir` and nothing in any conventional root | WARN `skill-root-undetermined:` naming the roots it examined — reported as *unread*, never as *absent* | 1 |

The command it emits is the pinning form, with the ref taken from this project's own
`skills-lock.json` so the sibling arrives at the version the rest of the installation is on:

```text
npx skills add "https://github.com/forschungsgruppe-digital-health/agent-skills/tree/<ref>" \
  --skill fhir-ig-analysis --agent claude-code codex --yes
```

`<owner>/<repo>@<tag>` is **not** the pinning form — in that CLI `@` introduces a skill *name* and the
install silently comes from the default branch — so the script never emits it.

#### 5.6a.1 Why it does NOT install it

**A tool grant is not a dependency declaration.** `allowed-tools` answers "may the agent run this
command", never "does this skill need that skill". This skill's own frontmatter is the proof: it
grants `Bash(npx:*)` for the pinned SUSHI and goFSH invocations, and that grant would equally permit
`npx skills add`. Permission without intent is exactly the confusion to avoid — a dependency has to
be stated where it is *checked*, in the procedure, with an observable outcome.

Three further reasons, each of which stands on its own:

- **It would write to the operator's project as a side effect of an unrelated run.** A migration
  touches a working branch of the module repository (guardrail 6) and nothing else. Installing a
  skill mutates `.claude/skills/` or `.agents/skills/` and `skills-lock.json` — files that are not
  this migration's to change, and that a reviewer of the migration's pull request will never see.
- **It would make the run non-hermetic.** A sibling resolved from the network at run time is not the
  version anybody reviewed, and — unless the install is also committed — not a version the run log
  can name. The run's own reproducibility rule (§5.1c.3: pin a published version, record it like the
  source commit SHA) would then hold for the guide and not for the tooling.
- **It cuts against the catalog's static-by-design stance.** The catalog is a Git repository with a
  generated index, no server and no runtime; installation is an explicit, reviewed act by the
  consumer, recorded in `skills-lock.json`. A skill that installs another skill turns the consumer's
  deliberate pin into a run-time resolution. The catalog's own authoring guidance names fetching and
  executing remote content on the agent's initiative as an anti-pattern for the same reason.

**What the operator does instead is one command, and it is in the WARN.** That is the whole trade:
one copy-paste, in exchange for the install staying visible, pinned, reviewed and theirs.

→ **Acceptance:** the check ran and is in the run log. Either it exited 0 and the same-module
verification's IDENTISCH lines are in the log behind it, or it exited 1 and the missing sibling is in
the report's ① decision queue — a Definition-of-Done item that has not been met, never a step quietly
dropped. The check itself installs nothing and modifies nothing.

### 5.7 Report

Write `migration-log/migration-report.md`: mapping table, assumptions, the `TODO:REVIEW` list, the QA
summary, and any source-versus-template identity divergence from §2.2.

→ **Acceptance:** every open point is addressed or explicitly marked.

### 5.8 Pull request

**Name the working branch `migration/<source-version>-template-<module-template-tag>`**
(e.g. `migration/2026.0.1-template-v0.11.0`) — it names both coordinates a reviewer needs.
The five earlier try-runs each invented a different scheme
(`migration/fresh-<date>`, `migration/kds-module-template`,
`migration/mii-kds-module-template`, …), which made the sandbox repositories needlessly hard
to compare; measured across the FGDH `*-inoffiziell` repos on 2026-08-20. A *re*-migration on the
same coordinates appends a discriminator (`…-r2`).

Open a pull request with the report as its description. **Do not publish.**

Determine the target branch from the module repository's own convention — **discover it, do not
assume it**: the default branch, the bases of previously merged pull requests, and
CONTRIBUTING/README are the evidence. The template previews every non-`main` branch to `gh-pages`
under `branches/<branch>/` and reserves `main` and tags for formal publication, so a working
branch gets a rendered preview without touching the default branch. If the module repository uses
a different convention, follow it and record which you followed — and when the discovered PR base
is itself the publication branch (for example GitHub Pages served from it), say so in the pull
request description and at Gate D: there, merging publishes.

## 6. Mandatory human review gates

| Gate | After | Reviewed |
| --- | --- | --- |
| **A** | §5.3 | Canonical URL and ID preservation; artefact completeness; any identity divergence per §2.2; for source shape B additionally the ids goFSH minted (§5.1b.4), the decision on any unresolvable parent, and — **narrowed to what tier P could not supply** (§2.1.1) — the identity fields a published package has no field for: `title`, `license`, `publisher` |
| **B** | §5.4 | The narrative, especially sections added to satisfy the Manteldokument, and section completeness by hand while §9 is open |
| **C** | §5.5 | Language handling and translation |
| **D** | before merge | Release per KDS governance (TF KDS / AG IOP / NSG) |

Gate D is organizational. Nothing publishes before it.

The verification phase (§11) runs before Gate D and **feeds** the gates rather than replacing them:
every DIVERGIERT and every NICHT PRÜFBAR row arrives at one of A–D with the human action it needs.
A gate signed off while `verify-migration.py` still exits non-zero is signed off against the
evidence.

## 7. Definition of done

SUSHI and the IG Publisher build cleanly (`Errors: 0`) — **for source shape B read that through the
shape-B qualifier of §5.1b.4, never flatly**; the Manteldokument crosswalk is complete; the
`fhir-ig-analysis` same-module verification reads IDENTISCH (identity, published artifact set,
canonical URLs) — that sibling skill being a **checked precondition**, §5.6a, so an installation
without it produces an open decision-queue item and never a silently skipped criterion; the
language configuration is English-default with a German translation; every
placeholder is replaced; template examples are removed; the default branch is unchanged; a pull
request carries `migration-report.md`; all review gates are signed off.

That qualifier, in full: when a foreign parent package ships no snapshots, a clean build is **not**
reachable by migration alone, and §5.1b.4 defines what "clean" means then in four conditions — not a
silently tolerated error count, and not a fabricated parent. The sentence above is the one people
quote, so it carries the marker itself rather than relying on this paragraph being read too.

And, for every shape: the migration report's protocol section is generated from
`migration-log/run.log` (§10), so a run whose log is missing or was written after the fact is not
done either.

**And, for every shape, the criterion that is no longer a sentence: the verification phase (§11) RAN
and its exit status is in the log.** Exit 0 is done. Exit 1 means a named divergence is open; exit 3
means a check could not be mechanised — and neither is "passed". Every DIVERGIERT row sits in a
reviewer queue and every NICHT PRÜFBAR row names the human who resolves it, at which gate. This
replaces the older wording under which a green build plus a read checklist counted as verified: four
real migrations met that wording while shipping unreachable artefacts, a stale rendered provenance, a
broken page header, a silently truncated file and a wrong dependency pin (§11).

## 8. Non-goals

No content remodelling. No change to normative decisions. No independent publication. No invention
of missing domain content.

## 9. Mandatory-section mapping

The Manteldokument requires sections whose names do not appear in the template's page set. **They
map onto sections *within* pages, not onto pages of their own.** That is why the page set looks
like it is missing them and is not.

The mapping below is derived from `medizininformatik-initiative/kerndatensatz-basis` — the MII's own
reference module. **Dated caveat (2026-08-15):** basis still carries the PRE-SPLIT page set
(`profiles-and-extensions.md`, `search-parameters-and-operations.md`, `terminology.md`,
`conformance.md`, `general-requirements.md`, `must-support.md`, `missing-data.md`,
`datasets-and-descriptions.md` — measured on its `develop` branch, its active one); the module
template restructured that set from **v0.8.0** on (§9a). Basis therefore remains the evidence for
*which source sections exist and what the MII puts in them*, while the **target page names** in the
tables below follow the template's CURRENT set. It is evidence about what the MII actually does,
not an interpretation of the Manteldokument's wording. Expect any module whose page set predates
the template to score short on the analysis skill's mandatory-page list.

| Manteldokument section | Where it lives | Evidence |
| --- | --- | --- |
| **Bezüge zu anderen Modulen** | **`implementer-guidance.md` is the primary home** for the substance: module dependencies, cross-module references, and any compared/derived-profile discussion. `index.md` § *Related guides* carries only a **short link list** (the template's `TODO:` there asks for names, not prose). The machine-readable form is `dependencies` in `sushi-config.yaml`. Learned on the first full migration's review: routing the context *prose* onto `index.md` makes the landing page read as misplaced — the index stays lean. | basis `implementer-guidance.md` lists "Module dependencies and cross-references"; template `index.md` |
| **Referenzen** | **`implementer-guidance.md`** for reference *discussion* (compared specifications, alignment notes); `index.md` § *Related guides* only as a short link list of external guides and the FHIR IG Registry; `downloads.md` for package and artefact references; inline artefact links throughout the narrative | basis `implementer-guidance.md`; template `index.md`; basis `downloads.md` |
| **Anwendungsfälle / Szenarien** | `guidance.md`, which routes to `implementer-guidance.md` and `researcher-guidance.md`; `examples.md` for the concrete scenarios. Scenario *narratives* (use-case descriptions with diagrams) default to **`guidance.md`**; `implementer-guidance.md` is the better home when the scenarios are written as implementation instructions. (`general-requirements.md`, the pre-v0.8 default home per the basis evidence, no longer exists as a page — the whole Conformance cluster is link-only to the Meta module, §9a — so source content that lived there must land on `guidance.md`/`implementer-guidance.md`.) Either way, record the choice as `TODO:REVIEW` for Gate B — reviewers reasonably disagree on this one. | basis `general-requirements.md` (German) refers to "die Anwendungsfälle der Medizininformatik-Initiative"; basis `researcher-guidance.md` covers identifying data elements for a research question |

Further recurring source-section homes, learned on the Dokument migration (same rule: sections
within existing pages, never new pages):

| Source section | Where it lives | Why |
| --- | --- | --- |
| **Datensatz / Informationsmodell page** (dataset narrative + logical-model rendering) | **all on `logical-models.md`**: the narrative above, the logical-model rendering (`-snapshot` include) below. (`datasets-and-descriptions.md` was retired in template v0.8+ — the menu's "Datasets and Descriptions" entry is now link-only to `logical-models.html`, §9a.) | the module's datasets ARE its logical models; the retired page would be an unlisted orphan |
| **Per-profile Suchparameter section** | `search-parameters.md` (an OPTIONAL page — keeping it is the M9 decision, §9a), with a link back from the profile's section on `profiles.md` | the template has a dedicated page for it; a stub next to a filled profile page confuses readers |
| **Per-profile example serializations** (inline XML/JSON, tabs) | links to the example artefact pages (whose tabs render the serializations); `examples.md` lists all examples | inlined dumps duplicate the artefact pages and bloat the narrative — see the crosswalk's tabs rule |
| **Per-profile narrative pages, N > 2 profiles** | one `input/intro-notes/<Type>-<id>-intro.md` per artifact, German mirror at `input/translations/de/intro-notes/<same filename>` — **both render atop the respective artifact page** (verified on a real build: no cross-language leakage); `profiles.md` becomes a short per-profile index with links | the template wires `path-pages: input/intro-notes`; five per-profile pages ≈ 4,400 words (kerndatensatzmodul-person) would make one section-per-profile page unreadable |

### Two consequences for step 5.4

**Never create a page outside the template's page set** to hold one of these sections. The page set
and the menu are owned by the module template (`pages:` plus `input/includes/menu.xml` and its
per-language mirror); an extra page is an unlisted orphan that the QA flags and that no menu
reaches.

**The reference module is itself incomplete on use cases.** `kerndatensatz-basis` opens its
researcher guidance with a note that detailed guidance "will be added in a future version of this
implementation guide". A migrated module therefore cannot be held to a higher standard than the
reference, and guardrail 4 forbids writing the missing content. Record the gap in the migration
report and raise it at Gate B; do not fill it.

So §5.4's acceptance criterion is: each of the three sections has a **named home** in the page set
per the table above, and any that the source guide did not supply is listed in the report as a gap
rather than silently absent.

## 9a. Template ≥ v0.8: the split page set and the decision gates

**Measured at module-template `v0.10.3` (2026-08-15).** From v0.8.0 the template implements the
TF-KDS-agreed menu structure; a migration that targets the current template lands on THIS page set
— [`references/template-pages.tsv`](template-pages.tsv) is the measured list. What changed against
the pre-v0.8 set the earlier migrations (Dokument, Person, Consent, Labor) targeted:

**Split pages.** Three combined pages became per-artifact-type pages, and source content splits
with them:

| pre-v0.8 target | current target(s) | split rule |
| --- | --- | --- |
| `profiles-and-extensions.md` | `profiles.md` + `extensions.md` | profile narrative → profiles; extension narrative → extensions |
| `search-parameters-and-operations.md` | `search-parameters.md` + `operations.md` | by artifact type |
| `terminology.md` | `value-sets.md` + `code-systems.md` | ValueSet notes + expansion note → value-sets; CodeSystem notes + the SU-TermServ note → code-systems |

**Retired pages — content must NOT be routed to them** (they would be unlisted orphans):

- `datasets-and-descriptions.md` — the menu's "Datasets and Descriptions" is now **link-only** to
  `logical-models.html`; dataset narrative goes ON `logical-models.md`, above the rendering.
- `conformance.md`, `general-requirements.md`, `must-support.md`, `missing-data.md` — the whole
  Conformance cluster is **link-only** to the Meta module (interim: the `kerndatensatz-meta` wiki
  sections; the template's menus carry the URLs). Source content that lived on these pages moves to
  `guidance.md` / `implementer-guidance.md` (scenario narratives, module-level requirement prose) —
  MII-wide conformance rules are NOT restated in a module.

**Optional (0..1) pages — a REQUIRED migration decision (M9), and it is MEASURED, not judged.**
Seven pages ship marked optional with a visible decision banner and an `OPTIONAL-PAGE` marker:
`researcher-guidance`, `extensions`, `search-parameters`, `operations`, `value-sets`,
`code-systems`, `metadata`. Decide each from the BUILT PACKAGE's artifact count for the page's
type (extensions → Extension SDs; search-parameters → SearchParameters; value-sets → ValueSets;
code-systems → CodeSystems; researcher-guidance/metadata → source narrative for them):
**count 0 → REMOVE** (the template's `docs/optional-pages.md` procedure: both page files, both
menu entries, the `pages:` row, the `.po` unit); **count > 0 → KEEP** (fill it and delete the
banner + marker in BOTH languages) — **artifacts the source or build package ships are NEVER
deleted to force a removal** (user decision 2026-08-20: `>0` always keeps, even where the source
narrative claims the module "has none" — record such a discrepancy in the report instead). The template's convention check
**M9** fails a module release while any is undecided; an undecided page ships a "decide me" banner
to readers. Emit the decision as run-log step `5.4a optional-page-decisions`, one line per page.
Count from Gate-0's census — and where `generated_crosscheck.mismatches` is non-empty, the
GENERATED resourceType counts are the authoritative ones (the FSH-declaration typing knows only
InstanceOf names). **Artefact types outside the seven pages' model** — everything Gate 0 reports
under `artifacts.other` (ConceptMap, Measure, Library, ObservationDefinition, …) — have NO
template page to decide: give each type an explicit placement (an existing page's section, a new
page, or artifacts-only) and record it as its own `5.4a` line; a type nobody placed is a ① item,
never a silent artifacts-page-only default.

**Security and Privacy is three-stage, and stage 3 is a decision (M11).** The page ships two static
MII-wide stages (data-protection concept, DIMP) that are KEPT, and a module-specific stage 3 whose
content is optional: write the module's own aspects (the natural home for source privacy/security
narrative — e.g. Dokument's Base64-embedding caveat) **or** adopt the page's documented default
text. Either way the scaffold's highlighted Person example and its `ILLUSTRATIVE-EXAMPLE` marker
must be deleted in BOTH languages — convention check **M11** fails a release branch while present.
Emit run-log step `5.4b security-privacy-decision`.

**Transferred content must not re-add title headings (M10).** The publisher renders the page title
as the section heading; a migrated page whose first heading repeats its title (or a parent
heading) fails convention check **M10**. Strip such headings during transfer — the pre-v0.8 sandbox
migrations shipped several.

**Chrome the migration inherits and leaves alone:** NUM-DIZ is the DEFAULT corporate design
(template ≥ v1.0 of the ig-template; a module opts back to the MII design only with
`input/data/brand.json` `{"design":"mii"}`); the publisher/© line is NUM-DIZ with a matching `.po`
unit (this OVERRIDES §2.2's source-wins rule for the `publisher` field — and in a *re*-migration
the stale publisher unit in the IG-level `.po` must be updated by hand, because the
title-catalogue generator preserves foreign units verbatim); highlight boxes use the
`ig-highlight*` classes (`mii-highlight*` still renders as a
deprecated alias — new/edited content uses `ig-*`); scaffold pages link repository files via the
`{{GITHUB_ORG}}/{{REPO_NAME}}` placeholders the first-run bootstrap fills. None of these is a
migration surface; do not rewrite them.

**Two template refs in a re-migration — name the axis (P2 reads `ref=`).** A module carries TWO
template coordinates: the module-template REPO tag whose page STRUCTURE it implements (what
`--template-latest` and check P2 compare), and the ig-template PACKAGE it vendors under
`ig-template/` (what the rendered `Templates:` line and check P1 compare). A re-vendor line that
writes `ref=v1.2.1` (an ig-template tag) makes P2 report a false divergence against the
module-template release — measured on the 2026-08-15 Dokument re-migration. Write the `5.2
skeleton-vendored … ref=<module-template tag>` line for the structure axis, and log the package
re-vendor as its own 5.2 line naming the ig-template tag explicitly.

**Presentation parity with the template's index (measured on five try-runs, user-decided
2026-08-20).** Authors and contacts on `index.md` are SIMPLE LISTS (one `*` item per person),
never separator-joined run-in lines; the disclaimer is PROSE SENTENCES, never a bullet list —
follow the template scaffold's own index style in both languages. **Translation-marker wording:**
the template's `language-model-check.sh` fails any EN-tree prose asserting German as "the
source"/"original" — write the provenance as `machine translation of source page <name> (de)`,
never "of the German source" (21 markers tripped the check on the Studie try-run).

**Every presentation adaptation is REVERTIBLE and REPORTED.** Style fixes of this kind go into
ONE dedicated commit, and the report gets an "Applied polish fixes (revertible)" section (the
report template ships it): one row per fix — was / now / revert effect — plus the literal
`git revert <sha>` command. A human confirms each fix or reverts it; the migration never treats
its own presentation judgement as final.

**Menu adaptation in a migration** (measured on the 2026-08-15 Dokument re-migration): take the
template's two menu files at the target tag, then (a) DELETE the `rendering-artifacts.html` entry
— step 3 deletes the demo page, and the shipped menu still lists it; (b) for every optional page
the migration DECIDES, strip the "(optional)" label suffix and the per-entry `OPTIONAL` comment
(they mark the *undecided* state); (c) delete the entries of removed optional pages in BOTH
languages. `translationinfo` is deliberately in no menu — the base template's translation banner
links it on every translated page; do not add it (and the verifier's C5 exempts it). Advisory for migrated prose: the template's "MII" naming
policy (MII only in proper names/identifiers and past-tense provenance — `docs/page-structure.md`)
applies to scaffold text; flag migrated source prose that names MII as an ongoing acting
institution as `TODO:REVIEW` rather than rewriting normative content.

## 9c. Gate 0 — the REQUIRED pre-flight analysis of the unmigrated source

Before step 2, run the sibling `fhir-ig-analysis` on the SOURCE tree (the sibling-skill check of
§5.6a applies here too — WARN `sibling-skill-unavailable:` and fall back to the equivalent manual
measurements, never install anything):

```bash
bash "$ML" run 1 preflight-analysis --emits-runlog -- \
  python3 "$ANALYSIS_SKILL_DIR/scripts/ig-stats.py" analyze <source-root> \
    -o migration-log/preflight-analysis.json
```

Its sections REPLACE ad-hoc counting downstream — one instrument, measured twice (pre-flight here,
same-module comparison in step 7):

| `preflight` aspect | Feeds |
| --- | --- |
| `artifacts` counts per type, incl. the open `other` bucket | the MEASURED M9 decisions (§9a: 0 → remove, > 0 → keep) and `capabilitystatements == 0` → the §9b suggestion path. Every `other` row (ConceptMap, Measure, ObservationDefinition, …) is an artefact class the §9a page set does NOT model — each needs its own placement decision, named in the report |
| `artifacts.generated_crosscheck.mismatches` | the trustworthy type counts: FSH declarations only know InstanceOf NAMES (25 SDC Questionnaires typed as examples on PROs); where generated resources exist, THEIR resourceType census is authoritative for M9 and page decisions |
| `canonical_space.special_url_prediction` | the `special-url` list (out-of-space urls + id↔url mismatches; measured 12 on Studie — exactly the hand-built list) |
| `canonical_space.config_contradiction` | a §2.1.4 identity-ledger contradiction row: sushi-config vs package.json canonicals disagreeing (measured: PROs' package.json carries a modul-dok canonical) — Gate A decides, upstream is told |
| `licence.evidence` / `declared_anywhere` / `contradictory` | the §2.2 licence tiers and their Gate-A items |
| `dependency_health` (incl. `dependency_block_present`/`_unparsed`) | §2.1 dependency carry-over: old-style packages to expect SUSHI to rewrite, the THO/extensions injection risk, external parents to resolve. `_unparsed=true` is a PARSER finding — never read it as a dependency-free source |
| `package_layout` (`.index.json` presence, nested resource dirs) | shape handling: an index-less or nested package (Kardiologie) starves flat globs and index-based oracles — counts must come from the recursive census |
| `narrative_sources` (`dual_source`, per-tree last commits) | the §5.1 authoritative-narrative decision: dual sources are decided by freshness, recorded as a `decision` line, never by rank |
| `qa_baseline` (`None` ⇒ obtain it) | the report's "pre-existing error" proof — build the unmigrated source or fetch its rendered qa BEFORE claiming provenance |
| `narrative` / `direktiven` | step 5's mapping effort and the §9 page mapping |
| `analyzed.project_root_nested` | the §5.1b nested-root re-rooting (`shape=A (nested at <path>)`) — the migration MUST adopt the same root the analysis measured |

The report's L0 box quotes the pre-flight numbers (artifact counts, page count, directive count,
special-url prediction, licence state) — the human's scope picture BEFORE any Gate work starts.
A pre-flight that could not run is a WARN in the log and a ① item, never silently skipped.

## 9d. Derived content is marked IN the guide, not only in the report

**A migration does not only carry text; it writes some. The text it WROTE is marked where it
renders**, so a Gate B/C reviewer meets it in place instead of only in a report they read once.
Measured on the PROs try-run: the report described five machine-translated pages while the tree
carried eight `TODO:REVIEW` hits in seven files — report and tree disagreed because nothing tied
them together.

**The marker shape**, in `input/pagecontent/*.md` and `input/intro-notes/*.md`:

```text
<!-- DERIVED:<kind> source=<source-page|none> gate=<A|B|C> -->
> **Written during migration - review before release.** <the text>
{: .ig-highlight .ig-highlight-blue}
```

The HTML comment is the machine-readable half; the blockquote plus the attribute line render the
visible box. `.ig-highlight` and `.ig-highlight-blue` already exist in the ig-template (§9a — `ig-*`
is the current spelling, `mii-*` the deprecated alias), so this styles nothing new.

**The kinds are a CLOSED set, and every one of them describes text the migration wrote:**

| `kind` | Marks | Gate it usually routes to |
| --- | --- | --- |
| `summary` | condensed or reworded from one or more source passages | B |
| `bridge` | connective/intro text written to join merged sections | B |
| `suggestion` | content proposed where the source had none — the §9b CapabilityStatement is the standing example | A |
| `stand-in` | an invented value pending confirmation: approval date, contact, topic code | A |
| `no-source` | a default-language page produced where the source ships no counterpart | C |

`source=` names the source page exactly as `migration-log/page-map.tsv` names it, or the literal
`none` for `suggestion` and `stand-in`, which by definition have none. `gate=` routes the item to
the human who owns it — **A** identity and values, **B** narrative, **C** language — and the gate
follows the ITEM, not the kind: a `summary` whose only open question is its English wording is a C.

**What is NEVER marked, and why.** Verbatim carry-over, MOVED content, SPLIT content (the same words
in a new location, §9a) and the routine per-language mirror carry no marker. None of them is written
content; they are conserved content, and C4/C6 already prove where they landed (§11.2). The reason
to be strict here is **box fatigue**: mark the mirror and every page in both trees opens with a box,
at which point the boxes stop being read and the five kinds above lose the only property that makes
them worth having. A marker on everything marks nothing.

**Bilingual rule.** A marker exists in BOTH language mirrors of the same page, with the same `kind`
and the same `source=` — identical semantics to the template's M11 rule for `ILLUSTRATIVE-EXAMPLE`
(§9a). A box that appears in `en/` and not in `de/` tells the two reviewers different things about
the same paragraph.

**Publication is a human decision, and this rule does not pre-empt it.** Markers are review items, not
defects: nothing in this skill refuses a release because they remain, and no check fails merely because
a page still carries one. What the tooling owes the human is that every marker is visible in the guide,
listed in the ledger and traceable to its source — the question of whether any may remain at publication
belongs to Gate D, which decides it and records the decision in the report.

**The machine artefact.** `migration-log/derived-content.tsv`, one row per marker, header:

```text
page	lang	kind	source	gate	line	excerpt
```

`excerpt` is the first 120 characters of the marked block with tabs and newlines collapsed to single
spaces — enough for a reviewer to recognise the paragraph in a list without opening the file. Rows
are written as the markers are written, during step 5, never reconstructed at the end.

**Report queue ② is GENERATED from that file.** This is §10.6's rule — the report is produced from
the record, not from recollection — extended from the log to the tree: the review queue's
derived-content groups come from `derived-content.tsv`, and a queue entry with no row behind it is a
defect in the report. One artefact, two consumers, no memory in between is exactly what the PROs
discrepancy above lacked. The typed marker and `TODO:REVIEW` coexist and answer different questions
— `TODO:REVIEW` says a human must look here, `DERIVED:` says these words were written by the
migration and names what kind — and one block may legitimately carry both.

## 9e. Page routing and presentation (where content goes, and what the host looks like)

**Where a source page's content goes is decided per source page BEFORE any of it is written — and
it is measured, not judged: `scripts/page-structure-advice.py` GENERATES the decisions as
`migration-log/page-map.tsv` (`--map`, v2 columns — §9f) and VALIDATES the map's coverage, a human
reviews it, and only then does step 5 consume it.** Measured on the PROs try-run, routing by judgement
produced `researcher-guidance.html` at **6214 words across 147 headings** (58 `h3`, 84 `h4`, zero
`h2`), four heading titles repeated on the same page, and 13 numeric-suffix anchors of the
`#overview-2` kind. The anchors are the part that does not merely read badly: the publisher numbers
them by order of appearance, so adding one sibling section renumbers every later anchor, and the
German mirror renumbers independently — the two languages' deep links cannot be kept in
correspondence at all.

**The routing rule — what the generator mechanizes.** Applied in order; the first branch that
matches wins:

1. Content about ONE artefact (one questionnaire, profile, extension, operation) →
   `input/intro-notes/<Type>-<id>-intro.md` plus its per-language mirror (§9's per-profile row).
   **No page, no menu entry, no `pages:` row, no `.po` unit** — and this holds regardless of how
   large the family is.
2. A family or group overview → an `h3`/`h4` section on an artefact index page that ALREADY exists
   in the agreed menu (`profiles.md`, `logical-models.md`, …). No new page.
3. An agreed page already owns the concern (`uml-diagrams`, `logical-models`, `changes`, `index`,
   `security-and-privacy`) → merge into it, subject to the size gate in 5.
4. Cross-cutting narrative → it becomes a page. Then TWO further decisions:
   - **4a Presentation.** A host page with **3 or more children** becomes a **hub** — a short index,
     one line per child, **at most 250 words** — rather than a merged prose page.
   - **4b Visibility.** Add a menu entry only if ALL of these hold after the addition: total menu
     entries **≤ 33**; the target dropdown ends with **≤ 10** children; the top level stays **≤ 8**;
     menu depth stays **≤ 2**. Otherwise the page is `pages:`-nested under its host and linked from
     it — ToC and breadcrumbs still reach it, and the menu does not grow.
5. **Size gate on any host page.** More than **2500 words**, or more than **4** merged sources, or
   **ANY** repeated heading title → re-run the routing preferring branches 1 and 2, or split. Three
   countable numbers; none of them is a matter of taste.

**The semantic half of the routing is a TABLE, not prose:**
[`references/routing-table.tsv`](routing-table.tsv) mechanizes §9's section mapping as
`pattern⇥target⇥note` rows — patterns are lowercase compacted tokens (alphanumerics only; German
aliases included, and since compaction strips umlauts, `ae`/`oe`/`ue` spellings appear both ways
where needed). A source page whose compacted slug OR compacted title CONTAINS a pattern (≥ 3
chars) routes to the named target home — consulted AFTER the exact agreed-page match and BEFORE
artefact-anchor matching, so a `KontextImGesamtprojekt` page lands on `implementer-guidance` (§9's
Bezüge row) instead of wherever an artefact name happens to echo. Extending the semantic mapping
means adding a table row, which the next generated map picks up — never a hand-edit of one map.

**The generated map is VALIDATED for coverage before anything consumes it.** The source page
universe is the authoritative guide tree (§5.1a) ∪ `input/pagecontent` ∪ on-disk pages no toc
lists ∪ the step-2c harvest manifest (§5.1d — the shape whose narrative exists only on the
rendered guide; `--harvest-tsv`, auto-discovered from the target's `migration-log/`, and when no
other input yields pages the harvest IS the primary input); every member must have a row with a
non-empty target, a toc entry whose page is not on disk is a finding (dangling), a page the
harvest SKIPPED is in the universe with no routable content — coverage fails until the harvest is
clean or a human retires the page in the reviewed map — and a `RETIRED` row must carry a reason. The generator exits 1 until that
holds — an uncovered map is not reviewable, let alone consumable — and proposes the M9 and
other-bucket placements (§9a) in the same pass, from the Gate-0 counts.

**Where the menu numbers come from.** Surveyed across published IGs: MII Basis 26, Genomics
Reporting 26, SDC 31, US Core 33, mCODE 33, `ig-guidance` 35 entries — 33 is the top of the range
real readers navigate, not an invented ceiling. And **every IG-Publisher IG surveyed caps menu depth
at 2**: the module template supports ONE sub-menu level and Bootstrap 3 renders no third, so a third
level is not a crowded menu, it is an unreachable page (the C5 defect, §11.2).

**Every decision is logged, one line per source page — and the lines come from the GENERATOR's
output, never from a hand count** (§10.2 format, alongside §9a's `5.4a` and `5.4b`; the run that
writes the map IS run-log step `5.4c` — SKILL.md step 5 has the invocation):

```text
5.4c  page-routing  source=<source page> branch=<1|2|3|4|5> target=<path> measure=<what forced it>
```

For branch 4 the line also carries `presentation=<hub|prose>` and `visibility=<menu|nested>`, the two
decisions 4a and 4b. The `measure=` token is not optional: "chose branch 2" is an assertion,
`words=2731 gate=2500` is a decision a reviewer can check — the generator fills it from its own
measurements. **Where the menu budget forced ToC-nesting instead of a menu entry, that is also a ①
queue item** — the budget is a default, and a human may decide to spend it differently, by editing
the reviewed map (§9f).

**Interlock with §9d.** Branches 2 and 4a make the migration WRITE text — family overviews, hub
one-liners, the bridges between merged sections — so every such block carries a `DERIVED:` marker
(`summary` or `bridge`) and a row in `derived-content.tsv`. Content merely MOVED or SPLIT carries
none: routing decides where words go, §9d marks only the words the migration added.

## 9f. The map is the contract

**Generate — validate — bind.** `migration-log/page-map.tsv` is the binding intermediate of the
whole narrative migration, in its machine form: **step 3 GENERATES and VALIDATES it** — the §9e
advice run, the structural rule plus [`references/routing-table.tsv`](routing-table.tsv),
coverage-checked against the full source page universe, exit 1 until covered — a human **reviews
and edits the file itself** before anything consumes it (the review has a machine form, not a
conversation), **step 5 CONSUMES ONLY it** — a source page with no row is not written, and a row
step 5 leaves unhandled is a defect the report must carry — and **step 8 CHECKS against it** (C3
and C6, §11.2). No routing decision lives anywhere else: extending the semantic mapping is a
routing-table row the next generated map picks up, overriding one page's route is an edit to the
reviewed map, and the run log's `5.4c` lines are the generator's own output (§9e), never a hand
count.

**page-map v2 columns** — backward compatible: a v1 parser (the verifier included) reads columns
0–2 and ignores the rest.

| Column | Carries |
| --- | --- |
| `source_page` | path relative to the narrative source root (guide tree or `pagecontent`), or the harvested file's name for a step-2c-harvested page |
| `target` | repo-relative target path (`input/pagecontent/x.md`, `input/intro-notes/<Type>-<id>-intro.md`) — or `RETIRED` |
| `reason` | one human clause; REQUIRED on every `RETIRED` row |
| `branch` | the §9e routing branch, `1`–`5` |
| `measure` | the measurement that forced the branch (`words=… gate=…`, the matched routing-table pattern, …) |

## 9b. The CapabilityStatement: absence, suggestion, and inline rendering

Measured across five try-runs (2026-08-20): sources ship CapabilityStatements inconsistently —
Studie ships one, Consent ships **none** — and the template's `capability-statements.md` page is
mandatory (1..1), so an absent CS left a stub page in a shipped preview.

**Detect absence mechanically:** count `CapabilityStatement` resources in the built package
(`fsh-generated/resources/CapabilityStatement-*.json`). Zero is a finding, never a silent stub.

**When the source ships none, SUGGEST one — clearly marked, never silently authored.** This is a
second sanctioned exception to guardrail 3 (like machine-translated default-language pages),
because every element traces to a package artifact:

- `fhirVersion` from the source `sushi-config.yaml` (`fhirVersion`, e.g. `4.0.1`);
- `rest.mode = server`; one `rest.resource` entry per FHIR type the module profiles, each with
  `supportedProfile` = the module's profile canonicals for that type;
- one `rest.resource.searchParam` entry per SearchParameter the module ships for that type
  (name, canonical `definition`, `type` — read from the SearchParameter resources);
- `status = draft`, and a `description` that SAYS it is a migration-generated proposal.

Write it as FSH (`input/fsh/CapabilityStatement.fsh`), log it as
`5.3 capabilitystatement-suggested`, put it in the report's ① queue — the module team confirms,
amends or deletes it at Gate A — and mark the page `TODO:REVIEW`. The `capability-statements.md`
page then states explicitly that the source declared no CapabilityStatement and that the rendered
one is a migration proposal.

**Render the CS INLINE on `capability-statements.md` — never only a link.** The publisher
generates a rendered-narrative fragment `CapabilityStatement-<id>-html.xhtml` (verified against
the generated `_includes` on the 2026-08-20 Studie try-run; the bare `<id>.xhtml` name does NOT
exist and fails Jekyll hard). Use
`{% raw %}{% lang-fragment CapabilityStatement-<id>-html.xhtml %}{% endraw %}` so each language
page renders its own variant — a link alone costs the reader an extra click for the page's whole
point (user decision, 2026-08-20).

## 10. The run log (normative)

**What the run log is for, in one sentence: so that a human reader can reconstruct which steps ran
and what each one produced — the command actually executed, the counts it actually returned, the
status it actually exited with — without re-running anything and without trusting anybody's
recollection.** Writing the report from recollection at the end lets it drift from what actually
executed; that has already produced two documented false claims in this project's history. So the
log is the primary record, the report's protocol section is generated **from** it (§10.6), and a
step that emitted no line did not happen as far as a reviewer is concerned.

Everything below follows from that: every step emits at least one line (§10.2, §10.3); a tool that
succeeds while under-producing is called out rather than averaged away (§10.4); and §10.5 is the
bundled helper that makes both affordable — including for the many steps that run no bundled script.

### 10.1 Where it lives

`migration-log/run.log` in the module repository being migrated, alongside the other run artefacts:

```text
migration-log/
  run.log                  the run log — plain UTF-8 text, append-only, committed
  migration-report.md      the report (§5.7), whose protocol section is generated from run.log
  source-inventory.json    §5.1
  gofsh.log                raw tool output, referenced by path from run.log (shape B)
  <action>.log             per-step raw tool output, one file per ACTION, written by
                           the helper's `run` wrapper — sushi-before.log, sushi-after.log,
                           qa-build.log, fql-scan.log … Each is named by the run.log line
                           that produced it, so a claim in the log can be checked against
                           the tool output it came from. TRUNCATED PER INVOCATION: it holds
                           the CURRENT run of that ACTION, never every attempt concatenated
                           — otherwise a read-back of it (§5.1b.2) sums two runs.
  <action>.prev.log        the immediately preceding attempt, rolled over by `run` so a
                           re-run does not destroy what the last one produced; named in the
                           new run's `start` line as `prev_raw_log=`.
  menu-titles-de.txt       working seed for §5.5 (how to produce it: §5.5)
```

`run.log`, `migration-report.md` and `source-inventory.json` are **committed with the migration
branch** — they are the audit trail the pull request is reviewed against. The raw tool logs and
working files may be committed or not; either way they are referenced from `run.log` by path, and a
referenced file that is absent from the branch is named as such in the report.

**Naming note.** This directory used to be called `.ai-log/`. It was renamed because it is a
human-facing audit artefact, not a machine's scratch space, and because "AI" framing is being removed
from these projects. **Repositories migrated before the rename still carry `.ai-log/`. Leave them
alone** — do not rename, move or dual-write them: the old directory is part of a merged, reviewed
history, and rewriting it would invalidate references from pull requests and reports that cite it.
A re-migration of such a repository writes the new directory and says in its report that an older
`.ai-log/` exists.

### 10.2 The line format

One event per line. Fields are separated by **exactly two spaces**:

```text
<TIMESTAMP>  <LEVEL>  <STEP>  <ACTION>  <DETAIL>
```

| Field | Form | Notes |
| --- | --- | --- |
| `TIMESTAMP` | `YYYY-MM-DDTHH:MM:SSZ` | UTC, second resolution, ISO 8601 |
| `LEVEL` | `INFO `, `WARN `, `ERROR` | padded to five characters, so the columns line up |
| `STEP` | the spec section, e.g. `5.1b.3`, `5.4`, `2.1`; `pre.<n>` for a precondition | one identifier, no spaces |
| `ACTION` | a kebab-case slug naming what was done, e.g. `gofsh-convert` | stable across runs, so a step is greppable |
| `DETAIL` | free text plus `key=value` tokens | see below |

`DETAIL` carries, for anything that ran, **the command actually executed** as
``cmd=`…` `` — the real command line, not a paraphrase or a placeholder-bearing template — and its
**measured outcome** as `key=value` tokens: `exit=`, counts (`files=`, `errors=`, `units=`), and
paths. Continuation lines are indented **four spaces** and belong to the line above; use them for
lists (findings, names, remediation prose), never for a second event.

Every procedure step emits at least one INFO line. A step that ran no command still emits one
recording its outcome (`pre.2  classify-source-shape  shape=B resources=20 dirs=5`).

**Do not hand-assemble these lines.** `scripts/migration-log.sh` (§10.5) emits the format, including
the timestamp, and appends to the run log itself. Hand-formatting is how a timestamp ends up local
instead of UTC and a level ends up unpadded.

**Reading it back.** The log is complete rather than curated — the bundled scripts list every change
they made, and that verbosity is the point on review day. Two filters make it navigable:
`grep -E '  (WARN |ERROR)  ' migration-log/run.log` for everything a human must look at, and
`grep -F 'silent-partial-success:' migration-log/run.log` for the §10.4 class alone. Each WARN class
carries its own leading token so the classes stay separable — `silent-partial-success:`,
`count-above-expected:`, `anticipated-nonzero-exit:`, `exit-status-truncated:`,
`exit-status-disagrees:`, `stale-raw-log:` — and `  run-boundary  ` splits the file by invocation.

### 10.3 Levels

- **INFO** — a step ran; here is its measured outcome. Facts only, no interpretation.
- **WARN** — the run continues, but a human must look. Mandatory for the silent-partial-success rule
  (§10.4) and used for: an identity divergence between source and template, an empty `msgstr`, a
  template file skipped on a name collision, an applied default, an `[UNKNOWN]` directive.
- **ERROR** — the step did not meet its acceptance criterion. Either the run stops, or the item
  becomes an entry in the report's ① decision queue. An ERROR is never left only in the log.

A non-zero exit that is the step's **documented, anticipated** outcome is a WARN, not an ERROR — the
criterion is met AS QUALIFIED (§5.1b.4). It is marked as such at the call site with
`run --expected-nonzero WHY` (§10.5), never by weakening the ERROR text, and it still owes the ①
queue an entry per item. The one instance in this specification is the shape-B `sushi-after` run.

### 10.4 The silent-partial-success rule (mandatory WARN)

**Whenever a tool reports success while producing less than its input implies, the step MUST emit a
WARN naming both numbers.** Exit code 0 is not evidence of completeness; the counts are, and the
reconciliation has to be visible in the log rather than performed in someone's head.

The canonical case is goFSH without `-t json-and-xml`. It exits 0 and prints "0 Errors" while
converting **one** of the twenty input resources. The log must show both facts, adjacent — this is
the verbatim output of the §5.1b.2 block on the reference module, no-flag variant:

```text
2026-08-05T22:29:04Z  INFO   5.1b.2  gofsh-convert  goFSH RESULTS table  profiles=0 extensions=0 logicals=0 resources=0 valuesets=0 codesystems=1 instances=0 invariants=0 mappings=0 aliases=1  gofsh_log=migration-log/gofsh.log
2026-08-05T22:29:04Z  INFO   5.1b.2  gofsh-convert  converted 1 of 20 inputs  expected=20 actual=1 exit=0
    goFSH said: warn  13 XML definition(s) found without corresponding JSON definitions (for example, …
2026-08-05T22:29:04Z  WARN   5.1b.2  gofsh-convert  silent-partial-success: converted 1 of 20 inputs at exit 0
    Exit status is not evidence of completeness; these two counts are.
    Reconcile against the step-1 inventory before continuing.
```

**Quote goFSH's own number, which is 13, not the input's 19.** The reference module's input carries
19 XML files; goFSH reports "13 XML definition(s) found without corresponding JSON definitions",
because that is what *its* pairing check counts — the difference is six files, exactly the six
`SearchParameter`s. Both numbers are true of different things, so name which is which whenever both
appear: 13 = XML definitions without a JSON counterpart *as goFSH counts them*; 19 = XML files in the
input. The number the reconciliation actually turns on is neither: it is **1 converted of 20 inputs**.

The INFO line alone is not enough — a reader scanning for problems filters on WARN and ERROR, and
"converted 1 of 20" reads as a normal count until something calls it out. The WARN detail **starts
with the literal token `silent-partial-success:`** so the whole class is greppable:
`grep -F 'silent-partial-success:' migration-log/run.log`.

**Why this rule needs a mechanism and not just a paragraph.** Measured on the reference module, the
no-flag run end to end: goFSH exit 0, "0 Errors"; `postprocess-gofsh.py` exit 0, "nothing to repair";
SUSHI exit 0, 0 errors. **Every step reports success, and 19 of 20 resources are simply absent.**
The single line in the entire log that says otherwise is the WARN above. A rule that depends on
somebody remembering to compare two numbers by hand does not fire on the run where it matters — so
§10.5's `ratio` helper performs the comparison, and the block in §5.1b.2 calls it.

Other instances of the same class, all implemented in the bundled scripts: a scan whose target
directory contributed zero files while the run continued; a page-title catalogue written with empty
`msgstr` units; a repair pass that found none of the references the goFSH log said it would.

### 10.5 Emitting the log — `scripts/migration-log.sh`

A convention nothing implements is decoration. The bundled helper is what turns §10.2–§10.4 into
lines on disk; **wire every stage through it**, including the ones that run no bundled script. It is
both a sourceable library and a CLI, because an agent's shell state does not survive between tool
calls:

```bash
ML="$SKILL_DIR/scripts/migration-log.sh"

bash "$ML" begin "step 2b — Path B on $SRC"
bash "$ML" info 2.1 read-identity "packageId=…  canonical=…  license=CC0-1.0 (source) vs CC-BY-4.0 (template)"
bash "$ML" warn 2.2 identity-divergence "license differs; source wins (§2.2) — Gate A decides"
bash "$ML" ratio --exit 0 5.1b.2 gofsh-convert converted inputs 20 1
bash "$ML" run  5.4 fql-scan --emits-runlog -- bash "$SKILL_DIR/scripts/fql-scan.sh" --strict
```

| Subcommand / function | What it does |
| --- | --- |
| `begin [LABEL]` | one numbered `run-boundary` line, so a second invocation's lines do not concatenate into the first's. Call it once, first, in every block |
| `info` / `warn` / `error` STEP ACTION DETAIL [CONT …] | one §10.2 line plus indented continuations; appends to the run log **and** echoes to the terminal |
| `ratio [--exit N] STEP ACTION VERB NOUN EXPECTED ACTUAL [CONT …]` | the §10.4 rule: an INFO naming both numbers, plus a `silent-partial-success:` WARN when ACTUAL < EXPECTED (and a distinct `count-above-expected:` WARN when it is greater, which must not pollute a grep for the former) |
| `run STEP ACTION [--emits-runlog] [--raw-log FILE] [--expected-nonzero WHY] -- CMD …` | runs CMD, writes its output to `migration-log/<ACTION>.log` (**truncated per invocation**), logs the command **actually executed** and its **measured exit status**, ERRORs on non-zero — and **returns the command's real exit status** |

**The run log is append-only; the raw logs are not.** That difference is deliberate and is the fix
for a class of defect rather than one instance of it. `run.log` accumulates, because it is the audit
trail — which is exactly why `begin` exists, to mark where each invocation starts within it. A raw
log named `<ACTION>.log` is instead the output of the run whose lines sit beside it, so appending
made every read-back of one wrong on a re-run (§5.1b.2's summed RESULTS tables) and made
`raw_log_lines=` the total of every attempt. `run` truncates it and rolls the previous attempt over
to `<ACTION>.prev.log`, naming it in the start line as `prev_raw_log=`.

**An exit status is eight bits.** The shell reports `status mod 256`, so a tool whose status IS its
error count — SUSHI's is — reports 0 for exactly 256 errors and 5 for 261. Measured: a probe exiting
256 logged `exit=0` and returned 0. Nothing can recover the real number from the status afterwards,
so `run` cross-checks it against the `N Errors` line the tool printed and WARNs when the two
disagree: `exit-status-truncated:` when the printed count is congruent to the status modulo 256 (the
truncation case, proven), `exit-status-disagrees:` when a zero status stands against a non-zero
printed count. Both are distinct greppable tokens and neither pollutes `silent-partial-success:`.

**`--expected-nonzero WHY` marks an anticipated non-zero exit.** Exactly one step in this
specification has one — the shape-B `sushi-after` run, whose residual unresolvable-parent errors are
a §5.1b.4 Gate-A escalation. Without the flag `run` told its reader that this documented outcome
"did NOT meet its acceptance criterion", which is both wrong and corrosive: a log that calls its
expected result a failure teaches its reader to skim past every ERROR. Marked, the step logs a WARN
beginning `anticipated-nonzero-exit:` and carrying the reason and the §5.1b.4 pointer — the
acceptance criterion is met AS QUALIFIED, the items behind it still go to the ① queue individually,
and the status is still returned verbatim. Genuine failures keep the unchanged ERROR, and a marked
step that exits 0 says so on its `done` line rather than confirming a stale anticipation in silence.

**`run` exists because `tee` throws the exit status away, and the acceptance criteria in this
specification ARE exit statuses.** A pipeline's status is its *last* command's, and `tee` succeeds:
under the previous convention `… 2>&1 | tee -a migration-log/run.log`, a step that failed read as a
step that passed. Measured: `postprocess-gofsh.py` on a too-narrow `FSH_DIR` exits 1, the tee
pipeline reported 0; `npx --yes fsh-sushi@3.20.0 .` on raw goFSH output exits **41**, the tee
pipeline reported 0. `run` takes the status from `PIPESTATUS[0]` and returns it, so `$?` after it is
the tool's own. Do **not** pipe the helper's own output into `tee -a migration-log/run.log`: it
writes that file itself, and a `tee` on top duplicates every line.

`--emits-runlog` says the wrapped command already prints §10.2-format lines — `postprocess-gofsh.py`,
`gen-page-title-po.py` and `fql-scan.sh` do, with the spec section as `STEP` (5.1b.3, 5.5, 5.4) and
their own name as `ACTION`. Their output is then appended to the run log as well as to the raw log,
so tool and skill output read as one stream and their WARNs reach §10.6's queues. Without the flag
only the wrapper's lines reach the run log and the raw output is referenced from them by path.

**One execution, one `start`, one `done`, one `cmd=`.** Those three scripts emit their own `start`
and `done` lines, and through `run` that produced a second pair per execution, with a *different*
`cmd=` (the script's own name against the wrapper's full interpreter command line) — two openings and
two closings a reader has no way to reconcile into one run. `run` therefore exports
`MIGRATION_LOG_WRAPPED=1`, and a wrapped script demotes its own two lines to `params` (its resolved
arguments, no `cmd=`) and `result` (its measured counts). Run directly — still supported, and how the
scripts are unit-tested — nothing changes.

**Chronological by construction.** Every line is appended by the helper with a single `>>`, so
ordering does not depend on how streams are later merged. The three bundled scripts keep the
INFO/WARN-to-stdout, ERROR-to-stderr split — but they now **flush every line**, because stdout is
block-buffered when it is a pipe while stderr is not: measured before the fix, an ERROR written last
appeared *first* in the captured log, ahead of INFO lines emitted seconds earlier. A log that claims
to read as one chronological stream has to actually be one.

**Seven bundled scripts take the other route: they `source` this helper as a library** —
`gofsh-results.sh` (§5.1b.2), `package-identity.sh` (§2.1.1, §5.1b.1a), `repo-identity.sh` (§2.1.2),
`parent-snapshots.sh` (§5.1b.5), `simplifier-discover.sh` (§5.1c.6), `guide-harvest.sh` (§5.1d.2)
and `sibling-skill-check.sh` (§5.6a) — so their lines are emitted by the same code that emits
everyone else's rather than hand-assembled. **Call those seven directly, never through
`run --emits-runlog`:** they already write
`run.log` themselves, and the
wrapper's `tee` into it would duplicate every line. The distinction to remember is not which
language a script is written in but where its lines come from: a script that *prints* §10.2 lines is
wrapped with `--emits-runlog`; a script that *calls* the helper is not wrapped at all.

Where the log is written is `$MIGRATION_LOG_DIR/run.log`, default `migration-log/run.log`; set
`MIGRATION_LOG_DIR` for a repository that still carries `.ai-log/` (§10.1).

### 10.6 The report is generated from the log

**Rule: the migration report's protocol/audit section is produced FROM `migration-log/run.log`, never
written from recollection.** Concretely:

- Every claim in the protocol section traces to a log line. A claim with no line behind it is a
  defect in the report, and the fix is to re-run the step, not to add the sentence.
- The protocol section is the log grouped by `STEP`, in step order, each group followed by that
  step's acceptance verdict (met / not met / met-as-qualified per §5.1b.4).
- Every WARN and ERROR in the log appears in one of the three reviewer queues — a WARN that reaches
  nobody is the failure mode this convention exists to prevent.
- Tool versions, pins and the `-d` set are read out of the `cmd=` tokens, not restated from memory.

The counts elsewhere in the report — artefact totals, QA findings, translated units — come from the
same lines. Where the report and the log disagree, the log is right.

### 10.7 The log is also READ BACK, mechanically (§11.6)

The report is not the only consumer. The verification phase reads `run.log` as a **second oracle**
beside the target tree: the log records what each step *intended and measured*, the tree records the
*outcome*, and a class of defect exists only in the gap between them (the log says 20 converted, the
tree holds 19). Four things are checked there and nowhere else — an unactioned
`silent-partial-success:` WARN, a step that emitted **no line at all**, an open
`identity-contradiction:`, and the log-versus-artefact count cross-checks.

Two consequences for this section. First, "every step emits at least one INFO line" stops being an
aspiration: [`references/expected-steps.tsv`](expected-steps.tsv) lists the steps whose silence is a
finding, and §11.6's L2 check enforces it. Second, two conventions become load-bearing and are
therefore normative here:

- **`resolved: …`** — an INFO on the SAME ACTION as a `silent-partial-success:` WARN, stating how it
  was resolved. Without it (or a later equal ratio) the WARN reads as never acted on, which is
  exactly what L1 reports.
- **`decision: … field=<name> …`** — an INFO closing an `identity-contradiction:` by naming the field
  and the value a human chose. It records the decision; it never makes one.
- **`5.2 skeleton-vendored … ref=<tag> commit=<sha>`** — the template ref the skeleton came from.
  P2 reads the provenance of the vendored template out of this line and nowhere else.

## 11. The verification phase (normative)

**A verification step that cannot fail is decoration.** Until this section existed, §7's Definition
of Done was a list of sentences a human was asked to perform — "every placeholder accounted for",
"the German pages render", "every step appears in the log". Four real migrations (Dokument, Person,
Consent, Labor) passed that checklist with a green build, and every defect below survived it:

| Defect, as measured | Why the build and the checklist both missed it |
| --- | --- |
| Artefact pages a rendered variant's `artifacts.html` does not list | The artefact SET comparison passes — they are *present*. **Reachable** is a different property, and nothing checked it. |
| A rendered IG whose header names one template version while the tree carries another | Nothing compared the RENDERED output against the tree it was built from. Same class as a `demo/v0.5.1` directory whose pages read "Preview v0.5.0". |
| Dokument renders `Unknown region code '276'` in `<div id="ig-status">` | `qa.txt` reports zero errors for it; no human reads every page header. |
| An FSH parse error stopped SUSHI reading a file while it still EXPORTED the instance (nested provisions 1/1/1 before repair, 6/27/3 after) | Zero errors reported for those files. |
| goFSH converted 1 of 20 inputs at exit 0, "0 Errors" | Exit status is not evidence of completeness; only the counts are. |
| A parent resolved from `dist-tags.latest` 2.0.3 where the source pinned 2.0.2 | Everything builds. A pin is only wrong against the source's pin, which nothing read. |
| The template's literal `license: CC-BY-4.0` shipped over a CC0-1.0 module | It is not a `{{placeholder}}`, so the placeholder gate never sees it. |

So: `scripts/verify-migration.py` **runs the checks and exits non-zero**, and §7 is met by its exit
status rather than by assertion.

**What the row above does NOT say — measured 2026-08-07, and corrected here rather than quietly.**
The reachability row states a *class*, not a finding against the four migrations. On all four, every
per-language `artifacts.html` lists every generated artefact, Consent's six SearchParameters
included (Consent renders 30 `SearchParameter-*.html` files: 6 artefacts × 5 publisher views —
bare, `-testing`, `.change.history`, `.json`, `.xml` — and only the bare page belongs in an index).
A first version of the checker read the multi-language build's ROOT as a rendered variant and
reported the opposite on all four; §11.5a says why that is wrong and what the rule now is. The class
is real and C2's negative control fires on it (remove one link, one DIVERGIERT row); the four
migrations simply do not exhibit it.

```bash
bash "$ML" run 11 verify-migration --emits-runlog \
  --expected-nonzero 'findings are this step OUTPUT (1 = DIVERGIERT, 3 = NICHT PRÜFBAR)' -- \
  python3 "$SKILL_DIR/scripts/verify-migration.py" \
    --target . --source <unmigrated-source> --rendered output \
    --source-lang de --template-latest <tag of the module template's latest release>
```

→ `migration-log/verification-findings.tsv` (one row per checked subject) and
`migration-log/verification.md` (the block the report takes verbatim, §11.7).

### 11.1 Three verdicts, because two would be a lie

| Verdict | Meaning | Consequence |
| --- | --- | --- |
| **IDENTISCH** | the check ran; the target matches its reference | none |
| **DIVERGIERT** | the check ran and found a divergence, **named**, with evidence | a stop, or a recorded Gate decision — exit 1 |
| **NICHT PRÜFBAR** | the check could **not** run: an input is absent, or the property is a human judgement | **not a pass.** Exit 3, and one ① queue row naming the human action |

The third verdict is the point. A two-valued scheme forces every unmechanisable check to be written
as a pass, which is how "the German pages render" came to be ticked on a migration nobody had
built. Each NICHT PRÜFBAR row carries **why** it could not be mechanised and **who does what**.

### 11.2 Layer 1 — conservation

| Check | What it compares | Fails when |
| --- | --- | --- |
| **C1** artefact presence | source artefact set (source tree by content, or `source-inventory.json`) against `fsh-generated/resources`, matched **by id OR by canonical url** | a source artefact is absent from the target under both identities |
| **C2** artefact **reachability** | every generated resource against each rendered **variant's** `artifacts.html` (§11.5a — the site root is not a variant) | a page is rendered but **not listed**, or a resource has no page |
| **C3** guide-page accounting | every page of the union source set (below) against `migration-log/page-map.tsv` | a page is in no row (MISSING), mapped to a page that does not exist, or "retired" with no reason |
| **C4** narrative text runs | every ≥40-character text run of each source page against the target's corpus **in the source's language** | a run survives nowhere |
| **C3/C4/C6** the target CORPUS | `input/pagecontent` (or the source-language mirror) **plus `input/intro-notes/` and its per-language mirror** — §9 ROUTES the per-profile narrative there whenever a module carries more than two profiles, so a corpus without it reports the whole routed set as lost (measured on the PROs try-run: 13 false C3 rows, and 12-of-12 "lost" runs on a page whose text was present all along). Page-map targets written as PATHS resolve against the same set |
| **C5** navigation and the reverse page question | every `menu.xml` entry against the pages that exist; every narrative page against the menus; every target page against the source set and [`references/template-pages.tsv`](template-pages.tsv) | a menu entry leads nowhere; a page renders but is in **no menu** (reachable only by typing its URL — the C2 defect one level up); a target page traces to neither a source page nor the template; the template's demo page survived step 3. **Manifest-currency tripwire:** the manifest records the module-template tag it was MEASURED at; when that differs from the tag the module vendors (run-log `skeleton-vendored ref=`), C5c downgrades to NICHT PRÜFBAR instead of judging against the wrong page set (measured: two false DIVERGIERT on the Studie try-run, manifest v0.10.3 vs vendored v0.11.0) |
| **C6** content **placement** | where each source page's runs actually landed, ranked, against the page map | the dominant landing page is not the mapped target. Without a page map there is no declared intent to compare against, so the distribution is reported **NICHT PRÜFBAR** with the evidence a human needs — never as a pass |

**C4 and C6 are two different questions, and only the first one is usually asked.** C4 is
conservation — did the text survive *anywhere*. It passes identically for a paragraph that landed
where the migration intended and for one swept into `index.md` because nothing else fitted; the
routing decision (§9) is the part a reviewer must judge, and it is invisible in a C4 pass.

Two definitions are load-bearing. **Present ≠ reachable:** the sibling skill's artifact-set
comparison proves the first and says nothing about the second. And C4 uses **the same run split and
the same normalisation as `guide-page-to-md.py`'s `missing_runs=`**, so the harvest's loss count and
the migration's loss count are comparable numbers rather than two different definitions.

**The source-page set for the whole layer is a UNION, never a fallback chain:** the authoritative
guide tree — chosen by the SAME rule the advice script applies (§5.1a: the highest version in the
source narrative language, `guide.yaml` `version:` as the tiebreak, overridable via
`--source-guide-tree`), so the verifier measures conservation against the tree the routing actually
saw — ∪ the source's `input/pagecontent` ∪ the harvested pages, de-duplicated by basename across the
homes. The old all-or-nothing fallback let ONE SUSHI stub in `input/pagecontent` suppress a 149-page
guide tree (measured on Onkologie, 2026-08-23), and the layer then verified conservation of nothing.
With the union set, C3 accounts **every guide-tree page**; non-authoritative trees (parallel
languages, historical versions) stay out — their content is translation seed, not conservation
reference (§5.1a).

**C1 NAMES AN ARTEFACT BY WHAT IT ACTUALLY HAS.** A canonical resource does not need an `id`
element: six of Consent's SearchParameters carry only a `url`, and the migration legitimately gives
the generated resource a new id (`mii-sp-consent-policyuri` → `MII-SP-Consent-PolicyUri`). So the
key is `Type/id` where there is an id and the **canonical url** where there is not, and the two
sides are matched on whichever the source supplied. A reader that required both a resourceType and
an id silently checked 14 of Consent's 20 entries and reported the result as a pass — proven by a
negative control in which **deleting a real artefact did not make C1 fire**. Whatever the reader
still cannot key (neither id nor url) is **counted and reported NICHT PRÜFBAR by name**, stating the
fraction it did cover. A check may narrow its subject; it may never narrow its subject silently and
call the remainder green.

**`migration-log/page-map.tsv` is a required artefact of step 3 — GENERATED by the §9e advice run
(`--map`) and validated for coverage there, human-reviewed, and only then consumed by step 5
(§9f); it is never written by hand.** The verifier reads the v2 columns `source_page`, `target` (or
`RETIRED`), `reason` and ignores the rest. Without the map C3 is NICHT PRÜFBAR: a migration that
cannot say where each page went has not proved conservation, it has only not been contradicted. Any
of the page's names may be used as the key (harvested file, guide title, URL slug); the checker
resolves all three.

### 11.3 Layer 2 — fidelity

| Check | Fails when |
| --- | --- |
| **F1** identity, field by field (`id`, `packageId`, `canonical`, `version`, `status`, `title`, `license`, `publisher`, `fhirVersion`) | a field differs from the source's. `version` is the one human decision (§2.1) and is reported NICHT PRÜFBAR for confirmation, never as a defect. An unresolved contradiction in the ledger is **not** a source value: it is reported as one, pointing at L3. |
| **F2** dependency pins | a source pin is missing or carries a different version. The source's pins are read from the source tree where `--source` is given and otherwise **from the claims ledger** (`dependency:<name>` rows, or an aggregate `dependencies` row) — see below. A target-only dependency (the template's CRMI requirement is the legitimate case) is NICHT PRÜFBAR; contradicting readings of one pin are NICHT PRÜFBAR too, never resolved by precedence, because an adopted-by-machine pin is the very defect F2 exists to catch. `hl7.fhir.r4.core` is declared through `fhirVersion`, which F1 compares, so it is not expected as a dependency. |
| **F3** `license` explicitly asserted | the declared licence has **no tier evidence** behind it in `identity-claims.tsv`, or the tiers assert something else. Relicensing by default is the quietest defect in this specification: the template's `CC-BY-4.0` is a literal, so no placeholder check flags it. **F3 additionally reconciles the LICENSE *file*** (§2.2): the recognized file text — `Attribution 4.0 International` → `CC-BY-4.0`, `CC0 1.0 Universal` / `Creative Commons Zero` → `CC0-1.0`, `Apache License` → `Apache-2.0`, `MIT License` → `MIT` — against the declared scalar. A mismatch is DIVERGIERT; a file whose text matches no known body is NICHT PRÜFBAR (a human reads it); an absent file is an ok note, the scalar then stands alone. |
| **F4** FSH residue | `.fhir_comments` rules, or a code reference whose system name carries whitespace, remain in `input/fsh` — the two shapes `postprocess-gofsh.py` models. Auto-fixable (§12). |

**F2 MUST NOT DEPEND ON AN INPUT NOBODY SUPPLIES.** It originally read the source's pins only from
an unmigrated source tree, and none of the four real migrations passed `--source` — so the wrong-pin
class was NICHT PRÜFBAR everywhere and F2 had never returned a verdict on real data. A check that has
never returned a verdict is unproven, whatever its code says. Step 2 already records the source pins
(`dependency:<name>`, tier P, source `package/package.json (source pin)`), so F2 reads them from
there when there is no `--source`, and the finding names which of the two it used. Run of record
2026-08-07: 12 IDENTISCH pin comparisons across the four modules and one DIVERGIERT — Consent's
`de.einwilligungsmanagement`, target `2.0.3-snapshots` against the source pin `2.0.3`, which is
exactly the class the table at the head of §11 describes.

### 11.4 Layer 3 — provenance, read out of the RENDERED output

| Check | Reads | Against |
| --- | --- | --- |
| **P1** template of the render | `Templates: <pkg>#<ver>` in `output/qa.html` | `ig-template/package/package.json` in the tree |
| **P2** vendored ref | `5.2 skeleton-vendored … ref=` in the run log | `--template-latest`, the module template's latest **release** |
| **P3** IG Publisher | `IG Publisher Version:` in `qa.txt`/`qa.html` | the pin in the target's build workflow `env:` |
| **P4** source-guide pin | the `?version=` of the URLs pages were fetched from | must be a **published** version, never `current` |
| **P5** ig.ini → the IG resource | the `ig =` path in `ig.ini` | the file on disk under the target. SUSHI derives its output name from the sushi-config `id` (`fsh-generated/resources/ImplementationGuide-<id>.json`) and from nothing else, so a path derived from the repository SLUG names a file SUSHI never writes — **DIVERGIERT** when the file does not exist beside built siblings (the id-vs-slug failure class, §5.2); where SUSHI has not run in the checkout, the id-derived name is the reference |

**The measured trap, encoded: the ig-template PACKAGE version and the module-template REPO release
are different numbers.** Measured 2026-08-06 — repo tag `v0.6.0` vendors package version `0.5.1`,
and repo tag `v0.5.1` vendors `0.3.0`. Comparing the rendered `…template#0.5.1` against the release
`v0.6.0` therefore produces a confident, **wrong** finding. P1 compares the rendered value with the
vendored package (like with like); P2 compares the vendored ref with the release. Two checks, two
references — and P1 without a build is NICHT PRÜFBAR, never a pass, because provenance is a property
of the rendered site and of nothing else.

### 11.5 Layer 4 — rendering integrity

| Check | Fails when |
| --- | --- |
| **R1** structure views | a `<table>` renders with no rows; a tab strip with no tabs; an image resolvable in neither the variant directory nor the site root — **and**, comparatively where the harvest kept the source HTML, a target page with no tables/tabs/images where the source page had them. Only the zero/non-zero transition is reported: two renderers never produce comparable counts. The comparative summary counts **the pages that compared clean, out of the pages compared**, and a comparison over **zero** pages is NICHT PRÜFBAR: a blanket IDENTISCH beside its own DIVERGIERT rows, or over nothing at all, is the shape of a false pass. |
| **R2** header/footer metadata | a defect marker appears inside `id="ig-status"`, `id="publish-box"`, `id="segment-header"` or `id="segment-footer"` — `Unknown region code`, an unexpanded `{{`/`{%`, `[object Object]`, `#ERROR`. The regions are isolated by **depth-scanning** `<div>`, because a regex to the next `</div>` truncates at the first nested one and a truncated header region is exactly where the defect hides. **The regions nest, so one marker is attributed to exactly one of them: the INNERMOST region containing it.** Reporting every enclosing region turned one `Unknown region code '276'` into two rows and two queue items (`#ig-status` and its parent `#segment-header`) on 119 Dokument pages per language. |
| **R3** language parity | a narrative page renders in the default language but not in the translation, or its translated text is **byte-identical** to the default — a fallback, not a translation. Checked on **narrative pages only**: artefact pages are generated and legitimately near-identical across languages (measured: Consent `en/artifacts.html` 29608 B vs `de/` 29644 B), so including them would bury the real finding. |
| **R4** template-example links | a page or menu still links to a template example artefact that step 3 deletes. The artefacts are named in [`references/template-artifacts.tsv`](template-artifacts.tsv) — **one file, read by both the check and its fixer**, each row carrying the ig-template PACKAGE version it was verified against. A bare literal duplicated in the two programs would let a renamed template example leave them silently disagreeing about what a template example is. Unreadable manifest ⇒ NICHT PRÜFBAR, and the fixer refuses: "found none" must not be able to mean "looked for nothing". A `# template_tag:` header records the module-template tag the tokens were verified at; a mismatch against the vendored tag downgrades R4 the same way C5c downgrades (stale token list = confident wrong findings in both directions). Auto-fixable (§12). |
| **R5** page-title catalogue | a title in the `pages:` tree has **no unit** in the `.po` (auto-fixable); a unit with an **empty msgstr** is NICHT PRÜFBAR — a translation is a human act. An empty title set is NICHT PRÜFBAR too: a catalogue with nothing to compare against passes trivially, which is the shape of a false pass. |

### 11.5a What counts as a rendered VARIANT (normative)

**A variant is a directory that actually renders pages. The site root of a multi-language build is
not one.** The IG Publisher writes each language into its own directory (`en/`, `de/`) and leaves at
the root, for every page name, a ~520-byte **language-redirect stub**: a document that declares
`langs=[…]` and hands over to `assets/js/lang-redirects.js`. The root `artifacts.html` therefore
lists no artefact — not because artefacts are unreachable, but because it is not an index.

Every check that walks the rendered output (C2, R1, R2, R3, L4's artifact count) reads variants
only. A candidate directory is a variant when its `artifacts.html` is **not** a redirect stub, which
is decided by two conditions together — it carries a redirect marker **and** it links to no page at
all — so a real page that merely references the redirect script is not mistaken for one. Skipped
stubs are **named** in the NICHT PRÜFBAR text where no variant is found, never silently dropped.

Measured 2026-08-07, this is not a hypothetical: reading the root as a variant made the tool report
"the artifact index lists NO artefact at all" as a BLOCKER on all four real migrations, while the
per-language indexes were fully populated (Dokument `en`/`de` 15 artefact links each, Person 12,
Consent 15 including all 6 SearchParameters). **A false BLOCKER is not a safe failure mode**: it
costs exactly the attention the real findings needed, and it is why §11.5a is normative rather than
an implementation detail.

### 11.6 The run log as a SECOND ORACLE

**Why two: the log records what each step *intended and measured*; the target records the *outcome*.
Defects live in the gap, and neither source shows them alone.** A log saying "converted 20 of 20"
beside a tree holding 19 resources is a finding the log cannot produce (all green) and the tree
cannot produce (19 files, no reference point).

| Check | Detects |
| --- | --- |
| **L0** | there is **no run log** — the primary record is absent. Measured: two of the four real migrations shipped without one. |
| **L1** | a `silent-partial-success:` WARN that was emitted and **never acted on**. Resolved means a later line for the same ACTION whose ratio is equal, or one beginning `resolved:` naming it. |
| **L2** | **a step that emitted no line at all.** A step that did not run is invisible everywhere else: the tree looks the same as if it had run and found nothing. The expected set is [`references/expected-steps.tsv`](expected-steps.tsv) — hand-editable, shape-aware; a conditional step's absence is NICHT PRÜFBAR (only a human knows whether the condition held), a required step's absence is DIVERGIERT. |
| **L3** | an `identity-contradiction:` still open at verification time — one row per **field**, not per WARN, because a field read from five tiers is four WARNs and one decision. Closed by a `decision:` line naming the field. |
| **L4** | **log-versus-artefact cross-checks:** conversion count (log `actual=` vs generated resources), page count (log vs `guide-harvest.tsv`), artifact count (`artifacts.html` vs `fsh-generated`). Direction matters: fewer in the target than the log claims is a loss and a divergence; more is legitimate (SUSHI generates the IG resource itself) and is reported as a count, not a defect. |

**A MISSING INPUT MAY NEVER DELETE A CHECK.** When there is no `run.log`, L0 is DIVERGIERT and
**L1–L4 each emit an explicit NICHT PRÜFBAR row naming the missing input** — they are not skipped.
The first version returned after L0, so on the two real migrations that shipped without a log,
L1–L4 produced no row at all: not "unverifiable", simply absent from the findings table and from the
report. That is the silent-gap failure this whole phase exists to prevent, committed by the phase
itself. The same rule holds inside a check: a scan that ran and found nothing (no
`silent-partial-success:` WARN, no open contradiction) emits an **IDENTISCH** row saying so, because
an empty result and a check that never ran are indistinguishable in a findings table otherwise. The
sub-checks that do not read the log — the identity ledger's existence, the artifact count — still
run and still report.

Every step therefore **must** emit its measured outcome through `scripts/migration-log.sh` (§10.5),
including the steps that run no bundled script — L2 is what makes that a checked requirement rather
than an aspiration.

### 11.7 Exit status, and what the report does with it

| Exit | Meaning |
| --- | --- |
| 0 | every check IDENTISCH |
| 1 | at least one DIVERGIERT |
| 2 | setup error — nothing written |
| 3 | no divergence, but at least one NICHT PRÜFBAR: verification **INCOMPLETE**, which is not "passed" |

`migration-log/verification.md` is generated and goes into the report verbatim (§10.6's rule applies
to it: do not retype it). Every DIVERGIERT row lands in a reviewer queue — ① when it is a decision,
③ when it is a build/QA finding — and every NICHT PRÜFBAR row lands in ① with its named human
action. **A report claiming a verified migration with no `11 verify-migration` line in the run log
is claiming something that did not happen.**

→ **Acceptance:** the phase ran and its exit status is in the log; no DIVERGIERT is left unqueued;
every NICHT PRÜFBAR row names the human who resolves it and at which gate.

## 12. The bounded auto-fix loop (normative)

A handful of verification findings are mechanical, and fixing them by hand is busywork. Fixing them
automatically is dangerous unless the loop is safe **by construction** — which is the whole design of
`scripts/autofix-loop.sh`. It is **optional**: a migration that never runs it is complete; a
migration that runs it must carry its audit trail.

```bash
bash "$SKILL_DIR/scripts/autofix-loop.sh" --skill-dir "$SKILL_DIR" --target . \
  [--allow gofsh-residue,template-example-link,po-missing-unit] [--rebuild-cmd '<rebuild>'] [--dry-run]
```

### 12.1 Allowlist, never blocklist

**The default is do-not-fix.** A class is auto-fixable only when all four hold, and each is checked
rather than asserted:

1. **Mechanical** — the repair follows from the finding with no judgement.
2. **Reversible** — the fixer must declare every path it may touch (`plan`) *before* it runs; the
   loop tars exactly those into `migration-log/autofix/iter<N>/<finding>/before.tar`, and the fixer
   refuses to write outside its own plan.
3. **Self-confirming** — correctness is decided by **the very check that raised the finding clearing
   afterwards**, never by the fixer's own report. A class whose confirming check cannot be re-run in
   this environment is **not offered at all**.
4. **Neither identity nor narrative** — enforced by a path guard, not by convention.

The allowlist has ONE definition, `python3 scripts/autofix-fix.py classes`, which the loop reads:

| Class | Confirming check | Requires | Why it qualifies |
| --- | --- | --- | --- |
| `gofsh-residue` | F4 | — | The two shapes goFSH leaves behind that SUSHI cannot parse. Repaired by the skill's own `postprocess-gofsh.py`, which classifies every occurrence **before** writing anything, writes nothing on a shape it does not model, and is idempotent — measured 41 → 5 SUSHI errors on the reference module. |
| `template-example-link` | R4 | — | A link into the template's example artefacts, which step 3 deletes. **It cannot be the module's narrative:** the module's text predates the template and cannot reference its examples — that provenance argument is what makes a page file touchable at all. The fix removes the link and never the text, and **refuses unless the file's text is byte-identical afterwards**; in a menu it drops the dead entry and refuses if the result does not parse as XML. |
| `po-missing-unit` | R5 | — | A page-title unit missing for a page that **exists** in the tree. Added by `gen-page-title-po.py` with an **empty msgstr**: the gap is made visible, never filled with an invented translation (guardrail 3). Its exit 1 means "written, with untranslated units" — the documented, expected outcome of this class, not a failure. |
| `revendor-template` | P1/P2 | a rebuild | A stale vendored template, re-vendored **at the ref the run recorded** — never at a floating branch. Offered only with `--rebuild-cmd`, because the confirming check reads the RENDERED output: without a rebuild nothing can confirm it, so it is not applied. |

### 12.2 Never auto-fixed

Identity (canonical, packageId, licence, publisher, version); **any** narrative content; anything the
**source** declares — a source defect is escalated to its maintainers, never patched in the migration
(guardrail 3); and anything needing a judgement call. These are not options: the fixer refuses to
write `sushi-config.yaml`, `package.json`, `ig.ini` or a LICENSE file whatever a caller passes, and
the one class that may touch a page file must leave its text byte-identical.

### 12.3 Loop safety

- **Each fix is tied to one finding** by the finding's **stable id** — a hash of check+subject, so
  "did the one I targeted clear?" survives a re-run. A sequence number would renumber and the loop
  would revert the wrong fix.
- **Re-verify, then revert what did not clear.** If the targeted finding is still open, that fix is
  restored from its snapshot and escalated. A half-fix left in the tree is worse than the finding:
  an unexplained change attached to an unsolved problem.
- **No-progress stop.** If the finding set does not **shrink** between iterations, the loop stops
  immediately.
- **Hard ceiling of three iterations**, unconditional — `--max-iterations` cannot raise it. Whatever
  remains is escalated to the report's ① queue, named individually.
- **Four stops can end the loop, and the run always names which one did** —
  `stop=clean|no-fixable|nothing-applied|no-progress|ceiling` in the `done` line, plus a WARN
  whenever findings are left open. A run that halted with work outstanding used to log nothing about
  why unless it was the ceiling, which is the same silent gap the verifier exists to close.
- **The ceiling is the OUTERMOST stop, and it is nearly unreachable — deliberately so.** One
  iteration applies *every* fixable finding it can see, so a second iteration has work only if the
  first one's fixes (or the rebuild between them) created NEW fixable findings, and a third needs
  that to happen twice running with the total strictly shrinking each time. Measured: across the
  four real migrations it has never fired — every run ends at `clean` or `no-fixable`. It is kept
  because it is the one stop that does not depend on the loop's own bookkeeping being correct: if
  the shrink test or the fixable-set test were ever wrong, the ceiling is what still bounds the run.
  That is a **backstop**, not dead code — but describing it as *the* stop, as this section
  previously did, described a path almost no run takes.
- **Every fix is audited** in `migration-log/autofix.tsv`: iteration, finding, class, status
  (`applied` / `confirmed` / `reverted` / `refused` / `no-change`), files, why, cleared — with its
  snapshot beside it, so a reviewer can revert that one fix alone.

### 12.4 Why the guardrails assume the fixer is wrong

On a single day this project shipped three claims made with high confidence that were **wrong**: that
IG page titles do not localize (they do, through an IG-level `.po` — §5.5); that Simplifier is not a
scrape target (the *project* page is not, the *guide* pages are — §2.1.3); and a guide-key attribute
shape measured on one module and false on two others (§5.1c.2a). Confident-and-wrong is the **normal**
case in this domain, not the exception.

A loop whose safety rested on the fixer's confidence would have amplified each of those. This one
rests on a **re-measurement** — and on being cheap to undo. That is also why the loop is deliberately
unambitious: four classes, three iterations, one snapshot per fix. Its value is not how much it
repairs; it is that everything it repairs is provably repaired and everything else is escalated
untouched.

## Appendix — vendor-neutral prompt scaffold

> **Role:** You are a migration assistant for FHIR Implementation Guides.
> **Task:** Move the source guide (`SOURCE_RENDERED_IG_URL`, `SOURCE_REPO_URL`) onto the MII KDS
> module template according to this specification.
> **Constraints:** The guardrails in §4 are binding. Work the steps in §5 in order, emit a run-log
> line per step to `migration-log/run.log` in the format of §10 (WARN on any silent partial success),
> generate the report's protocol section from that log into
> `migration-log/migration-report.md`, stop at every review gate in §6 and hand over to a human. Do not
> change existing canonical URLs or IDs; where the source and the template disagree on identity,
> report it and stop rather than normalizing. Invent no domain content; mark uncertainty
> `TODO:REVIEW`. Do not publish. Delete the template's example artefacts before migrating. Replace
> every `{{...}}` placeholder and verify none remain. Do not modify the default branch.
> **Where the module's narrative is not in its repository, get it (§5.1c, §5.1d) — the authenticated
> project download if credentials are offered, otherwise the guide harvest — and account for every
> discovered page. Shipping the template's starter pages is a failed migration, not a short one.
> Any "this cannot be read" you record must name the exact URL, the date and the numbers, and must
> not be generalised to a sibling URL or mechanism (§4 guardrail 10).**
> **Then VERIFY mechanically (§11) and report the exit status: run
> `scripts/verify-migration.py` over the target, the source and the rendered output, and read the run
> log back as a second, independent oracle. Do not write a verification claim you did not measure —
> three verdicts exist for that reason, and NICHT PRÜFBAR is not a pass. Fix nothing automatically
> beyond the four allowlisted mechanical classes (§12), at most three iterations, reverting any fix
> whose finding did not clear.**
