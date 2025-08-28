# Automation Scripts for Personas Framework

This directory contains automation scripts and tools to streamline framework usage.

## Available Scripts

### 1. Task Management Scripts

#### `new-task.sh` - Create New Persona Tasks

```bash
#!/bin/bash
# new-task.sh - Create new tasks for personas

usage() {
    echo "Usage: $0 <persona> <task-title> [priority] [effort]"
    echo "  persona: engineer|planner|reviewer|agent-manager"
    echo "  task-title: Brief title for the task (will be slugified)"
    echo "  priority: HIGH|MEDIUM|LOW (default: MEDIUM)"
    echo "  effort: S|M|L (default: M)"
    echo ""
    echo "Example: $0 engineer 'implement user auth' HIGH M"
}

if [ $# -lt 2 ]; then
    usage
    exit 1
fi

PERSONA=$1
TITLE=$2
PRIORITY=${3:-MEDIUM}
EFFORT=${4:-M}

# Validate persona
case $PERSONA in
    engineer|planner|reviewer|agent-manager)
        ;;
    *)
        echo "Error: Invalid persona '$PERSONA'"
        usage
        exit 1
        ;;
esac

# Create filename from title
FILENAME=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
DATE=$(date +%Y-%m-%d)
TASK_FILE=".personas/project/todos/$PERSONA/current/${DATE}-${FILENAME}.md"

# Check if file already exists
if [ -f "$TASK_FILE" ]; then
    echo "Error: Task file already exists: $TASK_FILE"
    exit 1
fi

# Create task file
cat > "$TASK_FILE" << EOF
# $TITLE

**Created:** $DATE
**Priority:** $PRIORITY
**Assigned:** $(echo $PERSONA | sed 's/.*/\u&/')
**Estimated Effort:** $EFFORT

## Objective
[Describe what needs to be accomplished]

## Acceptance Criteria
- [ ] [Specific criterion 1]
- [ ] [Specific criterion 2]
- [ ] [Additional criteria as needed]

## Technical Notes
[Implementation notes, constraints, dependencies]

## Context
[Additional context about the task]

## Handoff Requirements
[What needs to be delivered to next persona]
EOF

echo "✅ Created task: $TASK_FILE"
echo "📝 Please edit the file to add specific details"
```

#### `move-task.sh` - Move Tasks Between Directories

```bash
#!/bin/bash
# move-task.sh - Move tasks between directories

usage() {
    echo "Usage: $0 <persona> <task-file> <destination>"
    echo "  persona: engineer|planner|reviewer|agent-manager"
    echo "  task-file: Name of task file (without path)"
    echo "  destination: current|backlog|in-progress|changes-requested|completed"
    echo ""
    echo "Example: $0 engineer 2025-08-27-user-auth.md completed"
}

if [ $# -ne 3 ]; then
    usage
    exit 1
fi

PERSONA=$1
TASK_FILE=$2
DESTINATION=$3

# Validate inputs
SOURCE_DIRS=("current" "backlog" "in-progress" "changes-requested" "completed")
DEST_DIRS=("current" "backlog" "in-progress" "changes-requested" "completed")

# Find source file
SOURCE_PATH=""
for dir in "${SOURCE_DIRS[@]}"; do
    if [ -f ".personas/project/todos/$PERSONA/$dir/$TASK_FILE" ]; then
        SOURCE_PATH=".personas/project/todos/$PERSONA/$dir/$TASK_FILE"
        SOURCE_DIR=$dir
        break
    fi
done

if [ -z "$SOURCE_PATH" ]; then
    echo "Error: Task file not found: $TASK_FILE"
    exit 1
fi

# Validate destination
if [[ ! " ${DEST_DIRS[@]} " =~ " $DESTINATION " ]]; then
    echo "Error: Invalid destination '$DESTINATION'"
    usage
    exit 1
fi

# Move file
DEST_PATH=".personas/project/todos/$PERSONA/$DESTINATION/$TASK_FILE"

if [ -f "$DEST_PATH" ]; then
    echo "Error: Destination file already exists: $DEST_PATH"
    exit 1
fi

mv "$SOURCE_PATH" "$DEST_PATH"
echo "✅ Moved $TASK_FILE from $SOURCE_DIR to $DESTINATION"
```

### 2. Context Management Scripts

#### `load-persona-context.sh` - Generate Context Loading Commands

