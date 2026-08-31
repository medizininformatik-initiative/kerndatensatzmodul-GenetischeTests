---
name: mii-ig-migration
description: Migrates a Simplifier-published MII KDS module Implementation Guide onto the MII KDS
  module template — preserves the module's identity, transfers the FSH artefacts, rewrites
  Simplifier/FQL directives into IG Publisher equivalents, and sets up the bilingual page set.
  Covers both source shapes — a SUSHI/IG-Publisher project, and a Forge-authored repo of raw FHIR
  XML/JSON resources with no sushi-config.yaml or input/fsh, converted with gofsh first. Use when
  moving a KDS module off Simplifier or Forge, when a rendered IG URL and its repo are handed over,
  when FQL blocks or {{tree}} and {{render}} directives stop rendering after such a move, or when
  the user mentions Kerndatensatz, KDS-Modul, Implementierungsleitfaden, Manteldokument,
  sushi-config, ig.ini, gofsh, StructureDefinition XML or the IG Publisher in the context of moving
  a guide. Not for authoring new profiles, creating a module from scratch, or translating a guide
  already on the template — the catalog ships fhir-ig-translation for that.
license: CC-BY-4.0
allowed-tools: Read Grep Glob WebFetch Bash(npx:*) Bash(bash:*) Bash(python3:*) Bash(curl:*) Bash(find:*) Bash(grep:*) Bash(sed:*) Bash(awk:*) Bash(paste:*) Bash(wc:*) Bash(git clone:*) Bash(git status:*) Bash(git diff:*)
metadata:
  fgdh.tier: "domain"
  fgdh.domain: "fhir-ig"
  fgdh.owner: "@msusky"
  fgdh.language: "en"
  fgdh.status: "stable"
---

# Migrating an MII KDS module IG onto the module template

This skill **supports and partly automates** the migration. It never publishes, and four human review
gates are mandatory. The full procedure, with acceptance criteria per step, is in
[the migration specification](references/migration-spec.md); this file is the operating summary.

## Preconditions

Discover the context: assume none of it, create nothing that is missing.

1. **The source guide.** Two inputs come from the human and cannot be derived: the URL of the
   rendered Simplifier IG and the URL of its source GitHub repository. If either is absent, ask for
   it and stop. Everything else about the module's identity is *read*, not asked (step 2).

2. **The module repository — classify the source shape.** Two shapes are in scope and take
   different routes to the same place; a third is not. Decide first, and record it (spec §5.1b).

   - **Shape A — a SUSHI / IG-Publisher project.** A `sushi-config.yaml` **or** an `ig.ini` at the
     repository root plus an `input/fsh/` — the FHIR IG ecosystem conventions that make this skill
     portable. The FSH exists; step 4 transfers it. `input/fsh/` present but empty → report it; a
     migration with no artefacts to move is a configuration error, not a no-op.
   - **Shape B — a raw FHIR resource repository.** No scaffolding — **checked to depth 3** (spec
     §5.1b): a SUSHI project nested below root (strukturdaten) is shape **A (nested)**, re-rooted
     with a `decision` line — goFSH-ing it discards the author's FSH with the ratio green.
     **This is the normal state of a module authored in Forge and published on Simplifier, and it
     is fully in scope** — the most authentic case this skill exists for. Step **2b** derives the
     FSH with goFSH; from step 3 the two paths are identical. **Detect it by content, not by folder
     name** (spec §5.1b.1): a file is a FHIR resource if it parses and carries a `resourceType`;
     folder names are hand-chosen and often German, so no conventional-name glob finds them.
     **The rendered guide's narrative is on Simplifier, not in the repository** — no
     `implementation-guides/**` tree, so step 1 takes the page structure from the rendered IG and
     `fql-scan.sh` rightly exits 2 on an empty target set before migration. **Not in git is not
     unobtainable: step 2c harvests it**, and skipping that ships the template's starter pages under
     the module's name. Nor is it "no narrative in the repository": the reference module ships a
     43-line German `README.md` and a 126-line CodeSystem mirror. Inventory every narrative-bearing
     text file, with a disposition each.
   - **Neither** — no scaffolding **and** no FHIR resources: not a FHIR IG project. Say so and stop.
     **Do not scaffold one.** Path B is no exception: it creates no artefacts, deriving FSH from
     resources that already exist, each tracing to a source file (guardrail 3).

3. **The target template.** Determine which state the module is in — discovery only here, the
   skeleton comes in step 3 of the procedure. In every state, read
   `forschungsgruppe-digital-health/mii-kds-module-template` at the ref you intend to use rather
   than relying on this skill's description of it.
   - **Already on the module template** — a vendored `ig-template/`, or an `ig.ini` `template` entry pointing at it. A *re-migration*: report what is in place before changing anything.
   - **Plain Simplifier project** — Simplifier files only (`.simplifier/`, `project.yaml`, `implementation-guides/`), no IG-Publisher scaffolding. The normal starting state.
   - **Hybrid, or on another template** — IG-Publisher files beside the Simplifier ones: an `ig.ini` naming another template, `_genonce.sh` & co., a committed `fsh-generated/` or rendered output (possibly live GitHub Pages). Still a migration. Inventory them and record which the template replaces (`ig.ini`, `_gen*`/`_update*`), which carry content to transfer (`input/`, `fsh-generated/`), and which retire only after Gate D. List **any unrecognized top-level entry** too (e.g. `validator/`) with a retain/retire proposal — list, do not remove.

4. **Unreplaced placeholders.** The template does not build until every `{{...}}` placeholder is
   replaced, and an unreplaced one **ships a bogus artefact** rather than failing loudly. Before and
   after migrating, grep the tree for `{{` and account for every hit — excluding `.github/**`
   (Actions `${{ … }}` matches the pattern) and counting Simplifier directives in narrative sources as
   accounted (step-5 material). **Census by EXCLUSION (`grep -rIl '{{' . --exclude-dir=.git`), not an
   `--include` list:** it misses `ig.ini`, whose slug killed a publisher run (PROs try-run).

5. **The toolchain — invoke SUSHI and goFSH only as a version-pinned `npx`.** Neither is normally installed (`which gofsh` finds nothing on the reference machine), so **a bare `sushi`/`gofsh` is unrunnable and appears nowhere in this skill**: write `npx --yes fsh-sushi@3.20.0` and `npx --yes gofsh@2.6.1` — the npm package for SUSHI is **`fsh-sushi`**, not `sushi`. What the "no fetching a toolchain" rule protects is an **exact, recorded version**, which the pin supplies and an unpinned `npx` does not; let the pin be the record, carried in the log's `cmd=` token. (`allowed-tools` grants `Bash(npx:*)`; `Bash(gofsh:*)` never matches an `npx` command line.) goFSH is **required for shape B**, for shape A only where the source ships JSON/XML; the IG Publisher is needed from step 7. Missing node/npx → say which and **stop after step 2**. A parent package without snapshots additionally needs **java and a pinned `validator_cli.jar`** — fetched only when that condition is actually detected (spec §5.1b.5), never hand-substituted.

