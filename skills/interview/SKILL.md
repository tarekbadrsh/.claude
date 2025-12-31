---
name: interview
description: >
  Transform sparse plans into bulletproof specifications through systematic questioning.
  Use when user asks to "interview me about this plan", "flesh out this spec", 
  "help me think through this", "what am I missing in this plan", "ask me questions 
  about this feature", "review my plan for gaps", or wants to transform a rough idea 
  into a detailed specification. Triggers on: /interview [file], or natural language 
  requests to probe a plan/spec for completeness.
---

# Interview Skill

Systematically question users to surface hidden assumptions, edge cases, and gaps in their plans.

## Process

```
┌──────────┐      ┌──────────────┐      ┌──────────────────────────┐
│  Input   │      │   Interview  │      │     Output               │
│  Plan    │ ───▶ │   Session    │ ───▶ │     Enriched Spec        │
│  (sparse)│      │  (20-50 Qs)  │      │     (bulletproof)        │
└──────────┘      └──────────────┘      └──────────────────────────┘
```

## Step 1: Load and Analyze

Read the plan file provided by user. Analyze for:

1. **Explicitly stated** — features, requirements, tech choices
2. **Implied but unstated** — assumptions, happy-path thinking  
3. **Completely missing** — error handling, edge cases, migrations

Display analysis:

```
📋 **Plan Analysis**

**File:** `[path]`

**What I See:**
- [Feature 1]
- [Feature 2]

**Assumptions Detected:**
- [Assumption 1]
- [Assumption 2]

**Gaps to Explore:**
- [ ] Error handling
- [ ] Edge cases
- [ ] State management
- [ ] Security model
```

## Step 2: Interview

Ask questions ONE AT A TIME using `AskUserQuestion` tool.

### Question Rules

1. **Never obvious** — skip what's clearly stated
2. **Dig into implications** — "You mentioned X. What happens when..."
3. **Challenge assumptions** — "You're assuming X. What if Y?"
4. **Explore failures** — "When this fails, what does the user see?"
5. **Surface tradeoffs** — "Fast writes vs consistency — which matters more?"
6. **Prioritize explicitly** — "Is this a must-have, should-have, or nice-to-have?"

### Question Bank

Select questions from domain-specific files in `references/`:

| File | Use When |
|------|----------|
| `questions-core.md` | **Always start here** — universal questions |
| `questions-api-design.md` | REST/GraphQL endpoints, API contracts |
| `questions-ui-feature.md` | Frontend components, user interactions |
| `questions-authentication.md` | Login, sessions, permissions, SSO |
| `questions-data-migration.md` | Schema changes, ETL, data transforms |
| `questions-integration.md` | Third-party APIs, webhooks, external services |
| `questions-real-time.md` | WebSockets, live updates, collaboration |
| `questions-file-handling.md` | Uploads, storage, media processing |
| `questions-notifications.md` | Email, push, in-app notifications |
| `questions-payments.md` | Billing, subscriptions, checkout |
| `questions-search.md` | Search, filtering, indexing |
| `questions-background-jobs.md` | Async processing, queues, scheduled tasks |
| `questions-mobile-app.md` | iOS/Android, React Native, Flutter |
| `questions-reporting.md` | Dashboards, analytics, exports |
| `questions-multi-tenancy.md` | SaaS, tenant isolation, plans |
| `questions-caching-performance.md` | Optimization, CDN, scaling |
| `questions-security-compliance.md` | Data protection, GDPR, SOC2 |
| `questions-devops-infrastructure.md` | CI/CD, deployment, monitoring |

**Process:** Read `questions-core.md` first, then 1-3 domain files based on plan type.

### Question Format

```
Question: "[Non-obvious question]"

Options:
1. [Option A]
2. [Option B]
3. [Option C]
4. Other — I'll explain
```

### Adaptive Flow

- Complex answers → dig deeper with follow-ups
- Simple areas → move on quickly
- Target 20-50 questions based on plan complexity
- Track "I don't know yet" as open questions

## Step 3: Write Enriched Spec

Update the original plan file with gathered information.

### Spec Structure

```markdown
# [Feature/Project Name]

> Enriched via /interview on [date]

## Overview
[Enhanced from interview]

## Requirements

### Functional
- [Requirement 1]

### Non-Functional
- Performance: [from interview]
- Security: [from interview]

## Priority Matrix (MoSCoW)

| Requirement | Priority | Rationale |
|-------------|----------|-----------|
| [Req 1]     | Must     | [Why critical] |
| [Req 2]     | Should   | [Why important] |
| [Req 3]     | Could    | [Why nice-to-have] |
| [Req 4]     | Won't    | [Why excluded] |

*Must = Required for MVP | Should = Important but not blocking | Could = Nice-to-have | Won't = Explicitly out of scope*

## Edge Cases

| Scenario | Behavior | Rationale |
|----------|----------|-----------|
| [Case 1] | [Action] | [Why]     |

## Error Handling

| Error | User Experience | System Behavior |
|-------|-----------------|-----------------|
| [Err] | [UX]            | [Backend]       |

## State Management
- Persistence: [answer]
- Multi-tab: [answer]
- Offline: [answer]

## Security Model
- Access control: [answer]
- Audit: [answer]

## Performance
- Scale expectations: [answer]
- Caching: [answer]

## Migration & Rollout
- Existing users: [answer]
- Rollback plan: [answer]

## Open Questions
- [ ] [Unanswered items]

## Decisions Log

| Decision | Options | Choice | Rationale |
|----------|---------|--------|-----------|
| [Topic]  | A, B, C | B      | [Why]     |
```

## Step 4: Present Results

```
✅ **Interview Complete**

**Questions asked:** [N]
**File updated:** `[path]`

## Summary

**Edge Cases Identified:** [count]
**Error Scenarios Defined:** [count]
**Key Decisions Made:** [count]

| Decision | Choice |
|----------|--------|
| [Topic]  | [Answer] |

**Open Questions:** [count]
- [ ] [Item needing follow-up]

**Next steps:**
1. Review enriched spec
2. Address open questions
3. Begin implementation
```

## Edge Cases

**Empty/missing file:** Ask user to provide plan content directly or specify correct path.

**User says "I don't know":** Track as open question, continue to next topic.

**Plan is already detailed:** Focus only on gaps, reduce question count.

**User wants to stop early:** Write partial spec with what's gathered, mark remaining areas as "Not explored."
