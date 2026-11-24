# Claude Code Entry Point

This workspace uses **Design Brain Harness** (`skills/design-brain/SKILL.md`).

- Follow the progressive-disclosure workflow in `skills/design-brain/SKILL.md`.
- Native subagent definitions live in `.claude/agents/research-scout.md` and `.claude/agents/fresh-critic.md`.
- Always run Stage 2 web research via `research-scout` and Stage 5 live visual critique via `fresh-critic` in clean subagent contexts so build context never pollutes evaluation.
- Never load all stage files or upstream skill libraries upfront. Read `.design-harness/skill-map.md` and invoke companion skills only at their mapped stage.
