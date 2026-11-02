# Step 7 — Final Validation Checklist

## Identity and IAM
- [x] Root MFA enabled.
- [x] No root access keys, or exception documented.
- [x] Routine administration uses a separate protected identity.
- [x] Users, groups, roles, attached/inline policies, and trust policies reviewed where applicable.
- [x] Least-privilege policy and its resource scope explained.
- [x] Broad access and unused identities documented with a decision.

## Logging and cost
- [x] CloudTrail multi-Region trail is logging management read/write events.
- [x] Recent management event visible.
- [x] Log destination private and access restricted.
- [x] Budget and at least one notification threshold configured.
- [x] Budget limitations understood; it is not a hard spending cap.

## S3
- [x] All four account-level Block Public Access settings enabled.
- [x] Relevant bucket settings, policies, and ACLs reviewed.
- [x] No real data made public during testing.
- [x] Additional bucket policy reviewed for cross-account impact.

## Documentation
- [x] Decision log and validation results completed.
- [x] Screenshots are genuine and sanitized to exclude sensitive identifiers and credential material.
- [x] No secrets, tokens, MFA material, or private billing details committed.
- [x] Report separates confirmed observations from recommendations.
- [x] Resume claims match verified work.

Use **Pass** only when configured and verified; **Fail** when checked but not compliant; **Not tested** when no verification was performed.
