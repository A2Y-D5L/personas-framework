# Project TODO Management Template

**Template Version:** 1.0  
**TODO Structure:**### Project-Specific Guidelines

### [Your Project Name] Context

Customize this section for your specific project domain and technology stack:

- **[Technology/Domain]:** Tasks involving [your main technology or domain focus]
- **[Language] Performance:** [Language-specific performance considerations]
- **[Framework] Design:** [Framework-specific design patterns]
- **Testing:** [Your testing approach and frameworks]
- **Documentation:** [Your documentation standards and tools]ramework and project separation  
**Updated:** August 27, 2025

## Overview

This template provides a two-tier TODO management system that separates framework-level coordination from project-specific implementation tasks. Customize this for your specific project needs.

## Directory Structure

```text
.personas/project/todos/
├── engineer/        # Implementation and technical tasks
│   ├── current/     # Active implementation tasks
│   ├── backlog/     # Future implementation needs
│   └── completed/   # Archived completed tasks
├── planner/         # Architecture and planning tasks
│   ├── current/     # Active planning tasks
│   ├── backlog/     # Future planning needs
│   └── completed/   # Archived planning tasks
└── reviewer/        # Quality and analysis tasks
    ├── current/     # Active review tasks
    ├── backlog/     # Pending review requests
    └── completed/   # Archived review tasks
```

## Two-Tier System

### Project-Specific Tasks (`.personas/project/todos/`)

These directories contain tasks specific to the go-stream project implementation:

- **Engineer Tasks:** Code implementation, debugging, testing, optimization
- **Planner Tasks:** Architecture design, feature planning, roadmapping
- **Reviewer Tasks:** Code reviews, quality analysis, security assessment

### Framework-Level Tasks (`.personas/framework/personas/[persona]/todos/`)

Framework coordination and meta-tasks are managed separately in the .personas/framework directory:

- **Cross-persona coordination**
- **Framework documentation updates**
- **Process improvements**
- **Persona workflow enhancements**

## Task Management Workflow

### Creating Project Tasks

1. **Identify the appropriate persona** based on task type
2. **Create task file** in `.personas/project/todos/[persona]/current/`
3. **Use standardized naming:** `YYYY-MM-DD-task-description.md`
4. **Include project context** and acceptance criteria

### Task Assignment Rules

**Engineer Tasks** (`.personas/project/todos/engineer/`):
- Feature implementation and bug fixes
- Performance optimization
- Testing and validation
- Code refactoring and maintenance

**Planner Tasks** (`.personas/project/todos/planner/`):
- Architecture design and modification
- Feature roadmapping and breakdown
- Risk assessment and mitigation
- Integration planning

**Reviewer Tasks** (`.personas/project/todos/reviewer/`):
- Code quality assessment
- Security analysis
- Performance review
- Documentation review

### Task Lifecycle

1. **Creation:** Task created in appropriate `/current/` directory
2. **Active Work:** Regular progress updates in task file
3. **Completion:** Move to `/completed/` with completion notes
4. **Archival:** Periodic cleanup and organization

## Project-Specific Guidelines

### Go Stream Context

This project focuses on NATS messaging and streaming in Go. Task creation should consider:

- **NATS Integration:** Tasks involving NATS server and client interactions
- **Go Performance:** Memory efficiency and goroutine management
- **API Design:** Developer-friendly interface design
- **Testing:** Comprehensive unit and integration testing
- **Documentation:** Clear API documentation and examples

### Task Templates

#### Engineer Task Template

```markdown
# [Feature/Bug] Title

**Type:** Implementation/Bug Fix/Optimization/Testing
**Priority:** High/Medium/Low
**Estimated Effort:** [Time estimate]
**Dependencies:** [List dependencies]

## Description

[Clear description of the implementation requirement]

## Acceptance Criteria

- [ ] [Specific criterion 1]
- [ ] [Specific criterion 2]
- [ ] [Testing requirements]

## Technical Notes

[Any technical considerations, constraints, or guidance]

## Progress Updates

[Regular progress notes and status updates]
```

#### Planner Task Template

```markdown
# [Architecture/Planning] Title

**Type:** Architecture/Feature Planning/Risk Assessment
**Priority:** High/Medium/Low
**Scope:** [System boundaries]
**Timeline:** [Planning timeline]

## Objectives

[Primary planning objectives]

## Requirements

[System requirements and constraints]

## Deliverables

- [ ] [Specific deliverable 1]
- [ ] [Specific deliverable 2]

## Dependencies

[External dependencies and constraints]

## Planning Notes

[Architecture decisions, trade-offs, and reasoning]
```

#### Reviewer Task Template

```markdown
# Review: [Component/Feature]

**Type:** Code Review/Architecture Review/Security Analysis
**Scope:** [Files and components under review]
**Priority:** Critical/High/Medium/Low
**Requested By:** [Requester reference]

## Review Objectives

- [ ] [Review criterion 1]
- [ ] [Review criterion 2]

## Findings

### Positive Observations
[Good practices identified]

### Issues Identified
[Problems found with severity]

### Recommendations
[Specific improvement suggestions]

## Follow-up Actions

- [ ] [Action item 1 - assigned persona]
- [ ] [Action item 2 - assigned persona]
```

## Coordination with Framework

### Cross-Persona Tasks

When tasks require coordination between personas:

1. **Create coordination task** in `.personas/framework/personas/agent-manager/todos/coordination/`
2. **Reference project tasks** from coordination task
3. **Facilitate handoffs** through Agent-Manager persona
4. **Track dependencies** across persona boundaries

### Escalation Paths

- **Technical Issues:** Engineer → Planner for architecture guidance
- **Resource Conflicts:** Any persona → Agent-Manager for prioritization
- **Quality Issues:** Reviewer → Appropriate persona with remediation plan
- **Scope Conflicts:** Agent-Manager facilitates resolution

## Best Practices

### Task Organization

- Keep tasks focused and actionable
- Use clear, descriptive file names
- Include sufficient context for handoffs
- Regular progress updates and status tracking
- Timely archival of completed tasks

### Project Context

- Reference `.personas/project/TECH-SPEC.md` for requirements
- Follow `.personas/project/STANDARDS.md` for conventions
- Consider `.personas/project/DEPENDENCIES.md` for constraints
- Use persona-specific context from `.personas/project/contexts/[persona]/`

### Quality Gates

- All tasks include acceptance criteria
- Regular reviews before marking complete
- Proper handoff documentation for dependent tasks
- Clear success metrics and validation approaches
