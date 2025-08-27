# Context Cross-Reference System

**Purpose:** Unified context filtering and cross-persona navigation  
**Updated:** August 27, 2025

## Document Tagging System

### Persona Priority Tags

Documents are tagged with persona-specific priority levels:

#### Engineer Tags

- `#engineer-priority` - Essential for implementation work
- `#engineer-secondary` - Supporting context for complex tasks  
- `#engineer-background` - Reference material

#### Planner Tags

- `#planner-priority` - Essential for planning and architecture work
- `#planner-secondary` - Supporting context for complex planning
- `#planner-background` - Reference material

#### Reviewer Tags

- `#reviewer-priority` - Essential for quality assessment work
- `#reviewer-secondary` - Supporting context for complex reviews
- `#reviewer-background` - Reference material

#### Agent-Manager Tags

- `#manager-priority` - Essential for coordination and maintenance
- `#manager-secondary` - Supporting context for complex coordination
- `#manager-background` - Reference material

#### Cross-Persona Tags

- `#cross-persona` - Relevant to multiple personas
- `#coordination-required` - Requires persona coordination

## Document Context Map

### Core Documents with Persona Relevance

#### `/go-stream-tech-spec-v0.3.md`

- **Engineer:** `#engineer-priority` - API requirements and implementation constraints
- **Planner:** `#planner-priority` - Architecture decisions and system design
- **Reviewer:** `#reviewer-priority` - Compliance checking and validation requirements
- **Agent-Manager:** `#manager-background` - Context for task routing decisions

#### `/analysis/white-glove-review.md`

- **Engineer:** `#engineer-secondary` - Code quality standards and improvement areas
- **Planner:** `#planner-secondary` - Technical debt and architectural insights
- **Reviewer:** `#reviewer-priority` - Quality baseline and identified issues
- **Agent-Manager:** `#manager-background` - Quality state for coordination

#### `/todo/current/`

- **Engineer:** `#engineer-priority` - Active implementation tasks
- **Planner:** `#planner-secondary` - Current capacity and development status
- **Reviewer:** `#reviewer-secondary` - Implementation state for review planning
- **Agent-Manager:** `#manager-priority` - Task validation and archival needs

#### `/todo/reports/TODO-VALIDATION-REPORT.md`

- **Engineer:** `#engineer-secondary` - Task status and dependencies
- **Planner:** `#planner-priority` - Current capacity and priority assessment
- **Reviewer:** `#reviewer-background` - Development status context
- **Agent-Manager:** `#manager-priority` - Validation status and coordination needs

#### `/archive/`

- **Engineer:** `#engineer-background` - Historical implementation patterns
- **Planner:** `#planner-secondary` - Previous planning decisions and outcomes
- **Reviewer:** `#reviewer-background` - Historical quality issues and resolutions
- **Agent-Manager:** `#manager-priority` - Archival procedures and content organization

## Persona Navigation Matrix

### From Engineer Perspective

**Primary Context:**

1. Current TODO tasks → Implementation requirements
2. Technical specifications → System constraints and APIs
3. Code analysis → Quality standards and known issues

**Cross-Persona Handoffs:**

- **To Planner:** Architecture questions, design decisions needed
- **To Reviewer:** Implementation complete, ready for quality assessment
- **To Agent-Manager:** Documentation updates, task coordination

### From Planner Perspective

**Primary Context:**

1. Technical specifications → Architecture constraints and requirements
2. TODO validation reports → Current capacity and priorities
3. Code analysis → Technical debt and system health

**Cross-Persona Handoffs:**

- **To Engineer:** Task breakdown complete, ready for implementation
- **To Reviewer:** Architecture design complete, ready for validation
- **To Agent-Manager:** Planning documentation updates needed

### From Reviewer Perspective

**Primary Context:**

1. Analysis documents → Quality baseline and current issues
2. Technical specifications → Compliance requirements and standards
3. Current implementation → Quality assessment scope

**Cross-Persona Handoffs:**

- **To Engineer:** Issues identified, fixes needed with specific guidance
- **To Planner:** Architecture implications of quality issues
- **To Agent-Manager:** Quality standards documentation updates

### From Agent-Manager Perspective

**Primary Context:**

1. TODO current status → Task validation and archival needs
2. Housekeeping procedures → Maintenance requirements
3. Archive status → Content organization and preservation

**Cross-Persona Routing:**

- **To Engineer:** Implementation, debugging, optimization tasks
- **To Planner:** Architecture, planning, roadmap tasks
- **To Reviewer:** Quality assessment, review, analysis tasks

## Context Filtering Rules

### Engineer Context Filter

```text
Priority 1: /todo/current/ + go-stream-tech-spec-v0.3.md
Priority 2: /analysis/white-glove-review.md + test patterns
Priority 3: Project structure + implementation history
```

### Planner Context Filter

```text
Priority 1: go-stream-tech-spec-v0.3.md + /todo/reports/
Priority 2: /analysis/ + historical planning decisions
Priority 3: Project dependencies + team capacity data
```

### Reviewer Context Filter

```text
Priority 1: /analysis/ + go-stream-tech-spec-v0.3.md
Priority 2: Current implementation + quality standards
Priority 3: Historical issues + industry standards
```

### Agent-Manager Context Filter

```text
Priority 1: /todo/current/ + /housekeeping/ + /archive/
Priority 2: Persona coordination + documentation currency
Priority 3: Technical content for routing + persona capabilities
```

## Quick Reference Links

### For Fast Persona Navigation

**Engineer Resources:**

- [Instructions](./engineer/INSTRUCTIONS.md) | [Context Guide](./engineer/CONTEXT-GUIDE.md) | [Quick Start](./engineer/QUICK-START.md)

**Planner Resources:**

- [Instructions](./planner/INSTRUCTIONS.md) | [Context Guide](./planner/CONTEXT-GUIDE.md) | [Quick Start](./planner/QUICK-START.md)

**Reviewer Resources:**

- [Instructions](./reviewer/INSTRUCTIONS.md) | [Context Guide](./reviewer/CONTEXT-GUIDE.md) | [Quick Start](./reviewer/QUICK-START.md)

**Agent-Manager Resources:**

- [Instructions](./agent-manager/INSTRUCTIONS.md) | [Context Guide](./agent-manager/CONTEXT-GUIDE.md) | [Quick Start](./agent-manager/QUICK-START.md)

### For Cross-Persona Coordination

**Handoff Templates:**

- [Persona Framework](./PERSONA-FRAMEWORK.md#handoff-protocols)
- [Coordination Protocols](./COORDINATION-PROTOCOLS.md) *(Task 7)*

**Emergency Routing:**

- If persona unclear → Default to Agent-Manager for triage
- If scope spans multiple personas → Agent-Manager coordinates
- If urgent quality issue → Direct to Reviewer

---
**Last Updated:** August 27, 2025
