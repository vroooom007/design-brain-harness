# Stage 2: Dynamic Research Harness

**Goal:** Escape statistical average output by inspecting **real, live websites and products** relevant to this project, saving screenshots and structural teardowns into `.design-harness/research/`.

**Why we do this dynamically per project:** Static template libraries produce ThemeForest clones. Fresh per-project research gives the model sharp contrastive anchors ("borrow the editorial whitespace of Site A, the product-first hero of Site B, and reject the dark neon glow of Site C").

## Steps

1. **Choose 3-5 Reference Targets:**
   - Read `../references/research-sources.md` for curated directories matching the surface type.
   - Pick a deliberate mix:
     - **1-2 Category / Direct Peers** (to see what cliches the category is stuck in, so we can break them).
     - **2-3 Cross-Category Craft Leaders** (sites from *outside* the user's industry with extraordinary typography, rhythm, or UX clarity).
     - **Optional:** User-provided URLs or brand `DESIGN.md` references (e.g., from `VoltAgent/awesome-design-md`).

2. **Dispatch Disposable Research Scouts:**
   - **In Claude Code:** Spawn the `research-scout` subagent (1-2 parallel scouts) with the target URLs, the brief from `.design-harness/01-brief.md`, and the output folder `.design-harness/research/`.
   - **In Codex / Cursor / Other Agents:** Use your browser/Playwright or web-search tool to inspect each target, save viewport screenshots (desktop hero + full or key section) into `.design-harness/research/screenshots/`, and write compact structured notes without keeping raw HTML in conversation history.

   - **No browser (`browser: none`):** use WebFetch or web search to read each reference's text and structure. Skip screenshots, put `evidence: text-only` at the top of each teardown, and omit its First-5-Seconds Read.

3. **Required Anatomy Per Reference (`.design-harness/research/<site-slug>.md`):**
   Keep each teardown sharp and concrete (no vague adjectives like "clean and modern"):
   - **URL & Screenshot path**
   - **First-5-Seconds Read:** What your eye hits 1st, 2nd, and 3rd above the fold.
   - **Typography & Scale:** Display vs. body font feel, size contrast ratio, line length, tracking.
   - **Color & Surface Strategy:** Background polarity, how many accent colors actually appear, border vs. shadow vs. surface shift.
   - **Layout Rhythm & Density:** Whitespace ratio, asymmetric vs. symmetric grid, how sections avoid repeating the same card pattern.
   - **Copy & UX Moves:** Headline length, CTA phrasing, what they boldly left out.
   - **STEAL:** 2 specific structural mechanics worth adapting.
   - **REJECT:** 1-2 elements that do NOT fit our brand or feel dated/generic.

4. **Synthesize `.design-harness/research/synthesis.md` (Max 40 lines):**
   - **Category Clichés to Break:** What every competitor does that we will explicitly refuse to copy.
   - **Creative Tension / Direction Seeds:** 3 distinct aesthetic hypotheses we can test in Stage 3 (e.g., Direction A: Editorial/Typographic, Direction B: Interactive Product-First, Direction C: High-Contrast Utility/Tactile).

## Light Gate (Check-In)
Show the user the summary in `synthesis.md` (and paths to captured screenshots). Ask:
- Which reference traits excite you, and which ones should we kill right now?
- Any specific site or screenshot you want added to `.design-harness/research/` before we explore directions?

Update `.design-harness/harness-state.md` to `stage: 03-explore-baseline`.
