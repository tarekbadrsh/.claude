---
name: deep-review
description: This skill should be used when the user asks to "deep-review", "deep review", "review code", "code review", "review my changes", "review this PR", "security review", "architecture review", or mentions wanting a comprehensive code analysis.
allowed-tools: Bash(git diff:*), Bash(git show:*), Bash(git log:*), Bash(git status:*), Bash(git branch:*), Bash(find:*), Bash(ls:*), Bash(cat:*), Bash(head:*), Bash(tree:*), Bash(wc:*), Read, Write, Glob, Grep, Task
version: 1.0.0
---

# Interactive Deep Code Review

You are a **Code Review Orchestrator**. Your job is to coordinate a comprehensive code review using specialized agents working in parallel, then save the results to a documentation file.

**KEY FEATURE:** This skill scales by grouping related files together. Instead of 5 agents reviewing all files, it spawns N×5 agents (N groups × 5 review types), where each agent focuses on related files within its group. This catches cross-file issues within features while maintaining review depth.

**CRITICAL RULES:**

1. **Ask what to review** - get the diff target from the user.
2. **Show what you found** - display changes overview before proceeding.
3. **Group related files** - create logical file groups for focused review.
4. **Confirm groups with user** - let them adjust groupings before spawning.
5. **Scale agents by groups** - spawn N groups × 5 types = N×5 parallel agents.
6. **All Tasks in ONE message** - parallel execution requires single message with all Task calls.
7. **Auto-generate filename** - use format `docs/review/{YYYY-MM-DD}-{branch-or-description}.md`
8. **Save output to file** - always save to `docs/review/`

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

## STEP 3.5: Group Files for Review

**Goal:** Create logical file groups so each review agent can focus on related files together. This catches cross-file issues within features while scaling the review.

### Grouping Algorithm

1. **Parse changed files** into categories:
   - Extract directory path (primary grouping key)
   - Extract feature indicators from filename
   - Identify file type (source, test, config)

2. **Initial grouping by directory:**

   ```
   src/api/* -> Group "API Layer"
   src/services/* -> Group "Services"
   src/components/* -> Group "Components"
   src/utils/* -> Group "Utilities"
   tests/* -> Group "Tests"
   config/* -> Group "Configuration"
   ```

3. **Feature-based refinement** (if directory has many files):
   - Look for common prefixes: `auth-*.ts`, `payment-*.ts` -> subgroups
   - Look for related names: `user.ts`, `UserService.ts`, `user.test.ts` -> same group

4. **Group size rules:**
   - **Minimum:** 1 file (single files become their own group)
   - **Maximum:** 10 files (larger groups get split by subdirectory or feature)
   - **Merge small groups** (< 2 files) into "Other" or nearest related group

5. **Handle cross-cutting files:**
   - Type definition files (`*.d.ts`, `types.ts`): Include in most relevant group
   - Utility files: Assign to "Shared/Utilities" group
   - Config files: Assign to "Configuration" group

### Display Groups to User

After analyzing, show the proposed groups:

```
🗂️ **File Groups for Review**

I'll group related files so each agent can catch cross-file issues within features:

| # | Group | Files | Rationale |
|---|-------|-------|-----------|
| 1 | Authentication | `auth.ts`, `login.tsx`, `session.ts`, `auth.test.ts` | Auth feature files |
| 2 | Payment | `payment.ts`, `stripe.ts`, `checkout.tsx` | Payment processing |
| 3 | API Routes | `users.ts`, `orders.ts`, `products.ts` | REST API endpoints |
| 4 | Utilities | `validation.ts`, `crypto.ts` | Shared helpers |

**Review Scale:** 4 groups × 5 review types = **20 parallel agents**
```

Then **use the `AskUserQuestion` tool**:

- Question: "Does this file grouping look right for the review?"
- Options:
  1. Yes, proceed - Launch all agents with these groups
  2. Adjust groups - I'll modify the groupings
  3. Review all together - Use original 5-agent approach (all files to each agent)
  4. Skip some groups - I'll tell you which to skip

