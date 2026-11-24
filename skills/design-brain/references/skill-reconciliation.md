# Existing Skill Discovery & Reconciliation Protocol

Users often already have design, UX, or writing skills installed globally or in their project. Never blindly overwrite, duplicate, or collide with existing installations.

## 1. Directories to Scan
Check both **project scope** and **user/global scope**:
- `.agents/skills/` and `~/.agents/skills/` (Universal `agentskills.io` path)
- `.claude/skills/` and `~/.claude/skills/` (Claude Code)
- `~/.codex/skills/` (OpenAI Codex CLI)
- `.cursor/rules/` and `.cursor/skills/` (Cursor)
- `.windsurf/skills/` (Windsurf)
- `.roo/skills/` (Roo Code)

## 2. Companion Skill Inventory & Selective Mapping

When scanning, match by directory name or `SKILL.md` frontmatter `name:`:

| Logical Role | Upstream Repo | Match Names / Aliases | Stage Mapped | Usage Policy |
| :--- | :--- | :--- | :--- | :--- |
| `impeccable` | `pbakaus/impeccable` | `impeccable`, `frontend-design` (from impeccable) | Stage 4 & 5 | Use `document`, `extract`, `live`, `bolder`, `quieter`, `polish`, and slop hook. Skip as Stage 1-3 blank-slate director. |
| `design-eng` | `emilkowalski/skills` | `emil-design-eng`, `ask-emil`, `emilkowalski` | Stage 4 | Use 100% for motion, easing, shadows, and interaction polish during build. |
| `anti-ai-writing` | `conorbronsdon/avoid-ai-writing` | `avoid-ai-writing`, `ai-writing-detector`, `voice-preserving-rewriter` | Stage 5 | Run in **detect-only mode** during Stage 5 critique, then rewrite preserving `VOICE.md`. Never load upfront during drafting. |
| `ux-writing` | `content-designer/ux-writing-skill` | `ux-writing`, `ux-writing-skill` | Stage 1 & 4 | Use Voice vs. Tone matrix and UI microcopy guidelines. |
| `landing-ia` | `Paldom/landing-page-builder-skills` | `landing-page-structure`, `landing-page-copywriting` | Stage 1 & 3 | Use single-argument page structure for `marketing-web` only. |
| `web-guidelines` | `vercel-labs/agent-skills` | `web-design-guidelines` | Stage 5 | Optional pre-ship accessibility and interaction audit. |

## 3. Conflict & Ownership Rules
1. **Project overrides Global:** If the same skill exists in both `.claude/skills/X` (or `.agents/skills/X`) and `~/.claude/skills/X`, map the project-level copy in `.design-harness/skill-map.md`.
2. **Preserve User Customizations:** If a user already has a customized version of a companion skill (e.g., their own fork of `impeccable` or a custom `avoid-ai-writing` voice profile), keep it untouched and reference its path.
3. **Graceful Degradation:** Every stage playbook works even if zero companion skills are installed. Companion skills amplify execution and auditing; they are never hard blockers.
4. **Record Everything:** Write the resolved paths and status (`installed-preexisting`, `installed-by-harness`, `missing-skipped`) into `.design-harness/skill-map.md`.
