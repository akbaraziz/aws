/*
In this example, users.csv is a CSV file that resides in the same directory as your Terraform configuration. It should contain a column name with the usernames you wish to create.
*/

provider "aws" {
  region = "us-west-2"
}

locals {
  user_data = csvdecode(file("${path.module}/users.csv"))
}

resource "aws_iam_user" "user" {
  for_each = { for user in local.user_data : user.name => user }
  name     = each.value["name"]
  path     = "/system/"
}
