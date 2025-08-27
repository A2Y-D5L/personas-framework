# Personas Framework API Reference

**Generated:** August 27, 2025

## Setup Script API

### `setup.sh`

Enhanced setup script for framework installation.

**Usage:**

```bash
./setup.sh [PROJECT_ROOT] [INTERACTIVE]
```

**Parameters:**

- `PROJECT_ROOT`: Target directory (default: current directory)
- `INTERACTIVE`: Enable prompts (true/false, default: true)

**Features:**

- Interactive project configuration
- Automatic file customization
- Directory structure validation
- Installation verification

## Validation Tools API

### `validate-framework.sh`

Validates framework structure and configuration.

**Usage:**

```bash
./tools/validate-framework.sh [TARGET_DIR] [VERBOSE] [FIX_ISSUES]
```

**Parameters:**

- `TARGET_DIR`: Directory to validate (default: current directory)
- `VERBOSE`: Enable detailed output (true/false, default: false)
- `FIX_ISSUES`: Auto-fix issues (true/false, default: false)

**Exit Codes:**

- `0`: Success (no errors)
- `1`: Validation failed

### `validate-tasks.sh`

Validates task file format and content.

**Usage:**

```bash
./tools/validate-tasks.sh [TARGET_DIR] [TASK_FILE] [VERBOSE]
```

**Parameters:**

- `TARGET_DIR`: Framework root directory (default: current directory)
- `TASK_FILE`: Specific task to validate (optional)
- `VERBOSE`: Enable detailed output (true/false, default: false)

**Validation Checks:**

- Task structure and required sections
- Naming convention compliance
- Content completeness
- Persona alignment

### `test-framework.sh`

Comprehensive framework testing suite.

**Usage:**

```bash
./tools/test-framework.sh [--keep-files]
```

**Options:**

- `--keep-files`: Preserve test files after completion

**Test Coverage:**

- Setup script functionality
- Validation tool accuracy
- Framework file integrity
- Directory structure compliance

## Framework Integration

### Directory Requirements

Required directories for valid framework installation:

- `.personas/framework/`
- `.personas/project/`
- `.personas/project/todos/[persona]/current/`
- `.personas/project/contexts/[persona]/`

### File Requirements

Required files for complete framework:

- `.personas/framework/PERSONA-FRAMEWORK.md`
- `.personas/project/README.md`
- `.personas/project/TECH-SPEC.md`
- `.personas/project/STANDARDS.md`

### Task Naming Convention

Tasks must follow the pattern:

```text
YYYY-MM-DD-descriptive-name.md
```

Example: `2025-08-27-implement-user-authentication.md`

### Task Structure Requirements

All tasks must include:

```markdown
# Title
**Priority:** HIGH/MEDIUM/LOW
## Objective
## Acceptance Criteria
- [ ] Checkbox items
```

## Extension Points

### Custom Validation Rules

To add custom validation rules:

1. Create validation function in appropriate tool
2. Add to main validation loop
3. Update error/warning counters
4. Document in this API reference

### Custom Persona Types

To add new persona types:

1. Create persona directory structure
2. Add persona files (INSTRUCTIONS.md, etc.)
3. Update validation tools to recognize new persona
4. Update documentation and templates

---

**Note:** This documentation is auto-generated. Last updated: 2025-08-27
