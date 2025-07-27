output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "ec2_instance_id" {
  value = module.ec2_instance.id
}

output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}

