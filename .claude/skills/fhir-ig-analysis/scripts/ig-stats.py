#!/usr/bin/env python3
"""ig-stats — read-only-Vermessung eines FHIR-IG + Reporting (Markdown/Mermaid).

Subkommandos:
  run     <input…> [-o OUTDIR] [--label a,b]  Ein/mehrere IGs (Pfad ODER URL) ->
                                              je IG ein Report + (bei >1) Vergleichsreport
  analyze <ig-dir> [-o stats.json] [--label]  statische Vermessung -> ig-stats.json
  report  <stats.json> [-o report.md]         Einzel-IG-Report
  compare <stats.json…> [-o compare.md]       Vergleich über N IGs

Der Report ist NEUTRAL/self-contained (kein Bezug zu anderen Repo-Skills). Laien-
texte, Direktiven-Muster und Glossar liegen in
skills/ig-analyze/references/report-content.json (hand-editierbar).
Nur stdlib. Build-only-Metriken (qa.json) bleiben im statischen Modus null.
"""
import argparse, glob, hashlib, json, os, re, subprocess, sys, tarfile, tempfile, urllib.request
try:
    from datetime import datetime, timezone
except Exception:
    datetime = None

SCHEMA_VERSION = "1.4"
# Fallback only. The authoritative list lives in references/report-content.json
# under "mandatory_pages" and is loaded by load_content() below, so a page set can
# be corrected without touching this file.
#
# The names below are verified against the MII KDS module template's actual page
# set — re-seeded 2026-08-15 at template v0.10.3: only the mandatory (1..1)
# pages with a file of their own. Since template v0.8 `conformance` and
# `datasets-and-descriptions` are link-only menu entries (no page), and seven
# pages are OPTIONAL (0..1, an M9 decision) — an optional page's absence is
# legitimate and does not belong in a mandatory-page metric. (The list this was
# originally derived from named six pages that never existed at all, so every
# measurement reported six false missing pages — same failure class.)
DEFAULT_MANDATORY_PAGES = ["index", "guidance", "implementer-guidance",
                           "uml-diagrams", "profiles", "capability-statements",
                           "logical-models", "examples", "security-and-privacy",
                           "changes", "version-history", "downloads",
                           "translationinfo"]
# Mutated in place by load_content() so existing references stay valid.
MANDATORY_PAGES = list(DEFAULT_MANDATORY_PAGES)
SUPPLEMENT_TYPES = ("StructureDefinition", "CodeSystem", "Questionnaire")
STUB_NAMES = ("hinweistemplate", "toc")
STUB_MIN_WORDS = 20
PUBLISHED_ARTIFACTS = ("profiles", "extensions", "valuesets", "codesystems", "logicals",
                       "capabilitystatements", "questionnaires", "searchparameters",
                       "operations", "examples")
INTERNAL_ARTIFACTS = ("rulesets", "invariants", "mappings")
GENERIC_DIRECTIVE = r"\{\{[A-Za-z]|<fql|@```|</?tab"

DEFAULT_PALETTE = ["#4E79A7", "#F28E2B", "#59A14F", "#E15759", "#76B7B2", "#EDC948",
                   "#B07AA1", "#FF9DA7", "#9C755F", "#BAB0AC", "#86BCB6", "#D37295"]

STD_TERMINOLOGY = {"SNOMED CT": r"sct\b|snomed", "LOINC": r"loinc", "ICD-10": r"icd-?10|dimdi|bfarm",
                   "UCUM": r"ucum|unitsofmeasure", "ATC": r"\batc\b", "ASK": r"\bask\b"}
TERM_LICENSE = {"SNOMED CT": "lizenzpflichtig (Affiliate/Land)", "LOINC": "frei (Registrierung)",
                "ICD-10": "frei", "UCUM": "frei", "ATC": "eingeschränkt", "ASK": "frei"}


# ---------- Hilfen -------------------------------------------------------------
def read(path):
    try:
        with open(path, encoding="utf-8", errors="replace") as f:
            return f.read()
    except Exception:
        return ""


def rel(igdir, path):
    try:
        return os.path.relpath(path, igdir)
    except Exception:
        return path


def _slug(s):
    s = re.sub(r'[^A-Za-z0-9._-]+', '-', s or '').strip('-').lower()
    return s or 'ig'


SKILL_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def load_content(_unused=None):
    """Load references/report-content.json, anchored to this script's own location.

    This used to be built from a computed repository root plus a hard-coded
    "skills/ig-analyze/references/..." path, which broke twice when the skill
    moved into a catalog: there is no repository root to compute, and the skill
    directory was renamed. A skill is installed into repositories nobody
    anticipated, so the only safe anchor is the script's own location.

    Also applies the "mandatory_pages" override if the file supplies one.
    """
    path = os.path.join(SKILL_ROOT, "references", "report-content.json")
    try:
        content = json.load(open(path, encoding="utf-8"))
    except Exception:
        return {}
    pages = content.get("mandatory_pages")
    if isinstance(pages, list) and all(isinstance(x, str) for x in pages) and pages:
        MANDATORY_PAGES[:] = pages
    return content


def sushi_scalar(text, key):
    m = re.search(r'^%s:\s*"?([^"#\n]+?)"?\s*(?:#.*)?$' % re.escape(key), text, re.M)
    return m.group(1).strip() if m else None


def sushi_dependencies(text):
    """`dependencies:`-Block als {paket: version} — oder None, wenn KEIN Block
    existiert (None ≠ leer: ein vorhandener, aber unlesbarer Block bleibt {}).

    Beide realen SUSHI-Formen werden gelesen: `paket: 1.0.0` UND die
    verschachtelte Form `paket:` mit `id:`/`version:`/`uri:`-Unterschlüsseln.
    Der flache Parser hat auf der verschachtelten Form Phantom-Pakete namens
    `id` und `version` erfunden (gemessen am PROs-Modul, 2026-08-20); nur
    `version:` eines Unterblocks ist eine Pin-Angabe, alles andere ist keins."""
    if not text:
        return None
    m = re.search(r'^dependencies:[ \t]*(?:#.*)?$', text, re.M)
    if not m:
        return None
    deps, cur, entry_indent = {}, None, None
    for ln in text[m.end():].splitlines():
        if re.match(r'^\S', ln):
            break
        if not ln.strip() or ln.lstrip().startswith("#"):
            continue
        mm = re.match(r'^([ \t]+)([A-Za-z0-9._\-]+):[ \t]*([^#\n]*?)[ \t]*(?:#.*)?$', ln)
        if not mm:
            continue
        ind = len(mm.group(1).expandtabs(2))
        key, val = mm.group(2), mm.group(3).strip().strip('"').strip("'")
        if entry_indent is None:
            entry_indent = ind
        if ind <= entry_indent:
            cur = key
            if val:
                deps[cur] = val
        elif key == "version" and cur:
            deps[cur] = val
    return deps


def sushi_langs(text):
    langs, m = [], re.search(r'^\s*i18n-lang:\s*(?:#.*)?$', text, re.M)
    if m:
        for ln in text[m.end():].splitlines():
            mm = re.match(r'\s+-\s*([A-Za-z-]+)\s*$', ln)
            if mm:
                langs.append(mm.group(1))
            elif ln.strip() and not ln.startswith(" "):
                break
    return langs


def git_commit(d):
    try:
        return subprocess.run(["git", "-C", d, "rev-parse", "--short", "HEAD"],
                              capture_output=True, text=True, timeout=10).stdout.strip() or None
    except Exception:
        return None


# ---------- FSH-Deklarationen (Provenienz) ------------------------------------
DECL_RE = re.compile(r'^(Profile|Extension|ValueSet|CodeSystem|Logical|Instance|Mapping|Invariant|RuleSet):\s*([^\s(]+)')

# Kanonische/definitorische R4-Typen OHNE eigene Zähl-Kategorie. Eine Instanz
# dieser Typen ist KEIN Beispiel: der frühere "alles andere = examples"-Default
# hat 37 ConceptMaps (Onkologie), Measure/Library/EvidenceVariable (MTB) und
# 41 ObservationDefinitions (PROs) lautlos als Beispiele gezählt — genau dort,
# wo der Artefakt-Mix das Migrationsrisiko ist (Census 2026-08-20).
CANONICAL_INSTANCE_TYPES = frozenset((
    "ConceptMap", "StructureMap", "NamingSystem", "TerminologyCapabilities",
    "Measure", "Library", "EvidenceVariable", "Evidence", "ResearchDefinition",
    "ResearchElementDefinition", "ObservationDefinition", "SpecimenDefinition",
    "ActivityDefinition", "PlanDefinition", "EventDefinition", "GraphDefinition",
    "MessageDefinition", "CompartmentDefinition", "ExampleScenario",
    "ChargeItemDefinition", "TestScript", "ImplementationGuide"))


def scan_fsh(igdir, fshdir):
    decls = []
    for fp in sorted(glob.glob(os.path.join(fshdir, "**", "*.fsh"), recursive=True)):
        rp = rel(igdir, fp)
        last = None
        for i, ln in enumerate(read(fp).splitlines(), 1):
            m = DECL_RE.match(ln)
            if m:
                last = {"type": m.group(1), "name": m.group(2), "path": rp, "line": i,
                        "instanceOf": None, "usage": None}
                decls.append(last)
            elif last and last["type"] == "Instance":
                if last["instanceOf"] is None:
                    mi = re.match(r'^InstanceOf:\s*(\S+)', ln)
                    if mi:
                        last["instanceOf"] = mi.group(1)
                        continue
                if last["usage"] is None:
                    mu = re.match(r'^Usage:\s*(#\S+)', ln)
                    if mu:
                        last["usage"] = mu.group(1)
    return decls


def _empty_counts():
    c = {k: 0 for k in PUBLISHED_ARTIFACTS + INTERNAL_ARTIFACTS}
    c["other"] = {}
    return c


def counts_from_decls(decls):
    c = _empty_counts()
    lst = []
    for d in decls:
        t, io = d["type"], (d.get("instanceOf") or "")
        key = {"Profile": "profiles", "Extension": "extensions", "ValueSet": "valuesets",
               "CodeSystem": "codesystems", "Logical": "logicals", "Mapping": "mappings",
               "Invariant": "invariants", "RuleSet": "rulesets"}.get(t)
        if t == "Instance":
            key = ("capabilitystatements" if io == "CapabilityStatement" else
                   "searchparameters" if io == "SearchParameter" else
                   "operations" if io == "OperationDefinition" else
                   "questionnaires" if io == "Questionnaire" else None)
            # Beispiel ist nur, was #example deklariert ODER ein Modul-Profil
            # instanziiert. Eine Instanz eines kanonischen Basistyps (ConceptMap,
            # Measure, ObservationDefinition, ...) ist ein eigenständiges
            # Artefakt und landet im offenen `other`-Eimer statt bei den
            # Beispielen (vorher lautlos absorbiert).
            if key is None:
                if io in CANONICAL_INSTANCE_TYPES and d.get("usage") != "#example":
                    c["other"][io] = c["other"].get(io, 0) + 1
                    key = "other"
                else:
                    key = "examples"
        if not key:
            continue
        if key != "other":
            c[key] += 1
        lst.append({"type": t, "name": d["name"], "instanceOf": d.get("instanceOf"),
                    "category": key, "path": d["path"], "line": d["line"]})
    return c, lst