## Procedure

Written in English; the artefacts operated on are German-language KDS documents, and German terms
of art are kept as such. **Output language follows the target template: English is the default
language and German is the translation.** This reverses the older convention — see *Language*
below, and verify it against the target's `sushi-config.yaml` rather than trusting this sentence.

> **Resolve the script path first.** The commands below name tools relative to **this skill's own
> directory**, not to your working directory — which is the project being migrated. Set
> `SKILL_DIR=<the directory containing this SKILL.md>` (e.g. `.claude/skills/mii-ig-migration`) and
> `ML="$SKILL_DIR/scripts/migration-log.sh"`, and use them in every invocation. A bare
> `scripts/...` from the project root does not merely fail: if the project has its own `scripts/`
> with a same-named file, it silently runs **that** instead.

1. **Inventory the source — Gate 0 FIRST (spec §9c):** run the sibling `fhir-ig-analysis` on the unmigrated source (`bash "$ML" run 1 preflight-analysis …` → `migration-log/preflight-analysis.json`); its artifact counts drive the measured M9 decisions and the §9b CS-absence path, `special_url_prediction` pre-builds the special-url list, and `qa_baseline: None` means: obtain the source QA proof now. Then, from the rendered IG and the source repository, extract every artefact
   (profiles, extensions, value sets, code systems, capability statements, examples) and the
   narrative structure, each with its source path → `migration-log/source-inventory.json`. When
   `implementation-guides/` holds **several guide trees** (versions × languages + shared assets — a
   real module ships six), apply spec §5.1a: pick the authoritative tree, mark parallel-language
   trees as harvest seeds, retain the rest.
   **No rendered-IG URL? Discover it — spec §5.1c.** `bash "$SKILL_DIR/scripts/simplifier-discover.sh" --org ORG --module SLUG` walks org project list → package → project → **`/<project>/filterprojectguides`** (no tilde; the `~` variants return 200 and yield nothing) → `/published-guide/<key>/versions` → the server-rendered guide root, WARNing at any hop that yields nothing. **Pin a PUBLISHED, read-only version and record it like the source commit SHA — never `?version=current`, the live editable project.** Keys and page slugs are **discovered, never constructed** (a constructed key 404s; the renderer de-punctuates slugs). The PROJECT page is client-rendered and yields nothing while the GUIDE pages yield everything — generalizing that one measurement to the platform is what once cost this skill the procedure. **One instance is not the class, in BOTH directions** (spec §5.1c.2a): measure a negative on the exact artefact you claim it about, and before encoding a *shape* as normative measure it on more than one instance, choosing the one most likely to differ — the same day's `data-url="/guide/<key>"` reading was taken on the one module where every key is bare and silently dropped keys on two others (consent 3 of 3, mikrobiologie 2 of 3, person 0 of 3, all at exit 0).

2. **Read the module's identity — do not ask for it, and do not invent it.** From the source's
   `sushi-config.yaml` and `package.json` (absent a `sushi-config.yaml`: `package.json` plus the
   `ImplementationGuide` resource) read `title`, `packageId`, `canonical`, `status`, `releaseLabel`,
   `license`, `dependencies` and `publisher`, and carry them over **unchanged**. On disagreement
   `sushi-config.yaml` wins — it is what the build reads; record it. A field in neither file comes
   from the generated `ImplementationGuide`; absent everywhere it takes the template default, at
   Gate A. Resolve floating pins (`1.5.x`) per spec §2.1, recording the pick and its evidence.
   **Shape B often has none of the three files — and a repository carrying no identity is not an
   identity-less module.** Identity is then RECOVERED from several sources **in this order, each
   field recorded with the source it came from** (spec §2.1; the scripts write the ledger themselves):
   - **P — the published package.** `bash "$SKILL_DIR/scripts/package-identity.sh" --package ID --version V` logs `packageId`, `version`, `description`, `fhirVersions`, `jurisdiction` and the **dependency pins** — source evidence, outranking any `dist-tags.latest` — plus the `canonical` derived from the packaged resources' own urls by common prefix, **unanimous or a WARN, never a majority vote**. No manifest carries `title`, `license` or `publisher`; `author` is a registry account, not a publisher.
   - **R — the source repository.** `bash "$SKILL_DIR/scripts/repo-identity.sh" --dir DIR --repo OWNER/NAME --rendered URL` reads the LICENSE text's **SPDX id — real licence evidence, the field that must never default** (§2.2) — the README's first heading as a `title` candidate, the repo description, and the release tags, whose match with P's version ties that release to the commit. An unrecognized licence text yields nothing (`license-text-unrecognized:`); the GitHub owner is **not** a `publisher`.
   - **H — Simplifier. TWO URL SPACES, TWO ANSWERS — do not carry one to the other** (spec §2.1.3). The **project page** (`simplifier.net/<Project>/`) is measured client-rendered (HTTP 200, ~56 KB, 52 script markers, **no identity metadata in the DOM**): a **human reference at Gate A** for what no machine source carries, not a scrape target, and the script measures that and extracts nothing. The **guide pages** (`simplifier.net/guide/<key>/<Root>[/<Page>]?version=<v>`) are a **different URL space and are SERVER-RENDERED** — measured on Consent 2026.0.0: root 24509 bytes carrying the whole page tree (18 page links), leaf 20481 bytes carrying `<h1 id="page-title">` and the real German narrative. They yield the **narrative**, not identity: harvest them per step 2c.

   Whatever no tier yields stays Gate A — measured on the reference module, `publisher` alone.
   Every value is claimed with its evidence (`bash "$ML" claim 2.1 ACTION FIELD VALUE TIER SOURCE`),
   and a second source with a **different** value raises `identity-contradiction:` — **reported,
   never resolved** (measured: goFSH's `version: 1.0.8` against the package's `2026.0.0`; a source
   pin `2.0.2` against `dist-tags.latest` `2.0.3`). `bash "$ML" claims --markdown` is the report's
   identity table. **NEVER ALTER EXISTING METADATA from a recovered value**, even where the recovery
   shows it to be inconsistent: recovery is evidence for Gate A. Spec §2.1.2–§2.1.4.

   Log each value read, and each divergence as a WARN. The **target version** is the only identity
   value that is a human decision: MII CalVer `YYYY.n.n`, not SemVer, defaulting to the source's.
   **When the source and the template disagree, the source wins** — the template's `canonical` and
   `packageId` patterns are what a *new* module gets, and changing a published canonical breaks every
   consumer. Report each divergence and let a human decide; never normalize silently. That covers
   every value the template pre-fills as a **literal** rather than a placeholder, `license` above
   all: the template ships `CC-BY-4.0`, no placeholder check flags it, and MII modules commonly
   declare `CC0-1.0`. Relicensing is a human decision, never a default. Spec §2.2.

