# AWS Account Hardening — Findings Report

## Executive summary

An authorized AWS learning account was reviewed and hardened across root security, IAM, audit logging, cost monitoring, and S3 public-access protection. Root MFA and the absence of root access keys were verified. Routine administration was moved to a separate MFA-protected IAM user with no access keys. A multi-Region CloudTrail trail, a monthly cost budget with a verified alert, and all four account-level S3 Block Public Access settings were enabled and validated.

No unintended public access was identified in the reviewed CloudTrail log bucket. The principal remaining risk is the broad `AdministratorAccess` granted to the sole routine administrator group. This is documented as a deliberate learning-account decision and requires strict membership control and periodic review. These results demonstrate the listed controls only; they do not establish that the account is completely secure.

## Scope and method

- **Environment:** Personal learning account / authorized sandbox
- **Assessment date:** 2026-10-30 to 2026-11-02
- **Controls reviewed:** Root MFA and access keys, IAM users/groups/service-linked roles, least-privilege policy design, CloudTrail, AWS Budgets, and S3 public-access protection
- **Methods:** AWS Console review, IAM credential report, policy and trust-policy review, genuine sanitized screenshots, and read-only AWS CLI validation
- **Limitations:** No exploitation or penetration testing was performed. The sample least-privilege S3 policy was reviewed but not deployed. CloudTrail data events, log-file validation, and SSE-KMS encryption were not configured. The review did not assess every AWS service configuration or prove the absence of every possible identity-based access path.

## Findings

### F-01 — Root credentials are protected

- **Severity:** Informational
- **Evidence:** `screenshots/after/E01b-root-mfa.png`, `screenshots/after/E02-root-access-key-1.png`, `screenshots/after/E02-root-access-key-2.png`
- **Observation:** Root MFA is active, and both root access-key slots are inactive.
- **Risk:** Root credentials have unrestricted account authority; compromise could result in complete account takeover.
- **Recommendation:** Reserve root for root-only tasks, retain MFA, and continue to avoid root access keys.
- **Validation:** Recheck the IAM credential report and root security-credentials page during periodic reviews.

### F-02 — Routine administration uses a protected but broadly privileged identity

- **Severity:** Medium
- **Evidence:** `screenshots/after/E02b-admin-mfa.png`, `screenshots/after/E02c-admin-no-access-keys.png`, `screenshots/after/E04-access-review.png`
- **Observation:** The `cloud-security-admin` IAM user has MFA, no access keys, and membership in `CloudSecurityAdministrators`. The group has the AWS-managed `AdministratorAccess` policy and is restricted to the sole routine administrator.
- **Risk:** Compromise or misuse of this identity could affect nearly all resources in the account because its permissions are broad.
- **Recommendation:** Review group membership regularly. As the environment grows, replace routine administrator access with task-specific roles and short-lived sessions; reassess IAM Identity Center when account-plan constraints permit.
- **Validation:** Confirm MFA and zero access keys, enumerate group membership and attached policies, and test that narrower roles still support required tasks before removing broad access.

### F-03 — IAM inventory and least-privilege design were reviewed

- **Severity:** Informational
- **Evidence:** `screenshots/after/E03-iam-least-privilege.png`, `screenshots/after/E04-access-review.png`, `screenshots/after/E04-role-trust-policy.png`
- **Observation:** One IAM user, one IAM group, and three AWS service-linked roles were inventoried. The Resource Explorer trust relationship and attached AWS-managed policy were reviewed. The sample S3 report-reader policy limits access to listing one bucket and reading a report prefix.
- **Risk:** Unreviewed identities or overly broad policies can expand the effect of mistakes or credential compromise.
- **Recommendation:** Repeat the access review periodically and before retaining new identities. Deploy the sample policy only after replacing placeholders with the correct private bucket and confirming a business need.
- **Validation:** Compare the IAM inventory with the access-review CSV and inspect effective policies, trust relationships, credential state, and recent use.

### F-04 — Multi-Region management-event logging is active

