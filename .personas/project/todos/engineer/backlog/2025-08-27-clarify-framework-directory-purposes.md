# Clarify Framework Directory Purposes in Persona Instructions

**Created:** August 27, 2025  
**Priority:** HIGH  
**Assigned:** Engineer  
**Type:** Documentation Enhancement  
**Estimated Effort:** Medium

## Objective

Update all persona instruction files to clearly disambiguate the distinct purposes of `.personas/framework/personas`, `.personas/project/contexts`, and `.personas/project/todos` directories. This will eliminate confusion about where different types of content belong and improve framework usability.

## Problem Statement

The current persona instructions may not clearly distinguish between:

1. **Framework Personas Directory** (`.personas/framework/personas/`) - Universal persona definitions
2. **Project Contexts Directory** (`.personas/project/contexts/`) - Project-specific context and customizations
3. **Project Todos Directory** (`.personas/project/todos/`) - Active task management

This ambiguity can lead to:
- Confusion about where to place project-specific customizations
- Unclear understanding of which content is universal vs. project-specific
- Inefficient context discovery and usage
- Improper modification of framework files instead of project customizations

## Acceptance Criteria

- [ ] All persona instruction files clearly explain the three-tier directory structure
- [ ] Each directory's purpose is explicitly defined with examples
- [ ] Context hierarchy sections correctly reference appropriate directories
- [ ] Usage guidelines differentiate between framework and project content
- [ ] Examples demonstrate proper usage of each directory type
- [ ] Cross-references between directories are clearly explained
- [ ] Quick-start guides include directory purpose clarification

## Technical Implementation Plan

### Phase 1: Directory Purpose Analysis

**1.1 Define Clear Directory Purposes:**

**Framework Personas Directory (`.personas/framework/personas/`):**
- **Purpose:** Universal persona definitions and instructions
- **Content:** Core persona instructions, handoff protocols, universal workflows
- **Scope:** Project-agnostic, applies to all projects using the framework
- **Modification:** Should not be modified by individual projects
- **Updates:** Only updated when framework itself evolves

**Project Contexts Directory (`.personas/project/contexts/`):**
- **Purpose:** Project-specific context and persona customizations
- **Content:** Technology-specific patterns, domain knowledge, project standards
- **Scope:** Specific to individual project and team
- **Modification:** Actively customized and maintained by project teams
- **Updates:** Continuously updated as project evolves

**Project Todos Directory (`.personas/project/todos/`):**
- **Purpose:** Active task management and workflow coordination
- **Content:** Current tasks, backlog items, completed work archives
- **Scope:** Dynamic, day-to-day operational content
- **Modification:** Constantly updated as work progresses
- **Updates:** Real-time updates as tasks are created, worked on, and completed

### Phase 2: Update All Persona Instructions

**2.1 Engineer Persona Instructions Update:**

Add directory disambiguation section to `engineer/INSTRUCTIONS.md`:

```markdown
## Framework Directory Structure

The Personas Framework uses a three-tier directory structure with distinct purposes:

### 🏗️ Framework Personas (`.personas/framework/personas/`)

**Purpose:** Universal persona definitions that apply to all projects

- **Contains:** Core persona instructions, universal workflows, handoff protocols
- **Scope:** Project-agnostic definitions of how personas operate
- **Usage:** Read-only reference for understanding persona responsibilities
- **Modification:** Do not modify - these are framework definitions

**Engineer-Specific Framework Content:**
- `INSTRUCTIONS.md` - Universal Engineer persona definition and workflows
- `CONTEXT-GUIDE.md` - General context discovery and usage patterns
- `QUICK-START.md` - Universal quick-start guide for Engineer persona

### 🎯 Project Contexts (`.personas/project/contexts/engineer/`)

**Purpose:** Project-specific context and Engineer persona customizations

- **Contains:** Technology patterns, domain knowledge, project-specific practices
- **Scope:** Tailored to your specific project, technology stack, and team
- **Usage:** Actively customize and maintain for your project needs
- **Modification:** Encouraged - adapt to your project requirements

**Engineer-Specific Project Context:**
- `IMPLEMENTATION-PATTERNS.md` - Project-specific coding patterns and conventions
- `tools/` - Project-specific development tools and utilities
- Technology-specific integration patterns and examples
- Domain-specific implementation guidelines and standards

### 📋 Project Todos (`.personas/project/todos/engineer/`)

**Purpose:** Active task management for Engineer persona work

- **Contains:** Current tasks, backlog items, completed work
- **Scope:** Dynamic, operational content that changes frequently
- **Usage:** Create, update, and manage engineering tasks
- **Modification:** Constant - reflects current work state

**Engineer Task Management:**
- `current/` - Active implementation tasks requiring immediate attention
- `backlog/` - Planned engineering work and feature implementations
- `completed/` - Archive of finished engineering tasks and outcomes

### Directory Interaction Patterns

**Context Discovery Flow:**
1. **Start with Framework:** Understand universal persona responsibilities
2. **Apply Project Context:** Layer in project-specific patterns and practices
3. **Execute via Todos:** Use task management for actual work coordination

**Customization Strategy:**
- **Never modify:** Framework persona definitions
- **Actively customize:** Project context files for your specific needs
- **Continuously update:** Todo management based on current work
```

