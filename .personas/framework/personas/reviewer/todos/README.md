# Reviewer TODO Management

**Persona:** 🔍 Reviewer  
**Directory:** `.personas/framework/personas/reviewer/todos/`  
**Updated:** August 27, 2025

## Directory Structure

```text
todos/
├── current/     # Active review tasks
├── backlog/     # Pending review requests
└── completed/   # Archived completed reviews
```

## Task Assignment Rules

**Reviewer tasks include:**

- Code quality assessment and review
- Architecture validation and feedback
- Security analysis and vulnerability assessment
- Performance analysis and optimization recommendations
- Documentation quality review
- Compliance and standards validation
- Risk assessment and mitigation analysis
- Integration testing coordination

## Task Management Workflow

### 1. Current Tasks (`/current/`)

Active reviews requiring immediate attention:

- **Format:** `YYYY-MM-DD-review-description.md`
- **Content:** Review objectives, scope, criteria, findings
- **Status:** Update progress and findings regularly
- **Handoffs:** Provide feedback to Engineer, recommendations to Planner

### 2. Backlog Tasks (`/backlog/`)

Pending review requests:

- **Priority:** Critical/High/Medium/Low based on risk and impact
- **Source:** Requests from Engineer (code reviews) and Planner (architecture reviews)
- **Scheduling:** Move to `/current/` based on priority and capacity

### 3. Completed Tasks (`/completed/`)

Archive of finished review work:

- **Archive:** Move from `/current/` when review complete and findings delivered
- **Format:** Include completion date, findings summary, and follow-up actions
- **Reference:** Maintain for future review patterns and quality trends

## Coordination with Other Personas

### 🏗️ Engineer Handoffs

**From Engineer to Reviewer:**

- Code review requests
- Implementation quality assessment needs
- Performance optimization analysis
- Security review requirements

**From Reviewer to Engineer:**

- Code quality feedback
- Security vulnerability reports
- Performance improvement recommendations
- Refactoring suggestions

### 📋 Planner Handoffs

**From Planner to Reviewer:**

- Architecture review requests
- Risk assessment validation
- Compliance analysis needs
- Quality criteria establishment

**From Reviewer to Planner:**

- Architecture feedback
- Risk mitigation recommendations
- Specification clarifications
- Quality improvement suggestions

### 🗂️ Agent-Manager Coordination

**Meta-tasks in `agent-manager/todos/coordination/`:**

- Cross-persona review coordination
- Quality standards enforcement
- Review process optimization
- Escalation management

## Task Templates

### Code Review Template

```markdown
# Code Review: [Component/Feature]

**Review Type:** New Code/Bug Fix/Refactoring/Performance
**Scope:** [Files and functions under review]
**Priority:** Critical/High/Medium/Low
**Requested By:** [Engineer name/reference]

## Review Objectives

- [ ] Code quality and maintainability
- [ ] Security vulnerability assessment
- [ ] Performance impact analysis
- [ ] Test coverage validation
- [ ] Documentation completeness

## Files Under Review

- [List of files with line numbers if specific]

## Findings

### ✅ Positive Observations
- [Good practices identified]

### ⚠️ Issues Identified
- [Security concerns]
- [Performance issues]
- [Code quality issues]
- [Testing gaps]

### 🔧 Recommendations
- [Specific improvement suggestions]

## Security Analysis

### Vulnerabilities Found
- [Security issues with severity ratings]

### Mitigation Recommendations
- [Specific security improvements]

## Performance Analysis

### Performance Impact
- [Analysis of performance implications]

### Optimization Opportunities
- [Performance improvement recommendations]

## Test Coverage Assessment

### Current Coverage
- [Test coverage analysis]

### Testing Gaps
- [Missing test scenarios]

## Follow-up Actions

- [ ] [Action item 1 - assigned to persona]
- [ ] [Action item 2 - assigned to persona]

## Handoff Checklist

- [ ] All findings documented
- [ ] Recommendations prioritized
- [ ] Security issues flagged appropriately
- [ ] Follow-up actions assigned
- [ ] Engineer notified of completion
```

### Architecture Review Template

```markdown
# Architecture Review: [System/Component]

**Review Type:** New Design/Modification/Assessment
**Scope:** [Architecture boundaries]
**Requested By:** [Planner reference]
**Priority:** Critical/High/Medium/Low

## Review Objectives

- [ ] Architecture soundness validation
- [ ] Scalability assessment
- [ ] Security architecture review
- [ ] Integration impact analysis
- [ ] Compliance validation

## Architecture Overview

### Current State
[Description of existing architecture]

### Proposed Changes
[Detailed description of planned architecture]

## Analysis Results

### ✅ Architecture Strengths
- [Well-designed aspects]

### ⚠️ Concerns Identified
- [Architectural issues]
- [Scalability concerns]
- [Security weaknesses]
- [Integration risks]

### 🔧 Recommendations
- [Architectural improvements]

## Security Architecture Review

### Security Strengths
- [Security measures well-implemented]

### Security Concerns
- [Security architecture issues]

### Security Recommendations
- [Security improvements needed]

## Scalability Assessment

### Scalability Strengths
- [Well-designed scalability features]

### Scalability Concerns
- [Potential bottlenecks]

### Scalability Recommendations
- [Scalability improvements]

## Integration Impact

### Positive Impacts
- [Benefits to system integration]

### Risk Areas
- [Integration risks and concerns]

### Mitigation Strategies
- [Risk mitigation approaches]

## Compliance Validation

### Standards Compliance
- [Compliance with relevant standards]

### Compliance Gaps
- [Areas needing compliance attention]

## Overall Assessment

### Approval Status
- [ ] Approved as designed
- [ ] Approved with minor modifications
- [ ] Requires significant changes
- [ ] Requires redesign

### Priority Recommendations
1. [Highest priority recommendation]
2. [Second priority recommendation]
3. [Third priority recommendation]

## Follow-up Actions

- [ ] [Action item 1 - assigned to persona]
- [ ] [Action item 2 - assigned to persona]

## Handoff Checklist

- [ ] All concerns documented
- [ ] Recommendations prioritized
- [ ] Security issues highlighted
- [ ] Compliance gaps identified
- [ ] Planner notified of completion
```
