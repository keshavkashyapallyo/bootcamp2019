output "aws_vpc_id" {
  value = aws_vpc.keshavbootcampvpc.id
}

output "aws_security_group" {
  value = aws_security_group.keshav_VPC_Security_Group.id
}

output "aws_subnet_public_id1" {
  value = aws_subnet.keshav_public_Subnet1.id
}

output "aws_subnet_public_id2" {
  value = aws_subnet.keshav_public_Subnet2.id
}

output "aws_subnet_private_id" {
  value = aws_subnet.keshav_private_Subnet1.id
}

output "aws_network_acl" {
  value = aws_network_acl.keshav_VPC_Security_ACL.id
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.keshavInternetGateway.id
}

output "aws_route" {
  value = aws_route.Keshav_VPC_internet_access.id
}

output "aws_route_table_associationPublic1" {
  value = aws_route_table_association.keshav_VPC_association.id
}

output "aws_vpc_security_group_id" {
  value = aws_vpc.keshavbootcampvpc.default_security_group_id
}