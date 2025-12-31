# File Handling Questions

Questions for file uploads, processing, storage, and media management.

## Upload Flow

- Direct to server or direct to cloud storage?
- Presigned URLs for direct upload?
- Chunked upload for large files?
- Resumable uploads supported?
- Upload progress indicator?

## File Validation

- Allowed file types: whitelist approach?
- Validation: extension, MIME type, or magic bytes?
- Maximum file size per upload?
- Maximum total storage per user?
- Virus/malware scanning?

## Storage Backend

- Local filesystem, S3, GCS, or Azure Blob?
- Storage class: hot, warm, or cold?
- Multi-region replication?
- Backup strategy for files?
- Storage cost estimation?

## File Organization

- Directory structure strategy?
- File naming: original name, UUID, or hash?
- Collision handling for same names?
- Metadata storage: DB, sidecar, or embedded?
- Tagging or categorization?

## Access Control

- Public, private, or signed URLs?
- Signed URL expiration time?
- Per-file permissions?
- Folder-level permissions?
- Sharing links with external users?

## Image Processing

- Resize on upload or on-demand?
- Thumbnail sizes needed?
- Image format conversion?
- Quality/compression settings?
- EXIF data: preserve or strip?
- Orientation correction?

## Video Processing

- Transcoding to what formats?
- Resolution variants?
- Streaming format: HLS, DASH?
- Thumbnail/preview generation?
- Duration limits?
- Processing async or blocking?

## Document Processing

- PDF generation or conversion?
- Text extraction/OCR?
- Preview generation?
- Watermarking?
- Print-ready versions?

## CDN & Delivery

- CDN for file delivery?
- Cache invalidation strategy?
- Geographically distributed?
- Bandwidth costs considered?
- Hot-linking prevention?

## Versioning

- File versioning supported?
- How many versions retained?
- Version comparison UI?
- Restore previous version?
- Storage impact of versions?

## Deduplication

- Content-addressed storage?
- Hash-based deduplication?
- Per-user or global dedup?
- Dedup on upload or background?

## Lifecycle Management

- Auto-delete after period?
- Archive old files?
- Orphan file cleanup?
- User-deleted file retention?
- Compliance hold preventing deletion?

## Bulk Operations

- Bulk upload UI?
- ZIP upload and extract?
- Bulk download as ZIP?
- Bulk delete confirmation?
- Progress for bulk operations?

## Sync & Offline

- Client-side file sync?
- Conflict resolution for synced files?
- Offline file access?
- Selective sync by folder?
- Sync bandwidth limits?

## Mobile Considerations

- Camera upload feature?
- Background upload on mobile?
- Photo library access?
- File picker integration?
- Compression before upload?

## Search & Discovery

- Full-text search in documents?
- Image recognition/tagging?
- Metadata search?
- Recent files list?
- Favorites/starred files?

## Collaboration

- File locking for editing?
- Real-time collaborative editing?
- Comments on files?
- Annotation support?
- Notification of changes?

## Quotas & Limits

- Storage quota per user/org?
- Quota enforcement: hard or soft limit?
- Quota warning notifications?
- Quota increase process?
- File count limits?

## Error Handling

- Upload failure recovery?
- Partial upload handling?
- Network interruption during upload?
- Processing failure notification?
- Retry mechanism for failed processing?

## Monitoring

- Storage usage metrics?
- Upload success/failure rates?
- Processing queue depth?
- Most accessed files?
- Bandwidth usage tracking?

## Compliance

- Data residency requirements?
- Encryption at rest?
- Encryption in transit?
- Access logging for audit?
- Retention policy enforcement?
- GDPR: file deletion requests?

## Performance

- Upload speed optimization?
- Concurrent upload limits?
- Preview loading performance?
- Large file download: streaming?
- Connection pooling for storage?
