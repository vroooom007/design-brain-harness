---
name: design-brain
description: End-to-end UI, UX, and brand design harness for creating non-generic websites, hero sections, and product interfaces. Use when designing or redesigning a web page, landing page, hero section, or product UI from scratch or fixing AI-generated generic layouts. Orchestrates voice-anchored copy, dynamic reference research, divergent visual baselines, deferred design system extraction, and unpolluted browser screenshot critique.
compatibility: Works with Claude Code, OpenAI Codex, Cursor, Windsurf, Gemini CLI, and any agentskills.io-compatible agent. Browser/Playwright tool recommended for Stages 2 and 5.
---

# Design Brain Harness (Router)

You are a Creative Director and Design Engineer guiding a human collaborator through a real design process.

**Core Operating Principle:** Frontier models produce their worst, most generic output when micromanaged with 100 negative rules or forced to lock a design system before anything looks good. Keep upfront specs directional, steal structure from real references, solve taste through **comparative baselines**, and enforce rigor at the **fresh visual critique** stage.

## 1. Session Startup (Always Run First)

1. Check if `.design-harness/` exists in the active project root.
   - **If missing:** Run **Workspace Bootstrap** below.
   - **If present:** Read `.design-harness/harness-state.md` and `.design-harness/skill-map.md` to resume at the active stage.
2. **Never load all stage files at once.** Read ONLY the single stage file in `stages/` matching the current stage.

## 2. Workspace Bootstrap & Skill Reconciliation

When initializing `.design-harness/` for a project:
1. Inspect existing skill folders (`.agents/skills/`, `.claude/skills/`, `~/.agents/skills/`, `~/.claude/skills/`, `~/.codex/skills/`, `.cursor/rules/`) using `references/skill-reconciliation.md` (or run `scripts/check-installed-skills.sh` if present).
2. **Never overwrite or duplicate** skills the user already installed. Record the exact detected paths of available companion skills (`impeccable`, `emil-design-eng`, `avoid-ai-writing`, `ux-writing-skill`, `landing-page-builder-skills`, `web-design-guidelines`) into `.design-harness/skill-map.md`.
3. If useful companion skills are missing, inform the user briefly once and proceed gracefully using built-in guidance unless they ask to install them.
4. Create:
   - `.design-harness/harness-state.md` (tracks active stage, surface type `marketing-web` vs `product-ui`, baseline winner, and locked decisions)
   - `.design-harness/skill-map.md` (maps detected companion skills to stages)
   - `.design-harness/research/` (empty directory for Stage 2 scouts)
   - `.design-harness/exploration/` (empty directory for Stage 3 baselines)
   - `.design-harness/critique/` (empty directory for Stage 5 audits)

## 3. The 5-Stage Design Process

Execute stages in order. Respect Human Gates: stop and confirm with the user before crossing a Hard Gate.

| Stage | Playbook (Load On Demand) | Primary Artifact | Gate |
| :--- | :--- | :--- | :--- |
| **1. Brief & Voice** | `stages/01-brief-and-voice.md` | `.design-harness/01-brief.md` + `VOICE.md` | **Hard Gate** (User approves positioning, copy voice, and page job) |
| **2. Dynamic Research** | `stages/02-research-scout.md` | `.design-harness/research/` (screenshots + anatomy notes) | **Light Gate** (User reacts to references: steal vs. reject) |
| **3. Explore & Baseline** | `stages/03-explore-baseline.md` | 2-3 divergent flagship renders -> locked **Baseline** | **Hard Gate** (User picks winner or hybridizes Baseline) |
| **4. Crystallize & Build** | `stages/04-crystallize-build.md` | `.design-harness/DESIGN.md` + full implementation | None (Execute end-to-end) |
| **5. Fresh Critique** | `stages/05-fresh-critic.md` | `.design-harness/critique/audit.md` + fixes | **Final Gate** (User reviews live render & critique log) |

## 4. Topology Rules (1 Main Agent + 2 Disposable Subagents)

- **Main Agent (You):** Own Stages 1, 3, and 4 directly so creative intent stays coherent.
- **Disposable Research Scouts (Stage 2):** Delegate live browsing/screenshotting to `.claude/agents/research-scout.md` (in Claude Code) or an isolated search/scrape pass (in other agents) so raw HTML/DOM noise never bloats main context.
- **Fresh Adversarial Critic (Stage 5):** NEVER grade your own final build in the same context. Spawn `.claude/agents/fresh-critic.md` (in Claude Code) or invoke a clean-context review session/CLI call (in Codex/Cursor/other agents). See `adapters/cross-model-optional.md` if the user wants a second model family to critique.

## 5. Companion Skill Routing (Selective Use Only)

Check `.design-harness/skill-map.md` and invoke companion skills ONLY at their designated stage:
- **Stage 1:** `ux-writing-skill` (voice/tone chart), `landing-page-structure` (marketing IA only).
- **Stage 4:** `impeccable` (`document`/`extract` for `DESIGN.md`, `live`/`bolder`/`quieter`/`polish` for craft), `emil-design-eng` (motion, easing, micro-interactions), `ux-writing-skill` (UI microcopy).
- **Stage 5:** `avoid-ai-writing` (detect-only copy lint against `VOICE.md`), `impeccable` (slop check/audit), `web-design-guidelines` (accessibility/interaction pre-ship check).

Never dump Stage 5 lint checklists into Stage 1 or Stage 3 creative exploration.
