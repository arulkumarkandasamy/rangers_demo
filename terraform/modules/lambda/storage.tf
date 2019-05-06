# https://stackoverflow.com/questions/7842782/perl-netamazons3-bucketalreadyexists-the-requested-bucket-name-is-not-avail
# In order to increase the chances that a bucket name is available, suffix with a random string
resource "random_string" "arul_demo_bucket_name_suffix" {
  length  = 10
  number  = false
  special = false
  upper   = false
}

resource "aws_s3_bucket" "arul_demo" {
  bucket = "arul-demo-${random_string.arul_demo_bucket_name_suffix.id}"

  tags {
    env     = "prod"
    project = "arul-demo"
  }
}