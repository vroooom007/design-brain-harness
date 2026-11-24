# Design Brain Harness

An open-source, artifact-driven design process harness for AI coding agents (Claude Code, Codex, Cursor, Windsurf, Gemini CLI, and any `agentskills.io`-compatible agent).

Most "anti-AI-slop" prompts only tell models what not to do. That trades purple gradients for sterile template grids. Removing cliches does not create taste, narrative, or visual character.

**Design Brain Harness** mirrors how a senior product designer and creative director actually work, without trapping frontier models in rigid rulebooks:

1. **Voice Before Layout (`01-brief-and-voice`)**: Locks positioning, single page job, and a concrete `VOICE.md` (with real writing samples and contextual UX tone) before any UI is drawn.
2. **Dynamic Research Harness (`02-research-scout`)**: Spawns disposable research scouts to browse, screenshot, and dissect 3-5 real live references per project. Saves what to steal and what to reject into `.design-harness/research/`.
3. **Comparative Baselines (`03-explore-baseline`)**: Solves the taste bottleneck by generating 2-3 genuinely divergent rendered directions of the flagship screen/hero. You pick a winner or hybridize it into the **Baseline**.
4. **Deferred Design System (`04-crystallize-build`)**: Never locks tokens upfront before anything looks good. Extracts `DESIGN.md` only after the flagship baseline stabilizes, then builds the rest of the surface using curated craft skills.
5. **Fresh Adversarial Critique (`05-fresh-critic`)**: Launches an unpolluted critic agent (zero build memory) to render the live page in Playwright at desktop and mobile, grade screenshots on 4 axes (Design Quality, Originality, Craft, Functionality), and lint copy for LLM cadence.

---

## Architecture: 1 Main Agent + 2 Disposable Subagents

Instead of an expensive multi-agent assembly line that breaks creative continuity, this harness uses a **1 + 2 topology**:

- **1 Main Agent (Single Loop)**: Preserves creative intent and prompt cache while lazy-loading only the active stage playbook.
- **Subagent 1: Research Scouts**: Isolated browsing and screenshotting so raw HTML/web noise never pollutes the main design context.
- **Subagent 2: Fresh Critic**: Zero memory of building the page, eliminating sunk-cost bias when reviewing rendered pixels and prose.

Works natively with Claude Code subagents (`.claude/agents/`) and includes clean fallback instructions for Codex, Cursor, Windsurf, and other agents.

---

## Quick Start: One-Prompt Install (Recommended)

Copy the full prompt from [`INSTALL_PROMPT.md`](./INSTALL_PROMPT.md) and paste it into Claude Code, Codex, Cursor, or any coding agent.

The install prompt automatically:
1. Scans your project and user directories (`.agents/skills/`, `.claude/skills/`, `~/.claude/skills/`, `~/.codex/skills/`, `.cursor/rules/`) for any companion skills you **already have installed**.
2. Avoids overwriting or duplicating existing skills.
3. Maps detected skills into `.design-harness/skill-map.md` and asks before installing only what is missing.

### Manual CLI Install

```bash
# 1. Install this harness via the Agent Skills CLI (universal: Claude Code, Codex, Cursor, etc.)
npx skills add vroooom007/design-brain-harness --agent universal

# 2. Check which companion skills you already have installed
bash scripts/check-installed-skills.sh

# 3. Install only missing companion skills (or run with --update later)
bash scripts/sync-skills.sh --missing-only --agent universal
```

For Claude Code users who want native isolated subagents (`research-scout` and `fresh-critic`), also copy `.claude/agents/` into your project's `.claude/agents/` directory (the install prompt handles this automatically).

---

## Cross-Agent Compatibility

