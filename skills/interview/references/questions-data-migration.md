# Data Migration Questions

Questions for database migrations, schema changes, data transformations, and ETL.

## Migration Scope

- Which tables/collections are affected?
- How many rows/documents need migrating?
- Production data size? Migration duration estimate?
- Can migration run while app is live?
- Downtime acceptable? How much?

## Schema Changes

- Adding columns: nullable or with default?
- Removing columns: immediate or deprecation period?
- Renaming: in-place or copy-and-swap?
- Type changes: compatible or needs transformation?
- Index changes: created before or after data load?

## Data Transformation

- What transformations are needed?
- Data cleansing: how to handle invalid data?
- Default values for new required fields?
- Computed fields: calculate once or on-the-fly?
- Data enrichment from external sources?

## Backwards Compatibility

- Old code work with new schema?
- New code work with old schema?
- Dual-write period needed?
- How long to support both schemas?
- Feature flags to control migration?

## Migration Strategy

- Big bang or incremental?
- Online migration (live) or offline (maintenance window)?
- Backfill in batches: batch size?
- Rate limiting to avoid overloading DB?
- Background job or blocking script?

## Rollback Plan

- Can migration be reversed?
- Data loss on rollback?
- How long is rollback viable?
- Backup before migration?
- Point-in-time recovery needed?

## Data Integrity

- Foreign key constraints during migration?
- Unique constraints: handle duplicates how?
- NOT NULL constraints: existing nulls?
- Check constraints: existing violations?
- Referential integrity maintained throughout?

## Performance Impact

- Table locks during migration?
- Replication lag considerations?
- Query performance during migration?
- Index rebuilding time?
- Connection pool exhaustion risk?

## Testing

- Test on production-like data volume?
- Test rollback procedure?
- Verify data integrity post-migration?
- Performance benchmarks before/after?
- Staging environment mirror of prod?

## Monitoring

- Progress tracking during migration?
- Error logging and alerting?
- Metrics to watch during migration?
- Success criteria: how do you know it worked?
- Data validation queries post-migration?

## Multi-Database (if applicable)

- Cross-database dependencies?
- Migration order between databases?
- Distributed transaction handling?
- Data consistency across systems?

## ETL Specific

- Source system availability during extract?
- Delta/incremental loads or full refresh?
- Late-arriving data handling?
- Duplicate detection and handling?
- Data lineage tracking?

## Compliance & Audit

- Data retention policies affected?
- PII handling during migration?
- Audit log of changes?
- Regulatory approval needed?
- Data residency requirements?

## Team Coordination

- Who runs the migration? DBA or developer?
- Communication plan for stakeholders?
- On-call during migration?
- Sign-off process before proceeding?
- Documentation of changes?

## Zero-Downtime Patterns

- Expand-contract pattern applicable?
- Shadow tables for atomic swap?
- Read replicas during migration?
- Connection draining strategy?
- Health checks during migration?

## Large Table Strategies

- Partitioning for parallel processing?
- pt-online-schema-change or gh-ost?
- Chunk by primary key or timestamp?
- Progress checkpointing for resume?
- Kill switch if problems detected?
