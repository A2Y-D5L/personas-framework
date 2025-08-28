# Agent-Manager Context Guide

**Purpose:** Essential context for coordination and maintenance work  
**Updated:** August 27, 2025

## Context Priority Hierarchy

### 🔴 Priority 1: Essential Context (Review First)

**Must review before starting any coordination task:**

#### Organization Status and Housekeeping
- **Location:** [`./todos/coordination/`](./todos/coordination/) - Framework meta-tasks (see [`./todos/README.md`](./todos/README.md))
- **Purpose:** Current task status and completion tracking
- **Usage:** Validating task accuracy and archival needs
- **Tag:** `#manager-priority`

- **Location:** [`/housekeeping/`](../../../housekeeping/) - Maintenance procedures
- **Purpose:** Ongoing maintenance and organizational tasks
- **Usage:** Understanding current housekeeping status and needs
- **Tag:** `#manager-priority`

#### Archive Procedures and Historical Content
- **Location:** [`/archive/`](../../../archive/) - Historical content preservation
- **Purpose:** Preserved historical content and archival patterns
- **Usage:** Understanding archival procedures and content organization
- **Tag:** `#manager-priority`

### 🟡 Priority 2: Supporting Context (For Complex Coordination)

#### Persona Coordination Requirements
- **Location:** Pending handoffs between personas
- **Purpose:** Active coordination needs and task routing
- **Usage:** Facilitating smooth handoffs between personas
- **Tag:** `#manager-secondary`

#### Documentation State and Currency
- **Location:** Recent changes in project files and documentation
- **Purpose:** Understanding documentation update needs
- **Usage:** Identifying outdated content and update requirements
- **Tag:** `#manager-secondary`

### 🟢 Priority 3: Background Context (Reference as Needed)

#### Technical Content for Routing Decisions
- **Location:** [`/go-stream-tech-spec-v0.3.md`](../../../go-stream-tech-spec-v0.3.md)
- **Purpose:** Technical context for informed task routing
- **Usage:** Understanding technical content to route tasks appropriately
- **Tag:** `#manager-background`

- **Location:** [`/analysis/`](../../../analysis/) directory
- **Purpose:** Quality and technical analysis for context
- **Usage:** Understanding system state for coordination decisions
- **Tag:** `#manager-background`

#### Persona Instructions for Coordination
- **Location:** All persona `INSTRUCTIONS.md` files
- **Purpose:** Understanding each persona's capabilities and boundaries
- **Usage:** Effective task routing and coordination
- **Tag:** `#manager-background`

## Quick Context Lookup

### For Daily Housekeeping
1. Review framework todos (`../engineer/todos/current/`, `../planner/todos/current/`, `../reviewer/todos/current/`) and project todos (`../../../../project/todos/*/current/`) for completed tasks needing archival
2. Check recent project changes for documentation updates needed
3. Validate persona handoffs for quality and completeness
4. Update timestamps and completion dates

### For Task Routing
1. Analyze task description for persona assignment triggers
2. Package appropriate context for target persona
3. Create handoff documentation using standard templates
4. Monitor progress and facilitate coordination

### For Documentation Lifecycle
1. Archive existing versions before updates
2. Update with current information maintaining organization
3. Validate links and cross-references
4. Update related documents for consistency

## Cross-Persona References

### When to Route to Other Personas

**Route to Engineer When:**
- Tasks contain: "implement", "fix", "debug", "optimize", "code"
- Implementation work or coding required
- Technical debugging or performance optimization needed

**Route to Planner When:**
- Tasks contain: "plan", "design", "architecture", "roadmap", "breakdown"
- Architecture decisions or planning required
- Task breakdown or dependency analysis needed

**Route to Reviewer When:**
- Tasks contain: "review", "analyze", "assess", "quality", "security"
- Quality assessment or code review required
- Security or performance analysis needed

### Quick Links to Other Personas
- [Engineer Instructions](../engineer/INSTRUCTIONS.md)
- [Planner Instructions](../planner/INSTRUCTIONS.md)
- [Reviewer Instructions](../reviewer/INSTRUCTIONS.md)

## Context Tags Reference

- `#manager-priority` - Must review for organizational and coordination tasks
- `#manager-secondary` - Review for complex coordination and documentation needs
- `#manager-background` - Reference material for routing and context decisions
- `#cross-persona` - Relevant to multiple personas, coordinate as needed
