# GitHub Copilot Workflow Examples

This directory contains practical examples for integrating the Personas Framework with GitHub Copilot.

## Example Workflows

### Single Persona Sessions

#### Engineer Development Session

```markdown
# GitHub Copilot Chat Session: Feature Implementation

## Step 1: Persona Initialization
@workspace /attach .personas/framework/personas/engineer/INSTRUCTIONS.md

You are now the Engineer persona from the Personas Framework.
Please acknowledge your role and review your responsibilities.

## Step 2: Load Current Task
@workspace /attach .personas/project/todos/engineer/current/user-authentication.md

Please review this task and begin implementation following
your persona protocols.

## Step 3: Project Context
@workspace /attach .personas/project/contexts/engineer/IMPLEMENTATION-PATTERNS.md

Use these project-specific patterns for your implementation.

## Step 4: Implementation
Please implement the user authentication feature:
- Write tests first (TDD approach)
- Implement minimal working solution
- Add error handling
- Optimize performance
- Update documentation
```

#### Planner Architecture Session

```markdown
# GitHub Copilot Chat Session: System Design

## Step 1: Persona Initialization
@workspace /attach .personas/framework/personas/planner/INSTRUCTIONS.md

You are the Planner persona. Your focus is on architecture
and roadmapping.

## Step 2: Requirements Analysis
Please analyze the requirement: "Add real-time notifications to the web app"

Consider:
- System architecture implications
- Technology choices
- Integration points
- Performance requirements

## Step 3: Architecture Design
Create a detailed architecture plan including:
- Component design
- Data flow patterns
- API specifications
- Database schema changes

## Step 4: Task Breakdown
Break down the implementation into specific engineering tasks
with clear acceptance criteria.
```

### Multi-Persona Sessions

#### Complete Feature Development Cycle

```markdown
# Multi-Persona Development Session

## Phase 1: Planning
@workspace /attach .personas/framework/personas/planner/INSTRUCTIONS.md

You are the Planner persona. Please:
1. Analyze the feature requirement: "User profile management"
2. Design the system architecture
3. Create implementation tasks
4. Define acceptance criteria

## Phase 2: Implementation  
@workspace /attach .personas/framework/personas/engineer/INSTRUCTIONS.md

You are now the Engineer persona. Please:
1. Review the planning work from Phase 1
2. Implement the user profile management feature
3. Follow TDD practices
4. Create comprehensive documentation

## Phase 3: Quality Review
@workspace /attach .personas/framework/personas/reviewer/INSTRUCTIONS.md

You are now the Reviewer persona. Please:
1. Review the implementation from Phase 2
2. Assess code quality and security
3. Validate test coverage
4. Provide improvement recommendations
```

## Workflow Patterns

### Context Loading Strategies

#### Progressive Context Loading

```markdown
# Efficient Context Loading for Large Projects

## Phase 1: Core Identity (Small Context)
@workspace /attach .personas/framework/personas/engineer/INSTRUCTIONS.md

You are the Engineer persona. Key focus: implementation and debugging.

## Phase 2: Project Context (Medium Context)
@workspace /attach .personas/project/TECH-SPEC.md

Project uses React + TypeScript + Node.js with PostgreSQL.

## Phase 3: Current Work (Full Context)
@workspace /attach .personas/project/todos/engineer/current/

Please review current engineering tasks and prioritize work.

## Phase 4: Specific Context (On-Demand)
[Load specific files as needed for current task]
```

#### Context Refresh Pattern

```markdown
# Mid-Session Context Refresh

## Situation Check
Are you still operating as the Engineer persona?
Current task: Implementing user authentication API
Any context you need refreshed?

## Context Revalidation
Please confirm your understanding of:
- Your persona role and boundaries
- Current task objectives
- Project technical constraints

## Continue Work
Proceed with implementation using refreshed context.
```

### Error Recovery Patterns

#### Persona Re-assumption

```markdown
# Recovery Protocol for Lost Context

## Situation: Agent lost persona context or mixed roles

## Step 1: Identity Recovery
@workspace /attach .personas/framework/personas/engineer/INSTRUCTIONS.md

You are the Engineer persona from the Personas Framework.
Please re-read your instructions and acknowledge your role.

## Step 2: Context Recovery
Current task: [Restate the specific task]
Previous progress: [Summarize what was accomplished]
Next steps: [What needs to happen next]

## Step 3: Validation
Please confirm:
- You understand your Engineer persona role
- You remember the current task
- You can continue from where we left off
```

#### Scope Boundary Enforcement

```markdown
# Handling Scope Violations

## When Engineer tries to do architecture:
"That's a Planner persona responsibility. Let me create a 
handoff task for architectural decisions."

## When Planner tries to implement:
"That's an Engineer persona responsibility. I'll create 
specific implementation tasks."

## Corrective Action:
Create appropriate task files in target persona directories.
```

## Best Practices

### File Attachment Optimization

- **Start Small:** Load core persona identity first
- **Add Gradually:** Layer in project context incrementally  
- **Refresh Regularly:** Re-confirm persona understanding
- **Monitor Size:** Watch for context window limits

### Session Management

- **Clear Initialization:** Always start with persona assumption
- **Regular Checkpoints:** Confirm persona understanding periodically
- **Clean Handoffs:** Properly transition between personas
- **Document Progress:** Save important decisions and code

### Performance Tips

- **Use Condensed Instructions:** For platforms with strict limits
- **Prioritize Context:** Load most relevant context first
- **Batch Related Work:** Group similar tasks in single sessions
- **Cache Common Patterns:** Reuse successful prompt patterns

## Troubleshooting

### Common Issues and Solutions

#### Context Window Exceeded

**Problem:** GitHub Copilot truncates context
**Solution:** Use progressive loading pattern

```markdown
# Condensed approach for limited context
@workspace /attach .personas/framework/personas/engineer/INSTRUCTIONS-CONDENSED.md

Engineer persona: Implementation focus only.
Current task: [Brief task description]
```

#### Persona Confusion

**Problem:** Agent mixes persona responsibilities
**Solution:** Explicit boundary reinforcement

```markdown
# Clear boundary reminder
Remember: As Engineer persona, you only:
- Implement code
- Write tests  
- Debug issues
- Optimize performance

Architecture decisions → Planner persona
Code reviews → Reviewer persona
```

#### Lost Session State

**Problem:** Agent forgets previous work
**Solution:** Session state recovery

```markdown
# State recovery pattern
Previous session summary:
- Persona: Engineer
- Task: User authentication API
- Progress: Tests written, basic implementation complete
- Next: Add error handling and security

Please continue from this point.
```
