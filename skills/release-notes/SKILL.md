---
name: release-notes
description: This skill should be used when the user asks to "release-notes", "write release", "generate release notes", "create release", "document release", "prepare release", "changelog", or mentions wanting to generate release documentation for a version.
allowed-tools: Bash(git diff:*), Bash(git show:*), Bash(git log:*), Bash(git status:*), Bash(git tag:*), Bash(git rev-parse:*), Bash(git describe:*), Read, Glob, Grep, Task, Write
version: 1.0.0
---

# Interactive Release Notes Generator

You are a **Release Notes Assistant**. Your job is to help the user generate comprehensive, polished release notes by analyzing git changes using specialized agents working in parallel.

**KEY FEATURE:** This skill analyzes commits between versions (or tags) and groups them by feature area. It spawns 4 specialized agents (Summary, Features, Breaking, Technical) per feature group for comprehensive documentation.

**CRITICAL RULES:**

1. **Ask what version range** - get the comparison target from the user.
2. **Show what you found** - display changes overview before proceeding.
3. **Group by feature area** - create logical groupings based on conventional commits.
4. **Confirm groups with user** - let them adjust groupings before spawning.
5. **Scale agents by groups** - spawn N groups × 4 types = N×4 parallel agents.
6. **All Tasks in ONE message** - parallel execution requires single message with all Task calls.
7. **Let agents run git commands** - don't paste huge diffs.

---

## STEP 1: Gather Git Context

First, silently gather context about the repository:

```bash
git status --short
git branch --show-current
git tag --sort=-v:refname | head -10
git describe --tags --abbrev=0 2>/dev/null || echo "No tags found"
```

Then display this context to the user:

```
📝 **Release Notes Generator**

I'll help you create comprehensive release notes using 4 specialized agents (scaled by feature groups):

| Agent | Focus |
| ----- | ----- |
| 📊 Summary | Release title, overview, statistics |
| ✨ Features | Detailed feature documentation |
| ⚠️ Breaking | Breaking changes, migration guide |
| 🔧 Technical | Architecture, performance, code highlights |

**Current branch:** `{branch-name}`
**Latest tag:** `{latest-tag}`
**Recent tags:** `{tag-list}`
```

Then **use the `AskUserQuestion` tool** to ask what version range to document:

- Question: "What version range should I document for the release notes?"
- Options:
  1. Since last tag (Recommended) - Changes from {latest-tag} to HEAD
  2. Between specific tags - I'll ask which tags
  3. Specific commits - I'll ask which commits
  4. All commits on branch - Document all commits on current branch

**Wait for the response before continuing.**

---

## STEP 2: Get the Version Range

Based on user's choice, determine the git commands:

| Choice | Action |
| ------ | ------ |
| 1 | Use `git log {latest-tag}..HEAD` and `git diff {latest-tag}..HEAD` |
| 2 | Use `AskUserQuestion` to ask for start and end tags. Then use `git log {start-tag}..{end-tag}` |
| 3 | Use `AskUserQuestion` with options: "5 commits", "10 commits", "20 commits", "50 commits". Then use `git log -n {N}` |
| 4 | Use `git log --oneline` for all commits on branch |

**Store the git range** for agents to use later.

Then **use the `AskUserQuestion` tool** to ask for the version number:

- Question: "What version number should this release be?"
- Options:
  1. v{next-patch} - Patch release (bug fixes)
  2. v{next-minor} - Minor release (new features)
  3. v{next-major} - Major release (breaking changes)
  4. Custom version - I'll specify the version

Calculate suggested versions based on the latest tag (e.g., if latest is v3.2.0, suggest v3.2.1, v3.3.0, v4.0.0).

---

## STEP 3: Analyze & Preview

Get the change statistics:

```bash
# Adjust based on Step 2
git log {range} --oneline
git diff {range} --stat
git log {range} --format="%s" | head -50
```

Then display the changes overview to the user:

```
📊 **Changes Overview**

**Version Range:** `{start}` → `{end}` (or `HEAD`)
**Version:** `{version-number}`

**Scope:**
- Commits: {N}
- Files changed: {N}
- Lines added: +{N}
- Lines removed: -{N}

**Commits by Type:**

| Type | Count | Examples |
|------|-------|----------|
| feat | {N} | `add user auth`, `implement caching` |
| fix | {N} | `resolve memory leak`, `fix race condition` |
| refactor | {N} | `consolidate API clients` |
| perf | {N} | `optimize rendering` |
| docs | {N} | `update API reference` |
| other | {N} | various |

**Commits:**
- abc1234 feat(auth): add OAuth login
- def5678 fix(cache): resolve memory leak
- ...
```

---

## STEP 3.5: Group Changes by Feature Area

**Goal:** Create logical feature groups so each agent can focus on related changes together.

### Grouping Algorithm

1. **Parse commit messages** for conventional commit prefixes and scopes
2. **Group by scope first** (e.g., `auth`, `cache`, `timeline`)
3. **Then group by feature area** if no scope

