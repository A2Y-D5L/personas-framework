# Project Template

**Template Version:** 1.0  
**Framework Version:** 1.0  
**Updated:** August 27, 2025

## Overview

This is a template structure for projects using the Personas Framework. Copy this entire directory to your project's `.project/` directory and customize it for your specific project needs.

## Directory Structure

```
.project/
├── README.md                 # This file - customize for your project
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
cp -r /path/to/personas-framework/.project-template /path/to/your/project/.project
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
