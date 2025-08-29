#!/bin/bash
# Personas Framework Template Generator
# 
# Usage: generate.sh --target TARGET_DIR --project-name NAME [OPTIONS]
#
# Required Arguments:
#   --target         Target directory for .personas generation
#   --project-name   Name of the project
#
# Optional Arguments:
#   --description    Project description
#   --tech-stack     Technology stack description
#   --config         Custom config file (default: template/config.yaml)
#   --force          Overwrite existing .personas directory
#   --validate-only  Only validate without generating
#
# Examples:
#   ./generate.sh --target ./my-project --project-name "My Project"
#   ./generate.sh --target /path/to/project --project-name "API Server" --tech-stack "Go, PostgreSQL"

set -euo pipefail

# Script directory and template paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$(cd "$(dirname "$SCRIPT_DIR")" && pwd)"
PERSONAS_TEMPLATE_DIR="$TEMPLATE_DIR/.personas"
DEFAULT_CONFIG="$TEMPLATE_DIR/config.yaml"

# Default values
TARGET_DIR=""
PROJECT_NAME=""
PROJECT_DESCRIPTION=""
TECH_STACK=""
CONFIG_FILE="$DEFAULT_CONFIG"
FORCE_OVERWRITE=false
VALIDATE_ONLY=false

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

# Usage function
usage() {
    cat << EOF
Personas Framework Template Generator

Usage: $0 --target TARGET_DIR --project-name NAME [OPTIONS]

Required Arguments:
  --target         Target directory for .personas generation
  --project-name   Name of the project

Optional Arguments:
  --description    Project description
  --tech-stack     Technology stack description
  --config         Custom config file (default: template/config.yaml)
  --force          Overwrite existing .personas directory
  --validate-only  Only validate without generating
  --help           Show this help message

Examples:
  $0 --target ./my-project --project-name "My Project"
  $0 --target /path/to/project --project-name "API Server" --tech-stack "Go, PostgreSQL"
  $0 --target ./app --project-name "Web App" --description "React application" --force
EOF
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --target)
                TARGET_DIR="$2"
                shift 2
                ;;
            --project-name)
                PROJECT_NAME="$2"
                shift 2
                ;;
            --description)
                PROJECT_DESCRIPTION="$2"
                shift 2
                ;;
            --tech-stack)
                TECH_STACK="$2"
                shift 2
                ;;
            --config)
                CONFIG_FILE="$2"
                shift 2
                ;;
            --force)
                FORCE_OVERWRITE=true
                shift
                ;;
            --validate-only)
                VALIDATE_ONLY=true
                shift
                ;;
            --help|-h)
                usage
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done
}

# Validate arguments
validate_args() {
    local errors=0

    if [[ -z "$TARGET_DIR" ]]; then
        log_error "Missing required argument: --target"
        errors=$((errors + 1))
    fi

    # Only require project-name if not doing validation-only
    if [[ "$VALIDATE_ONLY" == "false" && -z "$PROJECT_NAME" ]]; then
        log_error "Missing required argument: --project-name"
        errors=$((errors + 1))
    fi

    # Only check template directory if not doing validation-only
    if [[ "$VALIDATE_ONLY" == "false" && ! -d "$PERSONAS_TEMPLATE_DIR" ]]; then
        log_error "Template directory not found: $PERSONAS_TEMPLATE_DIR"
        errors=$((errors + 1))
    fi

    # Only check config file if not doing validation-only
    if [[ "$VALIDATE_ONLY" == "false" && ! -f "$CONFIG_FILE" ]]; then
        log_error "Config file not found: $CONFIG_FILE"
        errors=$((errors + 1))
    fi

    if [[ $errors -gt 0 ]]; then
        log_error "Validation failed with $errors error(s)"
        usage
        exit 1
    fi
}

