#!/usr/bin/env bash
# Install every skill in skills/ for Cursor, Claude Code, and Codex (user scope).
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
src="$root/skills"
if [[ ! -d "$src" ]]; then
  echo "Missing skills directory: $src" >&2
  exit 1
fi

targets=(
  "$HOME/.cursor/skills"
  "$HOME/.claude/skills"
  "$HOME/.agents/skills"
)

for dest_root in "${targets[@]}"; do
  mkdir -p "$dest_root"
  for skill in "$src"/*/; do
    [[ -d "$skill" ]] || continue
    name="$(basename "$skill")"
    rm -rf "$dest_root/$name"
    cp -R "$skill" "$dest_root/$name"
    echo "installed $name -> $dest_root/$name"
  done
done

echo
echo "Done. Restart Cursor, Claude Code, or Codex if a skill list was already open."
