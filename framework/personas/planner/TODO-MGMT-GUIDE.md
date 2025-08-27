# Planner TODO Management

**Persona:** 📋 Planner  
**Directory:** `.personas/framework/personas/planner/todos/`  
**Updated:** August 27, 2025

## Directory Structure

```text
todos/
├── current/     # Active planning tasks
├── backlog/     # Future planning needs
└── completed/   # Archived completed plans
```

## Task Assignment Rules

**Planner tasks include:**

- Architecture design and system planning
- Feature roadmapping and breakdown
- Risk assessment and dependency analysis
- Performance and scalability planning
- Integration planning with external systems
- Resource estimation and timeline development
- Technical specification creation
- Migration and deployment planning

## Task Management Workflow

### 1. Current Tasks (`/current/`)

Active tasks requiring immediate attention:

- **Format:** `YYYY-MM-DD-task-description.md`
- **Content:** Planning objectives, constraints, deliverables
- **Status:** Update progress regularly
- **Handoffs:** Coordinate with Engineer for implementation, Reviewer for validation

### 2. Backlog Tasks (`/backlog/`)

Future planning needs:

- **Priority:** High/Medium/Low based on project needs
- **Dependencies:** Map to current development priorities
- **Scheduling:** Move to `/current/` when ready to begin

### 3. Completed Tasks (`/completed/`)

Archive of finished planning work:

- **Archive:** Move from `/current/` when objectives met
- **Format:** Include completion date and outcomes
- **Reference:** Maintain for future planning decisions

## Coordination with Other Personas

### 🏗️ Engineer Handoffs

**From Planner to Engineer:**

- Detailed implementation plans
- Technical specifications
- Architecture diagrams and constraints
- Performance requirements

**From Engineer to Planner:**

- Implementation feedback
- Technical constraint discoveries
- Architecture modification requests
- Resource requirement updates

### 🔍 Reviewer Handoffs

**From Planner to Reviewer:**

- Architecture review requests
- Risk assessment validation
- Compliance analysis needs
- Quality criteria establishment

**From Reviewer to Planner:**

- Architecture feedback
- Risk mitigation recommendations
- Specification clarifications
- Quality improvement suggestions

### 🗂️ Agent-Manager Coordination

**Meta-tasks in `agent-manager/todos/coordination/`:**

- Cross-persona planning coordination
- Resource allocation decisions
- Timeline synchronization
- Priority conflict resolution

## Task Templates

### Planning Task Template

```markdown
# [Task Title]

**Type:** Architecture/Roadmap/Risk Assessment/etc.
**Priority:** High/Medium/Low
**Estimated Effort:** [Time estimate]
**Dependencies:** [List dependencies]

## Objectives

- [Primary planning objective]
- [Secondary objectives]

## Constraints

- [Technical constraints]
- [Resource constraints]
- [Timeline constraints]

## Deliverables

- [ ] [Specific deliverable 1]
- [ ] [Specific deliverable 2]

## Handoff Requirements

**To Engineer:**
- [Implementation requirements]

**To Reviewer:**
- [Review/validation needs]

## Progress Notes

[Regular updates on planning progress]
```

### Architecture Review Template

```markdown
# Architecture Review: [Component/System]

**Review Type:** New Design/Modification/Assessment
**Scope:** [System boundaries]
**Stakeholders:** [Affected teams/systems]

## Current State

[Description of current architecture]

## Proposed Changes

[Detailed description of planned changes]

## Impact Analysis

### Benefits
- [Expected benefits]

### Risks
- [Identified risks and mitigations]

### Dependencies
- [System dependencies]
- [Resource dependencies]

## Implementation Plan

### Phase 1: [Phase description]
- [Phase 1 tasks]

### Phase 2: [Phase description]
- [Phase 2 tasks]

## Success Criteria

- [Measurable success criteria]

## Handoff Checklist

- [ ] Architecture documented
- [ ] Dependencies mapped
- [ ] Risk mitigation planned
- [ ] Implementation plan detailed
- [ ] Success criteria defined
```
