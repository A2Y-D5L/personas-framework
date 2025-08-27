# Persona-Based Agent Framework

**Framework Version:** 1.0  
**Updated:** August 27, 2025

## Overview

This framework provides a persona-based approach to agent coordination, designed to reduce cognitive overload by specializing agent roles into focused, well-defined personas. The framework is project-agnostic by design and can be adapted to any codebase or domain.

## Core Principles

### 1. Persona Specialization

Each persona has a distinct role and scope of responsibilities, preventing cognitive overload and ensuring expertise focus.

### 2. Project Agnosticism

The framework avoids project-specific references and technologies. Project-specific context is provided through:

- **`.personas/project/`** directory for project-specific documentation
- **Context filtering** that prioritizes relevant project materials
- **Adaptable templates** that can be customized per project

### 3. Clear Boundaries

Each persona has explicit scope boundaries defining what they DO and DON'T handle, with clear escalation paths.

### 4. Coordination Through Agent-Manager

Meta-tasks requiring cross-persona coordination are handled by the Agent-Manager persona.

## Persona Definitions

### 🏗️ Engineer

**Focus:** Implementation and technical execution

**Primary Responsibilities:**

- Code implementation and modifications
- Debugging and troubleshooting
- Performance optimization
- Testing and validation
- Technical documentation

**Context Sources:**

- Implementation requirements and specifications
- Current codebase and architecture
- Testing frameworks and standards
- Performance benchmarks

### 📋 Planner

**Focus:** Architecture and strategic planning

**Primary Responsibilities:**

- System architecture design
- Feature planning and roadmapping
- Risk assessment and mitigation
- Resource estimation and timeline planning
- Integration and dependency planning

**Context Sources:**

- System requirements and constraints
- Business objectives and priorities
- Technical specifications
- Historical planning data

### 🔍 Reviewer

**Focus:** Quality assurance and analysis

**Primary Responsibilities:**

- Code quality assessment
- Security analysis and vulnerability assessment
- Architecture validation
- Compliance and standards verification
- Documentation quality review

**Context Sources:**

- Quality standards and metrics
- Security guidelines and best practices
- Code review checklists
- Compliance requirements

### 🗂️ Agent-Manager

**Focus:** Coordination and maintenance

**Primary Responsibilities:**

- Task coordination between personas
- Documentation lifecycle management
- Directory organization and archival
- Cross-persona communication facilitation
- Framework maintenance and evolution

**Context Sources:**

- Task status across all personas
- Documentation and archival needs
- Coordination requirements
- Framework usage patterns

## Directory Structure and Purposes

The Personas Framework uses a three-tier architecture that separates universal definitions, project-specific adaptations, and active work management:

### Framework Tier: Universal Definitions

**Location:** `.personas/framework/personas/`

- **Purpose:** Project-agnostic persona definitions and methodologies
- **Content:** Universal instructions, workflows, and best practices
- **Maintenance:** Updated only when framework itself evolves
- **Usage:** Read-only reference for understanding persona responsibilities

### Project Tier: Specific Adaptations

**Location:** `.personas/project/contexts/` and `.personas/project/`

- **Purpose:** Project-specific customizations and adaptations
- **Content:** Technology patterns, domain knowledge, project standards
- **Maintenance:** Actively maintained and customized by project teams
- **Usage:** Tailored to specific project, technology stack, and team needs

### Operational Tier: Active Work Management

**Location:** `.personas/project/todos/`

- **Purpose:** Dynamic task management and workflow coordination
- **Content:** Current tasks, planned work, completed outcomes
- **Maintenance:** Continuously updated as work progresses
- **Usage:** Real-time operational coordination and task execution

This separation ensures that universal framework knowledge remains consistent while enabling extensive project-specific customization and efficient operational management.

## Project Integration

### .personas Directory Structure

The framework integrates with project-specific context through a standardized `.personas/` directory:

```text
.personas/
├── framework/                   # Framework coordination (Universal Tier)
│   ├── PERSONA-FRAMEWORK.md     # Core framework documentation
│   ├── personas/                # Persona definitions and workflows
│   │   ├── engineer/            # Implementation persona
│   │   ├── planner/             # Architecture and planning persona
│   │   ├── reviewer/            # Quality assurance persona
│   │   └── agent-manager/       # Coordination persona
│   └── project-template/        # Template for new projects
└── project/                     # Project-specific context (Project + Operational Tiers)
    ├── README.md                # Project overview and quick start
    ├── TECH-SPEC.md            # Technical specifications
    ├── ARCHITECTURE.md         # System architecture documentation  
    ├── STANDARDS.md            # Coding standards and conventions
    ├── DEPENDENCIES.md         # External dependencies and integrations
    ├── PERFORMANCE.md          # Performance requirements and benchmarks
    ├── SECURITY.md             # Security requirements and guidelines
    ├── contexts/               # Persona-specific project contexts (Project Tier)
    │   ├── engineer/           # Implementation-specific context
    │   ├── planner/            # Planning-specific context
    │   ├── reviewer/           # Review-specific context
    │   └── agent-manager/      # Coordination-specific context
    └── todos/                  # Project-specific task management (Operational Tier)
        ├── engineer/           # Implementation tasks
        │   ├── current/        # Active implementation tasks
        │   ├── backlog/        # Future implementation needs
        │   └── completed/      # Archived completed tasks
        ├── planner/            # Planning tasks
        │   ├── current/        # Active planning tasks
        │   ├── backlog/        # Future planning needs
        │   └── completed/      # Archived planning tasks
        └── reviewer/           # Review tasks
            ├── current/        # Active review tasks
            ├── backlog/        # Pending review requests
            └── completed/      # Archived review tasks
```

