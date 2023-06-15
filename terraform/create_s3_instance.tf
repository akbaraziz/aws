provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-name"
  acl    = "private"

  tags = {
    Name = "My bucket"
  }
}
