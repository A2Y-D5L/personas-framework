# Personas Framework

An extensible, persona-based agent coordination framework designed to reduce cognitive overload by specializing agent roles into focused, well-defined personas. The framework is project-agnostic and can be adapted to any codebase or domain.

## 🚀 Quick Start

**New to the framework?** Start with our [CLI Guide](docs/cli-guide.md) for complete setup instructions.

### 1. Install the CLI

```bash
git clone https://github.com/A2Y-D5L/personas-framework.git
cd personas-framework
chmod +x bin/personas

# Optional: Add to PATH
export PATH="$PATH:$(pwd)/bin"
```

### 2. Initialize Your Project

**Create a new project from scratch:**

```bash
personas init my-project --description "My awesome project"
```

**Integrate into an existing project:**

```bash
cd my-existing-project
personas init . --description "Personas is an extensible prompt engineering framework designed to reduce cognitive overload by specializing agent roles into focused, well-defined personas. It is project-agnostic and can be adapted to any codebase or domain."
```

### 3. Start Working

```bash
# Validate your setup
personas validate

# Create tasks for different personas
personas create-task engineer "Implement user authentication" --priority high
personas create-task planner "Define project requirements" --priority medium

# List available personas
personas list-personas
```

## 🛠️ CLI Commands

The framework provides a unified CLI tool for all operations:

- `personas init <name>` - Initialize new project with personas framework
- `personas generate` - Generate .personas directory from template  
- `personas validate [component]` - Validate project structure and files
- `personas create-task <persona> <title>` - Create new task for specified persona
- `personas validate-tasks` - Validate task files and metadata
- `personas list-personas` - List available personas

**Get detailed help:** `personas <command> --help`

## 📁 Framework Architecture

The framework uses a three-tier architecture that separates universal definitions, project-specific adaptations, and active work management:

### 🏗️ Framework Tier: Universal Definitions

**Location:** `.personas/framework/personas/`

- **Purpose:** Project-agnostic persona definitions and methodologies
- **Usage:** Read-only reference for understanding persona responsibilities
- **Modification:** Do not modify - these are framework definitions

### 🎯 Project Tier: Specific Adaptations

**Location:** `.personas/project/contexts/` and `.personas/project/`

- **Purpose:** Project-specific customizations and adaptations
- **Usage:** Actively customize for your project needs
- **Modification:** Encouraged - adapt to your project requirements

### 📋 Operational Tier: Active Work Management

**Location:** `.personas/project/todos/`

- **Purpose:** Dynamic task management and workflow coordination
- **Usage:** Continuously update as work progresses
- **Modification:** Constant - reflects current work state

### Directory Structure

```text
.personas/                       # Project personas directory
├── framework/                   # Framework coordination (Universal Tier)
│   ├── PERSONA-FRAMEWORK.md     # Core framework documentation
│   ├── personas/                # Persona definitions and workflows
│   │   ├── engineer/            # Implementation persona
│   │   ├── planner/             # Architecture and planning persona
│   │   ├── reviewer/            # Quality assurance persona
│   │   └── agent-manager/       # Coordination persona
│   └── project-template/        # Template for new projects
└── project/                     # Project-specific context (Project + Operational Tiers)
    ├── README.md                # Project overview
    ├── TECH-SPEC.md            # Technical specifications
    ├── STANDARDS.md            # Development standards
    ├── DEPENDENCIES.md         # External dependencies
    ├── contexts/               # Persona-specific project context (Project Tier)
    └── todos/                  # Project task management (Operational Tier)
```

## Core Personas

### 🏗️ Engineer

**Focus:** Implementation and technical execution

- Code development and debugging
- Testing and validation
- Performance optimization
- Technical documentation

### 📋 Planner

**Focus:** Architecture and strategic planning

- System design and architecture
- Feature planning and roadmapping
- Risk assessment and mitigation
- Resource estimation and timeline planning

### 🔍 Reviewer

**Focus:** Quality assurance and analysis

- Code quality assessment
- Security analysis and vulnerability assessment
- Architecture validation
- Compliance and standards verification

### 🗂️ Agent-Manager

**Focus:** Coordination and maintenance

- Task coordination between personas
- Documentation lifecycle management
- Directory organization and archival
- Cross-persona communication facilitation

## 🔧 Advanced Usage

### Custom Templates

```bash
# Generate with custom template (when available)
personas generate --target ./my-project --template custom
```

### Validation and Quality Assurance

```bash
# Validate everything
personas validate

# Validate specific components
personas validate structure
personas validate tasks

# Validate with custom schema
personas validate-tasks --schema ./custom-schema.yaml
```

### Task Management with YAML Metadata

```bash
# Create tasks with proper metadata
personas create-task engineer "Implement API endpoints" --priority high

# Tasks are created with YAML frontmatter for tracking:
# ---
# id: "20250828-140500"
# priority: "high"
# assigned_to: "engineer"
# created_by: "engineer"
# status: "pending"
# created_date: "2025-08-28"
# ---
```

## 📚 Documentation

- **[CLI Guide](docs/cli-guide.md)** - Complete CLI usage and examples
- **[Integration Guide](docs/integration-guide.md)** - AI agent integration and setup
- **[Framework API](docs/framework-api.md)** - API reference and customization
- **[Quick Reference](docs/quick-reference.md)** - Commands and usage patterns

## 🚀 Framework Features

- **Template-based Project Initialization** - Automated `.personas` directory generation
- **YAML Task Metadata** - Structured task tracking with schema validation
- **Unified CLI Interface** - Single command for all framework operations
- **Out-of-the-box Personas** - Engineer, Planner, Reviewer, Agent-Manager roles
- **Cross-platform Compatibility** - Works on macOS, Linux, and Windows
- **AI Agent Integration** - Optimized for GitHub Copilot, Claude, ChatGPT

## 🛠️ Development

### Contributing to the Framework

```bash
# Clone the framework repository
git clone https://github.com/A2Y-D5L/personas-framework.git
cd personas-framework

# Test the CLI
./bin/personas --help
./bin/personas list-personas

# Run validation on the framework itself
./bin/personas validate
```

## License

The Personas Framework is open source and available under [the Apache License 2.0](LICENSE).
