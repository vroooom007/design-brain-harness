# Stage 4: Crystallize Design System & Build

**Goal:** Now that the flagship screen has proven taste and character, extract its emergent visual rules into a clean `DESIGN.md` so the rest of the page/product inherits the exact same DNA without drifting back into generic AI defaults.

## Companion Skills to Load Now
Check `.design-harness/skill-map.md` and invoke installed skills selectively:
- **System Extraction:** If `impeccable` is installed, use `/impeccable document` or `/impeccable extract` on the approved Baseline to capture tokens cleanly.
- **Interaction & Motion Craft:** If `emil-design-eng` (`emilkowalski/skills`) is installed, load it now for easing curves, animation frequency rules, interruptible transitions, and subtle surface shadows.
- **Microcopy:** If `ux-writing-skill` is installed, apply it to buttons, forms, empty states, and errors alongside `.design-harness/VOICE.md`.
- **Refinement Steering:** If `impeccable` is installed, use surgical commands (`bolder`, `quieter`, `polish`, `live`) when tuning specific sections rather than rewriting from scratch.

## Steps

### Part A: Crystallize `.design-harness/DESIGN.md` (Deferred Lock)
Extract only what actually makes the approved Baseline work (keep under 120 lines):
1. **Color Roles:** Exact hex/OKLCH values for canvas, surface, elevated surface, primary text, muted text, borders, and the single primary accent (plus semantic states if product UI).
2. **Typography Scale:** Font families, exact scale steps (display, h1, h2, body, caption/mono), weights, line heights, and tracking rules.
3. **Spacing & Layout Rhythm:** Max container width, section vertical cadence, grid columns, and intentional asymmetry rules.
4. **Surface & Elevation:** How depth is created (hairline borders vs. translucent shadows vs. tonal background shifts) and border-radius consistency.
5. **Motion Rules:** Purpose-driven transitions only (`ease-out` for enter/exit, under 300ms, never animate high-frequency keyboard actions, respect `prefers-reduced-motion`).
6. **Project "Never Do" List:** 5 concrete bans derived from Stages 1-3 (e.g., no generic 3-column icon-box grids, no unmotivated eyebrow tags, no pill-badge soup).

### Part B: Branched Execution
Follow ONLY the branch matching `surface` in `.design-harness/harness-state.md`:

#### Branch 1: `marketing-web` (Landing Pages, Hero Sections, Brand Sites)
- Build each remaining section from `01-brief.md` strictly as **one job per section**.
- **Vary structural rhythm:** Never stack two identical grid patterns back to back (e.g., avoid Card Grid -> Card Grid -> Card Grid). Alternate between full-bleed product visuals, editorial typography moments, dense comparison/proof tables, and tight interactive demos.
- **No CTA spam:** Keep primary action clear without repeating identical 3-step banners on every scroll.
- Use real assets, real product screenshots, or bespoke SVG/interactive visuals; never drop lazy placeholder boxes or generic stock gradients.

#### Branch 2: `product-ui` (Apps, Dashboards, Workflows, Tools)
- Optimize for **scannability, state clarity, and low cognitive load** over decorative flair.
- Design every real state explicitly: **empty, loading, populated, partial/error, and edge-case overflow** (long strings, small viewports).
- Enforce `VOICE.md` tone matrix on every tooltip, confirmation modal, validation error, and empty state.
- Keyboard navigation, visible focus states (`focus-visible`), and zero animation lag on repeated actions.

## Handoff to Stage 5
Ensure the dev server or static build runs cleanly and is reachable at a local URL (or HTML file path). Do **NOT** self-approve the build.

Update `.design-harness/harness-state.md` to `stage: 05-fresh-critic` and immediately proceed to Stage 5.