def counts_from_generated(gendir, igdir):
    c = _empty_counts()
    lst = []
    # Rekursiv: verteilte Pakete dürfen Unterverzeichnisse tragen (gemessen:
    # Kardiologie-Alpha mit package/examples/) — ein flacher Glob verliert sie
    # kommentarlos.
    for fp in sorted(glob.glob(os.path.join(gendir, "**", "*.json"), recursive=True)):
        try:
            d = json.load(open(fp, encoding="utf-8"))
        except Exception:
            continue
        rt, rid = d.get("resourceType"), d.get("id")
        if not rt or rt == "ImplementationGuide":
            continue
        if rt == "StructureDefinition":
            key = "logicals" if d.get("kind") == "logical" else "extensions" if d.get("type") == "Extension" else "profiles"
        else:
            key = {"ValueSet": "valuesets", "CodeSystem": "codesystems",
                   "CapabilityStatement": "capabilitystatements", "Questionnaire": "questionnaires",
                   "SearchParameter": "searchparameters", "OperationDefinition": "operations"}.get(rt)
            if key is None:
                if rt in CANONICAL_INSTANCE_TYPES:
                    c["other"][rt] = c["other"].get(rt, 0) + 1
                    key = "other"
                else:
                    key = "examples"
        if key != "other":
            c[key] += 1
        lst.append({"type": rt, "name": rid, "instanceOf": None, "category": key,
                    "path": rel(igdir, fp), "line": None})
    return c, lst


def find_resource_dir(igdir):
    """Liefert (dir, kind) für generierte Ressourcen: fsh-generated bevorzugt, sonst package/.

    package/ wird REKURSIV geprüft: index-lose Pakete mit verschachtelten
    Unterverzeichnissen (Kardiologie-Fund 2026-08-20) fielen sonst lautlos
    durch den flachen Glob. Auf Wurzelebene bleibt die Prüfung flach — dort
    wäre Rekursion ein Streuverlust über das ganze Repo."""
    gen = os.path.join(igdir, "fsh-generated", "resources")
    if os.path.isdir(gen) and glob.glob(os.path.join(gen, "*.json")):
        return gen, "fsh-generated/resources"
    pkg = os.path.join(igdir, "package")
    for fp in glob.glob(os.path.join(pkg, "**", "*.json"), recursive=True)[:200]:
        try:
            if json.load(open(fp, encoding="utf-8")).get("resourceType"):
                return pkg, rel(igdir, pkg) + " (Package, reduziert)"
        except Exception:
            continue
    for fp in glob.glob(os.path.join(igdir, "*.json"))[:50]:
        try:
            if json.load(open(fp, encoding="utf-8")).get("resourceType"):
                return igdir, rel(igdir, igdir) + " (Package, reduziert)"
        except Exception:
            continue
    return None, None


# ---------- Pre-flight (migration Gate 0) --------------------------------------
def compute_preflight(igdir, identity, deps_items, gendir, genkind=None, deps_block_present=None):
    """Migration-decisive aspects, measured OFFLINE from the tree alone
    (2026-08-20, from the Studie try-run review; package-layout and
    narrative-source aspects added after the module-census gap analysis the
    same day). Registry lookups, source builds and remote fetches stay OUT of
    this instrument on purpose - a null is not a zero, and every None below
    names what a migration pre-flight must obtain elsewhere."""
    # (a) licence EVIDENCE, tiered: value + where it was read. Absence and
    # contradiction are first-class findings (Studie: no tier carried one).
    ev = []
    if identity.get("license"):
        ev.append({"source": "sushi-config.yaml/package.json", "value": identity["license"]})
    lic_file = None
    for cand in ("LICENSE", "LICENSE.md", "LICENSE.txt"):
        fp = os.path.join(igdir, cand)
        if os.path.isfile(fp):
            first = (read(fp).strip().splitlines() or [""])[0][:80]
            lic_file = {"source": cand, "value": first}
            ev.append(lic_file)
            break
    lic_pat = re.compile(r"(CC[- ]?BY[- 0-9.]*|CC0[^A-Za-z]|Creative Commons|Apache[- ]2\.0|MIT License)", re.I)
    hits = []
    for fp in glob.glob(os.path.join(igdir, "input", "pagecontent", "*.md")) + \
              glob.glob(os.path.join(igdir, "ImplementationGuide*", "**", "*.md"), recursive=True):
        m = lic_pat.search(read(fp))
        if m:
            hits.append({"source": rel(igdir, fp),
                         "value": re.sub(r"[^0-9A-Za-z.\-]+$", "", m.group(1).strip())})
    ev.extend(hits[:5])
    values = {re.sub(r"[^0-9a-z.\-]+$", "", e["value"].lower().replace(" ", "")) for e in ev}
    licence = {"evidence": ev, "declared_anywhere": bool(ev),
               "contradictory": len(values) > 1, "distinct_values": sorted(values)}
    # (b) canonical-space census - predicts the special-url list and exposes
    # example.org-type defects. Measured from generated resources only; a
    # tree without them yields None, never a fabricated zero.
    canonical = identity.get("canonical")
    out_of_space = None
    if gendir and canonical:
        out_of_space = []
        for fp in sorted(glob.glob(os.path.join(gendir, "**", "*.json"), recursive=True)):
            try:
                d = json.load(open(fp, encoding="utf-8"))
            except Exception:
                continue
            u = d.get("url")
            if u and d.get("resourceType") != "ImplementationGuide" and not u.startswith(canonical):
                out_of_space.append({"type": d.get("resourceType"), "id": d.get("id"), "url": u})
    # id<->url mismatches are the SECOND special-url class: the url lives in
    # the canonical space but not at <canonical>/<Type>/<id> (measured on the
    # Studie CapabilityStatement, canonical .../CapabilityStatement/metadata).
    id_url_mismatch = None
    if gendir and canonical:
        id_url_mismatch = []
        for fp in sorted(glob.glob(os.path.join(gendir, "**", "*.json"), recursive=True)):
            try:
                d = json.load(open(fp, encoding="utf-8"))
            except Exception:
                continue
            u, rt, rid = d.get("url"), d.get("resourceType"), d.get("id")
            if u and rt and rid and rt != "ImplementationGuide" and \
               u.startswith(canonical) and u != "%s/%s/%s" % (canonical, rt, rid):
                id_url_mismatch.append({"type": rt, "id": rid, "url": u})
    # Config-Widerspruch: sushi-config und package.json, die verschiedene
    # canonicals deklarieren, sind ein Identitäts-Befund (gemessen: PROs'
    # package.json trägt ein modul-dok-Canonical - Copy-Paste-Altlast).
    pkg_canon = None
    try:
        pkg_canon = (json.load(open(os.path.join(igdir, "package.json"), encoding="utf-8"))
                     or {}).get("canonical")
    except Exception:
        pass
    canon_prefix = lambda u: (u or "").split("/ImplementationGuide/")[0] or None
    canon = {"canonical": canonical,
             "package_json_canonical": pkg_canon,
             "config_contradiction": bool(canonical and pkg_canon
                                          and canon_prefix(pkg_canon) != canonical),
             "out_of_space_count": len(out_of_space) if out_of_space is not None else None,
             "out_of_space": (out_of_space or [])[:20],
             "id_url_mismatch": (id_url_mismatch or [])[:10],
             "special_url_prediction": (len(out_of_space) + len(id_url_mismatch))
                 if out_of_space is not None and id_url_mismatch is not None else None,
             "example_org": [x for x in (out_of_space or []) if "example.org" in x["url"]]}
    # (c) dependency-pin health: old-style/virtual packages the toolchain
    # rewrites or warns about, and the THO/Extensions-Pack direct-pin gap
    # (absent -> the IG Publisher injects the LATEST release at build time;
    # verified in PublisherIGLoader).
    dep_ids = list(deps_items or {})
    old_style = [d for d in dep_ids if re.match(r"hl7\.fhir\.extensions\.r\d", d)]
    has_tho = any("hl7.terminology" in d for d in dep_ids)
    has_ext = any(d.startswith("hl7.fhir.uv.extensions") for d in dep_ids)
    parents = None
    if gendir:
        parents = set()
        for fp in glob.glob(os.path.join(gendir, "**", "StructureDefinition-*.json"), recursive=True):
            try:
                d = json.load(open(fp, encoding="utf-8"))
            except Exception:
                continue
            b = d.get("baseDefinition") or ""
            if b and canonical and not b.startswith(canonical) and \
               not b.startswith("http://hl7.org/fhir/StructureDefinition/"):
                parents.add(b)
        parents = sorted(parents)
    dep_health = {"old_style_packages": old_style,
                  "tho_pinned_directly": has_tho, "extensions_pinned_directly": has_ext,
                  "injection_risk": not (has_tho and has_ext),
                  "external_parents": parents,
                  # None = kein sushi-config gelesen; False = KEIN dependencies-
                  # Block; True + leere items = Block vorhanden, aber kein
                  # Eintrag lesbar - ein Parser-Befund, KEIN Beleg für "keine
                  # Abhängigkeiten" (PROs-Lehre).
                  "dependency_block_present": deps_block_present,
                  "dependency_block_unparsed": bool(deps_block_present) and not dep_ids}
    # (c2) package LAYOUT - only meaningful when the measured tree IS a
    # distributed package: a missing package/.index.json silently starves
    # every index-based oracle downstream, and nested resource directories
    # defeat flat globs (both measured on the Kardiologie alpha, 2026-08-20).
    layout = None
    if gendir and genkind and "Package" in genkind:
        nested = sorted({os.path.relpath(os.path.dirname(fp), gendir)
                         for fp in glob.glob(os.path.join(gendir, "**", "*.json"), recursive=True)
                         if os.path.dirname(fp) != gendir})
        layout = {"resource_dir": rel(igdir, gendir),
                  "index_json_present": os.path.isfile(os.path.join(gendir, ".index.json")),
                  "nested_resource_dirs": [d for d in nested if d != "."]}
    # (c3) narrative SOURCES - which trees carry prose, and whether TWO carry
    # it at once (dual source: rank-1 preference without a freshness check
    # silently migrates the stale copy - Onkologie/ICU class).
    n_pc = bool(glob.glob(os.path.join(igdir, "input", "pagecontent", "*.md")))
    n_intro = bool(glob.glob(os.path.join(igdir, "input", "intro-notes", "*.md")))
    n_guide = bool(glob.glob(os.path.join(igdir, "implementation-guides", "**", "*.md"), recursive=True))
    def _last_commit(sub):
        try:
            r = subprocess.run(["git", "-C", igdir, "log", "-1", "--format=%cI", "--", sub],
                               capture_output=True, text=True, timeout=15)
            return r.stdout.strip() or None
        except Exception:
            return None
    nsources = {"pagecontent": n_pc, "intro_notes": n_intro,
                "implementation_guides_tree": n_guide,
                "dual_source": n_guide and (n_pc or n_intro),
                "pagecontent_last_commit": _last_commit("input/pagecontent") if n_pc else None,
                "implementation_guides_last_commit": _last_commit("implementation-guides") if n_guide else None}
    # (d) QA baseline: a rendered qa in the tree, if any. None = the migration
    # pre-flight must build the unmigrated source or fetch its rendered qa -
    # without it, "pre-existing error" claims have no proof.
    qa = None
    for cand in ("output/qa.json", "docs/qa.json", "qa.json"):
        fp = os.path.join(igdir, cand)
        if os.path.isfile(fp):
            try:
                d = json.load(open(fp, encoding="utf-8"))
                qa = {"source": cand, "errs": d.get("errs"), "warnings": d.get("warnings"),
                      "date": d.get("date") or d.get("dateISO8601")}
            except Exception:
                qa = {"source": cand, "errs": None, "warnings": None, "date": None}
            break
    return {"licence": licence, "canonical_space": canon,
            "dependency_health": dep_health, "package_layout": layout,
            "narrative_sources": nsources, "qa_baseline": qa,
            "_comment": "migration Gate-0 aspects; None = not measurable from this tree (obtain it, never assume it)"}


