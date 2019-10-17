provider "aws" {
  profile    = "keshavbootcamp"
  region     = "us-east-1"
  version    = "~> 2.0"
}

# create the VPC
resource "aws_vpc" "keshavbootcampvpc" {

  cidr_block = var.cidr_block

}

# create the Public Subnet
resource "aws_subnet" "keshav_public_Subnet1" {
  vpc_id                  = aws_vpc.keshavbootcampvpc.id
  cidr_block              = "10.0.1.0/26"
  availability_zone       = "us-east-1a"

}


# create the Private Subnet
resource "aws_subnet" "keshav_private_Subnet1" {
  vpc_id                  = aws_vpc.keshavbootcampvpc.id
  cidr_block              = "10.0.2.0/26"
  availability_zone       = "us-east-1b"

}

# create the Public Subnet
resource "aws_subnet" "keshav_public_Subnet2" {
  vpc_id                  = aws_vpc.keshavbootcampvpc.id
  cidr_block              = "10.0.3.0/26"
  availability_zone       = "us-east-1c"

}


# create the Private Subnet
resource "aws_subnet" "keshav_private_Subnet2" {
  vpc_id                  = aws_vpc.keshavbootcampvpc.id
  cidr_block              = "10.0.4.0/26"
  availability_zone       = "us-east-1d"

}


# Create the Security Group
resource "aws_security_group" "keshav_VPC_Security_Group" {
  vpc_id       = aws_vpc.keshavbootcampvpc.id
  name         = "Keshav VPC Security Group"
  description  = "Keshav VPC Security Group"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
}


# create VPC Network access control list
resource "aws_network_acl" "keshav_VPC_Security_ACL" {
  vpc_id = aws_vpc.keshavbootcampvpc.id
  subnet_ids = [aws_subnet.keshav_private_Subnet1.id]

  # allow port 22
  ingress {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 22
    to_port = 22
  }

  # allow ingress ephemeral ports
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # allow egress ephemeral ports
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }
}


# Create the Internet Gateway
resource "aws_internet_gateway" "keshavInternetGateway" {
  vpc_id = aws_vpc.keshavbootcampvpc.id

}

# Create the Route Table
resource "aws_route_table" "keshav_VPC_route_table" {
  vpc_id = aws_vpc.keshavbootcampvpc.id

}


# Create the Internet Access
resource "aws_route" "Keshav_VPC_internet_access" {
  route_table_id        = aws_route_table.keshav_VPC_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.keshavInternetGateway.id
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "keshav_VPC_association" {
  subnet_id      = aws_subnet.keshav_public_Subnet1.id
  route_table_id = aws_route_table.keshav_VPC_route_table.id
}



