#!/usr/bin/env bash
# Validation script for weekend-garden-brunch-2026-05-16

set -e

# Determine script directory (works from any working directory)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_DIR"

ERRORS=0
WARNINGS=0

echo "=== Project Validation ==="

# Required project files
REQUIRED_FILES=(
    "AGENT-START-HERE.md"
    "CURRENT.md"
    "TASKS.md"
    "ROLES.md"
    "VALIDATION.md"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "[PASS] $file exists"
    else
        echo "[ERROR] $file missing"
        ((ERRORS++))
    fi
done

# Check scripts directory
if [ -f "scripts/check-project.sh" ]; then
    echo "[PASS] scripts/check-project.sh exists"
else
    echo "[ERROR] scripts/check-project.sh missing"
    ((ERRORS++))
fi

# Runtime directories (warnings only - can be created later)
if [ -d "runtime/incoming" ]; then
    echo "[PASS] runtime/incoming/ exists"
else
    echo "[WARNING] runtime/incoming/ pending - will be created when needed"
    ((WARNINGS++))
fi

if [ -d "runtime/incoming/done" ]; then
    echo "[PASS] runtime/incoming/done/ exists"
else
    echo "[WARNING] runtime/incoming/done/ pending - will be created when needed"
    ((WARNINGS++))
fi

# Current.md must have Last Verified line
if [ -f "CURRENT.md" ]; then
    if grep -q "Last Verified" CURRENT.md; then
        echo "[PASS] CURRENT.md has Last Verified line"
    else
        echo "[ERROR] CURRENT.md missing Last Verified line"
        ((ERRORS++))
    fi
fi

# TASKS.md must have table headers
if [ -f "TASKS.md" ]; then
    if grep -q "| ID |" TASKS.md; then
        echo "[PASS] TASKS.md has table structure"
    else
        echo "[ERROR] TASKS.md missing table structure"
        ((ERRORS++))
    fi
fi

# Write policy
if [ -f "shared/WRITE-POLICY.md" ]; then
    echo "[PASS] shared/WRITE-POLICY.md exists"
else
    echo "[ERROR] shared/WRITE-POLICY.md missing"
    ((ERRORS++))
fi

# One-shot join message
if [ -f "artifacts/casey-one-shot-join-message.md" ]; then
    echo "[PASS] artifacts/casey-one-shot-join-message.md exists"
else
    echo "[ERROR] artifacts/casey-one-shot-join-message.md missing"
    ((ERRORS++))
fi

# Incoming tasks
if [ -f "runtime/incoming/2026-05-16-casey-briefing.md" ]; then
    echo "[PASS] 2026-05-16-casey-briefing.md exists"
    if grep -qE "^Confirmation Required: no$" runtime/incoming/2026-05-16-casey-briefing.md || grep -A1 "^## Confirmation Required" runtime/incoming/2026-05-16-casey-briefing.md | grep -q "^no$"; then
        echo "[PASS] casey-briefing has Confirmation Required: no"
    else
        echo "[ERROR] casey-briefing missing 'Confirmation Required: no'"
        ((ERRORS++))
    fi
else
    echo "[ERROR] runtime/incoming/2026-05-16-casey-briefing.md missing"
    ((ERRORS++))
fi

if [ -f "runtime/incoming/2026-05-16-casey-wake-runner-proposal.md" ]; then
    echo "[PASS] 2026-05-16-casey-wake-runner-proposal.md exists"
    if grep -qE "^Confirmation Required: yes$" runtime/incoming/2026-05-16-casey-wake-runner-proposal.md || grep -A1 "^## Confirmation Required" runtime/incoming/2026-05-16-casey-wake-runner-proposal.md | grep -q "^yes$"; then
        echo "[PASS] wake-runner-proposal has Confirmation Required: yes"
    else
        echo "[ERROR] wake-runner-proposal missing 'Confirmation Required: yes'"
        ((ERRORS++))
    fi
    if grep -q "批准花园早午餐本机设置" runtime/incoming/2026-05-16-casey-wake-runner-proposal.md; then
        echo "[PASS] wake-runner-proposal has approval phrase"
    else
        echo "[ERROR] wake-runner-proposal missing approval phrase"
        ((ERRORS++))
    fi
else
    echo "[ERROR] runtime/incoming/2026-05-16-casey-wake-runner-proposal.md missing"
    ((ERRORS++))
fi

echo ""
echo "=== Summary ==="
echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"

if [ $ERRORS -gt 0 ]; then
    echo "STATUS: FAIL"
    exit 1
else
    echo "STATUS: PASS"
    exit 0
fi
