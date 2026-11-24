# Stage 1: Brief, IA Scope, and Brand Voice

**Goal:** Lock *who* the product is, the **single job** of this surface, and a concrete human voice (`VOICE.md`) before a single visual decision is made. 60% of "AI slop" is actually copywriting and information-architecture bloat.

## Inputs & Companion Skills
- Check `.design-harness/skill-map.md`:
  - If `ux-writing-skill` is installed, use its Voice vs. Tone matrix structure.
  - If `landing-page-structure` (from `landing-page-builder-skills`) is installed and surface is `marketing-web`, use its single-argument section sequencing.
- Reference template: `../references/voice-template.md`.

## Steps

1. **Clarify the Core Context (Keep it tight, max 5 questions if missing):**
   - What is the product and who is the real buyer/user?
   - What surface are we building right now? (`marketing-web`: hero, landing page, storytelling OR `product-ui`: dashboard, workflow, tool).
   - What is the **one thing** a visitor must understand or do after seeing this?
   - Share 2-3 sentences of real writing you like (from your founder, a support reply, or another brand whose tone feels right) plus 1-2 brands whose vibe you hate.

2. **Write `.design-harness/01-brief.md` (Max 40 lines):**
   - **Surface Type:** `marketing-web` or `product-ui`.
   - **Single Job:** One sentence.
   - **Target Reader & Skepticism:** What they already doubt when they land here.
   - **Information Cut List:** Explicitly name 3-5 things we will **leave out** to prevent bloat (e.g., no 12-pill feature badge soup, no repeated identical CTAs in every section, no fake social proof).
   - **Narrative Arc (Marketing) or Core Task Flow (Product):** 4-6 sequential beats, each with *one* job.

3. **Write `.design-harness/VOICE.md` (Max 60 lines):**
   Use `../references/voice-template.md`. Must include:
   - **3 Contrastive Voice Traits** (*"Direct like X, not hyped like Y"*).
   - **2-3 Real Voice Anchors** (verbatim human sentences that calibrate rhythm and vocabulary).
   - **Explicit Banned Cadences** (tailored to this brand, e.g., banning *"Spend your time X. Not Y."*, eyebrow tags above every headline, generic SaaS buzzwords, em-dash crutches).
   - **Contextual Tone Matrix:** How this same voice sounds in Hero/Headlines, Body/Explanation, Buttons/CTAs, Empty States, and Error Messages.

4. **Draft Raw Working Copy (Draft 0):**
   - Write real, concrete copy for the primary screen/hero using `VOICE.md`. Never use Lorem Ipsum or placeholder headings.
   - **Do NOT run heavy AI-detector word lists yet.** Write naturally from the voice anchors; Stage 5's Fresh Critic will run `avoid-ai-writing` in detect-only mode later.

## Hard Gate (Stop Here)
Present `01-brief.md`, `VOICE.md`, and the Draft 0 working copy to the user. Ask:
- Does this actually sound like your brand, or does any line still smell like generic AI copy?
- Should we cut or reorder anything in the narrative/task flow?

Update `.design-harness/harness-state.md` to `stage: 02-research-scout` only after approval.
