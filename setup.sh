#!/bin/bash

# Personas Framework Enhanced Setup Script
# This script sets up the Personas Framework in a new project with validation and customization

set -e

# Color codes for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
FRAMEWORK_DIR="$(dirname "$0")"
PROJECT_ROOT="${1:-$(pwd)}"
INTERACTIVE="${2:-true}"

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

prompt_user() {
    local prompt="$1"
    local default="$2"
    local response
    
    if [ "$INTERACTIVE" = "false" ]; then
        echo "$default"
        return
    fi
    
    echo -ne "${YELLOW}$prompt${NC}"
    if [ -n "$default" ]; then
        echo -ne " ${BLUE}(default: $default)${NC}"
    fi
    echo -ne ": "
    read -r response
    echo "${response:-$default}"
}

validate_environment() {
    log_info "Validating environment..."
    
    # Check if we're in the right directory
    if [ ! -f "$FRAMEWORK_DIR/README.md" ]; then
        log_error "This script must be run from the personas-framework directory"
        exit 1
    fi
    
    # Check if framework directory exists
    if [ ! -d "$FRAMEWORK_DIR/framework" ]; then
        log_error "Framework directory not found"
        exit 1
    fi
    
    # Check if target directory is valid
    if [ ! -d "$PROJECT_ROOT" ]; then
        log_error "Target directory does not exist: $PROJECT_ROOT"
        exit 1
    fi
    
    # Warn if .personas already exists
    if [ -d "$PROJECT_ROOT/.personas" ]; then
        log_warning ".personas directory already exists in target location"
        local overwrite
        overwrite=$(prompt_user "Overwrite existing installation? (y/N)" "n")
        if [[ ! "$overwrite" =~ ^[Yy]$ ]]; then
            log_info "Setup cancelled by user"
            exit 0
        fi
    fi
    
    log_success "Environment validation complete"
}

collect_project_info() {
    if [ "$INTERACTIVE" = "true" ]; then
        log_info "Collecting project information for customization..."
        echo
        
        PROJECT_NAME=$(prompt_user "Project name" "$(basename "$PROJECT_ROOT")")
        PROJECT_LANGUAGE=$(prompt_user "Primary programming language" "Unknown")
        PROJECT_DOMAIN=$(prompt_user "Project domain/type (e.g., web-api, cli-tool, library)" "Unknown")
        PROJECT_DESCRIPTION=$(prompt_user "Brief project description" "A project using the Personas Framework")
        
        echo
        log_info "Project configuration:"
        echo "  Name: $PROJECT_NAME"
        echo "  Language: $PROJECT_LANGUAGE"
        echo "  Domain: $PROJECT_DOMAIN"
        echo "  Description: $PROJECT_DESCRIPTION"
        echo
        
        echo
        local confirm
        confirm=$(prompt_user "Proceed with this configuration? (Y/n)" "y")
        if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
            log_info "Setup cancelled by user"
            exit 0
        fi
    else
        PROJECT_NAME="$(basename "$PROJECT_ROOT")"
        PROJECT_LANGUAGE="Unknown"
        PROJECT_DOMAIN="Unknown"
        PROJECT_DESCRIPTION="A project using the Personas Framework"
    fi
}

create_directory_structure() {
    log_info "Creating directory structure..."
    
    # Create main directories
    mkdir -p "$PROJECT_ROOT/.personas/framework"
    mkdir -p "$PROJECT_ROOT/.personas/project"
    
    # Create specific subdirectories
    mkdir -p "$PROJECT_ROOT/.personas/project/contexts/engineer"
    mkdir -p "$PROJECT_ROOT/.personas/project/contexts/planner"
    mkdir -p "$PROJECT_ROOT/.personas/project/contexts/reviewer"
    mkdir -p "$PROJECT_ROOT/.personas/project/todos/engineer/"{current,backlog,completed}
    mkdir -p "$PROJECT_ROOT/.personas/project/todos/planner/"{current,backlog,completed}
    mkdir -p "$PROJECT_ROOT/.personas/project/todos/reviewer/"{current,backlog,completed}
    
    log_success "Directory structure created"
}

copy_framework_files() {
    log_info "Copying framework files..."
    
    # Copy framework core
    cp -r "$FRAMEWORK_DIR/framework/"* "$PROJECT_ROOT/.personas/framework/"
    
    # Copy project template
    cp -r "$FRAMEWORK_DIR/framework/project-template/"* "$PROJECT_ROOT/.personas/project/"
    
    log_success "Framework files copied"
}

