# 🚀 Terraform 3-Tier Infrastructure – Starter Project

This project is the starting point for building a 3-tier infrastructure on AWS using [official Terraform modules](https://github.com/terraform-aws-modules). It's designed to grow into a full environment with VPC, EC2, RDS, and ALB.

## 🔧 Current Status (Phase 1)

✅ **VPC Created Using Module:**
- [terraform-aws-modules/vpc/aws](https://github.com/terraform-aws-modules/terraform-aws-vpc)

Includes:
- Custom CIDR block
- Public & Private subnets across 3 AZs
- NAT Gateway with Elastic IPs
- VPN Gateway disabled (can enable later)
- Tags and structure ready for expansion

## 📁 Files Overview

| File | Purpose |
|------|---------|
| `main.tf` | Core infrastructure config (VPC module setup) |
| `variables.tf` | Input variables |
| `outputs.tf` | Output variables |
| `terraform.tfvars` | Values for variables (not committed) |
| `.gitignore` | Ignores `.terraform/` and other local files |

## 📌 Next Steps

Planned module additions:
- [EC2 Instance](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance)
- [RDS](https://github.com/terraform-aws-modules/terraform-aws-rds)
- [Application Load Balancer](https://github.com/terraform-aws-modules/terraform-aws-alb)

Each will be integrated as new modules into this same project to create a complete 3-tier app-ready architecture.

## 🧠 Notes

This README and the project structure will evolve as more services are added. Currently focused on foundational networking (VPC) setup.

---

### 👨🏽‍💻 Author

Rakeem Dodd – [GitHub Profile](https://github.com/RakeemDodd)