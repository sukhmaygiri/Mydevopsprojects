const express = require("express");
const cors = require("cors");
const path = require("path");
const app = express();
const PORT = process.env.PORT || 8080;

app.use(cors());

// Quotes array
const quotes = [
  "The best way to predict the future is to invent it. – Alan Kay",
  "Life is 10% what happens to us and 90% how we react to it. – Charles R. Swindoll",
  "Strive not to be a success, but rather to be of value. – Albert Einstein",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. – Winston Churchill",
  "Do what you can, with what you have, where you are. – Theodore Roosevelt",
  "Believe you can and you're halfway there. – Theodore Roosevelt",
  "Don't watch the clock; do what it does. Keep going. – Sam Levenson",
  "Act as if what you do makes a difference. It does. – William James",
  "What we achieve inwardly will change outer reality. – Plutarch",
  "Dream big and dare to fail. – Norman Vaughan"
];

// Serve static files from 'public'
app.use(express.static(path.join(__dirname, "public")));

// API endpoint to get random quote
app.get("/api/quote", (req, res) => {
  const randomIndex = Math.floor(Math.random() * quotes.length);
  res.json({ quote: quotes[randomIndex] });
});

// Fallback to serve index.html for all other routes
app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "index.html"));
});

app.listen(PORT, () => {
  console.log(`Quote API & frontend running on port ${PORT}`);
});

