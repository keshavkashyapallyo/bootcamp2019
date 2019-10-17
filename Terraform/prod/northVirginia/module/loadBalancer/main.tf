provider "aws" {
  profile    = "keshavbootcamp"
  region     = "us-east-1"
  version    = "~> 2.0"
}

/*resource "aws_alb" "ecs-load-balancer" {
  name                = "ecs-load-balancer"
  security_groups     = [aws_security_group.test_public_sg.id]
  subnets             = ["aws_subnet.test_public_sn_01.id", "aws_subnet.test_public_sn_02.id"]

}*/

