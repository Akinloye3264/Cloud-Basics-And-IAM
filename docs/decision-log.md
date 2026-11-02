# Security Decision Log

| ID | Decision | Rationale | Alternative considered | Evidence/status |
|---|---|---|---|---|
| D-01 | Enable root MFA | Reduce password-only compromise risk | Password only | Verified 2026-10-30 - root MFA active. Evidence: `E01a-root-account.png`, `E01b-root-mfa.png`. |
| D-02 | Avoid root access keys | Minimize exposure of privileged credentials | Root key for CLI | Verified 2026-10-30 - both root access-key slots inactive. Evidence: `E02-root-access-key-1.png`, `E02-root-access-key-2.png`. |
| D-03 | Use task-specific IAM policy | Limit permissions | `s3:*` or administrator access | Reviewed `s3-report-reader.json` on 2026-11-01; scoped read access was explained in `03-iam-least-privilege/policy-review.md`. Policy not deployed. |
| D-04 | Enable multi-Region CloudTrail management events | Improve account activity visibility | No trail / one Region | Completed 2026-11-01 - `account-hardening-trail` is logging all read/write management activity across Regions; recent events and private S3 log delivery verified. Data events were not enabled to avoid unnecessary cost. Evidence: `E05-cloudtrail-trail.png`, `E05b-cloudtrail-bucket-private.png`, `E06-cloudtrail-event.png`. |
| D-05 | Configure budget notification | Improve cost visibility | Manual bill checks | Completed 2026-11-01 - USD 5 monthly cost budget covers all AWS services and sends a verified email alert when actual cost exceeds 80 percent (USD 4). Evidence: `E07-budget-alert.png`, `E07b-budget-email-verified.png`. |
| D-06 | Enable all four account-level S3 Block Public Access settings | Reduce accidental public exposure | Bucket-level only | Completed 2026-11-02 - all four account-level settings enabled. CloudTrail bucket policy and ACL reviewed; public access blocked and only the bucket owner has ACL permissions. Evidence: `E08-s3-block-public-access.png`, `E05b-cloudtrail-bucket-private.png`. |
| D-07 | Use a separate protected identity for routine administration | Avoid routine root-user exposure | Continue using root or create an AWS Organization for Identity Center | Completed 2026-11-02 - `cloud-security-admin` uses console access, MFA, no access keys, and restricted membership in `CloudSecurityAdministrators`. The group has broad administrator access because this is the sole administrative identity; membership requires regular review. An Identity Center organization instance was not enabled because creating AWS Organizations would convert the Free plan to paid and expire its credits. Evidence: `E02b-admin-mfa.png`, `E02c-admin-no-access-keys.png`. |

## For each change, record

- Date/time:
- Change:
- Risk addressed:
- Expected result:
- Validation and result:
- Rollback/recovery:
- Evidence filename:
- Remaining risk:
