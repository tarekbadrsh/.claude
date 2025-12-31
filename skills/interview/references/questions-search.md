# Search Functionality Questions

Questions for search features, indexing, filtering, and discovery.

## Search Scope

- What content is searchable?
- Global search or scoped to context?
- Search across multiple content types?
- Cross-tenant search or isolated?

## Search Backend

- Database full-text search or dedicated engine?
- Search engine: Elasticsearch, Algolia, Meilisearch, Typesense?
- Why this search solution?
- Managed service or self-hosted?

## Indexing Strategy

- Real-time indexing or batch?
- Index update latency acceptable?
- Full reindex frequency?
- Index size estimation?
- Index versioning strategy?

## Query Processing

- Query parsing: exact, fuzzy, wildcard?
- Typo tolerance enabled?
- Synonym support?
- Stop words handling?
- Language-specific stemming?

## Relevance & Ranking

- Ranking factors: recency, popularity, exact match?
- Field boosting for title vs body?
- Personalized ranking?
- Machine learning ranking?
- Manual ranking overrides?

## Search UI

- Search bar location and visibility?
- Placeholder text in search box?
- Instant search or submit required?
- Debounce delay for instant search?
- Minimum query length?

## Autocomplete

- Autocomplete/suggestions enabled?
- Query suggestions or result previews?
- Recent searches shown?
- Popular searches shown?
- Personalized suggestions?

## Results Display

- Results per page?
- Pagination or infinite scroll?
- Result snippet generation?
- Highlight matching terms?
- Thumbnail/preview in results?

## Faceted Search

- Filter facets available?
- Which fields are filterable?
- Facet counts shown?
- Multi-select facets?
- Hierarchical facets?

## Filtering & Sorting

- Sort options: relevance, date, popularity?
- Default sort order?
- Filter persistence across sessions?
- URL reflects filters (shareable)?
- Clear all filters option?

## No Results Handling

- No results message?
- Suggestions for no results?
- Spell check suggestions?
- Related content shown?
- Search tips displayed?

## Performance

- Search latency target?
- Query timeout handling?
- Concurrent search load expected?
- Cache search results?
- Cache invalidation strategy?

## Security & Access

- Search respects permissions?
- Results filtered by access?
- Sensitive content excluded?
- Search query logging: privacy concerns?
- Rate limiting on search?

## Analytics

- Search query tracking?
- Click-through rate on results?
- Zero-result queries tracking?
- Search refinement tracking?
- Search success metrics?

## Search Quality

- Relevance testing process?
- A/B testing search changes?
- User feedback collection?
- Search quality metrics?
- Manual relevance tuning?

## Advanced Search

- Boolean operators supported?
- Field-specific search syntax?
- Date range filtering?
- Numeric range queries?
- Saved searches?

## Multi-Language

- Multiple languages indexed?
- Language detection?
- Language-specific analyzers?
- Cross-language search?

## Content Types

- Different result templates per type?
- Type filtering in UI?
- Unified ranking across types?
- Type-specific boosting?

## Real-Time Search

- Live results as user types?
- Highlighted query updates?
- Recent items section?
- Trending searches?

## Mobile Search

- Voice search support?
- Mobile-optimized results?
- Recent searches on mobile?
- Search from mobile home screen?

## Error Handling

- Search service down: fallback?
- Timeout handling in UI?
- Malformed query handling?
- Error messages user-friendly?

## Testing

- Search relevance testing?
- Performance benchmarking?
- Index consistency checks?
- Query coverage testing?

## Maintenance

- Index health monitoring?
- Query pattern analysis?
- Index optimization schedule?
- Synonym dictionary updates?
- Reindex procedure?
