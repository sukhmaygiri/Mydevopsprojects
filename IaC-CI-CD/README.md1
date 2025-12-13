# 🚀 Project: Build Infrastructure as Code (IaC) & Deploy via CI/CD on AWS

## 🎯 Introduction

This project demonstrates a **complete DevOps workflow** using **Terraform, Docker, AWS, and GitHub Actions**.
A Node.js application is containerized, infrastructure is provisioned using IaC, and deployment is fully automated via a CI/CD pipeline.

Every push to the `main` branch:

* Provisions AWS infrastructure using Terraform
* Builds & pushes a Docker image to Amazon ECR
* Deploys the application to an EC2 instance automatically

---

## 🌍 End Result

✅ Fully automated infrastructure on AWS
✅ Dockerized Node.js application
✅ CI/CD pipeline using GitHub Actions
✅ EC2 pulls image securely from ECR
✅ Application accessible via EC2 public IP on port **8080**

---

## 📁 Project Structure

```bash
.
├── Dockerfile
├── README.md
├── app
│   ├── package.json
│   ├── public
│   │   └── index.html
│   └── server.js
├── deploy.sh
├── terraform
│   ├── backend.tf
│   ├── ec2.tf
│   ├── ecr.tf
│   ├── iam.tf
│   ├── main.tf
│   ├── output.tf
│   ├── rds.tf
│   └── security.tf
└── .github
    └── workflows
        └── main.yaml
```

---

## 🧠 Application Overview

### 🖥 Frontend

* Simple **HTML/CSS/JS** UI
* Displays random motivational quotes
* Calls backend API endpoint `/api/quote`

### ⚙ Backend

* Node.js + Express server
* Serves static frontend files
* Provides random quote API

---

## 🐳 Step 1 – Dockerize the Application

### 📄 Dockerfile

```dockerfile
FROM node:20-alpine

WORKDIR /usr/src/app

COPY app/package*.json ./
RUN npm install --production

COPY app/ .

EXPOSE 8080
CMD ["node", "server.js"]
```

### 🔍 What this does:

* Uses lightweight Node.js image
* Installs production dependencies
* Runs the server on port `8080`

---

## ☁️ Step 2 – Infrastructure as Code (Terraform)

Terraform provisions all AWS resources automatically.

### 🔧 Resources Created

* EC2 instance (Amazon Linux 2)
* Amazon ECR repository
* IAM Role & Instance Profile
* Security Groups
* RDS MySQL database
* S3 backend for Terraform state
* DynamoDB for state locking

---

### 🏛 Terraform Backend (Remote State)

```hcl
backend "s3" {
  bucket         = "your-new-bucket-eryqwerqyw"
  key            = "project/terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = "terraform-locks"
  encrypt        = true
}
```

✅ Ensures safe, shared, and locked Terraform state

---

### 🖥 EC2 Configuration

* Instance Type: `t2.micro`
* Docker installed via `user_data`
* AWS CLI installed
* IAM role attached for ECR pull access

---

### 🔐 Security Groups

**Web Server**

* Port `8080` – Application access
* Port `22` – SSH access

**Database**

* Port `3306` – MySQL (only from EC2)

---

## 🗄 Amazon RDS (MySQL)

* Engine: MySQL 8.0
* Instance: `db.t4g.micro`
* Accessible only from EC2 security group

⚠️ *For learning/demo purposes only (credentials are hardcoded)*

---

## 🔁 Step 3 – CI/CD with GitHub Actions

### 📄 Workflow File

`.github/workflows/main.yaml`

### 🔄 Pipeline Stages

#### 1️⃣ Terraform Apply

* Initializes Terraform
* Provisions AWS infrastructure

#### 2️⃣ Docker Build & Push

* Builds Docker image
* Pushes image to Amazon ECR

#### 3️⃣ Deploy to EC2

* SSH into EC2
* Pulls latest image
* Runs container

---

## 🚀 Step 4 – Deployment Script (EC2)

### 📄 deploy.sh

```bash
docker pull $IMAGE_URI
docker stop app || true
docker rm app || true
docker run -d --name app -p 8080:8080 $IMAGE_URI
```

✔ Stops old container
✔ Runs new version automatically

---

## 🔑 Required GitHub Secrets

Add the following secrets in your GitHub repository:

| Secret Name           | Description               |
| --------------------- | ------------------------- |
| AWS_ACCESS_KEY_ID     | AWS access key            |
| AWS_SECRET_ACCESS_KEY | AWS secret key            |
| EC2_SSH_KEY           | Private SSH key           |
| EC2_USER              | EC2 username (`ec2-user`) |

---

## 🌐 How to Access the App

After successful pipeline run:

```text
http://<EC2_PUBLIC_IP>:8080
```

You should see the **Random Quote Generator UI** 🎉

---

## 📤 Terraform Outputs

* EC2 Public IP
* RDS Endpoint
* ECR Repository URL

---

## ✅ Summary

✔ Built a Node.js application
✔ Dockerized the app
✔ Created AWS infrastructure using Terraform
✔ Implemented CI/CD with GitHub Actions
✔ Deployed automatically to EC2 using ECR

---

## 🧑‍🎓 Learning Outcomes

* Infrastructure as Code (Terraform)
* CI/CD pipelines
* Docker & container deployment
* AWS IAM, EC2, ECR, RDS
* Real-world DevOps automation

---

🔥 **This project is ideal for DevOps beginners to intermediate learners** and closely mirrors real production workflows.

If you want:

* Diagram (architecture flow)
* Resume-ready project description
* Interview questions based on this project

Just tell me 👍

