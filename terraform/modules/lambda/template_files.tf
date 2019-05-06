data "template_file" "bucket_policy" {
  template = "${file("${path.module}/templates/policies/bucket_policy.tpl")}"

  vars {
    lambda_role_arn        = "${aws_iam_role.lambda_role.arn}"
    arul_demo_bucket_arn = "${aws_s3_bucket.arul_demo.arn}"
  }
}

data "template_file" "lambda_basic_execution_policy" {
  template = "${file("${path.module}/templates/policies/lambda_basic_execution_policy.tpl")}"

  vars {
    aws_region = "${var.aws_region}"
  }
}
