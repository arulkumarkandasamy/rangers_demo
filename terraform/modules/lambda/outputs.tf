output "aws_iam_role" {
  value = "${aws_iam_role.lambda_role.arn}"
}

output "s3_bucket_name" {
  value = "${aws_s3_bucket.arul_demo.id}"
}