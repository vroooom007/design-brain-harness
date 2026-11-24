#!/usr/bin/env bash
set -euo pipefail
# Fails if VERSION, plugin.json, marketplace.json and SKILL.md disagree.
cd "$(dirname "${BASH_SOURCE[0]}")/.."
V="$(tr -d '[:space:]' < VERSION)"
P="$(sed -nE 's/.*"version": *"([^"]*)".*/\1/p' .claude-plugin/plugin.json | head -1)"
M="$(sed -nE 's/.*"version": *"([^"]*)".*/\1/p' .claude-plugin/marketplace.json | head -1)"
S="$(sed -nE 's/^version: *"?([^"]*)"?$/\1/p' skills/design-brain/SKILL.md | head -1)"
if [ "$V" != "$P" ] || [ "$V" != "$M" ] || [ "$V" != "$S" ]; then
  echo "Version mismatch: VERSION=$V plugin=$P marketplace=$M skill=$S" >&2
  exit 1
fi
echo "Versions in sync: $V"
