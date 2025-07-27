# 🚀 Terraform 3-Tier Infrastructure – Starter Project

This project is the starting point for building a 3-tier infrastructure on AWS using [official Terraform modules](https://github.com/terraform-aws-modules). It's designed to grow into a full environment with VPC, EC2, RDS, and ALB.

---

## 🔧 Current Status (Phase 1 – VPC + EC2)

✅ **VPC Created Using Module:**
- [terraform-aws-modules/vpc/aws](https://github.com/terraform-aws-modules/terraform-aws-vpc)

Includes:
- Custom CIDR block
- Public & Private subnets across 3 AZs
- NAT Gateway with Elastic IPs
- Internet Gateway and route tables
- VPN Gateway disabled
- Tags and structure ready for expansion

✅ **EC2 Instance Added Using Module:**
- [terraform-aws-modules/ec2-instance/aws](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance)

Details:
- Amazon Linux 2 instance in public subnet
- SSH access via key pair (`rakeem-3tier-key`)
- Public IP auto-assigned
- Security group rule created to allow SSH (port 22) from your IP

---

## 🖥️ SSH Access Guide

To SSH into the instance:
```bash
chmod 400 rakeem-3tier-key.pem
ssh -i rakeem-3tier-key.pem ec2-user@<public-ip-address>
🔐 You must replace <public-ip-address> with the actual IP from the Terraform output.

📁 Files Overview
File	Purpose
main.tf	VPC + NAT Gateway configuration
ec2.tf	EC2 instance deployment module
security.tf	SSH rule attached to the VPC's default security group
variables.tf	Input variables for modules
terraform.tfvars	Overrides for the input variables (ignored in Git)
outputs.tf	Output values like public subnet IDs and EC2 public IP
.gitignore	Ignores .terraform/, .pem, and other local files

📌 Planned Next Steps
Planned module additions:

RDS Module

ALB Module

These will be integrated to complete the 3-tier architecture:

VPC – Done ✅

EC2 App Tier – Done ✅

RDS DB Tier – Coming Soon ⏳

ALB Load Balancer – Coming Soon ⏳

🧠 Notes
Terraform modules used are versioned for stability.

Security is configured to allow only your IP for SSH (can be adjusted).

EC2 is in a public subnet with NAT Gateways in place for private subnet scaling later.

.pem file is never committed to Git for security reasons.

👨🏽‍💻 Author
Rakeem Dodd – GitHub Profile
AWS Certified | Terraform & DevOps in Progress
www.rakeemdodd.com