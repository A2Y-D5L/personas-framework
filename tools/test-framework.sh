#!/bin/bash

# Personas Framework Testing Suite
# Simple test runner for framework validation tools

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration
FRAMEWORK_DIR="$(dirname "$0")/.."
TOOLS_DIR="$FRAMEWORK_DIR/tools"
TEST_OUTPUT_DIR="/tmp/personas-framework-tests"

# Counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

# Helper functions
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
    TESTS_PASSED=$((TESTS_PASSED + 1))
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
    TESTS_FAILED=$((TESTS_FAILED + 1))
}

run_test() {
    local test_name="$1"
    local test_command="$2"
    
    TESTS_RUN=$((TESTS_RUN + 1))
    log_info "Running test: $test_name"
    
    if eval "$test_command" >/dev/null 2>&1; then
        log_success "$test_name"
    else
        log_error "$test_name"
    fi
}

setup_test_environment() {
    log_info "Setting up test environment..."
    
    # Clean up any previous test runs
    rm -rf "$TEST_OUTPUT_DIR"
    mkdir -p "$TEST_OUTPUT_DIR"
    
    # Create a test project structure
    mkdir -p "$TEST_OUTPUT_DIR/test-project"
    
    log_success "Test environment ready"
}

test_setup_script() {
    log_info "Testing setup script..."
    
    # Test basic setup
    run_test "Setup script execution" \
        "cd '$FRAMEWORK_DIR' && ./setup.sh '$TEST_OUTPUT_DIR/test-project' false"
    
    # Test that required directories were created
    run_test "Framework directories created" \
        "[ -d '$TEST_OUTPUT_DIR/test-project/.personas/framework' ]"
    
    run_test "Project directories created" \
        "[ -d '$TEST_OUTPUT_DIR/test-project/.personas/project' ]"
    
    run_test "Todo directories created" \
        "[ -d '$TEST_OUTPUT_DIR/test-project/.personas/project/todos/engineer/current' ]"
    
    # Test that required files were created
    run_test "Project README created" \
        "[ -f '$TEST_OUTPUT_DIR/test-project/.personas/project/README.md' ]"
    
    run_test "Tech spec created" \
        "[ -f '$TEST_OUTPUT_DIR/test-project/.personas/project/TECH-SPEC.md' ]"
}

test_validation_tools() {
    log_info "Testing validation tools..."
    
    # Test framework validator
    run_test "Framework validator execution" \
        "'$TOOLS_DIR/validate-framework.sh' '$TEST_OUTPUT_DIR/test-project' false false"
    
    # Test task validator
    run_test "Task validator execution" \
        "'$TOOLS_DIR/validate-tasks.sh' '$TEST_OUTPUT_DIR/test-project' '' false"
    
    # Create a test task and validate it
    local test_task="$TEST_OUTPUT_DIR/test-project/.personas/project/todos/engineer/current/$(date +%Y-%m-%d)-test-task.md"
    cat > "$test_task" << 'EOF'
# Test Task

**Priority:** HIGH
**Type:** Testing

## Objective

Test the task validation system.

## Acceptance Criteria

- [ ] Task is properly formatted
- [ ] Task validates without errors

## Progress Notes

Test task created for validation testing.
EOF
    
    run_test "Task file validation" \
        "'$TOOLS_DIR/validate-tasks.sh' '$TEST_OUTPUT_DIR/test-project' '' false"
}

test_framework_integrity() {
    log_info "Testing framework integrity..."
    
    # Test that all expected persona files exist
    local personas=("engineer" "planner" "reviewer" "agent-manager")
    local files=("INSTRUCTIONS.md" "QUICK-START.md" "CONTEXT-GUIDE.md")
    
    for persona in "${personas[@]}"; do
        for file in "${files[@]}"; do
            run_test "Framework file exists: $persona/$file" \
                "[ -f '$TEST_OUTPUT_DIR/test-project/.personas/framework/personas/$persona/$file' ]"
        done
    done
    
    # Test framework documentation
    run_test "Framework documentation exists" \
        "[ -f '$TEST_OUTPUT_DIR/test-project/.personas/framework/PERSONA-FRAMEWORK.md' ]"
}

cleanup_test_environment() {
    log_info "Cleaning up test environment..."
    
    if [ "$KEEP_TEST_FILES" != "true" ]; then
        rm -rf "$TEST_OUTPUT_DIR"
        log_success "Test environment cleaned up"
    else
        log_info "Test files preserved in: $TEST_OUTPUT_DIR"
    fi
}

generate_test_report() {
    echo
    echo -e "${BLUE}🧪 Test Report${NC}"
    echo "=================================="
    echo "Tests run: $TESTS_RUN"
    echo "Passed: $TESTS_PASSED"
    echo "Failed: $TESTS_FAILED"
    echo
    
    if [ $TESTS_FAILED -eq 0 ]; then
        log_success "All tests passed!"
        return 0
    else
        log_error "$TESTS_FAILED tests failed"
        return 1
    fi
}

print_usage() {
    echo "Personas Framework Test Suite"
    echo
    echo "Usage: $0 [OPTIONS]"
    echo
    echo "Options:"
    echo "  --keep-files    Preserve test files after completion"
    echo "  --help, -h      Show this help message"
    echo
    echo "Examples:"
    echo "  $0              # Run all tests"
    echo "  $0 --keep-files # Run tests and keep test files"
    echo
}

# Main execution
main() {
    echo -e "${GREEN}🧪 Personas Framework Test Suite${NC}"
    echo "Framework directory: $FRAMEWORK_DIR"
    echo "Test output directory: $TEST_OUTPUT_DIR"
    echo
    
    # Check if framework directory exists
    if [ ! -d "$FRAMEWORK_DIR/framework" ]; then
        log_error "Framework directory not found: $FRAMEWORK_DIR/framework"
        exit 1
    fi
    
    # Check if tools exist
    if [ ! -f "$TOOLS_DIR/validate-framework.sh" ]; then
        log_error "Framework validator not found: $TOOLS_DIR/validate-framework.sh"
        exit 1
    fi
    
    # Run tests
    setup_test_environment
    test_setup_script
    test_validation_tools
    test_framework_integrity
    cleanup_test_environment
    
    # Generate report and exit with appropriate code
    generate_test_report
    exit $?
}

# Handle command line arguments
KEEP_TEST_FILES=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --keep-files)
            KEEP_TEST_FILES=true
            shift
            ;;
        --help|-h)
            print_usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            print_usage
            exit 1
            ;;
    esac
done

# Run main function
main
