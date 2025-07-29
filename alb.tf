module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"

  name    = "rakeem-alb"
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets

  load_balancer_type = "application"

  security_group_ingress_rules = {
    allow_http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      description = "Allow HTTP traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  security_group_egress_rules = {
    all_outbound = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  listeners = {
    http = {
      port     = 80
      protocol = "HTTP"

      forward = {
        target_group_key = "ec2-target"
      }
    }
  }

  target_groups = {
    ec2-target = {
      name_prefix = "ec2tg"
      protocol    = "HTTP"
      port        = 80
      target_type = "instance"
      target_id   = module.ec2_instance.id
    }
  }

  tags = {
    Environment = "dev"
    Project     = "3-tier"
  }
}