```bash
#!/bin/bash
# load-persona-context.sh - Generate context loading commands for AI agents

usage() {
    echo "Usage: $0 <persona> [platform]"
    echo "  persona: engineer|planner|reviewer|agent-manager"
    echo "  platform: copilot|chatgpt|claude|generic (default: copilot)"
    echo ""
    echo "Example: $0 engineer copilot"
}

if [ $# -lt 1 ]; then
    usage
    exit 1
fi

PERSONA=$1
PLATFORM=${2:-copilot}

case $PLATFORM in
    copilot)
        echo "# GitHub Copilot Context Loading for $PERSONA persona"
        echo ""
        echo "## Step 1: Load Persona Instructions"
        echo "@workspace /attach .personas/framework/personas/$PERSONA/INSTRUCTIONS.md"
        echo ""
        echo "You are now the $PERSONA persona from the Personas Framework."
        echo "Please review your instructions and assume this role."
        echo ""
        echo "## Step 2: Load Project Context"
        echo "@workspace /attach .personas/project/contexts/$PERSONA/"
        echo ""
        echo "## Step 3: Load Current Tasks"
        echo "@workspace /attach .personas/project/todos/$PERSONA/current/"
        echo ""
        echo "Please review current tasks and begin work on the highest priority item."
        ;;
    
    chatgpt|claude|generic)
        echo "# Context Loading for $PERSONA persona ($PLATFORM)"
        echo ""
        echo "Please assume the role of the $PERSONA persona from the Personas Framework."
        echo ""
        echo "## Persona Instructions:"
        echo "[Copy and paste contents of .personas/framework/personas/$PERSONA/INSTRUCTIONS.md]"
        echo ""
        echo "## Project Context:"
        echo "[Copy and paste relevant context from .personas/project/contexts/$PERSONA/]"
        echo ""
        echo "## Current Tasks:"
        echo "[Copy and paste current tasks from .personas/project/todos/$PERSONA/current/]"
        echo ""
        echo "Please acknowledge your role and begin working on the specified tasks."
        ;;
    
    *)
        echo "Error: Unsupported platform '$PLATFORM'"
        usage
        exit 1
        ;;
esac
```

### 3. Validation Scripts

#### `validate-framework.sh` - Comprehensive Framework Validation

```bash
#!/bin/bash
# validate-framework.sh - Validate framework installation and setup

check_directory() {
    local dir=$1
    local description=$2
    
    if [ -d "$dir" ]; then
        echo "✅ $description: $dir"
        return 0
    else
        echo "❌ $description: $dir (missing)"
        return 1
    fi
}

check_file() {
    local file=$1
    local description=$2
    
    if [ -f "$file" ]; then
        echo "✅ $description: $file"
        return 0
    else
        echo "❌ $description: $file (missing)"
        return 1
    fi
}

echo "🔍 Validating Personas Framework Installation..."
echo ""

# Check framework structure
echo "## Framework Structure"
check_directory ".personas" "Personas root directory"
check_directory ".personas/framework" "Framework directory"
check_directory ".personas/project" "Project directory"
echo ""

# Check core persona files
echo "## Core Persona Files"
PERSONAS=("engineer" "planner" "reviewer" "agent-manager")
for persona in "${PERSONAS[@]}"; do
    check_file ".personas/framework/personas/$persona/INSTRUCTIONS.md" "$persona instructions"
done
echo ""

# Check project configuration
echo "## Project Configuration"
check_file ".personas/project/README.md" "Project README"
check_file ".personas/project/TECH-SPEC.md" "Technical specifications"
check_file ".personas/project/STANDARDS.md" "Coding standards"
check_file ".personas/project/DEPENDENCIES.md" "Dependencies"
echo ""

# Check todo structure
echo "## Todo Directory Structure"
TODO_DIRS=("current" "backlog" "in-progress" "changes-requested" "completed")
for persona in "${PERSONAS[@]}"; do
    for dir in "${TODO_DIRS[@]}"; do
        check_directory ".personas/project/todos/$persona/$dir" "$persona/$dir todos"
    done
done
echo ""

# Check context directories
echo "## Context Directories"
for persona in "${PERSONAS[@]}"; do
    check_directory ".personas/project/contexts/$persona" "$persona context"
done
echo ""

echo "🏁 Validation complete"
```

### 4. AI Integration Scripts

#### `ai-persona-session.sh` - Start AI Session with Persona Context

