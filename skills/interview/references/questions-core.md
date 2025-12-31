# Core Questions (Universal)

Questions applicable to any feature or system. Start here, then dive into domain-specific files.

## 🔴 Edge Cases & Boundaries

**Empty States**

- What does user see with zero items?
- First-time user vs returning user experience?
- What if all items are deleted?

**Limits**

- Maximum allowed? What happens at the limit?
- Minimum required? What if below minimum?
- What if user hits limit mid-operation?

**Timing**

- What if user does X before Y completes?
- What if they do the same action twice rapidly?
- What if they navigate away mid-operation?
- What if session expires mid-action?

**Duplicates**

- Can two items have the same name/identifier?
- How do we handle near-duplicates?
- Duplicate detection: on create or on save?

**Special Characters**

- Unicode, emojis, RTL text — handled?
- Very long strings — truncated where?
- Special characters in identifiers?

## 🟠 Error Handling & Failure Modes

**API/Network Errors**

- Third-party service down — retry, fail, or degrade?
- Network timeout — how long before giving up?
- Partial response — accept or reject entirely?
- Server returns 500 — what does user see?

**Validation Errors**

- Invalid input — inline error or toast/modal?
- Multiple validation errors — show all or first?
- Server-side validation fails after client passes?
- How specific are error messages?

**Partial Failures**

- 3 of 5 items succeed — rollback all or partial commit?
- Background job fails — notify user?
- Cascade failure handling?

**Recovery**

- User refreshes mid-operation — what state?
- Browser crashes — any draft recovery?
- Can user retry failed operation?

## 🟡 State & Data Management

**Persistence**

- Saved immediately (autosave) or explicit save button?
- Unsaved changes warning on navigation?
- Draft state between sessions?

**Multi-Device**

- Started on mobile, continue on desktop — how?
- Conflicting edits from two devices?
- Sync delay acceptable?

**Multi-Tab**

- Same resource open in two tabs — sync or conflict?
- One tab deletes what another is editing?
- Which tab "wins"?

**Offline**

- Network drops mid-use — queue actions or block?
- How much works offline? Readonly or full edit?
- Sync on reconnect: automatic or manual?

**Caching**

- How stale can displayed data be?
- Cache invalidation triggers?
- User can force refresh?

## 🟢 Security & Permissions

**Access Control**

- Who can create/read/update/delete?
- Role-based or attribute-based permissions?
- Can permissions change mid-session?
- Permission denied: 403 or 404 (hide existence)?

**Data Visibility**

- What can other users see?
- What can admins see that users can't?
- Any PII exposure risks?

**Audit**

- Need to track who changed what, when?
- Audit log retention period?
- Audit accessible to whom?

**Deletion**

- Soft delete or hard delete?
- Can deleted items be restored? By whom? For how long?
- Cascade delete related items?
- Confirmation required?

## 🔵 Performance & Scale

**Volume**

- How many items expected? 100? 10K? 1M?
- At 10x current scale, what breaks first?
- Performance acceptable at expected volume?

**Lists & Pagination**

- Infinite scroll, numbered pages, or load more?
- Default sort order? User-configurable?
- Search/filter needed?
- What if filtered results empty?

**Loading**

- Acceptable latency? 100ms? 1s? 5s?
- Progressive loading or wait for all?
- Loading indicator when?

**Background Work**

- Sync or async processing?
- How long can user wait for async result?
- Progress indicator for long operations?

## 🟣 UX & User Experience

**Loading States**

- What does user see while waiting?
- Skeleton screens, spinners, or nothing?
- Different loading for different operations?

**Feedback**

- Success — toast, redirect, inline message?
- How long do notifications persist?
- Can user dismiss early?

**Undo**

- Can user reverse this action?
- Time window for undo?
- What's the undo mechanism?

**Confirmation**

- Destructive actions — require explicit confirmation?
- "Are you sure?" fatigue consideration?
- Bulk actions — confirm first or act?

**Discoverability**

- How does user find this feature?
- Is it obvious how to use it?
- Help/documentation needed?

## ⚪ Migrations & Compatibility

**Existing Users**

- Auto-enabled or opt-in?
- Migration path for existing data?
- Can they revert to old behavior?
- Training/announcement needed?

**Data Migration**

- Existing data needs transformation?
- Migration run once or incremental?
- What if migration fails midway?

**Rollback**

- If we need to revert, what breaks?
- Data written with new feature — still readable after rollback?
- Rollback tested?

## ⚫ Integrations & Dependencies

**External Services**

- What external services does this depend on?
- Failure of dependency — graceful degradation?
- Rate limits from external services?

**Webhooks/Events**

- Emits events for other systems?
- Consumes events from other systems?
- Event ordering matters?

**Data Sync**

- Source of truth when systems disagree?
- Sync frequency requirements?
- Conflict resolution strategy?

## 📋 Testing & Validation

**Test Coverage**

- Unit tests for business logic?
- Integration tests for workflows?
- E2E tests for critical paths?
- Edge case tests?

**Test Data**

- Test data strategy?
- Production-like data volume tests?
- PII in test data?

**Acceptance Criteria**

- How do we know this is "done"?
- Who validates before release?
- Acceptance test scenarios?

## 📝 Documentation & Support

**User Documentation**

- User guide updates needed?
- In-app help/tooltips?
- FAQ updates?

**Technical Documentation**

- Architecture docs updated?
- API docs updated?
- Runbooks for operations?

**Support**

- Support team trained?
- Known issues documented?
- Escalation path clear?
