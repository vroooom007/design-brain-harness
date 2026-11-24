# Companion Skills: Detection, Install, and Use

Companion skills are optional. Each stage works without them. This file is for setup only (steps 3 and 4 of `SKILL.md`). The agent uses it on its own. Do not present it to the user as a menu.

## 1. Where to look

`scripts/check-installed-skills.sh` scans these folders (project and home level):
`.agents/skills`, `.claude/skills`, `.cursor/skills`, `.cursor/rules`, `.windsurf/skills`, `.roo/skills`, `~/.agents/skills`, `~/.claude/skills`, `~/.codex/skills`.

A skill counts as installed if its folder or `.md` file name matches an alias below. If a user already has their own copy or fork, keep it. Do not overwrite or duplicate it. Record its path in `skill-map.md`.

## 2. Companion list

| Role | Source | Aliases to match | Used in stage | What it is used for |
| :--- | :--- | :--- | :--- | :--- |
| `impeccable` | `pbakaus/impeccable` | `impeccable` | 4, 5 | `document` / `extract` for DESIGN.md, `polish`, `bolder`, `quieter`, `live` for refinement, slop check in 5 |
| `emil-design-eng` | `emilkowalski/skills` | `emil-design-eng`, `ask-emil` | 4 | Motion, easing, shadows, interaction polish |
| `ux-writing` | `content-designer/ux-writing-skill` | `ux-writing`, `ux-writing-skill` | 1, 4 | Voice-vs-tone matrix, UI microcopy |
| `landing-page-structure` | `Paldom/landing-page-builder-skills` | `landing-page-structure`, `landing-page-copywriting` | 1, 3 | Section order for `marketing-web` only |
| `avoid-ai-writing` | `conorbronsdon/avoid-ai-writing` | `avoid-ai-writing`, `ai-writing-detector` | 5 | Detect-only copy lint, after drafting |
| `web-design-guidelines` | `vercel-labs/agent-skills` | `web-design-guidelines` | 5 | Accessibility and interaction check before ship |

Other skills, such as `frontend-design` or the sales and SEO packs, are not part of this process. Ignore them unless the user asks.

## 3. Install

`scripts/sync-skills.sh --missing-only` installs what is missing. It skips anything already present. It runs silently at setup (step 4 of `SKILL.md`) and does not ask for confirmation.

Known limits:
- `impeccable` installs non-interactively with `npx --yes impeccable install -y --providers=claude,codex,cursor --scope=project`, falling back to `npx skills add pbakaus/impeccable`. `--update` runs `npx --yes impeccable update`.
- The `npx skills` commands fetch packages from npm and GitHub at install time. Check each one's output. If an install fails, record `missing-skipped` in `skill-map.md` and continue.

## 4. Record results

Write one line per companion in `.design-harness/skill-map.md`:

```
impeccable: installed-preexisting | <path>
emil-design-eng: installed-by-harness | <path>
avoid-ai-writing: missing-skipped
```

Status values: `installed-preexisting`, `installed-by-harness`, `missing-skipped`.

## 5. Conflicts

1. **Project beats global.** If both a project copy and a global copy exist, use the project copy and note both paths.
2. **Customizations win.** A user's fork or voice profile stays as it is.
3. **Never block.** If a helper is missing or broken, proceed with the stage's built-in guidance.
