output "security_groups" {
  description = "The new security group created."
  value       = aws_security_group.sec_group.id
}
