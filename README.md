# AWS Account Hardening and IAM Security Lab

Completed hands-on project that establishes and validates a foundational security baseline for an authorized AWS learning account. The lab covers root-account protection, IAM access review, audit logging, cost monitoring, S3 public-access prevention, evidence collection, and security reporting.

- **Status:** Completed and validated
- **Completed:** 2026-11-02
- **Level:** Beginner
- **Focus:** AWS IAM, least-privilege analysis, CloudTrail, AWS Budgets, S3 security, and evidence-based reporting

## Verified results

| Control | Verified result | Evidence or documentation |
|---|---|---|
| Root security | MFA active; both root access-key slots inactive | [Root-security evidence](screenshots/after/) |
| Routine administration | Separate MFA-protected IAM console user with no access keys | [Setup notes](01-account-setup/setup-notes.md) |
| IAM access review | 1 user, 1 group, and 3 AWS service-linked roles inventoried | [Access-review summary](03-iam-least-privilege/access-review-summary.md) |
| Least-privilege analysis | Task-scoped S3 report-reader policy reviewed and explained; not deployed | [Policy review](03-iam-least-privilege/policy-review.md) |
| Audit logging | Multi-Region CloudTrail records management read/write events | [CloudTrail results](04-cloudtrail/cloudtrail-results.md) |
| Cost monitoring | Recurring USD 5 monthly budget with a verified 80% actual-cost email alert | [Budget results](05-billing-alerts/billing-alert-results.md) |
| S3 protection | All four account-level Block Public Access settings enabled | [S3 results](06-s3-protection/s3-protection-results.md) |
| Final validation | IAM inventory, CloudTrail, and S3 controls confirmed with read-only AWS CLI checks | [Validation results](docs/validation-results.md) |

## Scenario

As a junior cloud security engineer for fictional Northstar Digital, I prepared a documented baseline for a new AWS account, verified each control, and produced evidence another engineer can review.

The work followed this sequence:

1. Recorded the authorized learning-account scope.
2. Verified root MFA and the absence of root access keys.
3. Established a separate protected identity for routine administration.
4. Inventoried IAM users, groups, roles, policies, and a service-role trust relationship.
5. Reviewed a task-scoped S3 policy for least privilege.
6. Enabled multi-Region CloudTrail management-event logging.
7. Configured an AWS cost budget and notification.
8. Enabled all four account-level S3 Block Public Access settings.
9. Validated the resulting configuration and documented findings.

## Architecture and control flow

~~~text
Protected administrator
        |
        v
IAM group with documented administrative access
        |
        +----> AWS account configuration
        |          |
        |          +----> CloudTrail management events
        |          |          |
        |          |          v
        |          |     Private S3 log bucket
        |          |
        |          +----> Account-level S3 Block Public Access
        |
        +----> AWS Budgets 80% actual-cost email notification

Read-only AWS CLI checks ----> Validation results and sanitized evidence
~~~

See [architecture.md](docs/architecture.md) for the supporting design notes.

## Key security decisions

- Root is reserved for root-only tasks and protected with MFA.
- Routine administration uses a separate IAM user with MFA and no long-lived access keys.
- The sole administrator group currently has broad **AdministratorAccess**. This is a documented residual risk requiring restricted membership and periodic review.
- The sample S3 report-reader policy demonstrates resource and prefix scoping but was reviewed rather than deployed.
- CloudTrail captures multi-Region management read/write events. S3 object data events were not enabled because they were outside this baseline and can add cost.
- Account-level S3 Block Public Access is the primary public-access guardrail. Bucket policies, ACLs, access points, and authenticated access still require review.
- The AWS budget improves cost visibility but is not a hard spending cap.

Full rationale and evidence references are in the [security decision log](docs/decision-log.md).

## Repository structure

~~~text
.
|-- 01-account-setup/          Account scope and completed setup notes
|-- 02-root-security/          Root MFA and access-key guidance
|-- 03-iam-least-privilege/    IAM inventory, policy examples, and review
|-- 04-cloudtrail/             Trail instructions and verified results
|-- 05-billing-alerts/         Budget instructions and verified results
|-- 06-s3-protection/          S3 controls, policy example, and results
|-- 07-validation/             Read-only CLI checks and final checklist
|-- 08-report/                 Findings report and illustrative sample
|-- 09-resume/                 Evidence-aligned resume and interview notes
|-- docs/                      Decisions, validation, architecture, evidence
|-- screenshots/               Sanitized before-and-after evidence
└-- README.md
~~~

## Validation

The final validation script uses read-only AWS CLI calls:

~~~bash
chmod +x 07-validation/commands.sh
./07-validation/commands.sh
~~~

It checks:

- caller identity;
- IAM users, groups, and roles;
- CloudTrail trail configuration; and
- account-level S3 Block Public Access.

The recorded outcome is in [validation-results.md](docs/validation-results.md), and the completed control checklist is in [validation-checklist.md](07-validation/validation-checklist.md).

## Findings and portfolio material

- [Final findings report](08-report/findings-template.md)
- [Access-review inventory](03-iam-least-privilege/access-review-template.csv)
- [Evidence checklist](docs/evidence-checklist.md)
- [Resume bullets](09-resume/resume-bullets.md)
- [Interview notes](09-resume/interview-notes.md)

## Limitations and remaining risk

- No exploitation or penetration testing was performed.
- The reviewed least-privilege S3 policy was not attached to an identity.
- The routine administrator retains broad access.
- CloudTrail data events, log-file validation, and SSE-KMS encryption were not configured.
- The review covers the stated baseline, not every AWS service or possible access path.
- IAM Identity Center was not enabled because the learning-account plan and credit constraints made the required organization setup unsuitable for this lab.

## Safety and evidence handling

Use only an account you own or are authorized to administer. Never commit passwords, access keys, session tokens, MFA QR or recovery material, private billing details, unredacted account IDs, bucket identifiers, or email addresses. The evidence in this repository was cropped or sanitized to exclude sensitive identifiers.

Do not make a real S3 bucket public to test this lab. AWS pricing and free-plan terms can change, so review current service pricing before enabling additional logging or security services.

## Completion record

- [x] Root MFA enabled and root access keys absent.
- [x] Separate protected identity used for routine administration.
- [x] IAM identities, permission sources, and a trust relationship reviewed.
- [x] Least-privilege policy design reviewed and explained.
- [x] Multi-Region CloudTrail management-event logging validated.
- [x] Budget and notification threshold configured.
- [x] All four account-level S3 Block Public Access settings enabled.
- [x] Genuine sanitized before-and-after evidence captured.
- [x] Decision log, validation results, and findings report completed.
- [x] Resume wording limited to verified work.

## Official AWS references

- [Root-user best practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/root-user-best-practices.html)
- [IAM security best practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [S3 Block Public Access](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html)
- [Account-level S3 Block Public Access](https://docs.aws.amazon.com/AmazonS3/latest/userguide/configuring-block-public-access-account.html)
- [Creating and updating CloudTrail trails](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html)
- [Managing costs with AWS Budgets](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html)
- [AWS CLI installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
