#!/usr/bin/env bash
set -euo pipefail

# Scans project and global skill directories across Claude Code, Codex, Cursor,
# Windsurf, Roo, and the universal agentskills.io directory (.agents/skills).
# Read-only: never modifies or overwrites anything.

SEARCH_DIRS=(
  ".agents/skills"
  ".claude/skills"
  ".cursor/skills"
  ".cursor/rules"
  ".windsurf/skills"
  ".roo/skills"
  "$HOME/.agents/skills"
  "$HOME/.claude/skills"
  "$HOME/.codex/skills"
)

COMPANIONS=(
  "design-brain:design-brain"
  "impeccable:impeccable"
  "emil-design-eng:emil-design-eng|ask-emil|emilkowalski"
  "avoid-ai-writing:avoid-ai-writing|ai-writing-detector|voice-preserving-rewriter"
  "ux-writing-skill:ux-writing|ux-writing-skill"
  "landing-page-builder-skills:landing-page-structure|landing-page-copywriting|landing-page-builder"
  "web-design-guidelines:web-design-guidelines"
)

echo "=== Design Brain Harness: Installed Skills Inventory ==="
echo ""
printf "%-30s | %-12s | %s\n" "Skill" "Status" "Detected Path"
printf "%-30s-+-%-12s-+-%s\n" "------------------------------" "------------" "----------------------------------------"

for entry in "${COMPANIONS[@]}"; do
  label="${entry%%:*}"
  pattern="${entry#*:}"
  found_path=""

  for base in "${SEARCH_DIRS[@]}"; do
    if [ -d "$base" ]; then
      match=$(find "$base" -maxdepth 3 \( -type d -o -type f \) 2>/dev/null | grep -iE "/(${pattern})(/|$|\.md$)" | head -n 1 || true)
      if [ -n "$match" ]; then
        found_path="$match"
        break
      fi
    fi
  done

  if [ -n "$found_path" ]; then
    printf "%-30s | %-12s | %s\n" "$label" "INSTALLED" "$found_path"
  else
    printf "%-30s | %-12s | %s\n" "$label" "MISSING" "-"
  fi
done

echo ""
echo "=== Subagents & Tooling Check ==="
if [ -f ".claude/agents/research-scout.md" ] && [ -f ".claude/agents/fresh-critic.md" ]; then
  echo "Claude Code subagents: INSTALLED (.claude/agents/)"
else
  echo "Claude Code subagents: NOT IN PROJECT (.claude/agents/)"
fi

if command -v npx >/dev/null 2>&1; then
  echo "npx: AVAILABLE ($(npx --version 2>/dev/null || echo 'ok'))"
else
  echo "npx: MISSING (Node.js required for npx skills CLI)"
fi

if command -v playwright >/dev/null 2>&1 || npx --no-install playwright --version >/dev/null 2>&1; then
  echo "Playwright: AVAILABLE"
else
  echo "Playwright: NOT DETECTED locally (needed for Stage 2 & Stage 5 browser screenshots)"
fi