**Wait for the response before continuing.**

### If User Chooses "Adjust groups"

Use `AskUserQuestion` to ask what to change:

- Question: "How should I adjust the groupings?"
- Options:
  1. Merge groups - Combine some groups together
  2. Split a group - Break a large group into smaller ones
  3. Move files - Reassign specific files to different groups
  4. Let me describe - I'll explain what I want

### If User Chooses "Review all together"

Fall back to the original 5-agent approach where all files go to each agent. Skip the grouping and proceed directly to STEP 4 with the original pattern.

---

## STEP 4: Execute Review (SCALED BY FILE GROUPS)

**Auto-generate the report filename** using format: `docs/review/{YYYY-MM-DD}-{branch-name}.md`

```bash
date +%Y-%m-%d
git branch --show-current
```

Then display the launch summary and **immediately proceed** to spawn agents.

### Agent Count Formula

**Total agents = Number of file groups × 5 review types**

| Groups | Calculation | Total Agents |
| ------ | ----------- | ------------ |
| 1 group | 1 × 5 | 5 agents |
| 3 groups | 3 × 5 | 15 agents |
| 5 groups | 5 × 5 | 25 agents |

**CRITICAL: Spawn ALL agents IN PARALLEL in a SINGLE message. Each agent has its own context window.**

### Show Progress (Scaled View)

```
⚙️ **Review in Progress**

Spawning **20 parallel agents** (4 groups × 5 review types):

| Group | 🔒 | 🏗️ | ⚡ | 🐛 | 📚 |
| ----- | --- | --- | --- | --- | --- |
| Authentication | ⏳ | ⏳ | ⏳ | ⏳ | ⏳ |
| Payment | ⏳ | ⏳ | ⏳ | ⏳ | ⏳ |
| API Routes | ⏳ | ⏳ | ⏳ | ⏳ | ⏳ |
| Utilities | ⏳ | ⏳ | ⏳ | ⏳ | ⏳ |

Each agent focuses on its group's files from its specialized perspective...
```

### Agent Mapping

| Review Type | Agent File |
| ----------- | ---------- |
| Security | `.claude/agents/review-security.md` |
| Architecture | `.claude/agents/review-architecture.md` |
| Performance | `.claude/agents/review-performance.md` |
| Logic | `.claude/agents/review-logic.md` |
| Docs Gap | `.claude/agents/review-docs-gap.md` |

### How to Spawn Each Agent

For EACH (group, review-type) combination:

1. **Read the agent template** from `.claude/agents/review-{type}.md`
2. **Spawn a Task** with template + group-specific instructions
3. **Only include files from that group** - not all files
4. **Let the agent run the git command** - don't paste diffs

**Task prompt structure (per group):**

```
[Paste content from .claude/agents/review-{type}.md]

---

## YOUR TASK

**Group:** {group name} (e.g., "Authentication")

**Git command to see changes:** `git diff HEAD~1 -- {files in this group}`

**Files in this group:**
- src/api/auth.ts
- src/components/login.tsx
- src/services/session.ts

**Instructions:**
1. Run the git command to see changes for THIS GROUP ONLY
2. Analyze from your specialized perspective
3. Focus on cross-file issues WITHIN this group
4. For EACH finding, provide:
   - Deep explanation (3-5 sentences minimum)
   - Code snippet showing the issue
   - Multiple fix options with code examples
   - Trade-offs for each option
5. Include ASCII diagrams where helpful
6. Note positive patterns observed
7. NO risk levels - just the findings
8. Prefix each finding with the group name: "[Authentication] SQL injection in..."
```

### Example: 4 Groups × 5 Types = 20 Parallel Tasks

```
// CRITICAL: ALL 20 TASKS BELOW MUST BE IN ONE MESSAGE
// This ensures parallel execution - never split across multiple messages

// ========== GROUP 1: Authentication ==========
Task(`[content of review-security.md]
---
Group: Authentication
Git command: git diff HEAD~1 -- src/api/auth.ts src/components/login.tsx src/services/session.ts
Files in this group: auth.ts, login.tsx, session.ts`)

Task(`[content of review-architecture.md]
---
Group: Authentication
Git command: git diff HEAD~1 -- src/api/auth.ts src/components/login.tsx src/services/session.ts
Files in this group: auth.ts, login.tsx, session.ts`)

Task(`[content of review-performance.md]
---
Group: Authentication
Git command: git diff HEAD~1 -- src/api/auth.ts src/components/login.tsx src/services/session.ts
Files in this group: auth.ts, login.tsx, session.ts`)

Task(`[content of review-logic.md]
---
Group: Authentication
Git command: git diff HEAD~1 -- src/api/auth.ts src/components/login.tsx src/services/session.ts
Files in this group: auth.ts, login.tsx, session.ts`)

Task(`[content of review-docs-gap.md]
---
Group: Authentication
Git command: git diff HEAD~1 -- src/api/auth.ts src/components/login.tsx src/services/session.ts
Files in this group: auth.ts, login.tsx, session.ts
Docs directory: docs/`)

// ========== GROUP 2: Payment ==========
Task(`[content of review-security.md]
---
Group: Payment
Git command: git diff HEAD~1 -- src/services/payment.ts src/services/stripe.ts src/components/checkout.tsx
Files in this group: payment.ts, stripe.ts, checkout.tsx`)

Task(`[content of review-architecture.md]
---
Group: Payment
...`)

// ... continue for all 5 review types for Payment group

// ========== GROUP 3: API Routes ==========
// ... 5 tasks for API Routes group

// ========== GROUP 4: Utilities ==========
// ... 5 tasks for Utilities group
```

### Why Grouped Parallel Agents Work Better

- **Catches cross-file issues** - Each agent sees related files together (auth.ts + login.tsx + session.ts)
- **Scales with complexity** - More file groups = more focused agents
- **Faster than sequential** - All agents run simultaneously
- **Better context** - Agents aren't overwhelmed with unrelated files
- **Maintains depth** - Each agent focuses on fewer files, deeper analysis

### Fallback: Original 5-Agent Approach

If user chose "Review all together" in Step 3.5, use the original approach:

```
// Single group = 5 agents (all files to each agent)
Task(Security agent for ALL files)
Task(Architecture agent for ALL files)
Task(Performance agent for ALL files)
Task(Logic agent for ALL files)
Task(Docs Gap agent for ALL files)
```

**WRONG (sequential):**

```
Task(security agent for group 1)
// wait for result
Task(security agent for group 2)
// wait for result
...
```

**CORRECT (parallel):**

```
// Single message with ALL Task calls for ALL groups:
Task(security agent for group 1)
Task(architecture agent for group 1)
Task(performance agent for group 1)
Task(logic agent for group 1)
Task(docs gap agent for group 1)
Task(security agent for group 2)
Task(architecture agent for group 2)
// ... all in ONE message
```

---

## STEP 5: Collect & Create Report File

After ALL agents complete:

1. **Collect all findings** from each agent (grouped by file group)
2. **Create the report file** at `docs/review/{name}.md`
3. **Organize by review type**, with findings tagged by group
4. **Add action items** extracted from findings
5. **Include docs gap recommendations**

### Create the docs/review directory if needed

```bash
mkdir -p docs/review
```

### Report File Structure (Grouped)

Write this to `docs/review/{name}.md`:

```markdown
# Code Review Report

**Date:** {current date}
**Reviewed:** {what was reviewed - commit, branch, etc.}
**Files:** {count} files (+{additions}/-{deletions} lines)
**Review Scale:** {N} groups × 5 types = {N×5} agents

---

## Summary

### By Review Type

| Perspective | Findings |
|-------------|----------|
| 🔒 Security | {count} findings |
| 🏗️ Architecture | {count} findings |
| ⚡ Performance | {count} findings |
| 🐛 Logic | {count} findings |
| 📚 Documentation | {count} gaps |

### By File Group

| Group | 🔒 | 🏗️ | ⚡ | 🐛 | 📚 |
|-------|-----|-----|-----|-----|-----|
| Authentication | 2 | 1 | 0 | 3 | 1 |
| Payment | 1 | 0 | 2 | 1 | 0 |
| API Routes | 0 | 1 | 1 | 0 | 1 |
| Utilities | 0 | 0 | 0 | 0 | 0 |

---

## 🔒 Security Findings

### [Authentication] SQL Injection Risk
**Files:** `auth.ts`, `session.ts`
[Deep explanation, code snippets, fix options...]

### [Payment] Missing Input Validation
**Files:** `stripe.ts`
[Deep explanation, code snippets, fix options...]

---

## 🏗️ Architecture Findings

### [Authentication] Tight Coupling
**Files:** `auth.ts`, `login.tsx`
[Deep explanation...]

### [API Routes] Inconsistent Error Handling
**Files:** `users.ts`, `orders.ts`
[Deep explanation...]

---

## ⚡ Performance Findings

### [Payment] N+1 Query Pattern
**Files:** `payment.ts`, `checkout.tsx`
[Deep explanation...]

---

## 🐛 Logic Findings

### [Authentication] Race Condition in Session Refresh
**Files:** `session.ts`, `auth.ts`
[Deep explanation - this is a cross-file issue caught within the group...]

---

## 📚 Documentation Gaps

### [Authentication] Missing API Docs
- New login endpoint not documented
- Session management guide outdated

### [Payment] Environment Variables
- `STRIPE_SECRET_KEY` not in README

---

## Action Items

Organized by file group, then by file:

### Authentication Group

#### `src/api/auth.ts`
- [ ] [Security] Fix SQL injection in login query
- [ ] [Logic] Add mutex for session refresh

#### `src/components/login.tsx`
- [ ] [Architecture] Extract auth logic to service

### Payment Group

#### `src/services/payment.ts`
- [ ] [Performance] Batch database queries

[Continue for each group and file...]

---

## Positive Observations

### Authentication Group
- Good use of bcrypt for password hashing
- Proper session expiration handling

### Payment Group
- Clean separation of Stripe integration
- Good error messages for failed payments

### API Routes Group
- Consistent RESTful naming conventions

---

*Generated by deep-review on {timestamp}*
*Review scale: {N} groups × 5 types = {N×5} parallel agents*
```

---

## STEP 6: Present to User

After creating the file:

```
✅ **Review Complete**

**Report saved to:** `docs/review/2024-01-15-user-auth.md`

---

## Summary

### By Review Type
| Perspective | Findings |
|-------------|----------|
| 🔒 Security | 3 findings |
| 🏗️ Architecture | 2 findings |
| ⚡ Performance | 1 finding |
| 🐛 Logic | 4 findings |
| 📚 Documentation | 2 gaps |

### By File Group
| Group | 🔒 | 🏗️ | ⚡ | 🐛 | 📚 |
|-------|-----|-----|-----|-----|-----|
| Authentication | 2 | 1 | 0 | 3 | 1 |
| Payment | 1 | 0 | 1 | 1 | 0 |
| API Routes | 0 | 1 | 0 | 0 | 1 |

**Execution:** ✅ 15 agents ran in parallel (3 groups × 5 types, single message)

---

## Key Highlights

**[Authentication] Security:**
- SQL injection risk in login query
- Missing rate limiting on session refresh

**[Authentication] Logic:**
- Race condition in session refresh
- Off-by-one error in token expiry

**[Payment] Performance:**
- N+1 query in checkout flow

**Docs:**
- New `POST /auth/refresh` needs documentation
- `STRIPE_SECRET_KEY` env var not in README

---

## EDGE CASES

### Agent fails or times out (Grouped View)

Display the status showing which group/type combinations failed:

```

⚠️ **Agent Issues**

Some agents didn't complete properly.

