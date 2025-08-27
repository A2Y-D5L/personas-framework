#!/bin/bash

# Personas Framework Setup Script
# This script sets up the Personas Framework in a new project

set -e

FRAMEWORK_DIR="$(dirname "$0")"
PROJECT_ROOT="${1:-$(pwd)}"

echo "🚀 Setting up Personas Framework in: $PROJECT_ROOT"

# Validate that we're in the right directory
if [ ! -f "$FRAMEWORK_DIR/README.md" ]; then
    echo "❌ Error: This script must be run from the personas-framework directory"
    exit 1
fi

# Create target directories
echo "📁 Creating directory structure..."
mkdir -p "$PROJECT_ROOT/.personas/framework"
mkdir -p "$PROJECT_ROOT/.personas/project"

# Copy framework files
echo "📋 Copying framework files..."
cp -r "$FRAMEWORK_DIR/framework/"* "$PROJECT_ROOT/.personas/framework/"

# Copy project template
echo "📄 Copying project template..."
cp -r "$FRAMEWORK_DIR/framework/project-template/"* "$PROJECT_ROOT/.personas/project/"

# Create initial .gitkeep files to preserve directory structure
echo "📌 Creating directory placeholders..."
find "$PROJECT_ROOT/.personas/project/todos" -type d -name "current" -exec touch {}/.gitkeep \;
find "$PROJECT_ROOT/.personas/project/todos" -type d -name "backlog" -exec touch {}/.gitkeep \;
find "$PROJECT_ROOT/.personas/project/todos" -type d -name "completed" -exec touch {}/.gitkeep \;

echo ""
echo "✅ Personas Framework setup complete!"
echo ""
echo "📝 Next steps:"
echo "1. Customize .personas/project/README.md with your project details"
echo "2. Update .personas/project/TECH-SPEC.md with your technical specifications"
echo "3. Modify .personas/project/STANDARDS.md with your coding standards"
echo "4. Add project-specific context in .personas/project/contexts/[persona]/"
echo "5. Review persona Quick-Start guides in .personas/framework/personas/[persona]/QUICK-START.md"
echo ""
echo "🎯 Ready to start using personas! Create your first task in:"
echo "   .personas/project/todos/[persona]/current/"
echo ""
