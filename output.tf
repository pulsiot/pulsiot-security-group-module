output "security_group_name" {
  description = "The new security group created."
  value       = try(aws_security_group.sec_group.name, "")
}
