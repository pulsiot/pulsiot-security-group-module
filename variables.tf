variable "vpc_id" {
  description = "Enter the VPC ID:"
  type        = string 
  default     = null
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
