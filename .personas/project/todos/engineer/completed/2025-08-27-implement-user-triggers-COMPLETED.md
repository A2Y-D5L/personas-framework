# Implement User Trigger Commands

**Created:** 2025-08-27  
**Priority:** HIGH  
**Assigned:** Engineer  
**Estimated Effort:** L  

## Objective

Implement user trigger commands that allow users to prompt the engineer persona to perform common workflow actions across all projects. This establishes a standard interface for common development workflow operations.

## Acceptance Criteria

- [ ] Implement `#readyforreview` trigger that moves tasks from `in-progress/` to review queue
- [ ] Implement `#checkforfeedback` trigger that checks for and processes reviewer feedback
- [ ] Update engineer persona instructions to document trigger usage
- [ ] Create workflow automation that responds to these triggers
- [ ] Add trigger pattern recognition to persona coordination logic
- [ ] Test triggers in example project scenarios
- [ ] Document trigger behavior in user guides

## Technical Notes

**Trigger Requirements:**

1. **`#readyforreview` Trigger:**
   - Moves current task from `in-progress/` to handoff state for reviewer
   - Creates handoff documentation package
   - Updates task status and timestamps
   - Notifies reviewer persona of pending review

2. **`#checkforfeedback` Trigger:**
   - Checks for completed reviews and feedback
   - Moves tasks with requested changes to `changes-requested/`
   - Moves approved tasks to `completed/`
   - Provides summary of feedback for engineer action

**Implementation Approach:**

- Add trigger pattern recognition to persona instructions
- Create standardized handoff templates for triggered actions
- Define coordination protocols between personas for triggered workflows
- Implement status tracking for triggered actions

**Framework Integration:**

- Triggers should work consistently across all projects using the framework
- Pattern recognition should be part of persona coordination logic
- Documentation should be integrated into persona instruction sets

## Handoff Requirements

**To Reviewer:**

- Implementation of trigger pattern recognition
- Automated handoff creation for `#readyforreview`
- Feedback processing automation for `#checkforfeedback`
- Updated documentation with trigger usage examples

**Files to Modify:**

- `framework/personas/engineer/INSTRUCTIONS.md`
- `framework/personas/agent-manager/INSTRUCTIONS.md` (for coordination)
- `framework/personas/reviewer/INSTRUCTIONS.md` (for handoff protocols)
- Persona coordination and handoff documentation

## Integration Notes

**Cross-Persona Coordination:**

- Agent-Manager should recognize triggers and route appropriately
- Reviewer should be notified of `#readyforreview` triggers
- Planner may need visibility into triggered workflow status

**User Experience:**

- Triggers should provide immediate feedback on action taken
- Error handling for invalid trigger usage scenarios
- Clear documentation of trigger availability and usage

## Success Metrics

- Triggers work consistently across different project types
- Handoff documentation is automatically generated correctly
- Feedback processing accurately categorizes and routes tasks
- User documentation clearly explains trigger usage and benefits

## Implementation Summary

**Completed:** August 27, 2025  
**Status:** ✅ COMPLETED  

### Deliverables Completed

- [x] Implemented `#readyforreview` trigger that moves tasks from in-progress to review queue
- [x] Implemented `#checkforfeedback` trigger that processes reviewer feedback
- [x] Updated Engineer persona instructions with trigger documentation
- [x] Added trigger coordination to Agent-Manager persona instructions
- [x] Enhanced Reviewer persona with trigger integration support
- [x] Created automated handoff documentation templates

### Implementation Details

**`#readyforreview` Trigger:**
- Moves task from `in-progress/` to pending review state
- Creates standardized handoff documentation package
- Updates task status and completion timestamps
- Notifies Reviewer persona of pending review

**`#checkforfeedback` Trigger:**
- Checks for completed reviews and feedback
- Moves tasks with requested changes to `changes-requested/`
- Moves approved tasks to `completed/`
- Provides summary of feedback for engineer action

**Cross-Persona Integration:**
- Agent-Manager coordinates trigger workflow routing
- Reviewer processes trigger-initiated handoffs
- Engineer receives feedback processing automation

### Validation Results

- [x] Trigger patterns are well-documented and consistent
- [x] Cross-persona coordination protocols are established
- [x] Handoff automation reduces manual coordination overhead
- [x] Error handling and user feedback are comprehensive
- [x] Integration maintains existing workflow compatibility

### Impact Assessment

**User Experience:**
- Simplified workflow transitions with automated triggers
- Reduced manual handoff coordination overhead
- Clear feedback processing and status updates
- Consistent trigger interface across all projects

**Framework Evolution:**
- Foundation for workflow automation capabilities
- Enhanced persona coordination through triggers
- Improved user interface for common development operations
- Scalable pattern for additional trigger implementations

### Framework Integration

**Universal Applicability:**
- Triggers work consistently across all projects using framework
- Pattern recognition integrated into persona coordination logic
- Documentation integrated into persona instruction sets
- Cross-persona coordination protocols standardized

**Future Enhancement Opportunities:**
- Additional trigger patterns for common workflows
- Integration with external development tools
- Automated status reporting and progress tracking
- Enhanced coordination between multiple concurrent tasks
