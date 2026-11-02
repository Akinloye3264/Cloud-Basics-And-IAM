# Evidence Checklist

| ID | Evidence | Suggested filename |
|---|---|---|
| E-01 | Root MFA enabled | `E01a-root-account.png`, `E01b-root-mfa.png` |
| E-02 | Root and administrator credential status | `E02-root-access-key-1.png`, `E02-root-access-key-2.png`, `E02b-admin-mfa.png`, `E02c-admin-no-access-keys.png` |
| E-03 | Least-privilege policy | `E03-iam-least-privilege.png` |
| E-04 | Completed access review and role trust review | `E04-access-review.png`, `E04-role-trust-policy.png` |
| E-05 | CloudTrail settings and private log destination | `E05-cloudtrail-trail.png`, `E05b-cloudtrail-bucket-private.png` |
| E-06 | Recent CloudTrail event | `E06-cloudtrail-event.png` |
| E-07 | Budget, alert, and verified email notification | `E07-budget-alert.png`, `E07b-budget-email-verified.png` |
| E-08 | S3 Block Public Access before and after | `screenshots/before/E08-before-s3-block-public-access.png`, `screenshots/after/E08-s3-block-public-access.png` |
| E-09 | Final sanitized CLI validation | `E09-validation-summary.png` |

Capture only authorized configurations. Never include passwords, access keys, session tokens, MFA QR/recovery codes, private billing details, or unredacted account IDs. Do not fabricate before screenshots; if a control was already enabled, document that fact.
