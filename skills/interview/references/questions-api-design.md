# API Design Questions

Questions for REST APIs, GraphQL, endpoints, contracts, and API-first development.

## Endpoint Design

- What HTTP methods does this endpoint support? Why not others?
- Is this truly RESTful or RPC-style? Does it matter for your use case?
- Nested resource (`/users/123/orders`) or flat (`/orders?user_id=123`)? Why?
- What's the URL structure for sub-resources? How deep can nesting go?
- Plural or singular nouns? Consistent across all endpoints?

## Request Design

- Required vs optional fields — how do you distinguish in docs?
- What happens if client sends extra fields not in schema?
- Field naming: camelCase, snake_case, or kebab-case? Consistent?
- How do you handle array parameters? Comma-separated or repeated keys?
- Maximum request body size? What error for exceeding it?
- Content-Type restrictions? What if client sends wrong type?

## Response Design

- Envelope pattern (`{data, meta, errors}`) or direct response?
- Pagination format: offset/limit, cursor-based, or page numbers?
- What metadata included? Total count? Page info? Rate limit headers?
- Consistent date/time format across all endpoints? Timezone handling?
- Null fields: omit entirely or include as null?
- Empty arrays: `[]` or omit the field?

## Error Handling

- Error response structure — code, message, details, field-level errors?
- HTTP status codes: which ones do you use and when?
- 400 vs 422 for validation errors — which and why?
- Stack traces in errors? Never, dev only, or configurable?
- Error codes: numeric, string constants, or both?
- Localized error messages or just codes for client to translate?

## Versioning

- Version in URL (`/v1/`), header, or query param?
- When do you bump the version? What's a breaking change?
- How long do you support old versions?
- Can clients specify version preference?
- Default version for unversioned requests?

## Authentication & Authorization

- Auth method: API key, JWT, OAuth2, or multiple?
- Where does auth go: header, query param, cookie?
- Token refresh flow — how does client get new token?
- Scope-based permissions or role-based?
- Per-endpoint authorization or resource-level?
- Rate limiting per user, per API key, or per IP?

## Query & Filtering

- Filter syntax: query params, JSON body, or custom DSL?
- Which fields are filterable? All or whitelist?
- Operators: equals only, or also gt/lt/contains/in?
- Multiple filters: AND or OR logic? Configurable?
- Sorting: single field or multi-field? Ascending/descending?
- Full-text search: separate endpoint or parameter?

## Bulk Operations

- Batch create/update/delete — supported?
- Maximum items per batch request?
- Partial success: all-or-nothing or individual results?
- Response format for batch: mirror input order?
- Async for large batches? How to check status?

## Idempotency

- Which operations are idempotent?
- Idempotency key header for non-idempotent ops?
- How long do you store idempotency keys?
- What response for duplicate request with same key?

## Caching

- Which responses are cacheable?
- ETag or Last-Modified headers?
- Cache-Control directives per endpoint?
- How do clients invalidate cache?
- CDN caching? Vary headers?

## Rate Limiting

- Limits per endpoint or global?
- Rate limit headers: which standard (RateLimit-*, X-RateLimit-*)?
- What response when rate limited? Retry-After header?
- Different limits for different auth levels?
- Burst allowance or strict rolling window?

## Webhooks (if applicable)

- Webhook payload structure match API response structure?
- Retry policy for failed deliveries?
- Signature verification method?
- Which events trigger webhooks?
- Can clients filter which events they receive?

## Documentation

- OpenAPI/Swagger spec maintained?
- Example requests/responses for each endpoint?
- SDKs generated or hand-written?
- Changelog for API changes?
- Deprecation notices in responses?

## GraphQL-Specific (if applicable)

- Query depth limiting?
- Query complexity scoring?
- Persisted queries or arbitrary?
- N+1 prevention strategy (DataLoader)?
- Schema stitching or federation?
- Subscriptions for real-time? WebSocket or SSE?

## Testing & Mocking

- Sandbox/test environment available?
- Test data that doesn't affect production?
- Mock server for client development?
- Contract testing between services?
