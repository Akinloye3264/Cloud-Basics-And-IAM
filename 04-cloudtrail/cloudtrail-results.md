# CloudTrail Configuration and Validation

- Validation date: 2026-11-01
- Trail name: `account-hardening-trail`
- Trail status: Logging
- Trail scope: Multi-Region
- Management events: All API activity, including read and write events
- Data events: Not configured
- S3 log delivery: Verified by a delivered log file
- S3 bucket-level Block Public Access: On

## Event validation

CloudTrail Event history displayed recent management events associated with
creating and starting the trail, configuring event selectors, applying the S3
bucket policy, and enabling bucket encryption. This confirmed that management
activity was being recorded and was visible for review.

## Security and cost decisions

The automatically created S3 destination remains private, with bucket-level
Block Public Access enabled. Optional S3 object-level data events were not
enabled because the task requires management events and data events can add
cost. SNS notifications and SSE-KMS encryption were not enabled for this
learning configuration. Default S3 encryption was applied during trail setup.

## Evidence

- `screenshots/after/E05-cloudtrail-trail.png`
- `screenshots/after/E05b-cloudtrail-bucket-private.png`
- `screenshots/after/E06-cloudtrail-event.png`
