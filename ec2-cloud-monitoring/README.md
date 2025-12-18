# 🚀 Project: Centralized Monitoring for Two EC2 Instances using AWS CloudWatch

## 📌 Project Overview

This project demonstrates how to implement **centralized monitoring and alerting** for **two EC2 instances** on AWS using:

* **CloudWatch Agent** for metrics and logs
* **IAM Roles** for secure access
* **CloudWatch Dashboards** for visualization
* **CloudWatch Alarms** for threshold monitoring
* **SNS** for real-time notifications

The solution monitors **CPU, memory, disk, load**, and **Apache logs**, and sends alerts when predefined thresholds are exceeded.

---

## 🏗 Architecture

```
                   ┌─────────────────────┐
                   │   SNS Topic          │
                   │ (Email Alerts)       │
                   └─────────▲───────────┘
                             │
                   CloudWatch Alarms
                             │
        ┌────────────────────┴────────────────────┐
        │              CloudWatch                  │
        │  Metrics • Logs • Dashboards              │
        └─────────▲──────────────────────▲─────────┘
                  │                      │
        ┌─────────┴─────────┐  ┌─────────┴─────────┐
        │ EC2 Web Server     │  │ EC2 App Server     │
        │ Apache + Logs      │  │ Metrics Only       │
        │ CloudWatch Agent   │  │ CloudWatch Agent   │
        └─────────▲─────────┘  └─────────▲─────────┘
                  │                      │
            IAM Role: CloudWatchAgentRole
```

---

## 🧰 Prerequisites

* AWS Account
* Basic knowledge of EC2 & IAM
* SSH client
* Email access (for SNS alerts)

---

## 📁 Project Components

```bash
aws-monitoring-project/
├── ec2-instances/
│   ├── Web-Server-01
│   └── App-Server-01
├── iam/
│   └── CloudWatchAgentRole
├── cloudwatch/
│   ├── metrics
│   ├── logs
│   ├── dashboards
│   └── alarms
└── sns/
    └── ec2-monitoring-alerts
```

---

## 🖥 EC2 Configuration

| Instance Name | Purpose                    |
| ------------- | -------------------------- |
| Web-Server-01 | Apache Web Server + Logs   |
| App-Server-01 | Application / Load Testing |

**Common Settings**

* AMI: Amazon Linux 2
* Instance Type: t2.micro
* Same VPC & Subnet
* SSH access from personal IP

---

## 🔐 IAM Configuration

### IAM Role

* **Name:** `CloudWatchAgentRole`
* **Trusted Entity:** EC2

### Permissions

```text
CloudWatchAgentServerPolicy
```

✔ One IAM role reused across both EC2 instances
✔ No access keys stored on servers
✔ Follows least-privilege principle

---

## 📦 Software Installation

Run on **both EC2 instances**:

```bash
sudo yum update -y
sudo yum install -y amazon-cloudwatch-agent stress
```

### Web Server Only

```bash
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
```

---

## 📊 CloudWatch Agent Configuration

Configuration file location:

```
/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
```

### Metrics Collected

* CPU usage
* Memory utilization
* Disk usage
* Load average

### Logs Collected (Web Server)

* Apache access logs
* Apache error logs

> ℹ On the App Server, Apache logs are ignored safely if files don’t exist.

---

## ▶ Start CloudWatch Agent

Run on **both servers**:

```bash
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
-a fetch-config \
-m ec2 \
-c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json \
-s
```

Enable service on boot:

```bash
sudo systemctl enable amazon-cloudwatch-agent
```

---

## 📈 CloudWatch Dashboard

### Dashboard Name

```
EC2-Multi-Server-Monitoring
```

### Widgets Include

* CPU usage per instance
* Memory utilization per instance
* Disk usage per instance
* Load average comparison
* Apache access & error logs

✔ Single dashboard monitoring multiple EC2 instances
✔ Easy comparison of server health

---

## 🚨 Alerting with CloudWatch Alarms

### SNS Topic

* **Name:** `ec2-monitoring-alerts`
* **Protocol:** Email
* **Purpose:** Alert notifications

---

### Alarms Configured

| Alarm Name        | Instance      | Metric    |
| ----------------- | ------------- | --------- |
| WebServer-HighCPU | Web-Server-01 | CPU > 80% |
| AppServer-HighCPU | App-Server-01 | CPU > 80% |

**Optional Alarm**

```
Memory Usage > 75%
```

✔ Each alarm clearly identifies the affected server
✔ Alerts delivered via SNS email

---

## 🧪 Testing & Validation

### CPU Stress Test (Web Server)

```bash
stress --cpu 2 --timeout 300
```

### Memory Stress Test (App Server)

```bash
stress --vm 1 --vm-bytes 500M
```

### Expected Results

* CloudWatch alarm triggered
* SNS email notification received
* Dashboard reflects high resource usage

---

## 🔐 Security Best Practices

* IAM role-based authentication
* No hardcoded credentials
* Centralized logging & monitoring
* Reusable configuration
* Easily scalable to more EC2 instances

---

## 🧠 Interview / Viva Summary

> “This project implements centralized monitoring for two EC2 instances using AWS CloudWatch. Metrics and logs are collected via the CloudWatch Agent, access is secured using IAM roles, dashboards provide real-time visibility, and SNS alerts notify us when resource thresholds are breached.”

---

## ✅ Final Notes

* Industry-standard monitoring setup
* Clean and scalable design
* Ideal for **DevOps labs, cloud projects, and interviews**
* Demonstrates strong understanding of AWS observability tools
