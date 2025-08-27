#!/bin/bash

# Personas Framework Documentation Generator
# Generates and updates framework documentation automatically

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration
FRAMEWORK_DIR="${1:-$(pwd)}"
OUTPUT_DIR="${2:-$FRAMEWORK_DIR/docs}"
GENERATE_ALL="${3:-false}"

# Helper functions
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Documentation generation functions
generate_directory_structure() {
    log_info "Generating directory structure documentation..."
    
    local structure_file="$OUTPUT_DIR/directory-structure.md"
    
    cat > "$structure_file" << 'EOF'
# Personas Framework Directory Structure

**Generated:** $(date +"%B %d, %Y")

This document provides a comprehensive overview of the Personas Framework directory structure.

## Framework Root Structure

```text
personas-framework/
├── LICENSE                 # Framework license
├── README.md              # Main framework documentation
├── setup.sh              # Enhanced setup script
├── framework/             # Core framework files
│   ├── PERSONA-FRAMEWORK.md    # Framework specification
│   ├── personas/              # Persona definitions
│   └── project-template/      # Template for new projects
└── tools/                 # Framework development tools
    ├── validate-framework.sh  # Framework structure validator
    ├── validate-tasks.sh      # Task format validator
    ├── test-framework.sh      # Test suite
    └── generate-docs.sh       # Documentation generator
```

## Persona Directory Structure

```text
.personas/framework/personas/[persona]/
├── INSTRUCTIONS.md        # Detailed persona instructions
├── QUICK-START.md        # Quick reference guide
├── CONTEXT-GUIDE.md      # Context priority guidance
└── todos/                # Framework-level tasks
    ├── current/          # Active framework tasks
    ├── backlog/          # Future framework work
    └── completed/        # Archived framework tasks
```

## Project Directory Structure

```text
.personas/project/
├── README.md             # Project overview
├── TECH-SPEC.md         # Technical specifications
├── STANDARDS.md         # Development standards
├── DEPENDENCIES.md      # External dependencies
├── contexts/            # Persona-specific project context
│   ├── engineer/        # Engineering context and patterns
│   ├── planner/         # Planning context and templates
│   └── reviewer/        # Review criteria and standards
└── todos/               # Project task management
    ├── engineer/        # Implementation tasks
    ├── planner/         # Architecture and planning tasks
    └── reviewer/        # Quality assurance tasks
```

## Task Directory Structure

```text
todos/[persona]/
├── current/             # Active tasks requiring immediate attention
├── backlog/             # Future tasks awaiting prioritization
└── completed/           # Archived completed tasks
```

---

**Note:** This documentation is auto-generated. Last updated: $(date +"%Y-%m-%d")
EOF
    
    # Replace the date placeholders
    sed -i.bak "s/\$(date +\"%B %d, %Y\")/$(date +"%B %d, %Y")/g" "$structure_file"
    sed -i.bak "s/\$(date +\"%Y-%m-%d\")/$(date +"%Y-%m-%d")/g" "$structure_file"
    rm -f "$structure_file.bak"
    
    log_success "Directory structure documentation generated"
}

generate_quick_reference() {
    log_info "Generating quick reference guide..."
    
    local quick_ref_file="$OUTPUT_DIR/quick-reference.md"
    
    cat > "$quick_ref_file" << 'EOF'
# Personas Framework Quick Reference

**Generated:** $(date +"%B %d, %Y")

## Persona Overview

| Persona | Focus | Primary Responsibilities |
|---------|-------|-------------------------|
| 🏗️ Engineer | Implementation | Code development, debugging, testing, optimization |
| 📋 Planner | Architecture | System design, planning, roadmapping, analysis |
| 🔍 Reviewer | Quality | Code review, security analysis, quality assurance |
| 🗂️ Agent-Manager | Coordination | Documentation, task coordination, process management |

## Quick Start Commands

### Setup New Project
```bash
# Clone framework
git clone [framework-repo] personas-framework
cd personas-framework

# Setup in your project
./setup.sh /path/to/your/project

# Or interactive setup
./setup.sh /path/to/your/project true
```

### Validation Commands
```bash
# Validate framework structure
./tools/validate-framework.sh /path/to/project

# Validate task formatting
./tools/validate-tasks.sh /path/to/project

# Run full test suite
./tools/test-framework.sh
```

### Daily Workflow

1. **Check your persona's tasks:**
   ```bash
   ls .personas/project/todos/[your-persona]/current/
   ```

2. **Create a new task:**
   ```bash
   # Use naming convention: YYYY-MM-DD-description.md
   touch .personas/project/todos/[persona]/current/$(date +%Y-%m-%d)-task-name.md
   ```

3. **Move completed tasks:**
   ```bash
   mv .personas/project/todos/[persona]/current/task.md \
      .personas/project/todos/[persona]/completed/
   ```

## Task File Template

```markdown
# Task Title

**Created:** $(date +"%Y-%m-%d")
**Priority:** HIGH/MEDIUM/LOW
**Assigned:** [Persona]
**Type:** [Implementation/Planning/Review/etc.]

## Objective
[Clear description of what needs to be accomplished]

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Testing completed
- [ ] Documentation updated

## Technical Notes
[Implementation details, constraints, dependencies]

## Progress Updates
[Regular status updates]
```

## Handoff Protocol

### Engineer → Reviewer
- Complete implementation with tests
- Performance validation completed
- Documentation updated
- Ready for quality review

### Planner → Engineer
- Detailed implementation plan
- Technical specifications
- Architecture decisions documented
- Clear acceptance criteria

### Reviewer → [Original Persona]
- Quality assessment completed
- Issues documented with priority
- Recommendations provided
- Follow-up actions assigned

## Emergency Procedures

### When Tasks are Blocked
1. Document the blocker in task file
2. Research alternative approaches
3. Escalate to appropriate persona:
   - Technical issues → Planner
   - Quality concerns → Reviewer
   - Coordination needs → Agent-Manager

### When Validation Fails
```bash
# Fix common issues automatically
./tools/validate-framework.sh /path/to/project false true

# Check specific task formatting
./tools/validate-tasks.sh /path/to/project specific-task.md true
```

---

**Note:** This documentation is auto-generated. Last updated: $(date +"%Y-%m-%d")
EOF
    
    # Replace the date placeholders
    sed -i.bak "s/\$(date +\"%B %d, %Y\")/$(date +"%B %d, %Y")/g" "$quick_ref_file"
    sed -i.bak "s/\$(date +\"%Y-%m-%d\")/$(date +"%Y-%m-%d")/g" "$quick_ref_file"
    rm -f "$quick_ref_file.bak"
    
    log_success "Quick reference guide generated"
}

