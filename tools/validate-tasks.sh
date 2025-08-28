#!/bin/bash

# Personas Framework Task Validator
# Validates task files for proper format and completeness
# Enhanced with YAML frontmatter and schema validation

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Icons
CHECK="✅"
CROSS="❌"
WARNING="⚠️"
INFO="📝"

# Default configuration
TARGET_DIR="$(pwd)"
TASK_FILE=""
VERBOSE="false"
SCHEMA_FILE=""
CHECK_DEPENDENCIES="false"
PERSONA_FILTER=""
REPORT_TYPE="basic"
OUTPUT_FILE=""
MAX_DEPTH="10"

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

# YAML frontmatter validation functions
extract_yaml_frontmatter() {
    local task_file="$1"
    local temp_file
    temp_file=$(mktemp)
    
    # Extract YAML frontmatter between --- markers
    if head -n 1 "$task_file" | grep -q "^---$"; then
        sed -n '/^---$/,/^---$/p' "$task_file" | sed '1d;$d' > "$temp_file"
        echo "$temp_file"
    else
        rm "$temp_file"
        return 1
    fi
}

validate_yaml_syntax() {
    local yaml_file="$1"
    local task_file="$2"
    local filename
    filename=$(basename "$task_file")
    
    # Basic YAML syntax validation using Python if available
    if command -v python3 >/dev/null 2>&1; then
        if python3 -c "import yaml" 2>/dev/null; then
            if ! python3 -c "
import yaml
import sys
try:
    with open('$yaml_file', 'r') as f:
        yaml.safe_load(f)
    sys.exit(0)
except yaml.YAMLError as e:
    print(f'YAML syntax error: {e}')
    sys.exit(1)
except Exception as e:
    print(f'Error reading YAML: {e}')
    sys.exit(1)
" 2>/dev/null; then
                log_error "Invalid YAML frontmatter syntax in: $filename"
                return 1
            fi
        else
            verbose_log "PyYAML not available, using basic YAML validation for: $filename"
            # Basic YAML validation - check for obvious syntax errors
            if ! grep -q "^[a-zA-Z_][a-zA-Z0-9_]*:" "$yaml_file"; then
                log_warning "YAML frontmatter may have syntax issues in: $filename"
            fi
        fi
    else
        verbose_log "Python3 not available, using basic YAML validation for: $filename"
        # Basic YAML validation - check for obvious syntax errors
        if ! grep -q "^[a-zA-Z_][a-zA-Z0-9_]*:" "$yaml_file"; then
            log_warning "YAML frontmatter may have syntax issues in: $filename"
        fi
    fi
    
    return 0
}

