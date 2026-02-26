# Highly Available Web Infrastructure with Terraform & AWS

A production-ready, highly available web architecture deployed on AWS using Terraform. This project demonstrates the provisioning of an Auto Scaling Group behind an Application Load Balancer, serving a custom Dockerized web application.

## Architecture Overview
The infrastructure is designed for fault tolerance and scalability. It automatically handles traffic distribution and scales EC2 instances based on CPU utilization metrics across multiple Availability Zones.

## 🛠️ Tech Stack
* **Infrastructure as Code (IaC):** Terraform
* **Cloud Provider:** Amazon Web Services (AWS)
* **AWS Services:** VPC, EC2, Application Load Balancer (ALB), Auto Scaling Group (ASG), Route 53, CloudWatch, SNS, Security Groups
* **Containerization:** Docker
* **Web Server:** Nginx / HTML5

## 💡 Key Features
* **High Availability & Load Balancing:** Traffic is routed through an ALB to multiple instances across different Availability Zones.
* **Auto Scaling:** The ASG dynamically adjusts the number of active instances (Min: 1, Max: 3, Desired: 2).
* **Automated Provisioning & Deployment:** EC2 instances are bootstrapped with a Bash script (`user_data`) that automatically installs Docker and pulls a **custom-built Docker image** (`dogancan0/2dd-website:v1`) directly from Docker Hub.
* **Monitoring & Alerting:** CloudWatch monitors CPU utilization and triggers an SNS email alert if it exceeds 80%.
* **Custom DNS:** Integrated with Route 53 for a custom domain (`2dd.space`).
* **Modular Codebase:** Utilizes `variables.tf` and `outputs.tf` for flexible, hardcode-free configuration.

## 📁 Project Structure
```text
.
├── variables.tf      # Configuration variables (Region, Instance Type, Domain)
├── outputs.tf        # Output values (ALB DNS, Route 53 NS records)
├── providers.tf      # AWS provider configuration
├── network.tf        # VPC, Subnets, IGW, and Route Tables
├── security.tf       # Security Groups for ALB and EC2
├── compute.tf        # Launch Template, ASG, and Bootstrap script
├── alb.tf            # Application Load Balancer and Target Group
├── dns.tf            # Route 53 Hosted Zone and A Records
├── cloudwatch.tf     # CPU metrics and SNS email alerts
├── dockerfile        # Docker configuration to build the custom Nginx image
└── index.html        # Custom web application content (HTML5/CSS)