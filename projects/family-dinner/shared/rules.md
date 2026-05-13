# Family Dinner - Business Rules

## Valid Dinner Criteria

A dinner plan is VALID when ALL of:
1. Has at least one main dish
2. Main dish is child-acceptable
3. Menu is simple enough for household execution
4. At least one person confirmed acceptance

A dinner is NOT VALID if:
- No child-acceptable dish exists

## Dish Classification

### Core Reliable Dishes
- Child-accepted AND adult-accepted
- Safe fallback for any dinner

### Flexible Dishes
- Adult-accepted but child-unconfirmed
- Requires contingency or alternative

### Disapproved Dishes
- Explicitly rejected by both adults
- Removed from future planning unless re-proposed

## Feedback Rules

DO record:
- Exact statements from persons
- Specific observations
- Repeated patterns (2+ occurrences)

DO NOT record as rule:
- "Normal", "done", "fine"
- Single occurrence without follow-up
- Inferred preferences

## Coordination Rules

### Agent-to-Agent

- Communicate through shared files only
- Use @handoff for synchronous handoff
- Notify via runtime/notifications/
- Create task in runtime/incoming/ for executable work

### When Changes Matter

Notify the other agent when:
- Main dish changes significantly
- Dinner cancelled or delayed
- Child acceptance concern
- Purchase responsibility changes
