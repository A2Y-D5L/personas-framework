# Personas Framework Quick Reference

**Generated:** August 27, 2025

## Persona Overview

| Persona | Focus | Primary Responsibilities |
|---------|-------|-------------------------|
| 🏗️ Engineer | Implementation | Code development, debugging, testing, optimization |
| 📋 Planner | Architecture | System design, planning, roadmapping, analysis |
| 🔍 Reviewer | Quality | Code review, security analysis, quality assurance |
| 🗂️ Agent-Manager | Coordination | Documentation, task coordination, process management |

## Quick Start Commands

### Setup New Project
```bash
# Clone framework
git clone [framework-repo] personas-framework
cd personas-framework

# Setup in your project
./setup.sh /path/to/your/project

# Or interactive setup
./setup.sh /path/to/your/project true
```

### Validation Commands
```bash
# Validate framework structure
./tools/validate-framework.sh /path/to/project

# Validate task formatting
./tools/validate-tasks.sh /path/to/project

# Run full test suite
./tools/test-framework.sh
```

### Daily Workflow

1. **Check your persona's tasks:**
   ```bash
   ls .personas/project/todos/[your-persona]/current/
   ```

2. **Create a new task:**
   ```bash
   # Use naming convention: YYYY-MM-DD-description.md
   touch .personas/project/todos/[persona]/current/$(date +%Y-%m-%d)-task-name.md
   ```

3. **Move completed tasks:**
   ```bash
   mv .personas/project/todos/[persona]/current/task.md \
      .personas/project/todos/[persona]/completed/
   ```

## Task File Template

```markdown
# Task Title

**Created:** 2025-08-27
**Priority:** HIGH/MEDIUM/LOW
**Assigned:** [Persona]
**Type:** [Implementation/Planning/Review/etc.]

## Objective
[Clear description of what needs to be accomplished]

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Testing completed
- [ ] Documentation updated

## Technical Notes
[Implementation details, constraints, dependencies]

## Progress Updates
[Regular status updates]
```

## Handoff Protocol

### Engineer → Reviewer
- Complete implementation with tests
- Performance validation completed
- Documentation updated
- Ready for quality review

### Planner → Engineer
- Detailed implementation plan
- Technical specifications
- Architecture decisions documented
- Clear acceptance criteria

### Reviewer → [Original Persona]
- Quality assessment completed
- Issues documented with priority
- Recommendations provided
- Follow-up actions assigned

## Emergency Procedures

### When Tasks are Blocked
1. Document the blocker in task file
2. Research alternative approaches
3. Escalate to appropriate persona:
   - Technical issues → Planner
   - Quality concerns → Reviewer
   - Coordination needs → Agent-Manager

### When Validation Fails
```bash
# Fix common issues automatically
./tools/validate-framework.sh /path/to/project false true

# Check specific task formatting
./tools/validate-tasks.sh /path/to/project specific-task.md true
```

---

**Note:** This documentation is auto-generated. Last updated: 2025-08-27