# ---------- Narrative ----------------------------------------------------------
def narrative_detail(igdir):
    out = []
    for f in sorted(glob.glob(os.path.join(igdir, "input", "pagecontent", "*.md"))):
        w = len(read(f).split())
        out.append({"path": rel(igdir, f), "words": w, "kind": "target", "stub": w < STUB_MIN_WORDS})
    # IG-Publisher-native Prosa AUSSERHALB von pagecontent: intro-notes werden
    # pro Artefakt eingebunden und sind Narrative (Basis-Fund 2026-08-20 - vorher
    # für den Zensus unsichtbar). Eigener kind-Wert, damit die bestehenden
    # Seiten-/Wort-Reihen vergleichbar bleiben.
    for f in sorted(glob.glob(os.path.join(igdir, "input", "intro-notes", "*.md"))):
        w = len(read(f).split())
        out.append({"path": rel(igdir, f), "words": w, "kind": "intro", "stub": w < STUB_MIN_WORDS})
    src = set(glob.glob(os.path.join(igdir, "implementation-guides", "**", "*.page.md"), recursive=True)) \
        | set(glob.glob(os.path.join(igdir, "implementation-guides", "**", "*.guide.md"), recursive=True))
    for f in sorted(src):
        w = len(read(f).split())
        base = os.path.basename(f).lower()
        stub = w < STUB_MIN_WORDS or any(s in base for s in STUB_NAMES)
        out.append({"path": rel(igdir, f), "words": w, "kind": "source", "stub": stub})
    # Translated narrative pages (input/translations/<lang>/pagecontent) are
    # narrative too — carried as kind "translation". The pre-existing counts
    # (pages, words, linguistics, mandatory pages) deliberately keep excluding
    # them so metric series stay comparable; the same-module verification and
    # the new translation_* fields read them.
    for f in sorted(glob.glob(os.path.join(igdir, "input", "translations", "*", "pagecontent", "*.md"))):
        w = len(read(f).split())
        out.append({"path": rel(igdir, f), "words": w, "kind": "translation", "stub": w < STUB_MIN_WORDS})
    return out


# ---------- Linguistik & Repo-Hygiene (Umfang, Dopplungen, ungenutzte Dateien) -
DUP_MIN_WORDS = 12


def _norm_text(s):
    s = re.sub(r'\{\{[^}]*\}\}', ' ', s)            # Direktiven entfernen
    s = re.sub(r'<[^>]+>', ' ', s)                  # HTML-Tags entfernen
    s = re.sub(r'[#>*_`|\-]+', ' ', s)              # Markdown-Satzzeichen
    return re.sub(r'\s+', ' ', s).strip().lower()


