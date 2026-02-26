# 🚀 Highly Available Web Infrastructure with Terraform & AWS

A production-ready, highly available web architecture deployed on AWS using Terraform. This project demonstrates the provisioning of an Auto Scaling Group behind an Application Load Balancer, serving a custom Dockerized web application.

---

## 🏗️ Architecture Overview
The infrastructure is designed for **fault tolerance** and **scalability**. It automatically handles traffic distribution and scales EC2 instances based on CPU utilization metrics across multiple Availability Zones.

## 🛠️ Tech Stack
* **IaC:** Terraform
* **Cloud:** Amazon Web Services (AWS)
* **Services:** VPC, EC2, ALB, ASG, Route 53, CloudWatch, SNS
* **DevOps Tools:** Docker, Bash Scripting
* **Web:** Nginx / HTML5 / CSS3

## 💡 Key Features
* **High Availability:** Traffic is routed through an ALB to multiple instances across different AZs.
* **Auto Scaling:** Dynamic adjustment of instances (Min: 1, Max: 3, Desired: 2).
* **Automated Deployment:** EC2 instances are bootstrapped with a Bash script to install Docker and pull my **custom-built image** (`dogancan0/2dd-website:v1`).
* **Monitoring:** CloudWatch triggers SNS email alerts if CPU exceeds 80%.
* **Modular Code:** Fully driven by `variables.tf` and `outputs.tf`.

## 📁 Project Structure
```text
.
├── variables.tf      # Configuration variables
├── outputs.tf        # Output values
├── providers.tf      # AWS provider setup
├── network.tf        # VPC & Subnetting
├── security.tf       # SG Rules
├── compute.tf        # ASG & Launch Template
├── alb.tf            # Load Balancer
├── dns.tf            # Route 53 setup
├── cloudwatch.tf     # Metrics & Alarms
├── dockerfile        # Custom image config
└── index.html        # Web app content

## 📸 Visual Evidence
1. Live Deployment & Custom Domain
2. Infrastructure Health (Target Group)
3. Monitoring (CloudWatch Alarm)

## ⚙️ How to Run
    Clone the repo:
    Bash

    git clone [https://github.com/Dogancan-Acar/terraform-aws-ha-web-architecture.git](https://github.com/Dogancan-Acar/terraform-aws-ha-web-architecture.git)

    Setup Variables: Update variables.tf with your email and domain.

    Initialize: ```bash
    terraform init

    Deploy: ```bash
    terraform apply --auto-approve

    Cleanup: ```bash
    terraform destroy --auto-approve
