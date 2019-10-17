provider "aws" {
  profile    = "keshavbootcamp"
  region     = "us-east-1"
  version    = "~> 2.0"
}

//Create VPC

module "vpc" {
  source = "./module/vpc"
  cidr_block =var.cidr_block
}

//Create IAM
module "iam" {
  source = "./module/iam"
  iamInstanceProfileName = var.iamInstanceProfileName
  iamRoleName = var.iamRoleName
}

//Create Load Balancer


//create ECS Cluster


//Create launch Template
module "launchTemplate" {
  source = "./module/launchTemplate"
  securityGroupId = module.vpc.aws_vpc_security_group_id
  amiImageId = var.amiImageId
  iamInstanceProfile = module.iam.aws_iam_instance_profile
  instanceType = var.instanceType


}


//Create Auto Scaling Group

module "autoScalingGroup" {
  source = "./module/asg"
  launchTemplateID = module.launchTemplate.launchTemplateId

  subnetPublic1 = module.vpc.aws_subnet_public_id1
  subnetPublic2 = module.vpc.aws_subnet_public_id2
}


// Task Def of NGINX

