# 🚀 Project: Connect an Application to a Cloud Database

## 📌 Project Overview

This project focuses on building a **secure 2-tier application architecture** on AWS.
A web application runs on an **EC2 instance** and connects securely to a **managed MySQL database (Amazon RDS)** using private networking.

The project emphasizes **network isolation, secure communication, and AWS best practices**.

---

## 🎯 What This Project Delivers

* A cloud-hosted web application running on EC2
* A managed MySQL database hosted on Amazon RDS
* Secure, private communication between application and database
* Networking configured using VPC, subnets, route tables, and security groups

---

## 🏗 Architecture Overview

```
Internet
   |
Internet Gateway
   |
Public Subnet
   |
EC2 Application Server
   |
Security Group (App-SG)
   |
Security Group (DB-SG)
   |
Private Subnet
   |
Amazon RDS (MySQL)
```

---

## 🪜 Project Implementation Steps

### 🌐 Step 1: Create a VPC

* Name: `App-DB-VPC`
* CIDR Block: `10.0.0.0/16`

**Purpose:**
Provides an isolated network for both the application and the database.

---

### 🧱 Step 2: Create Subnets

Create two subnets within the VPC:

* **Public Subnet**

  * CIDR: `10.0.1.0/24`
  * Used for the EC2 application server

* **Private Subnet**

  * CIDR: `10.0.2.0/24`
  * Used for the RDS database

**Purpose:**
Only the application server is exposed to the internet; the database remains private.

---

### 🔗 Step 3: Internet Gateway and Routing

* Create an **Internet Gateway** and attach it to the VPC
* Create a **Public Route Table**

  * Route: `0.0.0.0/0` → Internet Gateway
  * Associate with the public subnet
* Keep the private subnet with local routing only

**Purpose:**
Allows internet access for EC2 while keeping the database isolated.

---

### 🔐 Step 4: Security Groups

**Application Security Group (App-SG)**

* Allow SSH (22) – source: your IP
* Allow HTTP (80) – source: anywhere

**Database Security Group (DB-SG)**

* Allow MySQL (3306) – source: App-SG only

**Purpose:**
The application can access the database, but the database cannot be accessed directly from the internet.

---

### 🖥 Step 5: Launch EC2 Instance

* AMI: Ubuntu 22.04
* Instance Type: `t2.micro`
* Subnet: Public Subnet
* Auto-assign Public IP: Enabled
* Security Group: App-SG

**Purpose:**
Hosts the web application.

---

### 🗄 Step 6: Create RDS MySQL Database

* Engine: MySQL (Free Tier eligible)
* Instance Type: `db.t3.micro`
* VPC: `App-DB-VPC`
* Subnet Group: Private Subnet
* Public Access: Disabled
* Security Group: DB-SG

**Purpose:**
Provides a managed, secure database accessible only within the VPC.

---

### 🌍 Step 7: Configure Application and Connect to RDS

1. SSH into the EC2 instance:

```bash
ssh -i project-key.pem ubuntu@<EC2-Public-IP>
```

2. Install required packages:

```bash
sudo apt update
sudo apt install apache2 php php-mysql mysql-client -y
```

3. Deploy the application:

```bash
cd /var/www/html/
sudo rm index.html
sudo nano index.php
```

Paste your PHP application code.

---

### 🗄 Step 8: Create Database Schema

1. Connect to RDS from EC2:

```bash
mysql -h <RDS-ENDPOINT> -u admin -p
```

2. Create database and table:

```sql
CREATE DATABASE guestbook;
USE guestbook;

CREATE TABLE entries (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  message TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

### 🧪 Step 9: Verify the Setup

* Open browser:

  ```
  http://<EC2-Public-IP>
  ```
* Submit a message via the web application

Verify in MySQL:

```sql
USE guestbook;
SELECT * FROM entries ORDER BY created_at DESC;
```

**Result:**
Data entered via the web app is successfully stored and retrieved from the database.

---

## 🎯 End Result

* Web application hosted on EC2
* Private MySQL database hosted on RDS
* Secure communication using VPC networking and security groups
* No direct internet access to the database

---

## 🧠 Interview Summary

> “I built a secure 2-tier application on AWS where an EC2-hosted web app connects to a private RDS MySQL database. I designed the VPC, public and private subnets, route tables, and security groups to ensure the database is isolated and only accessible from the application layer.”

---

## ✅ Final Notes

* Strong foundation in AWS networking
* Real-world application + database integration
* Secure-by-design architecture
* Excellent project for **cloud fundamentals and interviews**

Just say 👍