Built on the open [`agentskills.io`](https://agentskills.io) standard:

| Agent | Skill Path | Subagent Mode |
| :--- | :--- | :--- |
| **Claude Code** | `.claude/skills/` and `.agents/skills/` | Native isolated subagents (`.claude/agents/`) |
| **OpenAI Codex CLI** | `.agents/skills/` or `~/.codex/skills/` | Clean-context task / sub-run fallback |
| **Cursor** | `.agents/skills/` | Composer / separate clean chat for Critique |
| **Windsurf / Cline / Copilot / Gemini CLI** | `.agents/skills/` | Clean-context review step fallback |

---

## Companion Skills & Selective Usage

This harness does **not** fork or copy-paste upstream skills into stale blobs. It orchestrates them selectively at the exact stage where they help, and strips the parts that cause rigid template output:

| Upstream Project | Author | Where It Runs | What We Use (and Skip) |
| :--- | :--- | :--- | :--- |
| [`pbakaus/impeccable`](https://github.com/pbakaus/impeccable) | Paul Bakaus | Stage 4 (Crystallize/Build) & Refinement | Use `/impeccable document`, `/impeccable extract`, `/impeccable live`, surgical commands (`bolder`, `quieter`, `polish`), and the write-time slop hook. Skip as an upfront blank-slate creative director. |
| [`emilkowalski/skills`](https://github.com/emilkowalski/skills) | Emil Kowalski | Stage 4 (Build & Polish) | Use `emil-design-eng` motion, easing, transition, and surface craft rules. Load only during build/polish. |
| [`conorbronsdon/avoid-ai-writing`](https://github.com/conorbronsdon/avoid-ai-writing) | Conor Bronsdon | Stage 5 (Fresh Critic) | Use in **detect-only mode** (`ai-writing-detector` / `avoid-ai-writing-mcp`) and `voice-preserving-rewriter` after drafting. Never load 74 rules upfront during copy drafting. |
| [`content-designer/ux-writing-skill`](https://github.com/content-designer/ux-writing-skill) | Christopher Greer | Stage 1 (Voice) & Stage 4 (Product UI) | Use voice vs. tone charting and UI microcopy patterns (buttons, errors, empty states, forms). |
| [`Paldom/landing-page-builder-skills`](https://github.com/Paldom/landing-page-builder-skills) | Paldom | Stage 1 & Stage 3 (Marketing Web) | Use `landing-page-structure` and `landing-page-copywriting` conversion IA rules. |
| [`vercel-labs/agent-skills`](https://github.com/vercel-labs/agent-skills) | Vercel Labs | Stage 5 (Pre-Ship Audit) | Optional `web-design-guidelines` accessibility and interaction checklist. |

---

## Credits & Research Inspiration

Design Brain Harness stands on the shoulders of builders across the open-source design engineering community:

- **Paul Bakaus** ([`pbakaus/impeccable`](https://github.com/pbakaus/impeccable)) for pioneering design-vocabulary commands, live variant workflows, and deterministic write-time slop checks.
- **Emil Kowalski** ([`emilkowalski/skills`](https://github.com/emilkowalski/skills)) for distilling real-world UI craft, easing curves, and interaction engineering into high-signal agent skills.
- **Hassan El Mghari / Nutlope** ([`nutlope/hallmark`](https://github.com/nutlope/hallmark)) for the hero-first cold review pattern, Playwright render auditing (`sloplint`), and the 3-tier `Floor / Reflex / Finish` gate model where intentional rules can be overridden on the record.
- **Conor Bronsdon** ([`conorbronsdon/avoid-ai-writing`](https://github.com/conorbronsdon/avoid-ai-writing)) for structured, tier-weighted AI writing detection that preserves voice instead of flattening prose.
- **Christopher Greer** ([`content-designer/ux-writing-skill`](https://github.com/content-designer/ux-writing-skill)) for systematic UX microcopy and Voice vs. Tone mapping.
- **Paldom** ([`Paldom/landing-page-builder-skills`](https://github.com/Paldom/landing-page-builder-skills)) for modular conversion structure and Voice-of-Customer copy patterns.
- **Vercel Labs** ([`vercel-labs/agent-skills`](https://github.com/vercel-labs/agent-skills)) for pinned, zero-network-fetch UI compliance auditing.
- **VoltAgent** ([`VoltAgent/awesome-design-md`](https://github.com/VoltAgent/awesome-design-md)) for demonstrating how real brand visual anatomy can be captured as readable `DESIGN.md` references.
- **Anthropic Engineering** for public research on simplifying frontier agent prompts, generator-evaluator frontend harnesses, and the 4-axis visual critique rubric.

All upstream skills remain owned by their respective authors under their original licenses.

---

## Repository Layout

```text
design-brain-harness/
├── README.md
├── INSTALL_PROMPT.md                 # Shareable prompt for users to install + reconcile skills
├── AGENTS.md                         # Universal agent entry pointer
├── CLAUDE.md                         # Claude Code entry pointer
├── LICENSE
├── .claude/
│   └── agents/
│       ├── research-scout.md         # Disposable live-web reference scout (Claude Code)
│       └── fresh-critic.md           # Unpolluted Playwright screenshot & copy critic (Claude Code)
├── scripts/
│   ├── check-installed-skills.sh     # Detects already-installed skills across all agents
│   └── sync-skills.sh                # Installs missing upstream skills or updates safely
└── skills/
    └── design-brain/
        ├── SKILL.md                  # Root router (<120 lines, agentskills.io standard)
        ├── stages/
        │   ├── 01-brief-and-voice.md
        │   ├── 02-research-scout.md
        │   ├── 03-explore-baseline.md
        │   ├── 04-crystallize-build.md
        │   └── 05-fresh-critic.md
        ├── references/
        │   ├── ai-tells-rubric.md    # 3-tier visual tells + 4-axis grading rubric
        │   ├── research-sources.md   # Curated inspiration directories by surface
        │   ├── skill-reconciliation.md
        │   └── voice-template.md     # Starter VOICE.md template
        └── adapters/
            └── cross-model-optional.md # Optional multi-model / viaSocket SDK plugin stub
```
