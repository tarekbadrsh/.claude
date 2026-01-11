#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract information from JSON
model_name=$(echo "$input" | jq -r '.model.display_name')
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')

# Extract context window information
context_size=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')
current_usage=$(echo "$input" | jq '.context_window.current_usage')

# Calculate context percentage
if [ "$current_usage" != "null" ]; then
    current_tokens=$(echo "$current_usage" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')
    context_percent=$((current_tokens * 100 / context_size))
else
    context_percent=0
fi

# Build context progress bar
bar_width=15
filled=$((context_percent * bar_width / 100))
empty=$((bar_width - filled))
bar=""
for ((i=0; i<filled; i++)); do bar+="█"; done
for ((i=0; i<empty; i++)); do bar+="░"; done

# Get directory name (basename)
dir_name=$(basename "$current_dir")

# === NEW: Extract cost and stats ===
total_cost=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
lines_added=$(echo "$input" | jq -r '.cost.total_lines_added // 0')
lines_removed=$(echo "$input" | jq -r '.cost.total_lines_removed // 0')
duration_ms=$(echo "$input" | jq -r '.cost.total_duration_ms // 0')
api_duration_ms=$(echo "$input" | jq -r '.cost.total_api_duration_ms // 0')
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')

# Format cost
cost_display=$(printf "$%.2f" "$total_cost")

# Format lines changed
lines_display="+${lines_added} -${lines_removed}"

# Format duration (convert ms to minutes/seconds)
duration_sec=$((duration_ms / 1000))
if [ $duration_sec -ge 60 ]; then
    duration_min=$((duration_sec / 60))
    duration_display="${duration_min}m"
else
    duration_display="${duration_sec}s"
fi

# Format API time
api_sec=$(echo "scale=1; $api_duration_ms / 1000" | bc 2>/dev/null || echo "0")
api_display="${api_sec}s"

# Format tokens (K format for readability)
format_tokens() {
    local tokens=$1
    if [ "$tokens" -ge 1000 ]; then
        echo "$(echo "scale=1; $tokens / 1000" | bc 2>/dev/null || echo "$tokens")k"
    else
        echo "$tokens"
    fi
}
input_display=$(format_tokens "$total_input")
output_display=$(format_tokens "$total_output")

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

# Change to the current directory to get git info
cd "$current_dir" 2>/dev/null || cd /

# Build context bar display
context_info="${GRAY}${bar}${NC} ${context_percent}%"

# Build the full status line
echo -e "${BLUE}${dir_name}${NC} ${GRAY}|${NC} ${CYAN}${model_name}${NC} ${GRAY}|${NC} ${context_info} ${GRAY}|${NC} ${GREEN}${cost_display}${NC} ${GRAY}|${NC} ${GREEN}+${lines_added}${NC} ${RED}-${lines_removed}${NC} ${GRAY}|${NC} ${YELLOW}${duration_display}${NC} ${GRAY}|${NC} ${MAGENTA}↑${input_display} ↓${output_display}${NC}"
