# Least-Privilege Policy Review

## Policy reviewed

`policies/s3-report-reader.json`

This is an illustrative policy for reading reports from one private S3 bucket.
It was reviewed but not deployed. The placeholder bucket name remains unchanged
because no private test bucket was required for this review.

## Action-by-action explanation

### `s3:ListBucket`

Allows the principal to list objects in one specifically named S3 bucket. The
bucket ARN identifies the bucket itself and does not grant access to every S3
bucket in the account.

The `s3:prefix` condition restricts listing to the `reports` prefix and objects
beneath `reports/`. This prevents the principal from browsing unrelated areas
of the bucket through this statement.

### `s3:GetObject`

Allows the principal to read objects stored under `reports/*` in the named
bucket. The object ARN is scoped to that prefix rather than using a wildcard
for every bucket or every object.

## Permissions not granted

The policy does not allow the principal to:

- create or delete buckets;
- upload, modify, or delete objects;
- change bucket policies, ACLs, encryption, or public-access settings;
- read objects outside the `reports/` prefix; or
- list or access other buckets.

## Least-privilege assessment

The policy follows least privilege by granting only the two read operations
needed for the reporting task, restricting them to one named bucket, and
limiting object access to the `reports/` prefix. Before deployment, the
placeholder must be replaced with the exact name of an authorized private
bucket and the resulting policy must be validated. A policy stored in the
repository is not evidence that it was deployed.
