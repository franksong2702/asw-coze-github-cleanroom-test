#!/bin/bash
# Family Dinner - Project Validation Script

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_DIR"

ERRORS=0
WARNINGS=0

echo "=== Family Dinner Project Validation ==="
echo ""

# Check required files exist
REQUIRED_FILES="AGENT-START-HERE.md CURRENT.md TASKS.md ROLES.md DECISIONS.md SOURCES.md LIFECYCLE.md shared/rules.md shared/WRITE-POLICY.md scripts/check-project.sh"

for file in $REQUIRED_FILES; do
    if [ -f "$file" ]; then
        echo "  [OK] $file exists"
    else
        echo "  [ERROR] $file missing"
        ERRORS=$((ERRORS + 1))
    fi
done

# Check CURRENT.md has Last verified line
if grep -q "Last verified:" CURRENT.md; then
    echo "  [OK] CURRENT.md has Last verified line"
else
    echo "  [ERROR] CURRENT.md missing Last verified line"
    ERRORS=$((ERRORS + 1))
fi

# Check TASKS.md table format
if grep -q "ID.*Task.*Priority.*Owner.*Status" TASKS.md; then
    echo "  [OK] TASKS.md has expected header"
else
    echo "  [WARNING] TASKS.md may have unexpected format"
    WARNINGS=$((WARNINGS + 1))
fi

# Check ROLES.md has collaboration mode
if grep -q "Mode.*:" ROLES.md || grep -q "collaboration" ROLES.md; then
    echo "  [OK] ROLES.md has collaboration mode defined"
else
    echo "  [WARNING] ROLES.md collaboration mode not found"
    WARNINGS=$((WARNINGS + 1))
fi

# Check shared files
for file in shared/log.md shared/dish-history.md shared/dish-preferences.md; do
    if [ -f "$file" ]; then
        echo "  [OK] $file exists"
    else
        echo "  [ERROR] $file missing"
        ERRORS=$((ERRORS + 1))
    fi
done

echo ""
echo "=== Validation Summary ==="
echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"

if [ $ERRORS -gt 0 ]; then
    echo "Result: FAILED"
    exit 1
elif [ $WARNINGS -gt 0 ]; then
    echo "Result: PASSED with warnings"
    exit 0
else
    echo "Result: PASSED"
    exit 0
fi
