#!/usr/bin/env node

// Extract one version's section from the IG changelog page so a release can
// carry the notes that were already reviewed, instead of a scaffold telling a
// human to write them.
//
// WHY THIS EXISTS: module-release.yml used to create every release as a DRAFT
// whose body said "Add your own release notes here". That made publishing a
// manual step for a reason that was self-inflicted — the module already keeps
// per-version release notes on its changelog page, and those go through a pull
// request like any other change. This script reads them, so the release can be
// published straight from the tag.
//
// SOURCE: input/pagecontent/changes.md — the default-language (English) page.
// The German mirror is not used; a GitHub release has one body, and the
// default language is what the guide itself leads with.
//
// USAGE:
//   node scripts/release-notes-from-changelog.mjs 2027.0.0-ballot.rc2
//   node scripts/release-notes-from-changelog.mjs v2027.0.0-ballot.rc2 --file input/pagecontent/changes.md

import { existsSync, readFileSync, statSync } from "node:fs";
import { resolve } from "node:path";
import { pathToFileURL } from "node:url";

const DEFAULT_CHANGELOG = "input/pagecontent/changes.md";

// A version section starts at "#### Version <x>" and runs to the next heading
// of the SAME level. Sub-headings (#####) inside it belong to the section.
const SECTION_HEADING = /^#### Version (.+?)\s*$/gm;

/** Strip a leading "v" so a git tag and a CalVer version both work. */
export function normalizeVersion(version) {
  if (typeof version !== "string" || version.trim() === "") {
    throw new Error("version must be a nonempty string");
  }
  return version.trim().replace(/^v/, "");
}

/** Return the changelog body for one version, without its heading. */
export function extractSection(markdown, version) {
  const wanted = normalizeVersion(version);
  const headings = [...markdown.matchAll(SECTION_HEADING)];

  if (headings.length === 0) {
    throw new Error("the changelog contains no '#### Version ...' sections");
  }

  const index = headings.findIndex((h) => h[1].trim() === wanted);
  if (index === -1) {
    const known = headings.map((h) => h[1].trim()).slice(0, 5).join(", ");
    throw new Error(
      `the changelog has no section for version ${wanted} (found: ${known}${
        headings.length > 5 ? ", …" : ""
      })`,
    );
  }

  const start = headings[index].index + headings[index][0].length;
  const end =
    index + 1 < headings.length ? headings[index + 1].index : markdown.length;

  const body = markdown.slice(start, end).trim();
  if (body === "") {
    throw new Error(`the section for version ${wanted} is empty`);
  }
  return body;
}

/**
 * Drop editorial comments and rewrite guide-relative links to absolute ones.
 *
 * The changelog is written for a page inside the guide, so "changes.html" and
 * "profiles.html" resolve there but not on a GitHub release page. Anything
 * that is not a bare *.html target is left alone.
 */
export function forRelease(body, { canonical } = {}) {
  let out = body.replace(/<!--[\s\S]*?-->/g, "");

  if (canonical) {
    const base = canonical.replace(/\/+$/, "");
    out = out.replace(
      /\]\((?!https?:\/\/|#|mailto:)([A-Za-z0-9._-]+\.html(?:#[^)]*)?)\)/g,
      (_match, target) => `](${base}/${target})`,
    );
  }

  // Collapse the blank lines the comment removal leaves behind.
  return out.replace(/\n{3,}/g, "\n\n").trim();
}

export function releaseNotes(markdown, version, options) {
  return forRelease(extractSection(markdown, version), options);
}

function main(argv) {
  const args = argv.slice(2);
  let version;
  let file = DEFAULT_CHANGELOG;
  let canonical;

  for (let i = 0; i < args.length; i += 1) {
    if (args[i] === "--file") {
      file = args[i + 1];
      i += 1;
    } else if (args[i] === "--canonical") {
      canonical = args[i + 1];
      i += 1;
    } else if (!version) {
      version = args[i];
    }
  }

  if (!version) {
    throw new Error(
      "usage: release-notes-from-changelog.mjs <version> [--file <changelog>] [--canonical <url>]",
    );
  }

  const path = resolve(file);
  if (!existsSync(path) || !statSync(path).isFile()) {
    throw new Error(`changelog does not exist: ${path}`);
  }

  process.stdout.write(
    `${releaseNotes(readFileSync(path, "utf8"), version, { canonical })}\n`,
  );
}

if (import.meta.url === pathToFileURL(process.argv[1] ?? "").href) {
  try {
    main(process.argv);
  } catch (error) {
    process.stderr.write(`${error.message}\n`);
    process.exit(1);
  }
}
