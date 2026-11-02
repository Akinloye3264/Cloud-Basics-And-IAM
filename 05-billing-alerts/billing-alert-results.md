# Billing Budget and Alert Results

- Validation date: 2026-11-01
- Budget name: `cloud-security-lab-monthly-budget`
- Budget type: Cost budget
- Period: Monthly recurring
- Budget amount: USD 5.00
- Scope: All AWS services using unblended costs
- Alert trigger: Actual cost greater than 80 percent
- Alert amount: USD 4.00 of the USD 5.00 budget
- Notification destination: One verified email recipient
- Current threshold status: Not exceeded

## Rationale

A USD 5 monthly budget is appropriate for this small learning environment and
provides early visibility into unexpected usage. The 80 percent actual-cost
threshold sends a warning at USD 4, leaving time to investigate and stop
unnecessary resources before reaching the budgeted amount.

The budget is a notification control, not a hard spending limit. Resources
must still be reviewed and removed when no longer required.

## Evidence

- `screenshots/after/E07-budget-alert.png`
- `screenshots/after/E07b-budget-email-verified.png`
