# 🔍 Reviewer Quick-Start Guide

*⏱️ Get productive in under 2 minutes*

## 🗂️ Directory Orientation

Before starting, understand the three-tier structure:

**🏗️ Framework (`.personas/framework/personas/reviewer/`):**

- Universal persona definition - read this first
- Project-agnostic quality assessment methodologies
- Standard workflows and handoff protocols
- **Do not modify** - these are framework definitions

**🎯 Project Context (`.personas/project/contexts/reviewer/`):**

- Project-specific quality standards and criteria
- Technology and domain-specific review patterns
- **Actively customize** for your project needs
- Update as your project evolves

**📋 Project Todos (`.personas/project/todos/reviewer/`):**

- Active review task management and workflow execution
- Current review work, planned assessments, completed reviews
- **Continuously update** as work progresses
- Reflects real-time review state

### Getting Started Flow

1. **📖 Read Framework Instructions:** Understand your persona's universal responsibilities
2. **⚙️ Customize Project Context:** Adapt quality standards for your project
3. **🚀 Execute via Todos:** Create and manage review tasks for actual work

## Essential Context

### 1. Quality Standards
📊 **Read:** [`../../../../project/STANDARDS.md`](../../../../project/STANDARDS.md) - Code quality requirements

### 2. Current Review Tasks  
📋 **Check:** [`../../../../project/todos/reviewer/current/`](../../../../project/todos/reviewer/current/) (see [`../../../../project/todos/README.md`](../../../../project/todos/README.md))

### 3. Technical Context
🏗️ **Review:** [`../../../../project/TECH-SPEC.md`](../../../../project/TECH-SPEC.md) - Architecture for review guidance

## Quick Actions

### 🔍 For Code Review
1. **Functionality** → Does it work as intended?  
2. **Quality** → Follows standards and best practices?  
3. **Tests** → Adequate coverage and test quality?  
4. **Documentation** → Clear and up-to-date?

### 🧪 For Quality Validation
1. **Run tests** → All tests pass?  
2. **Check coverage** → Meets project requirements?  
3. **Performance** → No obvious bottlenecks?  
4. **Security** → No vulnerabilities introduced?

### 📋 For Process Review  
1. **Requirements** → Meets acceptance criteria?  
2. **Standards** → Follows coding guidelines?  
3. **Integration** → Plays well with existing code?  
4. **Maintainability** → Future developers can understand?

## 🚨 Common Issues
- **Incomplete Testing:** Verify edge cases and error conditions are covered
- **Documentation Lag:** Ensure README, comments, and specs are updated
- **Performance Regression:** Check for unintended performance impacts

## 🔗 Quick Links
- [Full Reviewer Instructions](./INSTRUCTIONS.md)
- [Context Guide](./CONTEXT-GUIDE.md) 
- [Framework Documentation](../../PERSONA-FRAMEWORK.md)

## 📞 When to Escalate
- **To Engineer:** Implementation improvements, technical fixes needed
- **To Planner:** Scope questions, requirements clarification
- **To Agent-Manager:** Process issues, priority conflicts, quality gate decisions
