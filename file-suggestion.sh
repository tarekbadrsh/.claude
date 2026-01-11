#!/bin/bash
# Custom file suggestion script for Claude Code
# Searches file PATHS only (not content), sorted by recent modification

# Parse JSON input to get query
QUERY=$(jq -r '.query // ""')

# Use project dir from env, fallback to pwd
PROJECT_DIR="${CLAUDE_PROJECT_DIR:-.}"

# cd into project dir so rg outputs relative paths
cd "$PROJECT_DIR" || exit 1

# Get all files, sort by modification time (newest first), then fuzzy filter by path
# --no-hidden: explicitly exclude hidden files/dirs, --glob '!.*': extra safety
rg --files --follow --no-hidden --glob '!.*' . 2>/dev/null | \
  xargs -P4 -I{} stat -f '%m %N' {} 2>/dev/null | \
  sort -rn | \
  cut -d' ' -f2- | \
  fzf --filter "$QUERY" --scheme=path | \
  head -15
