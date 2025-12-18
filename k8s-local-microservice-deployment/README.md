# 🚀 Project: Local Kubernetes Multi-Service Setup

## 📌 Project Overview

This project demonstrates how to deploy a **multi-service application** locally using **Kind (Kubernetes IN Docker)**.
It consists of a **frontend Node.js service** and a **backend Express service**, running in isolated Kubernetes pods, communicating via services.

The project emphasizes **containerization, Kubernetes deployments, and service-to-service communication**.

---

## 🎯 What This Project Delivers

* A **backend service** exposing REST APIs
* A **frontend service** serving HTML and calling backend APIs
* Local Kubernetes cluster using **Kind**
* Networking handled via **Kubernetes services**
* Easy testing and development on your local machine

---

## 🏗 Architecture Overview

```
             ┌───────────────┐
             │  Frontend Pod │
             │  (Node.js)    │
             └───────┬───────┘
                     │ Calls /api/info
                     ▼
             ┌───────────────┐
             │  Backend Pod  │
             │  (Express)    │
             └───────┬───────┘
                     │
               Kubernetes Service
                     │
            NodePort / ClusterIP
                     │
                Localhost:30080
```

---

## 🪜 Project Implementation Steps

### 🌐 Step 1: Install Prerequisites

#### 1️⃣ Install Docker

```bash
sudo dnf install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
newgrp docker
docker --version
```

---

#### 2️⃣ Install kubectl

```bash
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client
```

---

#### 3️⃣ Install Kind

```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind version
```

---

### 🧱 Step 2: Create a Kind Cluster

Use the provided `kind-cluster.yaml`:

```yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30080
    hostPort: 30080
    protocol: TCP
```

Create the cluster with a specific name:

```bash
kind create cluster --name multi-service --config kind-cluster.yaml
```

**Purpose:**
Sets up a local Kubernetes cluster with port `30080` mapped to the frontend service.

---

### 🔗 Step 3: Build & Load Docker Images

#### 1️⃣ Build backend and frontend images:

```bash
# Build backend image
docker build -t backend:1.0 ./backend

# Build frontend image
docker build -t frontend:1.0 ./frontend
```

#### 2️⃣ Load images into the Kind cluster:

```bash
kind load docker-image backend:1.0 --name multi-service
kind load docker-image frontend:1.0 --name multi-service
```

**Purpose:**
Packages the applications and makes them available to the local Kind cluster.

---

### 🖥 Step 4: Deploy Backend Service

```bash
kubectl apply -f k8s/backend.yaml
```

**Backend Deployment:**

* **Replicas:** 2
* **Port:** 5000
* **Service Type:** ClusterIP (internal)

---

### 🗄 Step 5: Deploy Frontend Service

```bash
kubectl apply -f k8s/frontend.yaml
```

**Frontend Deployment:**

* **Replicas:** 2
* **Port:** 3000
* **Service Type:** NodePort (accessible via localhost:30080)

---

### 🌍 Step 6: Verify Services

Check pods:

```bash
kubectl get pods
```

Check services:

```bash
kubectl get svc
```

Expected NodePort for frontend: **30080**.

---

### 🧪 Step 7: Test the Setup

Open a browser:

```
http://localhost:30080
```

* Click the **“Call Backend API”** button
* You should see JSON response from the backend service:

```json
{
  "project": "Kubernetes Multi-Service",
  "cluster": "kind",
  "version": "2.0.0"
}
```

---

## 🎯 End Result

* Multi-service app running **entirely locally** on Kubernetes (Kind)
* Frontend communicates with backend via **Kubernetes service discovery**
* Easy to extend with more services or external databases
* Perfect for **learning Kubernetes basics and service communication**

---

## 🧠 Interview Summary

> “I set up a local Kubernetes cluster using Kind and deployed a multi-service Node.js application. I configured deployments, services, and NodePort to enable frontend-backend communication inside the cluster, demonstrating containerization, orchestration, and service discovery.”

---

## ✅ Final Notes

* Strong foundation in Kubernetes deployments and services
* Local, reproducible environment for development
* Frontend + backend integration using Node.js and Express
* Excellent project for **Kubernetes fundamentals and interviews**
