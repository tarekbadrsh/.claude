# Caching & Performance Questions

Questions for caching strategies, performance optimization, and scaling.

## Caching Strategy

- What data is cached?
- Cache-aside, read-through, or write-through?
- Cache warming strategy?
- Cache hit rate targets?

## Cache Layers

- CDN caching for static assets?
- Application-level cache: Redis, Memcached?
- Database query cache?
- In-memory application cache?
- Browser cache headers?

## Cache Keys

- Cache key naming convention?
- Cache key versioning for invalidation?
- Key collision prevention?
- Key compression for long keys?

## TTL Strategy

- Default TTL values?
- Different TTLs for different data?
- TTL vs explicit invalidation?
- Stale-while-revalidate pattern?

## Cache Invalidation

- Invalidation triggers: write, event, time?
- Single key vs pattern invalidation?
- Cross-service cache invalidation?
- Thundering herd prevention?

## Cache Consistency

- Eventual consistency acceptable?
- Read-your-writes consistency needed?
- Cache-database consistency strategy?
- Distributed cache consistency?

## Cache Size

- Maximum cache size?
- Eviction policy: LRU, LFU, TTL?
- Memory vs disk caching?
- Cache partitioning strategy?

## CDN Configuration

- CDN provider: CloudFront, Cloudflare, Fastly?
- Cache-Control header strategy?
- Vary header usage?
- Edge caching rules?
- Purge strategy?

## Database Performance

- Query optimization strategy?
- Index strategy and maintenance?
- Query plan analysis?
- N+1 query detection?
- Connection pooling?

## Query Patterns

- Read-heavy or write-heavy?
- Hot data identification?
- Query caching at DB level?
- Materialized views for complex queries?
- Read replicas for scaling reads?

## API Performance

- Response time targets per endpoint?
- Payload size optimization?
- Compression (gzip, brotli)?
- HTTP/2 or HTTP/3?
- Keep-alive connections?

## Frontend Performance

- Core Web Vitals targets?
- Lazy loading strategy?
- Code splitting approach?
- Image optimization?
- Critical rendering path optimization?

## Bundle Optimization

- Bundle size budget?
- Tree shaking effectiveness?
- Dynamic imports usage?
- Vendor chunk strategy?
- Preloading strategy?

## Load Testing

- Load testing tool: k6, JMeter, Locust?
- Performance baseline metrics?
- Breaking point identification?
- Sustained load testing?
- Spike testing?

## Performance Monitoring

- APM tool: DataDog, New Relic, Dynatrace?
- Key performance metrics tracked?
- Percentile targets (p50, p95, p99)?
- Performance regression detection?
- Real user monitoring (RUM)?

## Scaling Strategy

- Horizontal vs vertical scaling?
- Auto-scaling triggers?
- Scale-up vs scale-out timing?
- Cost vs performance trade-offs?
- Scaling limits?

## Resource Optimization

- CPU usage optimization?
- Memory usage patterns?
- I/O optimization?
- Network bandwidth optimization?
- Cost-performance balance?

## Async Processing

- What can be async?
- Background job offloading?
- Event-driven architecture?
- Async vs sync trade-offs?

## Data Pagination

- Pagination strategy: offset, cursor, keyset?
- Page size defaults and limits?
- Total count queries?
- Deep pagination handling?

## Rate Limiting

- Rate limit values per endpoint?
- Rate limit headers exposed?
- Rate limit storage: local, distributed?
- Graceful degradation under load?

## Circuit Breaker

- Circuit breaker implementation?
- Failure thresholds?
- Recovery strategy?
- Fallback behavior?

## Bulkhead Pattern

- Resource isolation?
- Thread pool separation?
- Timeout isolation?
- Failure containment?

## Performance Budget

- Page load time budget?
- Time to interactive budget?
- Bundle size budget?
- API response time budget?
- Performance budget enforcement?

## Mobile Performance

- Mobile-specific optimizations?
- Offline performance?
- Low bandwidth handling?
- Battery impact?

## Geographic Distribution

- Multi-region deployment?
- Data replication latency?
- Edge computing usage?
- Geographic routing?

## Database Scaling

- Read replica usage?
- Sharding strategy?
- Partition strategy?
- Connection scaling?

## Testing Performance

- Performance test in CI/CD?
- Benchmark tracking?
- A/B performance comparison?
- Production performance testing?

## Debugging Performance

- Profiling tools used?
- Flame graph analysis?
- Slow query logging?
- Memory leak detection?
- Performance debugging process?