validate_task_schema() {
    local yaml_file="$1"
    local task_file="$2"
    local schema_file="$3"
    local filename
    filename=$(basename "$task_file")
    
    verbose_log "Validating schema for: $filename"
    
    # Required fields check
    local required_fields=("id" "priority" "assigned_to" "created_by" "status" "created_date")
    local missing_fields=()
    
    for field in "${required_fields[@]}"; do
        if ! grep -q "^$field:" "$yaml_file" 2>/dev/null; then
            missing_fields+=("$field")
        fi
    done
    
    if [ ${#missing_fields[@]} -gt 0 ]; then
        log_error "Missing required fields in $filename: ${missing_fields[*]}"
        return 1
    fi
    
    # Validate field values
    local errors=0
    
    # Validate priority
    if grep -q "^priority:" "$yaml_file"; then
        local priority_value
        priority_value=$(grep "^priority:" "$yaml_file" | sed 's/priority: *//' | tr -d '"' | tr -d "'")
        if [[ ! "$priority_value" =~ ^(high|medium|low)$ ]]; then
            log_error "Invalid priority value '$priority_value' in $filename (allowed: high, medium, low)"
            errors=$((errors + 1))
        fi
    fi
    
    # Validate assigned_to
    if grep -q "^assigned_to:" "$yaml_file"; then
        local assigned_to
        assigned_to=$(grep "^assigned_to:" "$yaml_file" | sed 's/assigned_to: *//' | tr -d '"' | tr -d "'")
        if [[ ! "$assigned_to" =~ ^(engineer|planner|reviewer|agent-manager)$ ]]; then
            log_error "Invalid assigned_to value '$assigned_to' in $filename (allowed: engineer, planner, reviewer, agent-manager)"
            errors=$((errors + 1))
        fi
    fi
    
    # Validate created_by
    if grep -q "^created_by:" "$yaml_file"; then
        local created_by
        created_by=$(grep "^created_by:" "$yaml_file" | sed 's/created_by: *//' | tr -d '"' | tr -d "'")
        if [[ ! "$created_by" =~ ^(engineer|planner|reviewer|agent-manager)$ ]]; then
            log_error "Invalid created_by value '$created_by' in $filename (allowed: engineer, planner, reviewer, agent-manager)"
            errors=$((errors + 1))
        fi
    fi
    
    # Validate status
    if grep -q "^status:" "$yaml_file"; then
        local status
        status=$(grep "^status:" "$yaml_file" | sed 's/status: *//' | tr -d '"' | tr -d "'")
        if [[ ! "$status" =~ ^(pending|in-progress|review|done)$ ]]; then
            log_error "Invalid status value '$status' in $filename (allowed: pending, in-progress, review, done)"
            errors=$((errors + 1))
        fi
    fi
    
    # Validate date format
    if grep -q "^created_date:" "$yaml_file"; then
        local created_date
        created_date=$(grep "^created_date:" "$yaml_file" | sed 's/created_date: *//' | tr -d '"' | tr -d "'")
        if [[ ! "$created_date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
            log_error "Invalid date format '$created_date' in $filename (should be YYYY-MM-DD)"
            errors=$((errors + 1))
        fi
    fi
    
    # Validate due_date if present
    if grep -q "^due_date:" "$yaml_file"; then
        local due_date
        due_date=$(grep "^due_date:" "$yaml_file" | sed 's/due_date: *//' | tr -d '"' | tr -d "'")
        if [[ ! "$due_date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
            log_error "Invalid due_date format '$due_date' in $filename (should be YYYY-MM-DD)"
            errors=$((errors + 1))
        fi
    fi
    
    # Validate complexity if present
    if grep -q "^complexity:" "$yaml_file"; then
        local complexity
        complexity=$(grep "^complexity:" "$yaml_file" | sed 's/complexity: *//' | tr -d '"' | tr -d "'")
        if [[ ! "$complexity" =~ ^(high|medium|low)$ ]]; then
            log_error "Invalid complexity value '$complexity' in $filename (allowed: high, medium, low)"
            errors=$((errors + 1))
        fi
    fi
    
    # Validate estimated_effort if present
    if grep -q "^estimated_effort:" "$yaml_file"; then
        local effort
        effort=$(grep "^estimated_effort:" "$yaml_file" | sed 's/estimated_effort: *//' | tr -d '"' | tr -d "'")
        if [[ ! "$effort" =~ ^(XS|S|M|L|XL)$ ]]; then
            log_error "Invalid estimated_effort value '$effort' in $filename (allowed: XS, S, M, L, XL)"
            errors=$((errors + 1))
        fi
    fi
    
    return $errors
}

validate_task_dependencies() {
    local yaml_file="$1"
    local task_file="$2"
    local all_tasks_dir="$3"
    local filename
    filename=$(basename "$task_file")
    
    # Extract dependencies array
    if grep -q "^dependencies:" "$yaml_file"; then
        local dependencies_section
        dependencies_section=$(sed -n '/^dependencies:/,/^[a-zA-Z_]/p' "$yaml_file" | head -n -1)
        
        # Extract individual dependency IDs
        local deps
        deps=$(echo "$dependencies_section" | grep "^  -" | sed 's/^  - *//' | tr -d '"' | tr -d "'")
        
        if [ -n "$deps" ]; then
            while IFS= read -r dep_id; do
                if [ -n "$dep_id" ] && [ "$dep_id" != "[]" ]; then
                    # Check if dependency exists
                    local dep_found=false
                    find "$all_tasks_dir" -name "*.md" -type f | while read -r task; do
                        if [ -f "$task" ]; then
                            local temp_yaml
                            if temp_yaml=$(extract_yaml_frontmatter "$task"); then
                                if grep -q "^id: *$dep_id" "$temp_yaml"; then
                                    dep_found=true
                                fi
                                rm -f "$temp_yaml"
                            fi
                        fi
                    done
                    
                    if [ "$dep_found" = false ]; then
                        log_warning "Dependency '$dep_id' not found for task: $filename"
                    fi
                fi
            done <<< "$deps"
        fi
    fi
}

validate_yaml_frontmatter_task() {
    local task_file="$1"
    local schema_file="$2"
    local all_tasks_dir="$3"
    local filename
    filename=$(basename "$task_file")
    
    verbose_log "Checking YAML frontmatter for: $filename"
    
    # Check if file has YAML frontmatter
    if ! head -n 1 "$task_file" | grep -q "^---$"; then
        verbose_log "No YAML frontmatter found in: $filename (legacy format)"
        return 0
    fi
    
    # Extract YAML frontmatter
    local yaml_temp
    if ! yaml_temp=$(extract_yaml_frontmatter "$task_file"); then
        log_error "Failed to extract YAML frontmatter from: $filename"
        return 1
    fi
    
    local validation_errors=0
    
    # Validate YAML syntax
    if ! validate_yaml_syntax "$yaml_temp" "$task_file"; then
        validation_errors=$((validation_errors + 1))
    fi
    
    # Validate against schema
    if ! validate_task_schema "$yaml_temp" "$task_file" "$schema_file"; then
        validation_errors=$((validation_errors + 1))
    fi
    
    # Validate dependencies if requested
    if [ "$CHECK_DEPENDENCIES" = "true" ] && [ -n "$all_tasks_dir" ]; then
        validate_task_dependencies "$yaml_temp" "$task_file" "$all_tasks_dir"
    fi
    
    # Clean up
    rm -f "$yaml_temp"
    
    if [ $validation_errors -eq 0 ]; then
        verbose_log "YAML frontmatter validation passed for: $filename"
    fi
    
    return $validation_errors
}

validate_single_task() {
    local task_file="$1"
    local persona_dir="$2"
    local schema_file="${3:-}"
    local all_tasks_dir="${4:-}"
    
    TASKS_CHECKED=$((TASKS_CHECKED + 1))
    
    # Traditional validation
    validate_task_structure "$task_file"
    validate_task_naming "$task_file"
    validate_task_content "$task_file"
    validate_task_persona_alignment "$task_file" "$persona_dir"
    
    # New YAML frontmatter validation
    if [ -n "$schema_file" ] && [ -f "$schema_file" ]; then
        validate_yaml_frontmatter_task "$task_file" "$schema_file" "$all_tasks_dir"
    else
        # Basic YAML frontmatter check without schema
        validate_yaml_frontmatter_task "$task_file" "" "$all_tasks_dir"
    fi
}

validate_all_tasks() {
    log_info "Scanning for task files..."
    
    # Set default schema file if not provided
    local schema_file="$SCHEMA_FILE"
    if [ -z "$schema_file" ]; then
        schema_file="$TARGET_DIR/schemas/task-schema.yaml"
        if [ ! -f "$schema_file" ]; then
            schema_file="$(dirname "$0")/../schemas/task-schema.yaml"
        fi
    fi
    
    local todo_dirs=(
        ".personas/project/todos/engineer"
        ".personas/project/todos/planner"
        ".personas/project/todos/reviewer"
        ".personas/project/todos/agent-manager"
    )
    
    # Filter by persona if specified
    if [ -n "$PERSONA_FILTER" ]; then
        case "$PERSONA_FILTER" in
            engineer) todo_dirs=(".personas/project/todos/engineer") ;;
            planner) todo_dirs=(".personas/project/todos/planner") ;;
            reviewer) todo_dirs=(".personas/project/todos/reviewer") ;;
            agent-manager) todo_dirs=(".personas/project/todos/agent-manager") ;;
            *) log_warning "Unknown persona filter: $PERSONA_FILTER" ;;
        esac
    fi
    
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
                            validate_single_task "$task_file" "$full_todo_path" "$schema_file" "$TARGET_DIR/.personas"
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
                            validate_single_task "$task_file" "$full_todo_path" "$schema_file" "$TARGET_DIR/.personas"
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
    echo "Enhanced with YAML frontmatter and schema validation"
    echo
    echo "Usage: $0 [OPTIONS] [TARGET_DIR]"
    echo
    echo "Options:"
    echo "  --file FILE          Validate specific task file"
    echo "  --persona PERSONA    Filter validation by persona (engineer|planner|reviewer|agent-manager)"
    echo "  --schema FILE        Path to YAML schema file for validation"
    echo "  --check-dependencies Validate task dependencies and detect circular references"
    echo "  --report TYPE        Report detail level (basic|detailed, default: basic)"
    echo "  --output FILE        Write report to file instead of stdout"
    echo "  --max-depth N        Maximum dependency depth to check (default: 10)"
    echo "  --verbose            Enable verbose output"
    echo "  --help, -h           Show this help message"
    echo
    echo "Arguments:"
    echo "  TARGET_DIR          Directory containing .personas framework (default: current directory)"
    echo
    echo "Examples:"
    echo "  $0                                                      # Validate all tasks in current directory"
    echo "  $0 /path/to/project                                     # Validate all tasks in specific directory"
    echo "  $0 --file task.md                                       # Validate specific task file"
    echo "  $0 --persona engineer --schema schemas/task-schema.yaml # Validate engineer tasks with schema"
    echo "  $0 --check-dependencies --report detailed               # Full validation with dependency checking"
    echo "  $0 --output validation-report.txt --verbose             # Generate detailed report file"
    echo
}

# Parse command line arguments
parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --file)
                TASK_FILE="$2"
                shift 2
                ;;
            --persona)
                PERSONA_FILTER="$2"
                shift 2
                ;;
            --schema)
                SCHEMA_FILE="$2"
                shift 2
                ;;
            --check-dependencies)
                CHECK_DEPENDENCIES="true"
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
            --output)
                OUTPUT_FILE="$2"
                shift 2
                ;;
            --max-depth)
                MAX_DEPTH="$2"
                shift 2
                ;;
            --verbose)
                VERBOSE="true"
                shift
                ;;
            --help|-h)
                print_usage
                exit 0
                ;;
            -*)
                log_error "Unknown option: $1"
                print_usage
                exit 1
                ;;
            *)
                if [[ -z "$TARGET_DIR" ]] || [[ "$TARGET_DIR" == "$(pwd)" ]]; then
                    TARGET_DIR="$1"
                else
                    log_error "Multiple target directories specified"
                    exit 1
                fi
                shift
                ;;
        esac
    done
}

