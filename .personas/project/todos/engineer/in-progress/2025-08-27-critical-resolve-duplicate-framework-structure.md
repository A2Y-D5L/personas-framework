# CRITICAL: Resolve Duplicate Framework Structure

**Created:** August 27, 2025  
**Priority:** CRITICAL  
**Assigned:** Engineer  
**Review Type:** Follow-up from completed task review  

## Objective

Resolve the critical structural inconsistency where framework files exist in both `framework/personas/` and `.personas/framework/personas/` with different content, causing confusion about the authoritative framework location.

## Issue Description

**Critical Structural Problem Identified:**

1. **Duplicate Framework Files:** Complete duplicate persona instruction files exist in:
   - `framework/personas/` (updated, project-agnostic)
   - `.personas/framework/personas/` (older, project-specific)

2. **Inconsistent Documentation:** The main PERSONA-FRAMEWORK.md files are significantly different between locations

3. **README vs. Reality Mismatch:** README indicates framework should be at `.personas/framework/` but workspace structure shows it at `framework/`

4. **Validation Issues:** Current validation scripts expect different structure than what exists

## Risk Assessment

**Impact:** HIGH - Framework adoption impossible with structural confusion  
**Urgency:** IMMEDIATE - Blocks all future framework development  
**Complexity:** MEDIUM - Requires careful consolidation and validation

## Root Cause Analysis

The completed tasks successfully updated framework documentation but failed to:
- Resolve existing duplicate directory structure
- Ensure single source of truth for framework files
- Align README instructions with actual structure
- Clean up legacy framework locations

## Acceptance Criteria

- [ ] Single authoritative framework location identified and established
- [ ] All duplicate files removed after content consolidation
- [ ] README and documentation updated to match actual structure
- [ ] Validation scripts updated to check correct locations
- [ ] All persona instructions reference correct directory paths
- [ ] Framework documentation consistency verified
- [ ] No broken internal links or references

## Implementation Plan

### Phase 1: Analysis and Decision
- [ ] Compare all duplicate files for content differences
- [ ] Determine authoritative framework location based on:
  - Workspace structure conventions
  - Framework design principles
  - User experience considerations
- [ ] Document consolidation strategy

### Phase 2: Content Consolidation
- [ ] Merge content from duplicate files (preserve best of both)
- [ ] Update all internal references to use single location
- [ ] Verify all cross-references and links work correctly

### Phase 3: Cleanup and Validation
- [ ] Remove duplicate files and empty directories
- [ ] Update README and setup instructions
- [ ] Update validation scripts to check correct locations
- [ ] Run full framework validation to ensure no broken references

## Files Requiring Attention

**Duplicate Files Identified:**
```text
DUPLICATES FOUND:
- framework/personas/*/INSTRUCTIONS.md
- .personas/framework/personas/*/INSTRUCTIONS.md
- framework/PERSONA-FRAMEWORK.md
- .personas/framework/personas/PERSONA-FRAMEWORK.md
- All framework persona files duplicated
```

**Configuration Files to Update:**
- README.md
- tools/validate-framework.sh
- tools/validate-tasks.sh
- setup.sh

## Success Criteria

- [ ] Framework structure is unambiguous and consistent
- [ ] Documentation clearly indicates correct file locations
- [ ] Validation tools pass without structural warnings
- [ ] All internal references work correctly
- [ ] README instructions match actual implementation

## Dependencies

- Coordination with Agent-Manager for directory structure decisions
- Review by Reviewer persona after implementation

## Timeline

**Target:** Complete within 1 day (immediate priority)

---

**Status:** CREATED  
**Next Steps:** Analyze duplicate files and determine consolidation strategy
