# Personas Framework Directory Structure

**Generated:** August 27, 2025

This document provides a comprehensive overview of the Personas Framework directory structure.

## Framework Root Structure

```text
personas-framework/
├── LICENSE                 # Framework license
├── README.md              # Main framework documentation
├── setup.sh              # Enhanced setup script
├── framework/             # Core framework files
│   ├── PERSONA-FRAMEWORK.md    # Framework specification
│   ├── personas/              # Persona definitions
│   └── project-template/      # Template for new projects
└── tools/                 # Framework development tools
    ├── validate-framework.sh  # Framework structure validator
    ├── validate-tasks.sh      # Task format validator
    ├── test-framework.sh      # Test suite
    └── generate-docs.sh       # Documentation generator
```

## Persona Directory Structure

```text
.personas/framework/personas/[persona]/
├── INSTRUCTIONS.md        # Detailed persona instructions
├── QUICK-START.md        # Quick reference guide
├── CONTEXT-GUIDE.md      # Context priority guidance
└── todos/                # Framework-level tasks
    ├── current/          # Active framework tasks
    ├── backlog/          # Future framework work
    └── completed/        # Archived framework tasks
```

## Project Directory Structure

```text
.personas/project/
├── README.md             # Project overview
├── TECH-SPEC.md         # Technical specifications
├── STANDARDS.md         # Development standards
├── DEPENDENCIES.md      # External dependencies
├── contexts/            # Persona-specific project context
│   ├── engineer/        # Engineering context and patterns
│   ├── planner/         # Planning context and templates
│   └── reviewer/        # Review criteria and standards
└── todos/               # Project task management
    ├── engineer/        # Implementation tasks
    ├── planner/         # Architecture and planning tasks
    └── reviewer/        # Quality assurance tasks
```

## Task Directory Structure

```text
todos/[persona]/
├── current/             # Active tasks requiring immediate attention
├── backlog/             # Future tasks awaiting prioritization
└── completed/           # Archived completed tasks
```

---

**Note:** This documentation is auto-generated. Last updated: 2025-08-27
