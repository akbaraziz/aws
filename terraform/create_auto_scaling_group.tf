provider "aws" {
  region = "us-west-2"
}

resource "aws_launch_configuration" "example" {
  name          = "example"
  image_id      = "ami-0c94855ba95c574c8"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.id
  min_size             = 1
  max_size             = 5
  desired_capacity     = 3
  vpc_zone_identifier  = ["subnet-abcde012", "subnet-bcde012a"]

  tags = {
    Name = "example-asg"
  }
}
