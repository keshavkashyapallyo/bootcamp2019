
output "id" {
  value = aws_instance.this.*.associate_public_ip_address

}

output "private_ip" {
  value = aws_instance.this.*.private_ip

}

