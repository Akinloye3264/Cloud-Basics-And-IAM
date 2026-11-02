# Cloud-Basics-And-IAM

The lab follows the order a student should implement the controls in a real AWS account, explains why each control matters, includes commands and policy examples, identifies
the evidence to capture, and provides a sample solution and resume statements.

The project also incorporates the Cloud Basics + IAM concepts:

- IAM users, groups, roles, and policies.
- Least-privilege access.
- Auditing who has access to what.
- Detecting and preventing misconfigured public S3 buckets.
- Logging activity with CloudTrail.
- Billing alerts and cost awareness.
- Documenting security decisions and validating the final configuration.

**Level:** Beginner | **Time:** 3–5 hours | **Focus:** AWS fundamentals, IAM, least privilege, access auditing, CloudTrail, billing alerts, and S3 security.

## Scenario

You are a junior cloud security engineer at fictional Northstar Digital. Prepare a documented security baseline for a new AWS account, verify each control, and provide evidence another engineer can review.

> **Safety:** Use an account you own or are authorized to administer. AWS Free Tier eligibility and pricing can change; check current terms before enabling services. Never commit credentials, MFA QR codes,
recovery codes, account IDs, private billing details, or unredacted screenshots. Do not make a real S3 bucket public for testing.

## Learning outcomes

- Explain root users, IAM users/groups/roles, permission policies, and role trust policies.
- Protect root access with MFA and avoid using root for routine work.
- Apply and explain least privilege.
- Audit users, groups, roles, policies, and trust relationships.
- Enable CloudTrail management-event logging and verify activity.
- Configure billing budget notifications.
- Enable account-level S3 Block Public Access and review bucket exposure.
- Document decisions, validation evidence, limitations, and remediation.

## GitHub repository layout

```text
aws-account-hardening/
├── README.md
├── 01-account-setup/account-setup.md
├── 02-root-security/root-mfa.md
├── 03-iam-least-privilege/
│   ├── README.md
│   ├── access-review-template.csv
│   └── policies/
│       ├── s3-report-reader.json
│       └── s3-security-auditor-readonly.json
├── 04-cloudtrail/cloudtrail-setup.md
├── 05-billing-alerts/billing-alerts.md
├── 06-s3-protection/
│   ├── README.md
│   ├── validation-commands.sh
│   └── policies/bucket-policy-private-transport.json
├── 07-validation/
│   ├── validation-checklist.md
│   └── commands.sh
├── 08-report/
│   ├── findings-template.md
│   └── sample-report.md
├── 09-resume/
│   ├── resume-bullets.md
│   └── interview-notes.md
├── docs/
│   ├── architecture.md
│   ├── decision-log.md
│   ├── evidence-checklist.md
│   ├── troubleshooting.md
│   └── validation-results.md
└── screenshots/
    ├── README.md
    ├── before/.gitkeep
    └── after/.gitkeep
```

## Prerequisites

- AWS account you control or are authorized to secure.
- Console access, password manager, and MFA method.
- Optional AWS CLI v2 for read-only validation.
- Familiarity with JSON is helpful but not required.

Do not create root access keys. Prefer IAM Identity Center or another approved temporary-credential workflow for human access where practical. Avoid creating long-lived IAM access keys just to complete this lab.

## Lab sequence and evidence

| Stage | Task | Evidence |
|---|---|---|
| 1 | Select/create a learning account | Redacted setup notes |
| 2 | Enable root MFA and review root keys | MFA status and root-key status |
| 3 | Review IAM and least privilege | Policy JSON and access inventory |
| 4 | Enable CloudTrail | Trail configuration and recent event |
| 5 | Configure budget notifications | Budget threshold and notification |
| 6 | Block public S3 access | Four account-level settings enabled |
| 7 | Validate controls | Completed checklist and results |
| 8 | Write report and resume bullets | Report, decision log, accurate claims |

## Important design note

The primary S3 public-access guardrail in this lab is **account-level S3 Block Public Access with all four settings enabled**. A bucket policy is an additional defense-in-depth control, not a replacement for Block Public Access or a full audit of identity permissions, bucket policies, and ACLs.

## Completion criteria

- [x] Root MFA enabled; no root access keys, or exception documented.
- [x] Routine administration uses a separate protected identity.
- [x] IAM users/groups/roles and permission sources reviewed.
- [x] A least-privilege policy reviewed and explained.
- [x] CloudTrail multi-Region management-event trail is logging.
- [x] Budget and at least one notification threshold configured.
- [x] All four account-level S3 Block Public Access settings enabled.
- [x] Before/after evidence captured truthfully and sanitized.
- [x] Decision log, validation results, and final report completed.
- [x] Resume wording matches work actually performed.

## Official references

- [Root-user best practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/root-user-best-practices.html)
- [IAM security best practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [S3 Block Public Access](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html)
- [Account-level S3 Block Public Access](https://docs.aws.amazon.com/AmazonS3/latest/userguide/configuring-block-public-access-account.html)
- [CloudTrail trails](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html)
- [AWS Budgets](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html)
- [AWS CLI installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## Student completion record

- **Status:** Not started
- **Date completed:** `YYYY-MM-DD`
- **Controls verified:** List only controls you checked
- **Known limitations:** List controls not tested or implemented
- **Evidence:** Redacted screenshots in `screenshots/`
