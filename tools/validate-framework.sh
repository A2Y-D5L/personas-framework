#!/bin/bash

# Personas Framework Validator
# Validates framework structure and configuration for consistency and completeness

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration
TARGET_DIR="${1:-$(pwd)}"
VERBOSE="${2:-false}"
FIX_ISSUES="${3:-false}"

# Counters
ERRORS=0
WARNINGS=0
FIXED=0

# Helper functions
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
    WARNINGS=$((WARNINGS + 1))
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
    ERRORS=$((ERRORS + 1))
}

log_fixed() {
    echo -e "${GREEN}🔧 Fixed: $1${NC}"
    FIXED=$((FIXED + 1))
}

verbose_log() {
    if [ "$VERBOSE" = "true" ]; then
        echo -e "${BLUE}  → $1${NC}"
    fi
}

# Validation functions
validate_directory_structure() {
    log_info "Validating directory structure..."
    
    local required_dirs=(
        ".personas"
        ".personas/framework"
        ".personas/project"
        ".personas/project/todos"
        ".personas/project/todos/engineer"
        ".personas/project/todos/engineer/current"
        ".personas/project/todos/engineer/backlog"
        ".personas/project/todos/engineer/completed"
        ".personas/project/todos/planner"
        ".personas/project/todos/planner/current"
        ".personas/project/todos/planner/backlog"
        ".personas/project/todos/planner/completed"
        ".personas/project/todos/reviewer"
        ".personas/project/todos/reviewer/current"
        ".personas/project/todos/reviewer/backlog"
        ".personas/project/todos/reviewer/completed"
        ".personas/project/contexts"
        ".personas/project/contexts/engineer"
        ".personas/project/contexts/planner"
        ".personas/project/contexts/reviewer"
        ".personas/framework/personas"
        ".personas/framework/personas/engineer"
        ".personas/framework/personas/planner"
        ".personas/framework/personas/reviewer"
        ".personas/framework/personas/agent-manager"
    )
    
    for dir in "${required_dirs[@]}"; do
        local full_path="$TARGET_DIR/$dir"
        if [ ! -d "$full_path" ]; then
            if [ "$FIX_ISSUES" = "true" ]; then
                mkdir -p "$full_path"
                log_fixed "Created missing directory: $dir"
            else
                log_error "Missing required directory: $dir"
            fi
        else
            verbose_log "Found directory: $dir"
        fi
    done
}

validate_required_files() {
    log_info "Validating required files..."
    
    local required_files=(
        ".personas/framework/PERSONA-FRAMEWORK.md"
        ".personas/framework/personas/engineer/INSTRUCTIONS.md"
        ".personas/framework/personas/engineer/QUICK-START.md"
        ".personas/framework/personas/engineer/CONTEXT-GUIDE.md"
        ".personas/framework/personas/planner/INSTRUCTIONS.md"
        ".personas/framework/personas/planner/QUICK-START.md"
        ".personas/framework/personas/planner/CONTEXT-GUIDE.md"
        ".personas/framework/personas/reviewer/INSTRUCTIONS.md"
        ".personas/framework/personas/reviewer/QUICK-START.md"
        ".personas/framework/personas/reviewer/CONTEXT-GUIDE.md"
        ".personas/framework/personas/agent-manager/INSTRUCTIONS.md"
        ".personas/framework/personas/agent-manager/QUICK-START.md"
        ".personas/framework/personas/agent-manager/CONTEXT-GUIDE.md"
        ".personas/project/README.md"
        ".personas/project/TECH-SPEC.md"
        ".personas/project/STANDARDS.md"
        ".personas/project/DEPENDENCIES.md"
    )
    
    for file in "${required_files[@]}"; do
        local full_path="$TARGET_DIR/$file"
        if [ ! -f "$full_path" ]; then
            if [ "$FIX_ISSUES" = "true" ] && [[ "$file" == *"project/"* ]]; then
                # Create minimal project files if missing
                case "$file" in
                    *.md)
                        local filename
                        filename=$(basename "$file" .md)
                        echo "# $filename" > "$full_path"
                        echo "" >> "$full_path"
                        echo "This file was auto-created by the framework validator." >> "$full_path"
                        echo "Please update it with your project-specific content." >> "$full_path"
                        log_fixed "Created missing file: $file"
                        ;;
                esac
            else
                log_error "Missing required file: $file"
            fi
        else
            verbose_log "Found file: $file"
        fi
    done
}

validate_file_content() {
    log_info "Validating file content..."
    
    # Check that key files have content
    local content_files=(
        ".personas/project/README.md"
        ".personas/project/TECH-SPEC.md"
        ".personas/project/STANDARDS.md"
    )
    
    for file in "${content_files[@]}"; do
        local full_path="$TARGET_DIR/$file"
        if [ -f "$full_path" ]; then
            local line_count
            line_count=$(wc -l < "$full_path" 2>/dev/null || echo 0)
            if [ "$line_count" -lt 3 ]; then
                log_warning "File appears to be empty or minimal: $file"
            else
                verbose_log "File has content: $file ($line_count lines)"
            fi
        fi
    done
}