**2.2 Planner Persona Instructions Update:**

Add similar section to `planner/INSTRUCTIONS.md`:

```markdown
## Framework Directory Structure

### 🏗️ Framework Personas (`.personas/framework/personas/`)

**Purpose:** Universal persona definitions for architecture and planning

**Planner-Specific Framework Content:**
- `INSTRUCTIONS.md` - Universal Planner persona definition and methodologies
- `CONTEXT-GUIDE.md` - General architectural analysis and planning patterns
- `QUICK-START.md` - Universal quick-start guide for planning workflows

### 🎯 Project Contexts (`.personas/project/contexts/planner/`)

**Purpose:** Project-specific architectural context and planning customizations

**Planner-Specific Project Context:**
- Architecture documentation and design decisions specific to your project
- Technology-specific architectural patterns and constraints
- Domain-specific planning methodologies and frameworks
- Project-specific risk assessment templates and mitigation strategies

### 📋 Project Todos (`.personas/project/todos/planner/`)

**Purpose:** Active planning and architecture task management

**Planner Task Management:**
- `current/` - Active planning tasks and architectural analysis
- `backlog/` - Future planning initiatives and architectural improvements
- `completed/` - Archive of completed planning work and architectural decisions

### Planning Context Hierarchy

**Priority 1: Framework Understanding**
- Universal planning methodologies and task breakdown frameworks
- Standard architectural analysis patterns and risk assessment methods
- Universal handoff protocols and coordination patterns

**Priority 2: Project Context Application**
- Project-specific architectural constraints and technology patterns
- Domain-specific planning requirements and methodologies
- Team-specific coordination and communication patterns

**Priority 3: Active Task Execution**
- Current planning tasks and their specific requirements
- Backlog planning initiatives and their prioritization
- Historical planning decisions and their outcomes
```

**2.3 Reviewer Persona Instructions Update:**

Add section to `reviewer/INSTRUCTIONS.md`:

```markdown
## Framework Directory Structure

### 🏗️ Framework Personas (`.personas/framework/personas/`)

**Purpose:** Universal quality assurance and review definitions

**Reviewer-Specific Framework Content:**
- `INSTRUCTIONS.md` - Universal Reviewer persona definition and methodologies
- `CONTEXT-GUIDE.md` - General quality assessment and review patterns
- `QUICK-START.md` - Universal quick-start guide for review workflows

### 🎯 Project Contexts (`.personas/project/contexts/reviewer/`)

**Purpose:** Project-specific quality standards and review customizations

**Reviewer-Specific Project Context:**
- `REVIEW-CRITERIA.md` - Project-specific quality standards and criteria
- Technology-specific security and performance review patterns
- Domain-specific compliance and validation requirements
- Project-specific quality metrics and assessment frameworks

### 📋 Project Todos (`.personas/project/todos/reviewer/`)

**Purpose:** Active review and quality assurance task management

**Reviewer Task Management:**
- `current/` - Active review tasks and quality assessments
- `backlog/` - Scheduled reviews and quality improvement initiatives
- `completed/` - Archive of completed reviews and quality findings

### Review Context Application

**Universal Standards (Framework):**
- Core code quality and security assessment methodologies
- Standard review processes and quality gate definitions
- Universal handoff protocols and finding communication patterns

**Project-Specific Standards (Project Context):**
- Technology-specific quality criteria and security requirements
- Domain-specific compliance and validation standards
- Team-specific review processes and quality expectations

**Active Review Work (Project Todos):**
- Current review requests and their specific scope
- Quality improvement initiatives and their progress
- Historical review findings and their resolution status
```