```bash
#!/bin/bash
# ai-persona-session.sh - Start AI session with full persona context

usage() {
    echo "Usage: $0 <persona> [task-file] [platform]"
    echo "  persona: engineer|planner|reviewer|agent-manager"
    echo "  task-file: Optional specific task file to focus on"
    echo "  platform: copilot|local (default: copilot)"
    echo ""
    echo "Example: $0 engineer user-auth-task.md copilot"
}

if [ $# -lt 1 ]; then
    usage
    exit 1
fi

PERSONA=$1
TASK_FILE=$2
PLATFORM=${3:-copilot}

echo "🤖 Starting AI session for $PERSONA persona"
echo ""

case $PLATFORM in
    copilot)
        echo "## GitHub Copilot Integration Commands"
        echo ""
        echo "Copy and paste these commands into GitHub Copilot Chat:"
        echo ""
        echo "### 1. Load Persona Identity"
        echo "@workspace /attach .personas/framework/personas/$PERSONA/INSTRUCTIONS.md"
        echo ""
        echo "You are the $PERSONA persona from the Personas Framework."
        echo "Please review your instructions and acknowledge your role."
        echo ""
        
        if [ -n "$TASK_FILE" ]; then
            echo "### 2. Load Specific Task"
            echo "@workspace /attach .personas/project/todos/$PERSONA/current/$TASK_FILE"
            echo ""
            echo "Please review this specific task and begin work on it."
            echo ""
        else
            echo "### 2. Load Current Tasks"
            echo "@workspace /attach .personas/project/todos/$PERSONA/current/"
            echo ""
            echo "Please review current tasks and prioritize your work."
            echo ""
        fi
        
        echo "### 3. Load Project Context"
        echo "@workspace /attach .personas/project/contexts/$PERSONA/"
        echo ""
        echo "Use this project-specific context for your work."
        ;;
    
    local)
        echo "## Local AI Integration"
        echo ""
        
        # Combine all context into single prompt
        CONTEXT_FILE="/tmp/persona-context-$PERSONA.txt"
        
        echo "Preparing context file: $CONTEXT_FILE"
        echo ""
        
        cat > "$CONTEXT_FILE" << EOF
# $PERSONA Persona Session Context

## Persona Instructions
$(cat .personas/framework/personas/$PERSONA/INSTRUCTIONS.md)

## Project Context
$(cat .personas/project/contexts/$PERSONA/*.md 2>/dev/null || echo "No project context files found")

## Current Tasks
$(cat .personas/project/todos/$PERSONA/current/*.md 2>/dev/null || echo "No current tasks found")

## Session Initialization
You are now acting as the $PERSONA persona from the Personas Framework.
Please acknowledge your role and begin working on the current tasks.
EOF

        echo "Context file created: $CONTEXT_FILE"
        echo "Use this file with your local AI system."
        ;;
    
    *)
        echo "Error: Unsupported platform '$PLATFORM'"
        exit 1
        ;;
esac
```

## Usage Instructions

### Setting Up Scripts

1. **Make scripts executable:**

   ```bash
   chmod +x docs/examples/automation-scripts/*.sh
   ```

2. **Add to PATH (optional):**

   ```bash
   # Add to your shell profile (.bashrc, .zshrc, etc.)
   export PATH="$PATH:$(pwd)/docs/examples/automation-scripts"
   ```

3. **Test scripts:**

   ```bash
   ./docs/examples/automation-scripts/validate-framework.sh
   ```

### Common Workflows

#### Create and Start Work on New Task

```bash
# Create new engineering task
./new-task.sh engineer "implement user authentication" HIGH M

# Generate AI session context
./ai-persona-session.sh engineer
```

#### Move Task Through Workflow

```bash
# Move task from current to in-progress
./move-task.sh engineer 2025-08-27-user-auth.md in-progress

# Later, move to completed
./move-task.sh engineer 2025-08-27-user-auth.md completed
```

#### Validate Framework Setup

```bash
# Run comprehensive validation
./validate-framework.sh

# Generate context loading commands
./load-persona-context.sh engineer copilot
```

## Customization

These scripts can be customized for your specific needs:

- **Modify task templates** in `new-task.sh`
- **Add platform support** in AI integration scripts
- **Extend validation checks** in `validate-framework.sh`
- **Create domain-specific scripts** for your project type

## Integration with Development Tools

### Git Hooks

Add framework validation to git hooks:

```bash
# .git/hooks/pre-commit
#!/bin/bash
./docs/examples/automation-scripts/validate-framework.sh
```

### IDE Integration

Create IDE tasks or shortcuts for common operations:

- **VS Code Tasks:** Add script commands to `.vscode/tasks.json`
- **Editor Shortcuts:** Bind scripts to keyboard shortcuts
- **Terminal Aliases:** Create shell aliases for frequent commands

### CI/CD Integration

Include framework validation in your CI pipeline:

```yaml
# .github/workflows/framework-validation.yml
name: Framework Validation
on: [push, pull_request]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Validate Framework
        run: ./docs/examples/automation-scripts/validate-framework.sh
```
