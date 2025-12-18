# 🚀 Project: EC2 Web Server with Secure RDS (Terraform)

## 📌 Project Overview

This project demonstrates how to provision a **secure 2-tier AWS architecture** using **Terraform**, where:

* An **EC2 web server** runs in a **public subnet**
* A **MySQL RDS database** runs in **private subnets**
* Infrastructure is managed using **Terraform (IaC)**
* Terraform state is stored **remotely in S3 with DynamoDB locking**
* High availability is achieved using **multiple Availability Zones**

---

## 🏗 Architecture

```
                    Internet
                        |
                Internet Gateway
                        |
              Public Route Table
                  /           \
        Public Subnet (AZ-1)   Public Subnet (AZ-2)
               |
           EC2 Web Server
               |
        Web Security Group
               |
        DB Security Group (3306)
               |
      Private Subnet (AZ-1)   Private Subnet (AZ-2)
                   \         /
                    RDS MySQL
```

---

## 🧰 Prerequisites

* AWS CLI configured locally
* Terraform v1.3 or later
* An EC2 key pair (for SSH access)

Verify installations:

```bash
terraform version
aws --version
```

---

## 📁 Project Structure

```bash
terraform/
├── backend.tf
├── provider.tf
├── vpc.tf
├── security_groups.tf
├── ec2.tf
├── rds.tf
├── outputs.tf
└── .gitignore
```

---

## 🔐 Terraform Remote State

Terraform state is managed remotely to ensure:

* Consistent infrastructure deployments
* State locking to prevent concurrent changes
* Compatibility with CI/CD pipelines

### Backend Components

* **S3** – stores Terraform state (encrypted & versioned)
* **DynamoDB** – manages state locking

---

## 🧱 One-Time Backend Setup

### Create S3 Bucket

```bash
aws s3api create-bucket \
  --bucket my-terraform-state-12345 \
  --region us-east-1
```

Enable versioning:

```bash
aws s3api put-bucket-versioning \
  --bucket my-terraform-state-12345 \
  --versioning-configuration Status=Enabled
```

---

### Create DynamoDB Table

```bash
aws dynamodb create-table \
  --table-name terraform-locks \
  --billing-mode PAY_PER_REQUEST \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH
```

---

## ⚙️ Backend Configuration (`backend.tf`)

```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-12345"
    key            = "ec2-rds/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

---

## 🌐 Networking Design

* **VPC CIDR**: `10.1.0.0/16`
* **Public Subnets**: `10.1.1.0/24`, `10.1.2.0/24`
* **Private Subnets**: `10.1.3.0/24`, `10.1.4.0/24`
* Subnets distributed across **two Availability Zones**
* Internet Gateway attached to the VPC
* Public route table routes internet traffic to the IGW

---

## 🔒 Security Configuration

### Web Security Group

* SSH (22)
* HTTP (80)

### Database Security Group

* MySQL (3306)
* Access allowed **only from the web security group**

---

## 🗄 Database Configuration

* Engine: MySQL 8.0
* Deployed in private subnets
* DB subnet group spans two Availability Zones
* Single-AZ instance (Multi-AZ supported)

---

## 🚀 Deployment Steps

```bash
terraform init
terraform plan
terraform apply
```

---

## 📤 Outputs

After deployment, Terraform outputs:

* **EC2 Public IP** – Access the web server
* **RDS Endpoint** – Database connection endpoint

---

## 🧹 Cleanup

To destroy all resources:

```bash
terraform destroy
```

---

## 🔐 Git Ignore

```gitignore
.terraform/
*.tfstate
*.tfstate.backup
```

---

## 🧠 Interview Summary

> “This project uses Terraform to deploy a secure 2-tier AWS architecture with EC2 and RDS. The web tier runs in public subnets, the database tier runs in private subnets across multiple Availability Zones, security groups restrict access, and Terraform state is managed remotely using S3 and DynamoDB.”

---

## ✅ Final Notes

* Clean and modular Terraform configuration
* Remote state with locking
* Fully reproducible infrastructure
* Suitable for **minor projects, demos, and interviews**