2b. **Source shape B only — derive the FSH from the raw resources.** Runs **before** the skeleton,
   which step 3 merges into FSH that must already exist. Work in a scratch directory outside the
   module repository; skip for shape A. **Spec §5.1b is normative here** (measured with goFSH
   **2.6.1** and SUSHI **3.20.0** on `medizininformatik-initiative/kerndatensatzmodul-consent`).

   ```bash
   mkdir -p migration-log
   ML="$SKILL_DIR/scripts/migration-log.sh"   # run-log helper — see *Run log* below
   SRC=<source-repo-root>; OUT=<scratch-dir>; GLOG=migration-log/gofsh.log
   SUSHI="npx --yes fsh-sushi@3.20.0"
   E() { grep -oE '[0-9]+ Errors' "$1" | tail -1 | cut -d' ' -f1 | grep . || echo n/a; }
   bash "$ML" begin "step 2b — Path B on $SRC"   # run boundary: re-runs stay separable
   rm -rf "$OUT"     # goFSH refuses a non-empty -o dir; $OUT is derived, so clearing is safe

   N_IN=$(find "$SRC" -type f \( -name '*.json' -o -name '*.xml' \) \
          -exec grep -lE '"resourceType"[[:space:]]*:|xmlns="http://hl7\.org/fhir"' {} + \
          | wc -l | tr -d ' ')                                     # inputs, BY CONTENT
   bash "$ML" info 5.1b.2 gofsh-input "inputs=$N_IN src=$SRC"

   bash "$ML" run 5.1b.2 gofsh-convert --raw-log "$GLOG" -- \
     npx --yes gofsh@2.6.1 "$SRC" -o "$OUT" -s file-per-definition -t json-and-xml \
     -d <parent-ig-package>@<version> -d hl7.fhir.r4.core@4.0.1
   GOFSH_EXIT=$?
   bash "$SKILL_DIR/scripts/gofsh-results.sh" --log "$GLOG" --inputs "$N_IN" \
     --exit $GOFSH_EXIT                          # <- the mandatory WARN fires here
   # A failed conversion is a stop: everything below measures $OUT (spec §5.1b.2).
   [ "$GOFSH_EXIT" -eq 0 ] || { bash "$ML" error 5.1b.2 gofsh-convert \
     "conversion failed — not measuring \$OUT; fix the cause and re-run"; exit 1; }

   bash "$ML" run 5.1b.3 sushi-before --raw-log migration-log/sushi-before.log -- \
     bash -c "cd '$OUT' && $SUSHI ."                               # the 41 of "41 -> 5"
   B=$(E migration-log/sushi-before.log); bash "$ML" info 5.1b.3 sushi-before "errors=$B"
   bash "$ML" run 5.1b.3 postprocess-gofsh --emits-runlog -- \
     python3 "$SKILL_DIR/scripts/postprocess-gofsh.py" "$OUT/input/fsh" --gofsh-log "$GLOG"
   bash "$ML" run 5.1b.3 sushi-after --raw-log migration-log/sushi-after.log \
     --expected-nonzero 'shape B: unresolvable parents are a Gate-A escalation (§5.1b.4)' -- \
     bash -c "cd '$OUT' && $SUSHI ."                               # the 5
   A=$(E migration-log/sushi-after.log)   # n/a when a run printed no count (crash/kill)
   case "$B$A" in *n/a*) R="resolved=not-measured";; *) R="resolved=$(( B - A ))";; esac
   bash "$ML" info 5.1b.3 sushi-after "errors=$A $R  before=$B"
   ```

   Run verbatim, in that order, from the same directory: the post-processor reads `$GLOG`, and the
   `E` helper reads each SUSHI error count back out of its raw log into an INFO line — that pair
   **is** the 41 → 5 evidence, and it is in the block, not only in the spec. `gofsh-results.sh`
   reads goFSH's own RESULTS table back, labels every cell, counts converted **resources** only
   (never Invariants/Mappings/Aliases) and reconciles them against `$N_IN`. **That reconciliation is
   the point of the whole block** — goFSH's exit code is not the signal, its counts are — and `run`
   keeps each real exit status, truncating each raw log per invocation so a re-run measures itself
   and not the sum of both.

   - **Point goFSH at the repository ROOT, not at one resource folder.** The reference module keeps its
     20 resources in **five** hand-named directories and needs no staging: measured, goFSH walks the tree
     recursively and the FSH from the root is **byte-identical** to that from a staged flat directory.
     Stage only for a recorded reason (spec §5.1b.2).
   - **`-t json-and-xml` is mandatory; its absence fails SILENTLY.** goFSH defaults to `json-only`:
     on Consent (19 XML + 1 JSON) the flagless run **exited 0, reported "0 Errors" and converted
     exactly ONE resource**, warning only that "**13** XML definition(s)" lacked a JSON counterpart —
     goFSH's own count, not the input's 19 files (the difference is the six `SearchParameter`s); say
     which you mean. The deciding number is neither: it is `converted 1 of 20`, which
     `gofsh-results.sh` emits and WARNs on. Reconcile against step 1's inventory, never the exit code.
   - **Declare every foreign parent IG with `-d <package>@<version>`,** found in the resources' own
     `baseDefinition` canonicals; goFSH's "cannot find a definition for its parent … declaring that
     IG as a dependency" is the signal. Re-run rather than patch the dependency-less output — the two
     differ (12 mappings / 14 aliases without, 0 / 8 with). A Forge repo names neither package nor
     version: resolve it against the FHIR package registry (spec §5.1b.2); no hit is a Gate-A stop.
   - **goFSH writes the `sushi-config.yaml` itself but it is a STARTING POINT, NOT IDENTITY**: no
     `id`/`name`/`title`/`publisher`/`packageId`/`license`, an **untrusted `version`** (measured
     `1.0.8` — one profile's — against the module's published `2026.0.0`), and `dependencies` that
     are only whatever `-d` set you passed. Recover identity per step 2 instead.
   - **The script's two passes are mechanical:** `fhir_comments` rules and unquoted code-reference
     systems whose name carries whitespace, repaired with the name goFSH itself reports. It classifies
     before writing, writes nothing on a shape it does not model, and is idempotent. Give it the
     **whole** FSH tree — a narrowed path cannot see the declarations it checks against, so it refuses
     (exit 1, which `run` returns and a `tee` would have hidden).
   - **Then SUSHI must compile clean apart from genuinely unresolvable parents** — measured
     **41 errors before, 5 after**, both logged by the block above. A parse error stops SUSHI reading
     the rest of a file while it still *exports* the instance, silently truncated ("exported" is not
     "converted"): the three Consent examples carried **1** nested provision each before, 27 / 6 / 3
     after. SUSHI's exit status is its error count, so `sushi-after` exits 5 — the anticipated
     shape-B outcome, which `--expected-nonzero` logs as an escalation rather than as a failure.
   - **A parent package that ships no snapshots blocks import** — SUSHI cannot read such a parent at
     all, blocking those profiles and every instance declaring `InstanceOf` them. **Detect it, then
     generate the snapshots with a real generator; never hand-roll one** (spec §5.1b.5):
     `bash "$SKILL_DIR/scripts/parent-snapshots.sh" detect --package ID --version V` counts them (measured: 21 SDs, **0**
     snapshots, in *both* candidate versions — another version does not fix it), and
     `… build … --validator validator_cli.jar --install --require <parent-url>…`
     drives the **official HL7 generator** (`java -jar validator_cli.jar snapshot`, ProfileUtilities),
     verifies every result (**a snapshot whose element count matches only the differential is WRONG**
     and is refused), and installs a **new** cache entry `<id>#<version>-snapshots` — upstream is
     never overwritten. A generator refusal is an upstream defect to escalate, not to hand-finish;
     what the rebuild costs CI (it is local-only) is a Gate-A decision. Approximating a merge —
     slicing, cardinalities, element order — fabricates a parent (guardrails 1 and 3). Then re-pin,
     re-run SUSHI and log **both** error counts: measured on Consent, **5 → 0**.
     **goFSH-invented ids and GUID-named files** go to the ② queue: minted ids become the module's,
     so Gate A confirms them.
   - **Acceptance:** counts match the inventory; the script exits 0; every remaining SUSHI error is a
     named unresolvable-parent escalation; all of it is in `run.log`. **Path B does not by itself produce
     a clean build**, so every "clean build" criterion below (steps 3 and 7, *Verification*) is read for
     shape B through the **shape-B qualifier**, spec §5.1b.4: no mechanical error left, every residual in
     the ① queue with a Gate-A decision, no parent fabricated. A tolerated error count is not a pass.

