# Implement Personas - Discrete Tasks

**Created:** August 27, 2025  
**Owner:** Agent Manager Persona  
**Priority:** HIGH  
**Status:** 🔄 ACTIVE

## Problem Statement

The current `.agent` directory is too broad and overwhelming for agents to quickly orient and act effectively. The 296-line `AGENTS.md` file contains universal instructions that create cognitive overload. Persona-specific instruction files are mostly empty, missing the specialized guidance needed for focused agent work.

**Key Issues:**

- Persona instruction files are empty or minimal
- All agents receive the same overwhelming instruction set  
- No clear role separation or specialized priorities
- Context overload prevents quick orientation and action

## Solution: Refined Persona-Specific Instructions

Create focused, role-specific instruction sets that allow agents to quickly understand their role, priorities, and relevant context without information overload.

---

## Discrete Implementation Tasks

### Task 1: Design Persona Framework

**Priority:** HIGH | **Effort:** Small | **Dependencies:** None | **Status:** ✅ COMPLETE

**Objective:** Define the core framework for persona specialization

**Deliverables:**

- [x] Create `PERSONA-FRAMEWORK.md` in `/personas/` root directory
- [x] Define clear role boundaries and responsibilities for each persona
- [x] Establish common instruction patterns and templates
- [x] Define persona interaction protocols (when agents hand off work)

**Acceptance Criteria:**

- [x] Each persona has clear, non-overlapping responsibilities
- [x] Framework defines how personas coordinate and hand off tasks
- [x] Template structure defined for consistent instruction format

**Completed:** August 27, 2025

---

### Task 2: Refactor Agent-Manager Instructions

**Priority:** HIGH | **Effort:** Medium | **Dependencies:** Task 1 | **Status:** ✅ COMPLETE

**Objective:** Create comprehensive Agent-Manager persona instructions

**Deliverables:**

- [x] Expand `agent-manager/INSTRUCTIONS.md` with full role definition
- [x] Define Agent-Manager responsibilities (directory maintenance, coordination)
- [x] Create Agent-Manager specific workflow and priorities
- [x] Define escalation patterns for tasks requiring other personas

**Focus Areas for Agent-Manager:**

- [x] `.agent` directory organization and maintenance
- [x] Documentation lifecycle management  
- [x] TODO task validation and archival
- [x] Persona coordination and task routing
- [x] Historical content preservation

**Acceptance Criteria:**

- [x] Clear workflow for housekeeping and maintenance tasks
- [x] Defined responsibilities for coordinating other personas
- [x] Specific instructions for archival and organization

**Completed:** August 27, 2025

---

### Task 3: Create Engineer Persona Instructions

**Priority:** HIGH | **Effort:** Medium | **Dependencies:** Task 1 | **Status:** ✅ COMPLETE

**Objective:** Create focused Engineer persona for implementation work

**Deliverables:**

- [x] Populate `engineer/INSTRUCTIONS.md` with implementation-focused guidance
- [x] Define Engineer-specific priorities and workflow
- [x] Create context hierarchy focused on code implementation
- [x] Define handoff patterns to/from other personas

**Focus Areas for Engineer:**

- [x] Code implementation and debugging
- [x] Test writing and validation
- [x] API compatibility and integration
- [x] Performance optimization implementation
- [x] Error handling and edge cases

**Context Priority for Engineers:**

1. ✅ Current TODO tasks (`todo/current/`)
2. ✅ Technical specifications (`go-stream-tech-spec-v0.3.md`)  
3. ✅ Code analysis results (`analysis/white-glove-review.md`)
4. ✅ Test requirements and patterns

**Acceptance Criteria:**

- [x] Clear implementation workflow and priorities
- [x] Focused context hierarchy for coding tasks
- [x] Integration patterns with testing and validation

**Completed:** August 27, 2025

---

### Task 4: Create Planner Persona Instructions

**Priority:** HIGH | **Effort:** Medium | **Dependencies:** Task 1 | **Status:** ✅ COMPLETE

**Objective:** Create focused Planner persona for architecture and roadmapping

**Deliverables:**

- [x] Populate `planner/INSTRUCTIONS.md` with planning-focused guidance
- [x] Define Planner-specific analysis and breakdown methods
- [x] Create context hierarchy focused on architecture and dependencies
- [x] Define task breakdown and estimation guidelines

**Focus Areas for Planner:**

- [x] Architecture analysis and design decisions
- [x] Task breakdown and dependency mapping
- [x] Roadmap planning and prioritization
- [x] Risk assessment and mitigation planning
- [x] Integration point analysis

**Context Priority for Planners:**

1. ✅ Technical specifications and architecture docs
2. ✅ TODO validation reports and status
3. ✅ Code analysis for architectural insights
4. ✅ Historical implementation patterns

**Acceptance Criteria:**

- [x] Clear planning methodology and deliverable formats
- [x] Systematic approach to task breakdown
- [x] Integration with other personas' workflows

**Completed:** August 27, 2025

---

### Task 5: Create Reviewer Persona Instructions

**Priority:** HIGH | **Effort:** Medium | **Dependencies:** Task 1 | **Status:** ✅ COMPLETE

**Objective:** Create focused Reviewer persona for quality assurance

**Deliverables:**

