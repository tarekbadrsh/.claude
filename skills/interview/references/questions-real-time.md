# Real-Time Features Questions

Questions for WebSockets, live updates, collaboration, presence, and streaming.

## Connection Management

- WebSocket, SSE, or long-polling?
- Connection protocol: ws:// or wss://?
- Heartbeat/ping interval?
- Connection timeout before reconnect?
- Maximum reconnection attempts?
- Exponential backoff on reconnect?

## Reconnection Handling

- State recovery after reconnect?
- Missed messages: replay or skip?
- How far back can messages be replayed?
- Client state reconciliation?
- Reconnect: same server or any server?

## Message Format

- JSON, Protocol Buffers, or MessagePack?
- Message envelope structure?
- Message IDs for deduplication?
- Timestamp format and timezone?
- Compression enabled?

## Message Delivery

- At-least-once or exactly-once?
- Message ordering guaranteed?
- Acknowledgment required from client?
- Retry unacknowledged messages?
- Message TTL before discard?

## Scaling

- Single server or distributed?
- Message broker: Redis Pub/Sub, Kafka, etc.?
- Sticky sessions or any-server routing?
- Connection count per server?
- Horizontal scaling strategy?

## Presence System

- User online/offline status?
- Presence update frequency?
- Away/idle detection?
- Last seen timestamp?
- Presence across multiple tabs/devices?

## Collaboration Features

- Concurrent editing strategy?
- Conflict resolution: OT, CRDT, or locking?
- Cursor/selection sharing?
- User attribution for changes?
- Undo/redo in collaborative context?

## Typing Indicators

- Debounce typing events?
- Clear indicator after how long?
- Show who's typing or just "someone"?
- Multiple people typing display?

## Live Updates

- Full object or delta updates?
- Update batching/debouncing?
- Stale client detection?
- Force refresh mechanism?
- Version vectors for consistency?

## Rooms/Channels

- Room-based or global broadcast?
- Maximum users per room?
- Room creation: automatic or explicit?
- Room persistence: how long?
- User room limits?

## Authorization

- Auth on initial connect only?
- Per-message authorization?
- Room-level permissions?
- Token refresh over WebSocket?
- Kick user from room?

## Rate Limiting

- Messages per second per client?
- Burst allowance?
- Rate limit feedback to client?
- Different limits for different message types?
- Server-side throttling?

## Offline Handling

- Queue messages when offline?
- Queue size limit?
- Message priority in queue?
- Sync on reconnect?
- Offline indicator in UI?

## Mobile Considerations

- Battery impact of persistent connection?
- Background connection handling?
- Push notification fallback?
- Network type detection (WiFi vs cellular)?
- Connection on app foreground?

## Error Handling

- Connection error UI feedback?
- Message send failure handling?
- Partial message handling?
- Corrupted message handling?
- Server-side error propagation?

## Monitoring

- Connected client count?
- Message throughput metrics?
- Latency percentiles?
- Error rate tracking?
- Room/channel statistics?

## Testing

- WebSocket testing tools?
- Load testing concurrent connections?
- Chaos testing (network interruption)?
- Message ordering verification?
- Reconnection scenario testing?

## Security

- Message sanitization?
- Injection prevention?
- Connection origin validation?
- Flood protection?
- Malicious client detection?

## Debugging

- Message logging for debugging?
- Client-side connection state logging?
- Server-side connection tracking?
- Replay capability for debugging?
- Connection ID for support tickets?

## Graceful Degradation

- Fallback if WebSocket blocked?
- Feature reduction on slow connection?
- Polling fallback implementation?
- User notification of degraded mode?
- Automatic upgrade when available?
