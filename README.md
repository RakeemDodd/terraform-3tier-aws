# 🏗️ Terraform 3-Tier Infrastructure Project

This project showcases a modular, production-ready 3-tier infrastructure on **AWS** using official Terraform modules. It includes **VPC**, **EC2**, **RDS**, and **ALB** components, following best practices for scalability, security, and maintainability.

---

## 🔹 VPC (Virtual Private Cloud)

**Module Used:** [`terraform-aws-modules/vpc/aws`](https://github.com/terraform-aws-modules/terraform-aws-vpc)

Includes:

- Custom CIDR block (`10.0.0.0/16`)
- Public & private subnets across 3 Availability Zones
- Internet Gateway & NAT Gateways (1 per AZ)
- Elastic IPs for NAT
- Route tables per subnet
- VPN Gateway disabled
- Modular structure and tagging

---

## 🔹 EC2 Instance

**Module Used:** [`terraform-aws-modules/ec2-instance/aws`](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance)

Features:

- Amazon Linux 2 in a public subnet
- Public IP auto-assigned
- SSH access enabled (via `.pem` key – not committed)
- Custom EC2 security group
- Verified connectivity to RDS

---

## 🔹 RDS – MySQL Database

**Module Used:** [`terraform-aws-modules/rds/aws`](https://github.com/terraform-aws-modules/terraform-aws-rds)

Config:

- MySQL 5.7 deployed in private subnets
- Public access: **Disabled**
- Master username stored via variables
- Password stored securely in `terraform.tfvars` (not committed)
- Verified EC2-to-RDS connectivity on port 3306

---

## 🔹 Application Load Balancer (ALB)

**Module Used:** [`terraform-aws-modules/alb/aws`](https://github.com/terraform-aws-modules/terraform-aws-alb)

Details:

- ALB spans public subnets
- Listens on port 80 (HTTP)
- Targets EC2 instance via target group
- Ingress: HTTP (0.0.0.0/0), Egress: all traffic
- DNS output provided via Terraform

---

## 📦 Terraform Outputs (Example)

| Output             | Value                                |
|--------------------|--------------------------------------|
| `vpc_id`           | `vpc-xxxxxxxxxxxxxxxxx`              |
| `public_subnets`   | `["subnet-xxxx", "subnet-xxxx"]`     |
| `private_subnets`  | `["subnet-yyyy", "subnet-yyyy"]`     |
| `ec2_public_ip`    | `<your-ec2-ip>`                      |
| `rds_endpoint`     | `your-db-endpoint.amazonaws.com:3306`|
| `alb_dns_name`     | `your-alb-dns.amazonaws.com`         |

---

## 🗂️ Project File Structure

| File             | Description                                      |
|------------------|--------------------------------------------------|
| `main.tf`        | VPC & networking setup                           |
| `alb.tf`         | ALB definition and listener rules                |
| `ec2.tf`         | EC2 instance deployment                          |
| `rds.tf`         | RDS MySQL configuration                          |
| `security.tf`    | Security groups for all services                 |
| `outputs.tf`     | Terraform outputs                                |
| `variables.tf`   | Input variables                                  |
| `terraform.tfvars` | Sensitive values (excluded from Git)          |
| `provider.tf`    | Provider setup and region                        |
| `.gitignore`     | Excludes sensitive and generated files           |

---

## ✅ Project Status

- ✅ Infrastructure deployed successfully via Terraform
- ✅ Modular, reusable, production-ready
- ✅ EC2 ↔ RDS connection verified
- ✅ ALB tested with DNS
- ⚙️ Ready for ASG, HTTPS, and CloudWatch expansion

---

## 🔒 Security Notes

> **Important:** This project does **not** include:
> - `.pem` private keys  
> - `terraform.tfvars`  
> - `.terraform/` state or backend files  
> - Any committed secrets

Use `.gitignore` and secure secrets properly when deploying in real environments.

---

## 🔄 Terraform Lifecycle

> **Important:** This project supports full lifecycle automation for infrastructure provisioning and teardown using Terraform.

- terraform apply to deploy
- terraform destroy to tear down

Goal:

	•	Terminate EC2 instances
	•	Delete ALB, listeners, target groups
	•	Destroy RDS database and subnet group
	•	Release Elastic IPs and NAT gateways
	•	Delete subnets, route tables, and the VPC
	•	Tear down all associated security groups and IAM roles
    •	Able to automate infrastructure creation and deletion

Note:

- Created output.txt containing my entire destroy log — useful for documentation and debugging.
- Disable Deletion Protection (if enabled)


Screenshots & Documentation:
- 📷 Screenshots of AWS resources in the console (VPC, EC2, RDS, ALB)
- 📷 Billing page to confirm no charges remain (especially RDS and NAT Gateway)
- 📄 output.txt logs saved to GitHub or local for reference
- ✅ Use these for documentation, proof of teardown, or portfolio evidence

---

## 🔄 Next Steps

- [ ] Add Auto Scaling Group (ASG) for EC2
- [ ] Enable HTTPS via ACM + ALB listeners
- [ ] Add CloudWatch monitoring/logging
- [ ] Prepare for ECS/EKS integration (future)

---

## 📌 Project Purpose

This is part of my **AI Cloud Architect career blueprint**. It demonstrates hands-on experience with:

- Infrastructure as Code (IaC) using Terraform
- Secure and scalable AWS deployments
- Real-world, job-ready cloud architecture
- Best practices with reusable official modules

---

## 👤 Author

**Rakeem Dodd**  
🔗 [GitHub Profile](https://github.com/rakeemdodd)