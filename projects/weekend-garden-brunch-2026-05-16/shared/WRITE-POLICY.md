# Weekend Garden Brunch Ops - Write Policy

## What Casey Agent May Update Directly

- `CURRENT.md` - update current state, today's status
- `TASKS.md` - update task status, add completion notes
- `shared/log.md` - add activity log entries
- `runtime/notifications/*.md` - create new notifications
- `runtime/incoming/done/*.md` - archive completed incoming tasks

## What Casey Agent May Propose (Requires Jordan Approval)

- Changes to `shared/rules.md` - project coordination rules
- Changes to `DECISIONS.md` - major decisions
- Changes to `shared/menu*.md` - menu plans
- Changes to `shared/shopping*.md` - shopping lists
- Changes to `shared/decorations*.md` - decoration plans

## What Casey Agent Must Ask Before Changing

**Machine-local configuration** (must ask Casey before any changes):
- Local Skill installations
- Cron or scheduled jobs
- Sync-check scripts or cursors
- Pickup or polling mechanisms
- Credentials or tokens
- Notification channels

Approval requests must be in plain language.

**Required approval phrase for machine-local setup:**
> "批准花园早午餐本机设置"

## Rules

1. Workspace-local project files: may update per rules above
2. Machine-local settings: must ask represented owner first
3. Approval requests: must be in human-readable language
4. Confirmation required: await explicit approval before executing machine-local changes
