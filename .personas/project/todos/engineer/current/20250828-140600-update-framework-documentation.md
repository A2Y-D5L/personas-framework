# Update Framework Documentation for New Structure

**Created:** 2025-08-28  
**Priority:** LOW  
**Assigned:** Engineer  
**Estimated Effort:** M  
**Dependencies:** 20250828-140500-create-cli-tool

## Objective

Update the framework's documentation files to reflect the new template-based structure and CLI tooling, while maintaining documentation for the current framework structure during transition.

## Target Location

**Documentation Updates:** `/Users/andy/Dev/agents/personas-framework/docs/`
**README Updates:** `/Users/andy/Dev/agents/personas-framework/README.md`

## Acceptance Criteria

- [ ] Update main README.md with new template-based approach
- [ ] Create new documentation for CLI tool usage
- [ ] Update integration-guide.md for new .personas structure
- [ ] Add template documentation and examples
- [ ] Maintain backward compatibility documentation
- [ ] Create migration guide for existing users

## Documentation Updates Required

### Main README.md

**Add sections for:**
- Template-based .personas generation
- CLI tool installation and basic usage
- Quick start with new structure
- Link to comprehensive documentation

**Update existing sections:**
- Framework overview to mention template approach
- Installation section to include CLI setup
- Usage examples with new CLI commands

### New Documentation Files

**Create docs/cli-reference.md:**
- Complete CLI command reference
- Subcommand documentation with examples
- Configuration file reference
- Troubleshooting guide

**Create docs/template-guide.md:**
- Template structure explanation
- Customization options
- Variable substitution guide
- Template development

**Create docs/migration-guide.md:**
- Migration from old .personas structure
- Transition strategies for existing projects
- Compatibility considerations
- Step-by-step migration process

### Updated Integration Guide

**Update docs/integration-guide.md:**
- New .personas directory structure
- Task metadata format with YAML frontmatter
- Persona interaction patterns with new structure
- CLI integration examples

### Example Documentation

**Template usage examples:**
```bash
# Initialize new project
personas init my-api-project --description "REST API service"

# Generate .personas in existing project
personas generate --target . --project-name "existing-project"

# Validate project structure
personas validate structure
```

**Task creation examples:**
```bash
# Create task with metadata
personas create-task engineer "Implement authentication" \
  --priority high \
  --complexity medium \
  --due-date 2025-09-15
```

## Compatibility Documentation

**Document both approaches:**

1. **New Template Approach (Recommended):**
   - Template-based generation
   - CLI tool usage
   - New .personas structure

2. **Current Framework Structure:**
   - Existing .personas structure (for current framework development)
   - Manual setup process
   - Transition timeline

## Important Notes

- Document the NEW proposed structure for adopting projects
- Maintain documentation for current framework structure during transition
- Clear distinction between framework development vs. adopting projects
- Include plenty of examples and practical guidance
- Update all cross-references and links

## Content Guidelines

**For each documentation update:**
- Clear distinction between old and new approaches
- Practical examples with real commands
- Links to related documentation
- Troubleshooting sections where relevant
- Version compatibility information

## Definition of Done

- [ ] Main README.md updated with new approach
- [ ] Complete CLI reference documentation created
- [ ] Template guide with examples and customization
- [ ] Migration guide for existing users
- [ ] Integration guide updated for new structure
- [ ] All cross-references and links updated
- [ ] Documentation tested with actual examples
- [ ] Clear versioning and compatibility information
