# Stage 5: Fresh Adversarial Critique Loop

**Goal:** Eliminate sunk-cost bias and visual blindness. A model that just wrote the code will rationalize flaws it cannot see in JSX/CSS. Review MUST happen in a **clean, unpolluted context** looking at **actual rendered pixels** and **extracted visible copy**.

## How to Run Unpolluted Critique

- **In Claude Code:** Spawn `.claude/agents/fresh-critic.md` via the subagent tool. Pass ONLY:
  1. The live local URL (or preview HTML paths)
  2. Paths to `.design-harness/01-brief.md`, `VOICE.md`, `DESIGN.md`, and `exploration/baseline-*.png`
  3. Path to `references/ai-tells-rubric.md`
  4. Path to `.design-harness/skill-map.md` (so the critic knows if `avoid-ai-writing`, `impeccable`, or `web-design-guidelines` are installed)
  **Do NOT pass your build transcript or explanations of why you made design choices.**

- **In Codex / Cursor / Other Agents:**
  - Open a fresh clean chat / isolated task (or call a second model via `adapters/cross-model-optional.md`) with the exact 4 inputs above and ask it to act strictly as an adversarial critic following `references/ai-tells-rubric.md`.

## What the Fresh Critic Checks

1. **Live Visual Render Audit (Playwright / Browser):**
   - Captures fresh screenshots at **Desktop (1440x900)** and **Mobile (390x844)** (full page + above-the-fold hero).
   - Inspects rendered images directly for alignment breaks, cramped spacing, weak visual hierarchy, contrast failures, awkward wrapping, or drift away from the locked Baseline (`exploration/baseline-*.png`).

2. **4-Axis Weighted Grading (Anthropic Frontend Rubric):**
   Grades 1-10 with concrete `file:line` or visual evidence on:
   - **Originality (30%):** Does this feel custom-built for this brand, or does it look like a recognizable AI template?
   - **Design Quality (25%):** Cohesive identity, strong rhythm, deliberate restraint.
   - **Craft (25%):** Typography scale, alignment, spacing math, motion polish, mobile responsiveness.
   - **Functionality & UX (20%):** Clear hierarchy, readable states, zero broken interactions or accessibility traps.

3. **3-Tier AI Tells Audit (`references/ai-tells-rubric.md`):**
   - **Tier 1 (Floor - Must Fix):** Objective defects (broken mobile overflow, unreadable contrast, placeholder text, unapproved visual clichés, repeated redundant CTAs).
   - **Tier 2 (Reflex - Fix OR Override on the Record):** Common AI tells (eyebrow tags above every heading, tracked-caps labels, 3-column icon-box grids, accent-colored single words in headlines). If a Tier 2 item is genuinely intentional for this brand, it can stay ONLY with a 1-line justification logged in `.design-harness/critique/overrides.md`.
   - **Tier 3 (Finish - High-Craft Polish):** Micro-details (optical alignment, tabular numbers, focus rings, transition timing).

4. **Copy & Anti-AI-Writing Lint:**
   - Extracts all visible copy from the rendered page/components.
   - Checks against `.design-harness/VOICE.md`.
   - If `avoid-ai-writing` (or `avoid-ai-writing-mcp`) is installed, runs it in **detect-only mode** and flags P0/P1 LLM cadences (*"X. Not Y."*, buzzwords, bloated transitions) with plain rewrites that preserve `VOICE.md`.
   - If `web-design-guidelines` or `impeccable` audit is installed, runs a quick compliance check for accessibility and UI edge cases.

## Fix Loop (Max 2 Passes)
1. Save the critic's report to `.design-harness/critique/audit-round-1.md`.
2. Main agent fixes all **Tier 1 (Floor)** issues, all P0/P1 copy tells, and addresses **Tier 2 (Reflex)** findings (fixing or logging explicit justified overrides).
3. Re-run the Fresh Critic once (`audit-round-2.md`) to confirm fixes resolved the issues without introducing regressions. Stop after Round 2 to avoid diminishing-returns churn.

## Final Gate
Present the user with:
- Final desktop + mobile screenshots (and live preview URL)
- Score summary across the 4 axes (Round 1 -> Round 2)
- Any logged Tier 2 overrides or open tradeoffs for human sign-off.
