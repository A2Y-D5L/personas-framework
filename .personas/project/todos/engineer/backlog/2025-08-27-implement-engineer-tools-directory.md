# Implement Engineer Tools Directory Structure

**Created:** August 27, 2025  
**Priority:** MEDIUM  
**Assigned:** Engineer  
**Type:** Framework Enhancement  
**Estimated Effort:** Small

## Objective

Update the framework's Engineer persona to create and manage engineering tools in a dedicated project-level directory at `.personas/project/contexts/engineer/tools/`. This will provide Engineers with a standardized location for developing and maintaining project-specific development tools and utilities.

## Problem Statement

Currently, the Engineer persona lacks a standardized location for creating project-specific tools, scripts, and utilities. Engineers often need to create custom tools for:

- Build automation and optimization scripts
- Code generation utilities
- Testing and validation tools
- Performance analysis scripts
- Development workflow automation
- Project-specific linting and formatting tools

Without a standardized location, these tools end up scattered across the project or not created at all, reducing development efficiency and reusability.

## Acceptance Criteria

- [ ] Create tools directory structure in project template
- [ ] Update Engineer persona instructions to reference tools directory
- [ ] Define standards for tool organization and documentation
- [ ] Create example tools and templates
- [ ] Update setup automation to create tools directory
- [ ] Document tool development patterns and best practices
- [ ] Integrate tools directory with validation scripts

## Technical Implementation Plan

### Phase 1: Directory Structure Creation

**1.1 Create Tools Directory Structure:**

```
.personas/project/contexts/engineer/tools/
├── README.md                    # Tools overview and usage guide
├── automation/                  # Build and workflow automation
│   ├── README.md
│   └── examples/
├── codegen/                     # Code generation utilities
│   ├── README.md
│   └── templates/
├── testing/                     # Testing utilities and helpers
│   ├── README.md
│   └── fixtures/
├── analysis/                    # Code analysis and metrics tools
│   ├── README.md
│   └── reports/
├── validation/                  # Custom validation and linting
│   ├── README.md
│   └── rules/
└── utilities/                   # General-purpose development utilities
    ├── README.md
    └── scripts/
```

**1.2 Update Project Template:**

Add tools directory to project template structure in:
- `framework/project-template/contexts/engineer/tools/`
- Include in project template README and documentation

### Phase 2: Engineer Persona Integration

**2.1 Update Engineer Instructions:**

Add tools management section to `engineer/INSTRUCTIONS.md`:

```markdown
## Development Tools Management

### Tool Creation and Organization

**Tool Directory Structure:**
- `../../../../project/contexts/engineer/tools/` - Root tools directory
- Tool categories: automation, codegen, testing, analysis, validation, utilities
- Each tool should include README.md with usage instructions and examples

**Tool Development Standards:**
- All tools must be documented with clear usage instructions
- Include example usage and expected inputs/outputs
- Provide error handling and validation
- Follow project coding standards and conventions
- Include appropriate testing for complex tools

### Common Tool Patterns

#### 1. Build Automation Tools
- Scripts for optimizing build processes
- Dependency management utilities
- Environment setup and configuration tools
- Deployment automation scripts

#### 2. Code Generation Tools
- Template-based code generators
- Boilerplate creation utilities
- API client generation scripts
- Database schema generators

#### 3. Testing and Validation Tools
- Test data generation utilities
- Custom assertion helpers
- Performance testing scripts
- Integration test automation

#### 4. Analysis and Metrics Tools
- Code quality analysis scripts
- Performance profiling utilities
- Dependency analysis tools
- Technical debt measurement scripts
```

**2.2 Update Context Hierarchy:**

Add tools directory to Engineer persona context hierarchy:

```markdown
### Priority 2: Supporting Context (For Complex Tasks)

3. **Development Tools and Utilities**
   - `../../../../project/contexts/engineer/tools/` - Project-specific development tools
   - Custom automation scripts and build utilities
   - Code generation and template tools
   - Testing and validation helpers
```

### Phase 3: Tool Templates and Examples

**3.1 Create Tool Templates:**

**Main Tools README:**
```markdown
# Engineering Tools

This directory contains project-specific development tools and utilities created and maintained by the Engineer persona.

## Directory Structure

- `automation/` - Build and workflow automation scripts
- `codegen/` - Code generation utilities and templates
- `testing/` - Testing utilities and test helpers
- `analysis/` - Code analysis and metrics tools
- `validation/` - Custom validation and linting tools
- `utilities/` - General-purpose development utilities

## Tool Development Guidelines

### Creating New Tools

1. **Choose Appropriate Category:** Place tools in the most relevant subdirectory
2. **Document Thoroughly:** Include README.md with usage instructions
3. **Follow Standards:** Adhere to project coding standards and conventions
4. **Include Examples:** Provide example usage and sample inputs/outputs
5. **Test Complex Tools:** Include tests for tools with significant logic

### Tool Documentation Template

Each tool should include:
- Purpose and use cases
- Installation/setup requirements
- Usage instructions with examples
- Input/output specifications
- Error handling and troubleshooting

## Example Tools

See individual category directories for example tools and templates.
```