validate_task_format() {
    log_info "Validating task file format..."
    
    local todo_dirs=(
        ".personas/project/todos/engineer/current"
        ".personas/project/todos/planner/current"
        ".personas/project/todos/reviewer/current"
        ".personas/project/todos/agent-manager/current"
    )
    
    local task_count=0
    local malformed_tasks=0
    
    for dir in "${todo_dirs[@]}"; do
        local full_path="$TARGET_DIR/$dir"
        if [ -d "$full_path" ]; then
            for task_file in "$full_path"/*.md; do
                if [ -f "$task_file" ] && [ "$(basename "$task_file")" != ".gitkeep" ]; then
                    task_count=$((task_count + 1))
                    
                    # Check basic task structure
                    if ! grep -q "^#.*" "$task_file" 2>/dev/null; then
                        log_warning "Task file missing title: $(basename "$task_file")"
                        malformed_tasks=$((malformed_tasks + 1))
                    fi
                    
                    if ! grep -q "Priority:" "$task_file" 2>/dev/null; then
                        log_warning "Task file missing priority: $(basename "$task_file")"
                        malformed_tasks=$((malformed_tasks + 1))
                    fi
                    
                    verbose_log "Validated task: $(basename "$task_file")"
                fi
            done
        fi
    done
    
    log_info "Found $task_count task files, $malformed_tasks with formatting issues"
}

validate_consistency() {
    log_info "Validating framework consistency..."
    
    # Check for consistent naming patterns
    local current_dirs=(
        ".personas/project/todos/engineer/current"
        ".personas/project/todos/planner/current"
        ".personas/project/todos/reviewer/current"
    )
    
    for dir in "${current_dirs[@]}"; do
        local full_path="$TARGET_DIR/$dir"
        if [ -d "$full_path" ]; then
            for file in "$full_path"/*.md; do
                if [ -f "$file" ] && [[ "$(basename "$file")" != *.gitkeep ]]; then
                    local filename
                    filename=$(basename "$file")
                    # Check for date prefix format (YYYY-MM-DD-)
                    if [[ ! "$filename" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-.* ]] && [[ "$filename" != "README.md" ]]; then
                        log_warning "Task file doesn't follow naming convention (YYYY-MM-DD-description.md): $filename"
                    fi
                fi
            done
        fi
    done
}

validate_permissions() {
    log_info "Validating file permissions..."
    
    # Check that directories are readable and writable
    local check_dirs=(
        ".personas/project/todos/engineer/current"
        ".personas/project/todos/planner/current"
        ".personas/project/todos/reviewer/current"
    )
    
    for dir in "${check_dirs[@]}"; do
        local full_path="$TARGET_DIR/$dir"
        if [ -d "$full_path" ]; then
            if [ ! -w "$full_path" ]; then
                log_error "Directory not writable: $dir"
            elif [ ! -r "$full_path" ]; then
                log_error "Directory not readable: $dir"
            else
                verbose_log "Directory permissions OK: $dir"
            fi
        fi
    done
}

generate_report() {
    echo
    echo -e "${BLUE}📊 Validation Report${NC}"
    echo "=================================="
    echo "Target: $TARGET_DIR"
    echo "Errors: $ERRORS"
    echo "Warnings: $WARNINGS"
    if [ "$FIX_ISSUES" = "true" ]; then
        echo "Fixed: $FIXED"
    fi
    echo
    
    if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
        log_success "Framework validation passed with no issues!"
        return 0
    elif [ $ERRORS -eq 0 ]; then
        log_warning "Framework validation passed with $WARNINGS warnings"
        return 0
    else
        log_error "Framework validation failed with $ERRORS errors and $WARNINGS warnings"
        return 1
    fi
}

print_usage() {
    echo "Personas Framework Validator"
    echo
    echo "Usage: $0 [TARGET_DIR] [VERBOSE] [FIX_ISSUES]"
    echo
    echo "Arguments:"
    echo "  TARGET_DIR    Directory to validate (default: current directory)"
    echo "  VERBOSE       Enable verbose output (true/false, default: false)"
    echo "  FIX_ISSUES    Attempt to fix issues automatically (true/false, default: false)"
    echo
    echo "Examples:"
    echo "  $0                          # Validate current directory"
    echo "  $0 /path/to/project         # Validate specific directory"
    echo "  $0 /path/to/project true    # Validate with verbose output"
    echo "  $0 /path/to/project true true  # Validate and fix issues"
    echo
}

# Main execution
main() {
    echo -e "${GREEN}🔍 Personas Framework Validator${NC}"
    echo "Target: $TARGET_DIR"
    echo "Verbose: $VERBOSE"
    echo "Fix Issues: $FIX_ISSUES"
    echo
    
    # Check if target directory exists
    if [ ! -d "$TARGET_DIR" ]; then
        log_error "Target directory does not exist: $TARGET_DIR"
        exit 1
    fi
    
    # Check if it looks like a personas framework installation
    if [ ! -d "$TARGET_DIR/.personas" ]; then
        log_error "Directory does not appear to contain a Personas Framework installation"
        log_info "Expected to find .personas directory in: $TARGET_DIR"
        exit 1
    fi
    
    # Run validation checks
    validate_directory_structure
    validate_required_files
    validate_file_content
    validate_task_format
    validate_consistency
    validate_permissions
    
    # Generate report and exit with appropriate code
    generate_report
    exit $?
}

# Handle command line arguments
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    print_usage
    exit 0
fi

# Run main function
main
