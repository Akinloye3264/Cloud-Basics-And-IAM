# IAM Access Review Summary

- Review date: 2026-11-02
- IAM users: 1
- IAM user groups: 1
- IAM roles: 3
- Administrator-level human access identified: Yes - one protected administrator
- Long-lived IAM access keys identified: No
- Excessive permissions identified in the reviewed configuration: Broad administrator access is documented and restricted to one administrative identity

The `cloud-security-admin` IAM user is the separate identity for routine
administration. It is a member of `CloudSecurityAdministrators`, which has the
AWS-managed `AdministratorAccess` policy. The account requires broad access
for this sole administrator, but the permission is high risk and must be
restricted to this group, reviewed regularly, and never used by ordinary
workload identities. The user has MFA enabled and no access keys.

All three roles were AWS-managed service-linked roles:

- `AWSServiceRoleForResourceExplorer`
- `AWSServiceRoleForSupport`
- `AWSServiceRoleForTrustedAdvisor`

The trust policy for `AWSServiceRoleForResourceExplorer` was reviewed. It
allows only the Resource Explorer service principal,
`resource-explorer-2.amazonaws.com`, to perform `sts:AssumeRole`. Its attached
AWS-managed policy was identified as `AWSResourceExplorerServiceRolePolicy`.

The reviewed service-linked roles have documented AWS service purposes and use
temporary service credentials, so the decision was to retain them.

Evidence:

- `screenshots/after/E03-iam-least-privilege.png`
- `screenshots/after/E04-access-review.png`
- `screenshots/after/E04-role-trust-policy.png`
- `screenshots/after/E02b-admin-mfa.png`
- `screenshots/after/E02c-admin-no-access-keys.png`
