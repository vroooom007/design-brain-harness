# Optional Cross-Model Adapter (Copywriting & Adversarial Critique)

**Default (v1):** Zero extra API keys required. Run the Main Agent and Fresh Critic using your active coding agent's model (Claude Opus/Sonnet, GPT, Gemini, etc.). Isolation of context in Stage 5 already provides the biggest critique win.

**When to use a Second Model Family:**
If you want **adversarial model diversity** (for example, building UI in Claude Code while running Stage 5 visual/copy critique or generating alternate Stage 1 headline angles with Gemini or GPT), wire in one of the optional routes below.

## Option A: Local CLI / MCP Routing (Zero Backend)
If your environment already has another model CLI or MCP server configured (e.g., `codex`, `gemini`, or an OpenRouter MCP), Stage 5 can pass the screenshots + `01-brief.md` + `VOICE.md` + `DESIGN.md` + `ai-tells-rubric.md` directly to that CLI in a clean non-interactive call and save its output to `.design-harness/critique/audit-round-1.md`.

## Option B: Optional viaSocket SDK Connector (Team / Shared Multi-Model Routing)
For teams that want a shared multi-model critique or copywriting gateway without distributing individual model API keys to every developer machine, you can optionally attach the viaSocket integration skill:

1. Install the thin-wrapper viaSocket skill into your workspace skills directory (`viasocket-integrations/SKILL.md`) from:
   `https://beta-flow.viasocket.com/documentation/skill-install.md`
2. Configure `VIASOCKET_ORG_ID`, `VIASOCKET_PROJECT_ID`, and `VIASOCKET_EMBED_SECRET` in `.env` per the skill's setup guide.
3. Route ONLY the isolated Stage 5 Fresh Critic prompt or Stage 1 alternate copy pass through your chosen viaSocket model action, keeping the core Design Brain Harness completely provider-agnostic.

*Note: Never require external network APIs or backend setup to run Stages 1-5 locally.*
