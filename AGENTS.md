# Agents Entry Point

This repository contains the **Design Brain Harness** following the `agentskills.io` open standard.

- Primary skill router: `skills/design-brain/SKILL.md`
- Stage playbooks (load only the active stage): `skills/design-brain/stages/`
- Reference templates and rubrics: `skills/design-brain/references/`
- Existing skill inventory script: `scripts/check-installed-skills.sh`
- Safe companion skill installer: `scripts/sync-skills.sh`

Do not load all stage playbooks into context at once. Read `skills/design-brain/SKILL.md` first, check `.design-harness/harness-state.md`, and load only the active stage.
