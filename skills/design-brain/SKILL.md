---
name: design-brain
version: "1.2.0"
description: Full design process for NEW or REDESIGNED web pages, landing pages, hero sections, and product UI, so the result is specific to the brand and not generic AI-template output. Also handles small edits to an existing UI through a quick path. Handles setup, research, direction, build, and critique itself.
compatibility: Works with Claude Code, OpenAI Codex, Cursor, Windsurf, Gemini CLI, and any agentskills.io-compatible agent. A browser tool (Playwright or the built-in browser) is needed for screenshots in stages 2 and 5.
---

# Design Brain

You run the whole design process. The user gives you a design task. You work through the stages below, fetch whatever helpers you need, and pause only at the points listed in section 3. Never ask the user which sub-skill, stage, or command to run. Decide that yourself.

`SKILL_DIR` below means the folder that contains this `SKILL.md`. Record its absolute path during setup (step 1).

## 0. Setup (automatic, check at the start of every session)

0. **Silent update check.** Skip it if `.design-harness/config` contains `auto_update: false`. Never block on this and never mention it unless an update was applied. Compare the local `version:` in this file's frontmatter with the remote one:
   ```bash
   REMOTE="$(curl -fsS --max-time 3 https://raw.githubusercontent.com/vroooom007/design-brain-harness/main/VERSION 2>/dev/null | tr -d '[:space:]')"
   ```
   If `REMOTE` is empty (offline, timeout, error), skip this step. If `REMOTE` is a version greater than the local one (`sort -V`), update: when installed as a Claude Code plugin, tell the user once to run `/reload-plugins` after `claude plugin update design-brain@design-brain-marketplace` (run that command yourself first); otherwise run `npx --yes skills@latest update design-brain -y`. Then print one line (`design-brain updated to <REMOTE>.`) and continue with the current session without pausing. Check at most once per session.
1. **Project state.** If `.design-harness/harness-state.md` does not exist in the project root, create:
   - `.design-harness/research/`, `.design-harness/exploration/`, `.design-harness/critique/` (empty folders)
   - `.design-harness/harness-state.md` containing `stage: 01-brief-and-voice`, `surface: unset`, `baseline: unset`, and `skill_dir: <absolute SKILL_DIR>`.
   If it exists, read it and resume at its `stage:`.
2. **Subagents (Claude Code only).** Skip if installed as the `design-brain` plugin (it bundles them). Otherwise, if `.claude/agents/` lacks `research-scout.md` or `fresh-critic.md`, copy them from `SKILL_DIR/agents/`. Never overwrite a file that already exists.
3. **Companion skills.** Run `bash SKILL_DIR/scripts/check-installed-skills.sh` and write the results to `.design-harness/skill-map.md`. The details are in `references/companion-skills.md`.
4. **Missing helpers.** If any companion skill is missing and the user already ran the install flow (`INSTALL_PROMPT.md`), do nothing more: it has installed what it could. If the user invoked this skill manually without that flow, install the missing ones silently with `bash SKILL_DIR/scripts/sync-skills.sh --missing-only`, re-run step 3, and mention in one short line which helpers were added or are unavailable. Do not ask for confirmation. The design process works without helpers.
5. **Browser.** Use the first that works: Playwright, then the built-in browser, then none. Record it in `harness-state.md` as `browser: playwright|builtin|none`. At `none`, skip screenshots and tell the user once; the stage 5 audit then works from code and copy only, says so, and marks its scores "low confidence".

## 0.5 Pick the mode (decide silently)

- **Quick mode:** the request changes an existing UI (a component, spacing, a state, a copy tweak) and the project already has a visual language. Read the existing tokens or `DESIGN.md`, or infer them from the code. Make the change in the existing style, take one before/after screenshot if a browser is available, and stop. Do not create `.design-harness/`, run stages, or pause. Skip section 0 steps 1 to 5 in this mode.
- **Full mode:** a new page, a redesign, or no existing visual language. Continue to section 1.

If unsure, choose quick mode and offer full mode in one sentence at the end.

## 1. Where you are

Read the `stage:` field in `.design-harness/harness-state.md`. Load ONLY the matching file from `SKILL_DIR/stages/`. When that stage's done condition is met, update `stage:` and continue into the next stage without waiting, unless section 3 says to pause.

| `stage:` | File | Done when |
| :--- | :--- | :--- |
| `01-brief-and-voice` | `stages/01-brief-and-voice.md` | Brief and `VOICE.md` are written and approved |
| `02-research-scout` | `stages/02-research-scout.md` | Research is synthesized and the user has reacted |
| `03-explore-baseline` | `stages/03-explore-baseline.md` | A baseline direction is chosen and screenshotted |
| `04-crystallize-build` | `stages/04-crystallize-build.md` | `DESIGN.md` exists and the build runs at a local URL |
| `05-fresh-critic` | `stages/05-fresh-critic.md` | Two audit rounds are done and the final review is presented |

If `.design-harness/` already holds a finished project and the user asks for a new page, ask one question: continue the same project, or start a new one? A new one means a fresh `.design-harness/` folder with its own state.

## 2. Helpers run silently

- **Subagents.** Stage 2 research and stage 5 critique run in clean subagents (`research-scout`, `fresh-critic`) when the platform supports them. Pass them file paths only, never your build reasoning. If subagents are unavailable, run the stage's steps yourself and say the review was not isolated.
- **Companion skills.** Use an installed companion skill only at the stage where the stage file names it. Use it without announcing it. If it is not installed, follow the stage file's built-in guidance.

## 3. The only pauses

Stop and wait for the user at these points and nowhere else:

1. **End of stage 1.** Approve the brief, voice, and draft copy.
2. **End of stage 2.** Which references to keep or drop.
3. **End of stage 3.** Pick a direction or a hybrid. This is the baseline.
4. **End of stage 5.** Final review of the live render and audit results.

If the user says "just go" or "skip the review", honor that and note the skipped gate in `harness-state.md`.

## 4. Rules that hold in every stage

- Do not lock `DESIGN.md` or any design tokens before the baseline is approved.
- Every refinement must visibly improve on the approved baseline. Never fall back to safer, blander defaults.
- Write real copy from the first draft. No lorem ipsum, no placeholder headings, no dummy numbers.
- Follow `VOICE.md` for all visible text. Its banned list applies everywhere.
- Keep each stage file's output in `.design-harness/`. Do not scatter design artifacts elsewhere in the project.
