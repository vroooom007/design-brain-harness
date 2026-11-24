# Design Brain Harness

A design process packaged as one agent skill. It takes a UI, landing page, or product screen from a brief to a critiqued build without the usual AI-template output.

Most "anti-AI-slop" prompts only say what not to do. That removes purple gradients and leaves a sterile grid. Taste comes from a voice, real references, a comparison of directions, and a critic that has not seen the build. This skill works through those steps in order.

## Install

Paste the prompt from [`INSTALL_PROMPT.md`](./INSTALL_PROMPT.md) into your coding agent. It installs the skill, and the skill sets up the rest itself.

Manual install:

```bash
npx skills add vroooom007/design-brain-harness --agent universal
```

Or copy `skills/design-brain/` into your agent's skills folder.

## How it works

One entry point: [`skills/design-brain/SKILL.md`](./skills/design-brain/SKILL.md). The agent reads the stage in `.design-harness/harness-state.md`, loads only that stage, and moves on when it is done. It fetches helper skills and subagents when a stage needs them. It pauses for you at four points: approving the brief, reacting to references, picking a direction, and the final review.

| Stage | What happens |
| :--- | :--- |
| 1. Brief & voice | Single page job, a `VOICE.md` with real samples and banned patterns, and draft copy |
| 2. Research | Isolated subagent browses 3–5 live references and writes steal/reject notes |
| 3. Explore | Two or three divergent rendered directions. You pick one or a hybrid. This is the baseline |
| 4. Build | `DESIGN.md` is extracted from the approved baseline, then the rest is built |
| 5. Critique | Isolated subagent renders desktop and mobile, grades on four axes, and checks for AI tells |

Helpers are optional. Companion skills (impeccable, emil-design-eng, avoid-ai-writing, and others) are detected and used only at the stage that needs them. If a helper is missing, the stage falls back to its own guidance.

## Architecture

- **Main agent:** owns stages 1, 3, and 4 so creative intent stays in one context.
- **Research scout (stage 2):** isolated browsing, so raw page noise stays out of the design context.
- **Fresh critic (stage 5):** no memory of building the page, so it reviews rendered pixels instead of its own reasoning.

Claude Code gets both subagents from `skills/design-brain/agents/`, copied into `.claude/agents/` during setup. Other agents run the same steps in a clean chat.

## Repository layout

```text
design-brain-harness/
├── README.md
├── INSTALL_PROMPT.md                  # Short prompt to paste into any coding agent
├── AGENTS.md / CLAUDE.md              # Pointers to the skill
├── LICENSE
└── skills/
    └── design-brain/
        ├── SKILL.md                   # The single entry point
        ├── agents/
        │   ├── research-scout.md      # Stage 2 subagent (copied to .claude/agents/)
        │   └── fresh-critic.md        # Stage 5 subagent (copied to .claude/agents/)
        ├── scripts/
        │   ├── check-installed-skills.sh  # Inventory of helper skills
        │   └── sync-skills.sh             # Installs missing helpers only
        ├── stages/                    # 01–05, loaded one at a time
        └── references/
            ├── ai-tells-rubric.md     # Stage 5 grading and tells
            ├── companion-skills.md    # Detection, install, and conflict rules
            ├── research-sources.md    # Where to find references
            └── voice-template.md      # Starter VOICE.md
```

## Credits

Design Brain Harness builds on work by the open-source design engineering community:

- **Paul Bakaus** ([`pbakaus/impeccable`](https://github.com/pbakaus/impeccable)) for design-vocabulary commands and write-time slop checks.
- **Emil Kowalski** ([`emilkowalski/skills`](https://github.com/emilkowalski/skills)) for interaction and easing craft.
- **Hassan El Mghari / Nutlope** ([`nutlope/hallmark`](https://github.com/nutlope/hallmark)) for the hero-first review pattern and the Floor / Reflex / Finish gate model.
- **Conor Bronsdon** ([`conorbronsdon/avoid-ai-writing`](https://github.com/conorbronsdon/avoid-ai-writing)) for tiered AI-writing detection that preserves voice.
- **Christopher Greer** ([`content-designer/ux-writing-skill`](https://github.com/content-designer/ux-writing-skill)) for UX microcopy and voice-versus-tone mapping.
- **Paldom** ([`Paldom/landing-page-builder-skills`](https://github.com/Paldom/landing-page-builder-skills)) for landing-page structure.
- **Vercel Labs** ([`vercel-labs/agent-skills`](https://github.com/vercel-labs/agent-skills)) for the web design guidelines check.
- **VoltAgent** ([`VoltAgent/awesome-design-md`](https://github.com/VoltAgent/awesome-design-md)) for readable brand visual anatomy.
- **Anthropic Engineering** for public research on frontend harnesses and the four-axis critique rubric.

Upstream skills remain owned by their authors under their original licenses. This project is MIT-licensed; see [`LICENSE`](./LICENSE).
