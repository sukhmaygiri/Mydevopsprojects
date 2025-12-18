# 🚀 Project: Serverless Web App with Microservices APIs

## 📌 Project Overview

This project demonstrates how to build a **serverless microservices-based web application** using AWS managed services.
Instead of managing servers, the entire backend is handled by AWS, allowing the application to scale automatically and remain cost-efficient.

The application is composed of multiple independent microservices:

* **Users Service** – Manage users
* **Products Service** – Manage products
* **Orders Service** – Manage orders
* **Frontend UI** – Login page and dashboard hosted on **Amazon S3**

---

## 🎯 What This Project Delivers

* A login page to access the application
* A dashboard to create and view users, products, and orders
* Fully serverless backend using AWS Lambda
* Persistent data storage using Amazon DynamoDB
* REST APIs exposed through Amazon API Gateway

---

## 🏗 Architecture Overview

```
User
  |
Frontend (HTML / JavaScript) – S3
  |
API Gateway (REST APIs)
  |
AWS Lambda (Microservices)
  |
Amazon DynamoDB
```

---

## 🛠 AWS Services Used

* **Amazon S3** – Hosts the static frontend (login & dashboard)
* **Amazon API Gateway** – Exposes REST endpoints
* **AWS Lambda** – Runs microservice logic
* **Amazon DynamoDB** – Stores users, products, and orders
* **IAM Roles & Policies** – Secure access between Lambda and DynamoDB

---

## 🪜 Project Implementation Steps

### 🗄 Step 1: DynamoDB Setup

Create three DynamoDB tables:

* **Users**

  * Partition Key: `userId`
* **Products**

  * Partition Key: `productId`
* **Orders**

  * Partition Key: `orderId`

**Purpose:**
Each microservice stores its data independently, following microservices best practices.

---

### 🧠 Step 2: Create Lambda Functions

Create six AWS Lambda functions using **Python**, one for each operation:

**Users Service**

* `users-post.py` – Create a user
* `users-get.py` – List users

**Products Service**

* `products-post.py` – Create a product
* `products-get.py` – List products

**Orders Service**

* `orders-post.py` – Create an order
* `orders-get.py` – List orders

📂 All Lambda scripts are available in the repository under the **lambdas** directory.

---

### 🌐 Step 3: API Gateway Configuration

* Create a **REST API** using Amazon API Gateway
* Define the following resources and methods:

```
/users     → POST, GET
/products  → POST, GET
/orders    → POST, GET
```

* Integrate each method with its corresponding Lambda function
* Enable **CORS** to allow frontend access
* Deploy the API and note the **Invoke URL**

**Purpose:**
API Gateway acts as the entry point, routing requests to the correct microservice.

---

### 🖥 Step 4: Frontend Setup

The frontend consists of two HTML pages:

* `login.html`

  * Simple login page
  * Stores username in browser local storage
* `dashboard.html`

  * Dashboard to manage users, products, and orders
  * Communicates with backend APIs

Update the `API` variable in `dashboard.html` with your **API Gateway Invoke URL**.

Upload both files to an S3 bucket and enable **Static Website Hosting**.

---

## 🎯 End Result

* Users log in using the web interface
* Dashboard allows creation and listing of users, products, and orders
* Each feature is handled by an independent Lambda microservice
* Data is securely stored in DynamoDB
* Fully serverless architecture with automatic scaling

---

## 📂 Repository Structure

```bash
frontend/
├── login.html
└── dashboard.html

lambdas/
├── users-post.py
├── users-get.py
├── products-post.py
├── products-get.py
├── orders-post.py
└── orders-get.py
```

---

## 🧠 Interview Summary

> “I built a serverless microservices web application on AWS using Lambda, API Gateway, and DynamoDB. Each domain—users, products, and orders—runs as an independent microservice with its own APIs and data model. The frontend is hosted on S3, and the backend is fully serverless, scalable, and requires no infrastructure management.”

---

## ✅ Final Notes

* Microservices-based serverless design
* Clean separation of concerns
* Highly scalable and cost-efficient
* Excellent project for **cloud, serverless, and system design interviews**

Just say 👍
