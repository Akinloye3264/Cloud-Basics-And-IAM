# Security Decision Log

| ID | Decision | Rationale | Alternative considered | Evidence/status |
|---|---|---|---|---|
| D-01 | Enable root MFA | Reduce password-only compromise risk | Password only | Verified 2026-10-30 - root MFA active. Evidence: `E01a-root-account.png`, `E01b-root-mfa.png`. |
| D-02 | Avoid root access keys | Minimize exposure of privileged credentials | Root key for CLI | Verified 2026-10-30 - both root access-key slots inactive. Evidence: `E02-root-access-key-1.png`, `E02-root-access-key-2.png`. |
| D-03 | Use task-specific IAM policy | Limit permissions | `s3:*` or administrator access | Reviewed `s3-report-reader.json` on 2026-11-01; scoped read access was explained in `03-iam-least-privilege/policy-review.md`. Policy not deployed. |
| D-04 | Enable multi-Region CloudTrail management events | Improve account activity visibility | No trail / one Region | Pending |
| D-05 | Configure budget notification | Improve cost visibility | Manual bill checks | Pending |
| D-06 | Enable all four account-level S3 Block Public Access settings | Reduce accidental public exposure | Bucket-level only | Pending |

## For each change, record

- Date/time:
- Change:
- Risk addressed:
- Expected result:
- Validation and result:
- Rollback/recovery:
- Evidence filename:
- Remaining risk:
