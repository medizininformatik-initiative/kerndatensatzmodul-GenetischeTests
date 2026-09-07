import assert from "node:assert/strict";
import { test } from "node:test";
import { readFileSync } from "node:fs";

import {
  extractSection,
  forRelease,
  normalizeVersion,
  releaseNotes,
} from "./release-notes-from-changelog.mjs";

const CHANGELOG = [
  "### Changelog",
  "",
  "Intro prose that belongs to no version.",
  "",
  "#### Version 2027.0.0-ballot.rc2",
  "",
  "**Date:** 2026-09-04",
  "",
  "##### Terminology",
  "",
  "* All code systems pinned. See [profiles](profiles.html).",
  "",
  "#### Version 2027.0.0-ballot.rc1",
  "",
  "The first candidate.",
  "",
].join("\n");

test("a git tag and a bare version both resolve", () => {
  assert.equal(normalizeVersion("v2027.0.0-ballot.rc2"), "2027.0.0-ballot.rc2");
  assert.equal(normalizeVersion(" 2026.0.4 "), "2026.0.4");
  assert.throws(() => normalizeVersion(""), /nonempty/);
});

test("a section stops at the next version, not at its own sub-headings", () => {
  const body = extractSection(CHANGELOG, "2027.0.0-ballot.rc2");
  assert.match(body, /##### Terminology/);
  assert.match(body, /All code systems pinned/);
  assert.doesNotMatch(body, /The first candidate/);
  assert.doesNotMatch(body, /#### Version/);
});

test("the last section runs to the end of the file", () => {
  assert.match(extractSection(CHANGELOG, "2027.0.0-ballot.rc1"), /first candidate/);
});

test("intro prose above the first version is never included", () => {
  const body = extractSection(CHANGELOG, "2027.0.0-ballot.rc2");
  assert.doesNotMatch(body, /belongs to no version/);
});

test("an unknown version fails loudly and names what it did find", () => {
  assert.throws(
    () => extractSection(CHANGELOG, "1999.0.0"),
    /no section for version 1999\.0\.0.*2027\.0\.0-ballot\.rc2/s,
  );
});

test("a changelog without version sections fails rather than returning everything", () => {
  assert.throws(() => extractSection("# Nothing here\n", "2026.0.4"), /no '#### Version/);
});

test("editorial comments never reach the release page", () => {
  const out = forRelease("Kept.\n\n<!-- TODO:REVIEW decide at Gate C -->\n\nAlso kept.");
  assert.doesNotMatch(out, /TODO:REVIEW/);
  assert.match(out, /Kept\./);
  assert.match(out, /Also kept\./);
  assert.doesNotMatch(out, /\n{3,}/);
});

test("guide-relative links become absolute; other links are untouched", () => {
  const out = forRelease(
    "See [profiles](profiles.html) and [a section](changes.html#x) and [HL7](https://hl7.org) and [an anchor](#local).",
    { canonical: "https://example.org/ig/2027.0.0/" },
  );
  assert.match(out, /\(https:\/\/example\.org\/ig\/2027\.0\.0\/profiles\.html\)/);
  assert.match(out, /\(https:\/\/example\.org\/ig\/2027\.0\.0\/changes\.html#x\)/);
  assert.match(out, /\(https:\/\/hl7\.org\)/);
  assert.match(out, /\(#local\)/);
});

test("without a canonical the links are left as they are", () => {
  assert.match(forRelease("[p](profiles.html)"), /\(profiles\.html\)/);
});

test("the real changelog yields notes for the current version", () => {
  const md = readFileSync("input/pagecontent/changes.md", "utf8");
  const body = releaseNotes(md, "v2027.0.0-ballot.rc2", {
    canonical: "https://example.org/ig",
  });
  assert.ok(body.length > 500, "expected substantial notes");
  assert.doesNotMatch(body, /<!--/);
  assert.doesNotMatch(body, /Add your own release notes/);
});
