# Engineer Context Guide

**Purpose:** Essential context for implementation work  
**Updated:** August 27, 2025

## Context Priority Hierarchy

### 🔴 Priority 1: Essential Context (Review First)

**Must review before starting any implementation task:**

#### Current Implementation Tasks

- **Location:** [`../../../../project/todos/engineer/current/`](../../../../project/todos/engineer/current/) (see [`../../../../project/todos/README.md`](../../../../project/todos/README.md))
- **Purpose:** Active tasks requiring implementation
- **Usage:** Review scope, acceptance criteria, and dependencies
- **Tag:** `#engineer-priority`

#### Technical Specifications

- **Location:** [`/go-stream-tech-spec-v0.3.md`](../../../go-stream-tech-spec-v0.3.md)
- **Purpose:** Core architecture and API specifications
- **Usage:** Understand system design and integration requirements
- **Tag:** `#engineer-priority`

### 🟡 Priority 2: Supporting Context (For Complex Tasks)

#### Code Analysis Results

- **Location:** [`/analysis/white-glove-review.md`](../../../analysis/white-glove-review.md)
- **Purpose:** Code quality analysis and improvement recommendations
- **Usage:** Understand existing issues and quality standards
- **Tag:** `#engineer-secondary`

- **Location:** [`/analysis/comprehensive-code-review.md`](../../../analysis/comprehensive-code-review.md)
- **Purpose:** Detailed technical review findings
- **Usage:** Reference for implementation patterns and best practices
- **Tag:** `#engineer-secondary`

#### Test Requirements and Patterns

- **Location:** Project test files (`*_test.go`)
- **Purpose:** Existing test patterns and coverage examples
- **Usage:** Understand testing standards and patterns
- **Tag:** `#engineer-secondary`

### 🟢 Priority 3: Background Context (Reference as Needed)

#### Project Structure and Organization

- **Location:** Repository root directory
- **Purpose:** Understanding module organization and build patterns
- **Usage:** Reference for project conventions and structure
- **Tag:** `#engineer-background`

#### Implementation History

- **Location:** [`/archive/`](../../../archive/) directory
- **Purpose:** Historical implementation decisions and patterns
- **Usage:** Learn from previous approaches and solutions
- **Tag:** `#engineer-background`

## Quick Context Lookup

### For Feature Implementation

1. Review task in `../../../../project/todos/engineer/current/`
2. Check technical specifications for API requirements
3. Review existing code patterns in project
4. Check test coverage requirements

### For Bug Fixes

1. Review issue description and reproduction steps
2. Check code analysis for related quality issues
3. Review test patterns for regression prevention
4. Validate fix against specifications

### For Performance Optimization

1. Review performance requirements in specifications
2. Check code analysis for identified bottlenecks
3. Review existing benchmarks and profiling results
4. Validate optimization impact with tests

## Cross-Persona References

### When to Consult Other Personas

**Consult Planner When:**

- Implementation approach needs architectural guidance
- Task scope requires breakdown or clarification
- Integration decisions impact system design

**Consult Reviewer When:**

- Implementation needs quality validation
- Security implications require expert assessment
- Performance characteristics need validation

**Consult Agent-Manager When:**

- Documentation updates are needed
- Task status requires coordination
- Archive or organizational help needed

### Quick Links to Other Personas

- [Planner Instructions](../planner/INSTRUCTIONS.md)
- [Reviewer Instructions](../reviewer/INSTRUCTIONS.md)
- [Agent-Manager Instructions](../agent-manager/INSTRUCTIONS.md)

## Context Tags Reference

- `#engineer-priority` - Must review before starting work
- `#engineer-secondary` - Review for complex or quality-critical tasks
- `#engineer-background` - Reference material for context
- `#cross-persona` - Relevant to multiple personas, coordinate as needed
