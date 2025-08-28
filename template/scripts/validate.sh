#!/bin/bash
# Personas Framework Template Validator
# 
# Usage: validate.sh TARGET_DIR [OPTIONS]
#
# Arguments:
#   TARGET_DIR       Path to .personas directory to validate
#
# Options:
#   --fix            Auto-fix minor structural issues
#   --report TYPE    Report detail level: basic|detailed (default: basic)
#   --quiet          Suppress non-error output
#   --help           Show this help message
#
# Examples:
#   ./validate.sh /path/to/project/.personas
#   ./validate.sh /path/to/project/.personas --fix --report detailed
#   ./validate.sh /path/to/project/.personas --quiet

set -euo pipefail

# Default values
TARGET_DIR=""
AUTO_FIX=false
REPORT_TYPE="basic"
QUIET=false

# Validation counters
ERRORS=0
WARNINGS=0
FIXES_APPLIED=0

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Icons
CHECK="✅"
CROSS="❌"
WARNING="⚠️"
INFO="📝"
FIX="🔧"

# Logging functions
log_info() {
    [[ "$QUIET" == "false" ]] && echo -e "${BLUE}${INFO}${NC} $1"
}

log_success() {
    [[ "$QUIET" == "false" ]] && echo -e "${GREEN}${CHECK}${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}${WARNING}${NC} $1"
    WARNINGS=$((WARNINGS + 1))
}

log_error() {
    echo -e "${RED}${CROSS}${NC} $1" >&2
    ERRORS=$((ERRORS + 1))
}

log_fix() {
    [[ "$QUIET" == "false" ]] && echo -e "${CYAN}${FIX}${NC} $1"
    FIXES_APPLIED=$((FIXES_APPLIED + 1))
}

# Usage function
usage() {
    cat << EOF
Personas Framework Template Validator

Usage: $0 TARGET_DIR [OPTIONS]

Arguments:
  TARGET_DIR       Path to .personas directory to validate

Options:
  --fix            Auto-fix minor structural issues
  --report TYPE    Report detail level: basic|detailed (default: basic)
  --quiet          Suppress non-error output
  --help           Show this help message

Examples:
  $0 /path/to/project/.personas
  $0 /path/to/project/.personas --fix --report detailed
  $0 /path/to/project/.personas --quiet

Validation Categories:
  - Directory Structure: Required directories and organization
  - File Requirements: Essential files and content
  - Content Validation: YAML frontmatter and references
  - Reference Consistency: Cross-file references and links

Auto-Fix Capabilities:
  - Create missing directories
  - Add missing .gitkeep files
  - Fix broken persona references
  - Create missing PROJECT.md templates
EOF
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --fix)
                AUTO_FIX=true
                shift
                ;;
            --report)
                REPORT_TYPE="$2"
                if [[ "$REPORT_TYPE" != "basic" && "$REPORT_TYPE" != "detailed" ]]; then
                    log_error "Invalid report type: $REPORT_TYPE. Use 'basic' or 'detailed'"
                    exit 1
                fi
                shift 2
                ;;
            --quiet)
                QUIET=true
                shift
                ;;
            --help|-h)
                usage
                exit 0
                ;;
            -*)
                log_error "Unknown option: $1"
                usage
                exit 1
                ;;
            *)
                if [[ -z "$TARGET_DIR" ]]; then
                    TARGET_DIR="$1"
                else
                    log_error "Multiple target directories specified"
                    usage
                    exit 1
                fi
                shift
                ;;
        esac
    done
}

# Validate arguments
validate_args() {
    if [[ -z "$TARGET_DIR" ]]; then
        log_error "Missing required argument: TARGET_DIR"
        usage
        exit 1
    fi

    if [[ ! -d "$TARGET_DIR" ]]; then
        log_error "Target directory does not exist: $TARGET_DIR"
        exit 1
    fi

    # Ensure TARGET_DIR ends with .personas
    if [[ ! "$TARGET_DIR" =~ \.personas/?$ ]]; then
        log_error "Target directory must be a .personas directory"
        exit 1
    fi
}

