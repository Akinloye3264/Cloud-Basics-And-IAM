# S3 Protection Review Results

- Validation date: 2026-11-02
- Account-level Block Public Access: Enabled
- All four account-level settings: Enabled
- Relevant bucket reviewed: CloudTrail log bucket
- Bucket-level Block Public Access: Enabled
- Bucket policy exposure: Public access blocked
- Bucket ACL: Only the bucket owner has permissions
- Public testing performed: No

## Bucket policy and ACL review

The CloudTrail log bucket was reviewed without making it public. Account-level
and bucket-level Block Public Access are enabled. The console reported that
public access through the bucket policy is blocked, and the ACL grants
permissions only to the bucket owner. No `Everyone` or `AuthenticatedUsers`
public ACL grants were present.

## Additional policy template review

`policies/bucket-policy-private-transport.json` was reviewed but not deployed.
Its `DenyInsecureTransport` statement denies requests that do not use secure
transport. Its `DenyRequestsFromOutsideThisAccount` statement would deny
principals outside the account and could break legitimate cross-account or
AWS-service integrations if applied without testing. Placeholders would also
need to be replaced before use.

A bucket policy alone is insufficient because it protects only the bucket to
which it is attached and can be changed or misconfigured. It does not provide
the account-wide guardrail supplied by S3 Block Public Access, and it does not
replace review of identity permissions, ACLs, access points, or other resource
policies.

## Evidence

- `screenshots/before/E08-before-s3-block-public-access.png`
- `screenshots/after/E08-s3-block-public-access.png`
- `screenshots/after/E05b-cloudtrail-bucket-private.png`