**2.4 Agent-Manager Persona Instructions Update:**

Add section to `agent-manager/INSTRUCTIONS.md`:

```markdown
## Framework Directory Structure

### 🏗️ Framework Personas (`.personas/framework/personas/`)

**Purpose:** Universal coordination and framework maintenance definitions

**Agent-Manager-Specific Framework Content:**
- `INSTRUCTIONS.md` - Universal Agent-Manager persona coordination patterns
- `CONTEXT-GUIDE.md` - General coordination and maintenance methodologies
- `QUICK-START.md` - Universal quick-start guide for coordination workflows

### 🎯 Project Contexts (`.personas/project/contexts/agent-manager/`)

**Purpose:** Project-specific coordination patterns and organizational customizations

**Agent-Manager-Specific Project Context:**
- Project-specific coordination and communication protocols
- Team-specific workflow patterns and handoff procedures
- Organization-specific documentation and maintenance standards
- Project-specific tool integrations and automation patterns

### 📋 Project Todos (`.personas/project/todos/agent-manager/`)

**Purpose:** Active coordination and maintenance task management

**Agent-Manager Task Management:**
- `current/` - Active coordination tasks and framework maintenance
- `backlog/` - Planned organizational improvements and process enhancements
- `completed/` - Archive of completed coordination work and process changes

### Coordination Scope Management

**Framework-Level Coordination:**
- Universal persona interaction patterns and handoff protocols
- Standard documentation lifecycle and maintenance procedures
- Core framework validation and consistency checking

**Project-Level Coordination:**
- Team-specific communication and coordination patterns
- Project-specific documentation and organizational standards
- Custom workflow adaptations and process improvements

**Operational Coordination:**
- Day-to-day task coordination and workflow management
- Active issue resolution and process optimization
- Real-time communication and status management
```

### Phase 3: Update Context Hierarchy References

**3.1 Standardize Context Hierarchy Sections:**

Ensure all personas use consistent context hierarchy that clearly references:

```markdown
## Context Hierarchy

### Priority 1: Framework Understanding (Read-Only Reference)
1. **Universal Persona Definition**
   - `.personas/framework/personas/[persona]/INSTRUCTIONS.md` - Core persona responsibilities and methodologies
   - Universal workflows, handoff protocols, and standard procedures
   - Project-agnostic best practices and quality standards

### Priority 2: Project Adaptation (Actively Customize)
1. **Project-Specific Context**
   - `.personas/project/contexts/[persona]/` - Project-specific adaptations and customizations
   - Technology-specific patterns, domain knowledge, and project standards
   - Team-specific processes and customized workflows

2. **Technical Specifications**
   - `.personas/project/TECH-SPEC.md` - Project architecture and technical requirements
   - `.personas/project/STANDARDS.md` - Project coding standards and conventions
   - `.personas/project/DEPENDENCIES.md` - External dependencies and constraints

### Priority 3: Active Work Execution (Continuously Update)
1. **Current Tasks and Workflow**
   - `.personas/project/todos/[persona]/current/` - Active tasks requiring immediate attention
   - Specific task acceptance criteria and implementation requirements
   - Dependencies and coordination requirements with other personas

2. **Work History and Planning**
   - `.personas/project/todos/[persona]/backlog/` - Planned future work and initiatives
   - `.personas/project/todos/[persona]/completed/` - Historical work and outcomes
   - Pattern analysis and lessons learned from previous tasks
```

### Phase 4: Update Quick-Start Guides

**4.1 Add Directory Orientation to All Quick-Start Guides:**

Add consistent section to all `QUICK-START.md` files:

