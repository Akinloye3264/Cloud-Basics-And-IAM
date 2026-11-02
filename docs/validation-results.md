# Validation Results

| Control | Expected result | Actual result | Status |
|---|---|---|---|
| Root MFA | Enabled | Credential report shows MFA active | Pass |
| Root access keys | None, or exception documented | Credential report shows both root access keys inactive | Pass |
| IAM least privilege | Actions/resources scoped to task | Sample S3 reporting policy reviewed; actions and resources are limited to listing one bucket and reading its report prefix | Pass |
| Access audit | Identities and permission sources reviewed | 1 IAM user, 1 IAM group, and 3 AWS service-linked roles reviewed and documented | Pass |
| CloudTrail | Multi-Region trail logging management events | `account-hardening-trail` is multi-Region and records management read/write events | Pass |
| Budget | Budget and notification configured | Monthly USD 5 cost budget with an actual-cost alert at 80%; notification email verified | Pass |
| S3 Block Public Access | All four settings true | AWS CLI returned `true` for all four account-level settings | Pass |
| S3 exposure review | No unintended public access found | CloudTrail log bucket has Block Public Access enabled; bucket policy and ACL were reviewed | Pass |

**Pass:** configured and verified. **Fail:** checked but not compliant. **Not tested:** not verified. **Not applicable:** explain why.

Validation was performed on 2026-11-02 using AWS console evidence and read-only AWS CLI commands while signed in as the protected `cloud-security-admin` IAM user. Account identifiers, bucket identifiers, email addresses, and credential material must be redacted from published evidence.