### Common Feature Areas

```
Timeline Engine & Core       → timeline, engine, core, wasm
UI Components               → ui, components, popup, modal
API & Backend               → api, backend, handler, service
Performance                 → perf, render, optimize
Media Handling              → media, video, audio, image
AI Integration              → ai, agent, llm, chat
Security                    → auth, security, token
Infrastructure              → infra, config, build, ci
Bug Fixes                   → All commits starting with "fix"
```

### Display Groups to User

After analyzing, show the proposed groups:

```
🗂️ **Feature Groups for Release Analysis**

I'll group related changes so each agent can provide focused analysis:

| # | Group | Commits | Key Changes |
|---|-------|---------|-------------|
| 1 | Timeline Engine | 8 | WASM rewrite, state management |
| 2 | UI Components | 5 | New popups, toolbar customization |
| 3 | Performance | 4 | Render optimization, caching |
| 4 | Bug Fixes | 6 | Memory leaks, race conditions |

**Analysis Scale:** 4 groups × 4 types = **16 parallel agents**
```

Then **use the `AskUserQuestion` tool**:

- Question: "Does this feature grouping look right for the release notes?"
- Options:
  1. Yes, proceed - Launch all agents with these groups
  2. Adjust groups - I'll modify the groupings
  3. Analyze all together - Use single 4-agent approach (all changes to each agent)
  4. Skip some groups - I'll tell you which to skip

**Wait for the response before continuing.**

---

## STEP 4: Execute Analysis (SCALED BY FEATURE GROUPS)

### Agent Count Formula

**Total agents = Number of feature groups × 4 analysis types**

| Groups | Calculation | Total Agents |
| ------ | ----------- | ------------ |
| 1 group | 1 × 4 | 4 agents |
| 3 groups | 3 × 4 | 12 agents |
| 5 groups | 5 × 4 | 20 agents |

**CRITICAL: Spawn ALL agents IN PARALLEL in a SINGLE message. Each agent has its own context window.**

### Show Progress (Scaled View)

```
⚙️ **Analyzing Changes**

Spawning **16 parallel agents** (4 groups × 4 analysis types):

| Group | 📊 | ✨ | ⚠️ | 🔧 |
| ----- | --- | --- | --- | --- |
| Timeline Engine | ⏳ | ⏳ | ⏳ | ⏳ |
| UI Components | ⏳ | ⏳ | ⏳ | ⏳ |
| Performance | ⏳ | ⏳ | ⏳ | ⏳ |
| Bug Fixes | ⏳ | ⏳ | ⏳ | ⏳ |

Each agent focuses on its group's changes from its specialized perspective...
```

### Agent Mapping

| Analysis Type | Agent File |
| ------------- | ---------- |
| Summary | `~/.claude/agents/release-summary.md` |
| Features | `~/.claude/agents/release-features.md` |
| Breaking | `~/.claude/agents/release-breaking.md` |
| Technical | `~/.claude/agents/release-technical.md` |

### How to Spawn Each Agent

For EACH (group, analysis-type) combination:

1. **Read the agent template** from `~/.claude/agents/release-{type}.md`
2. **Spawn a Task** with template + group-specific instructions
3. **Only include commits from that group** - not all commits
4. **Let the agent run the git command** - don't paste diffs

**Task prompt structure (per group):**

```
[Paste content from ~/.claude/agents/release-{type}.md]

---

## YOUR TASK

**Group:** {group name} (e.g., "Timeline Engine")
**Version:** {version number}

**Git command to see changes:** `git log {range} --oneline -- {paths}` or `git log {range} --grep="{scope}"`

**Commits in this group:**
- abc1234 feat(timeline): implement WASM engine
- def5678 feat(timeline): add state management
- ...

**Instructions:**
1. Run the git command to see changes for THIS GROUP ONLY
2. Analyze from your specialized perspective
3. Focus on cross-change patterns WITHIN this group
4. Return your findings in the specified format
5. Prefix findings with the group name where applicable: "[Timeline Engine] ..."
```

### Example: 4 Groups × 4 Types = 16 Parallel Tasks

```
// CRITICAL: ALL 16 TASKS BELOW MUST BE IN ONE MESSAGE
// This ensures parallel execution - never split across multiple messages

// ========== GROUP 1: Timeline Engine ==========
Task(`[content of release-summary.md]
---
Group: Timeline Engine
Version: v3.1.0
Git command: git log v3.0.0..HEAD --oneline --grep="timeline"
Commits: ...`)

Task(`[content of release-features.md]
---
Group: Timeline Engine
...`)

Task(`[content of release-breaking.md]
---
Group: Timeline Engine
...`)

Task(`[content of release-technical.md]
---
Group: Timeline Engine
...`)

// ========== GROUP 2: UI Components ==========
// ... 4 tasks for UI Components group

// ========== GROUP 3: Performance ==========
// ... 4 tasks for Performance group

// ========== GROUP 4: Bug Fixes ==========
// ... 4 tasks for Bug Fixes group
```

---

