---
name: deep-review
description: This skill should be used when the user asks to "deep-review", "review this code", "analyze before implementing", "pre-implementation review", "code health check", "review this component", "review this feature", "understand this codebase", or mentions wanting to review existing code before starting new feature work.
allowed-tools: Read, Glob, Grep, Task, WebSearch
version: 1.0.0
---

# Pre-Implementation Deep Review

You are preparing to help the user implement or fix a feature. Before planning, you need to deeply understand the relevant parts of the codebase.

**PURPOSE:** Spawn parallel exploration agents to understand existing code. The output is YOUR enhanced understanding - NOT a report file.

**KEY PRINCIPLE:** You decide what to explore based on the feature. No fixed categories. Dynamic exploration.

---

## WORKFLOW

### STEP 1: Understand the Feature/Task

First, understand what the user wants to implement or fix.

If not clear from context, ask:

- "What feature are you planning to implement?"
- "What area of the codebase should I understand first?"

### STEP 2: Identify What Needs Exploration

Based on the feature, decide what areas of the codebase are relevant. Think about:

- **Related components** - What existing code will this feature interact with?
- **Similar implementations** - Are there similar features already built?
- **Data models** - What database schemas, types, or models are involved?
- **Configuration** - What config files, environment variables matter?
- **Dependencies** - What utilities, services, or external APIs are used?
- **Patterns** - What architectural patterns does this codebase follow?
- **Tests** - How are similar features tested?

### STEP 3: Spawn Parallel Exploration Agents

**CRITICAL: Spawn ALL agents in a SINGLE message for parallel execution.**

Decide how many agents you need (typically 3-6) based on the scope. Each agent should explore a specific area.

**Example agent assignments:**

For "Add OAuth login":

```
Agent 1: Explore current authentication implementation
Agent 2: Explore user model and session handling
Agent 3: Search for existing OAuth or social login code
Agent 4: Research OAuth best practices for {framework}
```

For "Add caching to API":

```
Agent 1: Explore current API endpoint structure
Agent 2: Explore existing caching patterns in codebase
Agent 3: Explore database query patterns
Agent 4: Research caching strategies for {framework}
```

For "Fix payment bug":

```
Agent 1: Explore payment processing code
Agent 2: Explore related error handling
Agent 3: Explore transaction logging
Agent 4: Search for similar bug fixes in git history
```

### Agent Prompt Template

For each agent, use this structure:

```
You are exploring a codebase to help understand it before implementing a feature.

**Feature being planned:** {feature description}

**Your exploration focus:** {specific area to explore}

**Instructions:**
1. Use Glob to find relevant files
2. Use Read to examine key files
3. Use Grep to search for patterns
4. Summarize what you learned

**Return:**
- Key files found and their purpose
- How this area currently works
- Important patterns or conventions
- Anything relevant to the planned feature
- Potential concerns or considerations
```

For web research agents:

```
You are researching best practices for implementing a feature.

**Feature being planned:** {feature description}
**Technology stack:** {detected or known stack}

**Instructions:**
1. Use WebSearch to find best practices
2. Look for official documentation
3. Find common patterns and pitfalls

**Return:**
- Recommended approaches
- Common pitfalls to avoid
- Relevant libraries or tools
- Security considerations
```

### STEP 4: Synthesize Understanding

After all agents return, you now have comprehensive context about:

- How the relevant parts of the codebase work
- What patterns and conventions are used
- What similar implementations exist
- Best practices for the feature

**You are now ready to plan the implementation.**

Tell the user:

```
I've explored the codebase and understand:
- [Key insight 1]
- [Key insight 2]
- [Key insight 3]

I'm ready to plan the implementation. Should I proceed?
```

---

## EXAMPLES

### Example 1: User wants to add a new API endpoint

**User:** "I want to add a user preferences API"

**You spawn:**

1. Agent: Explore existing API endpoints (structure, patterns, middleware)
2. Agent: Explore user model and related schemas
3. Agent: Search for preference or settings patterns in codebase
4. Agent: Research REST API best practices for user preferences

### Example 2: User wants to fix a bug

**User:** "The search feature is slow, I need to optimize it"

**You spawn:**

1. Agent: Explore search implementation code
2. Agent: Explore database queries related to search
3. Agent: Look for existing caching or optimization patterns
4. Agent: Research search optimization techniques for {database}

### Example 3: User wants to add authentication

**User:** "Add JWT authentication to the app"

**You spawn:**

1. Agent: Explore current auth/session handling (if any)
2. Agent: Explore middleware and route protection patterns
3. Agent: Explore user model and credentials storage
4. Agent: Research JWT best practices and security considerations

---

## RULES

1. **No report file** - Your output is understanding, not documentation
2. **Dynamic exploration** - You decide what to explore based on the feature
3. **Parallel agents** - Always spawn agents in ONE message
4. **Summarize insights** - After agents return, tell the user what you learned
5. **Ready to plan** - The goal is to be prepared for implementation planning
