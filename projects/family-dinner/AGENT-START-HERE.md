# Family Dinner Project

## Overview

Coordination workspace for family dinner planning between two participants and their agents.

## Participants

| Person | Agent | Role |
| --- | --- | --- |
| Frank | Frank's agent | Participant A |
| Tangyi | Tangyi's agent | Participant B |

## Workflow

1. Frank's agent proposes daily menu by 09:30
2. Participants discuss via human chat if needed
3. Either agent can confirm, adjust, or record dinner status
4. Agents coordinate through shared files only
5. Tangyi handles purchasing by default (flexible)

## Key Rules

- Child acceptance is highest priority
- A dinner without child-acceptable dish is NOT valid
- Conservative feedback recording
- No vague feedback becomes durable rules

## Validation

```bash
cd projects/family-dinner && sh scripts/check-project.sh
```