# Validate directory structure
validate_directory_structure() {
    local category="Directory Structure"
    local category_errors=0
    
    if [[ "$REPORT_TYPE" == "detailed" ]] || [[ "$QUIET" == "false" ]]; then
        echo
        echo -e "${BOLD}${category}${NC}"
        echo "================================="
    fi
    
    # Required personas
    local personas=("agent-manager" "engineer" "planner" "reviewer")
    
    # Required directories
    local required_dirs=(
        "agent-manager/personas/agent-manager"
        "agent-manager/personas/agent-manager/versions"
        "agent-manager/personas/engineer" 
        "agent-manager/personas/engineer/versions"
        "agent-manager/personas/planner"
        "agent-manager/personas/planner/versions"
        "agent-manager/personas/reviewer"
        "agent-manager/personas/reviewer/versions"
        "agent-manager/context"
        "agent-manager/tasks/done"
        "engineer/context"
        "engineer/tasks/done"
        "planner/context"
        "planner/tasks/done"
        "reviewer/context"
        "reviewer/tasks/done"
    )
    
    for dir in "${required_dirs[@]}"; do
        local full_path="$TARGET_DIR/$dir"
        if [[ ! -d "$full_path" ]]; then
            log_error "Missing required directory: $dir"
            category_errors=$((category_errors + 1))
            
            if [[ "$AUTO_FIX" == "true" ]]; then
                mkdir -p "$full_path"
                log_fix "Created missing directory: $dir"
            fi
        elif [[ "$REPORT_TYPE" == "detailed" ]]; then
            log_success "Directory exists: $dir"
        fi
        
        # Check for .gitkeep in empty task directories
        if [[ "$dir" == */done ]] && [[ -d "$full_path" ]]; then
            local gitkeep_file="$full_path/.gitkeep"
            if [[ ! -f "$gitkeep_file" ]] && [[ -z "$(ls -A "$full_path" 2>/dev/null)" ]]; then
                log_warning "Missing .gitkeep in empty directory: $dir"
                
                if [[ "$AUTO_FIX" == "true" ]]; then
                    touch "$gitkeep_file"
                    log_fix "Created .gitkeep in: $dir"
                fi
            fi
        fi
    done
    
    if [[ $category_errors -eq 0 ]]; then
        log_success "$category: PASSED"
    else
        log_error "$category: FAILED ($category_errors errors)"
    fi
    
    return $category_errors
}