customize_project_files() {
    log_info "Customizing project files..."
    
    # Customize README.md
    if [ -f "$PROJECT_ROOT/.personas/project/README.md" ]; then
        sed -i.bak "s/\[Project Name\]/$PROJECT_NAME/g" "$PROJECT_ROOT/.personas/project/README.md"
        sed -i.bak "s/\[Programming Language\]/$PROJECT_LANGUAGE/g" "$PROJECT_ROOT/.personas/project/README.md"
        sed -i.bak "s/\[Project Domain\]/$PROJECT_DOMAIN/g" "$PROJECT_ROOT/.personas/project/README.md"
        sed -i.bak "s/\[Date\]/$(date +%Y-%m-%d)/g" "$PROJECT_ROOT/.personas/project/README.md"
        rm -f "$PROJECT_ROOT/.personas/project/README.md.bak"
    fi
    
    # Create initial TECH-SPEC.md with project info
    cat > "$PROJECT_ROOT/.personas/project/TECH-SPEC.md" << EOF
# $PROJECT_NAME Technical Specifications

**Project:** $PROJECT_NAME  
**Language:** $PROJECT_LANGUAGE  
**Domain:** $PROJECT_DOMAIN  
**Updated:** $(date +"%B %d, %Y")

## Overview

$PROJECT_DESCRIPTION

## Architecture

[Add your architecture overview here]

## API Specifications

[Add your API specifications here]

## Performance Requirements

[Add your performance requirements here]

## Integration Points

[Add your integration requirements here]

## Development Guidelines

[Add your development guidelines here]

---

**Customization Note:** This file was auto-generated by the Personas Framework setup.
Please update it with your specific technical requirements.
EOF
    
    # Create initial STANDARDS.md
    cat > "$PROJECT_ROOT/.personas/project/STANDARDS.md" << EOF
# $PROJECT_NAME Development Standards

**Project:** $PROJECT_NAME  
**Language:** $PROJECT_LANGUAGE  
**Updated:** $(date +"%B %d, %Y")

## Code Style

[Add your code style guidelines here]

## Testing Standards

[Add your testing requirements here]

## Documentation Requirements

[Add your documentation standards here]

## Quality Criteria

[Add your quality criteria here]

---

**Customization Note:** This file was auto-generated by the Personas Framework setup.
Please update it with your specific development standards.
EOF
    
    log_success "Project files customized"
}

create_directory_placeholders() {
    log_info "Creating directory placeholders..."
    
    # Create .gitkeep files to preserve directory structure
    find "$PROJECT_ROOT/.personas/project/todos" -type d -name "current" -exec touch {}/.gitkeep \;
    find "$PROJECT_ROOT/.personas/project/todos" -type d -name "backlog" -exec touch {}/.gitkeep \;
    find "$PROJECT_ROOT/.personas/project/todos" -type d -name "completed" -exec touch {}/.gitkeep \;
    find "$PROJECT_ROOT/.personas/project/contexts" -type d -exec touch {}/.gitkeep \;
    
    log_success "Directory placeholders created"
}

validate_installation() {
    log_info "Validating installation..."
    
    local errors=0
    
    # Check required directories
    local required_dirs=(
        ".personas/framework"
        ".personas/project"
        ".personas/project/todos/engineer/current"
        ".personas/project/todos/planner/current"
        ".personas/project/todos/reviewer/current"
        ".personas/project/contexts/engineer"
        ".personas/project/contexts/planner"
        ".personas/project/contexts/reviewer"
    )
    
    for dir in "${required_dirs[@]}"; do
        if [ ! -d "$PROJECT_ROOT/$dir" ]; then
            log_error "Missing directory: $dir"
            errors=$((errors + 1))
        fi
    done
    
    # Check required files
    local required_files=(
        ".personas/project/README.md"
        ".personas/project/TECH-SPEC.md"
        ".personas/project/STANDARDS.md"
        ".personas/framework/PERSONA-FRAMEWORK.md"
    )
    
    for file in "${required_files[@]}"; do
        if [ ! -f "$PROJECT_ROOT/$file" ]; then
            log_error "Missing file: $file"
            errors=$((errors + 1))
        fi
    done
    
    if [ $errors -eq 0 ]; then
        log_success "Installation validation complete - no errors found"
    else
        log_error "Installation validation failed with $errors errors"
        exit 1
    fi
}

print_next_steps() {
    echo
    log_success "Personas Framework setup complete for $PROJECT_NAME!"
    echo
    echo -e "${BLUE}📝 Next steps:${NC}"
    echo "1. Review and customize .personas/project/README.md"
    echo "2. Update .personas/project/TECH-SPEC.md with your technical specifications"
    echo "3. Modify .personas/project/STANDARDS.md with your coding standards"
    echo "4. Add project-specific context in .personas/project/contexts/[persona]/"
    echo "5. Review persona Quick-Start guides in .personas/framework/personas/[persona]/QUICK-START.md"
    echo
    echo -e "${GREEN}🎯 Ready to start using personas!${NC}"
    echo "Create your first task in: .personas/project/todos/[persona]/current/"
    echo
    echo -e "${YELLOW}📚 Documentation:${NC}"
    echo "- Framework overview: .personas/framework/PERSONA-FRAMEWORK.md"
    echo "- Engineer guide: .personas/framework/personas/engineer/QUICK-START.md"
    echo "- Planner guide: .personas/framework/personas/planner/QUICK-START.md"
    echo "- Reviewer guide: .personas/framework/personas/reviewer/QUICK-START.md"
    echo
}

# Main execution
main() {
    echo -e "${GREEN}🚀 Personas Framework Enhanced Setup${NC}"
    echo "Target directory: $PROJECT_ROOT"
    echo "Interactive mode: $INTERACTIVE"
    echo
    
    validate_environment
    collect_project_info
    create_directory_structure
    copy_framework_files
    customize_project_files
    create_directory_placeholders
    validate_installation
    print_next_steps
}

# Handle command line arguments
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Personas Framework Setup Script"
    echo
    echo "Usage: $0 [PROJECT_ROOT] [INTERACTIVE]"
    echo
    echo "Arguments:"
    echo "  PROJECT_ROOT   Target directory for framework installation (default: current directory)"
    echo "  INTERACTIVE    Enable interactive mode (true/false, default: true)"
    echo
    echo "Examples:"
    echo "  $0                          # Install in current directory with prompts"
    echo "  $0 /path/to/project         # Install in specific directory with prompts"
    echo "  $0 /path/to/project false   # Install in specific directory without prompts"
    echo
    exit 0
fi

# Run main function
main
