# Background Jobs Questions

Questions for async processing, queues, scheduled tasks, and workers.

## Job Types

- What operations run as background jobs?
- User-triggered vs system-triggered jobs?
- Scheduled/cron jobs needed?
- Event-driven jobs?
- Job dependencies (job A triggers job B)?

## Queue System

- Queue technology: Redis, SQS, RabbitMQ, Kafka?
- Why this queue system?
- Managed service or self-hosted?
- Queue per job type or shared?

## Job Priority

- Priority levels: high, normal, low?
- How is priority determined?
- Priority queues or single queue?
- Starvation prevention for low priority?

## Job Payload

- What data in job payload?
- Payload size limits?
- Sensitive data in payload?
- Reference IDs vs full data?
- Payload versioning for compatibility?

## Job Processing

- Workers: dedicated servers or shared?
- Worker concurrency per server?
- Worker auto-scaling?
- Graceful shutdown handling?
- Long-running job handling?

## Failure Handling

- Retry policy: how many attempts?
- Retry backoff: linear or exponential?
- Dead letter queue for failed jobs?
- Alerting on job failures?
- Manual retry mechanism?

## Idempotency

- Jobs idempotent by design?
- Duplicate detection mechanism?
- Safe to replay any job?
- Side effects on retry?

## Timeouts

- Job execution timeout?
- What happens on timeout: retry or fail?
- Heartbeat for long jobs?
- Stuck job detection?

## Ordering

- Job ordering guaranteed?
- FIFO required for any jobs?
- Out-of-order processing impact?
- Ordering within job type vs global?

## Scheduling

- Cron-style scheduling supported?
- One-time scheduled jobs?
- Timezone handling for schedules?
- Schedule management UI?
- Missed schedule handling?

## Concurrency Control

- Rate limiting job execution?
- Concurrent jobs per resource?
- Global vs per-tenant limits?
- Lock management for shared resources?

## Progress Tracking

- Job progress reporting?
- User-visible progress?
- Estimated completion time?
- Progress persistence for long jobs?
- Cancellation support?

## Job Cancellation

- Can jobs be cancelled?
- In-progress job cancellation?
- Cleanup on cancellation?
- Cancellation confirmation to user?

## Batching

- Batch multiple items in one job?
- Batch size limits?
- Partial batch failure handling?
- Batch progress tracking?

## Monitoring

- Job queue depth metrics?
- Processing rate metrics?
- Failure rate tracking?
- Worker health monitoring?
- Queue latency alerts?

## Observability

- Job execution logs?
- Distributed tracing for jobs?
- Job ID correlation across systems?
- Debug mode for jobs?
- Payload inspection for support?

## Testing

- Job testing strategy?
- Integration tests for workers?
- Queue behavior in tests?
- Time-dependent job testing?
- Failure simulation?

## Deployment

- Worker deployment strategy?
- Rolling updates for workers?
- Job compatibility across versions?
- Blue-green deployment impact?
- Feature flags for jobs?

## Multi-Tenant

- Tenant isolation for jobs?
- Per-tenant job limits?
- Tenant priority differences?
- Cross-tenant job impact?

## Data Retention

- Completed job retention?
- Failed job retention?
- Job history queryable?
- Purge old job records?

## Recovery

- Recovery from queue failure?
- Worker crash recovery?
- Data consistency after failure?
- Replay capability?
- Disaster recovery for queues?

## Performance

- Job throughput targets?
- Processing latency targets?
- Queue size before backpressure?
- Scaling triggers?
- Peak load handling?

## Cost

- Queue service costs?
- Worker compute costs?
- Cost per job estimation?
- Cost optimization strategies?

## Security

- Job payload encryption?
- Worker authentication?
- Sensitive data handling?
- Audit logging for jobs?
- Access control for job management?
