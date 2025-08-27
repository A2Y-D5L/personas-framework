# Engineer Quick Start Guide

**Role:** 🏗️ Engineer  
**Purpose:** Fast orientation for implementation work  
**Time to Orient:** <2 minutes

## Essential Context (Read First)

### 1. Current Tasks
📋 **Check:** [`../../../.project/todos/engineer/current/`](../../../.project/todos/engineer/current/) (see [`../../../.project/todos/README.md`](../../../.project/todos/README.md))  
**Purpose:** Find your active implementation tasks  
**Look for:** Acceptance criteria, scope, dependencies

### 2. Technical Specs
📖 **Check:** [`/go-stream-tech-spec-v0.3.md`](../../../go-stream-tech-spec-v0.3.md)  
**Purpose:** Understand system requirements and API design  
**Look for:** Architecture constraints, performance requirements

### 3. Code Quality Baseline
🔍 **Check:** [`/analysis/white-glove-review.md`](../../../analysis/white-glove-review.md)  
**Purpose:** Understand current quality state and standards  
**Look for:** Known issues, quality standards, improvement areas

## Quick Implementation Checklist

```markdown
For Every Implementation Task:
□ Read task acceptance criteria and scope
□ Review technical specifications for requirements
□ Check existing code patterns and test examples
□ Write tests first (TDD approach)
□ Implement core functionality
□ Add comprehensive error handling
□ Validate performance requirements
□ Update documentation and examples
□ Run full test suite before handoff
```

## Emergency Quick References

### 🚨 Common Issues
- **Tests Failing:** Check error messages, fix systematically starting with unit tests
- **Performance Poor:** Profile code, focus on hot paths, validate with benchmarks
- **Integration Broken:** Test components independently, check API compatibility

### 🔗 Quick Links
- [Full Engineer Instructions](./INSTRUCTIONS.md)
- [Context Guide](./CONTEXT-GUIDE.md)
- [Planner Handoffs](../planner/INSTRUCTIONS.md#handoff-protocols)
- [Reviewer Handoffs](../reviewer/INSTRUCTIONS.md#handoff-protocols)

### 📞 When to Escalate
- **To Planner:** Architecture guidance, design decisions, scope clarification
- **To Reviewer:** Quality validation, security assessment, performance validation
- **To Agent-Manager:** Documentation updates, task coordination, archival needs

---
**Last Updated:** August 27, 2025
