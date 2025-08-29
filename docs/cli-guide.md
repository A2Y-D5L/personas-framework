# Personas Framework CLI

A unified command line interface for the Personas Framework, providing easy access to all framework functionality through a single `personas` command.

## Installation

### Local Installation (Development)

1. Clone the framework repository:

```bash
git clone <framework-repo-url>
cd personas-framework
```

2. Make the CLI executable:

```bash
chmod +x bin/personas
```

3. Add to your PATH (optional):

```bash
# Add to your shell profile (.bashrc, .zshrc, etc.)
export PATH="$PATH:/path/to/personas-framework/bin"
```

### Usage from Framework Directory

You can run the CLI directly from the framework directory:

```bash
./bin/personas --help
```

## Quick Start

### Initialize a New Project

```bash
# Create a new project with personas framework
personas init my-project --description "My awesome project"

# Initialize in an existing project directory
personas init . --project-name "My Existing Project" --description "Brief description"

# Initialize in a specific directory
personas init web-app --target ./projects/web-app
```

### Validate Project Structure

```bash
# Validate everything
personas validate

# Validate specific components
personas validate structure
personas validate tasks
```

### Manage Agent Tasks

```bash
# Create a new task
personas create-task engineer "Implement user authentication" --priority high

# Validate task files
personas validate-tasks

# Validate tasks for specific persona
personas validate-tasks --persona engineer
```

### Get Help

```bash
# General help
personas --help

# Help for specific commands
personas init --help
personas create-task --help
```

## Available Commands

### Project Management

- `personas init <name>` - Initialize new project with personas framework
- `personas generate` - Generate .personas directory from template
- `personas validate [component]` - Validate project structure and files

### Task Management

- `personas create-task <persona> <title>` - Create new task for specified persona
- `personas validate-tasks` - Validate task files and metadata

### Persona Management

- `personas list-personas` - List available personas

### Utility Commands

- `personas --version` - Show version information
- `personas --help` - Show help information

## Global Options

- `--verbose` - Enable verbose output
- `--dry-run` - Show what would be done without executing
- `--config <file>` - Use custom configuration file

## Examples

### Complete Project Setup

```bash
# 1. Initialize new project
personas init my-web-app --description "Modern web application"

# 2. Change to project directory
cd my-web-app

# 3. Validate the setup
personas validate

# 4. Create initial tasks
personas create-task engineer "Setup development environment" --priority high
personas create-task planner "Define project requirements" --priority high
```

### Task Management Workflow

```bash
# Check all tasks
personas validate-tasks --verbose

# Create tasks for different personas
personas create-task engineer "Implement API endpoints"
personas create-task reviewer "Review code quality standards"
personas create-task planner "Update project timeline"

# Validate specific persona tasks
personas validate-tasks --persona engineer
```

## Configuration

Create a configuration file at `~/.personas/config.yaml`:

```yaml
framework:
  template_repository: "/path/to/personas-framework/template"
  default_template: "standard"

validation:
  strict_mode: true
  auto_fix_minor: true

output:
  format: "pretty"
  verbose: false
  colors: true
```

## Integration with IDEs

The CLI is designed to work well with various development environments:

- **VS Code**: Add tasks to run common commands
- **Terminal**: Use as regular command line tool
- **CI/CD**: Integrate validation commands in pipelines

## Troubleshooting

### Common Issues

**Command not found**: Ensure the CLI is executable and in your PATH

```bash
chmod +x bin/personas
export PATH="$PATH:/path/to/personas-framework/bin"
```

**Permission denied**: Check file permissions

```bash
ls -la bin/personas
chmod +x bin/personas
```

**Invalid persona**: Use `personas list-personas` to see available personas

**Schema validation fails**: Ensure YAML frontmatter follows the schema in `schemas/task-schema.yaml`

### Getting Help

Use the built-in help system:

```bash
personas --help
personas <command> --help
```

Check the framework documentation in the `docs/` directory for detailed information.

## Development

The CLI is implemented as a bash script with modular functions. Key files:

- `bin/personas` - Main CLI script
- `tools/validate-tasks.sh` - Task validation engine
- `template/scripts/generate.sh` - Template generation
- `schemas/task-schema.yaml` - YAML schema for task metadata

For development and testing:

```bash
# Test all functionality
./bin/personas --help
./bin/personas list-personas
./bin/personas validate --dry-run

# Run in verbose mode for debugging
./bin/personas validate --verbose
```