# Main execution
main() {
    echo -e "${GREEN}📋 Personas Framework Task Validator${NC}"
    echo "Enhanced with YAML frontmatter and schema validation"
    echo "Target: $TARGET_DIR"
    if [ -n "$TASK_FILE" ]; then
        echo "Task File: $TASK_FILE"
    else
        echo "Mode: Validate all tasks"
        if [ -n "$PERSONA_FILTER" ]; then
            echo "Persona Filter: $PERSONA_FILTER"
        fi
    fi
    if [ -n "$SCHEMA_FILE" ]; then
        echo "Schema File: $SCHEMA_FILE"
    fi
    echo "Verbose: $VERBOSE"
    echo "Check Dependencies: $CHECK_DEPENDENCIES"
    echo "Report Type: $REPORT_TYPE"
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
    
    # Determine schema file
    local schema_file="$SCHEMA_FILE"
    if [ -z "$schema_file" ]; then
        schema_file="$TARGET_DIR/schemas/task-schema.yaml"
        if [ ! -f "$schema_file" ]; then
            schema_file="$(dirname "$0")/../schemas/task-schema.yaml"
        fi
    fi
    
    if [ -f "$schema_file" ]; then
        log_info "Using schema file: $schema_file"
    else
        log_warning "No schema file found, skipping YAML schema validation"
        schema_file=""
    fi
    
    # Validate specific file or all files
    if [ -n "$TASK_FILE" ]; then
        if [ -f "$TARGET_DIR/$TASK_FILE" ]; then
            validate_single_task "$TARGET_DIR/$TASK_FILE" "" "$schema_file" "$TARGET_DIR/.personas"
        elif [ -f "$TASK_FILE" ]; then
            validate_single_task "$TASK_FILE" "" "$schema_file" "$TARGET_DIR/.personas"
        else
            log_error "Task file not found: $TASK_FILE"
            exit 1
        fi
    else
        validate_all_tasks
    fi
    
    # Generate report and exit with appropriate code
    if [ -n "$OUTPUT_FILE" ]; then
        generate_report > "$OUTPUT_FILE"
        log_info "Report written to: $OUTPUT_FILE"
    else
        generate_report
    fi
    exit $?
}

# Handle command line arguments and run main function
parse_arguments "$@"
main
