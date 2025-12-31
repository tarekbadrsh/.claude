# Multi-Tenancy Questions

Questions for SaaS multi-tenant architecture, isolation, and tenant management.

## Tenancy Model

- Single-tenant or multi-tenant?
- Siloed, pooled, or hybrid model?
- Database per tenant or shared database?
- Schema per tenant or shared schema?
- When would tenant need dedicated resources?

## Tenant Identification

- How is tenant identified: subdomain, header, path?
- Tenant context propagation through stack?
- API tenant identification?
- Tenant switching for support users?

## Data Isolation

- Row-level security or application-level?
- Cross-tenant query prevention?
- Tenant data leak testing?
- Shared lookup tables across tenants?
- Audit logging per tenant?

## Tenant Hierarchy

- Flat tenants or hierarchical (org → team)?
- Parent-child tenant relationships?
- Data sharing between related tenants?
- Billing at which level?

## Tenant Lifecycle

- Tenant provisioning process?
- Provisioning time: immediate or queued?
- Tenant onboarding workflow?
- Trial tenant handling?
- Tenant offboarding process?

## Tenant Configuration

- Per-tenant feature flags?
- Tenant-specific settings?
- Custom branding per tenant?
- Custom domain per tenant?
- Configuration inheritance?

## User Management

- Users belong to one or multiple tenants?
- Tenant admin capabilities?
- User invitation flow per tenant?
- SSO configuration per tenant?
- Role definitions: global or per-tenant?

## Resource Limits

- Storage quota per tenant?
- API rate limits per tenant?
- User count limits per tenant?
- Feature limits by plan?
- Overage handling?

## Billing & Plans

- Plan tiers per tenant?
- Usage tracking per tenant?
- Billing isolation?
- Invoice per tenant?
- Plan change mid-cycle?

## Performance Isolation

- Noisy neighbor prevention?
- Resource allocation fairness?
- Per-tenant rate limiting?
- Performance SLA per tier?
- Dedicated resources option?

## Data Residency

- Tenant data location requirements?
- Region selection per tenant?
- Data sovereignty compliance?
- Cross-region tenant support?

## Backup & Recovery

- Backup per tenant or global?
- Tenant-specific restore capability?
- Point-in-time recovery per tenant?
- Tenant data export?

## Search & Indexing

- Search index per tenant or shared?
- Search isolation enforcement?
- Tenant-specific search tuning?

## Background Jobs

- Job isolation per tenant?
- Job priority per tenant/tier?
- Tenant job queue limits?
- Cross-tenant job impact?

## Caching

- Cache isolation per tenant?
- Cache key namespacing?
- Cache size per tenant?
- Shared cache invalidation impact?

## Integrations

- Per-tenant integration credentials?
- Webhook URLs per tenant?
- Third-party app authorization per tenant?
- Integration limits per tier?

## Analytics & Reporting

- Tenant-scoped analytics?
- Cross-tenant analytics for platform owner?
- Usage reporting per tenant?
- Tenant health dashboard?

## Support & Administration

- Support access to tenant data?
- Impersonation with tenant context?
- Tenant-level audit logs?
- Tenant support tier differences?

## Scaling

- Horizontal scaling across tenants?
- Tenant sharding strategy?
- Large tenant handling?
- Tenant migration between shards?

## Security

- Tenant isolation verification?
- Penetration testing tenant boundaries?
- Tenant-specific encryption keys?
- Security incident isolation?

## Compliance

- Per-tenant compliance settings?
- Tenant data processing agreements?
- Audit support per tenant?
- Compliance certifications per tier?

## Migration

- Tenant upgrade path?
- Data migration between tiers?
- Tenant consolidation/split?
- Platform version migration per tenant?

## Monitoring

- Metrics aggregation per tenant?
- Alert thresholds per tenant?
- Tenant health monitoring?
- Usage anomaly detection?

## Testing

- Multi-tenant integration tests?
- Isolation testing strategy?
- Cross-tenant permission tests?
- Tenant provisioning tests?
