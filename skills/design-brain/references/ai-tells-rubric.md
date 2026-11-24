# Visual & Copy AI-Tells Rubric (Fresh Critic Reference)

Use this rubric ONLY during **Stage 5 (Fresh Critique)**. Do not load it during creative drafting or exploration.

## 1. Four-Axis Scoring Rubric (1-10 per axis)

| Axis | Weight | What Earns 8-10 | What Drops Score Below 6 |
| :--- | :--- | :--- | :--- |
| **Originality** | 30% | Distinct composition, bespoke visual voice, feels designed by a specific studio for this exact brand. | Immediately recognizable AI template; interchangeable with 100 other SaaS sites. |
| **Design Quality** | 25% | Confident restraint, varied section rhythm, clear focal points, strong visual hierarchy. | Every section looks the same; decorative bloat; unclear primary focal point. |
| **Craft** | 25% | Crisp type hierarchy, intentional spacing math, clean mobile reflow, subtle surfaces, purposeful motion. | Cramped padding, misaligned baselines, orphan headings, sluggish `ease-in` transitions, harsh borders. |
| **Functionality & UX** | 20% | Effortless scannability, clear action hierarchy, accessible contrast/focus, honest states. | Cluttered CTAs, broken responsive overflow, missing error/empty states, tiny tap targets. |

---

## 2. Three-Tier AI Tells Gate (Inspired by Hallmark's Floor / Reflex / Finish Model)

### Tier 1: Hard Floor (Must Fix, No Exceptions)
- Broken mobile layout, horizontal scroll overflow, clipped text, or overlapping elements.
- Low-contrast unreadable text (fails WCAG AA contrast) or invisible focus states.
- Placeholder copy, dummy numbers, broken images, or generic stock boxes.
- **Information bloat:** Repeating the exact same CTA block 3+ times on one page, or dumping 10+ ungrouped feature pill badges in a row.
- Drift away from the user-approved Baseline (`exploration/baseline-*.png`) or `DESIGN.md`.

### Tier 2: AI Reflexes (Fix OR Log Explicit Justification in `overrides.md`)
*These are the loudest fingerprints of unguided AI design. Remove them by default; keep only if genuinely earned by the brand.*

**Visual Reflexes:**
- **Eyebrow spam:** Putting a tiny uppercase tracked-out pill/eyebrow label above every single section heading.
- **Single-colored headline word:** Highlighting one word of a white/black headline in purple/blue gradient for fake emphasis.
- **3-column icon-in-a-box grid:** Repeating the exact `icon badge + bold title + 2-line blurb` card row across sections.
- **Default dark-mode purple/cyan glow:** Ambient radial gradients behind glassmorphic cards with 1px bright borders.
- **Identical section cadence:** Stacking 4+ centered-heading-plus-card-grid sections in a row.

**Copy & Cadence Reflexes:**
- **Staccato binary contrast:** *"Spend your time building. Not hosting."* / *"It actually runs. Not a static file host."*
- **LLM buzzword stack:** *delve, tapestry, seamlessly, leverage, elevate, empower, supercharge, unlock, game-changer, cutting-edge, reimagine, robust*.
- **Fake conversational filler:** *"Questions, answered."*, *"Ready to take X to the next level?"*, *"In today's fast-paced world..."*
- **Uniform sentence rhythm:** Every bullet and paragraph having the exact same word count and grammatical template.
- **Em-dash overuse** when the brand's `VOICE.md` favors clean short sentences or plain punctuation.

### Tier 3: Finish (High-Craft Polish)
- Optical alignment on icons, buttons, and display headings.
- `tabular-nums` on pricing, metrics, timers, and dashboards.
- Curly quotes and clean typography details where appropriate.
- Subtle layered shadows or tonal elevation instead of muddy flat gray borders.
- Smooth `ease-out` UI transitions under 300ms with `prefers-reduced-motion` respected.
