#!/usr/bin/env bash
# Read-only AWS CLI checks. Some commands require additional read permissions.
set -euo pipefail
AWS_ARGS=()
if [[ -n "${AWS_PROFILE:-}" ]]; then
  AWS_ARGS+=(--profile "$AWS_PROFILE")
fi
echo "== Caller identity =="
aws sts get-caller-identity "${AWS_ARGS[@]}"
echo "== IAM users =="
aws iam list-users "${AWS_ARGS[@]}" --query 'Users[].{User:UserName,Created:CreateDate}' --output table
echo "== IAM groups =="
aws iam list-groups "${AWS_ARGS[@]}" --query 'Groups[].{Group:GroupName,Created:CreateDate}' --output table
echo "== IAM roles =="
aws iam list-roles "${AWS_ARGS[@]}" --query 'Roles[].{Role:RoleName,Created:CreateDate}' --output table
echo "== CloudTrail trails =="
aws cloudtrail describe-trails "${AWS_ARGS[@]}" --include-shadow-trails --query 'trailList[].{Name:Name,MultiRegion:IsMultiRegionTrail,S3Bucket:S3BucketName}' --output table
ACCOUNT_ID="$(aws sts get-caller-identity "${AWS_ARGS[@]}" --query Account --output text)"
echo "== Account-level S3 Block Public Access =="
aws s3control get-public-access-block "${AWS_ARGS[@]}" --account-id "$ACCOUNT_ID" --output json
echo "NOTE: AccessDenied may mean insufficient read permission; it does not prove the control is disabled."
