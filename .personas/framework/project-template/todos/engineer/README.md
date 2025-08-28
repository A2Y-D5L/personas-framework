# Engineer TODO Management

**Engineer Persona:** 🏗️ Implementation and Debugging  
**Directory:** `.personas/project/todos/engineer/`  
**Updated:** August 27, 2025

## Directory Structure

The Engineer persona uses a four-category task management system:

```text
.personas/project/todos/engineer/
├── backlog/           # Future tasks planned for implementation
├── in-progress/       # Tasks currently being worked on
├── changes-requested/ # Tasks returned from review with feedback
└── completed/         # Finished and accepted tasks
```

## Task Categories

### 📝 Backlog (`backlog/`)

**Purpose:** Planned future implementation work

- Tasks waiting to be started
- Feature requests and enhancements
- Bug reports pending investigation
- Refactoring and optimization opportunities

**Task States:**
- Planned but not yet started
- Dependencies may not be resolved
- May require additional planning or design work

### 🚧 In Progress (`in-progress/`)

**Purpose:** Tasks currently being actively worked on

- Active implementation tasks
- Code development and testing
- Debugging and troubleshooting
- Performance optimization work

**Task States:**
- Actively being developed
- All dependencies resolved
- Clear implementation path defined

### 🔄 Changes Requested (`changes-requested/`)

**Purpose:** Tasks returned from review with feedback

- Tasks that failed code review
- Implementations requiring modifications
- Bug fixes that need additional work
- Features requiring design changes

**Task States:**
- Review completed with requested changes
- Specific feedback provided for modifications
- Clear path forward for addressing feedback

### ✅ Completed (`completed/`)

**Purpose:** Finished and accepted tasks

- Successfully implemented features
- Fixed and validated bugs
- Completed optimizations
- Accepted code implementations

**Task States:**
- Code review passed
- Tests passing
- Documentation updated
- Ready for production

## Workflow

### Standard Task Flow

```text
backlog/ → in-progress/ → [review] → completed/
                            ↓
                      changes-requested/ → in-progress/
```

### Task Movement Rules

1. **Backlog → In Progress:**
   - Move when ready to start implementation
   - Ensure dependencies are resolved
   - Clear acceptance criteria defined

2. **In Progress → Review:**
   - Implementation complete and tested
   - Code ready for quality review
   - Documentation updated

3. **Review → Completed:**
   - Review passed successfully
   - All acceptance criteria met
   - No changes requested

4. **Review → Changes Requested:**
   - Review identified issues
   - Specific feedback provided
   - Changes required before acceptance

5. **Changes Requested → In Progress:**
   - Ready to address review feedback
   - Clear understanding of required changes
   - Updated implementation plan

### Task File Naming

Use consistent naming for task files:

```text
YYYY-MM-DD-task-description.md
```

Examples:
- `2025-08-27-implement-user-authentication.md`
- `2025-08-27-fix-memory-leak-in-parser.md`
- `2025-08-27-optimize-stream-processing.md`

## Task Templates

### New Implementation Task

```markdown
# [Feature/Task Title]

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
[What needs to be delivered to reviewer]
```

### Changes Requested Task

```markdown
# [Task Title] - Changes Requested

**Original Date:** [Original creation date]
**Review Date:** [Date review was completed]
**Priority:** HIGH/MEDIUM/LOW
**Assigned:** Engineer

## Review Feedback
[Specific feedback from reviewer]

## Required Changes
- [ ] Change 1
- [ ] Change 2
- [ ] Additional testing required

## Implementation Plan
[How the changes will be addressed]

## Original Acceptance Criteria
[Original criteria that still apply]
```

## Coordination with Other Personas

### From Planner

**Typical Handoffs:**
- Implementation tasks with clear specifications
- Technical approach and architecture decisions
- Feature breakdowns with acceptance criteria

**Expected Deliverables:**
- Clear scope and requirements
- Technical constraints and dependencies
- Performance and quality expectations

### To Reviewer

**Handoff Requirements:**
- Complete implementation with tests
- Updated documentation
- Performance validation
- Integration verification

**Handoff Template:**
```markdown
## Implementation Ready for Review

**Task:** [Task name and link]
**Completed:** [Date]
**Engineer:** [Name]

### Implementation Summary
[Brief description of what was implemented]

### Test Results
- Unit Tests: [X/Y passing]
- Integration Tests: [X/Y passing]
- Performance: [meets requirements]

### Review Focus Areas
[Specific areas needing attention]
```

### With Agent-Manager

**Coordination Needs:**
- Documentation updates for major features
- Cross-persona dependencies
- Framework enhancement coordination

## Priority Guidelines

### HIGH Priority
- Critical bugs affecting production
- Security vulnerabilities
- Blocking issues for other personas

### MEDIUM Priority
- Feature implementations
- Performance optimizations
- Code refactoring

### LOW Priority
- Nice-to-have improvements
- Code cleanup
- Documentation enhancements

## Quality Gates

### Before Moving to In Progress
- [ ] Requirements clearly defined
- [ ] Dependencies identified and resolved
- [ ] Test strategy planned
- [ ] Implementation approach validated

### Before Requesting Review
- [ ] All acceptance criteria met
- [ ] Tests written and passing
- [ ] Code follows project standards
- [ ] Documentation updated
- [ ] Performance requirements met

### Before Marking Complete
- [ ] Review feedback addressed
- [ ] All tests passing
- [ ] No known issues remaining
- [ ] Handoff documentation complete

## Maintenance

### Weekly Review
- Clean up completed tasks older than 30 days
- Review backlog priorities
- Update task estimates based on actual effort

### Monthly Planning
- Analyze task completion patterns
- Identify process improvements
- Update templates and workflows