generate_api_documentation() {
    log_info "Generating API documentation..."
    
    local api_file="$OUTPUT_DIR/framework-api.md"
    
    cat > "$api_file" << 'EOF'
# Personas Framework API Reference

**Generated:** $(date +"%B %d, %Y")

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
```
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

**Note:** This documentation is auto-generated. Last updated: $(date +"%Y-%m-%d")
EOF
    
    # Replace the date placeholders
    sed -i.bak "s/\$(date +\"%B %d, %Y\")/$(date +"%B %d, %Y")/g" "$api_file"
    sed -i.bak "s/\$(date +\"%Y-%m-%d\")/$(date +"%Y-%m-%d")/g" "$api_file"
    rm -f "$api_file.bak"
    
    log_success "API documentation generated"
}

generate_changelog() {
    log_info "Generating changelog..."
    
    local changelog_file="$OUTPUT_DIR/CHANGELOG.md"
    
    cat > "$changelog_file" << 'EOF'
# Personas Framework Changelog

**Generated:** $(date +"%B %d, %Y")

## [Enhanced] - $(date +"%Y-%m-%d")

### Added
- Enhanced setup script with interactive configuration
- Framework structure validator
- Task format validator
- Comprehensive test suite
- Auto-generated documentation
- Directory structure validation
- Task naming convention enforcement
- Persona alignment checking

### Improved
- Setup process now includes project customization
- Better error reporting and validation
- Automated testing and validation
- Documentation generation and synchronization

### Fixed
- Directory creation issues in setup
- Missing file validation
- Task format inconsistencies

### Technical Details
- Shell script optimization and linting
- Modular validation architecture
- Extensible testing framework
- Automated documentation pipeline

## Framework Enhancement Summary

This release significantly enhances the Personas Framework with:

1. **Development Tooling**
   - Automated setup with customization
   - Comprehensive validation tools
   - Test automation suite

2. **Quality Assurance**
   - Framework structure validation
   - Task format enforcement
   - Consistency checking

3. **Developer Experience**
   - Interactive setup process
   - Clear error messages
   - Auto-generated documentation

4. **Maintenance**
   - Automated testing
   - Documentation synchronization
   - Tool extensibility

---

**Note:** This changelog is auto-generated. Last updated: $(date +"%Y-%m-%d")
EOF
    
    # Replace the date placeholders
    sed -i.bak "s/\$(date +\"%B %d, %Y\")/$(date +"%B %d, %Y")/g" "$changelog_file"
    sed -i.bak "s/\$(date +\"%Y-%m-%d\")/$(date +"%Y-%m-%d")/g" "$changelog_file"
    rm -f "$changelog_file.bak"
    
    log_success "Changelog generated"
}

generate_index() {
    log_info "Generating documentation index..."
    
    local index_file="$OUTPUT_DIR/README.md"
    
    cat > "$index_file" << 'EOF'
# Personas Framework Documentation

**Generated:** $(date +"%B %d, %Y")

Welcome to the Personas Framework documentation. This directory contains auto-generated documentation for the enhanced framework.

## Documentation Files

### Quick References
- [Quick Reference Guide](quick-reference.md) - Essential commands and workflows
- [Directory Structure](directory-structure.md) - Complete directory layout
- [Framework API](framework-api.md) - Tool APIs and integration guide

### Release Information
- [Changelog](CHANGELOG.md) - Framework enhancement history

## Getting Started

1. **New Users**: Start with the [Quick Reference Guide](quick-reference.md)
2. **Developers**: Review the [Framework API](framework-api.md)
3. **Project Setup**: Follow the setup instructions in the main [README](../README.md)

## Framework Structure Overview

The Personas Framework provides a structured approach to agent coordination through specialized personas:

- **🏗️ Engineer**: Implementation and debugging
- **📋 Planner**: Architecture and planning  
- **🔍 Reviewer**: Quality assurance and review
- **🗂️ Agent-Manager**: Coordination and documentation

## Enhanced Features

This enhanced version includes:

✅ **Automated Setup**: Interactive project configuration  
✅ **Validation Tools**: Framework and task validation  
✅ **Testing Suite**: Comprehensive test automation  
✅ **Documentation**: Auto-generated guides and references  

## Tool Usage

```bash
# Setup new project
./setup.sh /path/to/project

# Validate framework
./tools/validate-framework.sh

# Validate tasks
./tools/validate-tasks.sh

# Run tests
./tools/test-framework.sh

# Generate docs
./tools/generate-docs.sh
```

## Support

For issues or questions:
1. Check the validation tools for common problems
2. Review the API documentation for tool usage
3. Run the test suite to verify installation

---

**Auto-generated:** $(date +"%Y-%m-%d %H:%M:%S")
EOF
    
    # Replace the date placeholders
    sed -i.bak "s/\$(date +\"%B %d, %Y\")/$(date +"%B %d, %Y")/g" "$index_file"
    sed -i.bak "s/\$(date +\"%Y-%m-%d %H:%M:%S\")/$(date +"%Y-%m-%d %H:%M:%S")/g" "$index_file"
    rm -f "$index_file.bak"
    
    log_success "Documentation index generated"
}

cleanup_old_docs() {
    if [ "$GENERATE_ALL" = "true" ] && [ -d "$OUTPUT_DIR" ]; then
        log_info "Cleaning up old documentation..."
        rm -rf "$OUTPUT_DIR"
    fi
}

setup_output_directory() {
    log_info "Setting up documentation output directory..."
    mkdir -p "$OUTPUT_DIR"
    log_success "Output directory ready: $OUTPUT_DIR"
}

validate_framework() {
    log_info "Validating framework before documentation generation..."
    
    if [ ! -d "$FRAMEWORK_DIR/framework" ]; then
        log_error "Framework directory not found: $FRAMEWORK_DIR/framework"
        exit 1
    fi
    
    if [ ! -f "$FRAMEWORK_DIR/setup.sh" ]; then
        log_error "Setup script not found: $FRAMEWORK_DIR/setup.sh"
        exit 1
    fi
    
    log_success "Framework validation complete"
}

generate_summary() {
    echo
    log_success "Documentation generation complete!"
    echo
    echo -e "${BLUE}📚 Generated Documentation:${NC}"
    echo "  - Directory Structure Guide"
    echo "  - Quick Reference Manual"
    echo "  - Framework API Reference"
    echo "  - Changelog and Release Notes"
    echo "  - Documentation Index"
    echo
    echo -e "${GREEN}📂 Output Directory: $OUTPUT_DIR${NC}"
    echo
    log_info "Documentation is ready for use!"
}

print_usage() {
    echo "Personas Framework Documentation Generator"
    echo
    echo "Usage: $0 [FRAMEWORK_DIR] [OUTPUT_DIR] [GENERATE_ALL]"
    echo
    echo "Arguments:"
    echo "  FRAMEWORK_DIR  Framework root directory (default: current directory)"
    echo "  OUTPUT_DIR     Documentation output directory (default: FRAMEWORK_DIR/docs)"
    echo "  GENERATE_ALL   Regenerate all docs, removing old ones (true/false, default: false)"
    echo
    echo "Examples:"
    echo "  $0                           # Generate docs in current directory"
    echo "  $0 /path/to/framework        # Generate docs for specific framework"
    echo "  $0 . ./documentation true   # Regenerate all docs in custom directory"
    echo
}

# Main execution
main() {
    echo -e "${GREEN}📚 Personas Framework Documentation Generator${NC}"
    echo "Framework: $FRAMEWORK_DIR"
    echo "Output: $OUTPUT_DIR"
    echo "Regenerate All: $GENERATE_ALL"
    echo
    
    validate_framework
    cleanup_old_docs
    setup_output_directory
    
    generate_directory_structure
    generate_quick_reference
    generate_api_documentation
    generate_changelog
    generate_index
    
    generate_summary
}

# Handle command line arguments
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    print_usage
    exit 0
fi

# Run main function
main
