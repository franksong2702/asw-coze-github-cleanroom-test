# Family Dinner - Roles and Authority

## Participants

| Name | Role | Agent | Default Responsibility |
| --- | --- | --- | --- |
| Frank | Participant A | Frank's agent | Menu proposal |
| Tangyi | Participant B | Tangyi's agent | Purchasing |

## Authority Rules

### Direct Update Authority

Agents MAY update directly:

| File | Allowed Updates |
| --- | --- |
| CURRENT.md | Status changes, dinner plan updates |
| TASKS.md | Task status changes, new task creation |
| shared/dish-history.md | Feedback observations |
| shared/dish-preferences.md | Explicit preferences |
| shared/log.md | Event logging |
| runtime/notifications/ | FYI notifications |
| runtime/incoming/ | Mark tasks as done |

### Proposal Authority (Not Direct Update)

| File | Change Type | Process |
| --- | --- | --- |
| DECISIONS.md | Durable rules | Create proposal, await acknowledgment |
| shared/rules.md | Business rules | Create proposal, await confirmation |

## Collaboration Mode

**Mode:** shared-initiative

- Either participant can update shared state
- Other participant notified when change matters
- No hard blocker - work continues if one unavailable
- Agents coordinate via files, not human relay

## Write Policy

See shared/WRITE-POLICY.md for event-to-file mapping.
