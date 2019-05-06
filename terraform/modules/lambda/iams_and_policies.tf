# Allows any lambda function with the "lambda_role" iam role to access the bucket.
resource "aws_s3_bucket_policy" "arul_demo" {
  bucket = "${aws_s3_bucket.arul_demo.id}"
  policy = "${data.template_file.bucket_policy.rendered}"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  # https://aws.amazon.com/blogs/security/now-create-and-manage-aws-iam-roles-more-easily-with-the-updated-iam-console/
  assume_role_policy = "${file("${path.module}/policies/lambda_trust_policy.json")}"

 }

// Create a custom lambda policy because AWSLambdaExecute is too basic but other policies are too permissive. Allow
// access to S3, CloudWatch logs, ssm Parameter Store, and VPC.
resource "aws_iam_policy" "arul_demo_lambda_policy" {
  name   = "arul-demo-lambda-policy"
  policy = "${data.template_file.lambda_basic_execution_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "arul_demo_lambda_basic_execution_policy_attachment" {
  role       = "${aws_iam_role.lambda_role.id}"
  policy_arn = "${aws_iam_policy.arul_demo_lambda_policy.arn}"
}
