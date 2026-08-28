# Trigger prompts for `mii-ig-migration`

Mechanical validity does not imply the skill will ever be loaded. These are the Gate 3 prompts —
the empirical check required before promoting this skill from `experimental` to `stable` — and the
next annual re-validation reuses them rather than inventing new ones.

**Status: not yet run.** This skill has also not been exercised against a real migration since the
rework, which is the other reason its status is `experimental`. Two separate things unblock
promotion: running these prompts, and completing one real migration.

## How to run them

1. Install the catalog into a throwaway project so the agent sees only this skill's `name` and
   `description` at startup.
2. Issue each prompt in a fresh session. A prompt issued after the skill has been discussed proves
   nothing.
3. Record whether the skill activated without being asked for.
4. If a should-trigger prompt fails, **the description is the defect, not the user.**
5. If a should-not-trigger prompt activates this skill, the delimitation clause is too weak.

## Should trigger

1. "We want to get the KDS-Modul Person off Simplifier and onto the new module template. Here's the
   rendered IG and the GitHub repo."
2. "This Implementierungsleitfaden is still built with Forge and published on Simplifier. What
   would it take to move it to the IG Publisher?"
3. "The narrative pages are full of `{{tree}}` and `<fql>` blocks and none of it renders after the
   move. How do I convert them?"
4. "I copied our Manteldokument content into the new template but the build fails and I get a
   language mismatch warning on every profile."
5. "Does moving our module to the template change its canonical URL?"

Numbers 3, 4 and 5 are the important ones. All three are how the need actually arrives — a symptom,
a build failure, an anxious question — rather than how it would be filed. A description written
only for "migrate an IG" misses all three, and number 5 is the one where a wrong answer does
irreversible damage.

## Should not trigger

1. "Add a new profile for medication statements to this module." — authoring, not migration. The
   module template ships its own recipe.
2. "Translate the German pages of our IG into English." — the module template ships an
   `fhir-ig-translation` skill. This skill only sets translation up as part of a migration; if it activates
   here, its description is matching on *translation* and needs sharpening.
3. "Create a new KDS module from scratch." — the template's create-a-new-module recipe. Included
   because it is the nearest neighbour by vocabulary and the likeliest false positive.

## Recording a run

Append a dated block. Keep the prompts stable across runs — changing them makes two
re-validations incomparable, which defeats the point of storing them.

```markdown
### Run YYYY-MM-DD — <agent and version>

| # | Prompt | Expected | Observed |
| --- | --- | --- | --- |
| S1 | … | trigger | trigger |
| N1 | … | no trigger | no trigger |

Outcome: promoted / revised / unchanged. Notes: …
```
