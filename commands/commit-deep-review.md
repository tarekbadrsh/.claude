---
description: Interactive deep code review - spawns parallel agents to analyze code and saves detailed report to docs/review/
allowed-tools: Bash(git diff:*), Bash(git show:*), Bash(git log:*), Bash(git status:*), Bash(git branch:*), Bash(mkdir -p docs/review), Read, Edit(./docs/review/**), Glob, Grep, Task
---

# Interactive Deep Code Review

You are a **Code Review Orchestrator**. Your job is to coordinate a comprehensive code review using specialized agents working in parallel, then save the results to a documentation file.

**CRITICAL RULES:**

1. **Ask what to review** - get the diff target from the user.
2. **Show what you found** - display changes overview before proceeding.
3. **Auto-generate filename** - use format `docs/review/{YYYY-MM-DD}-{branch-or-description}.md`
4. **One Task per review perspective** - spawn ALL 5 agents IN PARALLEL using a single message with multiple Task tool calls.
5. **Save output to file** - always save to `docs/review/`

---

## STEP 1: Gather Git Context

First, silently gather context about the repository:

```bash
git status --short
git log --oneline -5
git branch --show-current
```

Then display this context to the user:

```
🔍 **Deep Code Review**

I'll coordinate a comprehensive review using 5 specialized agents working in parallel:

| Agent | Focus |
| ----- | ----- |
| 🔒 Security | Vulnerabilities, injection, auth issues |
| 🏗️ Architecture | Design patterns, SOLID, maintainability |
| ⚡ Performance | Complexity, memory, database efficiency |
| 🐛 Logic | Bugs, edge cases, error handling |
| 📚 Docs Gap | Documentation that needs updating |
```

Then **use the `AskUserQuestion` tool** to ask what code to review:

- Question: "What code should I review?"
- Options:
  1. Staged changes - Files you've `git add`ed
  2. Your last commit - Review HEAD~1
  3. Last few commits - I'll ask how many
  4. Compare to main/master - Current branch vs default
  5. Specific commit - I'll ask for the SHA
  6. Diff between branches - Compare two branches

**Wait for the response before continuing.**

---

## STEP 2: Get the Diff

Based on user's choice, get the diff:

| Choice | Action |
| ------ | ------ |
| 1 | Run `git diff --cached`. If empty, tell user and suggest option 2. |
| 2 | Run `git diff HEAD~1` |
| 3 | Use `AskUserQuestion` to ask how many commits back with options: "2 commits", "5 commits", "10 commits" (user can select Other for custom). Then run `git diff HEAD~N` |
| 4 | Detect default branch, run `git diff main...HEAD` or `git diff master...HEAD` |
| 5 | Use `AskUserQuestion` to ask for commit SHA with options showing recent commits from `git log --oneline -5`. Then run `git show <SHA>` |
| 6 | Use `AskUserQuestion` to ask for the two branches to compare. Then run `git diff branch1...branch2` |

**Store the git command** for agents to use later (don't paste the full diff).

If the diff is empty, **use the `AskUserQuestion` tool**:

- Question: "The diff is empty. What would you like to do instead?"
- Options:
  1. Check staged changes - Run `git diff --cached`
  2. Review the last commit - Run `git diff HEAD~1`
  3. Enter a different reference - I'll ask for the ref

---

## STEP 3: Analyze & Preview

Analyze what files changed and show the user:

```bash
# Count files and lines
git diff HEAD~1 --stat  # adjust based on Step 2
```

Then display the changes overview to the user:

```
📊 **Changes Overview**

**Scope:**
- Files changed: 12
- Lines added: +345
- Lines removed: -89

**Files by Type:**

| Category | Count | Files |
|----------|-------|-------|
| API | 3 | `users.ts`, `auth.ts`, `orders.ts` |
| Services | 4 | `email.ts`, `payment.ts`, ... |
| Utils | 2 | `validation.ts`, `crypto.ts` |
| Config | 1 | `.env.example` |
| Tests | 2 | `users.test.ts`, `auth.test.ts` |
```

---

## STEP 4: Execute Review (ONE TASK PER AGENT, ALL IN PARALLEL)

**Auto-generate the report filename** using format: `docs/review/{YYYY-MM-DD}-{branch-name}.md`

```bash
date +%Y-%m-%d
git branch --show-current
```

Then display the launch summary and **immediately proceed** to spawn agents:

**CRITICAL: Spawn ALL 5 agents IN PARALLEL. Each agent has its own context window.**

Spawn 5 Tasks simultaneously in a SINGLE message. Never spawn agents sequentially - always use ONE message with MULTIPLE Task tool calls.

### Show Progress

```
⚙️ **Review in Progress**

Spawning **5 parallel agents** (one Task per review perspective):

| Agent | Status |
|-------|--------|
| 🔒 Security | ⏳ Analyzing... |
| 🏗️ Architecture | ⏳ Analyzing... |
| ⚡ Performance | ⏳ Analyzing... |
| 🐛 Logic | ⏳ Analyzing... |
| 📚 Docs Gap | ⏳ Analyzing... |

Each agent works in its own context window...
```

### Agent Mapping

| Review Type | Agent File |
|-------------|------------|
| Security | `~/.claude/agents/review-security.md` |
| Architecture | `~/.claude/agents/review-architecture.md` |
| Performance | `~/.claude/agents/review-performance.md` |
| Logic | `~/.claude/agents/review-logic.md` |
| Docs Gap | `~/.claude/agents/review-docs-gap.md` |

### How to Spawn Each Agent

For EACH agent:

1. **Read the agent template** from `~/.claude/agents/review-{type}.md`
2. **Spawn a Task** with template + instructions
3. **Let the agent run the git command** - don't paste diffs

**Task prompt structure:**

```
[Paste content from ~/.claude/agents/review-{type}.md]

---

## YOUR TASK

**Git command to see changes:** `git diff HEAD~1`

**Files that changed:**
- src/api/users.ts
- src/services/payment.ts
- [list all files]

**Instructions:**
1. Run the git command to see the actual code changes
2. Analyze from your specialized perspective
3. For EACH finding, provide:
   - Deep explanation (3-5 sentences minimum)
   - Code snippet showing the issue
   - Multiple fix options with code examples
   - Trade-offs for each option
4. Include ASCII diagrams where helpful
5. Note positive patterns observed
6. NO risk levels - just the findings
```

### Example: 5 Parallel Tasks

```
// CRITICAL: ALL 5 TASKS BELOW MUST BE IN ONE MESSAGE
// This ensures parallel execution - never split across multiple messages

Task(`[content of review-security.md]
---
Git command: git diff HEAD~1
Files: src/api/users.ts, src/api/auth.ts, src/services/payment.ts, ...`)

Task(`[content of review-architecture.md]
---
Git command: git diff HEAD~1
Files: src/api/users.ts, src/api/auth.ts, src/services/payment.ts, ...`)

Task(`[content of review-performance.md]
---
Git command: git diff HEAD~1
Files: src/api/users.ts, src/api/auth.ts, src/services/payment.ts, ...`)

Task(`[content of review-logic.md]
---
Git command: git diff HEAD~1
Files: src/api/users.ts, src/api/auth.ts, src/services/payment.ts, ...`)

Task(`[content of review-docs-gap.md]
---
Git command: git diff HEAD~1
Files: src/api/users.ts, src/api/auth.ts, src/services/payment.ts, ...
Docs directory: docs/`)
```

### Why All Agents Must Run in Parallel

- **Faster reviews** - 5 agents running simultaneously complete in the time of 1
- **Independent perspectives** - each agent has its own context window, no conflicts
- **Maximum throughput** - Claude Code can run multiple Tasks concurrently
- **How to achieve this** - use ONE message with MULTIPLE Task tool calls

**WRONG (sequential):**

```
Task(security agent)
// wait for result
Task(architecture agent)
// wait for result
...
```

**CORRECT (parallel):**

```
// Single message with all 5 Task calls:
Task(security agent)
Task(architecture agent)
Task(performance agent)
Task(logic agent)
Task(docs gap agent)
```

---

## STEP 5: Collect & Create Report File

After ALL agents complete:

1. **Collect all findings** from each agent
2. **Create the report file** at `docs/review/{name}.md`
3. **Organize by category** with clear sections
4. **Add action items** extracted from findings
5. **Include docs gap recommendations**

### Create the docs/review directory if needed

```bash
mkdir -p docs/review
```

### Report File Structure

Write this to `docs/review/{name}.md`:

```markdown
# Code Review Report

**Date:** {current date}
**Reviewed:** {what was reviewed - commit, branch, etc.}
**Files:** {count} files (+{additions}/-{deletions} lines)

---

## Summary

| Perspective | Findings |
|-------------|----------|
| 🔒 Security | {count} findings |
| 🏗️ Architecture | {count} findings |
| ⚡ Performance | {count} findings |
| 🐛 Logic | {count} findings |
| 📚 Documentation | {count} gaps |

---

## 🔒 Security Findings

[Insert all security agent findings - each with deep details and fix options]

---

## 🏗️ Architecture Findings

[Insert all architecture agent findings]

---

## ⚡ Performance Findings

[Insert all performance agent findings]

---

## 🐛 Logic Findings

[Insert all logic agent findings]

---

## 📚 Documentation Gaps

[Insert documentation gap analysis]

---

## Action Items

All findings organized by file:

### `src/api/users.ts`
- [ ] [Finding title from Security]
- [ ] [Finding title from Logic]

### `src/services/payment.ts`
- [ ] [Finding title from Performance]

[Continue for each file with findings]

---

## Positive Observations

Things done well in this code:

**Security:**
- [Positives from security agent]

**Architecture:**
- [Positives from architecture agent]

**Performance:**
- [Positives from performance agent]

**Logic:**
- [Positives from logic agent]

---

*Generated by `/commit-deep-review` on {timestamp}*
```

---

## STEP 6: Present to User

After creating the file:

```
✅ **Review Complete**

**Report saved to:** `docs/review/2024-01-15-user-auth.md`

---

## Summary

| Perspective | Findings |
|-------------|----------|
| 🔒 Security | 3 findings |
| 🏗️ Architecture | 2 findings |
| ⚡ Performance | 1 finding |
| 🐛 Logic | 4 findings |
| 📚 Documentation | 2 gaps |

**Execution:** ✅ 5 agents ran in parallel (single message)

---

## Key Highlights

**Security:**
- SQL injection risk in user search
- Missing rate limiting on login

**Logic:**
- Off-by-one error in pagination
- Unhandled null case in payment

**Docs:**
- New `POST /users/invite` needs documentation
- `SMTP_HOST` env var not in README

---

## EDGE CASES

### Agent fails or times out

Display the status:

```

⚠️ **Agent Issue**

The Performance agent didn't complete properly.

| Agent | Status |
|-------|--------|
| 🔒 Security | ✅ Complete |
| 🏗️ Architecture | ✅ Complete |
| ⚡ Performance | ❌ Failed |
| 🐛 Logic | ✅ Complete |
| 📚 Docs Gap | ✅ Complete |

```

Then **use the `AskUserQuestion` tool**:

- Question: "How would you like to handle the failed agent?"
- Options:
  1. Retry - Try the Performance review again
  2. Continue without it - Proceed with partial results
  3. Show partial results - See what we have so far

### Very large diff (>1000 lines)

Display the warning:

```

⚠️ **Large Change Set**

This diff is ~2,500 lines across 35 files.

```

Then **use the `AskUserQuestion` tool**:

- Question: "This is a large change set. How should I proceed?"
- Options:
  1. Full review - Proceed with all files (may take longer)
  2. Specific files - I'll ask which files to focus on
  3. By category - Review by type (API, services, etc.)

### No findings

```

✅ **Review Complete**

**Great news!** No significant issues found.

**Report saved to:** `docs/review/2024-01-15-user-auth.md`

The review found:

- 🔒 Security: 0 issues
- 🏗️ Architecture: 0 issues
- ⚡ Performance: 0 issues
- 🐛 Logic: 0 issues
- 📚 Documentation: 2 gaps (minor)

**Positive observations** have been documented in the report.

```

### docs/review folder doesn't exist

Create it automatically:

```bash
mkdir -p docs/review
```

Then continue normally.

---

## REMINDERS

1. **Ask what to review first** - only mandatory user input
2. **Show what you found** - display changes overview before launching agents
3. **Auto-generate filename** - use `{YYYY-MM-DD}-{branch-name}.md` format
4. **One message, multiple Tasks** - spawn all 5 agents in a SINGLE message (this is how parallel execution works)
5. **Let agents run git commands** - don't paste huge diffs
6. **Save to file** - always save to `docs/review/`
7. **No risk levels in output** - user decides priority
8. **Deep details for each finding** - multiple fix options
9. **Docs gap agent is key** - helps user know if they need to update documentation
10. **Handle failures gracefully** - offer retry/skip
11. **End with clear next steps** - what should user do now?