- **Severity:** Informational
- **Evidence:** `screenshots/after/E05-cloudtrail-trail.png`, `screenshots/after/E06-cloudtrail-event.png`, `screenshots/after/E09-validation-summary.png`
- **Observation:** `account-hardening-trail` is a multi-Region trail that records management read/write events, and recent management activity is visible.
- **Risk:** Without durable audit logging, investigation and accountability would be weakened. S3 object data events remain outside the configured scope.
- **Recommendation:** Retain management-event logging. Enable selected data events only when justified after reviewing expected cost. Consider log-file validation and SSE-KMS if stronger integrity assurance and key control are required.
- **Validation:** Confirm trail logging status, event selectors, a recent event, and successful delivery to the private S3 destination.

### F-05 — Cost notification is configured but is not a spending cap

- **Severity:** Informational
- **Evidence:** `screenshots/after/E07-budget-alert.png`, `screenshots/after/E07b-budget-email-verified.png`
- **Observation:** A recurring USD 5 monthly cost budget covers all AWS services and sends a verified email notification when actual cost exceeds 80 percent (USD 4).
- **Risk:** Charges can continue after the alert because AWS Budgets notifications do not automatically stop services.
- **Recommendation:** Monitor notifications promptly and review Cost Explorer and active resources when the threshold is reached.
- **Validation:** Confirm budget health, threshold, notification recipient verification, and delivery when the threshold is exceeded.

### F-06 — S3 public-access guardrails are enabled

- **Severity:** Informational
- **Evidence:** `screenshots/before/E08-before-s3-block-public-access.png`, `screenshots/after/E08-s3-block-public-access.png`, `screenshots/after/E05b-cloudtrail-bucket-private.png`, `screenshots/after/E09-validation-summary.png`
- **Observation:** All four account-level S3 Block Public Access settings are enabled. The CloudTrail bucket also has bucket-level protection enabled; its policy is blocked from granting public access, and its ACL grants permissions only to the bucket owner.
- **Risk:** Disabling these guardrails could allow a public bucket policy or ACL to expose objects. Block Public Access does not replace review of authenticated IAM or cross-account access.
- **Recommendation:** Keep all four settings enabled and review bucket policies, ACLs, access points, and identity policies whenever storage is added or changed.
- **Validation:** Re-run the account-level CLI check and review each relevant bucket's permissions and public-access indicators.

## Control status

| Control | Status | Evidence | Notes |
|---|---|---|---|
| Root MFA and access keys | Pass | `E01b`, `E02` | MFA active; both root key slots inactive |
| IAM least privilege | Pass | `E03`, policy review | Scoped sample policy reviewed; not deployed |
| Access review | Pass | `E04`, access-review CSV | 1 user, 1 group, and 3 service-linked roles documented |
| CloudTrail | Pass | `E05`, `E06`, `E09` | Multi-Region management read/write events active |
| Budget alert | Pass | `E07`, `E07b` | USD 5 monthly budget; verified 80% actual-cost alert |
| S3 Block Public Access | Pass | `E08`, `E09` | All four account-level settings enabled |

## Remediation plan

| Priority | Action | Owner | Target date | Validation |
|---|---|---|---|---|
| 1 | Review `CloudSecurityAdministrators` membership and the need for `AdministratorAccess` monthly | Account owner | Monthly | Enumerate members and attached policies |
| 2 | Evaluate task-specific roles and short-lived access as the environment grows | Account owner | Before adding additional administrators | Test required tasks with narrower roles |
| 3 | Reassess CloudTrail data events, log-file validation, and SSE-KMS against risk and cost | Account owner | Next quarterly review | Inspect trail settings and successful log delivery |

## Conclusion

The review verified meaningful improvements to root protection, routine administrative access, audit visibility, cost awareness, and S3 public-access prevention. The validated controls passed their defined checks. Residual risk remains because the routine administrator has broad permissions, CloudTrail does not capture S3 object data events, and the assessment covered only the stated baseline. Periodic access reviews and configuration validation are required to maintain the account's security posture.
