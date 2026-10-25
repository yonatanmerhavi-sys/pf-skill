#!/usr/bin/env sh
# Installs the pf skill for every Claude Code project on this machine (no plugin needed).
set -e
src="$(cd "$(dirname "$0")" && pwd)/plugins/pf/skills/pf"
dest="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills/pf"
mkdir -p "$(dirname "$dest")"
rm -rf "$dest"
cp -R "$src" "$dest"
echo "Installed pf to $dest. Open a new Claude Code session and type /pf"
