#!/bin/bash

# Personas Framework Task Validator
# Validates task files for proper format and completeness

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration
TARGET_DIR="${1:-$(pwd)}"
TASK_FILE="${2:-}"
VERBOSE="${3:-false}"

# Counters
ERRORS=0
WARNINGS=0
TASKS_CHECKED=0

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

verbose_log() {
    if [ "$VERBOSE" = "true" ]; then
        echo -e "${BLUE}  → $1${NC}"
    fi
}

# Task validation functions
validate_task_structure() {
    local task_file="$1"
    local filename=$(basename "$task_file")
    
    verbose_log "Validating structure of: $filename"
    
    # Check if file exists and is readable
    if [ ! -f "$task_file" ] || [ ! -r "$task_file" ]; then
        log_error "Task file not readable: $filename"
        return 1
    fi
    
    # Required sections for task files
    local required_sections=(
        "^#.*"  # Title (any level header)
        "Priority:"
        "Objective"
        "Acceptance Criteria"
    )
    
    for section in "${required_sections[@]}"; do
        if ! grep -q "$section" "$task_file" 2>/dev/null; then
            log_warning "Missing required section '$section' in: $filename"
        fi
    done
    
    # Check for proper markdown structure
    if ! grep -q "^#" "$task_file" 2>/dev/null; then
        log_error "Task file missing title header in: $filename"
    fi
    
    # Check for checkboxes in acceptance criteria
    if grep -q "Acceptance Criteria" "$task_file" 2>/dev/null; then
        if ! grep -A 10 "Acceptance Criteria" "$task_file" | grep -q "- \[ \]" 2>/dev/null; then
            log_warning "Acceptance criteria section should contain checkboxes in: $filename"
        fi
    fi
}

validate_task_naming() {
    local task_file="$1"
    local filename=$(basename "$task_file")
    
    # Skip README files and gitkeep
    if [[ "$filename" == "README.md" ]] || [[ "$filename" == ".gitkeep" ]]; then
        return 0
    fi
    
    # Check for proper date format (YYYY-MM-DD-)
    if [[ ! "$filename" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-.* ]]; then
        log_warning "Task file doesn't follow naming convention (YYYY-MM-DD-description.md): $filename"
    fi
    
    # Check for meaningful description
    local description_part="${filename#????-??-??-}"
    description_part="${description_part%.md}"
    if [ ${#description_part} -lt 5 ]; then
        log_warning "Task filename should have more descriptive name: $filename"
    fi
}

validate_task_content() {
    local task_file="$1"
    local filename=$(basename "$task_file")
    
    verbose_log "Validating content of: $filename"
    
    # Check file size (too small might be empty/incomplete)
    local file_size=$(wc -c < "$task_file" 2>/dev/null || echo 0)
    if [ "$file_size" -lt 100 ]; then
        log_warning "Task file appears to be very small/empty: $filename"
    fi
    
    # Check for placeholder text that should be replaced
    local placeholders=(
        "TODO"
        "FIXME"
        "\[.*\]"
        "Add.*here"
    )
    
    for placeholder in "${placeholders[@]}"; do
        if grep -q "$placeholder" "$task_file" 2>/dev/null; then
            log_warning "Task file contains placeholder text: $filename"
            break
        fi
    done
    
    # Check for proper priority values
    if grep -q "Priority:" "$task_file" 2>/dev/null; then
        if ! grep -E "Priority:\s*(HIGH|MEDIUM|LOW|Critical|High|Medium|Low)" "$task_file" >/dev/null 2>&1; then
            log_warning "Task priority should be HIGH/MEDIUM/LOW: $filename"
        fi
    fi
    
    # Check for completion checkboxes
    local checkbox_count=$(grep -c "- \[ \]" "$task_file" 2>/dev/null || echo 0)
    local checked_count=$(grep -c "- \[x\]" "$task_file" 2>/dev/null || echo 0)
    
    if [ "$checkbox_count" -eq 0 ] && [ "$checked_count" -eq 0 ]; then
        log_warning "Task file has no progress checkboxes: $filename"
    fi
}

validate_task_persona_alignment() {
    local task_file="$1"
    local persona_dir="$2"
    local filename=$(basename "$task_file")
    
    # Extract persona type from directory path
    local persona=""
    case "$persona_dir" in
        *engineer*) persona="engineer" ;;
        *planner*) persona="planner" ;;
        *reviewer*) persona="reviewer" ;;
        *agent-manager*) persona="agent-manager" ;;
    esac
    
    if [ -n "$persona" ]; then
        verbose_log "Checking $persona persona alignment for: $filename"
        
        # Define persona-specific keywords
        case "$persona" in
            engineer)
                local good_keywords=("implement" "code" "debug" "test" "fix" "optimize" "API" "performance")
                local bad_keywords=("design" "architecture" "plan" "review" "assess")
                ;;
            planner)
                local good_keywords=("design" "architecture" "plan" "roadmap" "strategy" "analysis")
                local bad_keywords=("implement" "code" "debug" "fix")
                ;;
            reviewer)
                local good_keywords=("review" "assess" "validate" "analyze" "audit" "quality")
                local bad_keywords=("implement" "design" "plan")
                ;;
            agent-manager)
                local good_keywords=("coordinate" "manage" "document" "organize" "framework")
                local bad_keywords=("implement" "code" "debug")
                ;;
        esac
        
        # Check for appropriate keywords
        local has_good_keywords=false
        for keyword in "${good_keywords[@]}"; do
            if grep -qi "$keyword" "$task_file" 2>/dev/null; then
                has_good_keywords=true
                break
            fi
        done
        
        if [ "$has_good_keywords" = false ]; then
            log_warning "Task might not align with $persona persona responsibilities: $filename"
        fi
        
        # Check for inappropriate keywords
        for keyword in "${bad_keywords[@]}"; do
            if grep -qi "$keyword" "$task_file" 2>/dev/null; then
                log_warning "Task contains keywords that might be better suited for other personas: $filename"
                break
            fi
        done
    fi
}

