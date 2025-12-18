const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.json({
    service: "backend",
    status: "running"
  });
});

app.get("/api/info", (req, res) => {
  res.json({
    project: "Kubernetes Multi-Service",
    cluster: "kind",
    version: "2.0.0"
  });
});

app.listen(5000, () => {
  console.log("Backend running on port 5000");
});

