provider "aws" {
  region = "us-west-2"
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "N"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Table"
  }
}
