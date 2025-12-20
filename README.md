# End-to-End DevOps CI/CD Pipeline with AWS, Terraform, Jenkins & Kubernetes

## 📌 Project Overview
This project demonstrates a **production-style end-to-end DevOps workflow** where a Python application is automatically built, tested, containerized, and deployed to **AWS Kubernetes (EKS)** using **Jenkins CI/CD** and **Terraform (Infrastructure as Code)**.

The project covers the complete lifecycle — from **infrastructure provisioning** to **continuous deployment** — following real-world DevOps best practices.

---

## 🏗️ Architecture Overview
The system is designed as follows:

GitHub (Source Code)  
→ Jenkins (CI/CD on AWS EC2)  
→ Docker (Containerization)  
→ AWS ECR (Image Registry)  
→ AWS EKS (Kubernetes Deployment)  

Infrastructure is provisioned using **Terraform** with a **remote backend** for safe state management.

---

## 🛠️ Tech Stack
- **Programming Language:** Python (Flask)
- **Testing:** pytest
- **Containerization:** Docker
- **CI/CD:** Jenkins (Pipeline as Code)
- **Cloud Provider:** AWS
- **Infrastructure as Code:** Terraform
- **Container Registry:** AWS ECR
- **Orchestration:** Kubernetes (AWS EKS)
- **State Management:** S3 + DynamoDB

---

## ⚙️ Key Features
- Fully automated CI/CD pipeline using Jenkins
- Infrastructure provisioning using Terraform (IaC)
- Remote Terraform state using S3 with DynamoDB state locking
- Docker image versioning using Git commit SHA
- Secure AWS authentication using IAM roles (no hardcoded secrets)
- Kubernetes rolling updates with zero downtime
- Jenkins hosted on AWS EC2 for production-like setup

---

## 🔄 CI/CD Workflow
1. Developer pushes code to GitHub
2. Jenkins pipeline is triggered automatically
3. Application dependencies are installed
4. Automated tests are executed using pytest
5. Docker image is built and tagged with commit SHA
6. Image is pushed to AWS ECR
7. Kubernetes deployment on AWS EKS is updated
8. Application is accessible publicly via LoadBalancer

---

## 🧱 Infrastructure Details (Terraform)
- VPC with public and private subnets
- NAT Gateway for private subnet internet access
- Amazon EKS cluster
- Managed node groups
- Remote Terraform backend using S3
- State locking using DynamoDB

---

## ☸️ Kubernetes Deployment
- Kubernetes Deployment for application pods
- Kubernetes Service (LoadBalancer) for public access
- Rolling updates for zero-downtime deployments
- Health checks for application stability

---

## 📂 Repository Structure
├── app/ # Python Flask application
├── Dockerfile # Docker image definition
├── Jenkinsfile # CI/CD pipeline definition
├── terraform/ # Infrastructure as Code (IaC)
├── k8s/ # Kubernetes manifests
├── .gitignore
└── README.md


---

## 🎯 What This Project Demonstrates
- Real-world DevOps CI/CD implementation
- Infrastructure automation using Terraform
- Secure cloud access using IAM roles
- Containerized application deployment
- Kubernetes production deployment practices
- End-to-end automation from code commit to production

---

## 🚀 Outcome
Every code change pushed to GitHub is **automatically tested, containerized, and deployed** to AWS EKS without manual intervention, demonstrating a complete DevOps automation pipeline.
