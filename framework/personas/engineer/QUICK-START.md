# Engineer Quick Start Guide

**Role:** 🏗️ Engineer  
**Purpose:** Fast orientation for implementation work  
**Time to Orient:** <2 minutes

## 🗂️ Directory Orientation

Before starting, understand the three-tier structure:

**🏗️ Framework (`.personas/framework/personas/engineer/`):**

- Universal persona definition - read this first
- Project-agnostic best practices and methodologies
- Standard workflows and handoff protocols
- **Do not modify** - these are framework definitions

**🎯 Project Context (`.personas/project/contexts/engineer/`):**

- Project-specific customizations and adaptations
- Technology and domain-specific patterns
- **Actively customize** for your project needs
- Update as your project evolves

**📋 Project Todos (`.personas/project/todos/engineer/`):**

- Active task management and workflow execution
- Current work, planned initiatives, completed tasks
- **Continuously update** as work progresses
- Reflects real-time project state

### Getting Started Flow

1. **📖 Read Framework Instructions:** Understand your persona's universal responsibilities
2. **⚙️ Customize Project Context:** Adapt patterns and practices for your project
3. **🚀 Execute via Todos:** Create and manage tasks for actual work

## Essential Context (Read First)

### 1. Current Tasks
📋 **Check:** [`../../../../project/todos/engineer/current/`](../../../../project/todos/engineer/current/) (see [`../../../../project/todos/README.md`](../../../../project/todos/README.md))  
**Purpose:** Find your active implementation tasks  
**Look for:** Acceptance criteria, scope, dependencies

### 2. Technical Specs
📖 **Check:** [`../../../../project/TECH-SPEC.md`](../../../../project/TECH-SPEC.md)  
**Purpose:** Understand system requirements and API design  
**Look for:** Architecture constraints, performance requirements

### 3. Code Quality Baseline
🔍 **Check:** [`../../../../project/STANDARDS.md`](../../../../project/STANDARDS.md)  
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