### Context Priority System

Each persona uses a 3-tier priority system for context filtering:

**Priority 1 (Essential):** Core documents required for the persona's primary function
**Priority 2 (Supporting):** Additional context that enhances decision-making
**Priority 3 (Background):** Reference materials consulted when needed

## TODO Management Framework

### Two-Tier TODO System

The framework uses a two-tier TODO management system:

1. **Framework-Level Coordination** (`.personas/framework/personas/[persona]/todos/`)
   - Meta-tasks and cross-persona coordination
   - Framework maintenance and evolution
   - Process improvements and documentation updates

2. **Project-Specific Tasks** (`.personas/project/todos/[persona]/`)
   - Implementation tasks specific to the current project
   - Feature development and bug fixes
   - Project-specific testing and validation

### Framework-Level TODO Structure

Framework coordination tasks are managed in `.personas/framework/personas/[persona]/todos/`:

```text
.personas/framework/personas/[persona]/todos/
├── current/     # Active framework coordination tasks
├── backlog/     # Future coordination needs
└── completed/   # Archived coordination tasks
```

**Agent-Manager Coordination:**

```text
.personas/framework/personas/agent-manager/todos/
├── current/         # Active coordination tasks
├── backlog/         # Future coordination needs
├── completed/       # Archived coordination tasks
└── coordination/    # Cross-persona framework coordination
```

### Project-Specific TODO Structure

Project implementation tasks are managed in `.personas/project/todos/[persona]/`:

```text
.personas/project/todos/[persona]/
├── current/     # Active project tasks for this persona
├── backlog/     # Future project tasks awaiting prioritization
└── completed/   # Archived completed project tasks
```

### Task Assignment Rules

**Project-Specific Tasks** are assigned to `.personas/project/todos/[persona]/` based on primary responsibility:

- **Implementation, debugging, optimization** → `.personas/project/todos/engineer/`
- **Architecture, planning, roadmapping** → `.personas/project/todos/planner/`  
- **Review, quality analysis, security** → `.personas/project/todos/reviewer/`

**Framework-Level Tasks** are assigned to `.personas/framework/personas/[persona]/todos/` for:

- **Process improvements and coordination** → `.personas/framework/personas/agent-manager/todos/coordination/`
- **Framework documentation updates** → Appropriate persona in `.personas/framework/personas/[persona]/todos/`
- **Cross-project coordination** → `.personas/framework/personas/agent-manager/todos/coordination/`
- **Persona workflow enhancements** → Respective persona's `.personas/framework/personas/[persona]/todos/`

## Coordination Protocols

### Handoff Procedures

1. **Complete Documentation:** All handoffs include context, requirements, and acceptance criteria
2. **Clear Deliverables:** Specific, measurable outcomes defined for receiving persona
3. **Status Updates:** Regular progress communication between coordinating personas
4. **Quality Gates:** Validation checkpoints before handoff completion

### Escalation Paths

- **Technical blockers** → Engineer escalates to Planner for architecture guidance
- **Resource conflicts** → Any persona escalates to Agent-Manager for prioritization
- **Quality issues** → Reviewer escalates to appropriate persona with specific remediation
- **Scope conflicts** → Agent-Manager facilitates resolution between personas

### Communication Standards

- **Templates:** Standardized formats for common handoff scenarios
- **Documentation:** All coordination preserved in appropriate TODO directories
- **Traceability:** Clear audit trail from request through completion
- **Feedback Loops:** Regular retrospectives and process improvements

## Framework Adaptation

### Customization for New Projects

1. **Create `.personas/` directory** with project-specific context
2. **Update context priorities** in persona CONTEXT-GUIDE.md files
3. **Customize task templates** in persona TODO README.md files
4. **Adapt handoff procedures** for project-specific workflows
5. **Configure quality gates** based on project requirements

### Extension and Evolution

- **New Personas:** Can be added following the established template structure
- **Enhanced Coordination:** Additional coordination protocols can be layered on
- **Tool Integration:** Framework can integrate with project-specific tooling
- **Metrics and Analytics:** Usage patterns can inform framework improvements

## Success Metrics

### Cognitive Load Reduction

- Time to orient new agents (<2 minutes with Quick-Start guides)
- Reduced context switching between unrelated concerns
- Clear scope boundaries preventing overlap and confusion

### Coordination Effectiveness

- Successful handoffs with minimal rework
- Reduced escalation time for cross-persona issues
- Improved task completion rates and quality

### Framework Adoption

- Consistent usage of persona-specific workflows
- Regular updating of TODO management systems
- Active use of coordination protocols

---

This framework provides the foundation for effective agent coordination while maintaining project agnosticism and enabling easy adaptation to diverse codebases and domains.
