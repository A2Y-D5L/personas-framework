# Reviewer Context Guide

**Purpose:** Essential context for quality assurance and analysis work  
**Updated:** August 27, 2025

## Context Priority Hierarchy

### 🔴 Priority 1: Essential Context (Review First)

**Must review before starting any review task:**

#### Code Analysis and Review Documents
- **Location:** [`/analysis/white-glove-review.md`](../../../analysis/white-glove-review.md)
- **Purpose:** Comprehensive code analysis results and findings
- **Usage:** Understanding current quality state and identified issues
- **Tag:** `#reviewer-priority`

- **Location:** [`/analysis/comprehensive-code-review.md`](../../../analysis/comprehensive-code-review.md)
- **Purpose:** Detailed technical review and recommendations
- **Usage:** Baseline for quality standards and improvement tracking
- **Tag:** `#reviewer-priority`

#### Technical Specifications for Compliance
- **Location:** [`/go-stream-tech-spec-v0.3.md`](../../../go-stream-tech-spec-v0.3.md)
- **Purpose:** Technical requirements and standards for compliance checking
- **Usage:** Validating implementations against specifications
- **Tag:** `#reviewer-priority`

### 🟡 Priority 2: Supporting Context (For Complex Reviews)

#### Current Implementation State vs Requirements
- **Location:** Project source code and recent changes
- **Purpose:** Understanding current implementation completeness
- **Usage:** Assessing implementation quality against requirements
- **Tag:** `#reviewer-secondary`

#### Quality Standards and Guidelines
- **Location:** Coding standards documentation and best practices
- **Purpose:** Standards for quality assessment and validation
- **Usage:** Applying consistent quality criteria
- **Tag:** `#reviewer-secondary`

### 🟢 Priority 3: Background Context (Reference as Needed)

#### Historical Issues and Patterns
- **Location:** [`/archive/`](../../../archive/) directory
- **Purpose:** Previous quality issues and their resolutions
- **Usage:** Learning from past issues and improvement patterns
- **Tag:** `#reviewer-background`

#### Industry Standards and Compliance
- **Location:** External standards documentation and compliance guides
- **Purpose:** Industry best practices and compliance requirements
- **Usage:** Ensuring adherence to external standards
- **Tag:** `#reviewer-background`

## Quick Context Lookup

### For Code Quality Reviews
1. Review current analysis documents for baseline
2. Check technical specifications for compliance requirements
3. Examine current implementation for quality assessment
4. Reference historical patterns for consistency

### For Security Reviews
1. Review security-focused analysis in current documents
2. Check technical specifications for security requirements
3. Assess current implementation for vulnerabilities
4. Reference industry security standards

### For Performance Reviews
1. Review performance analysis in current documents
2. Check technical specifications for performance requirements
3. Analyze current implementation for bottlenecks
4. Reference performance benchmarks and standards

## Cross-Persona References

### When to Consult Other Personas

**Consult Engineer When:**
- Implementation feasibility of recommendations unclear
- Technical details need clarification
- Fix effort estimation required

**Consult Planner When:**
- Architecture implications of quality issues
- System-wide refactoring planning needed
- Long-term quality improvement roadmap required

**Consult Agent-Manager When:**
- Quality standards documentation needs updates
- Review process coordination required
- Historical quality data needs research

### Quick Links to Other Personas
- [Engineer Instructions](../engineer/INSTRUCTIONS.md)
- [Planner Instructions](../planner/INSTRUCTIONS.md)
- [Agent-Manager Instructions](../agent-manager/INSTRUCTIONS.md)

## Context Tags Reference

- `#reviewer-priority` - Must review before starting quality assessment
- `#reviewer-secondary` - Review for complex or comprehensive analysis
- `#reviewer-background` - Reference material for standards and context
- `#cross-persona` - Relevant to multiple personas, coordinate as needed
