# Implement Task Metadata Schema Validation

**Created:** 2025-08-28  
**Priority:** MEDIUM  
**Assigned:** Engineer  
**Estimated Effort:** M  
**Dependencies:** 20250828-140300-create-template-validation-script

## Objective

Create YAML schema files and validation logic for the standardized task metadata format specified in the proposal.

## Target Location

**Schema Files:** `/Users/andy/Dev/agents/personas-framework/schemas/`
**Validation Tools:** `/Users/andy/Dev/agents/personas-framework/tools/validate-tasks.sh` (enhance existing)

## Acceptance Criteria

- [ ] Create task-schema.yaml with complete validation rules
- [ ] Implement metadata parsing and validation logic
- [ ] Integrate with existing validate-tasks.sh tool
- [ ] Support validation of YAML frontmatter in task files
- [ ] Provide clear error messages for validation failures
- [ ] Handle both new and existing task format validation

## Task Metadata Schema

**Create schemas/task-schema.yaml:**
```yaml
type: object
required:
  - id
  - priority
  - assigned_to
  - created_by
  - status
  - created_date

properties:
  id:
    type: string
    pattern: "^(TASK-|DEP-|PENDING-|[0-9]{8}-[0-9]{6})"
    description: "Unique task identifier"
  
  priority:
    type: string
    enum: ["high", "medium", "low"]
    description: "Task priority level"
  
  assigned_to:
    type: string
    enum: ["engineer", "planner", "reviewer", "agent-manager"]
    description: "Persona responsible for task execution"
  
  created_by:
    type: string
    enum: ["engineer", "planner", "reviewer", "agent-manager"]
    description: "Persona that created the task"
  
  complexity:
    type: string
    enum: ["high", "medium", "low"]
    description: "Task complexity assessment"
  
  status:
    type: string
    enum: ["pending", "in-progress", "review", "done"]
    description: "Current task status"
  
  created_date:
    type: string
    format: date
    description: "Task creation date (YYYY-MM-DD)"
  
  due_date:
    type: string
    format: date
    description: "Task due date (YYYY-MM-DD)"
  
  dependencies:
    type: array
    items:
      type: string
    description: "List of task IDs this task depends on"

additionalProperties: false
```

## Validation Integration

**Enhance tools/validate-tasks.sh to support:**

1. **YAML Frontmatter Parsing:**
   - Extract YAML frontmatter from markdown files
   - Parse and validate against schema
   - Report parsing errors clearly

2. **Schema Validation:**
   - Validate all required fields present
   - Check field values against allowed enums
   - Validate date formats and patterns

3. **Cross-Reference Validation:**
   - Verify task dependencies exist
   - Check for circular dependencies
   - Validate persona assignments are consistent

## Example Valid Task File

**Format that should validate successfully:**
```markdown
---
id: 20250828-140400
priority: high
assigned_to: engineer
created_by: planner
complexity: medium
status: pending
created_date: 2025-08-28
due_date: 2025-09-05
dependencies: []
---

# Implement New Feature X

## Objective
Clear description of what needs to be accomplished

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Context
Relevant background information and constraints
```

## Validation Command Enhancement

**Extended validate-tasks.sh usage:**
```bash
# Validate single task file
./tools/validate-tasks.sh --file .personas/project/todos/engineer/current/task-001.md

# Validate all tasks in persona directory
./tools/validate-tasks.sh --persona engineer --schema schemas/task-schema.yaml

# Validate with dependency checking
./tools/validate-tasks.sh --persona engineer --check-dependencies --max-depth 10

# Generate validation report
./tools/validate-tasks.sh --all-personas --report detailed --output validation-report.txt
```

## Error Reporting

**Clear validation messages:**
```text
❌ Task Validation Failed: engineer/current/task-001.md
   - Missing required field: 'priority'
   - Invalid value for 'status': 'working' (allowed: pending, in-progress, review, done)
   - Invalid date format: 'created_date' should be YYYY-MM-DD

⚠️  Dependency Warning: engineer/current/task-002.md
   - Depends on non-existent task: TASK-2025-999
   - Circular dependency detected: task-002 -> task-003 -> task-002
```

## Important Notes

- Validate both NEW task format (with YAML frontmatter) and existing framework tasks
- Schema should enforce the proposal specifications exactly
- Integration with existing tools maintains backward compatibility
- Clear error messages help users fix validation issues
- Support for both individual file and bulk validation

## Definition of Done

- [ ] Complete YAML schema file created
- [ ] Validation logic integrated with existing tools
- [ ] YAML frontmatter parsing works correctly
- [ ] Schema validation provides clear error messages
- [ ] Dependency validation detects circular references
- [ ] Tool supports both new and existing task formats
- [ ] Comprehensive testing with valid and invalid examples
