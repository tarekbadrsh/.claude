# Integration Questions

Questions for third-party services, external APIs, webhooks, and system integrations.

## Service Selection

- Why this specific service/vendor?
- Evaluated alternatives? Why not chosen?
- Vendor lock-in concerns?
- Exit strategy if vendor relationship ends?
- Open-source alternatives as fallback?

## API Contract

- API version you're integrating with?
- Breaking change notification from vendor?
- SDK provided or raw HTTP calls?
- Rate limits: requests per second/minute/day?
- Quota limits: total calls per billing period?

## Authentication

- API key, OAuth, or other method?
- Key rotation process?
- Where are credentials stored?
- Different keys for dev/staging/prod?
- Service account or user-delegated access?

## Error Handling

- Retry policy for transient errors?
- Exponential backoff with jitter?
- Maximum retry attempts?
- Circuit breaker pattern implemented?
- Fallback behavior when service unavailable?

## Timeout Configuration

- Connection timeout value?
- Read timeout value?
- Total request timeout?
- Different timeouts for different operations?
- Timeout behavior: fail fast or wait?

## Rate Limiting

- How close to rate limits normally?
- Burst handling strategy?
- Queue requests when near limit?
- Rate limit headers tracked?
- Alerting when approaching limits?

## Data Synchronization

- Real-time sync or batch?
- Sync frequency for batch?
- Full sync or delta updates?
- Conflict resolution when data differs?
- Source of truth: your system or theirs?

## Webhook Handling (Inbound)

- Webhook endpoint security (signatures)?
- Idempotency for duplicate deliveries?
- Out-of-order webhook handling?
- Webhook processing: sync or async?
- Dead letter queue for failed processing?
- Retry your processing if it fails?

## Webhook Sending (Outbound)

- Retry policy for failed deliveries?
- Maximum retry attempts and duration?
- Exponential backoff between retries?
- Payload size limits?
- Timeout for webhook delivery?
- Event batching or individual?

## Data Mapping

- Field mapping between systems?
- Data type conversions needed?
- Enum/constant value mapping?
- Handling fields that don't map?
- Bi-directional sync field conflicts?

## Testing

- Sandbox/test environment available?
- Test credentials separate from prod?
- Mock service for local development?
- Integration test strategy?
- How to test webhook handling locally?

## Monitoring

- API call success/failure metrics?
- Latency tracking per endpoint?
- Rate limit remaining tracked?
- Cost tracking per API call?
- Alerting on error rate spikes?

## Cost Management

- Pricing model: per call, per record, tiered?
- Budget limits configured?
- Cost optimization: caching, batching?
- Unexpected bill protection?
- Usage forecasting?

## Security

- Data in transit encryption (TLS)?
- Data at rest on their side?
- PII shared with third party?
- Data processing agreement needed?
- Compliance certifications (SOC2, GDPR)?

## Availability & SLA

- Vendor's uptime SLA?
- Planned maintenance windows?
- Status page to monitor?
- Your SLA dependency on theirs?
- Degraded mode if partially available?

## Versioning & Deprecation

- How do you learn about API changes?
- Deprecation notice period?
- Migration path when version sunsets?
- Multiple versions supported simultaneously?
- Automated alerts for deprecation warnings?

## Multi-Tenant Considerations

- Per-tenant API credentials?
- Rate limits per tenant or shared?
- Tenant data isolation guaranteed?
- Tenant-specific configuration?
- Cost attribution per tenant?

## Disaster Recovery

- What if vendor has outage?
- Data backup from third party?
- Manual workaround process?
- Historical data access if contract ends?
- Vendor's disaster recovery plan?

## Compliance & Legal

- Data residency requirements?
- Right to audit vendor?
- Subprocessor notifications?
- Breach notification obligations?
- Contract termination data handling?

## Documentation

- Integration architecture documented?
- Runbook for common issues?
- Field mapping documentation?
- Credential rotation procedures?
- Escalation contacts at vendor?