**3.2 Create Category-Specific Templates:**

**Automation Tools Example:**
```bash
#!/bin/bash
# Example build optimization script

set -euo pipefail

# Script configuration
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
BUILD_DIR="${PROJECT_ROOT}/build"
CACHE_DIR="${PROJECT_ROOT}/.build-cache"

# Tool description and usage
show_usage() {
    cat << EOF
Build Optimization Tool

Usage: $0 [options]

Options:
    -c, --clean     Clean build cache before building
    -v, --verbose   Enable verbose output
    -h, --help      Show this help message

Examples:
    $0              # Standard optimized build
    $0 --clean      # Clean build with cache reset
    $0 --verbose    # Build with detailed output
EOF
}

# Main build optimization logic
optimize_build() {
    echo "Starting optimized build process..."
    
    # Create cache directory if it doesn't exist
    mkdir -p "$CACHE_DIR"
    
    # Implement build optimization logic here
    # This is a template - replace with actual optimization
    
    echo "Build optimization complete"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -c|--clean)
            rm -rf "$CACHE_DIR"
            echo "Build cache cleaned"
            shift
            ;;
        -v|--verbose)
            set -x
            shift
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac
done

# Execute main function
optimize_build
```

**Code Generation Tool Example:**
```python
#!/usr/bin/env python3
"""
Code Generation Utility Template

This template demonstrates the structure for code generation tools
in the Engineer tools directory.
"""

import argparse
import os
import sys
from pathlib import Path
from typing import Dict, List, Optional

class CodeGenerator:
    """Base class for code generation utilities."""
    
    def __init__(self, project_root: Path):
        self.project_root = project_root
        self.templates_dir = Path(__file__).parent / "templates"
        
    def generate(self, template_name: str, output_path: Path, variables: Dict[str, str]) -> bool:
        """Generate code from template with variable substitution."""
        try:
            template_path = self.templates_dir / f"{template_name}.template"
            
            if not template_path.exists():
                print(f"Error: Template {template_name} not found")
                return False
                
            # Read template
            with open(template_path, 'r') as f:
                template_content = f.read()
                
            # Substitute variables
            for var_name, var_value in variables.items():
                template_content = template_content.replace(f"{{{{ {var_name} }}}}", var_value)
                
            # Ensure output directory exists
            output_path.parent.mkdir(parents=True, exist_ok=True)
            
            # Write generated code
            with open(output_path, 'w') as f:
                f.write(template_content)
                
            print(f"Generated: {output_path}")
            return True
            
        except Exception as e:
            print(f"Error generating code: {e}")
            return False

def main():
    """Main entry point for code generation tool."""
    parser = argparse.ArgumentParser(description="Code Generation Utility")
    parser.add_argument("template", help="Template name to use")
    parser.add_argument("output", help="Output file path")
    parser.add_argument("-v", "--variable", action="append", default=[],
                       help="Variable assignment (format: name=value)")
    
    args = parser.parse_args()
    
    # Parse variables
    variables = {}
    for var_assignment in args.variable:
        if '=' not in var_assignment:
            print(f"Error: Invalid variable format '{var_assignment}'. Use name=value")
            sys.exit(1)
        name, value = var_assignment.split('=', 1)
        variables[name] = value
    
    # Find project root
    project_root = Path(__file__).resolve()
    while project_root.parent != project_root:
        if (project_root / ".personas").exists():
            break
        project_root = project_root.parent
    else:
        print("Error: Could not find project root (.personas directory)")
        sys.exit(1)
    
    # Generate code
    generator = CodeGenerator(project_root)
    success = generator.generate(args.template, Path(args.output), variables)
    
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()
```

### Phase 4: Integration and Validation

**4.1 Update Setup Script:**

Add tools directory creation to `setup.sh`:

```bash
# Create engineering tools structure
create_engineer_tools() {
    local tools_dir="$PROJECT_DIR/contexts/engineer/tools"
    
    echo "Creating engineering tools structure..."
    
    # Create tool category directories
    for category in automation codegen testing analysis validation utilities; do
        mkdir -p "$tools_dir/$category"
        mkdir -p "$tools_dir/$category/examples"
        
        # Create category README
        cat > "$tools_dir/$category/README.md" << EOF
# ${category^} Tools

This directory contains ${category} tools and utilities for the project.

## Usage Guidelines

- All tools should include clear documentation
- Provide usage examples and sample outputs
- Follow project coding standards
- Include error handling and validation

## Tool Templates

See the main tools directory for templates and development guidelines.
EOF
    done
    
    echo "Engineering tools structure created successfully"
}
```

