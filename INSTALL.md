# Design Brain Install Procedure

Agent instructions, fetched by the prompt in [`INSTALL_PROMPT.md`](./INSTALL_PROMPT.md). Follow them exactly.

Install the Design Brain skill in one pass. Do not ask the user yes/no questions along the way; only stop for a real error.

1. Scan first. List the skills already installed in the project (.agents/skills, .claude/skills, .cursor/skills) and globally (~/.agents/skills, ~/.claude/skills, ~/.codex/skills). Never overwrite or reinstall anything that is already there.

2. Install design-brain for the agent you are running in:
   - Claude Code: run `claude plugin marketplace add vroooom007/design-brain-harness`, then add this to the user's Claude settings (user settings.json, merge, do not overwrite other keys):
     "extraKnownMarketplaces": { "design-brain-marketplace": { "source": { "source": "github", "repo": "vroooom007/design-brain-harness" }, "autoUpdate": true } }
     then run `claude plugin install design-brain@design-brain-marketplace`. This bundles the skill and the research-scout and fresh-critic subagents, and keeps them updated automatically.
   - Codex, Cursor, Windsurf, or any other agent: run `npx --yes skills@latest add vroooom007/design-brain-harness --agent universal --yes`. If that fails, clone the repo and copy skills/design-brain/ into this agent's skills directory.

3. Install ONLY the companion skills missing from step 1, non-interactively, in one pass: run `bash <installed design-brain folder>/scripts/sync-skills.sh --missing-only` (it installs impeccable via `npx --yes impeccable install -y --providers=claude,codex,cursor --scope=project`, plus emil-design-eng, ux-writing-skill, landing-page-structure, landing-page-copywriting, web-design-guidelines, and avoid-ai-writing). Do not pause to confirm each skill.

4. Write .design-harness/skill-map.md listing every companion skill, marked "pre-existing" or "newly installed" (or "unavailable" if it failed).

5. Reply with a compact 5-line summary: agent detected, design-brain install method, companions already present, companions newly installed, anything that failed. Then immediately ask the Stage 1 brief questions from the installed design-brain SKILL.md so they can start designing right away.