- [x] Populate `reviewer/INSTRUCTIONS.md` with review-focused guidance  
- [x] Define Reviewer-specific quality criteria and checklists
- [x] Create context hierarchy focused on quality analysis
- [x] Define review deliverable formats and standards

**Focus Areas for Reviewer:**

- [x] Code quality and security analysis
- [x] Performance bottleneck identification
- [x] Architecture review and recommendations
- [x] Documentation quality assessment
- [x] Test coverage and quality validation

**Context Priority for Reviewers:**

1. ✅ Code analysis and review documents (`analysis/`)
2. ✅ Technical specifications for compliance checking
3. ✅ Current implementation state vs. requirements
4. ✅ Historical issues and patterns

**Acceptance Criteria:**

- [x] Systematic review methodology and criteria
- [x] Clear quality standards and metrics
- [x] Standardized review deliverable formats

**Completed:** August 27, 2025

---

### Task 6: Create Context Filtering System

**Priority:** MEDIUM | **Effort:** Medium | **Dependencies:** Tasks 2-5 | **Status:** ✅ COMPLETE

**Objective:** Implement context filtering so each persona gets relevant information

**Deliverables:**

- [x] Create persona-specific context guides in each persona directory
- [x] Define which documents are primary/secondary for each persona
- [x] Create quick-start guides for each persona with essential context only
- [x] Implement cross-referencing system between personas

**Context Filtering Rules:**

- ✅ **Engineer:** Technical specs → Code analysis → Current TODOs → Implementation history
- ✅ **Planner:** Architecture docs → TODO status → Dependency analysis → Roadmap history  
- ✅ **Reviewer:** Analysis docs → Quality metrics → Code review history → Standards
- ✅ **Agent-Manager:** Organization docs → Housekeeping status → Archive procedures

**Acceptance Criteria:**

- [x] Each persona has clear context priority hierarchy
- [x] Context documents are tagged for persona relevance
- [x] Quick-start guides enable fast orientation

**Completed:** August 27, 2025

---

### Task 7: Implement Persona Coordination Protocols

**Priority:** MEDIUM | **Effort:** Small | **Dependencies:** Tasks 2-6

**Objective:** Define how personas hand off work and coordinate efforts

**Deliverables:**

- [ ] Create `COORDINATION-PROTOCOLS.md` in `/personas/` root
- [ ] Define handoff triggers and procedures between personas
- [ ] Create templates for persona-to-persona communication
- [ ] Define escalation paths for complex tasks

**Coordination Patterns:**

- **Planner → Engineer:** Task breakdown with acceptance criteria
- **Engineer → Reviewer:** Implementation complete, ready for review
- **Reviewer → Engineer:** Issues found, specific fixes needed
- **Any → Agent-Manager:** Documentation updates, archival requests

**Acceptance Criteria:**

- Clear handoff procedures and triggers
- Standardized communication templates
- Defined escalation paths for issues

---

### Task 8: Refactor AGENTS.md for Persona System

**Priority:** LOW | **Effort:** Large | **Dependencies:** Tasks 1-7

**Objective:** Refactor the overwhelming AGENTS.md into persona-aware routing

**Deliverables:**

- [ ] Convert `AGENTS.md` from universal instructions to persona router
- [ ] Create lightweight orientation guide for persona selection
- [ ] Move detailed instructions to persona-specific files
- [ ] Maintain quick navigation and reference sections

**New AGENTS.md Structure:**

1. **Persona Selection Guide** (How to choose the right persona)
2. **Quick Navigation** (Essential links only)
3. **Cross-Persona References** (When to coordinate)
4. **Emergency Procedures** (Fallback for unclear situations)

**Acceptance Criteria:**

- AGENTS.md reduced to <100 lines for quick orientation
- Clear persona selection criteria
- Preserved essential navigation and emergency procedures

---

## Implementation Strategy

### Phase 1: Foundation (Tasks 1-2)

- Establish persona framework and Agent-Manager baseline
- Validate approach with current Agent-Manager workflows

### Phase 2: Core Personas (Tasks 3-5)

- Implement Engineer, Planner, and Reviewer personas in parallel
- Test persona-specific instructions with actual tasks

### Phase 3: Integration (Tasks 6-7)

- Implement context filtering and coordination protocols
- Validate persona interactions and handoffs

### Phase 4: Refinement (Task 8)

- Refactor AGENTS.md based on lessons learned
- Optimize for minimal cognitive load and maximum effectiveness

## Success Metrics

### Quantitative Goals

- **Orientation Time:** <2 minutes for agents to understand their role and start work
- **Context Load:** <50 lines of essential instructions per persona
- **Handoff Efficiency:** <1 minute to transfer work between personas

### Qualitative Goals

- **Role Clarity:** Each agent clearly understands their specific responsibilities
- **Context Relevance:** Agents only see information relevant to their role
- **Coordination Smoothness:** Seamless handoffs between personas without confusion

## Risk Mitigation

### Risk: Over-Fragmentation

**Mitigation:** Maintain overlap documentation and clear escalation paths

### Risk: Context Loss

**Mitigation:** Cross-reference essential context across personas, preserve AGENTS.md as fallback

### Risk: Coordination Overhead

**Mitigation:** Keep handoff procedures lightweight, use templates for efficiency

---

**Next Steps:** Tasks 1-6 ✅ COMPLETE. Context filtering implemented! Ready to proceed with Task 7 (Persona Coordination Protocols).
