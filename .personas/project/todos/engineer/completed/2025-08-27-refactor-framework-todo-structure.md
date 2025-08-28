# Refactor Framework TODO Structure

**Created:** August 27, 2025  
**Priority:** HIGH  
**Assigned:** Engineer  
**Type:** Framework Refactoring  
**Estimated Effort:** Medium

## Objective

Refactor the framework structure to eliminate todos from the framework personas directories and consolidate all TODO management in project-level directories. This will create clearer separation between framework coordination (META-tasks) and project-specific task management.

## Problem Statement

Currently, the framework has todos in two locations:

- `.personas/framework/personas/{persona}/todos/` - Framework coordination tasks
- `.personas/project/todos/{persona}/` - Project-specific tasks

This dual structure creates confusion about where tasks should be created and managed. The framework should focus on persona definitions and instructions, while all active task management should occur at the project level.

## Acceptance Criteria

- [ ] Remove all `todos/` directories from `.personas/framework/personas/{persona}/`
- [ ] Update persona instructions to reference project-level todos only
- [ ] Migrate any existing framework coordination tasks to project-level todos
- [ ] Update framework documentation to reflect new structure
- [ ] Update validation scripts to check project-level todos only
- [ ] Ensure backward compatibility during transition period
- [ ] Update quick-start guides and context references

## Technical Implementation Plan

### Phase 1: Structure Analysis and Preparation

**1.1 Analyze Current TODO Structure:**

```bash
# Audit current todos in framework personas
find .personas/framework/personas -name "todos" -type d
find .personas/framework/personas -name "*.md" -path "*/todos/*"
```

**1.2 Categorize Existing Tasks:**

- Framework coordination tasks → Move to project-level with "framework-" prefix
- Persona development tasks → Move to project-level engineering backlog
- Completed tasks → Archive in project-level completed directory
- Template tasks → Convert to documentation or examples

### Phase 2: Migration Implementation

**2.1 Create Migration Script:**

```bash
#!/bin/bash
# migrate-framework-todos.sh

# Function to migrate todos from framework to project
migrate_persona_todos() {
    local persona=$1
    local framework_todos=".personas/framework/personas/$persona/todos"
    local project_todos=".personas/project/todos/$persona"
    
    if [ -d "$framework_todos" ]; then
        echo "Migrating $persona todos..."
        
        # Migrate current tasks
        if [ -d "$framework_todos/current" ]; then
            for task in "$framework_todos/current"/*.md; do
                if [ -f "$task" ]; then
                    # Add framework- prefix to indicate coordination tasks
                    filename=$(basename "$task")
                    new_name="framework-${filename}"
                    cp "$task" "$project_todos/current/$new_name"
                    echo "Migrated: $filename -> $new_name"
                fi
            done
        fi
        
        # Migrate backlog tasks
        if [ -d "$framework_todos/backlog" ]; then
            for task in "$framework_todos/backlog"/*.md; do
                if [ -f "$task" ]; then
                    filename=$(basename "$task")
                    new_name="framework-${filename}"
                    cp "$task" "$project_todos/backlog/$new_name"
                    echo "Migrated: $filename -> $new_name"
                fi
            done
        fi
        
        # Archive completed tasks
        if [ -d "$framework_todos/completed" ]; then
            for task in "$framework_todos/completed"/*.md; do
                if [ -f "$task" ]; then
                    filename=$(basename "$task")
                    new_name="framework-${filename}"
                    cp "$task" "$project_todos/completed/$new_name"
                    echo "Archived: $filename -> $new_name"
                fi
            done
        fi
    fi
}

# Migrate all persona todos
for persona in engineer planner reviewer agent-manager; do
    migrate_persona_todos "$persona"
done
```

**2.2 Update Framework Structure:**

- Remove `todos/` directories from each persona
- Update directory structure documentation
- Clean up any references to framework todos

### Phase 3: Documentation Updates

**3.1 Update Persona Instructions:**

For each persona's `INSTRUCTIONS.md`:

- Remove references to framework-level todos
- Update context hierarchy to reference project todos only
- Update quick-start guides to use project-level paths
- Revise handoff protocols to use project todo structure

**3.2 Update Framework Documentation:**

- Update `PERSONA-FRAMEWORK.md` with new structure
- Revise README.md to reflect consolidated todo management
- Update quick-start documentation
- Revise directory structure diagrams

### Phase 4: Validation and Testing

**4.1 Update Validation Scripts:**

```bash
# Update validate-tasks.sh to check project todos only
validate_project_todos() {
    local project_dir=".personas/project/todos"
    
    for persona in engineer planner reviewer agent-manager; do
        local persona_todos="$project_dir/$persona"
        
        # Validate directory structure exists
        [ -d "$persona_todos/current" ] || echo "Missing: $persona_todos/current"
        [ -d "$persona_todos/backlog" ] || echo "Missing: $persona_todos/backlog"
        [ -d "$persona_todos/completed" ] || echo "Missing: $persona_todos/completed"
        
        # Validate task formats
        validate_task_files "$persona_todos"
    done
}
```

