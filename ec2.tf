module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 6.0.0" 

  name = "web-server"

  instance_type = var.instance_type
  key_name      = var.key_name
  monitoring    = true
  subnet_id     = module.vpc.public_subnets[0]
  associate_public_ip_address = true


  vpc_security_group_ids = [module.vpc.default_security_group_id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

