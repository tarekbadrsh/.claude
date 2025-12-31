# Mobile App Questions

Questions for iOS, Android, React Native, Flutter, and mobile-specific considerations.

## Platform Strategy

- Native, cross-platform, or hybrid?
- If cross-platform: React Native, Flutter, or other?
- Minimum iOS and Android versions?
- Tablet support or phone only?
- Platform-specific features?

## App Architecture

- State management approach?
- Offline-first or online-required?
- Local database: SQLite, Realm, Core Data?
- API layer architecture?
- Dependency injection approach?

## App Lifecycle

- Fresh launch vs background resume behavior?
- State restoration on kill/relaunch?
- Background processing needed?
- Background refresh scheduling?
- App suspend handling?

## Authentication

- Biometric login: Face ID, Touch ID, fingerprint?
- Secure credential storage?
- Session persistence across app restarts?
- Token refresh in background?
- Login persistence duration?

## Offline Functionality

- What features work offline?
- Offline data limit?
- Sync strategy when back online?
- Conflict resolution for offline edits?
- Offline indicator in UI?

## Data Sync

- Real-time sync or manual pull?
- Sync on app launch?
- Sync in background?
- Delta sync or full refresh?
- Sync priority for limited bandwidth?

## Push Notifications

- Push notification types?
- Rich notifications: images, actions?
- Notification categories and actions?
- Deep linking from notifications?
- Notification permission request timing?

## Deep Linking

- Universal links (iOS) / App links (Android)?
- Deferred deep linking for new installs?
- Deep link handling when app closed?
- Deep link parameters?
- Web fallback for deep links?

## Performance

- App launch time target?
- Memory usage limits?
- Battery impact acceptable?
- Frame rate targets (60fps)?
- Performance profiling strategy?

## Networking

- API timeout configuration?
- Retry logic for network failures?
- Network reachability monitoring?
- Low bandwidth mode?
- Request prioritization?

## Caching

- Image caching strategy?
- API response caching?
- Cache size limits?
- Cache invalidation triggers?
- Cache persistence across updates?

## Storage

- Local storage limits?
- User data vs app data separation?
- Storage cleanup strategy?
- iCloud / Google Drive backup?
- Sensitive data encryption?

## Media Handling

- Camera access needed?
- Photo library access?
- Video recording?
- Media compression before upload?
- Media caching strategy?

## Location Services

- Location permission level: always, in-use, none?
- Background location tracking?
- Geofencing features?
- Location accuracy needs?
- Battery impact of location?

## App Updates

- Force update for critical versions?
- Soft update prompts?
- In-app update (Android)?
- Update check frequency?
- Migration for breaking changes?

## Security

- Certificate pinning?
- Jailbreak/root detection?
- Screen capture prevention?
- Secure text fields?
- Biometric authentication timeout?

## Analytics

- Analytics SDK: Firebase, Amplitude, Mixpanel?
- Event tracking strategy?
- Screen view tracking?
- Crash reporting integration?
- User properties tracked?

## A/B Testing

- Feature flags in mobile?
- A/B testing framework?
- Experiment assignment persistence?
- Rollout percentage control?
- Kill switch for features?

## Accessibility

- VoiceOver / TalkBack support?
- Dynamic type / font scaling?
- Color contrast compliance?
- Reduce motion setting respected?
- Accessibility testing process?

## Localization

- Languages supported?
- RTL layout support?
- Date/time/currency formatting?
- Dynamic string loading?
- Localization testing?

## App Store

- App Store guidelines compliance?
- In-app purchase requirements?
- Subscription management?
- App review preparation?
- Rejection contingency plan?

## Testing

- Unit testing coverage?
- UI/integration testing: XCUITest, Espresso?
- Device testing matrix?
- Beta testing: TestFlight, Firebase Distribution?
- Automated testing in CI?

## Release Process

- Release frequency?
- Staged rollout strategy?
- Rollback capability?
- Hotfix process?
- Release notes process?

## Monitoring

- Crash monitoring: Crashlytics, Sentry?
- ANR (Android) / hang detection (iOS)?
- Performance monitoring?
- User session recording?
- Error alerting thresholds?

## Support

- In-app feedback mechanism?
- Debug info collection for support?
- Remote logging capability?
- Version and device info in support tickets?
- Diagnostic mode for troubleshooting?
