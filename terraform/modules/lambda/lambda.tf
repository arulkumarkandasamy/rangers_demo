resource "aws_lambda_function" "arul_demo" {
  environment {
    variables = {
      ENV             = "demo"
      USE_AWS         = "True"
      DB_PASSWORD     = "${var.DB_PASSWORD}"
      DB_HOST_ADDRESS = "${var.DB_HOST_ADDRESS}"

      # Creates an implicit dependency on the arul_demo s3 bucket
      # https://www.terraform.io/intro/getting-started/dependencies.html
      S3_BUCKET = "${aws_s3_bucket.arul_demo.id}"
    }
  }

  filename         = "${var.repo_dir}/dist/lambdas/rangers_demo_lambda.zip"
  function_name    = "arul_demo"
  role             = "${aws_iam_role.lambda_role.arn}"
  handler          = "rangers_demo_lambda.main"
  source_code_hash = "${base64sha256(file("${var.repo_dir}/dist/lambdas/rangers_demo_lambda.zip"))}"
  runtime          = "python3.6"
  timeout          = 5

  vpc_config {
    security_group_ids = ["${var.security_group_ids}"]
    subnet_ids         = ["${var.subnet_ids}"]
  }

  tags {
    Name    = "rangers_demo_lambda"
    Env     = "demo"
    Project = "arul-demo"
  }
}