# Validate file requirements
validate_file_requirements() {
    local category="File Requirements"
    local category_errors=0
    
    if [[ "$REPORT_TYPE" == "detailed" ]] || [[ "$QUIET" == "false" ]]; then
        echo
        echo -e "${BOLD}${category}${NC}"
        echo "================================="
    fi
    
    # Required files
    local required_files=(
        "agent-manager/personas/agent-manager/CURRENT.md"
        "agent-manager/personas/engineer/CURRENT.md"
        "agent-manager/personas/planner/CURRENT.md"
        "agent-manager/personas/reviewer/CURRENT.md"
        "agent-manager/context/PERSONA.md"
        "agent-manager/context/PROJECT.md"
        "engineer/context/PERSONA.md"
        "engineer/context/PROJECT.md"
        "planner/context/PERSONA.md"
        "planner/context/PROJECT.md"
        "reviewer/context/PERSONA.md"
        "reviewer/context/PROJECT.md"
        "DEPENDENCIES.md"
        "README.md"
        "STANDARDS.md"
        "TECH-SPEC.md"
    )
    
    for file in "${required_files[@]}"; do
        local full_path="$TARGET_DIR/$file"
        if [[ ! -f "$full_path" ]]; then
            log_error "Missing required file: $file"
            category_errors=$((category_errors + 1))
            
            if [[ "$AUTO_FIX" == "true" ]] && [[ "$file" == */PROJECT.md ]]; then
                create_project_template "$full_path"
                log_fix "Created PROJECT.md template: $file"
            elif [[ "$AUTO_FIX" == "true" ]] && [[ "$file" == */PERSONA.md ]] && [[ "$file" != agent-manager/* ]]; then
                create_persona_template "$full_path"
                log_fix "Created PERSONA.md template: $file"
            fi
        elif [[ ! -s "$full_path" ]]; then
            log_error "Empty required file: $file"
            category_errors=$((category_errors + 1))
        elif [[ "$REPORT_TYPE" == "detailed" ]]; then
            log_success "File exists and non-empty: $file"
        fi
    done
    
    if [[ $category_errors -eq 0 ]]; then
        log_success "$category: PASSED"
    else
        log_error "$category: FAILED ($category_errors errors)"
    fi
    
    return $category_errors
}

# Create PROJECT.md template
create_project_template() {
    local file_path="$1"
    local persona_name
    
    # Extract persona name from path
    if [[ "$file_path" =~ /([^/]+)/context/PROJECT\.md$ ]]; then
        persona_name="${BASH_REMATCH[1]}"
    else
        persona_name="unknown"
    fi
    
    # Capitalize first letter (compatible with older bash)
    local capitalized_name
    capitalized_name="$(echo "${persona_name:0:1}" | tr '[:lower:]' '[:upper:]')${persona_name:1}"
    
    mkdir -p "$(dirname "$file_path")"
    
    cat > "$file_path" << EOF
# ${capitalized_name} Project Context

**Project:** [Project Name]
**Description:** [Project Description]
**Technology Stack:** [Technology Stack]

## Current Phase

[Describe current project phase and objectives]

## Key Considerations

- [Important project constraints]
- [Technical considerations]
- [Business requirements]

## Resources

- [Links to relevant documentation]
- [Key stakeholder contacts]
- [Important project resources]
EOF
}

# Create PERSONA.md template
create_persona_template() {
    local file_path="$1"
    local persona_name
    
    # Extract persona name from path
    if [[ "$file_path" =~ /([^/]+)/context/PERSONA\.md$ ]]; then
        persona_name="${BASH_REMATCH[1]}"
    else
        persona_name="unknown"
    fi
    
    # Capitalize first letter (compatible with older bash)
    local capitalized_name
    capitalized_name="$(echo "${persona_name:0:1}" | tr '[:lower:]' '[:upper:]')${persona_name:1}"
    
    mkdir -p "$(dirname "$file_path")"
    
    cat > "$file_path" << EOF
# ${capitalized_name} Persona

This persona's current definition is maintained in:
\`../agent-manager/personas/${persona_name}/CURRENT.md\`

## Persona Definition

This persona's current definition is maintained in:
\`../agent-manager/personas/${persona_name}/CURRENT.md\`

For the most up-to-date persona instructions, capabilities, and guidelines, 
always refer to the centralized definition managed by Agent-Manager.
EOF
}

# Validate content and references
validate_content() {
    local category="Content Validation"
    local category_errors=0
    
    if [[ "$REPORT_TYPE" == "detailed" ]] || [[ "$QUIET" == "false" ]]; then
        echo
        echo -e "${BOLD}${category}${NC}"
        echo "================================="
    fi
    
    # Check persona references
    local personas=("agent-manager" "engineer" "planner" "reviewer")
    
    for persona in "${personas[@]}"; do
        local persona_file="$TARGET_DIR/$persona/context/PERSONA.md"
        local current_file="$TARGET_DIR/agent-manager/personas/$persona/CURRENT.md"
        
        if [[ -f "$persona_file" && -f "$current_file" ]]; then
            # Check if PERSONA.md references the CURRENT.md file
            if ! grep -q "personas/$persona/CURRENT.md" "$persona_file" 2>/dev/null; then
                log_warning "Persona reference may be incorrect in: $persona/context/PERSONA.md"
                
                if [[ "$AUTO_FIX" == "true" ]]; then
                    fix_persona_reference "$persona_file" "$persona"
                    log_fix "Fixed persona reference in: $persona/context/PERSONA.md"
                fi
            elif [[ "$REPORT_TYPE" == "detailed" ]]; then
                log_success "Persona reference valid: $persona/context/PERSONA.md"
            fi
        fi
    done
    
    # Validate task files with YAML frontmatter
    find "$TARGET_DIR" -name "*.md" -path "*/tasks/*" ! -path "*/done/*" 2>/dev/null | while read -r task_file; do
        if [[ -f "$task_file" ]]; then
            validate_task_file "$task_file"
        fi
    done
    
    # Check for template substitution completeness
    local unsubstituted_files
    unsubstituted_files=$(find "$TARGET_DIR" -type f -name "*.md" -exec grep -l '\${PROJECT_NAME\|PROJECT_DESCRIPTION\|TECH_STACK}' {} \; 2>/dev/null | wc -l)
    
    if [[ $unsubstituted_files -gt 0 ]]; then
        log_warning "Found $unsubstituted_files files with unsubstituted template variables"
        if [[ "$REPORT_TYPE" == "detailed" ]]; then
            find "$TARGET_DIR" -type f -name "*.md" -exec grep -l '\${PROJECT_NAME\|PROJECT_DESCRIPTION\|TECH_STACK}' {} \; 2>/dev/null | head -3 | while read -r file; do
                log_warning "  - ${file#$TARGET_DIR/}"
            done
        fi
    fi
    
    if [[ $category_errors -eq 0 ]]; then
        log_success "$category: PASSED"
    else
        log_error "$category: FAILED ($category_errors errors)"
    fi
    
    return $category_errors
}

# Fix persona reference
fix_persona_reference() {
    local persona_file="$1"
    local persona_name="$2"
    
    # Create a proper persona reference if the file exists but doesn't have the right reference
    if [[ -f "$persona_file" ]] && [[ -s "$persona_file" ]]; then
        # Add reference if not present
        if ! grep -q "personas/$persona_name/CURRENT.md" "$persona_file"; then
            cat >> "$persona_file" << EOF

## Persona Definition

This persona's current definition is maintained in:
\`../agent-manager/personas/$persona_name/CURRENT.md\`
EOF
        fi
    fi
}

# Validate individual task file
validate_task_file() {
    local task_file="$1"
    local relative_path="${task_file#$TARGET_DIR/}"
    
    # Check for YAML frontmatter
    if [[ -s "$task_file" ]]; then
        local first_line
        first_line=$(head -n 1 "$task_file")
        if [[ "$first_line" != "---" ]]; then
            log_warning "Task file missing YAML frontmatter: $relative_path"
        elif [[ "$REPORT_TYPE" == "detailed" ]]; then
            log_success "Task file has YAML frontmatter: $relative_path"
        fi
    fi
}

# Validate reference consistency
validate_references() {
    local category="Reference Consistency"
    local category_errors=0
    
    if [[ "$REPORT_TYPE" == "detailed" ]] || [[ "$QUIET" == "false" ]]; then
        echo
        echo -e "${BOLD}${category}${NC}"
        echo "================================="
    fi
    
    # Check that all persona CURRENT.md files exist for references
    local personas=("agent-manager" "engineer" "planner" "reviewer")
    
    for persona in "${personas[@]}"; do
        local current_file="$TARGET_DIR/agent-manager/personas/$persona/CURRENT.md"
        if [[ ! -f "$current_file" ]]; then
            log_error "Missing persona definition: agent-manager/personas/$persona/CURRENT.md"
            category_errors=$((category_errors + 1))
        elif [[ "$REPORT_TYPE" == "detailed" ]]; then
            log_success "Persona definition exists: agent-manager/personas/$persona/CURRENT.md"
        fi
    done
    
    # Check for circular dependencies in task files (basic check)
    # This would need more sophisticated implementation for full cycle detection
    local task_files_count=0
    while IFS= read -r -d '' file; do
        ((task_files_count++))
    done < <(find "$TARGET_DIR" -name "*.md" -path "*/tasks/*" ! -path "*/done/*" -print0 2>/dev/null)
    
    if [[ $task_files_count -gt 0 ]]; then
        log_info "Found $task_files_count active task files for dependency analysis"
    fi
    
    if [[ $category_errors -eq 0 ]]; then
        log_success "$category: PASSED"
    else
        log_error "$category: FAILED ($category_errors errors)"
    fi
    
    return $category_errors
}

# Generate final report
generate_report() {
    echo
    echo -e "${BOLD}Validation Summary${NC}"
    echo "================================="
    
    local total_issues=$((ERRORS + WARNINGS))
    
    if [[ $ERRORS -eq 0 && $WARNINGS -eq 0 ]]; then
        echo -e "${GREEN}${CHECK} All validations passed successfully!${NC}"
    else
        if [[ $ERRORS -gt 0 ]]; then
            echo -e "${RED}${CROSS} Validation failed: $ERRORS error(s)${NC}"
        fi
        if [[ $WARNINGS -gt 0 ]]; then
            echo -e "${YELLOW}${WARNING} Validation completed with $WARNINGS warning(s)${NC}"
        fi
    fi
    
    if [[ "$AUTO_FIX" == "true" && $FIXES_APPLIED -gt 0 ]]; then
        echo -e "${CYAN}${FIX} Applied $FIXES_APPLIED automatic fix(es)${NC}"
    fi
    
    echo -e "${BLUE}${INFO} Summary: $ERRORS errors, $WARNINGS warnings${NC}"
    
    if [[ $total_issues -gt 0 ]]; then
        echo
        echo "Recommendations:"
        if [[ $ERRORS -gt 0 ]]; then
            echo "  • Fix structural errors before using the personas framework"
        fi
        if [[ $WARNINGS -gt 0 ]]; then
            echo "  • Review warnings to ensure proper framework integration"
        fi
        if [[ "$AUTO_FIX" == "false" && $FIXES_APPLIED -eq 0 ]]; then
            echo "  • Run with --fix to automatically resolve minor issues"
        fi
    fi
}

# Main execution function
main() {
    if [[ "$QUIET" == "false" ]]; then
        echo -e "${BOLD}Personas Framework Template Validator${NC}"
        echo "====================================="
        echo "Target: $TARGET_DIR"
        echo "Mode: $([ "$AUTO_FIX" == "true" ] && echo "Validation + Auto-fix" || echo "Validation only")"
        echo "Report: $REPORT_TYPE"
    fi
    
    # Run validation categories
    validate_directory_structure
    validate_file_requirements
    validate_content
    validate_references
    
    # Generate final report
    generate_report
    
    # Exit with appropriate code
    if [[ $ERRORS -gt 0 ]]; then
        exit 1
    else
        exit 0
    fi
}

# Parse arguments and run main function
parse_args "$@"
validate_args
main