**4.2 Update Validation Scripts:**

Add tools directory validation to framework validation:

```bash
# Validate engineering tools structure
validate_engineer_tools() {
    local tools_dir=".personas/project/contexts/engineer/tools"
    
    if [ ! -d "$tools_dir" ]; then
        echo "Warning: Engineering tools directory not found: $tools_dir"
        return 1
    fi
    
    # Check required subdirectories
    local required_dirs=("automation" "codegen" "testing" "analysis" "validation" "utilities")
    for dir in "${required_dirs[@]}"; do
        if [ ! -d "$tools_dir/$dir" ]; then
            echo "Warning: Missing tools subdirectory: $tools_dir/$dir"
        fi
    done
    
    # Validate tool documentation
    find "$tools_dir" -name "*.sh" -o -name "*.py" -o -name "*.js" | while read -r tool_file; do
        local tool_dir=$(dirname "$tool_file")
        local tool_name=$(basename "$tool_file" | sed 's/\.[^.]*$//')
        
        # Check for documentation
        if [ ! -f "$tool_dir/README.md" ] && [ ! -f "$tool_dir/${tool_name}.md" ]; then
            echo "Warning: Tool missing documentation: $tool_file"
        fi
    done
    
    return 0
}
```

### Phase 5: Documentation and Training

**5.1 Update Framework Documentation:**

Add tools section to main framework documentation:

```markdown
## Engineering Tools Development

The framework provides a standardized location for Engineers to create and maintain project-specific development tools and utilities.

**Tools Directory:** `.personas/project/contexts/engineer/tools/`

**Tool Categories:**
- **Automation:** Build and workflow automation scripts
- **Code Generation:** Template-based code generators and utilities
- **Testing:** Testing utilities and test helpers
- **Analysis:** Code analysis and metrics tools
- **Validation:** Custom validation and linting tools
- **Utilities:** General-purpose development utilities

See the Engineer persona instructions for detailed tool development guidelines.
```

**5.2 Create Quick-Start Guide:**

Add tools section to Engineer quick-start:

```markdown
## 🛠️ Creating Development Tools

**Location:** `.personas/project/contexts/engineer/tools/`

**Quick Tool Creation:**
1. Choose appropriate category (automation, codegen, testing, analysis, validation, utilities)
2. Create tool script in category directory
3. Add README.md with usage instructions
4. Include examples and error handling
5. Test tool functionality

**Example Tool Creation:**
```bash
# Create build optimization tool
touch .personas/project/contexts/engineer/tools/automation/optimize-build.sh
chmod +x .personas/project/contexts/engineer/tools/automation/optimize-build.sh

# Document the tool
echo "# Build Optimization Tool" > .personas/project/contexts/engineer/tools/automation/README.md
```
```

## Risk Assessment

### Low-Risk Implementation

**This enhancement is low-risk because:**
- Additive functionality that doesn't change existing workflows
- Optional feature that Engineers can adopt gradually
- Clear separation from existing framework structure
- Standard directory patterns that are familiar to developers

### Potential Issues

**1. Tool Proliferation:**
- Risk: Too many single-purpose tools creating clutter
- Mitigation: Clear organization guidelines and periodic cleanup
- Monitoring: Regular review of tool usage and value

**2. Documentation Drift:**
- Risk: Tools created without proper documentation
- Mitigation: Validation scripts check for documentation
- Process: Include documentation requirements in persona instructions

## Success Metrics

- [ ] Tools directory structure created in project template
- [ ] Engineer persona instructions updated with tools guidelines
- [ ] Example tools and templates provided
- [ ] Setup script creates tools directory automatically
- [ ] Validation scripts check tools directory structure
- [ ] Documentation updated across framework

## Implementation Timeline

**Day 1:** Create directory structure and templates
**Day 2:** Update Engineer persona instructions and context
**Day 3:** Update setup and validation scripts
**Day 4:** Create documentation and examples
**Day 5:** Testing and validation

**Total Effort:** 5 days

## Handoff Requirements

**To Reviewer:**
- Review tools directory structure and organization
- Validate example tools and templates
- Check documentation completeness and clarity
- Test setup and validation script updates

**To Agent-Manager:**
- Update framework documentation with tools information
- Coordinate with project template updates
- Document tools development guidelines

**To Planner:**
- Integration with framework evolution roadmap
- Consider tools directory in future enhancements
- Plan for advanced tool development features

---

**Dependencies:**
- Should be implemented after TODO structure refactoring
- Coordinates with Engineer persona instruction updates
- Aligns with project template improvements

**Status:** Ready for implementation
