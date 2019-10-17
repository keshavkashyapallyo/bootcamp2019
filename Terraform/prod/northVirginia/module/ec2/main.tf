provider "aws" {
  profile    = "default"
  region     = "us-east-1"
  version    = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket = "keshavs3test"
    key = "preprod/mumbai/global/vpc/terraform.tfstate"
    region = "us-east-1"
    workspace_key_prefix = "workspace"
  }
}

resource "aws_instance" "this" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = "keshav"



}

/*
module "ec2" {
  source = "git@github.com:kkashyap1707/bootcamp2019.git"
  ami = var.ami
  instance_type = var.instanceTypeForEc2
  name = var.tagNameForEc2


}*/
