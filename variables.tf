variable "vpc_id" {
  description = "Enter the VPC ID:"
  type        = string 
  default     = "vpc-00312478" 
}


variable "cidr_blocks" {
  description = "Enter the IPv4 CIDR block:"
  type        = list
  default     = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
  description = "Enter the IPv6 CIDR block:"
  type        = list
  default     = ["::/0"]
}
