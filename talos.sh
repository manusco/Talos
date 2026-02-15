#!/bin/bash
# talos.sh - The System Check for Talos v0.1

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "🔮 Talos v0.1 System Check:"
echo "================================================"

# 1. Check Framework
if [ ! -d "talos/0_framework" ]; then
    echo -e "${RED}❌ CRITICAL: Framework missing (talos/0_framework).${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Framework Active${NC}"

# 2. Check Strategy (The Soul)
if [ ! -f "talos/1_strategy/MANIFESTO.md" ]; then
    echo -e "${RED}⚠️  MISSING SOUL: talos/1_strategy/MANIFESTO.md not found.${NC}"
    echo "👉 Run '@Talos run init' in your chat to initialize your organization."
else
    echo -e "${GREEN}✅ Soul Detected${NC}"
fi

# 3. Check Context (The Brain)
if [ ! -d "talos/2_context/memory" ]; then
    mkdir -p talos/2_context/memory
    echo "   Created memory/ directory."
fi
echo -e "${GREEN}✅ Context Ready${NC}"

# 4. Check Workflows & Skills
WORKFLOW_COUNT=$(ls -1 talos/3_workflows/*.md 2>/dev/null | wc -l)
SKILL_COUNT=$(ls -d talos/4_skills/*/* 2>/dev/null | wc -l)

echo -e "${GREEN}✅ Workflows: $WORKFLOW_COUNT${NC}"
echo -e "${GREEN}✅ Skills: $SKILL_COUNT${NC}"

echo "================================================"
echo -e "${GREEN}System Online.${NC}"
