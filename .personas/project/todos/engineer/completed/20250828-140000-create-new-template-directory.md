# Create New Template Directory Structure

**Created:** 2025-08-28  
**Priority:** HIGH  
**Assigned:** Engineer  
**Estimated Effort:** M  
**Dependencies:** None (foundational task)

## Objective

Create the new `template/` directory in the framework root (NOT in .personas) that will serve as the source for generating the proposed `.personas` directory structure for projects adopting the framework.

## Target Location

**Framework Root Directory:** `/Users/andy/Dev/agents/personas-framework/template/`
- This is creating a NEW directory alongside existing `framework/`, `docs/`, `tools/` directories
- This is NOT modifying the current `.personas/` directory (which uses the old structure)

## Acceptance Criteria

- [ ] Create `template/` directory in framework root
- [ ] Create `template/config.yaml` with project variables
- [ ] Create complete `template/.personas/` directory structure matching the proposal
- [ ] Include all persona directories: agent-manager, engineer, planner, reviewer
- [ ] Create centralized persona versioning structure under agent-manager/personas/
- [ ] Add .template files for all generated content
- [ ] Create validation structure with .gitkeep files for empty directories

## Detailed Structure to Create

```
template/
├── config.yaml                    # Template configuration
├── .personas/                     # NEW proposed structure (not current .personas)
│   ├── agent-manager/
│   │   ├── personas/
│   │   │   ├── engineer/
│   │   │   │   ├── CURRENT.md.template
│   │   │   │   └── versions/.gitkeep
│   │   │   ├── planner/
│   │   │   │   ├── CURRENT.md.template
│   │   │   │   └── versions/.gitkeep
│   │   │   ├── reviewer/
│   │   │   │   ├── CURRENT.md.template
│   │   │   │   └── versions/.gitkeep
│   │   │   └── agent-manager/
│   │   │       ├── CURRENT.md.template
│   │   │       └── versions/.gitkeep
│   │   ├── context/
│   │   │   ├── PERSONA.md.template
│   │   │   └── PROJECT.md.template
│   │   └── tasks/
│   │       └── done/.gitkeep
│   ├── engineer/
│   │   ├── context/
│   │   │   ├── PERSONA.md.template
│   │   │   └── PROJECT.md.template
│   │   └── tasks/
│   │       └── done/.gitkeep
│   ├── planner/
│   │   ├── context/
│   │   │   ├── PERSONA.md.template
│   │   │   └── PROJECT.md.template
│   │   └── tasks/
│   │       └── done/.gitkeep
│   ├── reviewer/
│   │   ├── context/
│   │   │   ├── PERSONA.md.template
│   │   │   └── PROJECT.md.template
│   │   └── tasks/
│   │       └── done/.gitkeep
│   ├── DEPENDENCIES.md.template
│   ├── README.md.template
│   ├── STANDARDS.md.template
│   └── TECH-SPEC.md.template
└── scripts/
    ├── generate.sh
    ├── validate.sh
    └── update.sh
```

## Configuration Content

Create `template/config.yaml` with:

```yaml
project:
  name: "${PROJECT_NAME}"
  description: "${PROJECT_DESCRIPTION}"
  tech_stack: "${TECH_STACK}"
  
personas:
  enabled: ["engineer", "planner", "reviewer", "agent-manager"]
  custom_personas: []
  
versioning:
  git_integration: true
  auto_commit: false
  
workflow:
  default_states: ["tasks", "done"]
  enhanced_states: []
```

## Important Notes

- This creates the NEW proposed structure, not the current framework structure
- The current `.personas/` directory in the framework continues to use the old structure
- This template will be used to generate the new structure for adopting projects
- Do not modify existing framework directories (`framework/`, `docs/`, etc.)

## Definition of Done

- [ ] Template directory exists in framework root
- [ ] All required subdirectories and files are created
- [ ] Configuration file has proper variable placeholders
- [ ] Structure matches the proposal specification exactly
- [ ] .gitkeep files prevent empty directory removal
- [ ] Ready for template content population
