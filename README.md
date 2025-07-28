# Terraform 3-Tier Infrastructure – Project

This project showcases a modular, production-ready 3-tier infrastructure on AWS using official Terraform modules. It includes VPC, EC2, RDS, and ALB components, following best practices for scalability and maintainability.

## Current Status

**VPC Created Using Module:**
- [terraform-aws-modules/vpc/aws](https://github.com/terraform-aws-modules/terraform-aws-vpc)

Includes:
- Custom CIDR block
- Public & Private subnets across 3 AZs
- NAT Gateway with Elastic IPs
- Internet Gateway and route tables
- VPN Gateway disabled
- Tags and structure ready for expansion

**EC2 Instance Added Using Module:**
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

**RDS – MySQL Database:**
- [`terraform-aws-modules/rds/aws`](https://github.com/terraform-aws-modules/terraform-aws-rds)

Configuration:
- MySQL 5.7 DB instance
- Hosted in a private subnet (for security)
- Master user: `rdadmin`
- Password: managed via `terraform.tfvars` (NOT committed)
- Public accessibility: disabled
- Connection tested and verified via EC2

## Files Overview

| File | Purpose |
|------|---------|
| `main.tf` | Core infrastructure config (VPC + NAT Gateway configuration) |
| `variables.tf` | Input variables for modules |
| `outputs.tf` | Output values like public subnet IDs and EC2 public IP |
| `ec2.tf` | EC2 instance deployment module |
| `rds.tf` | RDS instance config |
| `security.tf` | Security group rules (SSH & DB access) |
| `terraform.tfvars` | Overrides for the input variables (ignored in Git) |
| `.gitignore` | Ignores `.terraform/` and other local files - Keeps state, secrets, and cache files out of Git |

## Next Steps

Planned module additions:
- [Application Load Balancer](https://github.com/terraform-aws-modules/terraform-aws-alb)
- Goal: Load balance across a future Auto Scaling Group or containerized workload

## Project Purpose

This is part of my AI Cloud Architect career blueprint — showcasing Infrastructure as Code (IaC) skills using Terraform, AWS best practices, and real-world scenarios.

---

### Author

Rakeem Dodd – [GitHub Profile](https://github.com/RakeemDodd)