# Normalize paths to absolute paths
normalize_paths() {
    # Convert TARGET_DIR to absolute path
    if [[ "$TARGET_DIR" == "." ]]; then
        TARGET_DIR="$(pwd)"
    elif [[ ! "$TARGET_DIR" == /* ]]; then
        TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd)" || TARGET_DIR="$(pwd)/$TARGET_DIR"
    fi
    
    # Ensure PERSONAS_TEMPLATE_DIR is absolute (should already be from earlier fix)
    PERSONAS_TEMPLATE_DIR="$(cd "$PERSONAS_TEMPLATE_DIR" && pwd)"
}

# Load configuration from YAML (simple parsing)
load_config() {
    if [[ -f "$CONFIG_FILE" ]]; then
        log_info "Loading configuration from: $CONFIG_FILE"
        
        # Extract default values from config if not provided
        if [[ -z "$PROJECT_DESCRIPTION" ]]; then
            PROJECT_DESCRIPTION=$(grep "^project_description:" "$CONFIG_FILE" | sed 's/^project_description: *"\?\([^"]*\)"\?/\1/' || echo "")
        fi
        
        if [[ -z "$TECH_STACK" ]]; then
            TECH_STACK=$(grep "^tech_stack:" "$CONFIG_FILE" | sed 's/^tech_stack: *"\?\([^"]*\)"\?/\1/' || echo "")
        fi
    fi
    
    # Set defaults if still empty
    PROJECT_DESCRIPTION="${PROJECT_DESCRIPTION:-A project using the personas framework}"
    TECH_STACK="${TECH_STACK:-Various technologies}"
}

# Check for existing .personas directory
check_existing() {
    local target_personas="$TARGET_DIR/.personas"
    
    if [[ -d "$target_personas" ]]; then
        if [[ "$FORCE_OVERWRITE" == "true" ]]; then
            log_warning "Overwriting existing .personas directory"
            rm -rf "$target_personas"
        else
            log_error ".personas directory already exists at: $target_personas"
            log_error "Use --force to overwrite"
            exit 1
        fi
    fi
}

# Variable substitution function
substitute_variables() {
    local file_path="$1"
    local temp_file
    temp_file=$(mktemp)
    
    # Get current timestamp
    local current_date
    current_date=$(date -u +"%Y-%m-%d")
    
    # Perform substitutions
    sed -e "s/\${PROJECT_NAME}/$PROJECT_NAME/g" \
        -e "s/\${PROJECT_DESCRIPTION}/$PROJECT_DESCRIPTION/g" \
        -e "s/\${TECH_STACK}/$TECH_STACK/g" \
        -e "s/\$(date)/$current_date/g" \
        "$file_path" > "$temp_file"
    
    echo "$temp_file"
}

# Process template files
process_templates() {
    local target_personas="$TARGET_DIR/.personas"
    
    log_info "Creating target directory: $target_personas"
    mkdir -p "$target_personas"
    
    log_info "Processing template files..."
    
    # Find all template files
    find "$PERSONAS_TEMPLATE_DIR" -name "*.template" | while read -r template_file; do
        # Calculate relative path
        local rel_path="${template_file#$PERSONAS_TEMPLATE_DIR/}"
        local target_file="$target_personas/${rel_path%.template}"
        
        log_info "Processing: $rel_path"
        
        # Create target directory
        mkdir -p "$(dirname "$target_file")"
        
        # Substitute variables and copy
        local temp_file
        temp_file=$(substitute_variables "$template_file")
        cp "$temp_file" "$target_file"
        rm "$temp_file"
    done
    
    # Copy non-template files
    find "$PERSONAS_TEMPLATE_DIR" -type f ! -name "*.template" | while read -r source_file; do
        local rel_path="${source_file#$PERSONAS_TEMPLATE_DIR/}"
        local target_file="$target_personas/$rel_path"
        
        log_info "Copying: $rel_path"
        
        mkdir -p "$(dirname "$target_file")"
        cp "$source_file" "$target_file"
    done
    
    # Copy directory structure (empty directories)
    find "$PERSONAS_TEMPLATE_DIR" -type d | while read -r source_dir; do
        local rel_path="${source_dir#$PERSONAS_TEMPLATE_DIR/}"
        if [[ -n "$rel_path" ]]; then
            local target_dir="$target_personas/$rel_path"
            mkdir -p "$target_dir"
        fi
    done
}

# Validation checks
validate_generated_structure() {
    local target_personas="$TARGET_DIR/.personas"
    local errors=0
    
    log_info "Validating generated structure..."
    
    # Check required directories
    local required_dirs=(
        "agent-manager/personas/agent-manager"
        "agent-manager/personas/engineer" 
        "agent-manager/personas/planner"
        "agent-manager/personas/reviewer"
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
        if [[ ! -d "$target_personas/$dir" ]]; then
            log_error "Missing required directory: $dir"
            errors=$((errors + 1))
        fi
    done
    
    # Check required files
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
        if [[ ! -f "$target_personas/$file" ]]; then
            log_error "Missing required file: $file"
            errors=$((errors + 1))
        elif [[ ! -s "$target_personas/$file" ]]; then
            log_error "Empty required file: $file"
            errors=$((errors + 1))
        fi
    done
    
    # Check no .template files remain
    local template_files
    template_files=$(find "$target_personas" -name "*.template" 2>/dev/null | wc -l)
    if [[ $template_files -gt 0 ]]; then
        log_error "Found $template_files unprocessed .template files"
        errors=$((errors + 1))
    fi
    
    # Check for variable substitution completeness (excluding shell variables)
    local unsubstituted
    unsubstituted=$(find "$target_personas" -type f -exec grep -l '\${PROJECT_NAME\|PROJECT_DESCRIPTION\|TECH_STACK\|PERSONA_NAME}' {} \; 2>/dev/null | wc -l)
    if [[ $unsubstituted -gt 0 ]]; then
        log_warning "Found $unsubstituted files with unsubstituted template variables"
        find "$target_personas" -type f -exec grep -l '\${PROJECT_NAME\|PROJECT_DESCRIPTION\|TECH_STACK\|PERSONA_NAME}' {} \; 2>/dev/null | head -5 | while read -r file; do
            log_warning "  - $file"
        done
    fi
    
    if [[ $errors -gt 0 ]]; then
        log_error "Validation failed with $errors error(s)"
        return 1
    else
        log_success "Validation passed"
        return 0
    fi
}

# Set proper permissions
set_permissions() {
    local target_personas="$TARGET_DIR/.personas"
    
    log_info "Setting permissions..."
    
    # Set directory permissions
    find "$target_personas" -type d -exec chmod 755 {} \;
    
    # Set file permissions
    find "$target_personas" -type f -exec chmod 644 {} \;
    
    log_success "Permissions set"
}

# Main execution function
main() {
    log_info "Personas Framework Template Generator"
    log_info "===================================="
    
    parse_args "$@"
    validate_args
    normalize_paths
    load_config
    
    log_info "Configuration:"
    log_info "  Target Directory: $TARGET_DIR"
    log_info "  Project Name: $PROJECT_NAME"
    log_info "  Project Description: $PROJECT_DESCRIPTION"
    log_info "  Tech Stack: $TECH_STACK"
    log_info "  Config File: $CONFIG_FILE"
    log_info "  Force Overwrite: $FORCE_OVERWRITE"
    log_info "  Validate Only: $VALIDATE_ONLY"
    echo
    
    if [[ "$VALIDATE_ONLY" == "true" ]]; then
        if [[ -d "$TARGET_DIR/.personas" ]]; then
            validate_generated_structure
            exit $?
        else
            log_error "No .personas directory found for validation at: $TARGET_DIR/.personas"
            exit 1
        fi
    fi
    
    check_existing
    process_templates
    set_permissions
    
    if validate_generated_structure; then
        echo
        log_success "Template generation completed successfully!"
        log_success "Generated .personas directory at: $TARGET_DIR/.personas"
        log_info "Next steps:"
        log_info "  1. Review the generated structure"
        log_info "  2. Customize project-specific content"
        log_info "  3. Begin using the personas framework"
    else
        log_error "Template generation completed with validation errors"
        exit 1
    fi
}

# Run main function with all arguments
main "$@"
