# Personas Framework

A persona-based agent coordination framework designed to reduce cognitive overload by specializing agent roles into focused, well-defined personas. The framework is project-agnostic and can be adapted to any codebase or domain.

## Quick Start

### For New Projects

1. **Copy Framework to Project:**

   ```bash
   # Copy the framework to your project's .agent directory
   cp -r personas-framework/.agent /path/to/your/project/
   
   # Copy the project template to your project's .project directory  
   cp -r personas-framework/.project-template /path/to/your/project/.project
   ```

2. **Customize for Your Project:**
   - Update `.project/README.md` with your project details
   - Create `.project/TECH-SPEC.md` with your technical specifications
   - Populate `.project/STANDARDS.md` with your coding standards
   - Add project-specific context in `.project/contexts/[persona]/`

3. **Start Using Personas:**
   - Review the 2-minute Quick-Start guides in each persona directory
   - Begin creating tasks in `.project/todos/[persona]/current/`
   - Use framework coordination in `.agent/personas/[persona]/todos/` as needed

### Framework Structure

```text
.agent/                           # Framework coordination
├── PERSONA-FRAMEWORK.md         # Core framework documentation
└── personas/                    # Persona definitions and workflows
    ├── engineer/                # Implementation persona
    ├── planner/                 # Architecture and planning persona
    ├── reviewer/                # Quality assurance persona
    └── agent-manager/           # Coordination persona

.project/                        # Project-specific context
├── README.md                    # Project overview
├── TECH-SPEC.md                # Technical specifications
├── STANDARDS.md                # Development standards
├── DEPENDENCIES.md             # External dependencies
├── contexts/                   # Persona-specific project context
└── todos/                      # Project task management
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

**Location:** `.agent/personas/[persona]/todos/`

- Framework coordination and meta-tasks
- Process improvements and documentation updates
- Cross-project coordination patterns

### Project-Level Tasks

**Location:** `.project/todos/[persona]/`

- Project-specific implementation tasks
- Feature development and bug fixes
- Project-specific testing and validation

## Key Benefits

- **Cognitive Load Reduction:** Clear role specialization prevents context switching
- **Project Agnosticism:** Framework adapts to any technology stack or domain
- **Scalable Coordination:** Two-tier system handles both framework and project concerns
- **Rapid Onboarding:** 2-minute Quick-Start guides for immediate productivity

## Documentation

See `.agent/PERSONA-FRAMEWORK.md` for complete framework documentation including:

- Detailed persona definitions and scope boundaries
- Coordination protocols and handoff procedures
- Task assignment rules and escalation paths
- Customization guidelines for new projects

## Framework Evolution

This framework is designed to evolve based on usage patterns and project needs. Framework improvements should be coordinated through the Agent-Manager persona's framework-level TODO system.

## License

This framework is released under [specify your license] and can be freely adapted for use in any project or organization.
