# Engineer TODO Management

**Purpose:** Track implementation tasks assigned to the Engineer persona  
**Updated:** August 27, 2025

## Directory Structure

### `/current/`

Active implementation tasks currently being worked on by Engineer agents.

**Task Types:**

- Code implementation and modifications
- Bug fixes and debugging
- Test writing and validation
- Performance optimization
- API integration work

### `/backlog/`

Planned implementation tasks waiting to be started.

**Prioritization:**

- HIGH: Critical bugs, security fixes, blocking issues
- MEDIUM: Feature implementations, optimizations
- LOW: Nice-to-have improvements, refactoring

### `/completed/`

Completed implementation tasks archived for reference.

**Archive Format:**

- Original task files moved here upon completion
- Completion date added to filename
- Results and learnings documented

## Task Assignment Rules

**Engineer Tasks Include:**

- ✅ "implement", "fix", "debug", "optimize", "code"
- ✅ Implementation work requiring coding
- ✅ Technical debugging and troubleshooting
- ✅ Performance optimization work
- ✅ Test writing and validation

**Route to Other Personas:**

- Architecture decisions → Planner
- Quality assessment → Reviewer
- Documentation coordination → Agent-Manager

## Task Creation Template

```markdown
# [Task Title]

**Created:** [Date]
**Priority:** HIGH/MEDIUM/LOW
**Assigned:** Engineer
**Estimated Effort:** S/M/L

## Objective
[Clear description of what needs to be implemented]

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Tests written and passing
- [ ] Documentation updated

## Technical Notes
[Implementation notes, constraints, dependencies]

## Handoff Requirements
[What needs to be delivered to next persona]
```

## Coordination with Other Personas

**From Planner:**

- Receive implementation tasks with architecture decisions
- Clear scope and acceptance criteria provided
- Dependencies and integration points identified

**To Reviewer:**

- Hand off completed implementations for quality review
- Include test results and performance validation
- Provide documentation updates

**With Agent-Manager:**

- Report completion status for archival
- Request documentation coordination
- Escalate cross-persona dependencies
