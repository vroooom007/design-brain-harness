#!/usr/bin/env bash
set -euo pipefail

# Keep every version field in sync with one command.
# Usage: bash scripts/bump-version.sh <new-version>   (e.g. 1.2.0)

NEW="${1:-}"
if [[ ! "$NEW" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Usage: bash scripts/bump-version.sh <MAJOR.MINOR.PATCH>" >&2
  exit 1
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

replace() { # file, sed-expression
  local f="$1" expr="$2" tmp
  [ -f "$f" ] || { echo "Missing file: $f" >&2; exit 1; }
  tmp="$(mktemp)"
  sed -E "$expr" "$f" > "$tmp" && cat "$tmp" > "$f" && rm -f "$tmp"
}

printf '%s\n' "$NEW" > VERSION
replace .claude-plugin/plugin.json      "s/(\"version\": *\")[^\"]*(\")/\1$NEW\2/"
replace .claude-plugin/marketplace.json "s/(\"version\": *\")[^\"]*(\")/\1$NEW\2/"
replace skills/design-brain/SKILL.md    "s/^version: *\"?[0-9][^\"]*\"?\$/version: \"$NEW\"/"

echo "Bumped to $NEW:"
grep -Hn "version" VERSION .claude-plugin/plugin.json .claude-plugin/marketplace.json
grep -Hn "^version:" skills/design-brain/SKILL.md
