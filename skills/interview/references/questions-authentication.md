# Authentication & Authorization Questions

Questions for auth flows, sessions, permissions, SSO, and identity management.

## Authentication Method

- Username/password, social login, SSO, or all?
- Passwordless option (magic link, OTP)?
- Multi-factor authentication required or optional?
- MFA methods: TOTP, SMS, email, hardware key?
- Biometric authentication on mobile?

## Registration Flow

- What info required at signup?
- Email verification required before access?
- Phone verification needed?
- CAPTCHA or bot protection?
- Invitation-only or open registration?
- Terms of service acceptance tracked?

## Password Policy

- Minimum length and complexity?
- Common password dictionary check?
- Password history (prevent reuse)?
- Password expiration policy?
- Compromised password detection (HaveIBeenPwned)?

## Password Recovery

- Reset via email link or code?
- Reset link expiration time?
- Rate limiting on reset requests?
- Security questions (please say no)?
- Account lockout after failed attempts?
- Notify user of password change?

## Session Management

- Session storage: JWT, server-side, or hybrid?
- Session duration: how long until expiry?
- Sliding expiration or fixed?
- Remember me: how long?
- Concurrent session limit?
- Session invalidation on password change?

## Token Design (if JWT)

- Access token lifetime?
- Refresh token lifetime?
- Refresh token rotation?
- Token storage: cookie, localStorage, memory?
- Cookie flags: HttpOnly, Secure, SameSite?
- What claims in token payload?

## Single Sign-On (if applicable)

- SSO protocol: SAML, OIDC, or both?
- IdP-initiated or SP-initiated?
- Just-in-time user provisioning?
- Attribute mapping from IdP?
- Group/role sync from IdP?
- Fallback if SSO unavailable?

## OAuth/Social Login (if applicable)

- Which providers: Google, GitHub, etc.?
- Scopes requested from provider?
- Account linking: same email = same account?
- What if social account disconnected?
- Profile data sync from provider?

## Authorization Model

- Role-based (RBAC) or attribute-based (ABAC)?
- Predefined roles or custom roles?
- Role hierarchy (admin > manager > user)?
- Permission granularity level?
- Resource-level permissions (own data only)?

## Permission Checks

- Checked at API layer, service layer, or both?
- Permission denied: 403 or 404 (hide existence)?
- Bulk operations: fail all or filter allowed?
- Permission caching? Invalidation strategy?
- Audit log of permission checks?

## Multi-Tenancy Auth

- Tenant isolation strategy?
- Cross-tenant access possible?
- Tenant admin vs global admin?
- Tenant-specific auth settings?
- User belongs to multiple tenants?

## API Authentication

- API keys, OAuth tokens, or both?
- API key scoping (read-only, full access)?
- API key rotation without downtime?
- Service-to-service auth method?
- Machine-to-machine credentials?

## Account Security

- Login notifications (new device, location)?
- Active sessions view for user?
- Remote session termination?
- Account activity log?
- Suspicious activity detection?

## Account Lifecycle

- Account deactivation vs deletion?
- Reactivation process?
- Data retention on deletion?
- Account takeover prevention?
- Deceased user handling?

## Delegation & Impersonation

- Admin impersonate user feature?
- Audit trail for impersonation?
- Time-limited delegation?
- Scope-limited delegation?
- User consent required?

## Compliance

- Password storage: bcrypt, Argon2?
- Failed login attempt logging?
- Audit log retention period?
- GDPR right to access auth data?
- HIPAA/SOC2 requirements?

## Emergency Access

- Break-glass procedure?
- Emergency admin access?
- What if IdP is down?
- Recovery codes for MFA?
- Account recovery process?

## Testing

- Test users in production?
- Auth bypass for automated tests?
- Load testing auth endpoints?
- Penetration testing scope?
- Token security testing?

## Edge Cases

- Email change: re-verify?
- Username change: allowed?
- Timezone handling for expiry?
- Clock skew tolerance for tokens?
- Unicode in passwords?
