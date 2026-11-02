# Interview Notes — AWS Account Hardening Lab

## 1. What did you build?

I implemented and documented a foundational security baseline in an authorized AWS learning account. The work covered root protection, a separate routine administrator, an IAM access review, multi-Region CloudTrail management-event logging, an AWS budget alert, S3 Block Public Access, CLI validation, and a findings report.

## 2. Why did you stop using root for routine administration?

The root user has unrestricted account authority and should be reserved for root-only tasks. I verified root MFA and no root access keys, then created the separate `cloud-security-admin` console identity. It has MFA and no programmatic access keys.

## 3. Did you implement least privilege?

I reviewed and explained a sample S3 report-reader policy that allows only `s3:ListBucket` against one bucket with a report-prefix condition and `s3:GetObject` against that report prefix. I did not deploy that sample policy. The routine administrator still has `AdministratorAccess`, which I documented as a medium residual risk requiring strict group membership and periodic review.

## 4. How did you audit IAM?

I inventoried 1 IAM user, 1 IAM group, and 3 AWS service-linked roles. I documented business purpose, permission source, credential status, privilege level, evidence, risk, owner, and retain/remediate decisions. I also reviewed the Resource Explorer service-linked role's trust relationship and confirmed that only the Resource Explorer service can assume it.

## 5. What does your CloudTrail configuration record?

The multi-Region `account-hardening-trail` records management read and write events. I verified recent events and private S3 delivery. S3 object-level data events are separate and were not enabled because they were outside this baseline and may add cost. Log-file validation and SSE-KMS were also documented as future considerations.

## 6. Does the AWS budget prevent spending?

No. The recurring USD 5 cost budget sends a verified email notification at 80% actual spend, or USD 4. It improves visibility but does not automatically stop services or guarantee that no additional charges occur.

## 7. Why enable all four S3 Block Public Access settings?

They provide an account-wide preventive guardrail against public access through ACLs and bucket or access-point policies. I also reviewed the CloudTrail bucket's bucket-level setting, policy state, and ACL. Block Public Access does not replace review of authenticated IAM permissions or cross-account access.

## 8. How did you prove the controls worked?

I used genuine sanitized console screenshots, an IAM credential report, a completed access-review CSV, and read-only AWS CLI commands. The CLI validation confirmed 1 user, 1 group, 3 roles, a multi-Region trail, and all four S3 public-access settings set to `true`.

## 9. Why did you not use IAM Identity Center?

For this learning-account configuration, enabling the organization instance would have introduced AWS Organizations and conflicted with the account's plan and credit constraints. I documented the decision and used a protected IAM console user instead. In a production or multi-account environment, I would prefer centralized workforce access with short-lived sessions.

## 10. What would you add in production?

I would evaluate multi-account governance, service control policies, centralized immutable logging, selected CloudTrail data events, log-file validation, customer-managed KMS encryption, AWS Config, Security Hub, GuardDuty, automated alerting, formal access reviews, break-glass procedures, and tested incident response. The exact controls would depend on risk, compliance, and cost requirements.

## Evidence references

- Root protection: `E01a`, `E01b`, `E02`
- Administrator protection and IAM review: `E02b`, `E02c`, `E03`, `E04`
- CloudTrail: `E05`, `E05b`, `E06`
- Budget: `E07`, `E07b`
- S3 and final validation: `E08`, `E09`
