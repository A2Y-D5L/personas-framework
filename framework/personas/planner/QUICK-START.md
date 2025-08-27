# 📋 Planner Quick-Start Guide

*⏱️ Get productive in under 2 minutes*

## 🗂️ Directory Orientation

Before starting, understand the three-tier structure:

**🏗️ Framework (`.personas/framework/personas/planner/`):**

- Universal persona definition - read this first
- Project-agnostic planning methodologies and frameworks
- Standard workflows and handoff protocols
- **Do not modify** - these are framework definitions

**🎯 Project Context (`.personas/project/contexts/planner/`):**

- Project-specific architectural patterns and constraints
- Technology and domain-specific planning approaches
- **Actively customize** for your project needs
- Update as your project evolves

**📋 Project Todos (`.personas/project/todos/planner/`):**

- Active planning task management and workflow execution
- Current planning work, planned initiatives, completed analyses
- **Continuously update** as work progresses
- Reflects real-time planning state

### Getting Started Flow

1. **📖 Read Framework Instructions:** Understand your persona's universal responsibilities
2. **⚙️ Customize Project Context:** Adapt planning patterns for your project
3. **🚀 Execute via Todos:** Create and manage planning tasks for actual work

## Essential Context

### 1. Current Planning Tasks
📋 **Check:** [`../../../../project/todos/planner/current/`](../../../../project/todos/planner/current/) (see [`../../../../project/todos/README.md`](../../../../project/todos/README.md))

### 2. Technical Architecture
🏗️ **Read:** [`../../../../project/TECH-SPEC.md`](../../../../project/TECH-SPEC.md) - System architecture and constraints

### 3. Project Context
📖 **Review:** [`../../../../project/README.md`](../../../../project/README.md) - Project overview and current state

## Quick Actions

### 🎯 For New Feature Planning
1. **Analyze requirements** → Break into implementable tasks  
2. **Check dependencies** → Map integration points  
3. **Estimate effort** → Set realistic timelines  
4. **Create handoff** → Task ready for 🏗️ Engineer

### 🔄 For Architecture Planning  
1. **Review system** → Current architecture state
2. **Identify patterns** → Reusable design approaches  
3. **Plan integration** → Clean interface design  
4. **Document decisions** → Architecture rationale

### 📊 For Roadmap Planning
1. **Assess current** → Active development status  
2. **Prioritize features** → Business value alignment  
3. **Sequence tasks** → Dependency-aware ordering  
4. **Resource planning** → Capacity and timeline estimates

## 🚨 Common Issues
- **Scope Creep:** Break large features into smaller, independent tasks
- **Dependency Conflicts:** Map all integration points before planning
- **Unrealistic Estimates:** Factor in testing, documentation, and review time

## 🔗 Quick Links
- [Full Planner Instructions](./INSTRUCTIONS.md)
- [Context Guide](./CONTEXT-GUIDE.md)
- [Framework Documentation](../../PERSONA-FRAMEWORK.md)

## 📞 When to Escalate
- **To Engineer:** Implementation feasibility questions, technical constraints
- **To Reviewer:** Quality requirements, testing strategy validation
- **To Agent-Manager:** Resource conflicts, priority changes, cross-team coordination
