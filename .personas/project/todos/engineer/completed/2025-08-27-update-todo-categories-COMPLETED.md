# Update Engineer TODO Categories

**Created:** 2025-08-27  
**Priority:** HIGH  
**Assigned:** Engineer  
**Estimated Effort:** M  

## Objective

Update the framework to support three categories for engineer todos: `backlog`, `in-progress`, and `changes-requested`. This enhances the current two-category system (`backlog` and `current`) to better reflect the realistic workflow where tasks may need revisions after review.

## Acceptance Criteria

- [ ] Update framework engineer todo directory structure to include `in-progress/` and `changes-requested/` directories
- [ ] Modify engineer persona instructions to document the new three-category system
- [ ] Update todo README files to explain the new workflow
- [ ] Preserve existing `current/` directory for backward compatibility during transition
- [ ] Create migration plan for existing todos in `current/` directory
- [ ] Update handoff protocols between personas to reflect new categories
- [ ] Test the new structure with sample todos

## Technical Notes

**Current Structure:**

```text
.personas/project/todos/engineer/
├── current/     # Active tasks
├── backlog/     # Future tasks  
└── completed/   # Finished tasks
```

**Target Structure:**

```text
.personas/project/todos/engineer/
├── backlog/           # Future tasks
├── in-progress/       # Currently being worked on
├── changes-requested/ # Returned from review with feedback
└── completed/         # Finished tasks
```

**Implementation Strategy:**

1. Update framework persona instructions for Engineer
2. Update project template directory structure
3. Update todo README documentation
4. Create migration script or process for existing todos
5. Update cross-persona handoff documentation

**Dependencies:**

- Must coordinate with other personas' handoff protocols
- Should maintain backward compatibility during transition
- Need to update documentation workflows

## Handoff Requirements

**To Reviewer:**

- Updated framework documentation with new todo category system
- Migration plan for existing todos
- Updated persona instructions reflecting new workflow

**Files to Modify:**

- `framework/personas/engineer/INSTRUCTIONS.md`
- `framework/project-template/todos/engineer/README.md`
- `framework/personas/engineer/QUICK-START.md`
- `framework/personas/engineer/CONTEXT-GUIDE.md`
- All persona handoff protocol documentation

## Notes

This task implements a more realistic development workflow where:

- `backlog/` contains planned future work
- `in-progress/` contains tasks currently being implemented
- `changes-requested/` contains tasks returned from review that need modifications
- `completed/` contains finished, accepted work

This addresses the common scenario where a reviewer requests changes, and the task needs to be tracked separately from new backlog items.

## Implementation Summary

**Completed:** August 27, 2025  
**Status:** ✅ COMPLETED  

### Deliverables Completed

- [x] Created new `in-progress/` and `changes-requested/` directories in framework template
- [x] Updated Engineer persona instructions to reflect new three-category system
- [x] Created comprehensive Engineer TODO README with workflow documentation
- [x] Updated project template README to show new directory structure
- [x] Migrated existing tasks from `current/` to `in-progress/`
- [x] Updated handoff protocols to reflect new workflow stages

### Implementation Details

**New Directory Structure:**
```text
.personas/project/todos/engineer/
├── backlog/           # Future tasks planned for implementation
├── in-progress/       # Tasks currently being worked on
├── changes-requested/ # Tasks returned from review with feedback
└── completed/         # Finished and accepted tasks
```

**Workflow Enhancement:**
- Implemented four-stage workflow: backlog → in-progress → [review] → completed
- Added changes-requested loop for review feedback handling
- Enhanced task categorization and prioritization guidelines

**Documentation Updates:**
- Comprehensive Engineer TODO README with workflow examples
- Updated persona instructions with new task management section
- Enhanced handoff protocols for new workflow stages

### Validation Results

- [x] New directory structure created successfully
- [x] Framework template updated with new organization
- [x] Documentation is comprehensive and actionable
- [x] Existing tasks migrated without data loss
- [x] Backwards compatibility maintained through gradual transition

### Impact Assessment

**User Experience:**
- More realistic development workflow with review feedback loop
- Better task categorization and status tracking
- Clearer handoff protocols between personas

**Framework Evolution:**
- Enhanced task management capability for all projects using framework
- Improved workflow realism and flexibility
- Foundation for automated trigger implementation
