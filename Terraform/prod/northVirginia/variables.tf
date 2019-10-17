variable "cidr_block" {
  description = "VPC CIDR"
  default = "10.0.0.0/16"
}

variable "securityGroupId" {
  description = "VPC Security Group ID"
  default = "sg-0072ca7806fe32f75"
}

variable "amiImageId" {
  description = "AMI Image ID"
  default = "ami-2757f631"
}

variable "instanceType" {
  description = "Instance Type"
  default = "t2.micro"
}

variable "iamInstanceProfileName" {
  description = "instance Profile name"
  default = "keshav-instanceProfile-terraform"
}

variable "iamRoleName" {
  description = "instance Role name"
  default = "keshav-roleName-terraform"
}