validate_single_task() {
    local task_file="$1"
    local persona_dir="$2"
    
    TASKS_CHECKED=$((TASKS_CHECKED + 1))
    
    validate_task_structure "$task_file"
    validate_task_naming "$task_file"
    validate_task_content "$task_file"
    validate_task_persona_alignment "$task_file" "$persona_dir"
}

validate_all_tasks() {
    log_info "Scanning for task files..."
    
    local todo_dirs=(
        ".personas/project/todos/engineer"
        ".personas/project/todos/planner"
        ".personas/project/todos/reviewer"
        ".personas/project/todos/agent-manager"
    )
    
    for todo_dir in "${todo_dirs[@]}"; do
        local full_todo_path="$TARGET_DIR/$todo_dir"
        if [ -d "$full_todo_path" ]; then
            verbose_log "Checking todo directory: $todo_dir"
            
            # Check current, backlog, and completed subdirectories
            for subdir in "current" "backlog" "completed"; do
                local subdir_path="$full_todo_path/$subdir"
                if [ -d "$subdir_path" ]; then
                    for task_file in "$subdir_path"/*.md; do
                        if [ -f "$task_file" ]; then
                            validate_single_task "$task_file" "$full_todo_path"
                        fi
                    done
                fi
            done
            
            # Also check coordination directory for agent-manager
            if [[ "$todo_dir" == *"agent-manager"* ]]; then
                local coord_path="$full_todo_path/coordination"
                if [ -d "$coord_path" ]; then
                    for task_file in "$coord_path"/*.md; do
                        if [ -f "$task_file" ]; then
                            validate_single_task "$task_file" "$full_todo_path"
                        fi
                    done
                fi
            fi
        fi
    done
}

generate_report() {
    echo
    echo -e "${BLUE}📋 Task Validation Report${NC}"
    echo "=================================="
    echo "Target: $TARGET_DIR"
    echo "Tasks checked: $TASKS_CHECKED"
    echo "Errors: $ERRORS"
    echo "Warnings: $WARNINGS"
    echo
    
    if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
        log_success "All tasks are properly formatted!"
        return 0
    elif [ $ERRORS -eq 0 ]; then
        log_warning "Task validation completed with $WARNINGS warnings"
        return 0
    else
        log_error "Task validation failed with $ERRORS errors and $WARNINGS warnings"
        return 1
    fi
}

print_usage() {
    echo "Personas Framework Task Validator"
    echo
    echo "Usage: $0 [TARGET_DIR] [TASK_FILE] [VERBOSE]"
    echo
    echo "Arguments:"
    echo "  TARGET_DIR    Directory containing .personas framework (default: current directory)"
    echo "  TASK_FILE     Specific task file to validate (optional, validates all if not specified)"
    echo "  VERBOSE       Enable verbose output (true/false, default: false)"
    echo
    echo "Examples:"
    echo "  $0                                    # Validate all tasks in current directory"
    echo "  $0 /path/to/project                   # Validate all tasks in specific directory"
    echo "  $0 . task.md                         # Validate specific task file"
    echo "  $0 /path/to/project task.md true     # Validate specific task with verbose output"
    echo
}

# Main execution
main() {
    echo -e "${GREEN}📋 Personas Framework Task Validator${NC}"
    echo "Target: $TARGET_DIR"
    if [ -n "$TASK_FILE" ]; then
        echo "Task File: $TASK_FILE"
    else
        echo "Mode: Validate all tasks"
    fi
    echo "Verbose: $VERBOSE"
    echo
    
    # Check if target directory exists
    if [ ! -d "$TARGET_DIR" ]; then
        log_error "Target directory does not exist: $TARGET_DIR"
        exit 1
    fi
    
    # Check if it looks like a personas framework installation
    if [ ! -d "$TARGET_DIR/.personas" ]; then
        log_error "Directory does not appear to contain a Personas Framework installation"
        exit 1
    fi
    
    # Validate specific file or all files
    if [ -n "$TASK_FILE" ]; then
        if [ -f "$TARGET_DIR/$TASK_FILE" ]; then
            validate_single_task "$TARGET_DIR/$TASK_FILE" ""
        elif [ -f "$TASK_FILE" ]; then
            validate_single_task "$TASK_FILE" ""
        else
            log_error "Task file not found: $TASK_FILE"
            exit 1
        fi
    else
        validate_all_tasks
    fi
    
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
