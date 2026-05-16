# Validation

## Validation Entrypoint
`scripts/check-project.sh`

## Checks

### Required Files
- [ ] AGENT-START-HERE.md exists
- [ ] CURRENT.md exists
- [ ] TASKS.md exists
- [ ] ROLES.md exists
- [ ] VALIDATION.md exists
- [ ] scripts/check-project.sh exists

### Runtime Directories
- [ ] runtime/incoming/ - pending (can be empty)
- [ ] runtime/incoming/done/ - pending (can be empty)

### Content Rules
- CURRENT.md must have Last Verified line
- TASKS.md must have valid table shape
- No secrets or credentials in files

## Run Before
- Committing changes
- Claiming task completion
- Sending @handoff