| Group | 🔒 | 🏗️ | ⚡ | 🐛 | 📚 |
| ----- | --- | --- | --- | --- | --- |
| Authentication | ✅ | ✅ | ❌ | ✅ | ✅ |
| Payment | ✅ | ✅ | ✅ | ✅ | ✅ |
| API Routes | ✅ | ❌ | ✅ | ✅ | ✅ |

**Failed:** 2 of 15 agents (Performance/Auth, Architecture/API)

```

Then **use the `AskUserQuestion` tool**:

- Question: "How would you like to handle the 2 failed agents?"
- Options:
  1. Retry failed - Retry only the 2 failed agents
  2. Continue without them - Proceed with 13/15 results
  3. Retry entire group - Re-run all agents for affected groups
  4. Show partial results - See what we have so far

### Single group failure

If all 5 agents for a single group fail:

```

⚠️ **Group Failure**

All agents for the "Authentication" group failed.

| Group | 🔒 | 🏗️ | ⚡ | 🐛 | 📚 |
| ----- | --- | --- | --- | --- | --- |
| Authentication | ❌ | ❌ | ❌ | ❌ | ❌ |
| Payment | ✅ | ✅ | ✅ | ✅ | ✅ |
| API Routes | ✅ | ✅ | ✅ | ✅ | ✅ |

```

Then **use the `AskUserQuestion` tool**:

- Question: "The Authentication group completely failed. What should I do?"
- Options:
  1. Retry group - Retry all 5 agents for Authentication
  2. Skip group - Continue without reviewing Authentication files
  3. Review manually - I'll review Authentication files without agents

### Very large diff (>1000 lines)

Display the warning:

```

⚠️ **Large Change Set**

This diff is ~2,500 lines across 35 files.

With file grouping, this would create ~8 groups × 5 types = **40 parallel agents**.

```

Then **use the `AskUserQuestion` tool**:

- Question: "This is a large change set. How should I proceed?"
- Options:
  1. Full review - Proceed with all 40 agents (comprehensive)
  2. Reduce groups - Merge into 3-4 larger groups (15-20 agents)
  3. Specific files - I'll ask which files to focus on
  4. Original approach - Use 5 agents for all files together

### Too many groups (>10)

If file grouping would create more than 10 groups (50+ agents):

```

⚠️ **Many File Groups**

The changes span many directories, creating 12 potential groups.
12 groups × 5 types = **60 agents** (may be slow)

```

Then **use the `AskUserQuestion` tool**:

- Question: "There are many file groups. How should I consolidate?"
- Options:
  1. Proceed anyway - Launch all 60 agents
  2. Merge small groups - Combine groups with < 3 files
  3. Top-level only - Group by top-level directory only (fewer groups)
  4. Original approach - Use 5 agents for all files together

### No findings

```

✅ **Review Complete**

**Great news!** No significant issues found across all groups.

**Report saved to:** `docs/review/2024-01-15-user-auth.md`

**Review scale:** 4 groups × 5 types = 20 agents

| Group | 🔒 | 🏗️ | ⚡ | 🐛 | 📚 |
| ----- | --- | --- | --- | --- | --- |
| Authentication | 0 | 0 | 0 | 0 | 0 |
| Payment | 0 | 0 | 0 | 0 | 0 |
| API Routes | 0 | 0 | 0 | 0 | 0 |
| Utilities | 0 | 0 | 0 | 0 | 1 |

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
3. **Group files intelligently** - related files together catch cross-file issues
4. **Confirm groups with user** - let them adjust before spawning agents
5. **Scale agents with groups** - N groups × 5 types = N×5 parallel agents
6. **One message, ALL Tasks** - spawn all agents in a SINGLE message (parallel execution)
7. **Auto-generate filename** - use `{YYYY-MM-DD}-{branch-name}.md` format
8. **Let agents run git commands** - don't paste huge diffs
9. **Tag findings by group** - prefix with [GroupName] for easy filtering
10. **Save to file** - always save to `docs/review/`
11. **No risk levels in output** - user decides priority
12. **Deep details for each finding** - multiple fix options
13. **Handle failures gracefully** - offer retry/skip at group or agent level
14. **End with clear next steps** - what should user do now?
