# Shareable AI Install Prompt

This repository is published at https://github.com/vroooom007/design-brain-harness. Share the prompt below with anyone using Claude Code, Codex, Cursor, Windsurf, or another AI coding agent.

---

```text
Install and configure the Design Brain Harness from https://github.com/vroooom007/design-brain-harness into this workspace.

Follow these exact steps and DO NOT blindly overwrite anything I already have:

1. INSPECT FIRST (Existing Skills Audit):
   Before installing anything, scan both project-level and user-level skill directories for my active agent environment:
   - .agents/skills/ and ~/.agents/skills/
   - .claude/skills/ and ~/.claude/skills/
   - ~/.codex/skills/
   - .cursor/rules/
   Check whether any of these companion skills are already installed (under any alias or subdirectory):
   - impeccable (pbakaus/impeccable)
   - emil-design-eng / emilkowalski skills (emilkowalski/skills)
   - avoid-ai-writing (conorbronsdon/avoid-ai-writing)
   - ux-writing-skill (content-designer/ux-writing-skill)
   - landing-page-builder-skills (Paldom/landing-page-builder-skills)
   - web-design-guidelines (vercel-labs/agent-skills)

2. REPORT & ASK BEFORE INSTALLING:
   Show me a concise table listing:
   - Which skills are ALREADY INSTALLED (and their exact paths)
   - Which skills are MISSING
   Ask me:
   (a) Should you install Design Brain Harness to project scope or global scope?
   (b) For missing companion skills, should you install all of them, a subset, or skip?
   (c) For already-installed skills, confirm you will keep my existing copies and wire them into `.design-harness/skill-map.md` without overwriting them.

3. INSTALL & WIRE UP:
   After I confirm:
   - Install `design-brain` from https://github.com/vroooom007/design-brain-harness (via `npx skills add` or local copy into the appropriate skills directory).
   - If I am using Claude Code, copy `.claude/agents/research-scout.md` and `.claude/agents/fresh-critic.md` into `.claude/agents/` (skipping if custom versions already exist, or asking first).
   - Install ONLY the missing companion skills I approved using their official commands (`npx impeccable install`, `npx skills add ...`, etc.).
   - Initialize `.design-harness/skill-map.md` mapping each stage of Design Brain Harness to the exact local paths of my installed skills (both pre-existing and newly installed).
   - Verify Playwright or browser tooling is available for Stage 2 (Research Scout) and Stage 5 (Fresh Critic), and tell me if it needs setup.

4. STOP AND REPORT:
   Summarize what was installed, what existing skills were preserved and linked, and ask what page, hero section, or product surface we want to design first.
```
