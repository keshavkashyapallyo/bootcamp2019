provider "aws" {
  profile    = "keshavbootcamp"
  region     = "us-east-1"
  version    = "~> 2.0"
}

resource "aws_autoscaling_group" "hello-world-blue" {

  availability_zones = ["us-east-1a"]
  max_size           = 1
  min_size           = 1
  vpc_zone_identifier       = [var.subnetPublic1,var.subnetPublic2]

  launch_template {
    id      = var.launchTemplateID
    version = "$Latest"
  }
}