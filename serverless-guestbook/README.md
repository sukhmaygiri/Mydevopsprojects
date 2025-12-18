# 🚀 Project: Serverless Guestbook with AWS

## 📌 Project Overview

This project demonstrates how to build a **fully serverless guestbook web application** using AWS managed services.
The application allows users to **submit and view messages** without managing any servers.

AWS handles scaling, availability, and infrastructure, making this solution **cost-effective, scalable, and easy to maintain**.

---

## 🎯 What This Project Delivers

* A live **guestbook web page** for submitting and viewing messages
* A **serverless backend** powered by AWS Lambda
* Secure and scalable data storage using Amazon DynamoDB
* REST APIs exposed using Amazon API Gateway
* Optional frontend hosting using Amazon S3 or EC2

---

## 🏗 Architecture Overview

```
User
  |
Frontend (HTML / JS)
  |
API Gateway (REST API)
  |
AWS Lambda
  |
Amazon DynamoDB
```

---

## 🛠 AWS Services Used

* **Amazon S3 / EC2** – Host the frontend UI
* **Amazon API Gateway** – Expose REST endpoints
* **AWS Lambda** – Execute backend logic (serverless)
* **Amazon DynamoDB** – Store guestbook messages
* **IAM Roles & Policies** – Secure access between services

---

## 🪜 Project Implementation Steps

### 🗄 Step 1: DynamoDB Table Setup

Create a DynamoDB table to store guestbook messages:

* **Table Name:** `guestbook-table`
* **Partition Key:** `id` (String)

**Purpose:**
Stores all guestbook messages in a scalable NoSQL database.

---

### 🧠 Step 2: Create Lambda Functions

Create two AWS Lambda functions using **Python** and attach an IAM role with DynamoDB access.

* `lambda-post.py` – Handles **POST** requests to store new messages
* `lambda-get.py` – Handles **GET** requests to retrieve messages

📂 Both files are available in the `/lambdas` directory.

---

### 🔐 Step 3: Configure Permissions

Ensure the Lambda execution role allows access to DynamoDB.

* Required actions:

  * `dynamodb:PutItem`
  * `dynamodb:Scan`

> Permissions can be granted via a managed policy or a custom IAM policy.

---

### 🌐 Step 4: API Gateway Configuration

* Create an **REST API** using Amazon API Gateway
* Configure the following routes:

  * `POST /messages` → `lambda-post`
  * `GET /messages` → `lambda-get`
* Enable **CORS** for frontend access
* Deploy the API and note the **Invoke URL**

**Purpose:**
API Gateway exposes Lambda functions as RESTful endpoints for the frontend.

---

### 🖥 Step 5: Frontend (index.html)

The frontend UI is provided via a simple **HTML + JavaScript** page.

* Displays existing guestbook messages
* Allows users to submit new messages
* Communicates with API Gateway using fetch requests

📄 File location: `/frontend/index.html`

---

### ☁️ Step 6: Host the Frontend

Choose one of the following hosting options:

* **Amazon S3** – Static website hosting
* **Amazon EC2** – Nginx or Apache
* **Amazon CloudFront + S3** – Global content delivery (optional)

After hosting, open the site in a browser and submit a message to verify functionality.

---

## 🎯 End Result

* Users submit messages via the web UI
* API Gateway routes requests to Lambda
* Lambda stores and retrieves messages from DynamoDB
* Fully serverless backend with automatic scaling
* No server management required

---

## 📂 Repository Structure

```bash
frontend/
└── index.html

lambdas/
├── lambda-post.py
└── lambda-get.py
```

---

## 🧠 Interview Summary

> “I built a fully serverless guestbook application using AWS Lambda, API Gateway, and DynamoDB. The frontend communicates with REST APIs exposed through API Gateway, Lambda handles the business logic, and DynamoDB stores the data. The entire backend is serverless, scalable, and requires no infrastructure management.”

---

## ✅ Final Notes

* 100% serverless architecture
* Cost-efficient and highly scalable
* Clean separation of frontend and backend
* Ideal for **cloud fundamentals, serverless learning, and interviews**

Just say 👍
