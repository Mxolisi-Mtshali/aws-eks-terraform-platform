output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}

output "pub_sub1_id" {
  description = "ID of public subnet 1"
  value       = aws_subnet.pub_sub1.id
}

output "pub_sub2_id" {
  description = "ID of public subnet 2"
  value       = aws_subnet.pub_sub2.id
}

output "pri_sub3_id" {
  description = "ID of private subnet 3"
  value       = aws_subnet.pri_sub3.id
}

output "pri_sub4_id" {
  description = "ID of private subnet 4"
  value       = aws_subnet.pri_sub4.id
}

output "igw_id" {
  description = "ID of the internet gateway"
  value       = aws_internet_gateway.this.id
}

output "region" {
  description = "AWS region used by the VPC module"
  value       = var.region
}