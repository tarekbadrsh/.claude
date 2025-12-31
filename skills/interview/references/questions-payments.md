# Payments & Billing Questions

Questions for payment processing, subscriptions, invoicing, and financial operations.

## Payment Provider

- Payment processor: Stripe, Braintree, Adyen?
- Why this provider over alternatives?
- Multi-provider for redundancy?
- Provider fees understood and acceptable?

## Payment Methods

- Credit/debit cards supported?
- Which card networks: Visa, MC, Amex, Discover?
- Digital wallets: Apple Pay, Google Pay?
- Bank transfers/ACH?
- Regional methods: iDEAL, Bancontact, PIX?
- Buy now pay later: Klarna, Affirm?

## Checkout Flow

- Embedded checkout or redirect?
- Guest checkout or account required?
- Cart persistence across sessions?
- Abandoned cart recovery?
- One-click purchase for returning customers?

## Payment Security

- PCI compliance scope: SAQ-A or higher?
- Card data: tokenized or never touching servers?
- 3D Secure: required or risk-based?
- CVV storage (hint: never)?
- Fraud detection integration?

## Subscription Model (if applicable)

- Billing frequency: monthly, annual, custom?
- Free trial: duration, card required?
- Plan tiers: how many, what differences?
- Usage-based billing component?
- Metered billing accuracy?

## Subscription Lifecycle

- Plan upgrade: immediate or next cycle?
- Plan downgrade: immediate or next cycle?
- Proration calculation?
- Mid-cycle changes handling?
- Pause subscription option?

## Billing Cycle

- Billing date: signup anniversary or fixed date?
- Grace period for failed payments?
- Dunning email sequence?
- How many retry attempts?
- Service suspension after failed payment?

## Cancellation

- Immediate cancellation or end of period?
- Cancellation reason collection?
- Win-back offers on cancel?
- Data retention after cancellation?
- Reactivation process?

## Invoicing

- Invoice generation: automatic or manual?
- Invoice format and required fields?
- Tax line items on invoice?
- Invoice delivery: email, in-app, both?
- Invoice number sequence?

## Tax Handling

- Tax calculation: provider or service like Avalara?
- Tax-inclusive or tax-exclusive pricing?
- Tax exemption handling?
- Digital services tax (EU VAT, etc.)?
- Tax receipts for customers?

## Pricing

- Currency: single or multi-currency?
- Price localization by region?
- Exchange rate handling?
- Discount codes/coupons?
- Volume discounts or tiers?

## Refunds

- Full vs partial refund support?
- Refund policy terms?
- Refund processing time?
- Refund reason tracking?
- Automatic vs manual approval?

## Chargebacks/Disputes

- Dispute notification handling?
- Evidence submission process?
- Dispute rate monitoring?
- Prevention strategies?
- Customer communication during dispute?

## Revenue Recognition

- Revenue recognition rules?
- Deferred revenue tracking?
- Reporting currency?
- Multi-entity support?
- Accounting integration?

## Reporting

- Revenue metrics dashboard?
- MRR/ARR calculation?
- Churn rate tracking?
- Cohort analysis?
- Financial reconciliation reports?

## Payouts (if marketplace)

- Payout frequency: daily, weekly, monthly?
- Minimum payout threshold?
- Payout method: bank, PayPal?
- International payouts?
- 1099/tax form generation?

## Compliance

- PCI-DSS compliance level?
- SOC 2 requirements?
- Data retention for financial records?
- Audit trail for all transactions?
- Regional regulations: PSD2, etc.?

## Testing

- Test card numbers for all scenarios?
- Test mode vs live mode separation?
- Webhook testing for payment events?
- Failure scenario testing?
- Load testing checkout?

## Error Handling

- Declined payment UX?
- Specific decline reason display?
- Retry with different card option?
- Support escalation path?
- Fraud decline handling?

## Customer Support

- Payment history visible to support?
- Manual refund capability?
- Subscription management for support?
- Dispute response workflow?
- Customer self-service for billing?

## Edge Cases

- Currency conversion timing?
- Partial payment handling?
- Overpayment handling?
- Zero-dollar invoices?
- Negative invoice (credit memo)?
- Payment method expiration?