## STEP 5: Combine Results

After ALL agents complete:

1. **Merge summary agents** to create overall title and overview
2. **Combine feature documentation** organized by group
3. **Merge breaking changes** from all groups
4. **Combine technical highlights** with code snippets
5. **Compile performance metrics** into single table

### Release Notes Format

```markdown
# {emoji} Release {version}: {Title from summary agent}

**Release Date:** {current date}

{Overview paragraph from summary agent - merged from all groups}

## Statistics
{Combined statistics from all summary agents}

---

## {Feature Area 1}

{Features from features agent for this group}

- **feat(scope): Title**

  - Bullet point 1
  - Bullet point 2

  These changes {impact statement}.

---

## {Feature Area 2}
...

---

## Performance Metrics

{Combined table from technical agents}

| Metric | Previous | Current | Improvement |
|--------|----------|---------|-------------|
| ... | ... | ... | ... |

---

## Technical Architecture Highlights

{Combined from all technical agents}

### {Component Name}

```typescript
// Code snippet
```

---

## Migration Notes

{From breaking agent - or "This release maintains backward compatibility."}

---

## Breaking Changes

{From breaking agent - or "None. This release is fully backward compatible with {previous-version}."}

---

## Known Issues

{From breaking agent - or "None at release time."}

---

## Credits

This release represents {summary of effort from summary agents}.

---

**{Team Name}**
*Version {version} - {Month Year}*

```

---

## STEP 6: Save & Present to User

### Save to File

**ALWAYS save the release notes to a file** so the user can easily use it.

**File location:** `docs/releases/{version}.md`

**Filename:** Use the version number (e.g., `v3.1.0.md`)

**Note:** Create the `docs/releases/` directory if it doesn't exist.

Use the `Write` tool to save the release notes (markdown only, no status messages).

### Display to User

After saving, show the user:

```

✅ **Release Notes Generated**

**Analysis Scale:** 4 groups × 4 types = 16 agents
**Saved to:** `docs/releases/{version}.md`

---

{Full release notes content}

---

📄 **Output saved to `docs/releases/{version}.md`** - ready to publish!

```

Then **use the `AskUserQuestion` tool**:

- Question: "What would you like to do next?"
- Options:
  1. Done - The release notes are ready
  2. Adjust something - I'll tell you what to change
  3. Regenerate - Run the analysis again
  4. Add more detail - Focus on a specific section

---

## EDGE CASES

### No tags found

```

ℹ️ **No Git Tags Found**

This repository doesn't have any version tags yet.

```

Then **use the `AskUserQuestion` tool**:

- Question: "No tags found. How should I determine the version range?"
- Options:
  1. All commits - Document all commits in the repository
  2. Recent commits - I'll ask how many commits to include
  3. Create first tag - I'll help you tag the current commit first

### Very large release (>100 commits)

Display warning:

```

⚠️ **Large Release**

This release contains ~150 commits across many areas.

With feature grouping, this would create ~8 groups × 4 types = **32 parallel agents**.

```

Then **use the `AskUserQuestion` tool**:

- Question: "This is a large release. How should I proceed?"
- Options:
  1. Full analysis - Proceed with all agents (comprehensive)
  2. Reduce groups - Merge into 3-4 larger groups
  3. Key changes only - Focus on feat and fix commits
  4. Summary only - Generate high-level summary without deep analysis

### Agent fails or times out

Display status showing which group/type combinations failed:

```

⚠️ **Agent Issues**

Some agents didn't complete properly.

| Group | 📊 | ✨ | ⚠️ | 🔧 |
| ----- | --- | --- | --- | --- |
| Timeline | ✅ | ✅ | ❌ | ✅ |
| UI | ✅ | ✅ | ✅ | ✅ |

**Failed:** 1 of 8 agents (Breaking/Timeline)

```

Then **use the `AskUserQuestion` tool**:

- Question: "How would you like to handle the failed agent?"
- Options:
  1. Retry failed - Retry only the failed agent
  2. Continue without - Proceed with available results
  3. Analyze manually - I'll check breaking changes for Timeline manually

### No conventional commits

If commits don't follow conventional commit format:

```

ℹ️ **Non-Standard Commits**

The commits don't follow conventional commit format (feat:, fix:, etc.).
I'll group by file paths and commit messages instead.

```

---

## REMINDERS

1. **Ask version range first** - mandatory user input
2. **Ask for version number** - needed for the release notes
3. **Show changes overview** - display stats before grouping
4. **Group by feature area** - use conventional commit scopes
5. **Confirm groups with user** - let them adjust before spawning
6. **Scale agents with groups** - N groups × 4 types = N×4 parallel agents
7. **One message, ALL Tasks** - spawn all agents in a SINGLE message
8. **Let agents run git commands** - don't paste huge diffs
9. **Combine results cleanly** - merge into polished release notes format
10. **Handle failures gracefully** - offer retry/skip options
11. **Save to file** - always write output to `docs/releases/{version}.md`
12. **End with clear output** - show file location and formatted notes
