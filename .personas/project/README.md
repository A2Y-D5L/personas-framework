# Personas Framework Project

**Project:** Personas Framework Development  
**Framework Version:** 1.0  
**Updated:** August 27, 2025

## Overview

This project develops and maintains the Personas Framework - an extensible, persona-based agent coordination framework designed to reduce cognitive overload by specializing agent roles into focused, well-defined personas.

## Recursive Framework Usage

**Meta-Development Pattern:**

This project demonstrates the Personas Framework's recursive self-improvement capability. The framework is used to coordinate its own development and enhancement, creating a bootstrap pattern where:

```text
Framework-as-System ⟷ Framework-as-Tool
     ↓                      ↓
Being Enhanced           Doing Enhancement
(Framework code)      (Development process)
```

**Key Recursive Properties:**

1. **Self-Organization:** Framework organizes its own development using its personas
2. **Self-Improvement:** Framework coordinates its own enhancement and evolution
3. **Self-Validation:** Framework validates its own changes using its review processes
4. **Self-Documentation:** Framework development follows framework documentation standards

**Bootstrap Development Workflow:**

```text
Framework Enhancement Request
         ↓
   Planner: Design framework improvements
         ↓
   Engineer: Implement framework changes
         ↓
   Reviewer: Validate framework enhancements
         ↓
   Agent-Manager: Coordinate framework deployment
         ↓
   Enhanced Framework (with improved capabilities)
```

**Meta-Development Benefits:**

- **Dog-fooding:** Framework development uses the framework, ensuring real-world validation
- **Continuous Evolution:** Framework improves its own development process over time
- **Consistency:** Framework development follows the same patterns as projects using the framework
- **Bootstrap Capability:** Framework can enhance its own capabilities through coordinated development

## Directory Structure

```text
.personas/project/
├── README.md                # This file - customize for your project
├── TECH-SPEC.md             # Technical specifications (template)
├── ARCHITECTURE.md          # System architecture (template)
├── STANDARDS.md             # Development standards (template)
├── DEPENDENCIES.md          # External dependencies (template)
├── PERFORMANCE.md           # Performance requirements (template)
├── SECURITY.md              # Security guidelines (template)
├── contexts/                # Persona-specific project contexts
│   ├── engineer/            # Implementation-specific context
│   ├── planner/             # Planning-specific context
│   ├── reviewer/            # Review-specific context
│   └── agent-manager/       # Coordination-specific context
└── todos/                   # Project-specific task management
    ├── engineer/            # Implementation tasks
    ├── planner/             # Planning tasks
    └── reviewer/            # Review tasks
```

## Setup Instructions

### 1. Copy Template to Your Project

```bash
# From your project root
cp -r /path/to/personas-framework/framework/project-template /path/to/your/project/.personas/project
```

### 2. Customize Core Documents

Update these files with your project-specific information:

- **README.md** - Project overview, quick start, key details
- **TECH-SPEC.md** - Technical architecture and API specifications
- **STANDARDS.md** - Coding standards, conventions, and quality requirements
- **DEPENDENCIES.md** - External dependencies and integration patterns

### 3. Add Persona-Specific Context

Populate the `contexts/` directories with project-specific guidance for each persona:

- **engineer/** - Implementation patterns, testing frameworks, language-specific guidance
- **planner/** - Architecture patterns, planning templates, constraint documentation  
- **reviewer/** - Review criteria, quality standards, security requirements
- **agent-manager/** - Project coordination patterns and escalation procedures

### 4. Begin Task Management

Start creating tasks in the appropriate `todos/[persona]/current/` directories based on your project needs.

## Customization Guidelines

### Technology-Specific Adaptations

**Programming Languages:**

- Update STANDARDS.md with language-specific conventions
- Add language-specific patterns to contexts/engineer/
- Include language-specific security considerations in contexts/reviewer/

**Frameworks and Libraries:**

- Document framework integration patterns in DEPENDENCIES.md
- Add framework-specific testing patterns to contexts/engineer/
- Include framework-specific architecture patterns in contexts/planner/

**Domain-Specific Requirements:**

- Add domain-specific requirements to TECH-SPEC.md
- Include domain-specific quality criteria in contexts/reviewer/
- Document domain-specific coordination needs in contexts/agent-manager/

### Team and Process Adaptations

**Team Size and Structure:**

- Adjust coordination protocols in contexts/agent-manager/
- Modify handoff procedures based on team communication patterns
- Scale TODO management approaches for team size

**Development Process:**

- Integrate with existing CI/CD in STANDARDS.md
- Adapt quality gates to existing review processes
- Align coordination protocols with existing project management tools

## Template Files Included

This template includes skeleton files for:

- Core project documentation (README, TECH-SPEC, etc.)
- Persona-specific context directories with example structures
- TODO management directories ready for immediate use
- Integration guidelines for common scenarios

## Framework Integration

This project template is designed to work seamlessly with the Personas Framework:

- References to framework personas and coordination protocols
- Compatible directory structure and naming conventions
- Integrated two-tier TODO management system
- Consistent documentation and handoff patterns

## Support and Evolution

As you use this template:

1. **Document customizations** that work well for your project type
2. **Contribute improvements** back to the framework if they're broadly applicable
3. **Share patterns** that emerge from successful project usage
4. **Iterate on coordination** protocols based on team experience

## Next Steps

1. Customize the core documentation files for your project
2. Review persona Quick-Start guides in the framework
3. Begin with a small task in one persona's TODO directory
4. Establish coordination patterns as your team adopts the framework
