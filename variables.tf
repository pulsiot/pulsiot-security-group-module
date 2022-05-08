variable "vpc_id" {
  description = "Enter the VPC ID:"
  type        = string
  default     = null
}

variable "cidr_blocks" {
  description = "Enter the IPv4 CIDR block:"
  type        = list(any)
  default     = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
  description = "Enter the IPv6 CIDR block:"
  type        = list(any)
  default     = ["::/0"]
}

variable "ipv4_ingress_rules" {
  type = map(
    object(
      {
        from_port = number
        to_port = number
        protocol = string
        cidr_blocks = string
        description = string
      }
    )
  )
  default = {
    sgr1 = { from_port=22, to_port=22, protocol="tcp", cidr_blocks="0.0.0.0/0", description="SSH Access" }
    sgr2 = { from_port=80, to_port=80, protocol="tcp", cidr_blocks="0.0.0.0/0", description="HTTP Access" }
    sgr3 = { from_port=443, to_port=443, protocol="tcp", cidr_blocks="0.0.0.0/0", description="HTTPS Access" }
  }
}
