# Create Template Generation Script

**Created:** 2025-08-28  
**Priority:** HIGH  
**Assigned:** Engineer  
**Estimated Effort:** L  
**Dependencies:** 20250828-140100-populate-template-content

## Objective

Create the `template/scripts/generate.sh` script that can process the template directory and generate a complete `.personas` directory structure for adopting projects.

## Target Location

**Script Location:** `/Users/andy/Dev/agents/personas-framework/template/scripts/generate.sh`

## Acceptance Criteria

- [ ] Script accepts project configuration parameters
- [ ] Processes all .template files with variable substitution
- [ ] Creates complete .personas directory structure in target location
- [ ] Validates generated structure against requirements
- [ ] Provides clear success/failure reporting
- [ ] Includes usage documentation and examples

## Script Functionality

**Command Interface:**
```bash
# Basic usage
./template/scripts/generate.sh --target /path/to/project --project-name "MyProject"

# With full configuration
./template/scripts/generate.sh \
  --target /path/to/project \
  --project-name "MyProject" \
  --description "Project description" \
  --tech-stack "Go, React, PostgreSQL" \
  --config template/config.yaml
```

**Processing Steps:**
1. Parse command line arguments and config file
2. Validate target directory (should not exist or be empty)
3. Process template/config.yaml for variable definitions
4. Iterate through all .template files in template/.personas/
5. Perform variable substitution on file contents
6. Create directory structure and write processed files
7. Validate generated structure
8. Report success/failure with details

## Variable Substitution

**Required Variables:**
- `${PROJECT_NAME}` - Project name
- `${PROJECT_DESCRIPTION}` - Project description  
- `${TECH_STACK}` - Technology stack
- `${PERSONA_NAME}` - Persona name (context-dependent)
- `$(date)` - Current timestamp

**Substitution Logic:**
```bash
# Replace variables in file content
sed -e "s/\${PROJECT_NAME}/$PROJECT_NAME/g" \
    -e "s/\${PROJECT_DESCRIPTION}/$PROJECT_DESCRIPTION/g" \
    -e "s/\${TECH_STACK}/$TECH_STACK/g" \
    -e "s/\${PERSONA_NAME}/$PERSONA_NAME/g" \
    -e "s/\$(date)/$(date -u +%Y-%m-%d)/g"
```

## Validation Checks

**Post-generation validation:**
- [ ] All required directories exist
- [ ] All required files exist and are non-empty
- [ ] No .template files in generated structure
- [ ] Proper permissions set
- [ ] Valid YAML frontmatter in generated files

## Error Handling

**Script should handle:**
- Missing required parameters
- Target directory conflicts  
- Template file processing errors
- Permission issues
- Validation failures

## Usage Documentation

**Include in script header:**
```bash
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
```

## Important Notes

- Script generates the NEW proposed .personas structure (not current framework structure)
- Source templates from template/.personas/ directory
- Target is external projects adopting the framework
- Do not modify existing framework directories
- Script should be executable and well-documented

## Definition of Done

- [ ] Script processes template directory successfully
- [ ] Variable substitution works correctly
- [ ] Generated structure matches proposal specifications
- [ ] Comprehensive error handling and validation
- [ ] Clear usage documentation and examples
- [ ] Script is executable and tested