2c. **Harvest the narrative when it is not in the repository** — shape B always, and any shape A
   whose pages live on the platform. **Spec §5.1d is normative** (§5.1c found the guide). Order of sources, most trustworthy
   first, and "nothing" is not the third one:

   - **① The authenticated project download — preferred whenever credentials exist.** `https://simplifier.net/<project-slug>/$actions/downloading` yields the project **including the narrative markdown as the author wrote it**, behind a Simplifier login: measured, anonymous access returns the login page (`/login?ReturnUrl=…`) and every anonymous alternative probed 404s or returns HTML, so **no verified anonymous project download exists**. A human signs in *in their own browser*, downloads the archive and names a path outside the repository; the agent reads it and logs `narrative-source=project-download`. **Never invent a credential mechanism, ask for a password or store a token** — the gate is the point. Nobody available: log `project-download-unavailable:` and fall through to ②.
   - **② The guide harvest — anonymous, verified, and a *rendering*** (directives already expanded; a rendered artefact view is not the resource it renders). Call it directly, it emits its own run-log lines:

     ```bash
     bash "$SKILL_DIR/scripts/guide-harvest.sh" \
       --guide-url "https://simplifier.net/guide/<key>/<Root>?version=<version>" \
       --out migration-log/guide-harvest/pagecontent --keep-html migration-log/guide-harvest/html
     ```

     It **discovers the page tree from the root's own `href` values — slugs are read, never constructed** ("Anwendungsfälle / Informationsmodell" → `AnwendungsflleInformationsmodell`), pins every page to `?version=`, isolates each content region `<div id="preview-content">` by **depth-scanning `<div>`/`</div>`** (a regex to the next `</div>` truncates at the first nested one; a page without the region is **skipped, never converted whole**), writes Markdown with a provenance header + `TODO:REVIEW`, and classifies each page `narrative` or `artefact-view`. `--out` has **no default** — this is step 5's input, not the template's page set.
     **Verification is the point:** every discovered page is in `migration-log/guide-harvest.tsv` harvested-with-counts or **skipped-with-a-reason**; `ratio` raises the mandatory `silent-partial-success:` WARN when harvested < discovered; per page the source text runs that did not survive the conversion are counted (`missing_runs=`) and WARNed — under a separate `generated-view-lossy:` token on artefact views, so generated tables cannot bury real losses. Measured on Consent 2026.0.0: **18 discovered, 18 harvested, 0 skipped, 0 narrative pages short**, 14 narrative + 4 artefact-view, 3 assets. Exit 0 = clean; 1 = something skipped or short.
   - **③ Nothing is not the third option.** An unreachable source is reported, escalated to Gate B and named.

   **The registry package has not changed role:** resources and identity (step 2), **no narrative** —
   it is what the harvested set is **verified against**. The harvested pages enter the SAME contract as every other source shape: the `5.4c page-routing` advice run reads the manifest (`--harvest-tsv`, auto-discovered from the target's `migration-log/`) and GENERATES their map rows — a page the
   harvest skipped blocks the coverage validation until the harvest is clean or a human retires it in the reviewed map — and step 5 consumes only the map
   (spec §9/§9f): never one target page per harvested page, and place the language per *Language*.

3. **Create the skeleton** (spec §5.2). The migration happens **in place**: on a working branch of the module's existing repository, vendor the template
   checked out in Preconditions 3 and run its first-run bootstrap — do not mint a new repository; history, issues and consumers stay where they are (a new
   repository is a human decision, recorded in the report, never a default). Replace every `{{...}}` placeholder from the identity read in step 2. The
   template's CRMI `meta.profile` claims **require the `hl7.fhir.uv.crmi` dependency** — add it to the carried source dependencies, recorded at Gate A
   (template machinery, not source identity). **Scaffold filenames that embed the module's name derive from the module ID, never the repository slug**
   (`ig.ini`'s `ig=` path, `ImplementationGuide-<id>` references, the step-6 `.po`): SUSHI writes `ImplementationGuide-<id>.json` from the `id` and nothing
   else, so a slug-derived name builds green until the publisher finds no IG resource — the id-vs-slug class check P5 catches. Then **delete the template's
   example artefacts** (`input/fsh/profiles/example-patient.fsh`, `input/fsh/instances/example-patient-instance.fsh` — verify the paths against the template
   you actually checked out) so they cannot collide with the module's real examples. **Before copying the template's FSH scaffold** (`input/fsh/aliases.fsh`,
   `input/fsh/rulesets/*`), diff its `RuleSet:`/`Alias:` names against the module's FSH — **module definitions win**, the module's FSH is never changed: a
   **shared alias file** (`aliases.fsh`) is resolved **per DEFINITION** (append only the template definitions the module lacks), every other colliding
   scaffold file **per file** (skipped whole). Log both lists — overwriting a module's `aliases.fsh` broke a real migration with 234 SUSHI errors.
   Acceptance: `bash "$ML" run 5.2 sushi-skeleton -- npx --yes fsh-sushi@3.20.0 .` runs clean (shape B: as qualified in step 2b), and the skip/append lists are in the log.

4. **Transfer the artefacts — structure-preserving.** Move the FSH sources across **keeping the source's directory layout**; convert JSON/XML with a pinned
   `npx --yes gofsh@2.6.1` where that is all the source has — for shape B that happened in step 2b, so what moves here is its post-processed output. IDs and
   URLs unchanged. **Acceptance is path-level, not count-level:** `comm -3` over the sorted repo-relative FSH path lists of source and target is empty apart
   from scaffold additions named in the log — counts alone prove nothing about structure.

5. **Migrate the narrative.** Its **source** is step 2c; this step maps it. Move the Manteldokument
   content into `input/pagecontent/*.md` and translate Simplifier and FQL directives into IG
   Publisher equivalents:

   ```bash
   bash "$ML" run 5.4 fql-scan --emits-runlog -- bash "$SKILL_DIR/scripts/fql-scan.sh" --strict
   ```

   The scan is recursive and pre-migration includes `implementation-guides/**`; it logs files scanned per
   target, WARNs when a named directory contributed none, and exits 2 on an empty target set — never read
   "nothing scanned" as "nothing found". `--strict` exits 1 on any finding; `run` keeps both statuses where
   a `tee` reports 0. Apply each printed recommendation; mapping in [the FQL crosswalk](references/fql-crosswalk.md),
   rules in [`references/fql-rules.tsv`](references/fql-rules.tsv). In doubt, write `TODO:REVIEW`.

   **Route every source page BEFORE writing — spec §9e, first match wins:** one artefact → `input/intro-notes/<Type>-<id>-intro.md` (German mirror, same
   filename, renders atop the artifact page); a family overview → a section on an index page that exists; an agreed page owns it → merge; only cross-cutting
   narrative becomes a page — a **hub** (≤250 words, one line per child) at ≥3 children, with a menu entry only inside the budget (≤33 entries, ≤10 per
   dropdown, top level ≤8, depth ≤2), else `pages:`-nested and linked. **Size gate:** >2500 words, >4 merged sources or ANY repeated heading re-runs it (PROs
   shipped a 6214-word host, 13 colliding anchors). **The routing is GENERATED, not judged** — the `5.4c page-routing` run IS `page-structure-advice.py`
   `--map` (invocation under *Verification*): it WRITES `migration-log/page-map.tsv` (v2: `source_page⇥target⇥reason⇥branch⇥measure`) from these branches
   plus the semantic routing table `references/routing-table.tsv`, VALIDATES coverage of the full source page universe (authoritative guide tree ∪
   `input/pagecontent` ∪ on-disk pages no toc lists ∪ the step-2c harvest manifest; exit 1 until every page has a target and every RETIRED row a reason — dangling toc entries and harvest-skipped pages are findings)
   and proposes the M9/other-bucket decisions from Gate 0. **The map is THE contract (spec §9f): a human reviews/edits it BEFORE anything is written; this
   step then consumes ONLY the map** — a page not in the map is not written, a map row left unhandled is a defect; step 7b checks against the same map.
   **Text you WRITE (overviews, hub one-liners, bridges) is DERIVED — mark it per §9d** so it renders as a review box;
   run `5.4d derived-scan` (writes `migration-log/derived-content.tsv`, which C7 reads and ② is generated from); moved or
   split content is never marked. §9 records the reference module's use-case gap: report it, never fill it.

   **Template ≥ v0.8 targets: spec §9a is normative for the page set** — split pages, link-only Conformance
   cluster + `datasets-and-descriptions` (content re-routes per §9a), no re-added title headings (M10), two REQUIRED run-logged decisions: `5.4a optional-page-decisions` (M9 — **measured**: package artifact count 0 → remove, > 0 → keep, artifacts never deleted; §9a), `5.4b security-privacy-decision` (M11). Index style parity (authors/contacts as lists, disclaimer as prose), the `(de)` translation-marker wording and the one-commit revertible-fix protocol are §9a; an absent CapabilityStatement is detected, SUGGESTED from the module's profiles and rendered INLINE on its page per **spec §9b**.

6. **Set up the bilingual pages.** English is the default; German is the translation, a same-named
   file under `input/translations/de/pagecontent/`. These **do** render. The menu is
   `input/includes/menu.xml` with a per-language mirror at
   `input/translations/de/includes/menu.xml` — never a `menu:` property in `sushi-config.yaml`,
   which competes with it. Resource translations are `.po` supplements under
   `input/translations/de/`; check the target's recipe for which resource types actually render
   before investing in one. A German-only source inverts the direction — see *Language* below.
   **Page titles (breadcrumbs, table of contents, `<title>`) — full recipe in spec §5.5.** The
   publisher *does* localize them, through one IG-level catalogue
   `input/translations/<lang>/ImplementationGuide-<ig-id>.po` (imported into the IG resource at load
   time — not a resource supplement, so their type restriction does not apply). Generate it after the
   step-3 SUSHI run from the SUSHI-generated ImplementationGuide resource, the authoritative title
   set — the menus serve only as a translation seed:

   ```bash
   bash "$ML" run 5.5 gen-page-title-po --emits-runlog -- \
     python3 "$SKILL_DIR/scripts/gen-page-title-po.py" \
       fsh-generated/resources/ImplementationGuide-<ig-id>.json \
       migration-log/menu-titles-de.txt \
       de input/translations/de/ImplementationGuide-<ig-id>.po
   ```

   `migration-log/menu-titles-de.txt` is a **required argument with no default** (one
   `English Title => Deutscher Titel` per line; build it, and the `-` "no seed" option, per spec §5.5
   — an unresolvable path is a setup error, never a silent empty seed). Regenerating is
   non-destructive; an empty `msgstr` means untranslated and goes to the ② queue. **Footgun:** the
   language must appear in **`translation-sources`**, not only `i18n-lang`, or every `.po` is
   silently ignored. Modules from template **v0.5.0** also drop its breadcrumb override.

7. **Build and QA.** SUSHI, then the IG Publisher — both through `bash "$ML" run 5.6 …`, so the two numbers this step exists to produce end up in the log:
   SUSHI's error count, and `qa.txt`'s summary line copied into an INFO (spec §5.6 has the block). The target pins its toolchain in the build workflow's
   `env:` block — read the pins from there rather than from this file. Acceptance: `qa.txt` reports `Errors: 0` and every example validates — shape B: as
   qualified in step 2b, the named escalations excepted and every *other* error still a stop. Then run the **same-module verification** with
   `fhir-ig-analysis` (measure the unmigrated source, then the migrated tree — the POSTFLIGHT measurement, kept as `migration-log/postflight-analysis.json`;
   an equal `packageId` triggers the comparison, the SOURCE is the first input): identity, published artifact set and canonical URLs must all read
   **IDENTISCH** and a DIVERGIERT is a stop; the narrative per-language table goes into the report's QA triage. **Then DIFF the two measurements** with
   `scripts/prepost-delta.py` (invocation under *Verification*; spec §5.6): one verdict per compared property (`unchanged · improved · REGRESSION ·
   expected-change`), and **exit 1 = a property got WORSE** (an artefact count dropped, licence turned contradictory, dependency-injection risk appeared, an
   identity field changed) — a stop to fix, never a delta to file; when the two measurements' census `mode` fields differ (`reduced` raw-resource vs `static` FSH-declaration census — the harvested shape), count differences report as expected-change with the modes named, never as regressions (spec §5.6). **That sibling skill is a checked precondition, not an assumption** —
   `bash "$SKILL_DIR/scripts/sibling-skill-check.sh" --skill-dir "$SKILL_DIR"` finds it or WARNs `sibling-skill-unavailable:` with the exact **pinned**
   `npx skills add` command, and **never installs it**: a tool grant is permission, not a dependency, and an unrelated run must not write into the
   operator's skills directory (spec §5.6a).

7b. **Verify — mechanically, and it exits non-zero.** Spec §11 is normative. It replaces the prose checklist a human used to perform: four real migrations
   passed that checklist on a green build while shipping unreachable artefacts, a stale rendered provenance, a broken page header, a silently truncated file and a wrong dependency pin.

   ```bash
   bash "$ML" run 11 verify-migration --emits-runlog \
     --expected-nonzero 'findings are this step OUTPUT (1 = DIVERGIERT, 3 = NICHT PRÜFBAR)' -- \
     python3 "$SKILL_DIR/scripts/verify-migration.py" --target . --source <unmigrated-source> \
       --rendered output --source-lang de --template-latest <latest module-template release>
   ```

   Four layers plus the log. **Conservation:** every source artefact present **and reachable from `artifacts.html`** — present is a different property, and
   step 7's set comparison proves only the first; every page of the **UNION source set** (authoritative guide tree ∪ `input/pagecontent` ∪ the step-2c
   harvest — never a fallback chain: one pagecontent stub must not suppress a 149-page guide tree) migrated/retired/MISSING per `migration-log/page-map.tsv`,
   the reviewed contract the `5.4c page-routing` advice run **generated**; every source text run present somewhere. **Fidelity:** identity, **dependency pins identical to the source's**,
   `license` asserted from a tier and never defaulted — and reconciled against the LICENSE **file's** own text (mismatch DIVERGIERT, unrecognized text NICHT
   PRÜFBAR). **Provenance:** the template package+version **read out of the rendered `qa.html`**, the publisher version, the pinned guide version —
   comparing like with like, because the ig-template PACKAGE version and the module-template REPO release are different numbers (measured: repo `v0.6.0`
   vendors package `0.5.1`) — plus **P5**: `ig.ini`'s `ig=` names the IG resource SUSHI actually writes (`ImplementationGuide-<id>.json`, derived from the
   `id`, never from the repo slug). **Rendering integrity:** empty tables/tabs, missing images, header markers like `Unknown region code`, and **language
   parity** — a translated page byte-identical to the default is a fallback, not a translation. **The run log is the SECOND ORACLE** (§11.6): it records
   what each step *intended and measured* where the tree records the *outcome*, so it alone catches an unactioned `silent-partial-success:` WARN, **a step
   that emitted no line at all** (`references/expected-steps.tsv` is the manifest), an open `identity-contradiction:`, and log-versus-artefact count
   mismatches. **Three verdicts, not two:** `IDENTISCH`, `DIVERGIERT` (named, with evidence) and **`NICHT PRÜFBAR`**, so an unmechanisable check is never
   silently written as a pass. Exit 0 clean · 1 divergence · **3 incomplete, which is not a pass**.