def linguistics_hygiene(igdir, ndetail, artifact_list):
    pages = [x for x in ndetail if not x["stub"]]
    words = sorted(x["words"] for x in pages)
    nn = len(words)
    median = 0
    if nn:
        median = words[nn // 2] if nn % 2 else round((words[nn // 2 - 1] + words[nn // 2]) / 2)
    by_w = sorted(pages, key=lambda x: -x["words"])
    linguistics = {
        "content_pages": nn, "words_total": sum(words),
        "words_avg": round(sum(words) / nn, 1) if nn else 0, "words_median": median,
        "words_min": words[0] if words else 0, "words_max": words[-1] if words else 0,
        "longest_page": by_w[0]["path"] if pages else None,
        "shortest_page": by_w[-1]["path"] if pages else None,
        "per_page": [{"path": x["path"], "words": x["words"]} for x in by_w]}

    # Inhaltliche Dopplungen: identische Absätze (>= DUP_MIN_WORDS Wörter) und identische Dateien
    para_map, file_hash = {}, {}
    all_text = []
    for x in ndetail:
        full = read(os.path.join(igdir, x["path"]))
        all_text.append(full.lower())
        file_hash.setdefault(hashlib.md5(_norm_text(full).encode()).hexdigest(), []).append(x["path"])
        for para in re.split(r'\n\s*\n', full):
            nb = _norm_text(para)
            if len(nb.split()) >= DUP_MIN_WORDS:
                e = para_map.setdefault(hashlib.md5(nb.encode()).hexdigest(),
                                        {"snippet": nb[:90], "locations": []})
                e["locations"].append(x["path"])
    dup_blocks = sorted([v for v in para_map.values() if len(v["locations"]) > 1],
                        key=lambda v: -len(v["locations"]))
    dup_files = [p for p in file_hash.values() if len(p) > 1]
    duplication = {"duplicate_block_count": len(dup_blocks),
                   "duplicate_blocks": dup_blocks[:15],
                   "duplicate_file_groups": dup_files}

    # Ungenutzte/nicht-referenzierte Dateien (Dead-Code-Analogie, konservativ/heuristisch)
    joined = " ".join(all_text)
    images = sorted(set(glob.glob(os.path.join(igdir, "input", "images", "*"))
                        + glob.glob(os.path.join(igdir, "implementation-guides", "**", "images", "*"), recursive=True)
                        + glob.glob(os.path.join(igdir, "input", "images-source", "*"))))
    images = [im for im in images if os.path.isfile(im)]
    unref_images = [rel(igdir, im) for im in images if os.path.basename(im).lower() not in joined]
    examples = [x["name"] for x in artifact_list if x.get("category") == "examples" and x.get("name")]
    unref_examples = [e for e in examples if e.lower() not in joined]
    hygiene = {"images_total": len(images), "unreferenced_images": unref_images,
               "examples_total": len(examples), "examples_not_in_narrative": unref_examples,
               "note": "Heuristik: 'nicht referenziert' = Dateiname/Artefaktname kommt in keiner Erklärseite vor. "
                       "Kein Beweis für Ungenutztheit (Referenz kann über Konfiguration/Build erfolgen)."}
    return linguistics, duplication, hygiene


# ---------- Direktiven ---------------------------------------------------------
def scan_directives(igdir, files, patterns):
    compiled = []
    for label, pat in patterns.items():
        try:
            compiled.append((label, re.compile(pat)))
        except re.error:
            pass
    by, occ, unknown_occ = {}, [], []
    for fp in files:
        for i, ln in enumerate(read(fp).splitlines(), 1):
            hit = False
            for label, rx in compiled:
                if rx.search(ln):
                    by[label] = by.get(label, 0) + 1
                    occ.append({"file": rel(igdir, fp), "line": i, "label": label, "text": ln.strip()[:80]})
                    hit = True
            if not hit and re.search(GENERIC_DIRECTIVE, ln):
                unknown_occ.append({"file": rel(igdir, fp), "line": i, "label": "UNBEKANNT", "text": ln.strip()[:80]})
    return {"total": sum(by.values()), "by_label": by, "unknown": len(unknown_occ),
            "occurrences": occ, "unknown_occurrences": unknown_occ}


# ---------- QC-Regeln ----------------------------------------------------------
def parse_qc(path):
    text = read(path)
    if not text:
        return None, []
    rules, cur = [], None
    for ln in text.splitlines():
        if re.match(r'^-\s', ln):
            cur = {"name": None, "action": None, "status": None, "category": None}
            rules.append(cur)
            m = re.match(r'^-\s+(\w[\w-]*):\s*"?([^"#\n]*)"?', ln)
            if m and m.group(1) in cur:
                cur[m.group(1)] = m.group(2).strip()
        elif cur is not None:
            m = re.match(r'^\s+(name|action|status|category|unique):\s*"?([^"#\n]*)"?', ln)
            if m and m.group(1) in cur:
                cur[m.group(1)] = m.group(2).strip()
    return len(rules), rules


# ---------- Strategie/Reife/Risiko (Gruppen K–P) -------------------------------
def git_stats(d):
    out = {"commits": None, "authors": None, "top_author_share": None, "days_since_last": None,
           "commits_per_year": None, "tags": None, "first": None, "last": None,
           "history_complete": None}
    # A shallow checkout (.git/shallow exists — including every clone resolve_input()
    # makes itself, --depth 1) has a truncated history. Author shares, cadence and tag
    # counts computed from it are fiction ("100 % top author" over 1 commit), not
    # measurement — so per the skill's "a null is not a zero" rule they stay null.
    if os.path.exists(os.path.join(d, ".git", "shallow")):
        out["history_complete"] = False
        return out
    try:
        r = subprocess.run(["git", "-C", d, "log", "--pretty=%an|%ae|%ad", "--date=short"],
                           capture_output=True, text=True, timeout=25)
        lines = [l for l in r.stdout.splitlines() if l.count("|") >= 2]
        if not lines:
            return out
        out["history_complete"] = True
        authors, dates = {}, []
        for l in lines:
            a, email, dt = l.split("|", 2)
            # Aliasing vermeiden: nach E-Mail gruppieren (gleiche Person, versch.
            # Anzeigenamen wie "Erika Mustermann" / "E. Mustermann"); Fallback auf
            # normalisierten Namen.
            key = email.strip().lower() or re.sub(r'[^a-z]', '', a.lower())
            authors[key] = authors.get(key, 0) + 1
            dates.append(dt.strip())
        out["commits"] = len(lines)
        out["authors"] = len(authors)
        out["top_author_share"] = round(max(authors.values()) / len(lines) * 100)
        out["first"], out["last"] = min(dates), max(dates)
        tg = subprocess.run(["git", "-C", d, "tag"], capture_output=True, text=True, timeout=10)
        out["tags"] = len([t for t in tg.stdout.splitlines() if t.strip()])
        if datetime:
            try:
                last = datetime.strptime(out["last"], "%Y-%m-%d")
                first = datetime.strptime(out["first"], "%Y-%m-%d")
                now = datetime.now()
                out["days_since_last"] = (now - last).days
                yrs = max((last - first).days / 365.0, 0.1)
                out["commits_per_year"] = round(len(lines) / yrs, 1)
            except Exception:
                pass
    except Exception:
        pass
    return out


def compute_example_coverage(artifact_list):
    profiles = [x for x in artifact_list if x["category"] == "profiles"]
    insts = {(x.get("instanceOf") or "") for x in artifact_list if x["category"] == "examples"}
    uncovered = [p["name"] for p in profiles if p["name"] not in insts]
    total = len(profiles)
    return {"profiles_total": total, "covered": total - len(uncovered), "uncovered": uncovered,
            "coverage_pct": round((total - len(uncovered)) / total * 100) if total else None}


def compute_governance(igdir):
    wf = glob.glob(os.path.join(igdir, ".github", "workflows", "*.y*ml"))
    pub = any(os.path.isfile(os.path.join(igdir, f)) for f in ("publication-request.json", "package-list.json"))
    ig_ini = os.path.isfile(os.path.join(igdir, "ig.ini"))
    devc = os.path.isdir(os.path.join(igdir, ".devcontainer")) or os.path.isfile(os.path.join(igdir, ".devcontainer.json"))
    flags = {"ci_workflows": len(wf), "publication_request": pub, "ig_ini": ig_ini, "devcontainer": devc}
    score = round(sum([len(wf) > 0, pub, ig_ini, devc]) / 4 * 100)
    flags["governance_score"] = score
    return flags


def maturity_components(identity, doc_health_pct, cov_pct, gov_score):
    # Counted/derived components only — deliberately NOT aggregated into a 0-100
    # score. The earlier "Reifegrad"/"Freigabe-Indikator" averaged these with
    # invented status weights (draft=45, active=85, ...), i.e. a readiness
    # estimate, which the skill's scope explicitly excludes. The components are
    # reported side by side; the judgement stays human.
    return {"components": {"Status": identity.get("status"),
                           "Doku-Vollständigkeit": doc_health_pct,
                           "Beispiel-Abdeckung": cov_pct,
                           "Governance": gov_score}}


def compute_portfolio(fsh_text, decl_names, artifacts, directives, pages, identity, deps_items, gs):
    dpp = round(directives["total"] / max(pages, 1), 2)
    lock_score = min(100, round(dpp * 12))
    lock_band = "hoch" if lock_score >= 60 else "mittel" if lock_score >= 25 else "gering"
    found = [name for name, pat in STD_TERMINOLOGY.items() if re.search(pat, fsh_text, re.I)]
    std_refs = sum(len(re.findall(pat, fsh_text, re.I)) for pat in STD_TERMINOLOGY.values())
    local_cs = artifacts.get("codesystems", 0)
    # Abstrakte FHIR-Basistypen (z.B. Parent eines Logical Model) zählen NICHT als
    # strategische Wiederverwendung — ausschließen, um die Quote nicht zu verfälschen.
    abstract_bases = {"Element", "Base", "Resource", "DomainResource", "BackboneElement", "BackboneType"}
    parents = [p for p in re.findall(r'^Parent:\s*(\S+)', fsh_text, re.M) if p not in abstract_bases]
    ext_parents = [p for p in parents if p not in decl_names]
    fv = identity.get("fhirVersion") or ""
    fv_map = {"4.0.1": ("R4", "aktuell verbreitet"), "4.3.0": ("R4B", "aktuell"), "5.0.0": ("R5", "neueste stabile"),
              "3.0.2": ("STU3", "veraltet"), "1.0.2": ("DSTU2", "veraltet")}
    fv_label, fv_note = fv_map.get(fv, (fv or "?", "unbekannt"))
    ig_year = int(identity.get("version", "")[:4]) if (identity.get("version") or "")[:4].isdigit() else None
    stale = []
    for k, v in deps_items.items():
        y = v[:4]
        if ig_year and y.isdigit() and int(y) <= ig_year - 2:
            stale.append("%s (%s)" % (k, v))
    return {
        "vendor_lockin_score": lock_score, "vendor_lockin_band": lock_band, "directives_per_page": dpp,
        "terminology_standard_systems": found, "terminology_standard_refs": std_refs, "local_codesystems": local_cs,
        "terminology_standard_share_pct": round(std_refs / (std_refs + local_cs) * 100) if (std_refs + local_cs) else None,
        "canonical_reuse_ratio_pct": round(len(ext_parents) / len(parents) * 100) if parents else None,
        "external_parents": len(ext_parents), "local_parents": len(parents) - len(ext_parents),
        "fhir_version_label": fv_label, "fhir_version_note": fv_note,
        "dependency_stale_count": len(stale), "dependency_stale": stale,
        "dependency_staleness_note": "Heuristik aus CalVer-Jahr; exakt nur via Package-Registry (extern).",
        "release_cadence_per_year": gs.get("commits_per_year"), "days_since_last_commit": gs.get("days_since_last"),
        "tags": gs.get("tags")}


def compute_risk(igdir, fsh_text, found_terms, example_decls, narrative, gs, quality):
    lic = [{"system": s, "license": TERM_LICENSE.get(s, "?")} for s in found_terms]
    # suppressed warnings: breit (Wildcard %...%) vs eng
    ign = read(os.path.join(igdir, "input", "ignoreWarnings.txt"))
    entries = [l for l in ign.splitlines() if l.strip() and not l.lstrip().startswith("#") and not l.startswith("==")]
    broad = [l for l in entries if l.strip().startswith("%") or l.strip().endswith("%") or "*" in l or len(l.strip()) < 8]
    # Datenschutz-Substanz: security-privacy-Seite + PII-Heuristik in Beispielen
    sp = [f for f in narrative["files"] if "security-privacy" in f["path"].lower() or "datenschutz" in f["path"].lower()]
    sp_words = max([f["words"] for f in sp], default=0)
    pii = bool(re.search(r'\bbirthDate\b|\bGeburtsdatum\b', fsh_text)) and bool(re.search(r'family|given|"name"', fsh_text))
    bus = gs.get("top_author_share")
    return {
        "terminology_license_flags": lic,
        "terminology_license_risk": any(s == "SNOMED CT" or TERM_LICENSE.get(s, "").startswith("lizenz") for s in found_terms),
        "suppressed_total": len(entries), "suppressed_broad": len(broad),
        "suppressed_warning_risk": "erhöht" if broad else ("gering" if entries else "keine"),
        "privacy_page_words": sp_words, "privacy_page_substantial": sp_words >= STUB_MIN_WORDS,
        "examples_contain_pii_like": pii,
        "bus_factor_top_author_pct": bus, "bus_factor_authors": gs.get("authors"),
        "bus_factor_risk": ("hoch" if (bus or 0) >= 80 else "mittel" if (bus or 0) >= 60 else "gering") if bus is not None else None,
        "breaking_change_risk": None,
        "breaking_change_note": "Erfordert Diff gegen die publizierte Vorversion (Build/extern) — statisch nicht erhoben."}


# ---------- analyze ------------------------------------------------------------
def analyze(igdir, label, content):
    sushi = read(os.path.join(igdir, "sushi-config.yaml"))
    # Verschachtelte Projektwurzel: ein Repo, dessen SUSHI-Projekt eine Ebene
    # tiefer liegt (gemessen: Strukturdaten, Projekt unter Resources/), lieferte
    # vorher eine komplett leere Identität OHNE Befund. Bis Tiefe 3 suchen und
    # die Analyse dorthin umwurzeln - sichtbar protokolliert, nie stillschweigend.
    project_root, project_root_candidates = None, []
    if not sushi:
        skip = {".git", "node_modules", "output", "temp", "input-cache",
                "template", "fsh-generated", "migration-log"}
        for depth in (1, 2, 3):
            for c in sorted(glob.glob(os.path.join(igdir, *(["*"] * depth), "sushi-config.yaml"))):
                if not set(os.path.relpath(c, igdir).split(os.sep)) & skip:
                    project_root_candidates.append(os.path.relpath(os.path.dirname(c), igdir))
            if project_root_candidates:
                break
        if project_root_candidates:
            project_root = project_root_candidates[0]
            igdir = os.path.join(igdir, project_root)
            sushi = read(os.path.join(igdir, "sushi-config.yaml"))
    try:
        pkg = json.load(open(os.path.join(igdir, "package.json"), encoding="utf-8"))
    except Exception:
        pkg = {}

    version = sushi_scalar(sushi, "version") or pkg.get("version")
    mp = re.search(r'^publisher:\s*(?:#.*)?\n\s+name:\s*"?([^"#\n]+)', sushi, re.M)
    identity = {
        "id": sushi_scalar(sushi, "id"), "canonical": sushi_scalar(sushi, "canonical") or pkg.get("canonical"),
        "packageId": sushi_scalar(sushi, "packageId") or pkg.get("name"),
        "name": sushi_scalar(sushi, "name") or pkg.get("name"),
        "title": sushi_scalar(sushi, "title") or pkg.get("title"), "version": version,
        "calver": bool(version and re.match(r'^\d{4}\.\d+\.\d+', version)),
        "status": sushi_scalar(sushi, "status"),
        "fhirVersion": sushi_scalar(sushi, "fhirVersion") or (pkg.get("fhirVersions") or [None])[0],
        "license": sushi_scalar(sushi, "license") or pkg.get("license"),
        "publisher": mp.group(1).strip() if mp else sushi_scalar(sushi, "publisher")}

    fshdir = os.path.join(igdir, "input", "fsh")
    fsh_files = glob.glob(os.path.join(fshdir, "**", "*.fsh"), recursive=True)
    fsh_present = bool(fsh_files)
    analysis_mode = "static"
    if fsh_present:
        artifacts, artifact_list = counts_from_decls(scan_fsh(igdir, fshdir))
        art_source = "input/fsh (FSH-Deklarationen)"
    else:
        gen, gsrc = find_resource_dir(igdir)
        if gen:
            artifacts, artifact_list = counts_from_generated(gen, igdir)
            art_source = gsrc
            if "Package" in (gsrc or ""):
                analysis_mode = "reduced"
        else:
            artifacts, artifact_list = _empty_counts(), []
            art_source = "(keine FSH/generierten Ressourcen gefunden)"
            analysis_mode = "reduced"
    artifacts["total"] = sum(artifacts[k] for k in PUBLISHED_ARTIFACTS)
    artifacts["other_total"] = sum((artifacts.get("other") or {}).values())
    artifacts["_source"] = art_source
    # Gegenprobe generiert-vs-deklariert: die FSH-Typisierung kennt nur
    # InstanceOf-NAMEN - eine Questionnaire-Instanz über ein Modulprofil zählt
    # dort als Beispiel. Liegen generierte Ressourcen daneben, wird deren
    # resourceType-Zählung mitgeführt und jede Abweichung benannt (gemessen:
    # PROs, 25 SDC-Questionnaires als 'examples' typisiert). Neuheit wird
    # Residuum, nie stille Absorption.
    artifacts["generated_crosscheck"] = None
    if fsh_present:
        gxdir, gxkind = find_resource_dir(igdir)
        if gxdir and "fsh-generated" in (gxkind or ""):
            gc, _gl = counts_from_generated(gxdir, igdir)
            mism = {k: {"declared": artifacts.get(k, 0), "generated": gc.get(k, 0)}
                    for k in PUBLISHED_ARTIFACTS if artifacts.get(k, 0) != gc.get(k, 0)}
            g_other = gc.get("other") or {}
            d_other = artifacts.get("other") or {}
            for k in sorted(set(g_other) | set(d_other)):
                if g_other.get(k, 0) != d_other.get(k, 0):
                    mism["other:" + k] = {"declared": d_other.get(k, 0), "generated": g_other.get(k, 0)}
            artifacts["generated_crosscheck"] = {
                "source": gxkind, "counts": {k: gc.get(k, 0) for k in PUBLISHED_ARTIFACTS},
                "other": g_other, "mismatches": mism}

    deps_raw = sushi_dependencies(sushi)
    deps_block_present = deps_raw is not None
    deps = deps_raw or {}
    floating = [k for k, v in deps.items() if re.search(r'(x|current|dev|latest)', v)]
    dependencies = {"count": len(deps), "pinned": len(deps) - len(floating), "floating": len(floating),
                    "items": deps, "floating_items": floating,
                    "block_present": deps_block_present,
                    "_source": "sushi-config.yaml: dependencies"}

    ndetail = narrative_detail(igdir)
    ntrans = [x for x in ndetail if x["kind"] == "translation"]
    nintro = [x for x in ndetail if x["kind"] == "intro"]
    ndetail_core = [x for x in ndetail if x["kind"] not in ("translation", "intro")]
    content_pages = [x for x in ndetail_core if not x["stub"]]
    has_target = any(x["kind"] == "target" and not x["stub"] for x in ndetail_core)
    fmt = "target" if has_target else "source" if ndetail_core else "leer"
    pc_base = {os.path.basename(x["path"])[:-3] for x in ndetail_core if x["kind"] == "target"}
    narrative = {"format": fmt, "pages": len(content_pages), "pages_all": len(ndetail_core),
                 "translation_pages": len(ntrans), "translation_words": sum(x["words"] for x in ntrans),
                 "intro_note_pages": len(nintro), "intro_note_words": sum(x["words"] for x in nintro),
                 "words": sum(x["words"] for x in content_pages),
                 "words_all_incl_stubs": sum(x["words"] for x in ndetail),
                 "images": len(glob.glob(os.path.join(igdir, "input", "images", "*")))
                 + len(glob.glob(os.path.join(igdir, "implementation-guides", "**", "images", "*"), recursive=True)),
                 "mandatory_present": [p for p in MANDATORY_PAGES if p in pc_base],
                 "mandatory_missing_in_target": [p for p in MANDATORY_PAGES if p not in pc_base] if fmt == "target" else [],
                 "files": ndetail}

    langs = sushi_langs(sushi)
    supp_files = []
    for lang in (langs or []):
        for ext in ("po", "json", "xliff"):
            for f in glob.glob(os.path.join(igdir, "input", "translations", lang, "*." + ext)):
                if os.path.basename(f).rsplit(".", 1)[0].split("-", 1)[0] in SUPPLEMENT_TYPES:
                    supp_files.append(rel(igdir, f))
    fsh_trans_files = [rel(igdir, f) for f in fsh_files
                       if re.search(r'insert Translation\(|StructureDefinition/translation', read(f))]
    i18n = {"default_lang": sushi_scalar(sushi, "i18n-default-lang") or sushi_scalar(sushi, "language"),
            "default_lang_source": "i18n-default-lang" if sushi_scalar(sushi, "i18n-default-lang") else
            ("language" if sushi_scalar(sushi, "language") else None),
            "languages": langs, "translation_supplements": len(supp_files), "supplement_files": supp_files,
            "translated_pages": len(glob.glob(os.path.join(igdir, "input", "pagecontent", "*-??.md"))),
            "fsh_translation_ext": bool(fsh_trans_files), "fsh_translation_files": fsh_trans_files}

    patterns = content.get("directive_patterns") or {}
    nfiles = [os.path.join(igdir, x["path"]) for x in ndetail]
    directives = scan_directives(igdir, nfiles, patterns) if patterns else \
        {"total": 0, "by_label": {}, "unknown": 0, "occurrences": [], "unknown_occurrences": []}

    qc_count, qc_rules = parse_qc(os.path.join(igdir, "qc", "custom.rules.yaml"))
    ign = read(os.path.join(igdir, "input", "ignoreWarnings.txt"))
    suppressed = len([l for l in ign.splitlines() if l.strip() and not l.lstrip().startswith("#")
                      and not l.startswith("==")]) if ign else None
    quality = {"qc_rules_defined": qc_count, "qc_rules": qc_rules,
               "qc_source": "qc/custom.rules.yaml" if qc_count is not None else None,
               "qc_violations": None, "suppressed_messages": suppressed, "qa_errors": None,
               "qa_warnings": None, "qa_hints": None, "broken_links": None, "qa_categories": None}

    linguistics, duplication, hygiene = linguistics_hygiene(igdir, ndetail_core, artifact_list)

    # ---- Strategie / Reife / Risiko (Gruppen K–P) ----
    fsh_text = " ".join(read(f) for f in fsh_files)
    decl_names = {x["name"] for x in artifact_list}
    gs = git_stats(igdir)
    example_cov = compute_example_coverage(artifact_list)
    gov = compute_governance(igdir)
    doc_health_pct = round(narrative["pages"] / narrative["pages_all"] * 100) if narrative["pages_all"] else None
    maturity = maturity_components(identity, doc_health_pct, example_cov["coverage_pct"], gov["governance_score"])
    maturity.update({"example_coverage": example_cov, "governance": gov, "doc_health_pct": doc_health_pct})
    gen_for_preflight, _gsrc2 = find_resource_dir(igdir)
    preflight = compute_preflight(igdir, identity, deps, gen_for_preflight, _gsrc2, deps_block_present)
    portfolio = compute_portfolio(fsh_text, decl_names, artifacts, directives, narrative["pages"], identity,
                                  dependencies["items"], gs)
    risk = compute_risk(igdir, fsh_text, portfolio["terminology_standard_systems"], None, narrative, gs, quality)

    ts = None
    if datetime:
        try:
            ts = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
        except Exception:
            ts = None
    return {"schemaVersion": SCHEMA_VERSION, "tool": "ig-stats.py", "mode": analysis_mode,
            "analyzed": {"path": os.path.abspath(igdir),
                         "label": label or identity["id"] or os.path.basename(os.path.abspath(igdir)),
                         "project_root_nested": project_root,
                         "project_root_candidates": project_root_candidates[1:] or None,
                         "git_commit": git_commit(igdir), "timestamp": ts},
            "identity": identity, "artifacts": artifacts, "artifacts_detail": artifact_list,
            "preflight": preflight,
            "dependencies": dependencies, "narrative": narrative, "linguistics": linguistics,
            "duplication": duplication, "hygiene": hygiene, "i18n": i18n,
            "directives": directives, "quality": quality,
            "maturity": maturity, "portfolio": portfolio, "risk": risk,
            "git": gs}


# ---------- Reporting-Bausteine (zentriert + farbiges Mermaid) -----------------
def _cell(x):
    return ("" if x is None else str(x)).replace("|", "\\|").replace("\n", " ")


def _de(x):
    """Zahl mit deutschem Dezimalkomma; ganzzahlige Werte ohne Nachkomma."""
    if isinstance(x, float):
        s = ("%.1f" % x).rstrip("0").rstrip(".")
    else:
        s = str(x)
    return s.replace(".", ",")


def _nz(x):
    """None -> Gedankenstrich (für Anzeige nicht erhobener Werte)."""
    return "—" if x is None else x


def _table(headers, rows):
    # Linksbündige Zellen (Tabelleninhalte NICHT zentriert); der Tabellen-BLOCK wird
    # über _emit() zentriert.
    out = ["| " + " | ".join(headers) + " |", "|" + "---|" * len(headers)]
    for r in rows:
        out.append("| " + " | ".join(_cell(c) for c in r) + " |")
    return "\n".join(out)


def _center(block):
    """Zentriert einen Markdown-Block GitHub-konform: align=center + Pflicht-Leerzeilen."""
    return '<div align="center">\n\n' + block.strip("\n") + '\n\n</div>'


def _emit(block):
    """Zentriert NUR Grafiken (Mermaid) und Tabellen-Blöcke; Text bleibt linksbündig."""
    t = block.lstrip()
    if t.startswith("```mermaid") or t.startswith("|"):
        return _center(block)
    return block


def _pie(title, mapping, palette):
    items = sorted([(k, v) for k, v in mapping.items() if isinstance(v, int) and v > 0], key=lambda x: -x[1])
    if not items:
        return ""
    tv = {("pie%d" % (i + 1)): palette[i % len(palette)] for i in range(len(items))}
    tv.update({"pieOpacity": "1", "pieSectionTextColor": "#1A1A1A", "pieTitleTextSize": "18px"})
    init = "%%{init: {'theme':'base','themeVariables':" + json.dumps(tv) + "}}%%"
    lines = ["```mermaid", init, "pie showData title " + title]
    for k, v in items:
        lines.append('    "%s" : %d' % (k, v))
    lines.append("```")
    return "\n".join(lines)


def _palette(content):
    return content.get("palette") or DEFAULT_PALETTE


def _intro(content, key):
    return (content.get("section_intros") or {}).get(key)


def _plural(n, sing, plur):
    return "%d %s" % (n, sing if n == 1 else plur)


def _methodology_blocks(content):
    """Anhang-Blöcke: Erklärung jeder genutzten Kennzahl (Nachvollziehbarkeit). In jedem Report."""
    me = content.get("metric_explanations") or []
    if not me:
        return []
    B = ["# Anhang: Methodik & Metrik-Erklärung"]
    intro = (content.get("section_intros") or {}).get("methodik")
    if intro:
        B.append("_%s_" % intro)
    B.append(_table(["Kennzahl", "Was es misst", "Herkunft / Berechnung"],
                    [(m["metrik"], m["misst"], m["herkunft"]) for m in me]))
    return B


# ---------- report -------------------------------------------------------------
def report(stats, content, out):
    i, a = stats["identity"], stats["artifacts"]
    d, n, t = stats["dependencies"], stats["narrative"], stats["directives"]
    q, ii = stats["quality"], stats["i18n"]
    pal = _palette(content)
    di = content.get("directive_info") or {}
    B = []

    B.append("# IG-Statistik — %s" % stats["analyzed"]["label"])
    meta = "Modus: `%s` · Stand: %s · Commit: `%s`" % (stats["mode"], stats["analyzed"]["timestamp"], stats["analyzed"]["git_commit"])
    if stats["mode"] == "reduced":
        meta += " · ⚠ reduzierte Analyse (nur generierte Ressourcen, kein FSH/Narrative)"
    B.append("_%s_" % meta)
    if stats["analyzed"].get("project_root_nested"):
        B.append("**⚠ Verschachtelte Projektwurzel:** das SUSHI-Projekt liegt unter `%s/` — die "
                 "Analyse wurde dorthin umgewurzelt%s. Eine Migration muss dieselbe Wurzel wählen "
                 "(Shape `A (nested)`), sonst läuft sie gegen einen leeren Baum." % (
                     stats["analyzed"]["project_root_nested"],
                     "; weitere Kandidaten: %s" % ", ".join("`%s`" % c for c in stats["analyzed"]["project_root_candidates"])
                     if stats["analyzed"].get("project_root_candidates") else ""))

    # Kennzahlen-Überblick
    B.append("## Kennzahlen-Überblick")
    other = a.get("other") or {}
    B.append("### Artefakte (Σ %d publiziert%s)" % (
        a.get("total", 0),
        " + %d weitere kanonische Typen" % a.get("other_total", 0) if a.get("other_total") else ""))
    if _intro(content, "artefakte"):
        B.append("_%s_" % _intro(content, "artefakte"))
    art = {k: a.get(k, 0) for k in PUBLISHED_ARTIFACTS if a.get(k, 0)}
    art.update(other)
    pie = _pie("Artefakte", art, pal)
    if pie:
        B.append(pie)
    B.append(_table(["Typ", "Anzahl"], sorted(art.items(), key=lambda x: -x[1])))
    if other:
        B.append("_`%s`: kanonische Basistyp-Instanzen mit eigener Zeile — KEINE Beispiele; "
                 "jede braucht in einer Migration eine eigene Seiten-/Menü-Entscheidung._"
                 % "`, `".join(sorted(other)))
    gx = a.get("generated_crosscheck")
    if gx and gx.get("mismatches"):
        B.append("**⚠ Gegenprobe generiert-vs-deklariert** (`%s`): %s — für Seiten-/Menü-"
                 "Entscheidungen ist die generierte resourceType-Zählung maßgeblich; die "
                 "FSH-Deklarationstypisierung kennt nur InstanceOf-Namen." % (
                     gx["source"],
                     "; ".join("`%s` deklariert %d / generiert %d" % (k, v["declared"], v["generated"])
                               for k, v in sorted(gx["mismatches"].items()))))
    internal = {k: a.get(k, 0) for k in INTERNAL_ARTIFACTS if a.get(k, 0)}
    if internal:
        B.append("_Interne FSH-Konstrukte (nicht in Σ): %s._" % ", ".join("%d %s" % (v, k) for k, v in internal.items()))

    if t["total"]:
        B.append("### Plattform-Direktiven — Σ %d (unbekannt: %d)" % (t["total"], t["unknown"]))
        if _intro(content, "direktiven"):
            B.append("_%s_" % _intro(content, "direktiven"))
        pie = _pie("Direktiven", t["by_label"], pal)
        if pie:
            B.append(pie)
        B.append(_table(["Direktive", "Anzahl"], sorted(t["by_label"].items(), key=lambda x: -x[1])))

    # Inhaltsumfang & Repo-Hygiene (Linguistik, Dopplungen, ungenutzte Dateien)
    lg, dup, hy = stats["linguistics"], stats["duplication"], stats["hygiene"]
    B.append("## Inhaltsumfang & Repo-Hygiene")
    if _intro(content, "inhaltsumfang"):
        B.append("_%s_" % _intro(content, "inhaltsumfang"))
    B.append(_table(["Kennzahl", "Wert"], [
        ("Inhalts-Seiten", lg["content_pages"]),
        ("Wörter gesamt", lg["words_total"]),
        ("Ø Wörter / Seite", _de(lg["words_avg"])),
        ("Median Wörter / Seite", lg["words_median"]),
        ("kürzeste / längste Seite", "%d / %d Wörter" % (lg["words_min"], lg["words_max"])),
        ("doppelte Inhaltsblöcke", dup["duplicate_block_count"]),
        ("identische Seiten (Gruppen)", len(dup["duplicate_file_groups"])),
        ("Bilder nicht referenziert", "%d von %d" % (len(hy["unreferenced_images"]), hy["images_total"])),
        ("Beispiele nicht in Narrativen", "%d von %d" % (len(hy["examples_not_in_narrative"]), hy["examples_total"])),
    ]))
    B.append("_%s_" % hy["note"])

    # Reife-Komponenten (gezählt, bewusst NICHT zu einem Score verdichtet)
    nz = lambda x: "—" if x is None else x
    mt = stats["maturity"]
    cov = mt["example_coverage"]
    B.append("## Reife-Komponenten (gezählt)")
    if _intro(content, "reife"):
        B.append("_%s_" % _intro(content, "reife"))
    B.append(_table(["Komponente", "Wert"], [
        ("Status", i.get("status")),
        ("Doku-Vollständigkeit (Inhalt vs. Stubs)", "%s %%" % nz(mt["doc_health_pct"])),
        ("Beispiel-Abdeckung Profile", "%s %% (%d/%d)" % (nz(cov["coverage_pct"]), cov["covered"], cov["profiles_total"])),
        ("Governance (CI · ig.ini · publication · devcontainer)", "%s/100" % mt["governance"]["governance_score"]),
    ]))
    if cov["uncovered"]:
        B.append("**Profile ohne Beispiel (%d):** %s" % (len(cov["uncovered"]), ", ".join("`%s`" % x for x in cov["uncovered"])))

    # Strategie: Wiederverwendung, Lock-in, Zukunftssicherheit
    pf = stats["portfolio"]
    B.append("## Strategie: Wiederverwendung, Lock-in & Zukunftssicherheit")
    if _intro(content, "strategie"):
        B.append("_%s_" % _intro(content, "strategie"))
    B.append(_table(["Kennzahl", "Wert"], [
        ("Hersteller-Lock-in", "%d/100 (%s) · %s Direktiven/Seite" % (pf["vendor_lockin_score"], pf["vendor_lockin_band"], _de(pf["directives_per_page"]))),
        ("Standard-Terminologie-Anteil", "%s %% (%s)" % (nz(pf["terminology_standard_share_pct"]), ", ".join(pf["terminology_standard_systems"]) or "keine")),
        ("Wiederverwendung externer Profile (Parents)", "%s %% (%d von %d Profil-Parents extern; abstrakte LM-Basistypen ausgeschlossen)" % (nz(pf["canonical_reuse_ratio_pct"]), pf["external_parents"], pf["external_parents"] + pf["local_parents"])),
        ("FHIR-Version", "%s — %s" % (pf["fhir_version_label"], pf["fhir_version_note"])),
        ("Dependency-Veraltung", "%d veraltet (Heuristik)" % pf["dependency_stale_count"]),
        ("Pflege-Kadenz", ("nicht ermittelbar (shallow clone — unvollständige Git-Historie)"
                           if (stats.get("git") or {}).get("history_complete") is False else
                           "%s Commits/Jahr · letzter Commit vor %s Tagen" % (nz(pf["release_cadence_per_year"]), nz(pf["days_since_last_commit"])))),
    ]))
    B.append("_Lock-in und Standard-Terminologie-Anteil sind grobe Heuristiken aus Textvorkommen. %s_" % pf["dependency_staleness_note"])

    # Risiko & Compliance
    rk = stats["risk"]
    B.append("## Risiko & Compliance")
    if _intro(content, "risiko"):
        B.append("_%s_" % _intro(content, "risiko"))
    B.append(_table(["Risiko", "Bewertung"], [
        ("Terminologie-Lizenz", ("%s — %s" % ("Lizenzbedarf möglich" if rk["terminology_license_risk"] else "unkritisch",
                                              ", ".join("%s: %s" % (x["system"], x["license"]) for x in rk["terminology_license_flags"]) or "keine externen Systeme"))),
        ("Unterdrückte QA-Warnungen", "%d (davon %d breit) → %s" % (rk["suppressed_total"], rk["suppressed_broad"], rk["suppressed_warning_risk"])),
        ("Datenschutz-Seite (Substanz)", "%s (%d Wörter)" % ("vorhanden/substanziell" if rk["privacy_page_substantial"] else "fehlt/nur Stub", rk["privacy_page_words"])),
        ("PII-artige Beispieldaten", "ja – prüfen" if rk["examples_contain_pii_like"] else "keine erkannt"),
        ("Bus-Faktor (Wissenskonzentration)", ("%s %% Top-Autor → %s" % (rk["bus_factor_top_author_pct"], rk["bus_factor_risk"])) if rk["bus_factor_top_author_pct"] is not None else
         ("nicht ermittelbar (shallow clone — unvollständige Git-Historie)"
          if (stats.get("git") or {}).get("history_complete") is False else "—")),
        ("Breaking-Change-Risiko ggü. Vorversion", "— (nur per Build/Vorversions-Diff)"),
    ]))

    # Befunde & Einordnung (Messwerte + neutrale Erklärung; KEINE Handlungs-/
    # Migrationsanweisungen — die frühere "Empfehlungen"-Fassung war Migrations-
    # Scoping, das der Skill-Scope ausdrücklich ausschließt)
    B.append("## Befunde & Einordnung")
    if _intro(content, "empfehlungen"):
        B.append("_%s_" % _intro(content, "empfehlungen"))
    fsh_present = str(a.get("_source") or "").startswith("input/fsh")
    befund = {
        "Artefakte (FSH)": "%d publiziert, FSH %s" % (a.get("total"), "vorhanden" if fsh_present else "fehlt"),
        "Narrative": "%d Inhalts-Seiten, Format %s" % (n["pages"], n["format"]),
        "Direktiven": "%d (%d unbekannt)" % (t["total"], t["unknown"]),
        "Dependencies": "%d (%d floating)" % (d["count"], d["floating"]),
        "Mehrsprachigkeit": "FSH-Übersetzung %s, Supplements %d" % ("ja" if ii["fsh_translation_ext"] else "nein", ii["translation_supplements"]),
        "Pflichtseiten": "%d/%d im Zielformat" % (len(n["mandatory_present"]), len(MANDATORY_PAGES)),
        "QC-Regeln": "%s definiert" % (q.get("qc_rules_defined") if q.get("qc_rules_defined") is not None else "—"),
        "Metadaten/Config": "id %s, v%s" % (i.get("id"), i.get("version"))}
    mrows = []
    for row in (content.get("mapping_rows") or []):
        b = row.get("bereich")
        if b not in befund:      # a row without a measured Befund has no place here
            continue
        mrows.append((b, befund[b], row.get("einordnung") or row.get("empfehlung")))
    if mrows:
        B.append(_table(["Bereich", "Befund", "Einordnung"], mrows))

    # Extra-Abschnitt: Direktiven-Mapping (Faktenreferenz, kein Arbeitsauftrag)
    if t["by_label"]:
        B.append("## Direktiven-Mapping (Detail)")
        if _intro(content, "direktiven_mapping"):
            B.append("_%s_" % _intro(content, "direktiven_mapping"))
        rows = []
        for lbl, cnt in sorted(t["by_label"].items(), key=lambda x: -x[1]):
            info = di.get(lbl, {})
            rows.append((lbl, cnt, info.get("what", ""), info.get("reco", "")))
        B.append(_table(["Direktive", "Anzahl", "Was es tut", "Standard-Gegenstück (IG Publisher)"], rows))
        if t["unknown"]:
            B.append("> **%d unbekannte Treffer** ohne bekanntes Standard-Gegenstück – einzeln manuell prüfen "
                     "(Fundorte im Anhang)." % t["unknown"])

    # ===================== ANHANG =====================
    B.append("# Anhang: Detailaufschlüsselung")
    if _intro(content, "anhang"):
        B.append("_%s_" % _intro(content, "anhang"))

    B.append("## Identität & Herkunft")
    if _intro(content, "identitaet"):
        B.append("_%s_" % _intro(content, "identitaet"))
    B.append(_table(["Feld", "Wert", "Quelle"],
                    [(k, i.get(k), "sushi-config.yaml / package.json") for k in
                     ("id", "canonical", "packageId", "name", "title", "version", "status",
                      "fhirVersion", "license", "publisher")] + [("calver", i.get("calver"), "version-Regex")]))

    B.append("## Dependencies")
    if _intro(content, "dependencies"):
        B.append("_%s_" % _intro(content, "dependencies"))
    if d["items"]:
        B.append(_table(["Package", "Version", "Pin"],
                        [(k, v, "floating ⚠" if k in d["floating_items"] else "gepinnt") for k, v in d["items"].items()]))
    else:
        B.append("_keine_")

    pf = stats.get("preflight") or {}
    if pf:
        B.append("## Pre-flight (Migration Gate 0)")
        lic = pf.get("licence") or {}
        B.append("- Lizenz-Evidenz: %s%s" % (
            ("; ".join("%s → %s" % (e["source"], e["value"]) for e in lic.get("evidence", [])) or "**KEINE — in keiner Quelle deklariert**"),
            " — **WIDERSPRÜCHLICH**" if lic.get("contradictory") else ""))
        cs = pf.get("canonical_space") or {}
        B.append("- Canonical-Raum: %s außerhalb + %s id/url-abweichend → special-url-Prognose: %s%s" % (
            _cell(cs.get("out_of_space_count")), len(cs.get("id_url_mismatch") or []),
            _cell(cs.get("special_url_prediction")),
            "; example.org-Canonicals: %d" % len(cs.get("example_org") or []) if cs.get("example_org") else ""))
        if cs.get("config_contradiction"):
            B.append("- **⚠ Canonical-WIDERSPRUCH in den Configs:** sushi-config `%s` vs package.json `%s` — "
                     "Identitätsentscheidung VOR der Migration (Upstream-Kandidat)" % (
                         cs.get("canonical"), cs.get("package_json_canonical")))
        dh = pf.get("dependency_health") or {}
        B.append("- Dependency-Gesundheit: old-style=%s; THO direkt gepinnt=%s, Extensions-Pack=%s%s; externe Parents: %s%s" % (
            ", ".join(dh.get("old_style_packages") or []) or "keine",
            dh.get("tho_pinned_directly"), dh.get("extensions_pinned_directly"),
            " — **Injektionsrisiko: der Publisher lädt zur Buildzeit das JEWEILS NEUESTE Release**" if dh.get("injection_risk") else "",
            len(dh.get("external_parents") or []),
            " — **Block vorhanden, aber KEIN Eintrag lesbar (Parser-Befund, kein Beleg für Abhängigkeitsfreiheit)**" if dh.get("dependency_block_unparsed") else
            ("" if dh.get("dependency_block_present") is not False else " — kein dependencies-Block deklariert")))
        pl = pf.get("package_layout")
        if pl:
            B.append("- Paket-Layout: %s — .index.json %s%s" % (
                pl.get("resource_dir"),
                "vorhanden" if pl.get("index_json_present") else "**FEHLT — jedes index-basierte Orakel läuft leer**",
                "; verschachtelte Ressourcen-Verzeichnisse: %s" % ", ".join(pl["nested_resource_dirs"]) if pl.get("nested_resource_dirs") else ""))
        ns = pf.get("narrative_sources") or {}
        if ns.get("dual_source"):
            B.append("- Narrative-Quellen: **DUAL** — implementation-guides/ (letzter Commit %s) UND %s (letzter Commit %s); "
                     "vor der Migration entscheiden, welche Kopie maßgeblich ist (Frische, nicht Rang)" % (
                         ns.get("implementation_guides_last_commit") or "?",
                         "pagecontent+intro-notes" if ns.get("intro_notes") else "pagecontent",
                         ns.get("pagecontent_last_commit") or "?"))
        elif ns.get("intro_notes"):
            B.append("- Narrative-Quellen: IG-Publisher-nativ (pagecontent%s)" %
                     (" + intro-notes" if ns.get("intro_notes") else ""))
        qa = pf.get("qa_baseline")
        B.append("- QA-Baseline: %s" % ("%s → err=%s warn=%s (%s)" % (qa["source"], qa["errs"], qa["warnings"], qa.get("date")) if qa else
            "**keine im Baum** — für Vorher/Nachher-Beweise die unmigrierte Quelle bauen oder deren gerendertes qa beziehen"))
        B.append("")
    B.append("## Artefakte (Quelle: %s)" % a.get("_source"))
    if _intro(content, "artefakte_detail"):
        B.append("_%s_" % _intro(content, "artefakte_detail"))
    ad = stats.get("artifacts_detail", [])
    if ad:
        B.append(_table(["Typ", "Name", "InstanceOf", "Quelle"],
                        [(x["type"], x["name"], x.get("instanceOf") or "",
                          ("%s:%s" % (x["path"], x["line"])) if x.get("line") else x["path"]) for x in ad]))
    else:
        B.append("_keine Artefakte gefunden_")

    B.append("## Narrative-Seiten (%d Inhalt / %d gesamt)" % (n["pages"], n["pages_all"]))
    if _intro(content, "narrative"):
        B.append("_%s_" % _intro(content, "narrative"))
    if n["files"]:
        B.append(_table(["Datei", "Wörter", "Format", "Stub?"],
                        [(x["path"], x["words"], x["kind"], "ja" if x["stub"] else "")
                         for x in sorted(n["files"], key=lambda x: -x["words"])]))
    else:
        B.append("_keine_")
    if n["format"] == "target" and n["mandatory_missing_in_target"]:
        B.append("**Fehlende Pflichtseiten im Zielformat:** " + ", ".join("`%s`" % x for x in n["mandatory_missing_in_target"]))
    elif n["format"] == "source":
        B.append("> Format = **source**: die Pflichtseiten existieren im Quell-Guide; „fehlende Zielseiten\" "
                 "wird hier daher nicht als Lücke gewertet.")

    if t.get("occurrences") or t.get("unknown_occurrences"):
        B.append("## Direktiven-Fundstellen")
        if _intro(content, "fundstellen"):
            B.append("_%s_" % _intro(content, "fundstellen"))
        rows = [("%s:%s" % (o["file"], o["line"]), o["label"], o["text"]) for o in t.get("occurrences", [])]
        rows += [("%s:%s" % (o["file"], o["line"]), "UNBEKANNT", o["text"]) for o in t.get("unknown_occurrences", [])]
        B.append(_table(["Fundstelle", "Direktive", "Text (gekürzt)"], rows))

    B.append("## QC-Regeln (definiert; Quelle: %s)" % (q.get("qc_source") or "—"))
    if _intro(content, "qc"):
        B.append("_%s_" % _intro(content, "qc"))
    if q.get("qc_rules"):
        B.append(_table(["Name", "Aktion", "Prüfzweck (status)"],
                        [(r.get("name") or "—", r.get("action") or "", r.get("status") or "") for r in q["qc_rules"]]))
        B.append("> QC-Verletzungen werden erst beim Qualitätslauf des Builds erhoben (statisch nicht erfasst).")
    else:
        B.append("_keine QC-Regeldatei gefunden_")

    B.append("## Mehrsprachigkeit")
    if _intro(content, "mehrsprachigkeit"):
        B.append("_%s_" % _intro(content, "mehrsprachigkeit"))
    ml = ["- Default-Sprache: `%s` (Quelle: %s) · konfigurierte Sprachen: %s"
          % (ii["default_lang"], ii.get("default_lang_source"), ii["languages"] or "—"),
          "- Übersetzungs-Supplements: %d" % ii["translation_supplements"],
          "- FSH-Translation-Extensions: %s" % ("ja" if ii["fsh_translation_ext"] else "nein")]
    if q.get("suppressed_messages") is not None:
        ml.append("- Unterdrückte QA-Meldungen (`ignoreWarnings.txt`): %d" % q["suppressed_messages"])
    B.append("\n".join(ml))

    # Anhang: Dopplungen & ungenutzte Dateien (Detail)
    if dup["duplicate_blocks"] or dup["duplicate_file_groups"] or hy["unreferenced_images"] or hy["examples_not_in_narrative"]:
        B.append("## Dopplungen & ungenutzte Dateien")
        if _intro(content, "hygiene_detail"):
            B.append("_%s_" % _intro(content, "hygiene_detail"))
        if dup["duplicate_blocks"]:
            B.append(_table(["Doppelter Inhaltsblock (gekürzt)", "Vorkommen"],
                            [(b["snippet"], " · ".join(b["locations"])) for b in dup["duplicate_blocks"]]))
        if dup["duplicate_file_groups"]:
            B.append("**Identische Seiten:** " + "; ".join(" = ".join("`%s`" % p for p in g) for g in dup["duplicate_file_groups"]))
        if hy["unreferenced_images"]:
            B.append("**Nicht referenzierte Bilder (%d):** %s"
                     % (len(hy["unreferenced_images"]), ", ".join("`%s`" % x for x in hy["unreferenced_images"])))
        if hy["examples_not_in_narrative"]:
            B.append("**Beispiele nicht in Narrativen eingebunden (%d):** %s"
                     % (len(hy["examples_not_in_narrative"]), ", ".join("`%s`" % x for x in hy["examples_not_in_narrative"])))

    # Anhang: Methodik & Metrik-Erklärung
    B.extend(_methodology_blocks(content))

    # Glossar
    gloss = content.get("glossary") or []
    if gloss:
        B.append("# Anhang: Glossar")
        if _intro(content, "glossar"):
            B.append("_%s_" % _intro(content, "glossar"))
        B.append(_table(["Begriff", "Erklärung"], [(g["term"], g["plain"]) for g in sorted(gloss, key=lambda x: x["term"].lower())]))

    txt = "\n\n".join(_emit(b) for b in B if b) + "\n"
    if out:
        open(out, "w", encoding="utf-8").write(txt)
    return txt


# ---------- compare ------------------------------------------------------------
def compare(statslist, content, out):
    pal = _palette(content)

    def lab(s):
        return s["analyzed"]["label"]
    # Same-module detection (migration verification): every input carries the
    # same non-empty packageId -> the inputs are versions/states of ONE module
    # (typically: the Simplifier source vs its migrated copy). Aggregating a
    # "Σ Gesamt" over the same module is meaningless, and the questions change:
    # identity equality, artifact-set equality, canonical-URL equality and
    # narrative coverage. All of it is counted, none of it forecast.
    pkg_ids = {(s["identity"].get("packageId") or "") for s in statslist}
    same_module = len(statslist) > 1 and len(pkg_ids) == 1 and "" not in pkg_ids
    B = []
    B.append("# IG-Vergleich (%d IGs)" % len(statslist))
    if same_module:
        B.append("_Same-Module-Vergleich: alle Eingaben tragen dieselbe packageId "
                 "(`%s`) — der Report prüft **Migrations-/Zustandstreue** statt Portfolio-Umfang. "
                 "Referenz ist die ERSTE Eingabe._" % next(iter(pkg_ids)))
    else:
        B.append("_Objektiver Kennzahlen-Vergleich der analysierten IGs inkl. Linguistik. "
                 "Die Spalte „Σ Gesamt“ zeigt den aggregierten Gesamtumfang; "
                 "faire Einordnung über normalisierte Werte._")

    if same_module:
        B.append("## Same-Module-Verifikation")
        if _intro(content, "same_module"):
            B.append("_%s_" % _intro(content, "same_module"))
        # -- identity equality --
        ID_FIELDS = ("id", "canonical", "packageId", "name", "title", "version",
                     "status", "fhirVersion", "license", "publisher")
        id_rows, id_diff = [], 0
        for f_ in ID_FIELDS:
            vals = [s["identity"].get(f_) for s in statslist]
            same = len({json.dumps(v, ensure_ascii=False) for v in vals}) == 1
            if not same:
                id_diff += 1
            id_rows.append([f_] + [_nz(v) for v in vals] + ["✓ identisch" if same else "⚠ DIVERGIERT"])
        B.append(_table(["Identitätsfeld"] + [lab(s) for s in statslist] + ["Befund"], id_rows))
        # -- artifact-set equality (category+name from the FSH declarations) --
        # Verdict on PUBLISHED artifacts only; internal FSH constructs (rulesets,
        # invariants, mappings) are reported separately — a template adoption
        # legitimately adds scaffold rulesets without changing the module.
        sets = [{(x["category"], x["name"]) for x in s.get("artifacts_detail", [])
                 if x["category"] in PUBLISHED_ARTIFACTS} for s in statslist]
        isets = [{(x["category"], x["name"]) for x in s.get("artifacts_detail", [])
                  if x["category"] in INTERNAL_ARTIFACTS} for s in statslist]
        art_lines, art_diff, int_lines = [], 0, []
        for i in range(1, len(statslist)):
            missing, extra = sorted(sets[0] - sets[i]), sorted(sets[i] - sets[0])
            art_diff += len(missing) + len(extra)
            if missing:
                art_lines.append("**Publizierte Artefakte, fehlend in %s:** %s" % (lab(statslist[i]), ", ".join("`%s/%s`" % m for m in missing)))
            if extra:
                art_lines.append("**Publizierte Artefakte, zusätzlich in %s:** %s" % (lab(statslist[i]), ", ".join("`%s/%s`" % e for e in extra)))
            imiss, iextra = sorted(isets[0] - isets[i]), sorted(isets[i] - isets[0])
            if imiss or iextra:
                int_lines.append("_Interne FSH-Konstrukte (informativ, kein Befund): %s: %d fehlend, %d zusätzlich (z.B. Template-Rulesets)._"
                                 % (lab(statslist[i]), len(imiss), len(iextra)))
        # -- canonical-URL equality (opportunistic: read fsh-generated when present) --
        def _urlset(s):
            d_ = os.path.join(s["analyzed"].get("path") or "", "fsh-generated", "resources")
            if not os.path.isdir(d_):
                return None
            out = set()
            for f_ in glob.glob(os.path.join(d_, "*.json")):
                try:
                    j = json.load(open(f_, encoding="utf-8"))
                except Exception:
                    continue
                if j.get("resourceType") != "ImplementationGuide" and j.get("url"):
                    out.add(j["url"])
            return out
        urlsets = [_urlset(s) for s in statslist]
        url_verdict, url_diff = "nicht ermittelbar (fsh-generated fehlt bei mindestens einer Eingabe)", 0
        if all(u is not None for u in urlsets):
            url_diff = sum(len(urlsets[0] ^ u) for u in urlsets[1:])
            url_verdict = "✓ identisch (%d URLs)" % len(urlsets[0]) if url_diff == 0 else                 "⚠ %d abweichende URL(s): %s" % (url_diff, ", ".join(sorted(set().union(*[urlsets[0] ^ u for u in urlsets[1:]]))[:6]))
        # -- narrative per language bucket + coverage --
        def _buckets(s):
            b = {"Default-Sprache (input/pagecontent)": [0, 0], "Übersetzungen (input/translations)": [0, 0],
                 "Plattform-Quellseiten (verbleibend)": [0, 0], "sonstige": [0, 0]}
            for f_ in s["narrative"]["files"]:
                p_, w_ = f_["path"], f_["words"]
                k = ("Übersetzungen (input/translations)" if p_.startswith("input/translations/") else
                     "Default-Sprache (input/pagecontent)" if p_.startswith("input/pagecontent/") else
                     "Plattform-Quellseiten (verbleibend)" if p_.startswith("implementation-guides/") else "sonstige")
                b[k][0] += 1; b[k][1] += w_
            return b
        bks = [_buckets(s) for s in statslist]
        B.append("### Narrative je Sprach-Ebene (Seiten / Wörter)")
        B.append(_table(["Ebene"] + [lab(s) for s in statslist],
                        [[k] + ["%d / %d" % tuple(b[k]) for b in bks] for k in bks[0]]))
        ref_words = sum(v[1] for v in bks[0].values()) or 1
        cov = ["_Wort-Abdeckung relativ zur Referenz (Heuristik; ein bilingualer Stand überschreitet 100 %):_ "]
        for i in range(1, len(statslist)):
            d_w = bks[i]["Default-Sprache (input/pagecontent)"][1]
            t_w = bks[i]["Übersetzungen (input/translations)"][1]
            cov.append("**%s: Default %d %% · Übersetzungen %d %%**"
                       % (lab(statslist[i]), round(d_w / ref_words * 100), round(t_w / ref_words * 100)))
        B.append(" ".join(cov))
        # -- verdicts (counted, not forecast) --
        B.append("### Befund")
        B.append("\n".join([
            "- Identität: %s" % ("**IDENTISCH**" if id_diff == 0 else "**⚠ %d Feld(er) DIVERGIEREN**" % id_diff),
            "- Publizierter Artefakt-Satz (Kategorie+Name): %s" % ("**IDENTISCH** (%d Artefakte)" % len(sets[0]) if art_diff == 0 else "**⚠ %d Abweichung(en)**" % art_diff),
            "- Canonical-URLs der Artefakte: %s" % url_verdict,
        ] + art_lines + int_lines))

    B.append("## Kennzahlen (je IG%s)" % ("" if same_module else " + Gesamt"))
    add_rows = [
        ("Artefakte gesamt", lambda s: s["artifacts"]["total"]),
        ("Profile", lambda s: s["artifacts"].get("profiles", 0)),
        ("ValueSets", lambda s: s["artifacts"].get("valuesets", 0)),
        ("CodeSystems", lambda s: s["artifacts"].get("codesystems", 0)),
        ("Beispiele", lambda s: s["artifacts"].get("examples", 0)),
        ("Narrative-Inhalts-Seiten", lambda s: s["narrative"]["pages"]),
        ("Wörter gesamt", lambda s: s["linguistics"]["words_total"]),
        ("Plattform-Direktiven", lambda s: s["directives"]["total"]),
        ("Doppelte Inhaltsblöcke", lambda s: s["duplication"]["duplicate_block_count"]),
        ("Nicht referenzierte Bilder", lambda s: len(s["hygiene"]["unreferenced_images"])),
    ]
    krows = []
    for name, fn in add_rows:
        vals = [fn(s) for s in statslist]
        krows.append([name] + vals + ([] if same_module else [sum(vals)]))
    for name, fn in [("Dependencies (floating)", lambda s: "%d (%d)" % (s["dependencies"]["count"], s["dependencies"]["floating"])),
                     ("Ø Wörter / Seite", lambda s: _de(s["linguistics"]["words_avg"])),
                     ("Median Wörter / Seite", lambda s: s["linguistics"]["words_median"]),
                     ("Hersteller-Lock-in /100", lambda s: s["portfolio"]["vendor_lockin_score"]),
                     ("Standard-Terminologie %", lambda s: _nz(s["portfolio"]["terminology_standard_share_pct"])),
                     ("Bus-Faktor % (Top-Autor)", lambda s: _nz(s["risk"]["bus_factor_top_author_pct"]))]:
        krows.append([name] + [fn(s) for s in statslist] + ([] if same_module else ["—"]))
    B.append(_table(["Metrik"] + [lab(s) for s in statslist] + ([] if same_module else ["Σ Gesamt"]), krows))

    # Portfolio: Wiederverwendung & Konsolidierung (Cross-IG-Overlap, Skaleneffekt)
    name_to_igs = {}
    for s in statslist:
        for x in s.get("artifacts_detail", []):
            if x["category"] in ("profiles", "extensions", "valuesets", "codesystems"):
                name_to_igs.setdefault("%s|%s" % (x["category"], x["name"]), set()).add(lab(s))
    shared = {} if same_module else {k: v for k, v in name_to_igs.items() if len(v) > 1}
    if not same_module:
        B.append("## Portfolio: Wiederverwendung & Konsolidierung")
    B.append("_Artefakte mit identischem Namen in mehreren IGs deuten auf Konsolidierungspotenzial (gemeinsames Basis-Modul) hin; senkt den Gesamt-Wartungsaufwand._")
    if shared:
        B.append(_table(["Geteiltes Artefakt (Typ)", "vorkommend in"],
                        [("%s (%s)" % (k.split("|", 1)[1], k.split("|", 1)[0]), " · ".join(sorted(v))) for k, v in sorted(shared.items())]))
    elif not same_module:
        B.append("_Keine namensgleichen Artefakte über die IGs gefunden — geringe direkte Überlappung._")

    B.append("## Normalisierte Kennzahlen (fairer Vergleich)")

    def per(s, num, den):
        dv = den(s)
        return round(num(s) / dv, 2) if dv else 0
    B.append(_table(["Metrik"] + [lab(s) for s in statslist], [
        ["Direktiven je Seite"] + [per(s, lambda x: x["directives"]["total"], lambda x: x["narrative"]["pages"]) for s in statslist],
        ["Beispiele je Profil"] + [per(s, lambda x: x["artifacts"].get("examples", 0), lambda x: x["artifacts"].get("profiles", 0)) for s in statslist],
    ]))

    maxart = max((s["artifacts"]["total"] for s in statslist), default=1) or 1
    maxdir = max((s["directives"]["total"] for s in statslist), default=1) or 1
    B.append("## Umfang: Artefakte vs. Plattform-Direktiven")
    tv = {"quadrant1Fill": pal[0], "quadrant2Fill": pal[1], "quadrant3Fill": pal[2], "quadrant4Fill": pal[3],
          "quadrant1TextFill": "#FFFFFF", "quadrant2TextFill": "#FFFFFF", "quadrant3TextFill": "#FFFFFF",
          "quadrant4TextFill": "#FFFFFF", "quadrantPointFill": "#1A1A1A", "quadrantPointTextFill": "#1A1A1A",
          "quadrantXAxisTextFill": "#1A1A1A", "quadrantYAxisTextFill": "#1A1A1A", "quadrantTitleFill": "#1A1A1A"}
    mer = ["```mermaid", "%%{init: {'theme':'base','themeVariables':" + json.dumps(tv) + "}}%%", "quadrantChart",
           "    title Artefakte vs. Direktiven", "    x-axis Wenige_Artefakte --> Viele_Artefakte",
           "    y-axis Wenige_Direktiven --> Viele_Direktiven", "    quadrant-1 viele & direktivenlastig",
           "    quadrant-2 wenige & direktivenlastig", "    quadrant-3 wenige & direktivenarm",
           "    quadrant-4 viele & direktivenarm"]
    for s in statslist:
        mer.append('    "%s": [%s, %s]' % (lab(s), round(s["artifacts"]["total"] / maxart, 3),
                                           round(s["directives"]["total"] / maxdir, 3)))
    mer.append("```")
    B.append("\n".join(mer))

    # Anhang: Methodik & Metrik-Erklärung (auch im Vergleichsreport)
    B.extend(_methodology_blocks(content))

    txt = "\n\n".join(_emit(b) for b in B if b) + "\n"
    if out:
        open(out, "w", encoding="utf-8").write(txt)
    return txt


# ---------- Eingabe-Auflösung (Pfad ODER URL) ----------------------------------
def resolve_input(inp, workdir):
    """-> (dir, herkunft). Lokaler Pfad, Git-URL (clone) oder Package-.tgz (download)."""
    if os.path.isdir(inp):
        return os.path.abspath(inp), "lokaler Pfad"
    low = inp.lower()
    os.makedirs(workdir, exist_ok=True)
    if low.endswith(".tgz") or low.endswith(".tar.gz"):
        dest = os.path.join(workdir, _slug(os.path.basename(inp)))
        os.makedirs(dest, exist_ok=True)
        tmp = os.path.join(dest, "_pkg.tgz")
        urllib.request.urlretrieve(inp, tmp)
        with tarfile.open(tmp) as tf:
            tf.extractall(dest)
        return dest, "Package-Download (.tgz)"
    is_git = low.startswith("git@") or low.endswith(".git") or "github.com" in low or "gitlab" in low or low.startswith("http")
    if is_git:
        url, branch = inp, None
        m = re.search(r'(.*?)/(?:tree|blob)/([^/]+)/?$', inp)
        if m:
            url, branch = m.group(1), m.group(2)
        if not url.endswith(".git") and ("github.com" in url or "gitlab" in url):
            url = url.rstrip("/") + ".git"
        dest = os.path.join(workdir, _slug(re.sub(r'\.git$', '', os.path.basename(url.rstrip("/")))))
        if not os.path.isdir(os.path.join(dest, ".git")):
            cmd = ["git", "clone", "--depth", "1"]
            if branch:
                cmd += ["--branch", branch]
            cmd += [url, dest]
            r = subprocess.run(cmd, capture_output=True, text=True, timeout=300)
            if r.returncode != 0:
                raise RuntimeError("git clone fehlgeschlagen für %s:\n%s" % (inp, r.stderr.strip()[:400]))
        return dest, "Git-Clone (%s)" % (branch or "default")
    raise RuntimeError("Eingabe ist weder lokales Verzeichnis noch erkennbare Git-/Package-URL: %s" % inp)


def run(inputs, outdir, labels, content):
    os.makedirs(outdir, exist_ok=True)
    srcroot = os.path.join(outdir, "_sources")
    results = []
    used_slugs = set()
    for idx, inp in enumerate(inputs):
        try:
            d, herkunft = resolve_input(inp, srcroot)
        except Exception as ex:
            print("FEHLER bei Eingabe '%s': %s" % (inp, ex), file=sys.stderr)
            continue
        label = labels[idx] if labels and idx < len(labels) else None
        st = analyze(d, label, content)
        st["analyzed"]["input"] = inp
        st["analyzed"]["resolved_from"] = herkunft
        slug = _slug(st["identity"]["id"] or os.path.basename(d) or ("ig%d" % (idx + 1)))
        # Same-id inputs (e.g. a module compared against its own migrated copy)
        # must not overwrite each other's reports: disambiguate the slug with
        # the label when given, else a counter — and say so on the console line.
        if slug in used_slugs:
            suffix = _slug(label) if label else None
            cand = "%s-%s" % (slug, suffix) if suffix and suffix != slug else None
            n = 2
            while not cand or cand in used_slugs:
                cand = "%s-%d" % (slug, n); n += 1
            slug = cand
        used_slugs.add(slug)
        sp, rp = os.path.join(outdir, slug + "-stats.json"), os.path.join(outdir, slug + "-report.md")
        open(sp, "w", encoding="utf-8").write(json.dumps(st, ensure_ascii=False, indent=2) + "\n")
        report(st, content, rp)
        results.append(st)
        print("• %-28s [%s, %s] -> %s + %s"
              % (st["analyzed"]["label"], herkunft, st["mode"], os.path.basename(rp), os.path.basename(sp)))
    if len(results) > 1:
        cp = os.path.join(outdir, "compare-report.md")
        compare(results, content, cp)
        print("• Vergleichsreport (%d IGs) -> %s" % (len(results), os.path.basename(cp)))
    elif not results:
        print("Keine Eingabe konnte analysiert werden.", file=sys.stderr)
        return 2
    return 0


# ---------- CLI ----------------------------------------------------------------
def main():
    ap = argparse.ArgumentParser(prog="ig-stats.py", description="FHIR-IG vermessen + Reporting")
    sub = ap.add_subparsers(dest="cmd", required=True)
    LABEL_HELP = ("Anzeige-Label (bei run: Kommaliste je Eingabe) für Report-Überschrift und "
                  "Vergleichs-Spalten; die DATEINAMEN folgen immer der IG-id")
    pr_ = sub.add_parser("run"); pr_.add_argument("inputs", nargs="+"); pr_.add_argument("-o", default="ig-analyze-out"); pr_.add_argument("--label", help=LABEL_HELP)
    pa = sub.add_parser("analyze"); pa.add_argument("igdir"); pa.add_argument("-o"); pa.add_argument("--label", help=LABEL_HELP)
    pr = sub.add_parser("report"); pr.add_argument("stats"); pr.add_argument("-o")
    pc = sub.add_parser("compare"); pc.add_argument("stats", nargs="+"); pc.add_argument("-o")
    args = ap.parse_args()
    content = load_content()

    if args.cmd == "run":
        labels = [x.strip() for x in args.label.split(",")] if args.label else None
        return run(args.inputs, args.o, labels, content)
    if args.cmd == "analyze":
        if not os.path.isdir(args.igdir):
            print("FEHLER: kein Verzeichnis: %s" % args.igdir, file=sys.stderr); return 2
        stats = analyze(args.igdir, args.label, content)
        outp = json.dumps(stats, ensure_ascii=False, indent=2)
        if args.o:
            open(args.o, "w", encoding="utf-8").write(outp + "\n")
            print("ig-stats -> %s  (Artefakte %d, Direktiven %d, Inhalts-Seiten %d)"
                  % (args.o, stats["artifacts"]["total"], stats["directives"]["total"],
                     stats["narrative"]["pages"]))
        else:
            print(outp)
        return 0
    if args.cmd == "report":
        report(json.load(open(args.stats, encoding="utf-8")), content, args.o)
        print("Report -> %s" % args.o if args.o else "")
        return 0
    if args.cmd == "compare":
        compare([json.load(open(p, encoding="utf-8")) for p in args.stats], content, args.o)
        print("Vergleich -> %s" % args.o if args.o else "")
        return 0
    return 0


if __name__ == "__main__":
    sys.exit(main())
