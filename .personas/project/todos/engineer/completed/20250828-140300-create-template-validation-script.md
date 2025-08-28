# Create Template Validation Script

**Created:** 2025-08-28  
**Priority:** MEDIUM  
**Assigned:** Engineer  
**Estimated Effort:** S  
**Dependencies:** 20250828-140200-create-template-generation-script

## Objective

Create the `template/scripts/validate.sh` script that validates generated .personas directory structures against the proposal specifications.

## Target Location

**Script Location:** `/Users/andy/Dev/agents/personas-framework/template/scripts/validate.sh`

## Acceptance Criteria

- [ ] Validates complete .personas directory structure
- [ ] Checks required files and directories exist
- [ ] Validates YAML frontmatter in task files
- [ ] Verifies persona reference consistency
- [ ] Provides detailed validation reports
- [ ] Supports auto-fix mode for minor issues

## Script Functionality

**Command Interface:**
```bash
# Basic validation
./template/scripts/validate.sh /path/to/project/.personas

# With auto-fix
./template/scripts/validate.sh /path/to/project/.personas --fix

# Detailed report
./template/scripts/validate.sh /path/to/project/.personas --report detailed
```

## Validation Rules

**Directory Structure:**
- [ ] `.personas/agent-manager/personas/{persona}/` exists for each persona
- [ ] `.personas/{persona}/context/` exists for each persona
- [ ] `.personas/{persona}/tasks/done/` exists for each persona
- [ ] Root-level files exist (DEPENDENCIES.md, README.md, etc.)

**File Requirements:**
- [ ] `agent-manager/personas/{persona}/CURRENT.md` exists and non-empty
- [ ] `{persona}/context/PERSONA.md` exists and references CURRENT.md
- [ ] `{persona}/context/PROJECT.md` exists and contains project context
- [ ] All required root-level files exist

**Content Validation:**
- [ ] YAML frontmatter in task files follows schema
- [ ] Persona references point to existing files
- [ ] No circular dependencies in tasks
- [ ] Task IDs are unique within persona queues

## Validation Output

**Success Report:**
```text
✅ Structure Validation: PASSED
✅ File Requirements: PASSED  
✅ Content Validation: PASSED
✅ Reference Consistency: PASSED

Validation completed successfully.
```

**Error Report:**
```text
❌ Structure Validation: FAILED
  - Missing directory: .personas/engineer/tasks/done/
  - Missing file: .personas/DEPENDENCIES.md

⚠️  Content Validation: WARNINGS
  - Task file missing YAML frontmatter: engineer/tasks/task-001.md
  - Broken reference: planner/context/PERSONA.md -> ../agent-manager/personas/planner/CURRENT.md

📝 Summary: 2 errors, 2 warnings
```

## Auto-Fix Capabilities

**Minor Issues (fixable):**
- Create missing directories
- Add missing .gitkeep files
- Fix broken persona references
- Create missing PROJECT.md templates

**Major Issues (report only):**
- Missing persona definitions
- Invalid YAML frontmatter
- Circular dependencies
- Duplicate task IDs

## Important Notes

- Validates the NEW proposed structure (not current framework structure)
- Should work with generated .personas directories from template
- Report should be clear and actionable
- Auto-fix should be safe and conservative

## Definition of Done

- [ ] Script validates all proposal requirements
- [ ] Comprehensive error reporting with clear messages
- [ ] Auto-fix works for minor structural issues
- [ ] Script handles edge cases gracefully
- [ ] Documentation includes usage examples
- [ ] Ready for integration with generation workflow
