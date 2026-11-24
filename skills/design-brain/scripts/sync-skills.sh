#!/usr/bin/env bash
set -euo pipefail

# Safe installer/updater for Design Brain Harness companion skills.
# Respects pre-existing installations when run with --missing-only (default).
#
# Usage:
#   bash <skill_dir>/scripts/sync-skills.sh [--missing-only | --update] [--agent universal|claude-code|codex|cursor] [--global]

MODE="missing-only"
AGENT="universal"
GLOBAL_FLAG=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --missing-only) MODE="missing-only"; shift ;;
    --update) MODE="update"; shift ;;
    --agent) AGENT="${2:-universal}"; shift 2 ;;
    --global|-g) GLOBAL_FLAG="--global"; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

is_installed() {
  local pattern="$1"
  local dirs=(
    ".agents/skills"
    ".claude/skills"
    ".cursor/skills"
    ".cursor/rules"
    "$HOME/.agents/skills"
    "$HOME/.claude/skills"
    "$HOME/.codex/skills"
  )
  for d in "${dirs[@]}"; do
    if [ -d "$d" ] && find "$d" -maxdepth 3 2>/dev/null | grep -iqE "/(${pattern})(/|$|\.md$)"; then
      return 0
    fi
  done
  return 1
}

install_via_skills_cli() {
  local label="$1"
  local pattern="$2"
  local repo="$3"
  local skill_arg="${4:-}"

  if [ "$MODE" = "missing-only" ] && is_installed "$pattern"; then
    echo "[SKIP] $label is already installed. Preserving existing copy."
    return 0
  fi

  echo "[INSTALL] $label from $repo (agent=$AGENT)..."
  if [ -n "$skill_arg" ]; then
    npx --yes skills@latest add "$repo" --skill "$skill_arg" --agent "$AGENT" $GLOBAL_FLAG --yes || echo "[WARN] Could not auto-install $label; check https://github.com/$repo"
  else
    npx --yes skills@latest add "$repo" --agent "$AGENT" $GLOBAL_FLAG --yes || echo "[WARN] Could not auto-install $label; check https://github.com/$repo"
  fi
}

echo "=== Design Brain Harness: Sync Companion Skills (mode=$MODE, agent=$AGENT) ==="

# 1. Impeccable (uses its own CLI for hooks + skills)
if [ "$MODE" = "missing-only" ] && is_installed "impeccable"; then
  echo "[SKIP] impeccable is already installed. Preserving existing copy."
else
  echo "[INFO] For pbakaus/impeccable, run interactively to choose hooks & provider:"
  echo "       npx impeccable install"
fi

# 2. Emil Kowalski Design Engineering Skills
install_via_skills_cli "emil-design-eng" "emil-design-eng|ask-emil" "emilkowalski/skills"

# 3. UX Writing Skill (Christopher Greer)
install_via_skills_cli "ux-writing-skill" "ux-writing|ux-writing-skill" "content-designer/ux-writing-skill"

# 4. Landing Page Structure & Copywriting (Paldom)
install_via_skills_cli "landing-page-structure" "landing-page-structure" "Paldom/landing-page-builder-skills" "landing-page-structure"
install_via_skills_cli "landing-page-copywriting" "landing-page-copywriting" "Paldom/landing-page-builder-skills" "landing-page-copywriting"

# 5. Vercel Web Design Guidelines (Optional Pre-Ship Audit)
install_via_skills_cli "web-design-guidelines" "web-design-guidelines" "vercel-labs/agent-skills" "web-design-guidelines"

# 6. Avoid AI Writing (Conor Bronsdon)
if [ "$MODE" = "missing-only" ] && is_installed "avoid-ai-writing|ai-writing-detector"; then
  echo "[SKIP] avoid-ai-writing is already installed. Preserving existing copy."
else
  echo "[INSTALL] avoid-ai-writing from conorbronsdon/avoid-ai-writing..."
  npx --yes skills@latest add "conorbronsdon/avoid-ai-writing" --agent "$AGENT" $GLOBAL_FLAG --yes ||     echo "[INFO] Manual install fallback: git clone https://github.com/conorbronsdon/avoid-ai-writing ~/.agents/skills/avoid-ai-writing"
  echo "[TIP] Optional local deterministic MCP for Stage 5 copy linting:"
  echo "      claude mcp add avoid-ai-writing -- npx -y avoid-ai-writing-mcp"
fi

echo ""
echo "=== Done. Current inventory: ==="
bash "$SCRIPT_DIR/check-installed-skills.sh"
