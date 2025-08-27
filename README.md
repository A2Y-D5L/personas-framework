# Personas Framework

An extensible, persona-based agent coordination framework designed to reduce cognitive overload by specializing agent roles into focused, well-defined personas. The framework is project-agnostic and can be adapted to any codebase or domain.

## Quick Start

### For New Projects

1. **Copy Framework to Project:**

   ```bash
   # Copy the framework to your project's .personas directory
   cp -r personas-framework/framework /path/to/your/project/.personas/
   
   # Copy the project template to your project's .personas/project directory
   cp -r personas-framework/framework/project-template /path/to/your/project/.personas/project
   ```

2. **Customize for Your Project:**
   - Update `.personas/project/README.md` with your project details
   - Create `.personas/project/TECH-SPEC.md` with your technical specifications
   - Populate `.personas/project/STANDARDS.md` with your coding standards
   - Add project-specific context in `.personas/project/contexts/[persona]/`

3. **Start Using Personas:**
   - Review the 2-minute Quick-Start guides in each persona directory
   - Begin creating tasks in `.personas/project/todos/[persona]/current/`
   - Use framework coordination in `.personas/framework/personas/[persona]/todos/` as needed

### Framework Structure

The framework uses a three-tier architecture that separates universal definitions, project-specific adaptations, and active work management:

#### 🏗️ Framework Tier: Universal Definitions
**Location:** `.personas/framework/personas/`

- **Purpose:** Project-agnostic persona definitions and methodologies
- **Usage:** Read-only reference for understanding persona responsibilities
- **Modification:** Do not modify - these are framework definitions

#### 🎯 Project Tier: Specific Adaptations
**Location:** `.personas/project/contexts/` and `.personas/project/`

- **Purpose:** Project-specific customizations and adaptations
- **Usage:** Actively customize for your project needs
- **Modification:** Encouraged - adapt to your project requirements

#### 📋 Operational Tier: Active Work Management
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

## Two-Tier TODO System

### Framework-Level Tasks

**Location:** `.personas/framework/personas/[persona]/todos/`

- Framework coordination and meta-tasks
- Process improvements and documentation updates
- Cross-project coordination patterns

### Project-Level Tasks

**Location:** `.personas/project/todos/[persona]/`

- Project-specific implementation tasks
- Feature development and bug fixes
- Project-specific testing and validation

## Key Benefits

- **Cognitive Load Reduction:** Clear role specialization prevents context switching
- **Project Agnosticism:** Framework adapts to any technology stack or domain
- **Scalable Coordination:** Two-tier system handles both framework and project concerns
- **Rapid Onboarding:** 2-minute Quick-Start guides for immediate productivity

## Documentation

See `.personas/framework/PERSONA-FRAMEWORK.md` for complete framework documentation including:

- Detailed persona definitions and scope boundaries
- Coordination protocols and handoff procedures
- Task assignment rules and escalation paths
- Customization guidelines for new projects

## Framework Evolution

This framework is designed to evolve based on usage patterns and project needs. Framework improvements should be coordinated through the Agent-Manager persona's framework-level TODO system.

## License

This framework is released under [specify your license] and can be freely adapted for use in any project or organization.
