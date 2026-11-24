# Stage 3: Divergent Exploration & Baseline Lock

**Goal:** Solve the human taste bottleneck through **comparative judgment**, not upfront specification. Humans struggle to describe great design in abstract prose, but can spot the right direction in 3 seconds when comparing 2-3 live rendered options side by side.

**Critical Rule:** Do **NOT** create `DESIGN.md` or lock a full design system yet. Locking tokens before anything looks good traps the whole project inside an average first guess.

## Adaptive Wireframe Rule

Decide whether a quick structural wireframe is needed BEFORE rendering visual directions:
- **Skip wireframes** if designing a single hero section, focused landing page, or isolated component. Go straight to visual divergence with real copy.
- **Create a 1-file bare-bones IA wireframe (`.design-harness/exploration/wireframe.md`)** ONLY if designing a multi-view product app, complex dashboard, or dense multi-step workflow where information architecture must be validated first. Keep it purely structural (zones, states, actions, zero styling).

## Steps

1. **Build 2-3 Genuinely Divergent Flagship Directions:**
   - Build ONLY the **flagship slice** (e.g., the Hero + first proof section for `marketing-web`, or the primary workspace view for `product-ui`).
   - Use real working copy from Stage 1 (`VOICE.md`) and real structural inspiration from Stage 2 (`research/synthesis.md`).
   - **Force genuine structural divergence.** Do NOT give the user 3 color swaps of the same centered layout. Vary:
     - Layout architecture (e.g., editorial split vs. product-canvas center vs. asymmetric Swiss grid)
     - Typography voice (e.g., high-contrast serif/sans pairing vs. tight grotesque/mono technical precision)
     - Surface mood (e.g., warm tactile light paper vs. crisp high-contrast light vs. atmospheric dark)
   - Save previews or routes clearly in `.design-harness/exploration/` (e.g., `/explore/a`, `/explore/b`, `/explore/c` or standalone preview files) and render screenshots if browser tooling is available so the user can view them immediately.

2. **Brief Rationale Per Direction (3 lines each):**
   - Which reference mechanics it borrows from Stage 2.
   - What tradeoff it makes (e.g., higher visual restraint vs. higher product density).

3. **Human Baseline Selection & Hybridization:**
   Ask the user to pick a winner or combine traits (e.g., *"Take the typography and pacing from A, the interactive product preview from B, and drop the dark card background"*).

4. **Lock the Baseline:**
   - Implement the chosen winner/hybrid as the **Baseline** for the flagship screen.
   - Capture desktop + mobile screenshots into `.design-harness/exploration/baseline-desktop.png` and `baseline-mobile.png`.
   - Record the locked baseline decision in `.design-harness/harness-state.md`.
   - **Baseline Rule:** From this point forward, every refinement must visibly improve on the Baseline. Never regress to safer/blander defaults.

## Hard Gate (Stop Here)
Do not build the rest of the site or extract `DESIGN.md` until the user explicitly approves the flagship Baseline.

Update `.design-harness/harness-state.md` to `stage: 04-crystallize-build`.