```markdown
## 🗂️ Directory Orientation

Before starting, understand the three-tier structure:

**🏗️ Framework (`.personas/framework/personas/[persona]/`):**
- Universal persona definition - read this first
- Project-agnostic best practices and methodologies
- Standard workflows and handoff protocols
- **Do not modify** - these are framework definitions

**🎯 Project Context (`.personas/project/contexts/[persona]/`):**
- Project-specific customizations and adaptations
- Technology and domain-specific patterns
- **Actively customize** for your project needs
- Update as your project evolves

**📋 Project Todos (`.personas/project/todos/[persona]/`):**
- Active task management and workflow execution
- Current work, planned initiatives, completed tasks
- **Continuously update** as work progresses
- Reflects real-time project state

### Getting Started Flow

1. **📖 Read Framework Instructions:** Understand your persona's universal responsibilities
2. **⚙️ Customize Project Context:** Adapt patterns and practices for your project
3. **🚀 Execute via Todos:** Create and manage tasks for actual work
```

### Phase 5: Update Framework Documentation

**5.1 Update Main Framework Documentation:**

Add directory purpose clarification to `PERSONA-FRAMEWORK.md`:

```markdown
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
```

## Implementation Details

### File Modification List

**Primary Persona Instructions:**
- `.personas/framework/personas/engineer/INSTRUCTIONS.md`
- `.personas/framework/personas/planner/INSTRUCTIONS.md`
- `.personas/framework/personas/reviewer/INSTRUCTIONS.md`
- `.personas/framework/personas/agent-manager/INSTRUCTIONS.md`

**Quick-Start Guides:**
- `.personas/framework/personas/engineer/QUICK-START.md`
- `.personas/framework/personas/planner/QUICK-START.md`
- `.personas/framework/personas/reviewer/QUICK-START.md`
- `.personas/framework/personas/agent-manager/QUICK-START.md`

**Framework Documentation:**
- `.personas/framework/PERSONA-FRAMEWORK.md`
- `README.md` (main framework README)

**Project Template:**
- `.personas/framework/project-template/README.md`

### Content Standards

**Consistent Terminology:**
- "Framework Personas" (not "framework directory")
- "Project Contexts" (not "project directory")
- "Project Todos" (not "todos directory")
- Use clear purpose statements and scope definitions
- Include modification guidelines for each tier

**Visual Indicators:**
- 🏗️ for Framework tier (universal/structural)
- 🎯 for Project tier (targeted/specific)
- 📋 for Operational tier (active/dynamic)

## Risk Assessment

### Low-Risk Implementation

**This enhancement is low-risk because:**
- Pure documentation improvement with no functional changes
- Clarifies existing structure rather than changing it
- Improves user understanding and framework adoption
- No impact on existing workflows or tools

### Potential Benefits

**1. Improved Framework Adoption:**
- Clearer understanding leads to better usage
- Reduced confusion during initial setup
- More effective project customization

**2. Better Framework Maintenance:**
- Clear separation prevents inappropriate modifications
- Project teams understand customization boundaries
- Framework updates don't conflict with project customizations

## Success Metrics

- [ ] All persona instructions include directory disambiguation section
- [ ] Context hierarchy sections consistently reference appropriate directories
- [ ] Quick-start guides include directory orientation
- [ ] Framework documentation explains three-tier architecture
- [ ] Examples demonstrate proper usage of each directory type
- [ ] Cross-references between directories are clear and accurate

## Implementation Timeline

**Day 1:** Update Engineer and Planner persona instructions
**Day 2:** Update Reviewer and Agent-Manager persona instructions
**Day 3:** Update all quick-start guides with directory orientation
**Day 4:** Update framework documentation and README files
**Day 5:** Review and validation of all changes

**Total Effort:** 5 days

## Handoff Requirements

**To Reviewer:**
- Review all documentation updates for clarity and accuracy
- Validate that directory purposes are clearly distinguished
- Check consistency across all persona instructions
- Verify that examples properly demonstrate usage patterns

**To Agent-Manager:**
- Coordinate documentation updates across framework
- Ensure consistent terminology and visual indicators
- Update any additional framework documentation
- Plan communication about clarified structure

**To Planner:**
- Integration with framework adoption strategy
- Consider impact on framework evolution roadmap
- Plan for future directory structure enhancements

---

**Dependencies:**
- Should be implemented after TODO structure refactoring is complete
- Coordinates with framework documentation improvements
- Aligns with project template standardization efforts

**Status:** Ready for implementation
