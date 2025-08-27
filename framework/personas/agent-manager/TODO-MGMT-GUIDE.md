# Agent-Manager TODO Management

**Persona:** 🗂️ Agent-Manager  
**Directory:** `.personas/framework/personas/agent-manager/todos/`  
**Scope:** Framework coordination and meta-tasks  
**Updated:** August 27, 2025

## Overview

The Agent-Manager manages framework-level coordination while project-specific tasks are handled in `.personas/project/todos/[persona]/`. This creates a clear separation between framework coordination and project implementation.

## Two-Tier TODO System

### Framework-Level Tasks (This Directory)

```text
.personas/framework/personas/agent-manager/todos/
├── current/         # Active framework coordination
├── backlog/         # Future coordination needs  
├── completed/       # Archived coordination tasks
└── coordination/    # Cross-persona meta-tasks
```

### Project-Level Tasks (Separate Management)

```text
.personas/project/todos/[persona]/
├── current/     # Active project implementation tasks
├── backlog/     # Future project tasks
└── completed/   # Archived project tasks
```

## Task Assignment Rules

### Framework Tasks (This Directory)

**Agent-Manager Responsibilities:**

1. **Framework coordination** tasks are created in `./current/`
2. **Cross-persona coordination** requiring framework oversight goes in `./coordination/`
3. **Process improvements** and framework evolution tasks
4. **Documentation lifecycle** management for .personas/framework directory

### Project Tasks (.personas/project/todos/)

**Project Implementation:**

1. **Engineer tasks** go to `.personas/project/todos/engineer/current/`
2. **Planner tasks** go to `.personas/project/todos/planner/current/`  
3. **Reviewer tasks** go to `.personas/project/todos/reviewer/current/`
4. **Project coordination** that doesn't require framework changes

## Coordination Protocols

### Framework vs Project Decision Matrix

| Task Type | Location | Reasoning |
|-----------|----------|-----------|
| Code implementation | `.personas/project/todos/engineer/` | Project-specific work |
| Architecture planning | `.personas/project/todos/planner/` | Project-specific work |
| Code review | `.personas/project/todos/reviewer/` | Project-specific work |
| Persona workflow changes | `.personas/framework/personas/[persona]/todos/` | Framework evolution |
| Cross-project coordination | `./coordination/` | Framework-level concern |
| Process improvements | `./coordination/` | Framework enhancement |
| Documentation standards | `./coordination/` | Framework consistency |

### Escalation and Coordination

**Project → Framework Escalation:**

- When project tasks reveal framework limitations
- When coordination patterns need standardization
- When process improvements benefit multiple projects

**Framework → Project Delegation:**

- When framework coordination requires project-specific implementation
- When coordination decisions need project context
- When framework changes require project validation

## Meta-Task Templates

### Framework Coordination Template

```markdown
# Framework Coordination: [Title]

**Type:** Process/Documentation/Cross-Persona/Standards
**Scope:** Framework/Single Project/Multi-Project
**Priority:** High/Medium/Low
**Affected Personas:** [List personas]

## Coordination Objective

[Clear description of coordination need]

## Framework Impact

[How this affects the framework itself]

## Project Impact

[How this affects current/future projects]

## Coordination Plan

- [ ] [Coordination step 1]
- [ ] [Coordination step 2]
- [ ] [Validation and rollout]

## Success Criteria

[Measurable outcomes for coordination success]
```

### Process Improvement Template

```markdown
# Process Improvement: [Title]

**Type:** Workflow/Documentation/Standards/Tools
**Scope:** [Affected processes and personas]
**Priority:** High/Medium/Low

## Current State

[Description of current process limitations]

## Proposed Improvement

[Detailed improvement proposal]

## Benefits

- [Benefit 1]
- [Benefit 2]

## Implementation Plan

- [ ] [Implementation step 1]
- [ ] [Implementation step 2]
- [ ] [Validation and adoption]

## Rollout Strategy

[How to introduce improvements across personas]
```

## Standard Task Template

```markdown
# [Task Title]

**Created:** [Date] 
**Priority:** HIGH/MEDIUM/LOW
**Assigned:** Agent-Manager
**Type:** MAINTENANCE/COORDINATION/ARCHIVAL

## Objective
[Clear description of organizational/coordination need]

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Documentation updated
- [ ] Other personas notified if needed

## Coordination Notes
[Any cross-persona implications or notifications needed]
```

## Coordination Responsibilities

### Daily Operations

**TODO Validation:**

- Monitor all persona TODO directories for completion status
- Archive completed tasks with appropriate timestamps
- Validate task quality and completeness before archival
- Update cross-references and dependencies

**Persona Coordination:**

- Route incoming tasks to appropriate persona TODO lists
- Facilitate handoffs between personas when tasks are complete
- Monitor for blocked tasks requiring coordination
- Escalate complex dependency issues

### Meta-Task Management

**Intake and Analysis:**

- Receive complex initiatives requiring multiple personas
- Analyze scope and identify persona-specific components
- Create coordination plan with dependencies and sequencing
- Assign sub-tasks to appropriate persona TODO lists

**Progress Tracking:**

- Monitor progress across all involved personas
- Facilitate communication and dependency resolution
- Update meta-task status based on sub-task completion
- Coordinate final integration and validation

**Completion and Archival:**

- Validate all sub-tasks are complete and integrated
- Archive meta-task with full coordination history
- Document lessons learned for future coordination
- Update coordination processes based on experience

## Integration with Other Personas

**Task Distribution:**

- Receive meta-tasks and break them down appropriately
- Create specific, actionable tasks in other persona TODO lists
- Provide clear context and acceptance criteria
- Monitor and facilitate progress

**Status Monitoring:**

- Track completion across all persona TODO directories
- Identify and resolve blocked or stalled tasks
- Coordinate handoffs when tasks move between personas
- Maintain visibility into overall system health

**Quality Assurance:**

- Validate task completion quality before archival
- Ensure proper documentation and knowledge preservation
- Maintain historical context for future reference
- Update processes based on coordination experience
