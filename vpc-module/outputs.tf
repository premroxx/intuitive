output "id" {
  value       = aws_vpc.default.id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = aws_subnet.public.*.id
  description = "List of public subnet IDs"
}

output "nat_gateway_ips" {
  value       = aws_eip.nat.*.public_ip
  description = "List of Elastic IPs associated with NAT gateways"
}