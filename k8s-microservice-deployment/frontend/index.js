const http = require("http");
const fs = require("fs");
const client = require("http");

const server = http.createServer((req, res) => {

  if (req.url === "/") {
    fs.readFile("index.html", (err, data) => {
      res.writeHead(200, { "Content-Type": "text/html" });
      res.end(data);
    });
    return;
  }

  if (req.url === "/api/info") {
    const backendReq = client.request(
      {
        hostname: "backend-service",
        port: 80,
        path: "/api/info",
        method: "GET"
      },
      backendRes => {
        let body = "";
        backendRes.on("data", chunk => body += chunk);
        backendRes.on("end", () => {
          res.writeHead(200, { "Content-Type": "application/json" });
          res.end(body);
        });
      }
    );

    backendReq.on("error", () => {
      res.writeHead(500);
      res.end("Backend connection failed");
    });

    backendReq.end();
    return;
  }

  res.writeHead(404);
  res.end("Not Found");
});

server.listen(3000, () => {
  console.log("Frontend running on port 3000");
});

