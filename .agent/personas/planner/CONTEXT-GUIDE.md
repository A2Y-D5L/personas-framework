# Planner Context Guide

**Purpose:** Essential context for architecture and roadmapping work  
**Updated:** August 27, 2025

## Context Priority Hierarchy

### 🔴 Priority 1: Essential Context (Review First)

**Must review before starting any planning task:**

#### Technical Specifications and Architecture
- **Location:** [`/go-stream-tech-spec-v0.3.md`](../../../go-stream-tech-spec-v0.3.md)
- **Purpose:** Core architecture and design principles
- **Usage:** Understanding system design constraints and requirements
- **Tag:** `#planner-priority`

#### TODO Status and Validation Reports
- **Location:** [`../../../.project/todos/planner/current/`](../../../.project/todos/planner/current/) (see [`../../../.project/todos/README.md`](../../../.project/todos/README.md))
- **Purpose:** Current task status and priorities
- **Usage:** Understanding development capacity and current initiatives
- **Tag:** `#planner-priority`

### 🟡 Priority 2: Supporting Context (For Complex Planning)

#### Code Analysis for Architectural Insights
- **Location:** [`/analysis/white-glove-review.md`](../../../analysis/white-glove-review.md)
- **Purpose:** Technical debt and quality assessment
- **Usage:** Understanding system health and refactoring needs
- **Tag:** `#planner-secondary`

- **Location:** [`/analysis/comprehensive-code-review.md`](../../../analysis/comprehensive-code-review.md)
- **Purpose:** System-wide analysis and recommendations
- **Usage:** Architectural decision validation and improvement opportunities
- **Tag:** `#planner-secondary`

#### Historical Implementation Patterns
- **Location:** [`/archive/`](../../../archive/) directory
- **Purpose:** Previous planning decisions and their outcomes
- **Usage:** Learning from past approaches and avoiding repeated mistakes
- **Tag:** `#planner-secondary`

### 🟢 Priority 3: Background Context (Reference as Needed)

#### Project Structure and Dependencies
- **Location:** Repository structure, `go.mod`, build files
- **Purpose:** Understanding current organization and dependencies
- **Usage:** Planning integration and dependency management
- **Tag:** `#planner-background`

#### Team Capacity and Velocity
- **Location:** Historical task completion data in `../../../.project/todos/planner/completed/` and `/archive/`
- **Purpose:** Understanding team capacity and velocity patterns
- **Usage:** Realistic timeline estimation and resource planning
- **Tag:** `#planner-background`

## Quick Context Lookup

### For Feature Planning
1. Review technical specifications for constraints
2. Check TODO status for current capacity
3. Analyze code quality for integration complexity
4. Review historical patterns for estimation

### For Architecture Planning
1. Review current architecture in specifications
2. Check code analysis for technical debt impact
3. Review historical decisions for context
4. Assess current system health and capacity

### For Roadmap Planning
1. Review TODO validation reports for current state
2. Check technical specifications for strategic direction
3. Analyze team capacity from historical data
4. Plan milestones based on dependency analysis

## Cross-Persona References

### When to Consult Other Personas

**Consult Engineer When:**
- Implementation feasibility questions arise
- Technical constraint validation needed
- Effort estimation requires technical input

**Consult Reviewer When:**
- Architecture design needs validation
- Quality implications require assessment
- Technical risk evaluation needed

**Consult Agent-Manager When:**
- Task coordination and scheduling needed
- Documentation organization required
- Historical context needs research

### Quick Links to Other Personas
- [Engineer Instructions](../engineer/INSTRUCTIONS.md)
- [Reviewer Instructions](../reviewer/INSTRUCTIONS.md)
- [Agent-Manager Instructions](../agent-manager/INSTRUCTIONS.md)

## Context Tags Reference

- `#planner-priority` - Must review before starting planning work
- `#planner-secondary` - Review for complex or strategic planning
- `#planner-background` - Reference material for estimation and context
- `#cross-persona` - Relevant to multiple personas, coordinate as needed
