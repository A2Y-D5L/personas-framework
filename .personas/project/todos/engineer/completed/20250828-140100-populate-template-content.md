# Populate Template Content Files

**Created:** 2025-08-28  
**Priority:** HIGH  
**Assigned:** Engineer  
**Estimated Effort:** L  
**Dependencies:** 20250828-140000-create-new-template-directory

## Objective

Populate all .template files in the newly created `template/.personas/` directory with appropriate content that includes variable substitution and references to the current framework persona definitions.

## Target Location

**Framework Template Directory:** `/Users/andy/Dev/agents/personas-framework/template/.personas/`
- Populate .template files created in previous task
- Source content from existing framework personas in `framework/personas/`

## Acceptance Criteria

- [ ] All CURRENT.md.template files populated with persona definitions
- [ ] All PERSONA.md.template files contain references to centralized definitions
- [ ] All PROJECT.md.template files have project-specific context templates
- [ ] Root-level .template files (DEPENDENCIES.md, README.md, etc.) populated
- [ ] Variable substitution placeholders properly implemented
- [ ] Template content validates against proposed metadata standards

## Template Content Sources

**Extract content from existing framework:**

- **Engineer Persona:** `framework/personas/engineer/INSTRUCTIONS.md` → `template/.personas/agent-manager/personas/engineer/CURRENT.md.template`
- **Planner Persona:** `framework/personas/planner/INSTRUCTIONS.md` → `template/.personas/agent-manager/personas/planner/CURRENT.md.template`
- **Reviewer Persona:** `framework/personas/reviewer/INSTRUCTIONS.md` → `template/.personas/agent-manager/personas/reviewer/CURRENT.md.template`
- **Agent-Manager:** `framework/personas/agent-manager/INSTRUCTIONS.md` → `template/.personas/agent-manager/personas/agent-manager/CURRENT.md.template`

## Variable Substitution Examples

**In PERSONA.md.template files:**
```markdown
# ${PERSONA_NAME} Persona Reference

This file references the current ${PERSONA_NAME} persona definition.

**Current Definition:** [agent-manager/personas/${PERSONA_NAME}/CURRENT.md](../agent-manager/personas/${PERSONA_NAME}/CURRENT.md)

**Project:** ${PROJECT_NAME}
**Updated:** $(date)
```

**In PROJECT.md.template files:**
```markdown
# ${PERSONA_NAME} Project Context

**Project:** ${PROJECT_NAME}
**Description:** ${PROJECT_DESCRIPTION}
**Technology Stack:** ${TECH_STACK}

## ${PERSONA_NAME}-Specific Context

[Add project-specific context relevant to the ${PERSONA_NAME} persona]

## Integration Points

[Document how this persona integrates with the project architecture]
```

## Root-Level Templates

**Create content for:**
- `DEPENDENCIES.md.template` - Project dependencies template
- `README.md.template` - Project overview with personas integration
- `STANDARDS.md.template` - Project coding standards template  
- `TECH-SPEC.md.template` - Technical specifications template

## Important Notes

- Source persona content from CURRENT framework (`framework/personas/`)
- Do NOT modify the current framework structure
- Template files should generate the NEW proposed structure for adopting projects
- Include proper variable placeholders for project customization
- Ensure all references point to the centralized versioning structure

## Definition of Done

- [ ] All .template files contain appropriate content
- [ ] Variable substitution is properly implemented
- [ ] Content sources are correctly extracted from current framework
- [ ] Generated structure will match proposal specifications
- [ ] Templates are ready for automated generation tooling
