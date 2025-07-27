# Terraform 3-Tier Infrastructure – Project

This project showcases a modular, production-ready 3-tier infrastructure on AWS using official Terraform modules. It includes VPC, EC2, RDS, and ALB components, following best practices for scalability and maintainability.

## Current Status (Phase 1)

**VPC Created Using Module:**
- [terraform-aws-modules/vpc/aws](https://github.com/terraform-aws-modules/terraform-aws-vpc)

Includes:
- Custom CIDR block
- Public & Private subnets across 3 AZs
- NAT Gateway with Elastic IPs
- Internet Gateway and route tables
- VPN Gateway disabled
- Tags and structure ready for expansion  **EC2 Instance Added Using Module:**
- [terraform-aws-modules/ec2-instance/aws](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance)

Details:
- Amazon Linux 2 instance in public subnet
- SSH access via key pair (`rakeem-3tier-key`)
- Public IP auto-assigned
- Security group rule created to allow SSH (port 22) from your IP

## SSH Access Guide

To SSH into the instance:
```bash
chmod 400 rakeem-3tier-key.pem
ssh -i rakeem-3tier-key.pem ec2-user@<public-ip-address>
You must replace <public-ip-address> with the actual IP from the Terraform output. 
```

## Files Overview

| File | Purpose |
|------|---------|
| `main.tf` | Core infrastructure config (VPC + NAT Gateway configuration) |
| `variables.tf` | Input variables for modules |
| `outputs.tf` | Output values like public subnet IDs and EC2 public IP |
| `ec2.tf` | EC2 instance deployment module |
| `security.tf` | SSH rule attached to the VPC's default security group |
| `terraform.tfvars` | Overrides for the input variables (ignored in Git) |
| `.gitignore` | Ignores `.terraform/` and other local files |


## Next Steps

Planned module additions:
- [RDS](https://github.com/terraform-aws-modules/terraform-aws-rds)
- [Application Load Balancer](https://github.com/terraform-aws-modules/terraform-aws-alb)

Each will be integrated as new modules into this same project to create a complete 3-tier app-ready architecture.

## Notes

This README and the project structure will evolve as more services are added.

---

### Author

Rakeem Dodd – [GitHub Profile](https://github.com/RakeemDodd)