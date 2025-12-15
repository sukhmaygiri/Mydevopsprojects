# 🚀 Project: Host a Website on AWS EC2 Using Nginx

## 📌 Project Overview

This project demonstrates how to host a website on an **AWS EC2 instance** using **Nginx**. The setup includes creating a custom **VPC**, configuring **public networking**, and deploying a website with a **custom folder structure**. An optional section covers hosting a static website using **Amazon S3**.

---

## 🎯 End Result

* EC2 instance hosting a live website
* Custom folder structure for web deployment
* Public internet access using Nginx
* Optional static website hosting using S3

---

## 🏗 Architecture Overview

```
Internet
   |
Internet Gateway
   |
Public Route Table
   |
Public Subnet
   |
EC2 Instance (Nginx Web Server)
```

---

## 🧱 Step 1: Create a VPC

* Navigate to **VPC → Create VPC**
* Name: `My-Project-VPC`
* CIDR Block: `10.0.0.0/16`

**Result:**
An isolated virtual network for the project.

---

## 🌐 Step 2: Create a Public Subnet

* Navigate to **VPC → Subnets → Create Subnet**
* Name: `Public-Subnet-1`
* CIDR Block: `10.0.1.0/24`
* VPC: `My-Project-VPC`

**Result:**
A public subnet to host the EC2 web server.

---

## 🔗 Step 3: Attach an Internet Gateway (IGW)

* Navigate to **VPC → Internet Gateways → Create Internet Gateway**
* Name: `My-IGW`
* Attach it to `My-Project-VPC`

**Result:**
The VPC is now connected to the internet.

---

## 🛣 Step 4: Create and Associate a Route Table

* Navigate to **VPC → Route Tables → Create Route Table**
* Add route:

  * Destination: `0.0.0.0/0`
  * Target: `My-IGW`
* Associate the route table with `Public-Subnet-1`

**Result:**
Instances in the public subnet can access the internet.

---

## 🔐 Step 5: Create a Security Group

* Navigate to **EC2 → Security Groups → Create Security Group**
* Inbound rules:

  * SSH (22) – for administration
  * HTTP (80) – for website access
* Associate with `My-Project-VPC`

**Result:**
Firewall rules configured for secure access.

---

## 🖥 Step 6: Launch an EC2 Instance

* Navigate to **EC2 → Launch Instance**
* AMI: **Ubuntu Server 22.04 LTS**
* Instance Type: `t2.micro`
* VPC: `My-Project-VPC`
* Subnet: `Public-Subnet-1`
* Security Group: `WebServer-SG`

**Result:**
EC2 instance launched and ready.

---

## 🛠 Step 7: Install and Start Nginx

SSH into the EC2 instance and run:

```bash
sudo apt update
sudo apt install nginx -y
sudo systemctl status nginx
```

**Result:**
Nginx is installed and running.

---

## 🌐 Step 8: Deploy the Website

```bash
cd /var/www/html/
sudo rm index.nginx-debian.html
```

Restart Nginx:

```bash
sudo systemctl restart nginx
```

Access the website using:

```
http://<EC2-Public-IP>
```

**Result:**
Website is live and accessible.

---

## 🛠 Optional: Host a Static Website on Amazon S3

* Create an S3 bucket
* Enable **Static Website Hosting**
* Upload website files
* Configure public access permissions

**Result:**
Static website hosted using Amazon S3.

---

## 📦 Project Summary

* Created a custom VPC and public subnet
* Enabled internet access using an Internet Gateway
* Configured routing and security groups
* Launched an EC2 instance and installed Nginx
* Deployed a website with a custom folder structure
* Optional static hosting using Amazon S3

---

## 🧠 Interview Summary

> “I hosted a website on AWS EC2 using Nginx by designing a custom VPC with a public subnet, configuring internet access via an Internet Gateway and route table, securing the instance using security groups, and deploying the website using a custom folder structure. I also explored static website hosting using Amazon S3 as an alternative.”

---

## ✅ Final Notes

* Beginner-friendly AWS project
* Clear networking fundamentals
* Practical web hosting experience
* Ideal for **learning, demos, and interviews**

---

If you want next, I can:

* Convert this into a **Terraform-based version**
* Add **screenshots checklist** for documentation
* Create a **combined EC2 + S3 comparison section**

Just tell me 👍
