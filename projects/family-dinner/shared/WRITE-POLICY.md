# Family Dinner - Write Policy

## Event-to-File Mapping

### Menu Proposed

| Write To | Action |
| --- | --- |
| CURRENT.md | Update dinner plan |
| shared/log.md | Record event |
| Notify | Other agent if significant |

### Menu Confirmed

| Write To | Action |
| --- | --- |
| CURRENT.md | Update status to confirmed |
| TASKS.md | Close related task |

### Dinner Completed

| Write To | Action |
| --- | --- |
| CURRENT.md | Update status to done |
| shared/dish-history.md | Record if feedback given |

### Agent Handoff

| Write To | Action |
| --- | --- |
| runtime/notifications/ | Create handoff notice |
| shared/log.md | Record handoff entry |
| Commit | Include @handoff tag |

## File Update Priority

1. CURRENT.md - Always update first for state changes
2. TASKS.md - Task status changes
3. runtime/notifications/ or runtime/incoming/ - Coordination
4. shared/dish-history.md - Feedback
5. DECISIONS.md - Proposals and durable decisions
6. shared/log.md - Event logging

## Do Not Write

| File | Unless |
| --- | --- |
| Raw chat logs | Never |
| Credentials/tokens | Never |
| Another person's preferences | Never |

## Closure Checklist

Before claiming event complete:
- [ ] CURRENT.md reflects current state
- [ ] TASKS.md task status accurate
- [ ] Notifications marked resolved if relevant
- [ ] Other agents notified if coordination required
