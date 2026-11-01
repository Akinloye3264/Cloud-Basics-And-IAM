# IAM Access Review Summary

- Review date: 2026-11-01
- IAM users: 0
- IAM user groups: 0
- IAM roles: 3
- Administrator-level human access identified: No
- Long-lived IAM user credentials identified: No
- Excessive permissions identified in the reviewed configuration: No

All three roles were AWS-managed service-linked roles:

- `AWSServiceRoleForResourceExplorer`
- `AWSServiceRoleForSupport`
- `AWSServiceRoleForTrustedAdvisor`

The trust policy for `AWSServiceRoleForResourceExplorer` was reviewed. It
allows only the Resource Explorer service principal,
`resource-explorer-2.amazonaws.com`, to perform `sts:AssumeRole`. Its attached
AWS-managed policy was identified as `AWSResourceExplorerServiceRolePolicy`.

No IAM users or user groups required remediation. The reviewed service-linked
roles have documented AWS service purposes and use temporary service
credentials, so the decision was to retain them.

Evidence:

- `screenshots/after/E03-iam-least-privilege.png`
- `screenshots/after/E04-access-review.png`
- `screenshots/after/E04-role-trust-policy.png`
