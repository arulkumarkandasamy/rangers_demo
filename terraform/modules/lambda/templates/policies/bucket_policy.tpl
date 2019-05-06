{
    "Version": "2012-10-17",
    "Id": "ArulDemoBucketPolicy",
    "Statement": [
        {
            "Sid": "AllowLambdas",
            "Effect": "Allow",
            "Principal": {
                  "AWS": "${lambda_role_arn}"
            },
            "Action": "s3:*",
            "Resource": "${arul_demo_bucket_arn}"
        }
    ]
}