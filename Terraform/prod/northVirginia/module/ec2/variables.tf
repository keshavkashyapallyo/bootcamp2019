variable "ami" {
  description = "ami-id"
  default ="ami-2757f631"
}

variable "tagNameForEc2" {
  description = "tag name for EC2"
  default = "keshav"
}

variable "instanceTypeForEc2" {
  description = "instanceType for EC2"
  //value = "t2.micro"
  default = "t2.micro"
}

