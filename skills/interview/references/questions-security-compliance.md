# Security & Compliance Questions

Questions for security implementation, data protection, and regulatory compliance.

## Threat Model

- What are the main threats?
- Attack vectors identified?
- Threat modeling exercise done?
- Security personas (attacker types)?
- Assets requiring protection?

## Authentication Security

- Credential storage: bcrypt, Argon2?
- Password policy enforcement?
- Account lockout after failures?
- Brute force protection?
- Credential stuffing prevention?

## Session Security

- Session token entropy?
- Session fixation prevention?
- Concurrent session handling?
- Session timeout values?
- Secure cookie attributes?

## Input Validation

- Input validation strategy?
- Whitelist vs blacklist approach?
- Server-side validation always?
- Injection prevention: SQL, NoSQL, command?
- File upload validation?

## Output Encoding

- XSS prevention strategy?
- Context-aware encoding?
- CSP headers implemented?
- Trusted types usage?
- DOM-based XSS prevention?

## API Security

- Rate limiting per endpoint?
- API key security?
- JWT security best practices?
- OAuth scope validation?
- API versioning security?

## Data Protection

- Encryption at rest?
- Encryption in transit (TLS version)?
- Field-level encryption for PII?
- Key management strategy?
- Key rotation process?

## Secrets Management

- Secrets storage: Vault, AWS Secrets Manager?
- Secrets in environment variables?
- No secrets in code/config?
- Secrets rotation?
- Access to secrets audited?

## Access Control

- Principle of least privilege?
- Role-based access control?
- Permission verification on every request?
- Horizontal access control (own data only)?
- Privilege escalation prevention?

## Logging & Monitoring

- Security event logging?
- Log integrity protection?
- Log retention period?
- SIEM integration?
- Alerting on security events?

## Audit Trail

- Who changed what, when?
- Audit log immutability?
- Audit log access control?
- Audit log retention compliance?

## Vulnerability Management

- Dependency scanning (npm audit, Snyk)?
- SAST/DAST in pipeline?
- Penetration testing frequency?
- Bug bounty program?
- CVE monitoring?

## Incident Response

- Incident response plan documented?
- Security contact public?
- Breach notification process?
- Incident severity classification?
- Post-incident review process?

## Infrastructure Security

- Network segmentation?
- Firewall rules?
- VPC/private networking?
- Bastion host for access?
- WAF implementation?

## Supply Chain Security

- Dependency verification?
- Lock file integrity?
- Registry security (npm, PyPI)?
- Build reproducibility?
- SBOM generation?

## GDPR Compliance

- Lawful basis for processing?
- Privacy notice provided?
- Data subject rights implemented?
- Data Processing Agreements?
- Cross-border transfer mechanisms?

## Data Subject Rights

- Right to access (export)?
- Right to erasure (deletion)?
- Right to rectification?
- Right to portability?
- Request handling process?

## Data Minimization

- Only necessary data collected?
- Data retention limits?
- Automatic data deletion?
- Purpose limitation enforced?

## Consent Management

- Consent collection mechanism?
- Consent withdrawal process?
- Consent audit trail?
- Granular consent options?
- Consent before processing?

## SOC 2 Compliance

- Security policies documented?
- Access reviews periodic?
- Change management process?
- Vendor management?
- Employee security training?

## PCI DSS (if applicable)

- Cardholder data environment scope?
- Network segmentation?
- Vulnerability scanning?
- Access logging?
- Security awareness training?

## HIPAA (if applicable)

- PHI identification?
- Minimum necessary standard?
- Business Associate Agreements?
- Audit controls?
- Breach notification?

## Security Testing

- Security unit tests?
- Automated security scanning?
- Manual security review?
- Red team exercises?
- Security regression tests?

## Third-Party Security

- Vendor security assessment?
- Third-party access controls?
- Data sharing agreements?
- Subprocessor management?
- Vendor security monitoring?

## Security Training

- Developer security training?
- Security champions program?
- Phishing awareness?
- Secure coding guidelines?
- Training frequency?

## Compliance Reporting

- Compliance dashboard?
- Audit readiness?
- Evidence collection automated?
- Compliance gap tracking?
- Certification maintenance?