**4.2 Update Test Framework:**

- Modify framework tests to expect project-level todos only
- Update integration tests for persona workflows
- Test migration script with various scenarios
- Validate backward compatibility

### Phase 5: Rollout and Communication

**5.1 Backward Compatibility:**

- Create symlinks or warnings for old framework todo locations
- Provide migration assistance for existing users
- Document transition period and timeline

**5.2 Update Tooling:**

- Update `setup.sh` to create project todos only
- Modify any scripts that reference framework todos
- Update documentation generation scripts

## Implementation Details

### Directory Structure Changes

**Before:**

```
.personas/
├── framework/
│   └── personas/
│       ├── engineer/
│       │   ├── INSTRUCTIONS.md
│       │   └── todos/          # ← Remove this
│       ├── planner/
│       │   ├── INSTRUCTIONS.md
│       │   └── todos/          # ← Remove this
│       └── ...
└── project/
    └── todos/
        ├── engineer/
        ├── planner/
        └── ...
```

**After:**

```
.personas/
├── framework/
│   └── personas/
│       ├── engineer/
│       │   └── INSTRUCTIONS.md  # ← Only instructions
│       ├── planner/
│       │   └── INSTRUCTIONS.md  # ← Only instructions
│       └── ...
└── project/
    └── todos/                   # ← All todos here
        ├── engineer/
        ├── planner/
        └── ...
```

### Context Reference Updates

**Update all persona instructions to reference:**

```markdown
# OLD (remove these references)
- `todos/current/` - Current tasks
- `../../todos/current/` - Framework coordination tasks

# NEW (update to these references)
- `../../../../project/todos/[persona]/current/` - Current tasks
- Framework coordination tasks have "framework-" prefix
```

### Migration Mapping

| Current Location | New Location | Notes |
|-----------------|--------------|-------|
| `framework/personas/engineer/todos/current/` | `project/todos/engineer/current/` | Add "framework-" prefix |
| `framework/personas/planner/todos/current/` | `project/todos/planner/current/` | Add "framework-" prefix |
| `framework/personas/reviewer/todos/current/` | `project/todos/reviewer/current/` | Add "framework-" prefix |
| `framework/personas/agent-manager/todos/current/` | `project/todos/agent-manager/current/` | Add "framework-" prefix |

## Risk Assessment

### High-Risk Areas

**1. Breaking Existing Workflows**

- Risk: Users have automated scripts that reference framework todos
- Mitigation: Provide migration script and backward compatibility warnings
- Timeline: 2-week transition period with warnings

**2. Context Reference Confusion**

- Risk: Persona instructions reference wrong todo locations
- Mitigation: Comprehensive testing of all context references
- Validation: Manual verification of all instruction files

### Medium-Risk Areas

**1. Documentation Inconsistency**

- Risk: Some documentation still references old structure
- Mitigation: Systematic documentation review and update
- Process: Use grep to find all todo references

**2. Tool Integration Issues**

- Risk: Validation and testing tools break
- Mitigation: Update all scripts simultaneously
- Testing: Comprehensive test suite validation

## Testing Strategy

### Unit Tests

- [ ] Migration script handles all file types correctly
- [ ] Directory cleanup removes all framework todos
- [ ] Documentation updates preserve all essential information

### Integration Tests

- [ ] Persona workflows work with new structure
- [ ] Validation scripts pass with project-level todos
- [ ] Setup script creates correct directory structure

### User Experience Tests

- [ ] Quick-start guides work with new structure
- [ ] Context references resolve correctly
- [ ] Handoff workflows function properly

## Success Metrics

- [ ] All framework persona directories contain no `todos/` subdirectories
- [ ] All persona instructions reference project-level todos correctly
- [ ] Framework validation passes with new structure
- [ ] Migration completes without data loss
- [ ] User documentation is updated and accurate

## Handoff Requirements

**To Reviewer:**

- Migration script testing and validation
- Documentation review for completeness and accuracy
- Risk assessment validation
- Backward compatibility testing

**To Agent-Manager:**

- Framework documentation updates
- User communication about structural changes
- Migration timeline coordination
- Support documentation for transition

**To Planner:**

- Impact assessment on framework adoption strategy
- Integration with framework evolution roadmap
- Timeline coordination with other framework improvements

---

**Dependencies:**

- Completion requires coordination across all persona types
- Must be completed before major framework version release
- Should align with integration architecture implementation

**Estimated Timeline:**

- Phase 1-2: 2-3 days (analysis and migration)
- Phase 3-4: 2-3 days (documentation and validation)
- Phase 5: 1-2 days (rollout and testing)
- Total: 5-8 days

**Status:** Ready for implementation, pending review and approval