8. **Report.** Write `migration-log/migration-report.md` **from
   [the report template](references/migration-report-template.md)** — three reviewer queues (① decide,
   ② review, ③ triage): every open decision, `TODO:REVIEW` and QA finding lands in exactly one, and QA
   provenance requires proof (build the unmigrated source to claim "pre-existing"). **Its reader has
   never seen this skill, spec or repo**: every labelled line the template lists is mandatory (incl.
   **if nobody acts**, who decides, effort, reversibility), codes are glossed where used, and ids tie
   the queues to *Sign-off*. Two GENERATED aids are pasted, never retyped (invocations in the template's *How to re-run*): `qa-checklist.py` renders every open obligation from the ledgers as per-gate `- [ ]` checkboxes into *Sign-off*, and `comparison-table.py` renders the map as clickable rendered-source ↔ rendered-target rows plus the template-page provenance into *Content map*. **The protocol section is generated FROM `migration-log/run.log`**
   (spec §10.6): every claim traces to a line, every WARN/ERROR lands in a queue, the log wins.

9. **Open a pull request** with the report as its description. **Do not publish.** Name the working branch `migration/<source-version>-template-<module-template-tag>` (spec step 9 — five try-runs each invented a different scheme). Determine the PR's target branch from the module repository's own convention — **discover it, do not assume it**:
   the default branch, the bases of merged pull requests, CONTRIBUTING/README. The template previews
   every non-`main` branch to `gh-pages` under `branches/<branch>/` and reserves `main` and tags for
   publication, so a working branch previews without touching the default branch. Follow a different
   convention where the repository has one and say so — and if that PR base is itself the publication
   branch, say so in the PR and at Gate D: there, merging publishes.

## Run log

**What it is for, once: so a human reader can reconstruct which steps ran and what each produced — the command actually executed, the counts it returned, the status it exited with — without re-running anything and without trusting recollection.** `migration-log/run.log`: plain text, append-only, committed with the branch. The report's protocol section is generated **from** it (step 8) and step 7b reads it back as a second oracle (§11.6), so it cannot claim what the run did not do. **Spec §10 is normative — its §10.5 table is the full API.** **Emit every line through the bundled helper**, `ML="$SKILL_DIR/scripts/migration-log.sh"`, including from the many steps that run no bundled script: `begin LABEL` (one numbered `run-boundary`, first in every block) · `info|warn|error STEP ACTION DETAIL [CONT …]` · `ratio [--exit N] STEP ACTION VERB NOUN EXPECTED ACTUAL` (an INFO naming both counts **plus the mandatory WARN when ACTUAL < EXPECTED**) · `run STEP ACTION [--emits-runlog] [--raw-log F] [--expected-nonzero WHY] -- CMD …` (the command actually executed, its output at `migration-log/<ACTION>.log` **truncated per invocation**, and its **real exit status**, returned rather than swallowed).

**Never `… 2>&1 | tee -a migration-log/run.log`.** A pipeline's status is `tee`'s, and this skill's acceptance criteria *are* exit statuses: measured, that pipeline reported **0** where `fsh-sushi` exited **41** and `postprocess-gofsh.py` exited **1**, so failed steps read as passed. `run` takes the status from `PIPESTATUS[0]`. **An exit status is eight bits** — 256 SUSHI errors report as `exit=0` — so `run` cross-checks it against the raw log's error count (`exit-status-truncated:`). `--expected-nonzero WHY` marks a step whose non-zero exit is the documented outcome (shape-B `sushi-after`; the step-7b verification), logging a WARN naming the escalation rather than an ERROR calling the expected result a failure.

Format: `<UTC ISO-8601>  <LEVEL>  <STEP>  <ACTION>  <DETAIL>`, two spaces between fields, `LEVEL` padded to five, `DETAIL` carrying the command **actually executed** as ``cmd=`…` `` plus measured `key=value` outcomes; continuations indented four spaces — e.g. `… WARN   5.1b.2  gofsh-convert  silent-partial-success: converted 1 of 20 inputs at exit 0`. **Every step emits at least one INFO line, and step 7b's L2 check reports the ones that did not** (`references/expected-steps.tsv`) — a step that did not run is invisible in the tree. **WARN is mandatory for silent partial success**: name **both** numbers, via `ratio`, never by hand — on that run every other signal was green (postprocess "nothing to repair", SUSHI 0 errors) while 19 of 20 resources were missing. Read it back with `grep -E '  (WARN |ERROR)  '`.

## Guardrails

Binding — a migration that violates one is wrong even if it builds.

1. **Canonical URLs and IDs of existing conformance resources are never changed.**
2. **FHIR R4 (4.0.1).**
3. **No fabrication.** Every artefact and narrative section traces to a source URL or repo path;
   uncertainty is marked `TODO:REVIEW`, never guessed. (`TODO:REVIEW` marks the migrated guide; the
   catalog's marker for unfinished *skill* content is `TODO(owner):` — do not mix them.)
4. **Human in the loop.** The review gates below are mandatory. The agent does not publish.
5. **Template examples are deleted before migrating**, never merged with the module's own.
6. **The default branch is not modified.** Work on a branch, deliver a pull request.
7. **Traceability.** Every step emits run-log lines as it runs, through `scripts/migration-log.sh`
   (*Run log*, above), and every assumption and open point reaches
   `migration-log/migration-report.md`, whose protocol section is generated **from** that log.
8. **No Liquid literals in `pagecontent`, including inside HTML comments.** Jekyll evaluates `{% … %}`
   and `{{ … }}` everywhere: an invalid `{% … %}` **breaks the build hard**, an unknown `{{ … }}`
   silently empties and leaks into the HTML. Describe such mechanisms in prose.
9. **A negative capability finding is only valid for the artefact it was measured on.** Record every
   "cannot be read / not available / not possible" **with the exact URL, endpoint or command, the date
   and the numbers**; **never generalise one to a sibling** URL, endpoint or mechanism; re-measure
   before acting on one. Nothing downstream re-checks such a claim, so it silently turns a missing
   capability into a missing deliverable — twice already (page-title localization; the Simplifier
   guide, whose false claim shipped a migration with the template's starter pages). Spec §2.1.3, §4
   guardrail 10, §5.1c.2a — which states it in **both** directions: a positive shape measured on one
   instance is a hypothesis too.

## Language

Three facts, easy to conflate.

- **The target template's default language is English**, German the translation
  (`i18n-default-lang: en`). Verify it in the target's `sushi-config.yaml` on every run — it moved once
  already. **FHIR artefact identifiers stay English** regardless.
- **A `de-DE` mismatch warning is conditional** — it fires only when the source FSH sets
  `^language = #de-DE`, is cosmetic, and is suppressed in `input/ignoreWarnings.txt` (glob with `%`
  wildcards, not regex; match `%(de-DE)%`), leaving the FSH untouched. Spec §4.1.
- **A German-only source inverts the direction — and that is this skill's to handle.** The normal KDS
  case: the source's narrative is German while the target's default is English, so the German text
  becomes the *translation* of English pages that do not yet exist. Transfer it to
  `input/translations/de/pagecontent/` and produce `input/pagecontent/*.md` as **machine translations
  of it, every page marked `TODO:REVIEW`**, reviewed at Gate C — the one sanctioned exception to
  guardrail 3, since each traces to the page it renders. A top-level `language:` in the source is old
  single-language setup, not identity. Step 7b's R3 check is what proves the result: a translated page
  byte-identical to the default is a fallback, not a translation.

## Verification

**Mechanical, and it exits non-zero — step 7b, spec §11.** The list of sentences that used to stand here is now `scripts/verify-migration.py`: four layers plus the run log as a second oracle, three verdicts, one row per checked subject in `migration-log/verification-findings.tsv`. What a human still owes is each **NICHT PRÜFBAR** row — named, with its action and its gate; exit 3 says the phase is *incomplete*, not passed. It compares the migrated guide against **the Simplifier-rendered source**, not against itself, on six aspects — a qa error count catches none of them. **Toolchain provenance** (`P1`–`P5`): the template package the rendered site *reports*, the one the tree carries, and the latest release are **three different numbers** (§11.4 — repo tag `v0.6.0` vendors package `0.5.1`; comparing the first against the third manufactures a confident, wrong finding), plus the publisher version against the workflow pin, the pinned guide version, and `ig.ini` pointing at the IG resource SUSHI actually writes (`P5`, the id-vs-slug class). **Page set and menu** (`C3`, `C5`): every page of the **union source set** (authoritative guide tree ∪ `input/pagecontent` ∪ the step-2c harvest, chosen by the same rule as the advice script and overridable via `--source-guide-tree` — never an all-or-nothing fallback) migrated / retired-with-a-reason / MISSING; every menu entry leading somewhere; every narrative page *in* a menu; every target page traceable to a source page or to `references/template-pages.tsv`; a translated menu wherever there are translated pages. **Artefact completeness and reachability** (`C1`, `C2`): present is not the same property as listed, in both directions — artefacts SUSHI generated, and artefacts rendered from `input/resources` that the forward pass cannot see. `C1` names an artefact by its **id or its canonical url**, because a SearchParameter may have only the latter and the migration reassigns the id; a variant is a directory that renders pages, so the multi-language build's redirect-stub ROOT is not one (§11.5a — reading it as one reported a false BLOCKER on all four migrations). **Rendering integrity** (`R1`, `R2`): tables, tabs and images non-empty where the source's were, and the header/footer regions, where a jurisdiction the publisher cannot resolve renders as `Unknown region code` at `Errors: 0`. **Content placement** (`C6`): not *whether* a text run survived — that is `C4` — but *which page it landed on*, against the map. **Language parity** (`R3`, `R5`): a translated page byte-identical to the default is a fallback, not a translation. Two inputs decide how much of that is mechanisable, and **earlier steps write them, not the verifier**: `migration-log/page-map.tsv` (v2, `source_page⇥target⇥reason⇥branch⇥measure`, of which the verifier reads the first three columns — **generated by the `5.4c page-routing` advice run and human-reviewed, never hand-written**) — without it `C3` cannot run at all and `C6` degrades to a landing distribution a human reads — and the step-5.1c harvest. Absent, they yield NICHT PRÜFBAR, never a pass. `F3` also reconciles the LICENSE **file's** recognized text against the declared licence (mismatch DIVERGIERT, unrecognized NICHT PRÜFBAR, absent an ok note).

```bash
grep -rn '{{' . --include='*.yaml' --include='*.yml' --include='*.md' --include='*.json' | grep -v '\${{'
bash "$ML" run 7 sushi-verify -- npx --yes fsh-sushi@3.20.0 .
bash "$ML" run 5.4 fql-scan --emits-runlog -- bash "$SKILL_DIR/scripts/fql-scan.sh" --strict
bash "$ML" run 5.4c page-routing -- python3 "$SKILL_DIR/scripts/page-structure-advice.py" --source <src> --target . --out migration-log/page-structure-advice.md --map migration-log/page-map.tsv
bash "$ML" run 7 prepost-delta -- python3 "$SKILL_DIR/scripts/prepost-delta.py" --pre migration-log/preflight-analysis.json --post migration-log/postflight-analysis.json --out migration-log/prepost-delta.md --tsv migration-log/prepost-delta.tsv
bash "$ML" run 11 verify-migration --emits-runlog --expected-nonzero 'findings are the output' -- \
  python3 "$SKILL_DIR/scripts/verify-migration.py" --target . --source <src> --rendered output
```

These keep their own acceptance: every `{{...}}` accounted for (an unreplaced one ships a bogus artefact **silently**); SUSHI clean and `qa.txt` `Errors: 0` — both shape B **as qualified in step 2b**, while the IDENTISCH criteria are not qualified by shape; `fql-scan.sh --strict` exits 0 **with a non-zero scanned-file count** (an empty target set exits 2 and is not a pass) and no `[UNKNOWN]` findings; the advice run regenerates the page map with full coverage — exit 1 names the unrouted page and is not a pass (re-running overwrites the reviewed map, so re-apply and re-review human edits); `prepost-delta.py` reports **no REGRESSION row** (exit 1 is a stop to fix). Everything else — the six aspects above, identity/licence/pins, parent snapshots, and the run log's own completeness — is a numbered check in spec §11, measured rather than recalled. **Every code printed anywhere (M1–M11, C1–C7, F/P/R/L, gates, marker kinds) is glossed inline by the generator and listed in [`references/codes.md`](references/codes.md).**

**Auto-fix is optional and bounded** (spec §12): `bash "$SKILL_DIR/scripts/autofix-loop.sh" --skill-dir "$SKILL_DIR"` repairs only the four **allowlisted** mechanical classes, at most **3** iterations, snapshotting each fix, **reverting any whose finding did not clear**, and stopping the moment the finding set stops shrinking. Identity, narrative, anything the SOURCE declares and every judgement call are excluded by construction — they go to the ① queue.

## Mandatory human review gates

| Gate | After step | What is reviewed |
| --- | --- | --- |
| **A** | 4 | Canonical URL, ID **and licence/identity** preservation; artefact completeness; for shape B also the ids goFSH minted and every unresolvable-parent decision |
| **B** | 5 | The narrative, especially any section added to satisfy the Manteldokument |
| **C** | 6 | Language handling and translation, including machine-translated default pages |
| **D** | before merge | Release per KDS governance (TF KDS / AG IOP / NSG) — organizational, not technical. Nothing publishes before it. |

## Scope and delimitation

Covers **moving an existing guide onto the template**: identity preservation, artefact transfer,
directive translation, bilingual setup, and the QA that proves it. Does not cover, deliberately:
**authoring new profiles or remodelling content** (migration never changes normative decisions);
**creating a module from scratch** (the module template ships its own recipe); **translating a guide
already on the template** (the catalog's `fhir-ig-translation`); **publishing** (no release, no registry
entry, no package push); and **filling in missing domain content** (a gap in the source is a
`TODO:REVIEW`, not a writing task). If the catalog and a local copy both provide this skill, local wins.

## Provenance

Derived from `skills/mii-ig-migration` in
`forschungsgruppe-digital-health/mii-kds-sample-ig-inoffiziell` at commit
`bd38e2722a594254f3450e73c3fcdbfc2c47b7e8`. **The dated revision history — every change and the
measurement that forced it — is [references/provenance.md](references/provenance.md)**; it is
history, and nothing in it changes what to do on a run.

**2026-08-07 — the verification phase, because a checklist is not a check.** *Verification* was prose a human performed; four real migrations passed it on a green build while shipping a wrong dependency pin, `Unknown region code '276'` in a page header, a stale rendered provenance and a silently truncated file. Step 7b, spec §11–§12 and `scripts/verify-migration.py` + `autofix-loop.sh` + `autofix-fix.py` replace it with four mechanical layers, the run log read back as a **second oracle**, three verdicts (so an unmechanisable check is never written as a pass) and a bounded, allowlisted auto-fix loop. Measurements in [references/provenance.md](references/provenance.md).

Original licence: CC-BY-4.0, as declared by the source repository and the source skill; `scripts/` is
Apache-2.0, matching this repository's code licence. Promoted to `stable` on 2026-08-05 after two full
real-task migrations (Dokument, Person), both passing the same-module verification (identity, artifact
set, canonical URLs all IDENTISCH) with baseline-proven QA; the trigger set in
[references/triggers.md](references/triggers.md) was exercised by those runs.
