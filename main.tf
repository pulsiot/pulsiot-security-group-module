resource "aws_security_group" "sec_group" {
  name        = "Pulsiot EC2 SG1"
  description = "Primary Security Group used by Pulsiot EC2 instances"
  vpc_id      = var.vpc_id

  tags = {
    Name = "pulsiot-sg01"
  }
}

# Commented out for introducing loop
# resource "aws_security_group_rule" "http_allow" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   cidr_blocks       = var.cidr_blocks
#   ipv6_cidr_blocks  = var.ipv6_cidr_blocks
#   security_group_id = aws_security_group.sec_group.id
# }

# Commented out for introducing loop
# resource "aws_security_group_rule" "ssh_allow" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = var.cidr_blocks
#   ipv6_cidr_blocks  = var.ipv6_cidr_blocks
#   security_group_id = aws_security_group.sec_group.id
# }

resource "aws_security_group_rule" "ipv4_ingress_allow" {
  for_each = var.ipv4_ingress_rules
  type = "ingress"
  from_port = each.value.from_port
  to_port = each.value.to_port
  protocol = each.value.protocol
  cidr_blocks = [ each.value.cidr_blocks ]
  description = each.value.description
  security_group_id = aws_security_group.sec_group.id
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = var.cidr_blocks
  ipv6_cidr_blocks  = var.ipv6_cidr_blocks
  security_group_id = aws_security_group.sec_group.id
}
