provider "aws" {
  region = "us-west-2"
}

resource "aws_iam_user" "user" {
  name = "example_user"
  path = "/system/"
}
