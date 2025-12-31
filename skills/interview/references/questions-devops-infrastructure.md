# DevOps & Infrastructure Questions

Questions for deployment, CI/CD, monitoring, and infrastructure management.

## Deployment Strategy

- Deployment frequency target?
- Blue-green, canary, or rolling?
- Deployment approval process?
- Deployment window restrictions?
- Automated vs manual deployment?

## CI/CD Pipeline

- CI/CD tool: GitHub Actions, GitLab CI, Jenkins?
- Pipeline stages?
- Build time targets?
- Parallel test execution?
- Pipeline failure notification?

## Build Process

- Build reproducibility?
- Build caching strategy?
- Artifact storage?
- Build environment consistency?
- Multi-architecture builds?

## Testing in Pipeline

- Test types in CI: unit, integration, e2e?
- Test parallelization?
- Flaky test handling?
- Test coverage thresholds?
- Performance tests in pipeline?

## Environment Management

- Environment count: dev, staging, prod?
- Environment parity with production?
- Environment provisioning automation?
- Environment refresh process?
- Feature environments (preview)?

## Infrastructure as Code

- IaC tool: Terraform, Pulumi, CloudFormation?
- State management?
- Drift detection?
- Module reusability?
- IaC review process?

## Container Strategy

- Containerized or bare metal?
- Base image strategy?
- Image scanning for vulnerabilities?
- Image registry: ECR, GCR, Docker Hub?
- Image tagging strategy?

## Orchestration

- Kubernetes or simpler?
- Managed Kubernetes: EKS, GKE, AKS?
- Namespace strategy?
- Resource limits and requests?
- Pod disruption budgets?

## Service Discovery

- Service mesh: Istio, Linkerd?
- DNS-based discovery?
- Load balancing strategy?
- Health check configuration?
- Circuit breaker at mesh level?

## Configuration Management

- Config storage: env vars, config maps, secrets manager?
- Config per environment?
- Config change deployment?
- Feature flags service?
- Config validation?

## Database Operations

- Database migration strategy?
- Backup schedule and retention?
- Point-in-time recovery?
- Failover automation?
- Read replica management?

## Monitoring

- Monitoring stack: Prometheus, DataDog, CloudWatch?
- Metric collection strategy?
- Custom metrics defined?
- Dashboard organization?
- SLI/SLO definitions?

## Alerting

- Alerting tool: PagerDuty, OpsGenie?
- Alert severity levels?
- Escalation policy?
- On-call rotation?
- Alert fatigue prevention?

## Logging

- Log aggregation: ELK, Splunk, CloudWatch?
- Log format standardization?
- Log retention policy?
- Log-based alerting?
- Correlation IDs for tracing?

## Distributed Tracing

- Tracing tool: Jaeger, Zipkin, X-Ray?
- Trace sampling rate?
- Span instrumentation?
- Cross-service correlation?
- Performance insights from traces?

## Incident Management

- Incident declaration criteria?
- Incident commander role?
- Communication during incidents?
- Postmortem process?
- Incident runbooks?

## Disaster Recovery

- RPO and RTO targets?
- Backup strategy?
- Multi-region failover?
- DR testing frequency?
- DR runbook maintained?

## High Availability

- Availability target (99.9%, 99.99%)?
- Single points of failure identified?
- Redundancy at each layer?
- Failover automation?
- Health check design?

## Scaling

- Auto-scaling policies?
- Scaling metrics and thresholds?
- Scale-down behavior?
- Predictive scaling?
- Cost implications of scaling?

## Cost Management

- Cloud cost monitoring?
- Resource right-sizing?
- Reserved capacity usage?
- Spot/preemptible instances?
- Cost allocation by team/project?

## Security Operations

- Vulnerability patching cadence?
- Security updates automation?
- Network security groups?
- WAF rules management?
- Security incident response?

## Compliance Operations

- Compliance scanning?
- Audit log management?
- Access review automation?
- Policy enforcement?
- Compliance reporting?

## Change Management

- Change request process?
- Change approval requirements?
- Rollback procedure?
- Change freeze periods?
- Emergency change process?

## Documentation

- Runbook maintenance?
- Architecture diagrams updated?
- Incident documentation?
- Onboarding documentation?
- Knowledge base?

## Capacity Planning

- Capacity forecasting?
- Growth projections?
- Lead time for scaling?
- Capacity testing?
- Resource reservation?

## Vendor Management

- Cloud provider strategy?
- Vendor lock-in mitigation?
- Multi-cloud consideration?
- Vendor support tier?
- Vendor SLA management?
