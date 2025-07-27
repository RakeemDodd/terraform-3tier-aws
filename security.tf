resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["67.83.164.99/32"] 
  security_group_id = module.vpc.default_security_group_id
}
