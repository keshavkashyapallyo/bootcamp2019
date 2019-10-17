provider "aws" {
  profile    = "keshavbootcamp"
  region     = "us-east-1"
  version    = "~> 2.0"
}


data "template_file" "user_data_hw" {
  template = <<EOF
#!/bin/bash -xe
apt-get update -y
apt-get install -y awscli docker.io jq
EOF
}

resource "aws_launch_template" "hello-world" {
  name = "keshav-launch-template"
  disable_api_termination = true
  iam_instance_profile {
    name = var.iamInstanceProfile
  }
  image_id = var.amiImageId
  instance_initiated_shutdown_behavior = "terminate"
  instance_type = var.instanceType
  //key_name = "key-1"
  vpc_security_group_ids = [var.securityGroupId]

  user_data = "${base64encode(data.template_file.user_data_hw.rendered)}"
}