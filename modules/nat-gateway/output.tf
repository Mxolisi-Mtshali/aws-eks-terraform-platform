output "nat_gw1_id" {
  description = "ID of NAT gateway 1"
  value       = aws_nat_gateway.nat_gw1.id
}

output "nat_gw2_id" {
  description = "ID of NAT gateway 2"
  value       = aws_nat_gateway.nat_gw2.id
}