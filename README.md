# Claude Code Extensions

A collection of custom commands, skills, and agents for [Claude Code](https://github.com/anthropics/claude-code).

## What's Included

### Commands

Custom slash commands that extend Claude Code's functionality.

### Skills

Reusable skills that can be invoked during Claude Code sessions.

### Agents

Custom agent configurations for specialized tasks.

### Hooks

Custom shell scripts that integrate with Claude Code's hook system.

#### Custom Status Line (`custom-status-line.sh`)

A rich status line that displays detailed session metrics in your terminal.

**Displays:**

- Current directory name
- Active model
- Context window usage (visual progress bar + percentage)
- Session cost (USD)
- Lines added/removed
- Session duration
- Input/output token counts

**Setup:** Add to your `settings.json`:

```json
  "statusLine": {
    "type": "command",
    "command": "~/.claude/custom-status-line.sh"
  }
```

#### File Suggestions (`file-suggestion.sh`)

A custom file suggestion script that searches file paths (not content) with results sorted by modification time, prioritizing recently changed files.

**Features:**

- Fuzzy path matching using fzf
- Most recently modified files appear first
- Excludes hidden files and directories
- Returns top 15 matches

**Dependencies:** `ripgrep`, `fzf`, `jq`

**Setup:** Add to your `settings.json`:

```json
  "fileSuggestion": {
    "type": "command",
    "command": "~/.claude/file-suggestion.sh"
  }
```

## Installation

1. Clone this repository into your Claude Code config directory:

   ```bash
   git clone https://github.com/YOUR_USERNAME/claude-code-extensions ~/.claude
   ```

2. Or copy specific directories you want:

   ```bash
   # Copy just commands
   cp -r commands/ ~/.claude/commands/

   # Copy just skills
   cp -r skills/ ~/.claude/skills/
   ```

## Usage

Once installed, the commands and skills will be available in your Claude Code sessions.

## Contributing

Contributions are welcome! Feel free to submit issues and pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
